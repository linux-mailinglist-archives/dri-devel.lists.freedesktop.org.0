Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CD454869
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1546E4A5;
	Wed, 17 Nov 2021 14:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DD36E461
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so4985738wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MFbb3rRC6CkwVaBmsFg7w37a3G8MDFjwzQkPk2t8wc8=;
 b=YoYvZVkCpOMlpNMu5GRBDUNDrcw27KAAW2A7PQ5i0wTQqeqlh/J9aUvAT4Gi1raMOs
 DaUNZWVtcIiIIg/XawEzUd5FVumlENuQiNNgtyrRqfNNB6wCWoIr7vZ7ab+iTN7TRnf1
 00oYjUpCCX9hwJdtSqoZvJBtf4+R+2OYWHhWU+/7OV0erZN8zm82SGt3JD53Myw+OkCr
 YfEg/RtEXdA6mu53N5/Ksu6uYg6wcy13Vu0l0ONyyO09tSbhCgKcHc2HrY01Y9EsMi0z
 Ge+BeWOaKkTbus1xr1UtWg0P9wRzINmiFVMd1xG7QOLgo6u4wj2RQ0nz/kw10Q5zhox5
 VzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MFbb3rRC6CkwVaBmsFg7w37a3G8MDFjwzQkPk2t8wc8=;
 b=gvC/r2cteBUgz94OrSmfGCZEXhqb6lPvxMiViaNefiNPzQk7HIwy6QvEgk8upvNybj
 FTxSQrMrdTjrx899Xcyfgl2s5rJ1pdKycUFvyp3VQDyTrUVgd58/TIn8Bwx8spq2/mQe
 AvW5GYxi9g+j00odnrBRhZc0TZCp/yjfcKQIyVNGhjg87Q/DgFVyESDRgpnuupn0WW0z
 yaDoqHf+xcEhVmQqu68BHJXp4xj5dh6obn8FnKIo12QBKrkLbTvW9q51SrGZyoFIIt0q
 IsPVTPlpn1TcZQ75pBbhySLEmbWWNShv1yQdWg3ZSIS+aKUeWVHLF5i9cyL41rzowtGl
 7ZkA==
X-Gm-Message-State: AOAM531MxGDkmqIOqeCjg95hjgUZekp0luObohjNu25Ypp0BxoyP5WDV
 h9koux8WwyarzlEFo8Hmh4rTFQ==
X-Google-Smtp-Source: ABdhPJw7uxvrrCV1Yon1GxDh+Ova8AePIueSwHwgQnyuE7lmYJXI+VqBKsWNufu80QQ4VIQ0XeUgyg==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr20330832wri.251.1637158781261; 
 Wed, 17 Nov 2021 06:19:41 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 8/9] drm/omap: add plane_atomic_print_state support
Date: Wed, 17 Nov 2021 15:19:27 +0100
Message-Id: <20211117141928.771082-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=narmstrong@baylibre.com;
 h=from:subject; bh=Pda2Ac0adRphf+l3IU8dWodFMXXAu4U1eOV5bDdRzdI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MvHDhUMYwMTVhslq4itOuJ9Xjr7S6DtjCpGiK
 xEPJ8FGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0UBNEA
 CBoe3cUZs6+knh7KLHllThJ7FU3smJZ+1KASHRlcUFjtnCNR9FNuyGuFFMjG9t48pJ/bYrXMxMIlnO
 jjteeYLSIjfXi1XM4f765+FhL5VlmqmTITWZYE0ckovQeJ2bQRIXQUiylYqGhOcKHXp59HYAq+ck5b
 iw2hn4CvicvlAm3pg5dZYLgb9/vaVCr8e1oML1LxczgOGA/gXa3M8ADX7Itq8woKm9mOe57anXkdRY
 eFAEk4zObIzN7YLY9vigoYIUpQ7JxTsWjcdI4gejzafPGIsnerE2nbmqKmsVG6Qy4exm/g6amTduNR
 9JD40sfdlSHGN/N26FmYKpG59LsPkmoLxi4PlVXiOL05vO1wzU51LiU4TLWYw0Fqc4J6C/WswyKHBq
 FuH9gUuEVSsf6oUkPK5/phA4vCeL0kxmJx0m5lg0xHkqgtQeULa1lsxZrccbdbXD1klOOQ8O+4fk+5
 nmRRYVbX6Aws4ci46H2VhhJsB3/bQmDE7t6DXfM/V7gnM+jz4tzCn5G9WVPfnzyO0Xl27Wh6q1j+4Q
 YwktfnN4GtZ+sZoRssYxT8QHZC2rq7dOCk8ZAa9LHy1MsaGgOo+0qoRMTer6ioHUxvNxBVw4R1XfTa
 jNhUZDwmjZdMYibtVrlc7pKKmLR/V0eYmWrJURctYWdTAOQXBGNzLik8vFBw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

Now that we added specific item to our subclassed drm_plane_state
we can add omap_plane_atomic_print_state() helper to dump out our own
driver specific plane state.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ce5ed45401fb..23b752d837a4 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -348,6 +348,19 @@ omap_plane_atomic_duplicate_state(struct drm_plane *plane)
 	return &state->base;
 }
 
+static void omap_plane_atomic_print_state(struct drm_printer *p,
+					  const struct drm_plane_state *state)
+{
+	struct omap_plane_state *omap_state = to_omap_plane_state(state);
+
+	if (omap_state->overlay)
+		drm_printf(p, "\toverlay=%s (caps=0x%x)\n",
+			   omap_state->overlay->name,
+			   omap_state->overlay->caps);
+	else
+		drm_printf(p, "\toverlay=None\n");
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -387,6 +400,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
+	.atomic_print_state = omap_plane_atomic_print_state,
 };
 
 static bool omap_plane_supports_yuv(struct drm_plane *plane)
-- 
2.25.1

