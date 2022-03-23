Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A604E5064
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A903D10E66E;
	Wed, 23 Mar 2022 10:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E747A10E66E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:35:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 17so1210897ljw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbeye8khzGhcPEDC/HTAHCn/sJ3nc2ZI8GUHgmrO/Fg=;
 b=Xalt9QgnnPgRqt6/0m66oDRVYcV/RfbGkVZfkhCZzERUPlSE662rE/bVVdH8YTqJ6T
 GFgjSizGQ4JL+exBF60iYc/UnwjeJGwOp5vq5a7ogule/diU3KGatneXCuNNFddDUP4R
 AfWdLu6btYKSlxloxDotsTGVvek32NBIKtaAI8+4yq2wrMZspxvKbWGL4xzhhipovMCJ
 /DjhS/fsLiyV7a3gRb8s4xHgkhDS77zRox+AsRGSONekz0SIFL8ojMQrg3iYaHkvhdVS
 JdLljJCv9EhThmoJ9wQcShAHLF+K95yry3ZCfjDzQRUfjv6kjqJJ4rqNPlQuteI6tGih
 UYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tbeye8khzGhcPEDC/HTAHCn/sJ3nc2ZI8GUHgmrO/Fg=;
 b=UkYgmpKaitXE3xa/i5tXGPmTYkdRyfxl9NsZ+LT7Avv2odWE+tZw9CEkBPKETz+PDQ
 NjwSroMFK/OMthyfBhqufR9FL/A8uyiXGhXDmncqdda7Dv3Phu1lZDQTL/bdLv98WZfy
 KOgQlsHlw4mx7XZ2HthxZei4cCYZHcM5URjOwDtGCBHrkQHO9SvXTczMdrN2ocN3jDuP
 AFqVPsj1zcSMe3Zbo5N/rWgAhrFBcz428HpoBCXC43u5T/8ZCNtzn9Ugt1WPpdLAx+w4
 aihcQauJfEK+gSvplSUnEBH3FNN2dOjy9g+EWnwr64Eqz1gV5LLjeIz4iaivcEx5X8xx
 5gwQ==
X-Gm-Message-State: AOAM532aWQ/8tZeUzf0Jio7olkO7d3EXnBhm2K0cTcy3E6R7QrudZqts
 ALpsFz0aP8YVScWhJd4eG4VZkgsn0pJOQA==
X-Google-Smtp-Source: ABdhPJzNiquXcLkI5UZDh0uZxRq3K4dBplcwBBoZeeH3s049AeRE7bx6DChkTZiA2YBJ3hP6KJZGyg==
X-Received: by 2002:a2e:8786:0:b0:249:8620:36fd with SMTP id
 n6-20020a2e8786000000b00249862036fdmr9519577lji.461.1648031747250; 
 Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:35:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 0/3] drm/msm/dp: simplify dp_connector_get_modes()
Date: Wed, 23 Mar 2022 13:35:43 +0300
Message-Id: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
on-stack interim copy of the mode. When reviewing the mentioned patch I
noticed that the rest of the code in dp_connector_get_modes() is weird,
unused since September of 2020 and can be removed. This series removes
dead weird code leaving dp_connector_get_modes() simple enough.

[1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/

*** BLURB HERE ***

Dmitry Baryshkov (3):
  drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
  drm/msm/dp: simplify dp_connector_get_modes()
  drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display

 drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
 drivers/gpu/drm/msm/dp/dp_drm.c     | 33 ++---------------------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
 6 files changed, 8 insertions(+), 48 deletions(-)

-- 
2.35.1

