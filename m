Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE234FE61
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 12:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2171F6EA46;
	Wed, 31 Mar 2021 10:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483336E1EE
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 10:57:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id w28so7526979lfn.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
 b=T2l1mkshCl6YEr2sg1PpgXbvvm/1CotkrF/GcTGYx7oF8cy3+4seZQ7q+wc3xZmSgg
 O57t6sdxREYa5YWhKrfD2ZxjaF/BBfa51oC9m9HXrwZfBaKaHH3p93e+F3jHQiKp4WJS
 sEIrO8xpUNxiYnzaZ52ZRZHSaG2jHw2r+xMzTHMeC4UEr8sIGCijKNwQPaFNyiJheU/Y
 wBaOCSJlnyoP9HW7F2L5eCzOwLx1bIDeNJvL4djxZBN4AomdnakpYFv1ZHfSDy7mPssz
 8M+BZvmQjysRNTSOMsvPcQRO/V5mFfk18EYIMHpFx4NfBIWPcaZNFP//z4fmkA3cA1VO
 YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
 b=SSDxxxKDnMSEI9A+KEfNyZApZdavW4vJK3ONaSqhTd4lzwbvJIr5UZbsKAsmhDjQy4
 bHqR97d6sqvQ5Q2pTfsX/XvPQNBwQgNSDpvqrRU10OFS/WDhczunJtcx7B3/mu48jq9N
 emJq5a+EanUQuOC1PYH/ukIO9bdBY07QyK3yUUprg2IT2fSe0GqcLtu34crufe4q7Q1c
 O5JUVIPzwAQhod53m3k0wrfBN2gAevWZlnZdVS25Je2R5PqbfnoMH01/5hqpRLSOzsm9
 JVvtbacQPHI03yUb/RVcgthIBTiE42DIzVE9Syz+Ce85AvhU0yIuo2f7y7YVIXmnos1M
 5V3g==
X-Gm-Message-State: AOAM5304Me3SsRP185J/Sg9GurNpK1w55LoZVVGy/roD/hur8EYJj2zy
 k8qtwN3kORCr5EU5lYtj4GfbZg==
X-Google-Smtp-Source: ABdhPJzinUMr68L3H0gNll59ZE9d2mkq7SzhhgLoSGMm3q7hf8wIK1TFkvYKx2COry8hY5RNKVo9Bw==
X-Received: by 2002:ac2:4e43:: with SMTP id f3mr1830598lfr.206.1617188256679; 
 Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v4 00/24] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date: Wed, 31 Mar 2021 13:57:11 +0300
Message-Id: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

This patchet depends on the patch "clk: fixed: add devm helper for
clk_hw_register_fixed_factor()", which was merged in 5.12-rc1:
https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com


Changes since v3:
 - Rename save_state/restore_state functions/callbacks
 - Still mention DSI_1 when determining settings for slave PHYs in 14nm
   and 28nm drivers.
 - Stop including the external dependency merged upstream long ago. It
   is properly mentioned in the patchset description.

Changes since v2:
 - Drop the 'stop setting clock parents manually' patch for now together
   with the dtsi changes. Unlike the rest of patchset it provides
   functional changes and might require additional discussion.
   The patchset will be resubmitted later.

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
