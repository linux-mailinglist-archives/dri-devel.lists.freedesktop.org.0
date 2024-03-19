Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E49880656
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 21:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EE710E98C;
	Tue, 19 Mar 2024 20:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P+cDb2eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164CC10E98F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 20:58:53 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1e04ac200a6so2475105ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710881932; x=1711486732;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yvO6Pb0Q30VcXTFiNcwxiPMuBmsILWnZccwRus/VuqA=;
 b=P+cDb2eFNKhiVdyjhpW1SHTKtOh1YNTiaQt5LxVNTdGr0fAI98Zpv+uxzXgNbUHIYr
 xBh4Clcu1WQe9Y7vZ0PmJ4zKd50rgSTolmNyI3KX/+Ty2+Ff26CzRRbOE0xJH/EtAc70
 PWZnqLrjRMpWyBUEGKApg2Ao5mKwgDjjlBgA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710881932; x=1711486732;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yvO6Pb0Q30VcXTFiNcwxiPMuBmsILWnZccwRus/VuqA=;
 b=FeiEGL95/lgEwg3YhkDBpyFnQ8C3VdSX/fx2OpEgmIXkOQnWge7xHtrEo79+f4Xlt7
 +s63J86NWe9bzVanyIgEVi5aAjrVfNlA+iofDhBZWSqWz2hLsVDPjhycafRKzWBN3YC1
 +n9Gll48384z8k3Xc62RRsiFRwsyxpPjJ7MDP33klyvSwQsH+XgTrdf2F7pqihitko+0
 EZBz24Dqx9mSxTW4+AkWjWa1TZhEFcCf6imxDu84jEsIo3Y+Y4/V009f7mtxP7eVlc0C
 4u6/PzmuWPqziiwfGW1zn7ymU6fMBVoIiIMeuqiT/ya5mj4w4R77bNRIKSHO9KQf4KJx
 vMdw==
X-Gm-Message-State: AOJu0YyU1d6z83OMXxStQSftxx3rfXetK7335EvI3TstjTYOVLx9HRWW
 lnO9ep/9hLcU83MsNvRZ/Zqu5m7d/5lHtKw8JeqHugw/vgktAabAVlLqmRWq6m2lkKMHmkbDdEw
 =
X-Google-Smtp-Source: AGHT+IGaxQlsWiVI/mJV/nB+Mp2IICAlnHIViegR1Fkm5V0vh3BgrBRwfRrC08WiUB3qWRSrGBNuQA==
X-Received: by 2002:a17:903:234f:b0:1df:f818:8936 with SMTP id
 c15-20020a170903234f00b001dff8188936mr836476plh.21.1710881932430; 
 Tue, 19 Mar 2024 13:58:52 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f4b6:c22b:c130:6c79])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a170903018600b001dde2c3fea5sm11800110plg.50.2024.03.19.13.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 13:58:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Imre Deak <imre.deak@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
Date: Tue, 19 Mar 2024 13:58:39 -0700
Message-ID: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

Changes in v2:
- Make it clear that panels don't need to call if HPD is a GPIO.

 include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a62fcd051d4d..6c6a96496df6 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -422,7 +422,18 @@ struct drm_dp_aux {
 	 * @wait_hpd_asserted: wait for HPD to be asserted
 	 *
 	 * This is mainly useful for eDP panels drivers to wait for an eDP
-	 * panel to finish powering on. This is an optional function.
+	 * panel to finish powering on. It is optional for DP AUX controllers
+	 * to implement this function. It is required for DP AUX endpoints
+	 * (panel drivers) to call this function after powering up but before
+	 * doing AUX transfers unless the DP AUX endpoint driver knows that
+	 * we're not using the AUX controller's HPD. One example of the panel
+	 * driver not needing to call this is if HPD is hooked up to a GPIO
+	 * that the panel driver can read directly.
+	 *
+	 * If a DP AUX controller does not implement this function then it
+	 * may still support eDP panels that use the AUX controller's built-in
+	 * HPD signal by implementing a long wait for HPD in the transfer()
+	 * callback, though this is deprecated.
 	 *
 	 * This function will efficiently wait for the HPD signal to be
 	 * asserted. The `wait_us` parameter that is passed in says that we
-- 
2.44.0.291.gc1ea87d7ee-goog

