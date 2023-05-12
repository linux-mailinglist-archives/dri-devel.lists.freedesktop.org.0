Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5C7005CA
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 12:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CCE10E67B;
	Fri, 12 May 2023 10:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A941010E67B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=amP6hjnm3w5731OIEzuPNd7PXAVX4NF0Jx8glviiWcw=; b=iiYnpaOdeFmC+PBiDwC3+7XBEV
 zF2Xc4MAHurTRyHDScHBcLwH8Rye8nL1JmcgoRjal7WhUZbaV9GeuXhe6EuJ6weq5dqydutoy15en
 hGoK9KKvYStQukRKPJ3tcvJ7SXdPeQSxqTfiCO95BjFGfB51sOqBoaS0ptXv6DU3LYDjrjXl4DZfA
 evn2N0xPgxARQ85QbLnfGUi/a/udAGtfFi/IsvwmcYo4qKPg+JG/cDy7YrHGITCJh1yRc/ts+ho1i
 0/UKlfkTICrwhshMLfE81uSLjjgcdifhntmisnlwBiu+VFC0HNlolHn4e3Gacph2UuRpH7j+4a6h/
 gy7GT5DQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pxQDF-007gnd-Cl; Fri, 12 May 2023 12:41:25 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v3 1/2] drm: Add fixed-point helper to get rounded integer
 values
Date: Fri, 12 May 2023 07:40:44 -0300
Message-Id: <20230512104044.65034-1-mcanal@igalia.com>
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
of our fixed point value.

[v2]:
    * Create the function drm_fixp2int_round() (Melissa Wen).
[v3]:
    * Use drm_fixp2int() instead of shifting manually (Arthur Grillo).

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/drm/drm_fixed.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 255645c1f9a8..6ea339d5de08 100644
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
+	return drm_fixp2int(a + (1 << (DRM_FIXED_POINT_HALF - 1)));
+}
+
 static inline int drm_fixp2int_ceil(s64 a)
 {
 	if (a > 0)
-- 
2.40.1

