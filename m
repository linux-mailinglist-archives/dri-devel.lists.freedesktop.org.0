Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47237454863
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7C36E3D2;
	Wed, 17 Nov 2021 14:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659C56E3D2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w29so4975629wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gb6rdR8r5bxnCwwvMcUXuUQs475rnlgLqYUIOtwuUmQ=;
 b=EHUzwvR6NodJpEIVTgFemNR6loQk8F9zIj8MfM5yI13PXt46bs4FyIhma5+6l557HB
 Jq7L5BhdtQ+ak31/tUsbIYTlxXdnLVyHuabArY0aGeEmUogogueidx/53wN215avv3ht
 8yhwNw1YXJ6ktot9PMbt8OS3AOH2gm8CJ6B3IMlq1Zbzly0HGhNHmCeqD3pZwMApxNm5
 GH/eQKxA/LVctq459zR+9Ewk07TROBAeXvUJjvh0h7kLGD9QmplEu/GhpFgKsgJMXMrs
 cXeFOMbqUMKB0Fv0GoMCoo577xOZ23ANGN7sVgP3lTqeV/5orkouAE12UZMr1edUNoEs
 hdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gb6rdR8r5bxnCwwvMcUXuUQs475rnlgLqYUIOtwuUmQ=;
 b=Skvl+kiyeyzYzcc1YmD/Htk3JMgUBEhfZE7Lk5Lsa5JQow2gBSXkN39NQ2xDKKQn2U
 Fkq4jPsCWBezWFAwzMOfzXELQb2c2WrJ3IYq0aml6O+ZyBn1cWRv+2mThIJlUpwLajGh
 HB9jhvetdChIyMOff7va3Oeto49osbRdMuzNCfPofgp3kdxW3fc7Gz7HTHSVsAe8GH4k
 77Upa+j2ph+ziQ5jDadh3BQ9E9miAb135A/GFFamjbsgfM6U8ROHyE5/uoCCfsDZKQRl
 UDLyED2EX17rjqo/516GmyHIdGWvEh/0kuAYiYzXUZv1MWlkBuI6XIK9wlwynrK44RsX
 vjSQ==
X-Gm-Message-State: AOAM531wVjT3vNJyrMaqSMhiYLuO8PKekNgNa0AWILeKvVlq3qXQGzNi
 gEz33dU80FqUBUpr2OuiifEbLQ==
X-Google-Smtp-Source: ABdhPJxs6gQED3x1xQTvItqVNfy4M5Qo43kL+qfgVTxzRYn7Au/Zt2MrLDv6L4EpPCU2Vk8oKw2lvA==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr21106137wrz.147.1637158775596; 
 Wed, 17 Nov 2021 06:19:35 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 3/9] drm/omap: Add ovl checking funcs to dispc_ops
Date: Wed, 17 Nov 2021 15:19:22 +0100
Message-Id: <20211117141928.771082-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=narmstrong@baylibre.com;
 h=from:subject; bh=3ZuXHPw5i+CUkF1E6yMQB6Ye+gRoZAVN+ibCccMbko0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MpgMs+k9m9KjXxdMN+K5FnHZiwxhfuTNuc+hO
 8TYYyFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0dXDD/
 9rddJZzDAyVVy0zGuJSR5vrT9SscH7YKGzgbzi/QbvYdk3qS0IsRCk9Sa5wvzir+mZO7bceGeXohXy
 LmudE6CoP8VliR0xTFksaJgXTvispoaLEEVksHWNwX7FJc4eTt0uMceYKKU9jlpRyYkf1L5sd5L09d
 Cpq3QWnqlS713r4N3YQL/C4HffyzYST/2NAxEpZp9UYhjXffall80+HiKy1IphicvXur82WEMR9sfo
 +ZPe9syKsSSQoKyf2ri2JXyvvSTlnujSQ3CElNT0dirwyTQEVyG6azzDLfz6GhnJDY8MPf9++1h6nO
 YZdtL6IXRTOBxCXdt71Hjg6nVj8xAndQ0KxyRI4KC7A8ZmjgmBAf2dKaW9/fCOzICYNActo93En0sy
 +8VNIc/BBgKBS/KOk6rZPIRgM0wasMEJ3xCQbuy6EcuSd9HI5+NFTgs2AYGN4rPkwdYt5+2FzYgSXj
 Dcr+rYrnOoNZq18h37vDUPn+mrWJFugvLN9VQwVeDf9b3ZHN4230A1vak5hW3VmTeixazGFYEuGbS4
 fEEVRghmrsKiA7vnlYtL1dP6w9bA1YEgvVouHp3CAbttr8lgGUm9URfZXiQhIlSne4MKuevqbMSlJf
 TAkPJ9yptpRpKJVcBQ0Kvt4sBiIRgXd7y9TqBWQdNTsKJfl0AA4m+MSnreBQ==
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

In order to be able to dynamically assign overlays to planes we need to
be able to asses the overlay capabilities.

Add a helper function to be able to retrieve the supported capabilities
of an overlay.

And export the function to check if a fourcc is supported on a given
overlay.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 9 +++++++--
 drivers/gpu/drm/omapdrm/dss/dss.h   | 3 +++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index d3cf9d9aef63..2da4d36a3446 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -1281,8 +1281,8 @@ static u32 dispc_ovl_get_burst_size(struct dispc_device *dispc,
 	return dispc->feat->burst_size_unit * 8;
 }
 
-static bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
-					   enum omap_plane_id plane, u32 fourcc)
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc)
 {
 	const u32 *modes;
 	unsigned int i;
@@ -2489,6 +2489,11 @@ static int dispc_ovl_calc_scaling_44xx(struct dispc_device *dispc,
 	return 0;
 }
 
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane)
+{
+	return dispc->feat->overlay_caps[plane];
+}
+
 #define DIV_FRAC(dividend, divisor) \
 	((dividend) * 100 / (divisor) - ((dividend) / (divisor) * 100))
 
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.h b/drivers/gpu/drm/omapdrm/dss/dss.h
index 14c39f7c3988..4ff02fbc0e71 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.h
+++ b/drivers/gpu/drm/omapdrm/dss/dss.h
@@ -398,6 +398,9 @@ const u32 *dispc_ovl_get_color_modes(struct dispc_device *dispc,
 					    enum omap_plane_id plane);
 
 void dispc_ovl_get_max_size(struct dispc_device *dispc, u16 *width, u16 *height);
+bool dispc_ovl_color_mode_supported(struct dispc_device *dispc,
+				    enum omap_plane_id plane, u32 fourcc);
+enum omap_overlay_caps dispc_ovl_get_caps(struct dispc_device *dispc, enum omap_plane_id plane);
 
 u32 dispc_read_irqstatus(struct dispc_device *dispc);
 void dispc_clear_irqstatus(struct dispc_device *dispc, u32 mask);
-- 
2.25.1

