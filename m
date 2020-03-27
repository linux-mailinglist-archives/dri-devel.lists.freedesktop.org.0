Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C1195BD9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 18:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C1F6EA61;
	Fri, 27 Mar 2020 17:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AD6EA61
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 17:05:10 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id m14so9442051oic.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cmc3lAmMWhjyo4loBSxUFc5RCiorU4r8eRuGkd4JFwk=;
 b=AcuJsIhON9BbCwx9RE5nka0ChI0k9dHDStv8mr7qtQcn9GaMemB1ixOxkyIiUHdK9D
 HnJdWbCteVS9GMWbRqupCtOFK6ZH837BzyIr0s4HNhEHYsie0BB5LknRWTkEfYpYxMst
 NctX6SKtG7V2n9/Mqnxk1wSVA7mAhG8cDIoJbhujUYF5IMxY/1NFGmKAXO1et9OjphnA
 vBCejvT2Zo6APKYcbmgRVhCcq0ua41UDeND+IQKs1eqq7ZNjoYsmo3Kxy3TvkJCchhRi
 6zCiBQgIYDXmCm7jkP0Aq5B/hR1ln3CnS05Fe+swfsL/vt8e6zQAO+SIur1PQFGIOCG6
 hE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cmc3lAmMWhjyo4loBSxUFc5RCiorU4r8eRuGkd4JFwk=;
 b=uHjkQ2QjJpIkoxq5ZWvO8E05gQdXnXILNUfFB/OFtuvEU7msoLHNN098LBIwLJq2dF
 Bzax+BUMJIIiIEkeZx17F9WRhDndpC+HsgKd7BeA9/kNlwdinGfh/627RUcumMmn85RX
 1wHp+c+z1xnoC5014u5U2Yn9yTyINpfzHpcEU3E/DejGrFMxOhFBBpKHjdUViU+Dh6mz
 uXRxagdTRHS9If40q7YB3mDQM4+4VSUx7Dk97We3ykJzXemjyRQlgxiTRBWL1H3lvIzU
 oISkcwaKRv/HwniAqpf1XLFpQ5elOmv80vMuzl3S/dHLnsqdNbtEgZLCEP+xb3uOPump
 szSg==
X-Gm-Message-State: ANhLgQ08pumso/zdT9ID8IQP1pE2BTBVyK0CLSigj3aNza1axRzdsvLA
 uYMZMzoCkoppg+Cy6jZ0iOc=
X-Google-Smtp-Source: ADFU+vtmincihMyjWLT/TMF1o5zAakqdF/krFBVXH05ycFCQ/fswOS7FE+yoFrLzjUxW/Y3ano3/mw==
X-Received: by 2002:aca:130d:: with SMTP id e13mr4771150oii.98.1585328709106; 
 Fri, 27 Mar 2020 10:05:09 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id h16sm1890423ots.80.2020.03.27.10.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 10:05:07 -0700 (PDT)
Subject: Re: [PATCH v12 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
To: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <mbrugger@suse.com>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
 <20200311165322.1594233-5-enric.balletbo@collabora.com>
 <02290a21-7392-a2cf-576c-215091ec05e8@suse.com>
 <1585177534.26117.4.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c4c404ff-8ead-7017-5139-2ea4c0efb1b6@gmail.com>
Date: Fri, 27 Mar 2020 18:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585177534.26117.4.camel@mtksdaap41>
Content-Language: en-US
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 Allison Randal <allison@lohutok.net>, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

On 26/03/2020 00:05, CK Hu wrote:
> Hi, Matthias:
> 
> On Wed, 2020-03-25 at 17:16 +0100, Matthias Brugger wrote:
>>
>> On 11/03/2020 17:53, Enric Balletbo i Serra wrote:
>>> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
>>> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
>>> Those functions will allow DRM driver and others to control the data
>>> path routing.
>>>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Acked-by: CK Hu <ck.hu@mediatek.com>
>>
>> This patch does not apply against v5.6-rc1.
>> Please rebase as this is a quite big patch and it won't be easy to do that by hand.
> 
> I think this patch depends on [1] which has been acked by me and I have
> not picked it. The simple way is that you pick [1] first and then pick
> this series.
> 
> [1] 
> https://patchwork.kernel.org/patch/11406227/

In the end Enric rebased his branch on top of v5.6-rc1 so I won't take this
patch into branch. So feel free to take it through yours.

Regards,
Matthias

> 
> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>> ---
>>>
>>> Changes in v12: None
>>> Changes in v10:
>>> - Select CONFIG_MTK_MMSYS (CK)
>>> - Pass device pointer of mmsys device instead of config regs (CK)
>>>
>>> Changes in v9:
>>> - Introduced a new patch to move routing control into mmsys driver.
>>> - Removed the patch to use regmap as is not needed anymore.
>>>
>>> Changes in v8: None
>>> Changes in v7: None
>>>
>>>  drivers/gpu/drm/mediatek/Kconfig        |   1 +
>>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  19 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>>>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  14 +-
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   2 +-
>>>  drivers/soc/mediatek/mtk-mmsys.c        | 279 ++++++++++++++++++++++++
>>>  include/linux/soc/mediatek/mtk-mmsys.h  |  20 ++
>>>  8 files changed, 316 insertions(+), 282 deletions(-)
>>>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>>> index fa5ffc4fe823..c420f5a3d33b 100644
>>> --- a/drivers/gpu/drm/mediatek/Kconfig
>>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>>> @@ -11,6 +11,7 @@ config DRM_MEDIATEK
>>>  	select DRM_MIPI_DSI
>>>  	select DRM_PANEL
>>>  	select MEMORY
>>> +	select MTK_MMSYS
>>>  	select MTK_SMI
>>>  	select VIDEOMODE_HELPERS
>>>  	help
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> index 0e05683d7b53..579a5a5d4472 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> @@ -6,6 +6,7 @@
>>>  #include <linux/clk.h>
>>>  #include <linux/pm_runtime.h>
>>>  #include <linux/soc/mediatek/mtk-cmdq.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>>  
>>>  #include <asm/barrier.h>
>>>  #include <soc/mediatek/smi.h>
>>> @@ -28,7 +29,7 @@
>>>   * @enabled: records whether crtc_enable succeeded
>>>   * @planes: array of 4 drm_plane structures, one for each overlay plane
>>>   * @pending_planes: whether any plane has pending changes to be applied
>>> - * @config_regs: memory mapped mmsys configuration register space
>>> + * @mmsys_dev: pointer to the mmsys device for configuration registers
>>>   * @mutex: handle to one of the ten disp_mutex streams
>>>   * @ddp_comp_nr: number of components in ddp_comp
>>>   * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
>>> @@ -50,7 +51,7 @@ struct mtk_drm_crtc {
>>>  	u32				cmdq_event;
>>>  #endif
>>>  
>>> -	void __iomem			*config_regs;
>>> +	struct device			*mmsys_dev;
>>>  	struct mtk_disp_mutex		*mutex;
>>>  	unsigned int			ddp_comp_nr;
>>>  	struct mtk_ddp_comp		**ddp_comp;
>>> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>>>  	}
>>>  
>>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> -		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
>>> -					 mtk_crtc->ddp_comp[i]->id,
>>> -					 mtk_crtc->ddp_comp[i + 1]->id);
>>> +		mtk_mmsys_ddp_connect(mtk_crtc->mmsys_dev,
>>> +				      mtk_crtc->ddp_comp[i]->id,
>>> +				      mtk_crtc->ddp_comp[i + 1]->id);
>>>  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>>>  					mtk_crtc->ddp_comp[i]->id);
>>>  	}
>>> @@ -355,9 +356,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>>>  					   mtk_crtc->ddp_comp[i]->id);
>>>  	mtk_disp_mutex_disable(mtk_crtc->mutex);
>>>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> -		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
>>> -					      mtk_crtc->ddp_comp[i]->id,
>>> -					      mtk_crtc->ddp_comp[i + 1]->id);
>>> +		mtk_mmsys_ddp_disconnect(mtk_crtc->mmsys_dev,
>>> +					 mtk_crtc->ddp_comp[i]->id,
>>> +					 mtk_crtc->ddp_comp[i + 1]->id);
>>>  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
>>>  					   mtk_crtc->ddp_comp[i]->id);
>>>  	}
>>> @@ -761,7 +762,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>>>  	if (!mtk_crtc)
>>>  		return -ENOMEM;
>>>  
>>> -	mtk_crtc->config_regs = priv->config_regs;
>>> +	mtk_crtc->mmsys_dev = priv->mmsys_dev;
>>>  	mtk_crtc->ddp_comp_nr = path_len;
>>>  	mtk_crtc->ddp_comp = devm_kmalloc_array(dev, mtk_crtc->ddp_comp_nr,
>>>  						sizeof(*mtk_crtc->ddp_comp),
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> index b885f60f474c..014c1bbe1df2 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
>>> @@ -13,26 +13,6 @@
>>>  #include "mtk_drm_ddp.h"
>>>  #include "mtk_drm_ddp_comp.h"
>>>  
>>> -#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>>> -#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>>> -#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>>> -#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>>> -#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>>> -#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>>> -#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>>> -#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>>> -#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>>> -#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>>> -#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>>> -#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>>> -#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>>> -#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>>> -
>>> -#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>>> -#define DISP_REG_CONFIG_OUT_SEL			0x04c
>>> -#define DISP_REG_CONFIG_DSI_SEL			0x050
>>> -#define DISP_REG_CONFIG_DPI_SEL			0x064
>>> -
>>>  #define MT2701_DISP_MUTEX0_MOD0			0x2c
>>>  #define MT2701_DISP_MUTEX0_SOF0			0x30
>>>  
>>> @@ -94,48 +74,6 @@
>>>  #define MUTEX_SOF_DSI2			5
>>>  #define MUTEX_SOF_DSI3			6
>>>  
>>> -#define OVL0_MOUT_EN_COLOR0		0x1
>>> -#define OD_MOUT_EN_RDMA0		0x1
>>> -#define OD1_MOUT_EN_RDMA1		BIT(16)
>>> -#define UFOE_MOUT_EN_DSI0		0x1
>>> -#define COLOR0_SEL_IN_OVL0		0x1
>>> -#define OVL1_MOUT_EN_COLOR1		0x1
>>> -#define GAMMA_MOUT_EN_RDMA1		0x1
>>> -#define RDMA0_SOUT_DPI0			0x2
>>> -#define RDMA0_SOUT_DPI1			0x3
>>> -#define RDMA0_SOUT_DSI1			0x1
>>> -#define RDMA0_SOUT_DSI2			0x4
>>> -#define RDMA0_SOUT_DSI3			0x5
>>> -#define RDMA1_SOUT_DPI0			0x2
>>> -#define RDMA1_SOUT_DPI1			0x3
>>> -#define RDMA1_SOUT_DSI1			0x1
>>> -#define RDMA1_SOUT_DSI2			0x4
>>> -#define RDMA1_SOUT_DSI3			0x5
>>> -#define RDMA2_SOUT_DPI0			0x2
>>> -#define RDMA2_SOUT_DPI1			0x3
>>> -#define RDMA2_SOUT_DSI1			0x1
>>> -#define RDMA2_SOUT_DSI2			0x4
>>> -#define RDMA2_SOUT_DSI3			0x5
>>> -#define DPI0_SEL_IN_RDMA1		0x1
>>> -#define DPI0_SEL_IN_RDMA2		0x3
>>> -#define DPI1_SEL_IN_RDMA1		(0x1 << 8)
>>> -#define DPI1_SEL_IN_RDMA2		(0x3 << 8)
>>> -#define DSI0_SEL_IN_RDMA1		0x1
>>> -#define DSI0_SEL_IN_RDMA2		0x4
>>> -#define DSI1_SEL_IN_RDMA1		0x1
>>> -#define DSI1_SEL_IN_RDMA2		0x4
>>> -#define DSI2_SEL_IN_RDMA1		(0x1 << 16)
>>> -#define DSI2_SEL_IN_RDMA2		(0x4 << 16)
>>> -#define DSI3_SEL_IN_RDMA1		(0x1 << 16)
>>> -#define DSI3_SEL_IN_RDMA2		(0x4 << 16)
>>> -#define COLOR1_SEL_IN_OVL1		0x1
>>> -
>>> -#define OVL_MOUT_EN_RDMA		0x1
>>> -#define BLS_TO_DSI_RDMA1_TO_DPI1	0x8
>>> -#define BLS_TO_DPI_RDMA1_TO_DSI		0x2
>>> -#define DSI_SEL_IN_BLS			0x0
>>> -#define DPI_SEL_IN_BLS			0x0
>>> -#define DSI_SEL_IN_RDMA			0x1
>>>  
>>>  struct mtk_disp_mutex {
>>>  	int id;
>>> @@ -246,200 +184,6 @@ static const struct mtk_ddp_data mt8173_ddp_driver_data = {
>>>  	.mutex_sof_reg = MT2701_DISP_MUTEX0_SOF0,
>>>  };
>>>  
>>> -static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
>>> -				    enum mtk_ddp_comp_id next,
>>> -				    unsigned int *addr)
>>> -{
>>> -	unsigned int value;
>>> -
>>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>> -		value = OVL0_MOUT_EN_COLOR0;
>>> -	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>> -		value = OVL_MOUT_EN_RDMA;
>>> -	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> -		value = OD_MOUT_EN_RDMA0;
>>> -	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>> -		value = UFOE_MOUT_EN_DSI0;
>>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>> -		value = OVL1_MOUT_EN_COLOR1;
>>> -	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>> -		value = GAMMA_MOUT_EN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> -		value = OD1_MOUT_EN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> -		value = RDMA0_SOUT_DSI3;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DSI3;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> -		value = RDMA1_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DPI0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DPI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> -		value = RDMA2_SOUT_DSI3;
>>> -	} else {
>>> -		value = 0;
>>> -	}
>>> -
>>> -	return value;
>>> -}
>>> -
>>> -static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next,
>>> -				   unsigned int *addr)
>>> -{
>>> -	unsigned int value;
>>> -
>>> -	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>> -		value = COLOR0_SEL_IN_OVL0;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI0_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI1_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI0_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI1_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI2_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI3_SEL_IN_RDMA1;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI0_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> -		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> -		value = DPI1_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI0_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> -		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> -		value = DSI1_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI2_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> -		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> -		value = DSI3_SEL_IN_RDMA2;
>>> -	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> -		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>> -		value = COLOR1_SEL_IN_OVL1;
>>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> -		*addr = DISP_REG_CONFIG_DSI_SEL;
>>> -		value = DSI_SEL_IN_BLS;
>>> -	} else {
>>> -		value = 0;
>>> -	}
>>> -
>>> -	return value;
>>> -}
>>> -
>>> -static void mtk_ddp_sout_sel(void __iomem *config_regs,
>>> -			     enum mtk_ddp_comp_id cur,
>>> -			     enum mtk_ddp_comp_id next)
>>> -{
>>> -	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> -	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>>> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>>> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> -		writel_relaxed(DSI_SEL_IN_RDMA,
>>> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>>> -		writel_relaxed(DPI_SEL_IN_BLS,
>>> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>>> -	}
>>> -}
>>> -
>>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>>> -			      enum mtk_ddp_comp_id cur,
>>> -			      enum mtk_ddp_comp_id next)
>>> -{
>>> -	unsigned int addr, value, reg;
>>> -
>>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) | value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -
>>> -	mtk_ddp_sout_sel(config_regs, cur, next);
>>> -
>>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) | value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -}
>>> -
>>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>>> -				   enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next)
>>> -{
>>> -	unsigned int addr, value, reg;
>>> -
>>> -	value = mtk_ddp_mout_en(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -
>>> -	value = mtk_ddp_sel_in(cur, next, &addr);
>>> -	if (value) {
>>> -		reg = readl_relaxed(config_regs + addr) & ~value;
>>> -		writel_relaxed(reg, config_regs + addr);
>>> -	}
>>> -}
>>> -
>>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
>>>  {
>>>  	struct mtk_ddp *ddp = dev_get_drvdata(dev);
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> index 827be424a148..6b691a57be4a 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>>> @@ -12,13 +12,6 @@ struct regmap;
>>>  struct device;
>>>  struct mtk_disp_mutex;
>>>  
>>> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
>>> -			      enum mtk_ddp_comp_id cur,
>>> -			      enum mtk_ddp_comp_id next);
>>> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
>>> -				   enum mtk_ddp_comp_id cur,
>>> -				   enum mtk_ddp_comp_id next);
>>> -
>>>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id);
>>>  int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex);
>>>  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> index 8e2d3cb62ad5..208f9c5256ef 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/of_address.h>
>>>  #include <linux/of_platform.h>
>>>  #include <linux/pm_runtime.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>>  #include <linux/dma-mapping.h>
>>>  
>>>  #include <drm/drm_atomic.h>
>>> @@ -425,7 +426,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>>  {
>>>  	struct device *dev = &pdev->dev;
>>>  	struct mtk_drm_private *private;
>>> -	struct resource *mem;
>>>  	struct device_node *node;
>>>  	struct component_match *match = NULL;
>>>  	int ret;
>>> @@ -436,14 +436,10 @@ static int mtk_drm_probe(struct platform_device *pdev)
>>>  		return -ENOMEM;
>>>  
>>>  	private->data = of_device_get_match_data(dev);
>>> -
>>> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -	private->config_regs = devm_ioremap_resource(dev, mem);
>>> -	if (IS_ERR(private->config_regs)) {
>>> -		ret = PTR_ERR(private->config_regs);
>>> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>>> -			ret);
>>> -		return ret;
>>> +	private->mmsys_dev = dev->parent;
>>> +	if (!private->mmsys_dev) {
>>> +		dev_err(dev, "Failed to get MMSYS device\n");
>>> +		return -ENODEV;
>>>  	}
>>>  
>>>  	/* Iterate over sibling DISP function blocks */
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> index 17bc99b9f5d4..b5be63e53176 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
>>> @@ -39,7 +39,7 @@ struct mtk_drm_private {
>>>  
>>>  	struct device_node *mutex_node;
>>>  	struct device *mutex_dev;
>>> -	void __iomem *config_regs;
>>> +	struct device *mmsys_dev;
>>>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
>>>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
>>>  	const struct mtk_mmsys_driver_data *data;
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>> index dbdfedd302fa..4b286b525cd3 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -5,8 +5,76 @@
>>>   */
>>>  
>>>  #include <linux/clk-provider.h>
>>> +#include <linux/device.h>
>>>  #include <linux/of_device.h>
>>>  #include <linux/platform_device.h>
>>> +#include <linux/soc/mediatek/mtk-mmsys.h>
>>> +
>>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
>>> +#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
>>> +
>>> +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
>>> +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
>>> +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
>>> +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
>>> +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
>>> +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
>>> +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
>>> +#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
>>> +#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
>>> +#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
>>> +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
>>> +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
>>> +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
>>> +#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
>>> +
>>> +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
>>> +#define DISP_REG_CONFIG_OUT_SEL			0x04c
>>> +#define DISP_REG_CONFIG_DSI_SEL			0x050
>>> +#define DISP_REG_CONFIG_DPI_SEL			0x064
>>> +
>>> +#define OVL0_MOUT_EN_COLOR0			0x1
>>> +#define OD_MOUT_EN_RDMA0			0x1
>>> +#define OD1_MOUT_EN_RDMA1			BIT(16)
>>> +#define UFOE_MOUT_EN_DSI0			0x1
>>> +#define COLOR0_SEL_IN_OVL0			0x1
>>> +#define OVL1_MOUT_EN_COLOR1			0x1
>>> +#define GAMMA_MOUT_EN_RDMA1			0x1
>>> +#define RDMA0_SOUT_DPI0				0x2
>>> +#define RDMA0_SOUT_DPI1				0x3
>>> +#define RDMA0_SOUT_DSI1				0x1
>>> +#define RDMA0_SOUT_DSI2				0x4
>>> +#define RDMA0_SOUT_DSI3				0x5
>>> +#define RDMA1_SOUT_DPI0				0x2
>>> +#define RDMA1_SOUT_DPI1				0x3
>>> +#define RDMA1_SOUT_DSI1				0x1
>>> +#define RDMA1_SOUT_DSI2				0x4
>>> +#define RDMA1_SOUT_DSI3				0x5
>>> +#define RDMA2_SOUT_DPI0				0x2
>>> +#define RDMA2_SOUT_DPI1				0x3
>>> +#define RDMA2_SOUT_DSI1				0x1
>>> +#define RDMA2_SOUT_DSI2				0x4
>>> +#define RDMA2_SOUT_DSI3				0x5
>>> +#define DPI0_SEL_IN_RDMA1			0x1
>>> +#define DPI0_SEL_IN_RDMA2			0x3
>>> +#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
>>> +#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
>>> +#define DSI0_SEL_IN_RDMA1			0x1
>>> +#define DSI0_SEL_IN_RDMA2			0x4
>>> +#define DSI1_SEL_IN_RDMA1			0x1
>>> +#define DSI1_SEL_IN_RDMA2			0x4
>>> +#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
>>> +#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
>>> +#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
>>> +#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
>>> +#define COLOR1_SEL_IN_OVL1			0x1
>>> +
>>> +#define OVL_MOUT_EN_RDMA			0x1
>>> +#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
>>> +#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
>>> +#define DSI_SEL_IN_BLS				0x0
>>> +#define DPI_SEL_IN_BLS				0x0
>>> +#define DSI_SEL_IN_RDMA				0x1
>>>  
>>>  struct mtk_mmsys_driver_data {
>>>  	const char *clk_driver;
>>> @@ -16,10 +84,221 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
>>>  	.clk_driver = "clk-mt8173-mm",
>>>  };
>>>  
>>> +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
>>> +					  enum mtk_ddp_comp_id next,
>>> +					  unsigned int *addr)
>>> +{
>>> +	unsigned int value;
>>> +
>>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
>>> +		value = OVL0_MOUT_EN_COLOR0;
>>> +	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
>>> +		value = OVL_MOUT_EN_RDMA;
>>> +	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		value = OD_MOUT_EN_RDMA0;
>>> +	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
>>> +		value = UFOE_MOUT_EN_DSI0;
>>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
>>> +		value = OVL1_MOUT_EN_COLOR1;
>>> +	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
>>> +		value = GAMMA_MOUT_EN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
>>> +		value = OD1_MOUT_EN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
>>> +		value = RDMA0_SOUT_DSI3;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DSI3;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
>>> +		value = RDMA1_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DPI0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DPI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
>>> +		value = RDMA2_SOUT_DSI3;
>>> +	} else {
>>> +		value = 0;
>>> +	}
>>> +
>>> +	return value;
>>> +}
>>> +
>>> +static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
>>> +					 enum mtk_ddp_comp_id next,
>>> +					 unsigned int *addr)
>>> +{
>>> +	unsigned int value;
>>> +
>>> +	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
>>> +		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
>>> +		value = COLOR0_SEL_IN_OVL0;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI0_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI1_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI0_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI1_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI2_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI3_SEL_IN_RDMA1;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI0_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
>>> +		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
>>> +		value = DPI1_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI0_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
>>> +		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
>>> +		value = DSI1_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI2_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
>>> +		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
>>> +		value = DSI3_SEL_IN_RDMA2;
>>> +	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
>>> +		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
>>> +		value = COLOR1_SEL_IN_OVL1;
>>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> +		*addr = DISP_REG_CONFIG_DSI_SEL;
>>> +		value = DSI_SEL_IN_BLS;
>>> +	} else {
>>> +		value = 0;
>>> +	}
>>> +
>>> +	return value;
>>> +}
>>> +
>>> +static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
>>> +				   enum mtk_ddp_comp_id cur,
>>> +				   enum mtk_ddp_comp_id next)
>>> +{
>>> +	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
>>> +		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
>>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> +	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
>>> +		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
>>> +			       config_regs + DISP_REG_CONFIG_OUT_SEL);
>>> +		writel_relaxed(DSI_SEL_IN_RDMA,
>>> +			       config_regs + DISP_REG_CONFIG_DSI_SEL);
>>> +		writel_relaxed(DPI_SEL_IN_BLS,
>>> +			       config_regs + DISP_REG_CONFIG_DPI_SEL);
>>> +	}
>>> +}
>>> +
>>> +void mtk_mmsys_ddp_connect(struct device *dev,
>>> +			   enum mtk_ddp_comp_id cur,
>>> +			   enum mtk_ddp_comp_id next)
>>> +{
>>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>>> +	unsigned int addr, value, reg;
>>> +
>>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) | value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +
>>> +	mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
>>> +
>>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) | value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +}
>>> +
>>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>>> +			      enum mtk_ddp_comp_id cur,
>>> +			      enum mtk_ddp_comp_id next)
>>> +{
>>> +	void __iomem *config_regs = dev_get_drvdata(dev);
>>> +	unsigned int addr, value, reg;
>>> +
>>> +	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +
>>> +	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
>>> +	if (value) {
>>> +		reg = readl_relaxed(config_regs + addr) & ~value;
>>> +		writel_relaxed(reg, config_regs + addr);
>>> +	}
>>> +}
>>> +
>>>  static int mtk_mmsys_probe(struct platform_device *pdev)
>>>  {
>>>  	const struct mtk_mmsys_driver_data *data;
>>> +	struct device *dev = &pdev->dev;
>>>  	struct platform_device *clks;
>>> +	void __iomem *config_regs;
>>> +	struct resource *mem;
>>> +	int ret;
>>> +
>>> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	config_regs = devm_ioremap_resource(dev, mem);
>>> +	if (IS_ERR(config_regs)) {
>>> +		ret = PTR_ERR(config_regs);
>>> +		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
>>> +			ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, config_regs);
>>>  
>>>  	data = of_device_get_match_data(&pdev->dev);
>>>  
>>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>>> new file mode 100644
>>> index 000000000000..7bab5d9a3d31
>>> --- /dev/null
>>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2015 MediaTek Inc.
>>> + */
>>> +
>>> +#ifndef __MTK_MMSYS_H
>>> +#define __MTK_MMSYS_H
>>> +
>>> +enum mtk_ddp_comp_id;
>>> +struct device;
>>> +
>>> +void mtk_mmsys_ddp_connect(struct device *dev,
>>> +			   enum mtk_ddp_comp_id cur,
>>> +			   enum mtk_ddp_comp_id next);
>>> +
>>> +void mtk_mmsys_ddp_disconnect(struct device *dev,
>>> +			      enum mtk_ddp_comp_id cur,
>>> +			      enum mtk_ddp_comp_id next);
>>> +
>>> +#endif /* __MTK_MMSYS_H */
>>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
