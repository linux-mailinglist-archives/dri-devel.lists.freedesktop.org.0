Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC261379E47
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAF6E9AE;
	Tue, 11 May 2021 04:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9266E9B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:20:55 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 p6-20020a4adc060000b02901f9a8fc324fso3950220oov.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcpXm0EDMnP4dra5e7iyBpiH9cJegx8S0SHhpEQspRs=;
 b=uy35xOt8NlWv2bH/rJeOkeWy/DdvsU2ILjJHieExX+E824ktjTUD7GWuxkWugIEz0Z
 SrasuBXe/RGJ+jckNzWj9U5MNJmIWcn4NvHz1ym51cvjVK6SpYTKkUD7o7yGfnrGxQ7f
 RnWNPOZofts9QPo6ptIIQR7wZ363rAPgox9S8upKUJKJMLxwFu5/FPMh/1QUw8rNZt04
 kEEwUeM+XWuD+NjZ/8Gdq29/fc5Mfhb9wtpAWZgex1pGtmpoNSTJpehdIejYTureT4iG
 ipeO67SMP3v99f8j+K+PerjxbCPOJzAG4DymV4lo3KwY4RcUKuvWfNbaufRtk3xjxVrL
 W76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcpXm0EDMnP4dra5e7iyBpiH9cJegx8S0SHhpEQspRs=;
 b=U5xZDlpDe8h4cQvbi0F0z3HqoEHH02ElcRdbUdzu/hFNUDPnlOSPhO59gxW8GcV4ZN
 vAcz2CRXnvoa06G2QfIUwQ6mMa0jMuWmL9/ldmqPVZDCzQsJsUekswORk1HeGqhtZuFQ
 LIuaC7Uy6k4VMqS7HmB3I01tFzL+dd0Sw0V9yJJlTgQOECV3LMhHtqflCiaCKvdgwNB4
 P2k+WaMjh+L6oxNkimd8E7C3n1N5mIb8xzVhGCzCQryOwcfGUFS+M5emv8WvMHoXGsYm
 Hgnvxd0ydphNMw4+6HRK+MroRVZPn1+VgRaFw7Lj24K2hxr4Z3vcL9B1vdATwe+UkVTP
 kZOA==
X-Gm-Message-State: AOAM530cs0Fm1FOwGPO+Rcs63cXx8UItPbr/5poFIUOpYFDvJxPOMxHT
 Ls/x8mNbCU+Q+Cj2psSoOd8a8Q==
X-Google-Smtp-Source: ABdhPJxPDNuwbdGnwtO2yQGR4GWIYkcmFFbdGXCWFAxp71xpPhzuxeiakHDyAlIwTunkimpw7dpLTg==
X-Received: by 2002:a4a:b102:: with SMTP id a2mr21819330ooo.30.1620706854521; 
 Mon, 10 May 2021 21:20:54 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id r124sm3042294oig.38.2021.05.10.21.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:20:54 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org
Subject: [PATCH 1/4] drm/msm/dp: Simplify the mvid/nvid calculation
Date: Mon, 10 May 2021 23:20:40 -0500
Message-Id: <20210511042043.592802-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the search for causes to timing issues seen during implementation of
eDP support for SC8180x a fair amount of time was spent concluding why
the calculated mvid/nvid values where wrong.

The overall conclusion is that the ratio of MVID/NVID describes, and
should match, the ratio between the pixel and link clock.

Downstream this calculation reads the M and N values off the pixel clock
straight from DISP_CC and are then adjusted based on knowledge of how
the link and vco_div (parent of the pixel clock) are derrived from the
common VCO.

While upstreaming, and then extracting the PHY driver, the resulting
function performs the following steps:

1) Adjust the passed link rate based on the VCO divider used in the PHY
   driver, and multiply this by 10 based on the link rate divider.
2) Pick reasonable choices of M and N, by calculating the ratio between
   this new clock and the pixel clock.
3) Subtract M from N and flip the bits, to match the encoding of the N
   register in DISP_CC.
4) Flip the bits of N and add M, to get the value of N back.
5) Multiply M with 5, per the documentation.
6) Scale the values such that N is close to 0x8000 (or larger)
7) Multply M with 2 or 3 depending on the link rate of HBR2 or HBR3.

Presumably step 3) was added to provide step 4) with expected input, so
the two cancel each other out. The factor of 10 from step 1) goes into
the denominator and is partially cancelled by the 5 in the numerator in
step 5), resulting in step 7) simply cancelling out step 1).

Left is the code that finds the ratio between the two arguments, scaled
to keep the denominator close to or larger than 0x8000. And this is our
mvid/nvid pair.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 41 +++++------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b1a9b1b98f5f..2eb37ee48e42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -415,39 +415,16 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					u32 rate, u32 stream_rate_khz,
 					bool fixed_nvid)
 {
-	u32 pixel_m, pixel_n;
-	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
 	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
-	u32 const link_rate_hbr2 = 540000;
-	u32 const link_rate_hbr3 = 810000;
-	unsigned long den, num;
-
+	unsigned long mvid, nvid;
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
 
-	if (rate == link_rate_hbr3)
-		pixel_div = 6;
-	else if (rate == 1620000 || rate == 270000)
-		pixel_div = 2;
-	else if (rate == link_rate_hbr2)
-		pixel_div = 4;
-	else
-		DRM_ERROR("Invalid pixel mux divider\n");
-
-	dispcc_input_rate = (rate * 10) / pixel_div;
-
-	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
-			(unsigned long)(1 << 16) - 1,
-			(unsigned long)(1 << 16) - 1, &den, &num);
-
-	den = ~(den - num);
-	den = den & 0xFFFF;
-	pixel_m = num;
-	pixel_n = den;
-
-	mvid = (pixel_m & 0xFFFF) * 5;
-	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
+	rational_best_approximation(stream_rate_khz, rate,
+				    (1 << 16) - 1, (1 << 16) - 1,
+				    &mvid, &nvid);
 
+	/* Adjust values so that nvid is close to DP_LINK_CONSTANT_N_VALUE */
 	if (nvid < nvid_fixed) {
 		u32 temp;
 
@@ -456,13 +433,7 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 		nvid = temp;
 	}
 
-	if (link_rate_hbr2 == rate)
-		nvid *= 2;
-
-	if (link_rate_hbr3 == rate)
-		nvid *= 3;
-
-	DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
+	DRM_DEBUG_DP("mvid=0x%lx, nvid=0x%lx\n", mvid, nvid);
 	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
 	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
-- 
2.29.2

