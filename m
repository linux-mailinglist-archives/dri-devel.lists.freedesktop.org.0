Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD0B00A17
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 19:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A5710E232;
	Thu, 10 Jul 2025 17:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G9aOiE+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753CA10E232
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752169399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DyfQeplimHxaigWHPTIL8Brwr48uc1PFyqGCkna6oLc=;
 b=G9aOiE+0aYdrqX9IVdj0RI9mkJcww+CMqBn4zOgyCLp5SAWaoGqCqMEOIgCpTn3oNGlLxP
 kWs0VjRYqq9yAEh553svSBykp3HrGnFAyL/eiEnAJDfaNrm33mwMa+CgBuD0vhWiYUO23T
 8eExWt7xNup76N+bKzVbZy81XoiSaqc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-cNQj3SerM5-IhoujiXPwIA-1; Thu, 10 Jul 2025 13:43:18 -0400
X-MC-Unique: cNQj3SerM5-IhoujiXPwIA-1
X-Mimecast-MFC-AGG-ID: cNQj3SerM5-IhoujiXPwIA_1752169398
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a58813b591so24320301cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 10:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169398; x=1752774198;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyfQeplimHxaigWHPTIL8Brwr48uc1PFyqGCkna6oLc=;
 b=SnVlhumCF1c0cLgT/HFne8rzwMmL0DgKUKFIZMpBX4WF5x40iHF9gqjC/FYkxT2HJu
 389JkG1HkDZVl+SkdsBPdkbzVOjap3YeRM6N5PXjSBMHiwdOZDsORGLLvgAlIy8EG2N7
 k5nk8XXpvtX/ZkVwn608cMTDQKFZniQ/lJ7KiTAr47M7PkLBdeca5oyEyzA2FZlPluqd
 LNZKkGryUlymi7XolEQ3FAL5ECDBsNzjI9fx97vsimc+qbWFjqI4yQ0ZSLXlyg3qccVg
 pqZrl8NrGXR7UjoweNqBLmuUH+x2GP4LGFvuzojd9Zgyp+wlONnC5SFgPXIVfP8pDAhg
 3tpQ==
X-Gm-Message-State: AOJu0YywHnokuZPH/UqB6xklBnI4NtQY4bidDilipX3v0pjcZmU6ARYl
 lwe6e+FNsy+Z+f2cooAwuaDOT/GmR/bKr37T0H6KWD6ovEkfgrpsWBWuRxP7dr/zkQ3NYTMFfgQ
 he8ZJ9eeb6O2cpA8VoqSkaoV+Rdm6gwrF+eHEq2jE6arKL2m3k3S3AcDZtQuVQWlRWd/N5A==
X-Gm-Gg: ASbGnctW/dU/ENkThI73OZAkcg0iuml0O3SQUAYMd+b3v2BxFKcL313S1TLjKsJ0gFg
 BWi8TPwTcvsdkuEOFudCCZB08hXbyD5naVt6uu1mNxmNpMrgKY8FH/itKbu5UJQX9XSnO1gIj2w
 DH70cvNcq49RL7QY2TFlattSC0n1R2cJzH4YPgNJDWJHY9VoTnaIOPEEwMVUPVFFnyMjXbDikDk
 zCF17RGF2Y9g1MKtNTvhhUKgxro8BaQCGOcFGYhzForkhIjZg3HXvDiZCKnmwq54n4oYxnRbIcR
 de1MWCMIgZgCcNg9YT05ytGHdkWHqMMtFn41lMNDe/mwB2ftKlAUgt3kdRVK
X-Received: by 2002:a05:622a:2587:b0:4a7:944:9af6 with SMTP id
 d75a77b69052e-4a9e9bb2cb6mr64646061cf.3.1752169397598; 
 Thu, 10 Jul 2025 10:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzZd5sCbip5ZJYV/QhNlPWrkBJ+B+0jLvPSQhYSok5Gwj5HHCpjaKv310CLkZIEGxcJf2Gkg==
X-Received: by 2002:a05:622a:2587:b0:4a7:944:9af6 with SMTP id
 d75a77b69052e-4a9e9bb2cb6mr64645231cf.3.1752169397063; 
 Thu, 10 Jul 2025 10:43:17 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:43:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/9] drm: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 13:43:01 -0400
Message-Id: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKX7b2gC/x2M0QpAQBAAf0X7bOuQdH5FHs7dYsPRHlKXf3d5n
 KaZCIGEKUCbRRC6OfDuExR5BnY2fiJklxhKVdaqKRQ62dCuC8p+eYdiTsIhKa2tspVpIIWH0Mj
 PP+369/0AcAOnAmQAAAA=
X-Change-ID: 20250710-drm-clk-round-rate-b25099c0c3a7
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
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=5611;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vneJkQuL/Z9KZYxCdcdDpCorNOqE4VZX51RmlX/8Hik=;
 b=SpSyr0e3I/aRNxEswleY3osHpqJj9B58Sz5Gtf7aIsUZ1Ktyc0g084VrIsjKHpCXHyL9qqOiF
 ZRnFirWq0YVBiYQPmMMBH7RCwJ87s3PvceRTEkBR4y7+BkHAKJo5Jbj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XE8DqPb2FZPVLp6ZbItLuwlFJKCwtzDH2VAwC9vapug_1752169398
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      drm/msm/disp/mdp4/mdp4_lvds_pll: convert from round_rate() to determine_rate()
      drm/msm/hdmi_pll_8960: convert from round_rate() to determine_rate()
      drm/pl111: convert from round_rate() to determine_rate()
      drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate()
      drm/stm/lvds: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rate()

 drivers/gpu/drm/imx/ipuv3/imx-tve.c           | 17 ++++++++++-------
 drivers/gpu/drm/mcde/mcde_clk_div.c           | 13 ++++++++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 12 +++++++-----
 drivers/gpu/drm/pl111/pl111_display.c         | 13 ++++++++-----
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         | 14 ++++++++------
 drivers/gpu/drm/stm/lvds.c                    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c       | 18 ++++++++++--------
 9 files changed, 73 insertions(+), 51 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-clk-round-rate-b25099c0c3a7

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

