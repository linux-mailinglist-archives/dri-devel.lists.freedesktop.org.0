Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997C5463646
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296196E928;
	Tue, 30 Nov 2021 14:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC2F6E3F4;
 Tue, 30 Nov 2021 14:14:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E41211F45147
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638281661; bh=z92avPrY/qcLPDFYS3uEC/hntI9LLBiS1GNCBUPvwRc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CunOnmX6RnFuxh97PUptAPwb9nVxcYZkXFoO0OC0w0y3iKZkb/Gk5URpbaJhoLCZx
 E1vIVyHwaXhKJ260zg3q+LyR5/Ze7Ec2u2+f14Cx8jDmliYIhR8+g4hxXYFelgIsj+
 R/AdjTiv7UWBbWfDsaq4/+uNnEJw32k8ZFs1DCKNSTc25MbMcmksbHFEtAH5dv3KPB
 8QTCEfNmv+WEKI/qCGk/U8A95Nvm2o/oVSrN8frbPIr+bn8S02lzETx7ZT7qRB4phr
 fHb5oYa+n9vcObvVSargSOG+GtOpXlVx6L87ekpexMrzKG8kuTyJVp7zbLGDcBWfoi
 KolgQbhyM0IEA==
Subject: Re: [PATCH v2 0/2] drm/msm: Fix dsi/bridge probe
To: robdclark@gmail.com
References: <20211130141048.294246-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1a3b307f-5e01-8fa8-67de-2bf0b9f6601f@collabora.com>
Date: Tue, 30 Nov 2021 15:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211130141048.294246-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/11/21 15:10, AngeloGioacchino Del Regno ha scritto:
> Context, from patch 2/2:
> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
> DSI host gets initialized earlier, but this caused unability to probe
> the entire stack of components because they all depend on interrupts
> coming from the main `mdss` node (mdp5, or dpu1).
> 
> Series v2:
> After a very nice conversation with Dmitry, it turned out that my first
> approach to solve this issue wasn't great: even though it appeared to
> actually work, it was introducing a number of issues, one of which was
> critical as it was not removing down the DRM device when it's supposed to.
> 
> Instead of actually fixing that patch, I went for "simplifying" the
> approach by not initializing the entire MDSS, but just the interrupt
> controller, which still untangles the infinite probe deferrals, but
> actually doesn't even touch most of the already present logic in place.
> 
> AngeloGioacchino Del Regno (2):
>    drm/msm: Allocate msm_drm_private early and pass it as driver data
>    drm/msm: Initialize MDSS irq domain at probe time
> 
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 16 ++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c   | 50 ++++++++++------
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  3 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c  | 58 +++++++++++++------
>   drivers/gpu/drm/msm/dp/dp_display.c        | 10 +---
>   drivers/gpu/drm/msm/dsi/dsi.c              |  6 +-
>   drivers/gpu/drm/msm/edp/edp.c              |  6 +-
>   drivers/gpu/drm/msm/hdmi/hdmi.c            |  7 +--
>   drivers/gpu/drm/msm/msm_drv.c              | 67 +++++++++++++---------
>   drivers/gpu/drm/msm/msm_kms.h              |  3 +
>   11 files changed, 133 insertions(+), 97 deletions(-)
> 

Dmitry, just as a note: I've obviously dropped your R-b when sending v2
as despite having a very similar title and description, this is, in the end,
a different thing.

Cheers,
- Angelo
