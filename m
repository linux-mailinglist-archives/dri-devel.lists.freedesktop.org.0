Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EFE87A00C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3419610F270;
	Wed, 13 Mar 2024 00:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DINkFzr1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958A510F3E5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:13:59 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1dc29f1956cso31473275ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710288839; x=1710893639;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iH7dOzHfySID1hx+dQROG4kWo57xV6ZLxO4hN1el+Bw=;
 b=DINkFzr10zz9XeI0XcObB4nKr/4njoJ21H1TU+beotMEN15KpWrfD2qXsJciFjjVnj
 STsnkzVLJKrdJAAUvrNGxZhKLiF/X7VBLqKTGgWCSPW6msPfdQDuxpPvSjfJUamYl84p
 3uEhPlK+OIZZXnugeg1+DJwtJN8IV2M4HHgxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710288839; x=1710893639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iH7dOzHfySID1hx+dQROG4kWo57xV6ZLxO4hN1el+Bw=;
 b=NTopqRxhw/SXQA+S5tEiWbFGwYVD5WE2Q3qfYRefryUicb5qm2Rgr71B3ZCtdRfuES
 XwLIZFOXZigkafaRcSF5643c49A0Wqy8nbU6SR/QmiBreSSs/Sj1EZa+T0QhEdI3c2wM
 9YYa1TUMwzs21hgvVdPAX3au7E/nIbY84TAg8TI/2tLp2gIjkKfXVLtMDsXfZ3FUm/RF
 RXUHcgfhDQINq4uwXqcQMuCkn7Ghc8vWEYLlLxk1qfuwMw3RR3cDNMT/hpNZ5e6VzoiP
 dY94rvzMF2t4BnbODBC1BTCyoTzkZTbpL0D4RqN4nDa4+5fGEt7XtfwUYglqDDSuodbw
 la0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUToatp9m85AVXJgE+8voVrOUzIRst4iToCJem27qtWPY9ZZjR9mtromXc0vNdJLSlbe8er+wIeR3zP9Q1G/XXCmB7W2NOaFQV869RAI1tV
X-Gm-Message-State: AOJu0YznOeHdQXiJqFjUw1vVP2sZzxWmDkj7eHxR+OI96bAjedJDIXBT
 EY4W/+FNqBeyFqGwrowx3OurR0Gje0Zjhk9hrSu5K2atad0UpJv5UYwzFyYmTg==
X-Google-Smtp-Source: AGHT+IF8TBuICwc1/oaTRuDykpJ3M8i0pZiDCaxf+rAiL5WJKMEjNtGSI5raH9YjmvsuRaXg9/0jPg==
X-Received: by 2002:a17:902:cec1:b0:1dd:a16e:dea4 with SMTP id
 d1-20020a170902cec100b001dda16edea4mr8173646plg.67.1710288839081; 
 Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f8dd:895c:e876:6edb])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Tanmay Shah <tanmay@codeaurora.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if
 nothing connected
Date: Tue, 12 Mar 2024 17:13:16 -0700
Message-ID: <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
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

As documented in the description of the transfer() function of
"struct drm_dp_aux", the transfer() function can be called at any time
regardless of the state of the DP port. Specifically if the kernel has
the DP AUX character device enabled and userspace accesses
"/dev/drm_dp_auxN" directly then the AUX transfer function will be
called regardless of whether a DP device is connected.

For eDP panels we have a special rule where we wait (with a 5 second
timeout) for HPD to go high. This rule was important before all panels
drivers were converted to call wait_hpd_asserted() and actually can be
removed in a future commit.

For external DP devices we never checked for HPD. That means that
trying to access the DP AUX character device (AKA `hexdump -C
/dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
system:
  $ time hexdump -C /dev/drm_dp_aux0
  hexdump: /dev/drm_dp_aux0: Connection timed out

  real    0m8.200s

Let's add a check for HPD to avoid the slow timeout. This matches
what, for instance, the intel_dp_aux_xfer() function does when it
calls intel_tc_port_connected_locked(). That call has a document by it
explaining that it's important to avoid the long timeouts.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..de0b0eabced9 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	 * turned on the panel and then tried to do an AUX transfer. The panel
 	 * driver has no way of knowing when the panel is ready, so it's up
 	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP.
+	 * avoid ever doing the extra long wait for DP and just query HPD
+	 * directly.
 	 */
 	if (aux->is_edp) {
 		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
@@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
 			goto exit;
 		}
+	} else {
+		if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
+			ret = -ENXIO;
+			goto exit;
+		}
 	}
 
 	dp_aux_update_offset_and_segment(aux, msg);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a4..93e2d413a1e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 				2000, 500000);
 }
 
+bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HPD_INT_STATUS) &
+	       DP_DP_HPD_STATE_STATUS_CONNECTED;
+}
+
 static void dump_regs(void __iomem *base, int len)
 {
 	int i;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51..1694040c530f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -86,6 +86,7 @@ void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
+bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
-- 
2.44.0.278.ge034bb2e1d-goog

