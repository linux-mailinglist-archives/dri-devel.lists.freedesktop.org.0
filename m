Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D86A2CC3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 01:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFD410E646;
	Sun, 26 Feb 2023 00:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBBE10E646
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 00:15:44 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g17so3974754lfv.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
 b=DS7ZpMlF5Ik4nba/RbyZB23Lz0FBFYDvyY+eDE+gM9Rn/bn6cLnpb5qh8KqN6iOb/R
 lCTBiWgw9uqkAxAGbpaS1ZYRnFmqHvRJgWTq2z8yZb0xNTtnUmtzpggqknFySmSvI7iH
 YdyXmB2xhd3sMAvN2/RGief0ZnQwpHdRpc1Fp5ycRUJ1Wp0uDgHmczLeBdM6+U3CO9tt
 0Qo89Fkw63SSAcD08jf0brF7LjnhPdMV1O+exyOY90O5GVmVtn4XNVUPRBIDT4B7O43f
 MKijjws1ClnBHLeekq2VDNAcF6s7NfmGoocp5et0aA3ClgVNZQMsMP+kfMdczK6cVuir
 yvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Grqh/4AoPdhazL6MpZGfQQg2Jt5JYM0bzl/+dktY5dw=;
 b=Cd2936hPjA+JrtaFUqMF2GJokqxbonQWeHkcPihgMtqKfecREXj8MOm7LgszG22jwJ
 S9DC5V5FYZOqZM7y2PWEZBQSpMOUtUwVN0K0AZXwEMph7Uf6lgwoHtCZh70DDEruHSaF
 97NAlD42IPPGloK4/G/7sxhHxBxoYbYMAWsoa93F37/9w4KgunQyzt5e3NjACf2b6bE8
 +pn4eAidM9p+B19gVK6dkETdq9NuSHJMbEHeLWxduytqOacAlB92lr3qv1rGmJTp6OU2
 aXY1IZ6+6WhjMpVZf4aHgiPmjyyjnm0P2+U4lIMbbiUAWyz6sCLBj6mxJTAwthhjc00A
 6qQQ==
X-Gm-Message-State: AO0yUKUdXdQMt/LZKVV60wctjR+nzFVKctbIRfiy1XiQekovjTxNvt/9
 x7hZarPM2cXf2eJuIRF2hbnB5w==
X-Google-Smtp-Source: AK7set84D+a6dBvLKpC3e3cAYiAOCQNOFFe3/gJzzZtj14ixvbmkoGmCwgs9JNq7d+ShRIqGblj0bg==
X-Received: by 2002:ac2:44d4:0:b0:4d8:8af4:3b2c with SMTP id
 d20-20020ac244d4000000b004d88af43b2cmr6410561lfm.68.1677370542439; 
 Sat, 25 Feb 2023 16:15:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 16:15:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/2] drm/msm: rework msm_parse_deps() and
Date: Sun, 26 Feb 2023 02:15:39 +0200
Message-Id: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

As discusssed in the the review of [1], rework these two functions to
separate single point parser and provide clean error path.

Depenencies: [1]

[1] https://lore.kernel.org/all/20230215235048.1166484-1-robdclark@gmail.com

Changes since v1:
- Restored dumping of ring->id in trace_msm_gpu_submit (requested by Rob
  Clark)

Dmitry Baryshkov (2):
  drm/msm: drop unused ring variable in msm_ioctl_gem_submit()
  drm/msm: simplify msm_parse_deps() and msm_parse_post_deps()

 drivers/gpu/drm/msm/msm_gem_submit.c | 201 ++++++++++++++-------------
 1 file changed, 108 insertions(+), 93 deletions(-)

-- 
2.39.1

