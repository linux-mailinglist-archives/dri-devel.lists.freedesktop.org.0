Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B42505D67
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 19:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30878855B;
	Mon, 18 Apr 2022 17:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF18A10E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:18:15 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q19so20002101pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+5hNAQUGRBcWMyhUpii4SZ/5UNEY0wJyFcuVeraWLE=;
 b=U9m9xDxROs6AJXCzZAbutdOmIcD7SEJEZyfVo4+CqKf1YtHMSEAC89p81Qq3A1HSzg
 sRZWMfN4cZg7GlQ0cjKBsgRDzAL4x/cV2ZmLrMe20ZJ/20tThrCmscLUXDNWs+xxmHYE
 VUfQkvIOnGAd16z5FgdCUu7QL8dWIpV3pNqf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+5hNAQUGRBcWMyhUpii4SZ/5UNEY0wJyFcuVeraWLE=;
 b=aMWO28X7ocE8h9g8MECBk1hQmeJufMrza0EodmmRcpIcOP+APkppZUz6LRaRNKty+9
 DD5VGsZ6H/gQAVqFf+xHQUsuSgksG1CQ5LQiItAXp/aE9Eept40RdenB/s0fgqip/ztz
 lqUZyCIB7xfsP6EEkzgBchYMsINxOW5X3imY2JbMdH0edn2QacL3rNVPjhU1YnvVX2Mu
 /c9aOtDyDtbTVPOV8wKtb0zj0rv2ur7h+oqD8+yfY7NWNYJG42NxWr2jt7oSY+Sgn/6t
 RZOn5LjU0ViicO+KIv4oRYoXG5rIuOY6N5Jd30DE3dokxz2xYXJAyUOth3xQV+hwWEQs
 UFDg==
X-Gm-Message-State: AOAM531odIlS0LoAtUJb1w37XqBC2BjFJdo3G3f4SQSLPdplyjtwPq7q
 fk0NQKdgeIKxJ5r4rVSo5nnFLNrooLxEDpKPe3Q=
X-Google-Smtp-Source: ABdhPJwB+bu7EH+6U633uQKznBlc8LCNPkt9FKjrOTOZQoBsIoc+zKqtsdsUrREDVd7x4JZVu6g/Cg==
X-Received: by 2002:a63:fd05:0:b0:3aa:127d:538a with SMTP id
 d5-20020a63fd05000000b003aa127d538amr3006395pgh.95.1650302295398; 
 Mon, 18 Apr 2022 10:18:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0050a3bbd36d6sm12152126pfn.204.2022.04.18.10.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 10:18:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
Date: Mon, 18 Apr 2022 10:17:54 -0700
Message-Id: <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220418171757.2282651-1-dianders@chromium.org>
References: <20220418171757.2282651-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes it's useful for users of the DP AUX bus (like panels) to be
able to poll HPD. Let's add a callback that allows DP AUX busses
drivers to provide this.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Left Dmitry's Reviewed-by tag off since patch changed enough.

(no changes since v2)

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 include/drm/dp/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index 53d1e722f4de..0940c415db8c 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -2035,6 +2035,32 @@ struct drm_dp_aux {
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
 
+	/**
+	 * @wait_hpd_asserted: wait for HPD to be asserted
+	 *
+	 * This is mainly useful for eDP panels drivers to wait for an eDP
+	 * panel to finish powering on. This is an optional function.
+	 *
+	 * This function will efficiently wait for up to `wait_us` microseconds
+	 * for HPD to be asserted and might sleep.
+	 *
+	 * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
+	 * expired and HPD wasn't asserted. This function should not print
+	 * timeout errors to the log.
+	 *
+	 * The semantics of this function are designed to match the
+	 * readx_poll_timeout() function. That means a `wait_us` of 0 means
+	 * to wait forever. If you want to do a quick poll you could pass 1
+	 * for `wait_us`.
+	 *
+	 * NOTE: this function specifically reports the state of the HPD pin
+	 * that's associated with the DP AUX channel. This is different from
+	 * the HPD concept in much of the rest of DRM which is more about
+	 * physical presence of a display. For eDP, for instance, a display is
+	 * assumed always present even if the HPD pin is deasserted.
+	 */
+	int (*wait_hpd_asserted)(struct drm_dp_aux *aux, unsigned long wait_us);
+
 	/**
 	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
 	 */
-- 
2.36.0.rc0.470.gd361397f0d-goog

