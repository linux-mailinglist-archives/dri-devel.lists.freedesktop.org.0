Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BB83FA15
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 22:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED8710F804;
	Sun, 28 Jan 2024 21:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14D510F804;
 Sun, 28 Jan 2024 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=esUOLqZ9eTPDph2l8qLm7kLjWJiyKC5ICzbRuvIVRhc=; b=ra+nySSUbn1Pfe9kXhEH4eKNE3
 fU+ed5m11My9oo4y+NJdmHgU3JN+K0ojaZ26BFeLEhClKHscK4sGpY9CoD/E8TpjewV0PWNuA1lVl
 ka2SaR3gq4rbRSABh4ZFdK5aPrUlrANkxBplof2tXfAJ+wDFHPpvRl435rdWkI9ag+kbjsq5V2UEm
 E9fQPObmSSv2giS1pWeAk3+hbg3GfothPZoZ51T937B1D/1lZo8lQnbx6NcZ8ye5gJASG57IWtsAH
 6MBLB9U12tkV0d2qHGwldPaGs49TcWMiqr1t8+bHLX0z55rCMXyIgKWRzfvaKZdQawGbK4EKD94N4
 JpY5SzIQ==;
Received: from 201-42-129-61.dsl.telesp.net.br ([201.42.129.61]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rUCeg-00B1M8-Kh; Sun, 28 Jan 2024 22:25:31 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/atomic: Allow userspace to use explicit sync with
 atomic async flips
Date: Sun, 28 Jan 2024 18:25:14 -0300
Message-ID: <20240128212515.630345-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128212515.630345-1-andrealmeid@igalia.com>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, daniel@ffwll.ch,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Joshua Ashton <joshua@froggi.es>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow userspace to use explicit synchronization with atomic async flips.
That means that the flip will wait for some hardware fence, and then
will flip as soon as possible (async) in regard of the vblank.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v3: new patch

 drivers/gpu/drm/drm_atomic_uapi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6d5b9fec90c7..edae7924ad69 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1060,7 +1060,8 @@ static int drm_atomic_check_plane_changes(struct drm_property *prop,
 	 * change will be either rejected or ignored, so we can stop the check
 	 * here
 	 */
-	if (prop != config->prop_fb_id) {
+	if (prop != config->prop_fb_id &&
+	    prop != config->prop_in_fence_fd) {
 		ret = drm_atomic_plane_get_property(plane, plane_state,
 						    prop, &old_val);
 		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
-- 
2.43.0

