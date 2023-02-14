Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76434696396
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 13:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0C710E8BE;
	Tue, 14 Feb 2023 12:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8484B10E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id h24so23262849lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
 b=jI/GJxl9CNH2yhi4NRFnnuwuG5OSEgx3+S3X4x3j5vT07hrw80oy8Uo1yXGbgbSR7F
 RXeX5rCRHIFWHTWPg/E/E9DtmEAZQPSxMsklPqB1S/ccE29vGCDKQoylx2Y4BD1dow79
 iqKf3XCKxcA3qKhYQ3lqrSH/qRE93/n7418YQH9/kZa4siLe/cSXZmK9lKxBb76JEgvs
 MzDAq4KgSBwMgyRXTRg3513tYvOrhYSdkH5ZBKAJncMQG+V0ozRLX+HP+kyiNiSk7mQl
 HMwyJUUbBTVylyy/wDVq3WBoj47EY4xpfUwsBfgcwN7qDp8oK1LkLLtDykdWJLt6YQAp
 dnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
 b=Z4Se0CGa7Ec3q+g1/JoI09+5VBgN0aOWbEFEC+OFRIhhAl6q7Xvwzs9Klg6h+a317H
 DODlCdlUTNrWtmT9wiyLHKPqnnGOuIhTMbr4DsYXAqbKloXyNYVxktz/L9YPxEJpEYQ7
 3A0yzRSNQqoS5zk34uX7a/7PFxHujcAgYMZxIR5++y91DhhmezsOI24IzpYQFBtQR+vs
 1ajyt1tRRo71/exh1AO+VgD2GYIexI/tS0hSGWdINcB3VEwQJ4nqo5jpJTNHviiYfoNq
 zFGdjNkQaCTG6PkoFIjCBAef628Xin5HGxmJlH7gNbzErCpe+Y37wG0qLo09oXoNTMSg
 h5iA==
X-Gm-Message-State: AO0yUKW1qFVuovA5D/f4ym9gdMBG3U7RCaPlTmI1rLohlv2cip/j5VY1
 izeJmN60UibCGGUMsGyXMdQTPg==
X-Google-Smtp-Source: AK7set/iTdHf7YxO2g+rThSDtaij0QNrbLQRJIotuyZCyn1GzpiayUW7c6kW2TTKlkDRKdXpb3E9Xg==
X-Received: by 2002:a05:6512:374e:b0:4cb:10ad:76bd with SMTP id
 a14-20020a056512374e00b004cb10ad76bdmr522821lfs.64.1676378105420; 
 Tue, 14 Feb 2023 04:35:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:35:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm/adreno: implement devcoredump support for a5xx
Date: Tue, 14 Feb 2023 15:35:01 +0300
Message-Id: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the debug of the a5xx preempt issue, having the devcoredump
support was a great help. These patches port necessary code bits from
being a6xx-specific to generic code path and then enables devcoredump
for a5xx.

Dmitry Baryshkov (3):
  drm/msm/adreno: stall translation on fault for all GPU families
  drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
  drm/msm/a5xx: add devcoredump support to the fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 13 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 +++----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 ++
 drivers/gpu/drm/msm/msm_iommu.c         | 38 ++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 109 insertions(+), 73 deletions(-)

-- 
2.30.2

