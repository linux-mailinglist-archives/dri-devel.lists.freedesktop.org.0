Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EE6F9B88
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A6710E2FE;
	Sun,  7 May 2023 20:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73810E2FE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z9mAFSvpOksCY3uRcnpltVB9+hwQmpGbfR5Tlh8ERVE=; b=aDjYBQB0eUuJdTTwJCfh63DPmK
 LMNkbAyIenCC3JrpkFpx6rVyxxqsCTmm4itbL7QrDmCHd6cpH8J8ISe9IulbiaeextB53nD+ZQ7uq
 MjGBXFB6VA5MZL9efWD+Q3IKjmyZ16vFHrm+vCIievbLCkQmpv5hEHBPFRcg+8trkNjuznsksFL97
 /rlAz4kZCfcK0Yj9abzJmMs8NFfEGa60NWaeuQ32/qpQ5OvO+eFg27G5KQFUpaiTt23pynIF5C36j
 ZNMtj48JFuq6hqI4DjyJIw3MxZGulja2DkOwvZvhDStyLwAyMR1v2Q4IkD/tkB9PIuQ6u6p03DFK9
 mrlllYwA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pvl03-003N0U-Or; Sun, 07 May 2023 22:28:56 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 1/2] drm: Add fixed-point helper to get rounded integer
 values
Date: Sun,  7 May 2023 17:28:47 -0300
Message-Id: <20230507202848.207608-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
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

Create a new fixed-point helper to allow us to return the rounded value
of our fixed-point value.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20230425153353.238844-1-mcanal@igalia.com/T/

* New patch
* Create the function drm_fixp2int_round() (Melissa Wen).

---
 include/drm/drm_fixed.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 255645c1f9a8..d695d0411e2d 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -71,6 +71,7 @@ static inline u32 dfixed_div(fixed20_12 A, fixed20_12 B)
 }
 
 #define DRM_FIXED_POINT		32
+#define DRM_FIXED_POINT_HALF	16
 #define DRM_FIXED_ONE		(1ULL << DRM_FIXED_POINT)
 #define DRM_FIXED_DECIMAL_MASK	(DRM_FIXED_ONE - 1)
 #define DRM_FIXED_DIGITS_MASK	(~DRM_FIXED_DECIMAL_MASK)
@@ -87,6 +88,11 @@ static inline int drm_fixp2int(s64 a)
 	return ((s64)a) >> DRM_FIXED_POINT;
 }
 
+static inline int drm_fixp2int_round(s64 a)
+{
+	return ((s64)a + (1 << (DRM_FIXED_POINT_HALF - 1))) >> DRM_FIXED_POINT;
+}
+
 static inline int drm_fixp2int_ceil(s64 a)
 {
 	if (a > 0)
-- 
2.40.1

