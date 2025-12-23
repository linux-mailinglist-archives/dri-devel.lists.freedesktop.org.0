Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6FCDA381
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289C810E28E;
	Tue, 23 Dec 2025 18:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="d0wg5v6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261610E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766513005; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IvVUXMN7E7PwE8FFl44aHhC+iPo/KE9j7lHhsfJKB29H9JrC7hKCitokgfyi/rKyqGKUqRWDbV2zpOXxHQBp+dlOgNHtTE4x1EbnBzpSut5IgapGrIXKeXHHy7lB9ANaBrWnOio0gKNKQrxqr0Hj8RDCdRMcn0WTCNsL9gjE8t0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766513005;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=w4peOIzDwpgvjVlPcGVKkM6+2/+zrSURLwHOgZrhBZk=; 
 b=ewaw09pKBXiZ3Xo7dVq8hywO8dky/0+3vviML17OiBlbC853bNnNPFidMjBifwQpB1DcURkIyI/XDutLJrDIVKDVnctwwmOv5YJfc3sfvwxYKH9221Ub6lA23VR3x6PTmTVBXMPP9ionf/Y3rNIHRPqVzx7/sdMb6o41aJlk4ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766513005; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=w4peOIzDwpgvjVlPcGVKkM6+2/+zrSURLwHOgZrhBZk=;
 b=d0wg5v6syAjWeKtGb5s3jka1JIetN0GnG/GSrUXGssSZOSwg+LIUKyZtjYDdPjT5
 ebLffggn3dVvqM9eoZBxhbGQMFVBz/JtkjZE+UEKuNhmgwXnvczp1y40tPMjiA2mmsr
 25+rTEvLZRPOXphU2nm6xa1RspPYOK660LR6NG0U=
Received: by mx.zohomail.com with SMTPS id 1766513003533359.41806615027394;
 Tue, 23 Dec 2025 10:03:23 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:35 -0300
Subject: [PATCH v3 15/21] drm: Add helper to extract a LUT entry from
 either 16-bit or 32-bit LUT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-15-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1871;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=NyijHk7BrD1qg1wbKRwHg1Uug2fibA4RZ0UIzlvViFQ=;
 b=npmXvD1l++IAnjReNfPZLOzC8duyNX1bPNFwPZHbBm1mqMJHgUvPX4TpvD/F1HRdwxLe+S1TI
 fmAilhWHF0NC+GFLY7IvFtojfHxcSKgBcSnm3WpPBcpBR2gIF66XpyZ
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a common helper to ease extracting a 32-bit LUT entry from either
16-bit or 32-bit LUT entry. This is handy for code that needs to handle
both bit widths.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Co-developed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 include/drm/drm_color_mgmt.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 51279267ed3fd..3d0117aae342d 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -66,6 +66,33 @@ static inline u32 drm_color_lut32_extract(u32 user_input, int bit_precision)
 				     (1ULL << 32) - 1);
 }
 
+/**
+ * drm_color_lut_to_lut32 - Copy LUT entry contents to 32-bit channel color LUT
+ *
+ * @dest: The destination 32-bit per channel color LUT entry
+ * @src: The source array of LUT entries (16-bit or 32-bit depending on @bits32)
+ * @index: LUT entry array index
+ * @bits32: Boolean indicating the source LUT entry bit-witdh
+ *
+ * Copy the contents of a LUT entry from the source array, to a 32-bit channel
+ * color LUT. The source array of LUT entries can be 16-bit or 32-bit width
+ * depending on the @bits32 boolean argument.
+ */
+static inline void drm_color_lut_to_lut32(struct drm_color_lut32 *dest,
+					  void *src, int index, bool bits32)
+{
+	if (bits32) {
+		*dest = ((struct drm_color_lut32 *)src)[index];
+	} else {
+		struct drm_color_lut *lut =
+			&((struct drm_color_lut *)src)[index];
+		dest->red = lut->red;
+		dest->green = lut->green;
+		dest->blue = lut->blue;
+		dest->reserved = lut->reserved;
+	}
+}
+
 /**
  * drm_color_ctm_to_ctm_3x4 - Copy CTM matrix contents to 3x4 dimensions matrix
  *

-- 
2.51.0

