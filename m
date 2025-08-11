Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE7B20693
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4D210E445;
	Mon, 11 Aug 2025 10:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bsRobUNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C1D10E447
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754909812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
 b=bsRobUNi+O3o2H/ZL0/A6U4KesyyYlY5L+fwjihfCgRJ14lU1BmvK1libdUQLbP2mYLSK7
 +9wrxAxXo/KxkmgzfCYPe2V214MV23HrSu/Xi+KbVSzPocekiVm3E3tccRewwL1MMHIuSt
 aGH6fG3izkLrRpw0ixbMU5XMwnynwSs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-AMMncsaDO7KnyWjipYWrKA-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: AMMncsaDO7KnyWjipYWrKA-1
X-Mimecast-MFC-AGG-ID: AMMncsaDO7KnyWjipYWrKA_1754909808
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so971949685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754909808; x=1755514608;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
 b=cF5LHCOrbguIo5xGtLQg6S0TAZHr3iln5fwAUtKdUGkxdU8hfNriD5uOzzu5GkQg8U
 VTYL9mD6P0CCR8pniDgPCymIJ2hZT2Ny5EsJIwkpBz01MmHDVtq8AAU2JfKxAtfn6zSC
 BYlNlKlDh7wcmLBAz95B0onyc5uYhGKCpEwbYlVTIeCW7jXw3uBFyIt86Abcbh6L+TmV
 sfQDYaHN5zrA4EZ68cHnIqt0aJTqqRlY0zVSMkC48+tdfJkYCkzBz4pif6mUHa9E5HBm
 ZUv2wEwhX3UljJmWU+M8pBVNLOAxsDVwrM4Is88vrLYKokY5dLX/TtYfhmoB1fWnem+M
 071w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZee9ToDHVf7hiso3RCsj6zHBD0yEJXZBAW8gWo47Q6Dc/mlqh7kAgTQ1zPOOfWr5VrWv2OVsuk0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysGu310MWI+4zntCjNiN40o+LyE0oc6pz5+GJLHEH/GGRDIo5p
 xPYxG3KWtlz82as2TL+73P8yTum+XXKcH6hnU9VmkhVCpDJWdSe8bH4TBP5ElOeQbzabCijuxLa
 M91N5wkWmRUgUaaR9M+m23N4jHuPef8WNQjf/oylSy74JUnJDgGCTibcapTPSMpTGJOUdxg==
X-Gm-Gg: ASbGncsINm37XQb4Y0Y+ux8fhNMH8AL8BWeWWa6znpZDR7vYEobYPh6M0Ieen26v99+
 VxDmTtmMDu+qcdZHWmYiLe8MUVcJpzfprky+OHU+Y5WSZCquiC4IxLxlg3IIa2oA2qmFqrho/+W
 LFdFse/2N/ctl8YDAzExB7ytu4j5rEmCTsurFNvsBYZPrI1ciCSoWMaaYE8TZ5s6fVD3vdKAt1o
 2jUgO/5ccqqQKjuX4D0sFI2qR4eQ9xCuKEsQDZrMEvSL7WFT1/gFuNXy8Yldi8jlshAC+OoctCT
 STKhE13tdfVkhA6puW2aIR269BhRf5e4v3DjRCEWPeg27RDQqvFe6tdSt+5rw99c0Wg9jPf/7TH
 QKcE=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id
 af79cd13be357-7e82c75b89cmr1125686385a.34.1754909808550; 
 Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id
 af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062; 
 Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dxxi-dcoaMt0yF29dIkmttehn6DmQdFdc36farVpiWM_1754909808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.1

