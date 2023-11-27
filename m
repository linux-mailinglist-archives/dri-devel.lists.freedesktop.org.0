Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BD7FA969
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F7410E3DE;
	Mon, 27 Nov 2023 19:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C32810E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 18:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5nE2qoJ48amFKeCsCsNOMQlSLEl2ujMYQdEfeaaj0Ck=; b=gyTR6V60pMp6Iyn/DvGksdt+8c
 WSErNxNhCM0DP8Uy8j/vl78Rt+l+pJQZEBaq3D22R+DQijEaMbaIX4VdqRi4abYa5iRhHk5mfvNgm
 mHPM9SW4hZMoGn7b9X4Gy4bb+12WHZ2RFg3eZPToD1Ndo2ghBaBHrbfmDa530dwDsBF+xfdWv290L
 lFEJWKC23q1Q3/3YPbUshHNefE7vccgJGwwgS4bur5oEATJhrZCkHhdZ1AUkoXbG5783e4hgG+lej
 A9VNIccmzK6NkpwjkC6fcTZO5FoPOtFI7Q8EdSP0XqQMS1RECV8G5406PcWFXPcXwPiKoeQvKJpjR
 YN9zCd9g==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gpf-007jiM-OY; Mon, 27 Nov 2023 19:59:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 05/17] drm/v3d: Don't allow two multisync extensions in the
 same job
Date: Mon, 27 Nov 2023 15:48:23 -0300
Message-ID: <20231127185723.10348-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, two multisync extensions can be added to the same job and
only the last multisync extension will be used. To avoid this
vulnerability, don't allow two multisync extensions in the same job.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index a0caf9c499bb..10141dc2820a 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -329,6 +329,11 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	struct v3d_submit_ext *se = data;
 	int ret;
 
+	if (se->in_sync_count || se->out_sync_count) {
+		DRM_DEBUG("Two multisync extensions were added to the same job.");
+		return -EINVAL;
+	}
+
 	if (copy_from_user(&multisync, ext, sizeof(multisync)))
 		return -EFAULT;
 
-- 
2.42.0

