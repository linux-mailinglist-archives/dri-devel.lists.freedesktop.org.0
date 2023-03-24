Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 356546C828C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 17:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92B10E04E;
	Fri, 24 Mar 2023 16:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744D10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 16:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDg67yEfpstotWBfsfXoe1HKLG/VZOesRn1KPXxexts=; b=gKGSuSb/5saC3AYs1kZQJMGq6o
 herz400UetMpsPDJIFvpWtlsg6Bo8Cic7sfrJwsu5f5ydyb3Ezms10cAIadlnwZ06Y8Klto4APpKq
 wvHUfxDvnUaYyYNusLv59fi91qXUbJNyeY4teGJ0k/erNs3pZ1WcrReBwERcEMI72JPC3TB/WId8H
 a9EIe2J+tn7Fs6yMvxYzco2ajfpOuB+eatvEpR67fR5vdVyj8t+K51/QgN3r9Hj9yLQONyaCNfi1s
 IUiuqnoCtUB8ahuEv5AJVLR2ztyvcdV/zW5hk0P6h7m/PWyK/CPtmGgNOfFYUkc6FDBxQU1fGmtc0
 /kISUUaw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pfkWt-005bt9-Qq; Fri, 24 Mar 2023 17:44:40 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v2 1/2] drm/vkms: remove the need for the primary plane to be
 visible
Date: Fri, 24 Mar 2023 13:42:25 -0300
Message-Id: <20230324164226.256084-2-mcanal@igalia.com>
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
primary plane doesn't match the CRTC"), the composition was executed on
top of the primary plane. Therefore, the primary plane needed to be
visible and full screen. After commit bc0d7fdefec6, this is no longer
necessary, as the composition is now executed on top of the CRTC.

Then, remove the conditional expression that forced the primary plane to
be visible and full screen. This allows vkms to accept non-null
framebuffers when the CRTC is disabled.

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

