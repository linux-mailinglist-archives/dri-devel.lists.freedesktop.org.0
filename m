Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3FA72144B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 05:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB6C10E226;
	Sun,  4 Jun 2023 03:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BE310E0E2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:46 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b1af9ef7a9so24841991fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847704; x=1688439704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxdMejx+aeya5Jh769pAU4kEMRzgbXnMQm/8cCXpI0Y=;
 b=WmKKSgUXwASDPmK2q4G4UCuz8wrL3jcNxZAKq5lLBHQVuePBgjoDEKZauB9bdR1E3O
 ROJVblyjFMPc34s37CHPMiy1X3ssr3NfhFif1fMVG0/+/UJE2LTlaIGDkIGxQZbdRPot
 n9JrerF/auZUTlP7f8oeH6CQwdnWcqDuUp3GtFU8eEC+ir4Z87WXxoXfCcU7JShUQ0ii
 ZeNrBIeJp73n7lL8r23SDg3AJnYwd+TPCdlKhBKZRZ42wn2Kn/QSd3YH4lQnfB5f/Q/I
 Gf7b5I6X4ETUSo9Do0Yc93qoycNCeCzzpN51vB2WiAgvP3ooVpk272J3u9lg5SZgPNZP
 mnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847704; x=1688439704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxdMejx+aeya5Jh769pAU4kEMRzgbXnMQm/8cCXpI0Y=;
 b=itGPBBUW/HXTvhnZwqo0qGxLmF1oTerO11xmx1yuI91TQPbDMUUYmbpYVFSHSIibvG
 rDAgkR5wVn2EU1xd6/58h+UXELNjKV6/5PFyqY5oZZKhadsucVNqRNAGM7FSgodt6iVK
 wCTjzd3HgikAB/3HZmaCXAngY5VR+a3LGYY8ya+1dGX8AjrwTPyLgG8XCRs3S2rNBaKZ
 HXXeXqVq4VaGgkzcEkj/QFnGsF0Hxy2PNM2wHwCl6EQ8+HuLE8MaK61ZohHtiRfExg1M
 Qax8azErxEjBjlsh86MtL/dov8WuM+o3mlZZJ2ds+oUYxEqkukGZ2IltURviQ2rKlXK5
 OCTQ==
X-Gm-Message-State: AC+VfDyj2BXM09eDaXJF5gaVybICz+ROGSrqOVTt1h+HnSP7UfiZ4QPN
 ATMj+EO8OxXcyuzzEqAr7kbiBA==
X-Google-Smtp-Source: ACHHUZ50qPNApFi2MmOPTnvCr77WdeYUjwF6pPWrKpYzpgU/fRaUrIYxv1IxrwaHH8zrKr3sxiGMTQ==
X-Received: by 2002:a2e:9d82:0:b0:2b1:b831:47d with SMTP id
 c2-20020a2e9d82000000b002b1b831047dmr1708268ljj.50.1685847704284; 
 Sat, 03 Jun 2023 20:01:44 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date: Sun,  4 Jun 2023 06:01:32 +0300
Message-Id: <168584750430.890410.17521895983925668903.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
 Stephen Boyd <swboyd@chromium.org>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 19 May 2023 01:22:29 +0300, Dmitry Baryshkov wrote:
> Merge SSPP and WB code programming QoS and CDP. This allows us to drop
> intermediate structures and duplicate code.
> 
> Changes since v2:
> - Moved SSPP_VIG_CSC_10_OP_MODE close to other CSC10 defines (Jeykumar)
> 
> Changes since v1:
> - Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
> - Fixed danger_safe_en programming conditions (Jeykumar)
> - Simplified the code surrounding setup_cdp() calls (Jeykumar)
> 
> [...]

Applied, thanks!

[1/9] drm/msm/dpu: fix SSPP register definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5f31d7e61ddf
[2/9] drm/msm/dpu: simplify CDP programming
      https://gitlab.freedesktop.org/lumag/msm/-/commit/48b3207e4ed9
[3/9] drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2defa907ed50
[4/9] drm/msm/dpu: rearrange QoS setting code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/78c2925de971
[5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5f86e50f031
[6/9] drm/msm/dpu: simplify qos_ctrl handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f68098003dc3
[7/9] drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ccff1d2c062
[8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5ebb27bffcc
[9/9] drm/msm/dpu: use common helper for WB and SSPP QoS setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5fe0faa62461

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
