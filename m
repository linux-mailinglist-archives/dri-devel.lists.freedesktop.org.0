Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DE7FF697
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600D10E738;
	Thu, 30 Nov 2023 16:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EFF10E736
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0nUzX4gsVmUg41H9Ed/+mVKvCLFiFk+LgC3jIn6sBY4=; b=OzYVeTZwDixIgJiG7CalX7gJEd
 fH0A0lcv6tFm2f1Vo8C3QgA8GzTqpDzy0SljY7hcYJsx99ZPsok/96YOS4zY8Xk4OTQ9YGXnI5RnZ
 Tm9b3AEHUdIn9nZGEvrNIIKResVZzOtvdqE6nhkaJquNgnmql69FK7XGaL7s7g85WGuMl0OWt6ylt
 hmTK84tzAq5yw3hRdbPwQJu2GlOMg1AIFxcrvRJqF1lTQwnGwCWqQnKmaAmfuT9D/7YpMORjySChU
 dQL3BOq/4+7Lh322HpcQjk6sdTtyK4GpUNqxdJgU7heyUFCnBEFChH8IpP05+xaVGhcAU/Y2roKD4
 jMWOfw8g==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAA-008scY-JB; Thu, 30 Nov 2023 17:45:19 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 05/17] drm/v3d: Don't allow two multisync extensions in the
 same job
Date: Thu, 30 Nov 2023 13:40:28 -0300
Message-ID: <20231130164420.932823-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, two multisync extensions can be added to the same job and
only the last multisync extension will be used. To avoid this
vulnerability, don't allow two multisync extensions in the same job.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
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

