Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC187A010
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4663E10F350;
	Wed, 13 Mar 2024 00:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eJOYnXGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1DD10F3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:14:03 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1dd5df90170so3412175ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710288843; x=1710893643;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ojXHCUbSnEQhORVd/rWq7LKRiJH0Wv/f2AD6HriHOV4=;
 b=eJOYnXGLROAsH9KSAaMSzqWTJFcq3VryCA394/8PrE59eGbAusUy5qqehFZ50CCaq4
 WgOqhgH5ThHuuVI5Eke7Lji2VDUmRzNHJr3yaCgHWyv9oQ/WMYTmCDVjNDRccsdVelvP
 8j5Z966ZgWbn0cq8bF0yf2P8NptYROi11afUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710288843; x=1710893643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ojXHCUbSnEQhORVd/rWq7LKRiJH0Wv/f2AD6HriHOV4=;
 b=vPEkWRQC75MMyOaHWTqNjPr1EWNRAbABUyDjItTT5QrYt4FPfbPm5u0BzaCA98Aq5B
 CTQznk3jVUTWuINsz1dVQ0CjIoY92kxVX+ADrzuuCGtO9bRK/SJTltUQe+Fj+KvYKYrv
 L+fj8vfkKNBDi0yEyX2myrnh9Ce/lPJ/FTLeXod4PiTeHOT4jv9OWdUVuIaorEtUekwy
 uXlDUSQwEFPd5mR7AjE4/24qMziOKN6aaaTOpJ7u/IhCaRGGXS/8/txCsq096OAW39pE
 nrZ6vjWYfHjJZjn2fKeglyixpIqVIh4Ah0GBMTo2VYI/f8XquT2qdakq1YPcG2F7vgzd
 f1Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr2hBrHFJ+xRcWeZMEpWx/PUmPg87ktUhB92xkwYz/ZggoKPVOFrGB6ed2klM7RHMyohquj8CotFnYjjES/F2Mr1fD731fh94jMquayYfI
X-Gm-Message-State: AOJu0YzD+EsMs8imtffGiKzfdRFdxmHAizizAW2htE6JM2d8F9o10xMJ
 i/GuUakw7NCE9avkDEG11aqyBPfm9hEAZIEu3l7scVOlI6AdzvoJSJhAqC2iGw==
X-Google-Smtp-Source: AGHT+IHg+QGPW6c7yNuVfIy4mB1qUblGBo63Tt7Q82dhAxfSHW8SU9MTfYSWrSGI9xpyWtMDyKwWUw==
X-Received: by 2002:a17:903:22cb:b0:1dd:8d25:f8a0 with SMTP id
 y11-20020a17090322cb00b001dd8d25f8a0mr1295429plg.24.1710288843216; 
 Tue, 12 Mar 2024 17:14:03 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f8dd:895c:e876:6edb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 17:14:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux
 transfer
Date: Tue, 12 Mar 2024 17:13:18 -0700
Message-ID: <20240312171305.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before the introduction of the wait_hpd_asserted() callback in commit
841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
that it was up to the AUX bus driver to wait for HPD in the transfer()
function.

Now wait_hpd_asserted() has been added. The two panel drivers that are
DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
3b5765df375c ("drm/panel: atna33xc20: Take advantage of
wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
no longer any reason for long wait in the AUX transfer() function.
Remove it.

NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
optional for the DP AUX bus to implement. In the case of the MSM DP
driver we implement it so we can assume it will be called.

ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
causing long timeouts, but it's still nice to get rid of unneeded
code. Specificaly it's not truly needed because to handle other DP
drivers that can't power on as quickly (specifically parade-ps8640) we
already avoid DP AUX transfers for eDP panels that aren't powered
on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
eDP panels are not powered").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index fc398e8a69a7..dd62ad6007a6 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -302,26 +302,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	}
 
 	/*
-	 * For eDP it's important to give a reasonably long wait here for HPD
-	 * to be asserted. This is because the panel driver may have _just_
-	 * turned on the panel and then tried to do an AUX transfer. The panel
-	 * driver has no way of knowing when the panel is ready, so it's up
-	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP and just query HPD
-	 * directly.
+	 * If HPD isn't asserted then the transfer won't succeed. Return
+	 * right away. If we don't do this we can end up with long timeouts
+	 * if someone tries to access the DP AUX character device when no
+	 * DP device is connected.
 	 */
-	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
-								500000);
-		if (ret) {
-			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
-			goto exit;
-		}
-	} else {
-		if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
-			ret = -ENXIO;
-			goto exit;
-		}
+	if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
+		ret = -ENXIO;
+		goto exit;
 	}
 
 	dp_aux_update_offset_and_segment(aux, msg);
-- 
2.44.0.278.ge034bb2e1d-goog

