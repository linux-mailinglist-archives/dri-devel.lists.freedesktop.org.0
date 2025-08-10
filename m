Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DAB1FCDE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 00:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11FE10E2CA;
	Sun, 10 Aug 2025 22:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Eqisef1s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79CC10E2C3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 22:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754866659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=si0D3G2RgusoFtCAx5lqtxcOAXD0FY3ZlF3b+krcW9c=;
 b=Eqisef1s3HcQ3VxWLQ+wDNV8TE3FIuR5ct99NwX96Eo93wCEcw2fGwgk0U0Q2magKs/ze/
 hF4wkaOVyl4AmZ/u5oXChGRIKi8smeYCqscLj/EdeprnBXmX4KrfYevdNqNWHRWYjoUlvy
 iBikhU6jlKjujBjG377CPWmfUDwGFy8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-8xQt14IOOyeohYOZEY6dlg-1; Sun, 10 Aug 2025 18:57:38 -0400
X-MC-Unique: 8xQt14IOOyeohYOZEY6dlg-1
X-Mimecast-MFC-AGG-ID: 8xQt14IOOyeohYOZEY6dlg_1754866658
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70771983a52so83233876d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 15:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754866658; x=1755471458;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=si0D3G2RgusoFtCAx5lqtxcOAXD0FY3ZlF3b+krcW9c=;
 b=iDfq9sUusjHXHHwaFaIIYZB5pbkDWtPXI0FXAyQ2oq6Nw2L8aGVn99Zy8+dYiDV+zN
 XVgUOC/aOJuFaQqu9Lp+SDCffPhUG/oiNhlttdOEr4gVd6JLo7dB4P9/8c6sgjrOTdVn
 WIPNRi7qKJxl4EIWd7sjBBXcOkZtavTMPrFKI7QbjV+Py4TYMC4+O0ZxhUFbxfpS+pw0
 Wl1Laloqc1CApE8QKhS50psGWf93lnhZFwrJBueWGpeEfMjCGMLYrC6ItEb+W/H+GU8h
 11t/wHCrBlNcFMPccOPd2fhjIVDnUT9gmqf4vnnl8CiGwO1ETe3PGoqmoqq5h+Ts+YGM
 PpEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5GuKbl1LNmsW4bk6hMVUzwdJ5L4P/cnaJovvK1tx9MXaqD7QK6WlTPtLFd2+7EHMGNzSoqP/Q+9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqZDf0Ipo2rG9X7n00lnaF+xsw9YiS8K+Vx0tcPix1JVLGX8Ym
 5kpE6zZIIfmkOMopfUuPib7wT0YfIB6sZ2X+tXJdXpHwC4Hq4Dvq2S/QICebspPFlncv6D7KHOY
 jzSukfXGR+sECZDtodboJknxt2iTAe+jdDtWlwMo6s8WflwAvkHMhxWbquHZD5XSGWnJxdA==
X-Gm-Gg: ASbGncvKvX54RXLvjp4dzRbK4xLd34M8xIYn1pkrHTQUgqfkTd8dInvvti/uigolnKy
 ixLnPhovVfHFODru+4hKVnuT9OJWWehB8Y7ZS0KsgkAixK+O23f/OQZ3TZvIYu/KY1grctog+Gl
 3XhZLZ1yW4Vvxy+YscjIoW4pxvWXnGC/ZvFde2HmvbMYEPIeqCfTUk4Sm1EOKVsEzhbs3AyQckp
 +LDkFi90AhIarLgqEpwZjKEExzIhKuJfi4PfWuVRSl5zJihDajE3R1sjESgjscQIuPZozQABnXf
 oAihLo9N4gFfqqUXv1F/ML6c7KVNf415Z3tPRiXy+e9pltRjOJjGrrLBHfhhnYcvTSktW+1unmu
 wvKyhQA==
X-Received: by 2002:a05:6214:20a7:b0:707:3a96:9f08 with SMTP id
 6a1803df08f44-7099a2848a5mr126872696d6.8.1754866657764; 
 Sun, 10 Aug 2025 15:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAbaldZwTwU3XZPCaVO+4i58d5gxtzTBKTXlOSCBQfI10ooKRZRe4bhUtMWpYbhTRna4XCCA==
X-Received: by 2002:a05:6214:20a7:b0:707:3a96:9f08 with SMTP id
 6a1803df08f44-7099a2848a5mr126872486d6.8.1754866657289; 
 Sun, 10 Aug 2025 15:57:37 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 15:57:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Date: Sun, 10 Aug 2025 18:57:24 -0400
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANUjmWgC/x3MQQqEMAwAwK9IzgZiUZT9injQNmpwWyXdFUX8u
 8XjXOaCyCoc4ZNdoLxLlDUkmDwDO/dhYhSXDIZMRXVB6NSjjx63+UT7XVDXf3Co/Y/R2qEgV5X
 cUAkp2JRHOd687e77AXsMTxNsAAAA
X-Change-ID: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=5434;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JaAY31vIHr1AnR/PdVT7SbRgepffO5uQ0Q3tUmIzuWo=;
 b=T0+/U/eBiA9HzCRQ0vS4+nTHalxsy65T1JSQ6j2JLt0YaV2vLDByc8I4BgMY9dbmNykIg2GZ8
 uMp+tXTTXzVAuSsFHzyiJCG0P6pxr7XlGyf4MT0JtKXE2za244ubNig
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3JbojTMKkqqd905AU93hLW0YdvP8c3INVD1-8w8dFOk_1754866658
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
drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
patch posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v1:
- Converted over to use clamp_t() (Konrad)

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
Brian Masney (7):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 16 +++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 34 ++++++++++++-------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 21 ++++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 +++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 16 +++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        | 16 +++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c        | 16 +++++-------
 7 files changed, 69 insertions(+), 82 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

