Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A0505D2D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 18:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF6910E275;
	Mon, 18 Apr 2022 16:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C810E272
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 16:58:35 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so1059174pjf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 09:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6oixKBcCsCGFR4aUQt/tdt+p4qsIdjpTUDNTqLJ+UgM=;
 b=DsxdfJZZnKidzVPkjEN8yyUDWjCsJqByNG9+TdHU4o42WMmxNPH8Yp36mIV/daIscW
 7cNxu8SvonrXTSDpOOOipLirQYrOlf16tNmZ0+vxdb/wGZXfxZA404ipdOazg3I/OkrM
 0+zvrl6X1pFZbr0+SitCe57qkBRmdQco5No2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6oixKBcCsCGFR4aUQt/tdt+p4qsIdjpTUDNTqLJ+UgM=;
 b=oiXsXChJppMjtZjFJkMBBlpuq9Hz9sT4/gY7sTUq2NhGZfLa+tAPNE4YWS9iRgV556
 HrjepNs9M1M0KGuntjFXTMG89IB3C1Qv5NhAagT1gKYL8+qRvliTFPPwwWHJv26ZbF28
 030F3oxB72k9AYqZGD3Uu8+oUIyIT17SwNin6kg3vl6gCPWKRBK+iUclI1isWBeI7+Mm
 cJD3lhfhmrbR5S6mAZdLwMKgJwx7ezcgH9mv9RnRzSY9lvygfI+41ztKPi6Ror+3dGrr
 nhDVc2DG86g7TMJjYuqWjwS5h95de8gYUG2sxu/HsFQHZrQAkyBriBSCmOzJlDiWaXS7
 iSvQ==
X-Gm-Message-State: AOAM533DaKzyuaL9tyBJ+nWQFfGUXLKxDT13cy0ZMwqZ3SrhcppP31AU
 gAsNnNRUyxfQ/7F5MRKkkik5XE2/Bl7tF0od
X-Google-Smtp-Source: ABdhPJw5Ni08pwShHanj9IT5Yn5mjBegsZi5inslW8DtFVC0iBkiQhglSWrJEcEEcbje89EQVRuy/A==
X-Received: by 2002:a17:902:70c8:b0:156:509b:68e3 with SMTP id
 l8-20020a17090270c800b00156509b68e3mr11594454plt.113.1650301114799; 
 Mon, 18 Apr 2022 09:58:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a150800b001cbaf536a3esm17700980pja.18.2022.04.18.09.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:58:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
Date: Mon, 18 Apr 2022 09:56:39 -0700
Message-Id: <20220418095557.v2.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220418165642.2218514-1-dianders@chromium.org>
References: <20220418165642.2218514-1-dianders@chromium.org>
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

