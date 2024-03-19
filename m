Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBB880482
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 19:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEAB10E422;
	Tue, 19 Mar 2024 18:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bzCS58vI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27E10E422
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:15:06 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e6082eab17so5150163b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710872105; x=1711476905;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KcaIci4ngfZq5XN/VP6t9YI7Rpj+hyL5AivE9QQ6SzY=;
 b=bzCS58vIfTBpZSiSJL0RWUKr/E3eMXo0ieNP1ekcbyaBFE1y4v0skxMPSxRGYDw+NL
 ltnTdqg6spQPgUNsJLxTP0XnkxyhcVVxkJXtBAvV6RqbSw2FAlYszpsp9YCfGGUA2vbe
 cobrMhIbOVJseRsWUKQR28cWe6p6XiKp4ywnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710872105; x=1711476905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KcaIci4ngfZq5XN/VP6t9YI7Rpj+hyL5AivE9QQ6SzY=;
 b=XXdBAi1hPZU6+Aqf5whGQjBxD5kBxFhMMVVzBrmb5YBEJkrRIqg2UM3sl62GLP0Wpq
 ZaWu4xv8vYc8LlSq/KIk3oVxYDh9OKm9LqCkB6wCXwo6M2SnexKaiql8bodVwEceP1h2
 XrcF4UgYqswId2r8casP4fOlBURdhB2ul3HybaeO8DmpfdRn2KA+h/IJ5pbfDXnD88lX
 v6MUSoGz0SxuQMChc+RIcbcdbJsJA9tUvGtJGiweLaiUT6Y/g1afS9DzxZ9HPI2UDZAw
 P1KGfDmxC/EjG+c3DUCEOuzVcCR+9n0kCbYYeY7kgV/w+NNHNEaq093gR4it5k6Dxqzq
 43uw==
X-Gm-Message-State: AOJu0YwpHh84WGMB1yERmyr/EPa3InqT/O1QL84CNPNvyBkHhVB/WpKw
 wWTyEW+jlTKmeD2TKrB207fYeGcaHMrsD4DWqyXfncSkBlNbzWwUA1OZWe4+T7rMnJIfnolVF+4
 =
X-Google-Smtp-Source: AGHT+IEs6V5enK1CZTIHXPiZ4R0PlFu96HG0HOwGdMnSOtSkC4CyugyccnZjk5x2k8W9wrz8gR8SPg==
X-Received: by 2002:a05:6a20:1594:b0:1a3:6817:1b02 with SMTP id
 h20-20020a056a20159400b001a368171b02mr5885140pzj.55.1710872105015; 
 Tue, 19 Mar 2024 11:15:05 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f4b6:c22b:c130:6c79])
 by smtp.gmail.com with ESMTPSA id
 by24-20020a056a02059800b005e49bf50ff9sm8176006pgb.0.2024.03.19.11.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 11:15:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional for
 panels
Date: Tue, 19 Mar 2024 11:14:35 -0700
Message-ID: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
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

In response to my patch removing the "wait for HPD" logic at the
beginning of the MSM DP transfer() callback [1], we had some debate
about what the "This is an optional function" meant in the
documentation of the wait_hpd_asserted() callback. Let's clarify.

As talked about in the MSM DP patch [1], before wait_hpd_asserted()
was introduced there was no great way for panel drivers to wait for
HPD in the case that the "built-in" HPD signal was used. Panel drivers
could only wait for HPD if a GPIO was used. At the time, we ended up
just saying that if we were using the "built-in" HPD signal that DP
AUX controllers needed to wait for HPD themselves at the beginning of
their transfer() callback. The fact that the wait for HPD at the
beginning of transfer() was awkward/problematic was the whole reason
wait_hpd_asserted() was added.

Let's make it obvious that if a DP AUX controller implements
wait_hpd_asserted() that they don't need a loop waiting for HPD at the
start of their transfer() function. We'll still allow DP controllers
to work the old way but mark it as deprecated.

[1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I would consider changing the docs to say that implementing
wait_hpd_asserted() is actually _required_ for any DP controllers that
want to support eDP panels parented on the DP AUX bus. The issue is
that one DP controller (tegra/dpaux.c, found by looking for those that
include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
this work on tegra since I also don't see any delay loop for HPD in
tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
optional and described the old/deprecated way things used to work
before wait_hpd_asserted().

 include/drm/display/drm_dp_helper.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a62fcd051d4d..b170efa1f5d2 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -422,7 +422,13 @@ struct drm_dp_aux {
 	 * @wait_hpd_asserted: wait for HPD to be asserted
 	 *
 	 * This is mainly useful for eDP panels drivers to wait for an eDP
-	 * panel to finish powering on. This is an optional function.
+	 * panel to finish powering on. It is optional for DP AUX controllers
+	 * to implement this function but required for DP AUX endpoints (panel
+	 * drivers) to call it after powering up but before doing AUX transfers.
+	 * If a DP AUX controller does not implement this function then it
+	 * may still support eDP panels that use the AUX controller's built-in
+	 * HPD signal by implementing a long wait for HPD in the transfer()
+	 * callback, though this is deprecated.
 	 *
 	 * This function will efficiently wait for the HPD signal to be
 	 * asserted. The `wait_us` parameter that is passed in says that we
-- 
2.44.0.291.gc1ea87d7ee-goog

