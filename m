Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93D7F6A21
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B6310E79A;
	Fri, 24 Nov 2023 01:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC9710E787
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U7Dux9m3cQgUzf7xOIi+zFnYD3mscZu+eE6YEuU5SB4=; b=H4RBs4ulsGxZJacAyYN/qGpyC9
 8pUMiUVidkqAB4M+5K/Q4FMCAipnPB1vkTzcPM6JBpXbbHs8pXIJGiL8nWeOu45UddEoe+0BRQfOu
 VB5d34IDLw4Be04TmqXlEzCJ5X55KgtgAHJoNUj/WVAkpMv7TqfrnvB9ulKbeZ4Tgm0aaYRbGrW8P
 VesyXn6DFzJU++r54uCm2+gAdqvgwTNkunxN6CYEI3vkVP6Eq4IrSvKt+yMmgGl5s7Ro7d34ZKX3r
 8GhyCdeLwjokXOS7AKmZ72NgDDphY4typYhS3Ny/e1nqO57S1TIkumpOr1TExmyFv4MSZt1BUKNol
 CQTcljsQ==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r6KyC-006Zga-GE; Fri, 24 Nov 2023 02:27:01 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/17] drm/v3d: Don't allow two multisync extensions in the
 same job
Date: Thu, 23 Nov 2023 21:47:01 -0300
Message-ID: <20231124012548.772095-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124012548.772095-1-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
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
index e18e7c963884..fe46dd316ca0 100644
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
2.41.0

