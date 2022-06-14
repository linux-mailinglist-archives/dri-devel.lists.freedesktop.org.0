Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B420854BD11
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF26112A52;
	Tue, 14 Jun 2022 21:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9AE1122CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:54:40 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so266466pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=65Y41kdawwG1n+2uI4rvZLnKQNlAIFaOOfNmllqQLv8=;
 b=EdN0uGZ3OZRMm5vATmxr2x7Q5Cqn1/DD3mCxrzY/7OzjM2t7U4pHdEYKoigjkl//R6
 6KHpMtFP09kwukqqwTCO+MB0yRbh6qqhSZDR3PUAKoMnDXxjd/G04PPSJ9tJa6HHQOHE
 Fps7YmaMWDzhf+p0hG/bCMP/LfAC/qOt3cNeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=65Y41kdawwG1n+2uI4rvZLnKQNlAIFaOOfNmllqQLv8=;
 b=rclPhQSTIP4U5XcT/j6nhLqhR9CqX8v5lwzWoNSsD2Emj4IP/NEMcSKkxY5mRLVy3O
 G1yqOmxDNnE9Hh+w6cOXGu5/nwnGJZmF97OB98xvZjgiZciNvmbDSOYP9dFK/K/jvVxP
 xFTqyoNXnxDxD5uv2no5Xgmf47JD7r9HbBTXH+GM2Nb6CP8TolaciAV57uQehQZzL8ma
 PVelh440mGroBKWglPOVPfQDglym3R4/cQSyAXqEimr0sXGobQm05vmBAa/BPRuFZvTY
 yqRP5QSGs8CCjDWMOpsm/uzQU+eSQSjBkwtOOb2+lstXeMBFLfvTFXOHtAynnj03pf36
 j1+Q==
X-Gm-Message-State: AJIora9Q6SvLnn/wxwGJsKm2dajrlQKwLUIdcmtKNdW9DD/k/6mHRxg5
 bZESRELdBUA7M/2+lMEJfaYPbfohiujk9Xrp
X-Google-Smtp-Source: AGRyM1uthElZF57fyUFL/+OiAZrcfH8RH/6cIit8YmMun/0EwOG0PbFroYO/GhXjJ2LU/4JIZrnS/w==
X-Received: by 2002:a17:902:ec84:b0:167:6f74:ba76 with SMTP id
 x4-20020a170902ec8400b001676f74ba76mr6121089plg.17.1655243680141; 
 Tue, 14 Jun 2022 14:54:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f355:be2d:74b7:3c7c])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a646cbsm7668968pli.218.2022.06.14.14.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:54:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
Date: Tue, 14 Jun 2022 14:54:15 -0700
Message-Id: <20220614145327.v4.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614215418.910948-1-dianders@chromium.org>
References: <20220614215418.910948-1-dianders@chromium.org>
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
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes in v4:
- Comments now explain that we may wait longer due to debouncing.
- Rebased to handle the fact that the stuct moved files.

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

 include/drm/display/drm_dp_helper.h | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index c5f8f45511ed..db0fe9f8a612 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -389,6 +389,36 @@ struct drm_dp_aux {
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
 
+	/**
+	 * @wait_hpd_asserted: wait for HPD to be asserted
+	 *
+	 * This is mainly useful for eDP panels drivers to wait for an eDP
+	 * panel to finish powering on. This is an optional function.
+	 *
+	 * This function will efficiently wait for the HPD signal to be
+	 * asserted. The `wait_us` parameter that is passed in says that we
+	 * know that the HPD signal is expected to be asserted within `wait_us`
+	 * microseconds. This function could wait for longer than `wait_us` if
+	 * the logic in the DP controller has a long debouncing time. The
+	 * important thing is that if this function returns success that the
+	 * DP controller is ready to send AUX transactions.
+	 *
+	 * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
+	 * expired and HPD wasn't asserted. This function should not print
+	 * timeout errors to the log.
+	 *
+	 * The semantics of this function are designed to match the
+	 * readx_poll_timeout() function. That means a `wait_us` of 0 means
+	 * to wait forever. Like readx_poll_timeout(), this function may sleep.
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
2.36.1.476.g0c4daa206d-goog

