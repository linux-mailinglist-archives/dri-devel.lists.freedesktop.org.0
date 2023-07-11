Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517E74F9CE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 23:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5C210E036;
	Tue, 11 Jul 2023 21:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FA210E036;
 Tue, 11 Jul 2023 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ddrjm27aI2mzONVUTJ28Yp+tdR9+PE1LPwDohpg9Dzo=; b=pTL/XLcfjoADLmvXjercNTTKr1
 f1hgqEGH9Jk6v+MtlrnR8mnSSM7DK3Z6BzYZNGmq80ZLBxGaYKNVChiD5sIOO8enRyAtXEBX5r9Td
 KmT3AEEudOVjBR/roOGGSf4EVN5SYcAELVWHxFNUyvrTML5H0g85t/UBkkCtvSaR9UKCj61X7ciBX
 3Bg+NIrva9TfY0d2M7dOWjFk/wuPKzJ4Zhq9Ft3d/QNm8c/gBBoRQ829jgR7MKxqPeKNmoI/2ta7t
 OFGjohehJYr6tx/pfpBG0aEzSiKTs9jorXaqMeZ/QOUQEFkndPXG+N0a6IdtbXuZKN5QrrGLy/gLj
 /zTQaLLA==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qJL1O-00Cl0M-7n; Tue, 11 Jul 2023 23:35:46 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/amdgpu: Mark contexts guilty for causing soft
 recoveries
Date: Tue, 11 Jul 2023 18:34:57 -0300
Message-ID: <20230711213501.526237-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711213501.526237-1-andrealmeid@igalia.com>
References: <20230711213501.526237-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a DRM fence is set to -ENODATA, that means that this context was a
cause of a soft reset, but is never marked as guilty. Flag it as guilty
and log to user that this context won't accept more submissions.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 0dc9c655c4fb..fe8e47d063da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -459,6 +459,12 @@ int amdgpu_ctx_get_entity(struct amdgpu_ctx *ctx, u32 hw_ip, u32 instance,
 	ctx_entity = &ctx->entities[hw_ip][ring]->entity;
 	r = drm_sched_entity_error(ctx_entity);
 	if (r) {
+		if (r == -ENODATA) {
+			DRM_ERROR("%s (%d) context caused a reset,"
+				  "marking it guilty and refusing new submissions.\n",
+				  current->comm, current->pid);
+			atomic_set(&ctx->guilty, 1);
+		}
 		DRM_DEBUG("error entity %p\n", ctx_entity);
 		return r;
 	}
-- 
2.41.0

