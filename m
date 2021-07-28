Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795923D9373
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB1D6E855;
	Wed, 28 Jul 2021 16:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19C36E0EE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:46:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id mt6so6076199pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+64vU1qKaQt4H6y0jZvJKOI9CTWrL576JKYHnv+P58=;
 b=Cj6Z5k6TbxD2x9dIUzq5VLOSItV5NUhbE32Hew4oiMroHjqzqpsn9Q3OrMqx00NRpL
 FHOzjt8EPIj5vKnMCwPP7QmZ1hZu42xkmm9bjUlaAgxtGtGaZ/UObb1c6Z5Ki5FVheBf
 uGKzLxl5ZVcfQKnfp4lcSKrqaXbb7VzOx+Ec4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+64vU1qKaQt4H6y0jZvJKOI9CTWrL576JKYHnv+P58=;
 b=XsrsH8MQhK1J5yuutPajYZ41VG6hcI08mzZ8/pNHbCH8EzYm1aU8hPFGs6poYG+unm
 5GDx3hW0caVX2GjBfCefAQqpKvhOTsk/pRUSG76HCJVtYpHyQAEpjPWAViIu05P1vVJU
 rlsis1IJnOKRXRK2soF453smOhP8Z1NPE+SmpoqtY6xR0wk10keWNVh/yeprZ2nNWvcL
 YsaXErSNOeBgoOJt92LmsEKYnHE//JNX2eypn0YGNwzT6u03PJyC77KuH3YIOhB+J9Aq
 PTzOuIUoH/7zEiac7D5QjknkCBAI0i3oDosYh3+4ziNCs8W15tCg0qcLzRA6TZ4H06HX
 A2+w==
X-Gm-Message-State: AOAM5322S6Nod9a/dXwcmoCmpNf2uLScOyYsO71c5K7IItYirWws4Dva
 eIJfaGlDvKcw81eZ+hPzZd1bGT6ZmDXKiqy/
X-Google-Smtp-Source: ABdhPJxWFqYtDvnJJgoUgNEvupJRcl6FnSGf7LmlHKsxRxSnzigsEFmlt+KzkZI7qZszb9FiqXJYjg==
X-Received: by 2002:a17:902:8ec6:b029:12b:ab33:15d4 with SMTP id
 x6-20020a1709028ec6b029012bab3315d4mr515472plo.80.1627490786102; 
 Wed, 28 Jul 2021 09:46:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
 by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 09:46:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/dp: Don't zero PWMGEN_BIT_COUNT when
 driver_pwm_freq_hz not specified
Date: Wed, 28 Jul 2021 09:45:52 -0700
Message-Id: <20210728094511.1.If017efce7116ae8ba015ed7def840c390a0e0c77@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
References: <20210728164557.1882787-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, steev@kali.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, rodrigo.vivi@intel.com, rajeevny@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function drm_edp_backlight_init() is defined such that the
"driver_pwm_freq_hz" parameter is optional--it's 0 if you don't want
to futz with it. If you follow this variable through, you'll find out
that if it's 0 we won't ever set the "bl->pwmgen_bit_count", leaving
it as 0.

That means that before using it in drm_edp_backlight_enable() we need
to check to see if it's non-zero.

Programming this field to zero was confusing the panel I tested with
(Samsung ATNA33XC20). The backlight still worked somewhat but the
brightness values didn't correspond to what they should have been.

Fixes: 867cf9cd73c3 ("drm/dp: Extract i915's eDP backlight code into DRM helpers")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/drm_dp_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index b5f75ca05774..b8a5c5e49d74 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -3229,10 +3229,12 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
 		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
 
-		ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
-		if (ret != 1)
-			drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
-				    aux->name, ret);
+		if (bl->pwmgen_bit_count) {
+			ret = drm_dp_dpcd_writeb(aux, DP_EDP_PWMGEN_BIT_COUNT, bl->pwmgen_bit_count);
+			if (ret != 1)
+				drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
+					aux->name, ret);
+		}
 	}
 
 	if (bl->pwm_freq_pre_divider) {
-- 
2.32.0.432.gabb21c7263-goog

