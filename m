Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420A87D646
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 22:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EC11125A2;
	Fri, 15 Mar 2024 21:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="J+HqMdq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AF11125A2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 21:37:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e6b3dc3564so2320935b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710538664; x=1711143464;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+b4mQbGcIQsTKsNYPQB3QvL0YJEVDJmGJzSl3gUd7iE=;
 b=J+HqMdq6Mixg0La8MMkbkMAsewrBzchvH+5+FgpnO1o3ickkQkFQeH/b/4h34edSVN
 EyTAsJhqwIZ7v5yzfbzY1aiBbx9mPVc5KSlvOukQgQI6Uze/Qlhx+Q/wMfaXq05yZY93
 tBoCmWG3Zp35SzSaZb0DsiDMrbJTIIgjTS6kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710538664; x=1711143464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+b4mQbGcIQsTKsNYPQB3QvL0YJEVDJmGJzSl3gUd7iE=;
 b=n38bOvT3Pc536zwcZbk1yG6pihjJIU+6fjJDDQYYIwhj5gLnJ0ogI72etj1+XHbBgd
 ZcRcPnaa+K7dmE0dQInbZEU1Rucg1MHiUwE7IbaN2ynggZrQV3wrTxfFmkPpuG1sufju
 HpnShfwyx4WGVbLN/XycCfmCJ893WqrBktLvkhYTjDnR29uuCACaNHHvgI/WFKeUkNFt
 S9ofmb4M2vLno3XLw9WKk4SA+gJdiCmvuBYcZ/CFm7GJBat48mF1DqgQ4rErm1HAko7O
 Z+xpgMy7p39HO05ExW/HyqHFAURvYvwRBoMh84qIYHF0CxiM7nDJnHVm8y8Sd7a+KI9k
 Lr7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfHcl9yhEZBkJK+Aci8ZAYLv2wkan3Jwga3AB/O2x4E+wPqEFUJOvRUTYIQ2Malt5QBiPc8UNQ7qu+irwQSK5FjLalN5f5vQqqj+AE4Rpo
X-Gm-Message-State: AOJu0Yz/t66bSM1nc+DSCFayE5koAOecUCp9w8YytNvJFz6bh2Apok+7
 7nVvRKZ9xdNDQYTr4jiTwmapgUhZXoLMfI0MG5GWTj8LhuX7kIex0k2auPldiQ==
X-Google-Smtp-Source: AGHT+IE6dILwhQwRnscQL2HZqCpcQ27ndmx7cXGzDQCIBh26yGtAACsBjiXvN4gTm/UODHNKDKm1Kg==
X-Received: by 2002:a05:6a00:92a4:b0:6e6:5396:ce43 with SMTP id
 jw36-20020a056a0092a400b006e65396ce43mr6495390pfb.7.1710538663984; 
 Fri, 15 Mar 2024 14:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 14:37:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD in
 aux transfer
Date: Fri, 15 Mar 2024 14:36:31 -0700
Message-ID: <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315213717.1411017-1-dianders@chromium.org>
References: <20240315213717.1411017-1-dianders@chromium.org>
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

(no changes since v1)

 drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 75c51f3ee106..ecefd1922d6d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		goto exit;
 	}
 
-	/*
-	 * For eDP it's important to give a reasonably long wait here for HPD
-	 * to be asserted. This is because the panel driver may have _just_
-	 * turned on the panel and then tried to do an AUX transfer. The panel
-	 * driver has no way of knowing when the panel is ready, so it's up
-	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP.
-	 */
-	if (aux->is_edp) {
-		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
-								500000);
-		if (ret) {
-			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
-			goto exit;
-		}
-	}
-
 	dp_aux_update_offset_and_segment(aux, msg);
 	dp_aux_transfer_helper(aux, msg, true);
 
-- 
2.44.0.291.gc1ea87d7ee-goog

