Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048064F082
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 18:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32310E14D;
	Fri, 16 Dec 2022 17:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 214C910E0F1;
 Fri, 16 Dec 2022 17:41:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7FD41042;
 Fri, 16 Dec 2022 09:42:33 -0800 (PST)
Received: from [10.57.88.234] (unknown [10.57.88.234])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA5E33F5A1;
 Fri, 16 Dec 2022 09:41:45 -0800 (PST)
Message-ID: <2db73405-464f-6980-a7c1-7fe232611331@arm.com>
Date: Fri, 16 Dec 2022 17:41:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] drm: Add component_match_add_of and convert users of
 drm_of_component_match_add
Content-Language: en-GB
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <68562aca-5256-9e4b-bcd5-983e43408a7d@seco.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <68562aca-5256-9e4b-bcd5-983e43408a7d@seco.com>
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
Cc: alsa-devel@alsa-project.org, Xinliang Liu <xinliang.liu@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, John Stultz <jstultz@google.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Sean Paul <sean@poorly.run>, Yong Wu <yong.wu@mediatek.com>,
 linux-mips@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
 iommu@lists.linux.dev, freedreno@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-16 17:08, Sean Anderson wrote:
> On 11/3/22 14:22, Sean Anderson wrote:
>> This series adds a new function component_match_add_of to simplify the
>> common case of calling component_match_add_release with
>> component_release_of and component_compare_of. There is already
>> drm_of_component_match_add, which allows for a custom compare function.
>> However, all existing users just use component_compare_of (or an
>> equivalent).
>>
>> I can split the second commit up if that is easier to review.
>>
>>
>> Sean Anderson (2):
>>    component: Add helper for device nodes
>>    drm: Convert users of drm_of_component_match_add to
>>      component_match_add_of
>>
>>   .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
>>   drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
>>   drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
>>   drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
>>   drivers/gpu/drm/drm_of.c                      | 29 +++----------------
>>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
>>   .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
>>   drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
>>   drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
>>   drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
>>   drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
>>   drivers/iommu/mtk_iommu.c                     |  3 +-
>>   drivers/iommu/mtk_iommu_v1.c                  |  3 +-
>>   include/drm/drm_of.h                          | 12 --------
>>   include/linux/component.h                     |  9 ++++++
>>   sound/soc/codecs/wcd938x.c                    |  6 ++--
>>   18 files changed, 46 insertions(+), 96 deletions(-)
>>
> 
> ping?
> 
> Should I send a v2 broken up like Mark suggested?

FWIW you'll need to rebase the IOMMU changes on 6.2-rc1 anyway - 
mtk_iommu stops using component_match_add_release() at all.

Thanks,
Robin.
