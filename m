Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D563D4FA1C0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A76210E209;
	Sat,  9 Apr 2022 02:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415910E226
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:10 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so11364337pjy.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fymhEmFv/O8Tuh2GeqHqqsiXL5aZG/ohxN9zZ7IUhcE=;
 b=i+Scf6wXGKJdppgcWPtk6/VxfqcDhX6IxbHqkMo9S9/gnqJfZJZ/jFMAnhpL7M2Qx0
 eVfB4+aLpgVl0JDgirYwZ4r2JL2A6MM6//5/GgcKMkp63LMC3g2r6AxLsfiILIhWsl4P
 HA7k1MrDAfJlFt/ATY9UBfp4U4kxIIca89fAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fymhEmFv/O8Tuh2GeqHqqsiXL5aZG/ohxN9zZ7IUhcE=;
 b=GfHfwaGSauLJnEcaMLd67Bv9YQciLek+K8Y3sE2hs8mvD0SbiwA/XOSoutUlcstf0T
 jtcHkLqJuVcJWun5rlp+WvmHYc+I3naeE6UhY5nP1vNTw5/Fmq/H2JvrZCeuRu2lQraf
 c0+59nrAPzWoKdgWCXKTUDanDGTyhrqgIVNQ9YGz7stZIvw3Gp63I3GcZ99tUxVcSarV
 5LRM0XY9CZ4nXqoNrwN6LG6TKEsRfBbPMl1wQ8Bk9S7K9iY2VFotTggjlMIIZUMAmHfe
 6R57ZY9BZx/RPA80kyyZkh5XsjDJfGBXc3CFBjAk72+gNOZUcPcXgHpbs3fyNz2UunLY
 cw3A==
X-Gm-Message-State: AOAM532xRBH/ZxV+Ek2uKm5jx9TYYxlyMRAA/FkYuhvrkt96rBswL6Ea
 iKe+u1LBvwlEH1zxb55D3lBs2hUSSnxYZTcL/q/4fQ==
X-Google-Smtp-Source: ABdhPJy7nNxWCXeW3m5jAZNd2k2Rh17DkzCXweSCpmeLDWahQW5YDzra5ADMhXthsjGqsE/I0/FyMQ==
X-Received: by 2002:a17:902:f652:b0:156:701b:9a2a with SMTP id
 m18-20020a170902f65200b00156701b9a2amr22122893plg.14.1649471830116; 
 Fri, 08 Apr 2022 19:37:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/6] drm/dp: Add is_hpd_asserted() callback to struct
 drm_dp_aux
Date: Fri,  8 Apr 2022 19:36:25 -0700
Message-Id: <20220408193536.RFC.3.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
In-Reply-To: <20220409023628.2104952-1-dianders@chromium.org>
References: <20220409023628.2104952-1-dianders@chromium.org>
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

 include/drm/dp/drm_dp_helper.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
index dad1442c91df..a12951319573 100644
--- a/include/drm/dp/drm_dp_helper.h
+++ b/include/drm/dp/drm_dp_helper.h
@@ -2021,6 +2021,20 @@ struct drm_dp_aux {
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
 
+	/**
+	 * @is_hpd_asserted: returns true if HPD is asserted
+	 *
+	 * This is mainly useful for eDP panels drivers to query whether
+	 * an eDP panel has finished powering on. This is an optional function.
+	 *
+	 * NOTE: this function specifically reports the state of the HPD pin
+	 * that's associated with the DP AUX channel. This is different from
+	 * the HPD concept in much of the rest of DRM which is more about
+	 * physical presence of a display. For eDP, for instance, a display is
+	 * assumed always present even if the HPD pin is deasserted.
+	 */
+	bool (*is_hpd_asserted)(struct drm_dp_aux *aux);
+
 	/**
 	 * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
 	 */
-- 
2.35.1.1178.g4f1659d476-goog

