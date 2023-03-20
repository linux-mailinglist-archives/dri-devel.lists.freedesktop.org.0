Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100226C220E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3629E10E312;
	Mon, 20 Mar 2023 19:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811A110E312
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rD86dd4RJRoGcBrPqUxiJ4UC31nvE/L8rMOqegGr7ac=; b=dnEiKKB87wwBa32Cv4NeUmJ7p/
 +6V4Udfle7bmeRApw2mJ3lz1B2hGq0N8diHgxXf3XlG5+oqNsvOUHwMKVX0zy8uNI3QLRuwgvfms+
 fYXXWplGTnJPwadYqs2qgct+4gJKhyYJEGJFi/4jgsYElb91U82Vo4w7GdKgBZmORW0XcT3JcCapj
 YJWPzATUXgpX406YHnFBie5pdTs/+iVbiqOyPG8Q6tnHu7tOYME1YTaJivkLDxit0sOKfaSGBAUfd
 0l+73zolEGLUvmd4GMOYqmX/ymBUWWGEoK3YntjGKJAn1ry+2TeY/DMSU3S/hWInq5pRtg6/F/B1s
 u13WJhng==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1peLdM-001BJi-CV; Mon, 20 Mar 2023 20:57:32 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH] drm/vkms: remove the need for the primary plane to be visible
Date: Mon, 20 Mar 2023 16:55:59 -0300
Message-Id: <20230320195558.134768-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before commit bc0d7fdefec6 ("drm: vkms: Supports to the case where
primary plane doesn't match the CRTC"), the composition was executed on
top of the primary plane. Therefore, the primary plane needed to be
visible and full screen. After commit bc0d7fdefec6, this is no longer
necessary, as the composition is now executed on top of the CRTC.

Then, remove the conditional expression that forced the primary plane to
be visible and full screen.

This patch was tested with the vkms IGT testlist and all tests passed
successfully. Moreover, the tests
igt@kms_universal_plane@universal-plane-pipe-a-functional and
igt@kms_universal_plane@disable-primary-vs-flip-pipe-a used to fail and
now are passing.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index b3f8a115cc23..458d16865c97 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -153,10 +153,6 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	if (ret != 0)
 		return ret;
 
-	/* for now primary plane must be visible and full screen */
-	if (!new_plane_state->visible && !can_position)
-		return -EINVAL;
-
 	return 0;
 }
 
-- 
2.39.2

