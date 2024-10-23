Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3349ACBB1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 15:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87E10E7E6;
	Wed, 23 Oct 2024 13:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VEb5UO5D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7BD10E7E0;
 Wed, 23 Oct 2024 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GH2Pjp8Fh5SVIH1VeSvsYsu2EDyCbTsdpiFgGsaHspE=; b=VEb5UO5DkOZlRPbcfP3kTp+bsF
 sJUsbQUfCv4s7dHMN1Y/FoMKSbgFjhZuTwhqEgrzXcy0OSPw2OtjndXqQvifFrc5Yls8NqXdjE9v4
 KlsOQSrBzG3r3b7h5QeIoKAVL6If66FtOc5BRJkinZsXHGQHgHu+L0//2zcqouu1VNO0LBezVF2WU
 TWuf4jbtjj/jJ0ck9gQ4CSkx7GOlaCJB26+nUhPIUBrxlmlBaUK531bYHyucy3q/itG0tqGaVs1Hq
 N45a1nztZHBa8DHQeFjIphq1CNUxa9jH9xj69SmdI47ODxhes6MEeVUTeS56HlbTXXLtNhiITrrWN
 MpsHNw9g==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t3bnk-00E3WB-TC; Wed, 23 Oct 2024 15:53:29 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: add missing tracepoint event in DM
 atomic_commit_tail
Date: Wed, 23 Oct 2024 10:53:17 -0300
Message-ID: <20241023135321.259494-1-mwen@igalia.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are two events to trace the beginning and the end of
amdgpu_dm_atomic_commit_tail, but only the one ate the beginning was
placed. Place amdgpu_dm_atomic_commit_tail_finish tracepoint at the end
than.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 98f0b142f497..bbfc47f6595f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10088,6 +10088,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	for (i = 0; i < crtc_disable_count; i++)
 		pm_runtime_put_autosuspend(dev->dev);
 	pm_runtime_mark_last_busy(dev->dev);
+
+	trace_amdgpu_dm_atomic_commit_tail_finish(state);
 }
 
 static int dm_force_atomic_commit(struct drm_connector *connector)
-- 
2.45.2

