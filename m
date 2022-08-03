Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69F5887CF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145D210EA15;
	Wed,  3 Aug 2022 07:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9265D10E20B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 07:19:00 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s9so12013614ljs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=9qWosSLXhyptc60Y7AzA5SZJpqZuA+8KmqVAtrjeBq8=;
 b=ZzSM1bueO0NTpO74C+tO6GnDLLj76TrW+4XYe3o5ZiCcjdQrcc8xG75ruStb6Qp2NB
 ol/HnraOGLcStmk1KS86MLbDyA2HxMEM+MHqXtKkNX0rkS+X7NC1e0Hv9PevITZk+tlc
 6iHUTeyK0IvfE1qxrdUo04QloDRZ8McSS6NeEp4XsmHJUXbm9LakYizL3be2SvyYosl5
 Gjh23j7NYHcCibZdpNuQkazLuXP5FcGAKrylYVl3jawBv5l10s9Dvp3Qrn9rmkKI2GI8
 xTVw5d+pRy0y/aqTQG59x4dQGIPwVGENSGb6gIEgCUJ/Cmdy+mFVeKrj1GveyN2+oKFW
 K4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=9qWosSLXhyptc60Y7AzA5SZJpqZuA+8KmqVAtrjeBq8=;
 b=TIkjnt+cxIUhVCFcFEjGOtsxHJT07E7kbgv0fe5AvymeA0LYqhhFzV4AEMTvGjLm1Z
 uAbKExnZvi94lnou/6WY/JcbhLmGzZpWxVhd9vYsVPbRCQCR2leHypFSjBtBftdmnKrs
 T6h16VAnkgp6XI7b7yhHxKmf7ceExCH9GDabnUUbueOI9bk7m55PNJcjKFtTTYNnLWiW
 thlARA3nTNxWqJrtWMQ7KieI7AG4p1Gfj0sHCZZ20GPW4R0WWqY+i+zDaX2KweFjly/o
 lVUMROc9i0ZUPl0qm9x8NOrVLcYhrC3bHP7+g/cLN8KEV86XEjBjvv1aTMbdnpZoYYqV
 HAwA==
X-Gm-Message-State: ACgBeo2kL5DaTCTg5Z6AH3jPpvRMHAXYck95HwiC4ba0uxEH+78AaLE4
 a8rCSrnc5vcIqDf+a0Abvil/HA==
X-Google-Smtp-Source: AA6agR4m8eXNXB/epkX5NIGw5gtrqihlWFLmZBQ/K5mkZcX5VyNEOs/67u0bqyznWFTBGERH32dlog==
X-Received: by 2002:a05:651c:905:b0:25e:67a8:4dd0 with SMTP id
 e5-20020a05651c090500b0025e67a84dd0mr1396572ljq.232.1659511138894; 
 Wed, 03 Aug 2022 00:18:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a2ea605000000b0025dd5b3fabesm2119728ljp.102.2022.08.03.00.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 00:18:58 -0700 (PDT)
Message-ID: <228e5e34-6467-a75b-129d-2b37b32acf13@linaro.org>
Date: Wed, 3 Aug 2022 10:18:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/6] drm/msm/dsi: Take advantage of
 devm_regulator_bulk_get_const()
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220802153434.v3.5.I55a9e65cb1c22221316629e98768ff473f47a067@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Sireesh Kodali <sireeshkodali1@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/08/2022 01:37, Douglas Anderson wrote:
> As of the commit 1de452a0edda ("regulator: core: Allow drivers to
> define their init data as const") we no longer need to do copying of
> regulator bulk data from initdata to something dynamic. Let's take
> advantage of that.
> 
> In addition to saving some code, this also moves us to using
> ARRAY_SIZE() to specify how many regulators we have which is less
> error prone.
> 
> This gets rid of some layers of wrappers which makes it obvious that
> we can get rid of an extra error print.
> devm_regulator_bulk_get_const() prints errors for you so you don't
> need an extra layer of printing.
> 
> In all cases here I have preserved the old settings without any
> investigation about whether the loads being set are sensible. In the
> cases of some of the PHYs if several PHYs in the same file used
> exactly the same settings I had them point to the same data structure.
> 
> NOTE: Though I haven't done the math, this is likely an overall
> savings in terms of "static const" data. We previously always
> allocated space for 8 supplies. Each of these supplies took up 36
> bytes of data (32 for name, 4 for an int).
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Ah, so to array conversion is already done. That's great.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> 
> Changes in v3:
> - Do all the PHYs too.

It would have been easier if DSI and DSI PHY were split to separate patches.

> - Get rid of error print after devm_regulator_bulk_get_const().
> - Just directly call the bulk commands; get rid of the wrapper.
> - Update commit message to point at the git hash of the regulator change.
> 
> Changes in v2:
> - ("Take advantage of devm_regulator_bulk_get_const") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi.h                 |  12 --
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c            |  42 ++---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  37 +---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   5 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |  20 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |  32 ++--
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |  14 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |  28 +--
>   .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |  12 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  32 ++--
>   12 files changed, 167 insertions(+), 242 deletions(-)

-- 
With best wishes
Dmitry
