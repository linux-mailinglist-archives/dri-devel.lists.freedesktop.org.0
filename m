Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F3552662
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 23:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9D810F3A9;
	Mon, 20 Jun 2022 21:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA1C10F3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 21:30:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y32so19216674lfa.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
 b=DMvnfxq233w/GmdsxpzV4vv8ETe0Ea4DP0HAWe9RzMJT0EW4BFw22LL2eRyoD4l8MX
 xoP4wld2PU/5dFRoPIE56XwLFVEw3OU7F5UlVcrYtElh4+oQRwGGVf7ONp+M9Qx9glcZ
 4LSDaCgaPoGEEqlbMqYG46iMzWa9sMyXl9gJscXoAA/KwxJ2CF21v6Ls8p5bQzC0QOZv
 0fZ5ehxz/1LDilzlOEgcUGT6UayaNUxIPYyLBolFnqpCojFnMIun6LUl2xR2737ZRPvy
 qa/V2D8Yl8UN/5VDaLQKYT36oO6vCW+WYKX7t0mWqra3LKPEQ/Plj2d+MqMfs67WdqtM
 81aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8/WOG9Lsdn9ThuiG2M5ftng7nETTq8B1iAmvxjeBug=;
 b=R3YY5ouzq+OsXNcpIPf5ZenFW3vVJUYz0tXXLOTAtj5FT98zLJ86kLeDNLV+dwonyq
 DgLsyAOP0pitLr/A1cGfRwTqRcRr/f/KeU6jxH4XvraGhOmuj9JMsTtbvR2d8etWIWw3
 99/7qUFVPTK6wE9NJU/v8NaFo/mG67xpPrRml46Rn4lJHcObdHeWYf0TY3a7RUHuxjsw
 P35ZGzdckn48SwUMS/thAYZJ3+VpA2lsWteX698Md9DcJQbfITPL70A/ufQrUxWqNtZg
 Xk+fE0jreWWCpgAPTbGuEW8RfX2xYuyLvJhSsV3fSatU2PGIK8z5Xl3JYUhd3jQJgkxk
 +pXw==
X-Gm-Message-State: AJIora9rab0S0sSWIySJB3ewOFHRH1pzHcoxvqBowOzcudGYajnrEzMp
 BZvO/3s+iwdHlQ9DKpQK1GZFOJbUicwcCJp4
X-Google-Smtp-Source: AGRyM1vGER7uc8+o7jLkwjr73U+Xk8bqIzgQ+EV3WTWt2dZ0kQRBft7p5LqNORhapHoi6vI89MmzKQ==
X-Received: by 2002:a05:6512:11cb:b0:47f:6906:6b94 with SMTP id
 h11-20020a05651211cb00b0047f69066b94mr5429172lfr.497.1655760656580; 
 Mon, 20 Jun 2022 14:30:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2ea311000000b0025a681a7616sm838866lje.105.2022.06.20.14.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 0/4] drm/msm: move resource allocation to the _probe
 function
Date: Tue, 21 Jun 2022 00:30:50 +0300
Message-Id: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

The first patch fixes an issue with drvdata and is probably a -fixes
material, but it is still included as a base for the rest of mdp5
changes.

Dmitry Baryshkov (4):
  drm/msm/mdp5: stop overriding drvdata
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  62 ++++++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 ++++++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 116 +++++++++++------------
 3 files changed, 137 insertions(+), 148 deletions(-)

-- 
2.35.1

