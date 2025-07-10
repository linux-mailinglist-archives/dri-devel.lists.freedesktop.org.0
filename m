Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B56B00888
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231E510E231;
	Thu, 10 Jul 2025 16:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OXkkWxxI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3196A10E231
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
 b=OXkkWxxInpu+xJG19bN9XPKvft9oMZlX9jgxOwkGu8NODUqHomdfIGiDLt/kmm+BKV0p0r
 ypqQtjaPVnFY9JZSU6I/f524ba68Wmh6C56PYGGCoe7Mfs8+aIvwLJsMi0Lx91v3R1ayHW
 v31Qs+DBrM/qOtdxmUUvciN/oYTkA1Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-2SCWWoL6MdKrEDFqvQPGRA-1; Thu, 10 Jul 2025 12:27:47 -0400
X-MC-Unique: 2SCWWoL6MdKrEDFqvQPGRA-1
X-Mimecast-MFC-AGG-ID: 2SCWWoL6MdKrEDFqvQPGRA_1752164866
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d15c975968so179279085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164866; x=1752769666;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
 b=Zw36gQdEWglPUEUI8jOPkyL1ZecQbf5tjOvwWOYyUlsBDpigruAWb8SNQgpj9vlIiT
 EMnqqz/npy40PzusFe6UEk8LunCeH1o10kE8kGMusDOQF5kP6dgxqhFxUFxOVcHjubqo
 MHnXYA3TJKCYyy6Xw2L64PdU+tobh4bjP6pW6+OPoE1BISjtWYtylOW1MymW3IrkuHT4
 MpZRH8CWr9qahj7gLZNXizjKiwlr+tswLK/1jmBXsLM5SY+e92gvK9HuwcWk1D0sduq1
 aXLZzS3EW6eZMuo2GSFrMjCy7Yy8rEFLueQjEKbmzcy/p6OPR09nUfzgex46t3vfPi+6
 rWWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzvkY5hiDstTPCfB+51IF4C9alCgU0NiWUGvL/Rf/M245hkxd/xpaLtszZDoR6deOLs3t8LB1O19U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbCnj/4Pyhsm1Qkbr1OvLIwEmJHj+JoJlNCB0h9pUjpBRB9ELU
 ZBeRy5c43FDG2R6w5uRYLJw45HYuD+3QpxTgdhJf/PM/vSV82uVQxa0OrZSysg1UcBUGKJ3Vn3h
 Z8ZzASxU7J8V403X93eBhZRfU8EUNPUUFAAhE5vuJ+Sc+Ul6jJ88zMW4PoRNBb27jbOBZvA==
X-Gm-Gg: ASbGncuCJCyG9Yexud2muk45ShyegC5NDkjcpcQ54wLCCg+j42u+fVeqBE0zjuQzzsf
 A1jwWzNaSOXDs/fTIm7F7F9tBnycytvrCQg3wFc8se3cF1JRCM8fSJAkspkFfOuFsO52rRABSv2
 N5QnlOsEcGxPi56r2ffy9bl1HqH2TdkD0sRGrwrk0MKZG0AObBecoEz+OKB8aF7QI10vmQqr31B
 XwFKl4aHnv8kDORxngqwEDmS5vVyyMoWluwqexIdHb8Rst7eQfTYiwhu4RQF6SeLo2JFZjFYFD1
 uKXovP2HEev0UI9MWy4XBcV7/o9lcFEzUTE1sn+oXBEe9KjpB0sYrt+L4TPm
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7ddecc1d5a2mr17535285a.42.1752164866481; 
 Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27LfFDrGnMnfhyfHCbnzrSuLJo3IShFntK9oUyUSQ7N0TE7WAmGfbfKdAyUi+8fKCbP099g==
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7ddecc1d5a2mr17531485a.42.1752164866037; 
 Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 12:27:26 -0400
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO7pb2gC/x3MwQqDMAwA0F8pOS+QiuLwV8YOtc00zFZJVRTx3
 1d2fJd3QWYVztCZC5R3yTKnAvsw4EeXBkYJxVBR1VBrCYNGjDniMp7opy/qvKWA6lZG73tLoan
 5STWUYFH+yPHPX+/7/gEq7Uv9bAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=5373;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
 b=IyDjRecZ8lmUveDSl1A/ekKcgnVDZWOm0cbVtunJ0Yg60K87JgqJbB99cAFDWIE1Ws5cFuS4G
 SGQmD+wl6KeCcggSryEiIu7SICeBclsasH4oDapkP9eAZ8fGGn/ww3M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LekJv3MsylQ8SfxKnqpe_gTpPFPf2BuCZ5-1TNfX1HY_1752164866
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

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 18 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 36 +++++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 22 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 ++++++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 18 ++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        | 19 +++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c        | 19 +++++++------
 7 files changed, 84 insertions(+), 82 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

