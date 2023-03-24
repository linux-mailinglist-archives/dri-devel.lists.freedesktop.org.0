Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D96C828E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 17:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3543810E0BF;
	Fri, 24 Mar 2023 16:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3910E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GdSIGsEfy7jdegMgyGDMNe0GexXKg6Jk+s3hWq7mXp0=; b=qyfqtoSPZF+NZm0INRmbMAVDfK
 mlbAtqvm6LkkkuACNvfN2MirfJUj82rjhQXRMHxqqBi4gb81iy/3KZcEOhd2mn6NEEzpdPuUjrphW
 aysEMX47mL+5RmY4rAdyDc3NMCBnSeP/rf5XqHzAw5+b1+CJ/l+Q9RPSjDu5+pzZi6x1gori1xzAk
 YcSFCvpMNi1Fgvtpf+tEyjf7ETqu68/ZIMOKgkV2TcOEbV9YrwdIA9gslAyeYZpzAQvkrZ4hUB0zZ
 n8cwNkC9EPDz87h6gIrkuKBwyUDRaSgaplqm+g+6qcpghZrbxGVjKagBJ7znbvaxFZ6huCYjHEfyS
 +dx5BrIQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pfkWw-005bt9-Up; Fri, 24 Mar 2023 17:44:43 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v2 2/2] drm/vkms: allow the primary plane to be positioned
Date: Fri, 24 Mar 2023 13:42:26 -0300
Message-Id: <20230324164226.256084-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324164226.256084-1-mcanal@igalia.com>
References: <20230324164226.256084-1-mcanal@igalia.com>
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
primary plane doesn't match the CRTC"), the composition was executed
on top of the primary plane. Therefore, the primary plane needed to cover
the entire CRTC. After commit bc0d7fdefec6, this is no longer necessary,
as the composition is now executed on top of the CRTC.

Then, allow the primary plane to be positioned in such a way that it
doesn't cover the entire CRTC.

This patch was tested with the vkms IGT testlist and all tests passed
successfully. Moreover, the test
igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-A
used to fail and now is passing.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 458d16865c97..c41cec7dcb70 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -132,7 +132,6 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc_state *crtc_state;
-	bool can_position = false;
 	int ret;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
@@ -143,13 +142,10 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		can_position = true;
-
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
-						  can_position, true);
+						  true, true);
 	if (ret != 0)
 		return ret;
 
-- 
2.39.2

