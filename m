Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 888D49571FD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 19:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B410E32B;
	Mon, 19 Aug 2024 17:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J5SvmYRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25F10E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 17:20:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so2163342f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724088036; x=1724692836;
 darn=lists.freedesktop.org; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=d7w+Z7whxfPmoj4Wq3yckA4+Eqsq7v6BPtdRMnZizU4=;
 b=J5SvmYRlNNADuADX4BhXGHky0Sk4VpLtl3lW77mpN3MSdvQeGMQaJ5LoKDUi5roA/f
 PZjVHMmvlohTa3/KnT2V7xJXP1fn0S5/4tO1wkqj1wQ3ihlp2hafMuWkL+KJFTRiLY4M
 pCn9JXMgDCdiV+72NfXxd+Qsf5wGIboFO3jOESUvEwFtRor2x26TOW8ZH35kewCbBy51
 ZV6wx1fWuGBXaXoXQAm2lDiBP18NYj4YpCLVR+lByjXNpTyA5iOE/4tmkBKDgWb3UgoU
 dvLgmnXyjimi8X2MRlIb7IxWB8Mg5c9h++THs7FRzD7oWd5uCztAmqhqn5BqUB/XPBwr
 75lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724088036; x=1724692836;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7w+Z7whxfPmoj4Wq3yckA4+Eqsq7v6BPtdRMnZizU4=;
 b=P7N4do5yzOQRJj384wIP5o34Udhcpjc4zQpiLb1nPNwT57WvGoN/eU50X3Erfg077y
 SBDbiPLU1Gyq+6FlzHE5QswsuIbh/d/6xKpvlqC6d2mdxM1ZZcR1beL49G9XC7FmlDVM
 bthcHCqGqK4na17hFH2qH3zLVuhgGP4NKl+v7/TFNY+EsRT8razjDXu4qtNf2bxm2E73
 np5ZU5z6hoUOTTgfR9fENxAT1XvePAbMcp4aR33m+jjLS2o5grWGGsOKJx18NXtW+os/
 gUnAh9tgCro7JLlDQD2DmOL4pA+MDzlM3ATZutFDQKj0nHW9Fkh9jrXzsvT9cVpiYe8u
 KAlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl0ECDNFOUu9N51zFkBnLQGCKGKG7mAm6QcWZwYaC8Sw3VuEgfjQNrn4ZC6xCRuZ2DwbN+GboJuO6mSLSp/9hMqwOd+Bq8/kqX6qtDi96O
X-Gm-Message-State: AOJu0YykJ9fQxCoZDtweXvU1gRU78VwiPQvmvVGXJBUbXcqV14K7Dw8E
 1t8ffdqrZla/XmbwcuKAzSLM1uJ9wcHyR87XVnVWfIOb5TMsqQweZDCnncHG9wQ=
X-Google-Smtp-Source: AGHT+IGXVW0SlkhAHUER3w0TGiekn/+ubCD9cSKheTAr37I40C4d2qC6peUfI4wnpjLZEgF4V3UoTg==
X-Received: by 2002:adf:b19b:0:b0:371:8cc1:2028 with SMTP id
 ffacd0b85a97d-371943285fcmr6996074f8f.14.1724088035609; 
 Mon, 19 Aug 2024 10:20:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:db8f:43f4:9b2e:fb1d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed78487fsm118066105e9.30.2024.08.19.10.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 10:20:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] drm/meson: dw-hdmi: convert to regmap
In-Reply-To: <13420cbe-30c5-4bac-80e9-c3822c0800bd@linaro.org> (Neil
 Armstrong's message of "Mon, 19 Aug 2024 18:22:25 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-7-jbrunet@baylibre.com>
 <13420cbe-30c5-4bac-80e9-c3822c0800bd@linaro.org>
Date: Mon, 19 Aug 2024 19:20:34 +0200
Message-ID: <1jo75owhst.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 19 Aug 2024 at 18:22, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 30/07/2024 14:50, Jerome Brunet wrote:
>> The Amlogic mixes direct register access and regmap ones, with several
>> custom helpers. Using a single API makes rework and maintenance easier.
>> Convert the Amlogic phy driver to regmap and use it to have more
>> consistent
>> access to the registers in the driver, with less custom helpers. Add
>> register bit definitions when missing.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 475 ++++++++++++--------------
>>   drivers/gpu/drm/meson/meson_dw_hdmi.h |  49 +--
>>   2 files changed, 239 insertions(+), 285 deletions(-)
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 47aa3e184e98..7c39e5c99043 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -90,16 +90,25 @@
>>    * - CEC Management
>>    */
>>   -/* TOP Block Communication Channel */
>> -#define HDMITX_TOP_ADDR_REG	0x0
>> -#define HDMITX_TOP_DATA_REG	0x4
>> -#define HDMITX_TOP_CTRL_REG	0x8
>> -#define HDMITX_TOP_G12A_OFFSET	0x8000
>> +/* Indirect channel definition for GX */
>> +#define HDMITX_TOP_REGS		0x0
>> +#define HDMITX_DWC_REGS		0x10
>> +
>> +#define GX_ADDR_OFFSET		0x0
>> +#define GX_DATA_OFFSET		0x4
>> +#define GX_CTRL_OFFSET		0x8
>
> I don't see the point renaming thos defines

It makes clear that indirect addressing offset are for GX SoC only,
which the original define did not do

>
>> +#define  GX_CTRL_APB3_ERRFAIL	BIT(15)
>>   -/* Controller Communication Channel */
>> -#define HDMITX_DWC_ADDR_REG	0x10
>> -#define HDMITX_DWC_DATA_REG	0x14
>> -#define HDMITX_DWC_CTRL_REG	0x18
>> +/*
>> + * NOTE: G12 use direct addressing:
>> + * Ideally it should receive one memory region for each of the top
>> + * and dwc register regions but fixing this would require to change
>> + * the DT bindings. Doing so is a pain. Keep the region as it and work
>> + * around the problem, at least for now.
>> + * Future supported SoCs should properly describe the regions in the
>> + * DT bindings instead of using this trick.
>
> well I disagree here, there's a single memory region for the HDMITX module,
> and the DWC region is controlled by the TOP registers, so the DWC region
> _cannot_ be accessed without correctly configuring the TOP registers.
>
> So I disagree strongly with this comment.

Even if one cannot be accessed without configuring the other, it does
not make it a single region.

The regions do not even use the same register value width.
That's a clear indication they are separate.

Anyway, I'll remove the comment

>
>> + */
>> +#define HDMITX_TOP_G12A_OFFSET	0x8000
>>     /* HHI Registers */
>>   #define HHI_MEM_PD_REG0		0x100 /* 0x40 */
>> @@ -108,28 +117,59 @@
>>   #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
>>   #define  PHY_CNTL1_INIT		0x03900000
>>   #define  PHY_INVERT		BIT(17)
>> +#define  PHY_FIFOS		GENMASK(3, 2)
>> +#define  PHY_CLOCK_EN		BIT(1)
>> +#define  PHY_SOFT_RST		BIT(0)
>
> Please move those changes before or after this patch
>
>>   #define HHI_HDMI_PHY_CNTL2	0x3a8 /* 0xea */
>>   #define HHI_HDMI_PHY_CNTL3	0x3ac /* 0xeb */
>>   #define HHI_HDMI_PHY_CNTL4	0x3b0 /* 0xec */
>>   #define HHI_HDMI_PHY_CNTL5	0x3b4 /* 0xed */
>>   -static DEFINE_SPINLOCK(reg_lock);
>> -
>> -struct meson_dw_hdmi;
>> -
>>   struct meson_dw_hdmi_data {
>> -	unsigned int	(*top_read)(struct meson_dw_hdmi *dw_hdmi,
>> -				    unsigned int addr);
>> -	void		(*top_write)(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr, unsigned int data);
>> -	unsigned int	(*dwc_read)(struct meson_dw_hdmi *dw_hdmi,
>> -				    unsigned int addr);
>> -	void		(*dwc_write)(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr, unsigned int data);
>> +	int (*reg_init)(struct device *dev);
>>   	u32 cntl0_init;
>>   	u32 cntl1_init;
>>   };
>>   +static int hdmi_tx_indirect_reg_read(void *context,
>> +					 unsigned int reg,
>> +					 unsigned int *result)
>> +{
>> +	void __iomem *base = context;
>> +
>> +	/* Must write the read address twice ... */
>> +	writel(reg, base + GX_ADDR_OFFSET);
>> +	writel(reg, base + GX_ADDR_OFFSET);
>> +
>> +	/* ... and read the data twice as well */
>> +	*result = readl(base + GX_DATA_OFFSET);
>> +	*result = readl(base + GX_DATA_OFFSET);
>
> Why did you change the comments ?
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int hdmi_tx_indirect_reg_write(void *context,
>> +				      unsigned int reg,
>> +				      unsigned int val)
>> +{
>> +	void __iomem *base = context;
>> +
>> +	/* Must write the read address twice ... */
>> +	writel(reg, base + GX_ADDR_OFFSET);
>> +	writel(reg, base + GX_ADDR_OFFSET);
>> +
>> +	/* ... but write the data only once */
>> +	writel(val, base + GX_DATA_OFFSET);
>
> Ditto ? were they wrong ?
>
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct regmap_bus hdmi_tx_indirect_mmio = {
>> +	.fast_io = true,
>> +	.reg_read = hdmi_tx_indirect_reg_read,
>> +	.reg_write = hdmi_tx_indirect_reg_write,
>> +};
>> +
>>   struct meson_dw_hdmi {
>>   	struct dw_hdmi_plat_data dw_plat_data;
>>   	struct meson_drm *priv;
>> @@ -139,9 +179,10 @@ struct meson_dw_hdmi {
>>   	struct reset_control *hdmitx_apb;
>>   	struct reset_control *hdmitx_ctrl;
>>   	struct reset_control *hdmitx_phy;
>> -	u32 irq_stat;
>> +	unsigned int irq_stat;
>>   	struct dw_hdmi *hdmi;
>>   	struct drm_bridge *bridge;
>> +	struct regmap *top;
>
> The name could be better, like top_regs or top_regmap

That's not really consistent with priv->hhi, is it ?

>
>>   };
>>     static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi
>> *dw_hdmi,
>> @@ -150,136 +191,6 @@ static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
>>   	return of_device_is_compatible(dw_hdmi->dev->of_node, compat);
>>   }
>>   -/* PHY (via TOP bridge) and Controller dedicated register interface */
>> -
>> -static unsigned int dw_hdmi_top_read(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr)
>> -{
>> -	unsigned long flags;
>> -	unsigned int data;
>> -
>> -	spin_lock_irqsave(&reg_lock, flags);
>> -
>> -	/* ADDR must be written twice */
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_TOP_ADDR_REG);
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_TOP_ADDR_REG);
>> -
>> -	/* Read needs a second DATA read */
>> -	data = readl(dw_hdmi->hdmitx + HDMITX_TOP_DATA_REG);
>> -	data = readl(dw_hdmi->hdmitx + HDMITX_TOP_DATA_REG);
>> -
>> -	spin_unlock_irqrestore(&reg_lock, flags);
>> -
>> -	return data;
>> -}
>> -
>> -static unsigned int dw_hdmi_g12a_top_read(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr)
>> -{
>> -	return readl(dw_hdmi->hdmitx + HDMITX_TOP_G12A_OFFSET + (addr << 2));
>> -}
>> -
>> -static inline void dw_hdmi_top_write(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr, unsigned int data)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&reg_lock, flags);
>> -
>> -	/* ADDR must be written twice */
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_TOP_ADDR_REG);
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_TOP_ADDR_REG);
>> -
>> -	/* Write needs single DATA write */
>> -	writel(data, dw_hdmi->hdmitx + HDMITX_TOP_DATA_REG);
>> -
>> -	spin_unlock_irqrestore(&reg_lock, flags);
>> -}
>> -
>> -static inline void dw_hdmi_g12a_top_write(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr, unsigned int data)
>> -{
>> -	writel(data, dw_hdmi->hdmitx + HDMITX_TOP_G12A_OFFSET + (addr << 2));
>> -}
>> -
>> -/* Helper to change specific bits in PHY registers */
>> -static inline void dw_hdmi_top_write_bits(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr,
>> -					  unsigned int mask,
>> -					  unsigned int val)
>> -{
>> -	unsigned int data = dw_hdmi->data->top_read(dw_hdmi, addr);
>> -
>> -	data &= ~mask;
>> -	data |= val;
>> -
>> -	dw_hdmi->data->top_write(dw_hdmi, addr, data);
>> -}
>> -
>> -static unsigned int dw_hdmi_dwc_read(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr)
>> -{
>> -	unsigned long flags;
>> -	unsigned int data;
>> -
>> -	spin_lock_irqsave(&reg_lock, flags);
>> -
>> -	/* ADDR must be written twice */
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_DWC_ADDR_REG);
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_DWC_ADDR_REG);
>> -
>> -	/* Read needs a second DATA read */
>> -	data = readl(dw_hdmi->hdmitx + HDMITX_DWC_DATA_REG);
>> -	data = readl(dw_hdmi->hdmitx + HDMITX_DWC_DATA_REG);
>> -
>> -	spin_unlock_irqrestore(&reg_lock, flags);
>> -
>> -	return data;
>> -}
>> -
>> -static unsigned int dw_hdmi_g12a_dwc_read(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr)
>> -{
>> -	return readb(dw_hdmi->hdmitx + addr);
>> -}
>> -
>> -static inline void dw_hdmi_dwc_write(struct meson_dw_hdmi *dw_hdmi,
>> -				     unsigned int addr, unsigned int data)
>> -{
>> -	unsigned long flags;
>> -
>> -	spin_lock_irqsave(&reg_lock, flags);
>> -
>> -	/* ADDR must be written twice */
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_DWC_ADDR_REG);
>> -	writel(addr & 0xffff, dw_hdmi->hdmitx + HDMITX_DWC_ADDR_REG);
>> -
>> -	/* Write needs single DATA write */
>> -	writel(data, dw_hdmi->hdmitx + HDMITX_DWC_DATA_REG);
>> -
>> -	spin_unlock_irqrestore(&reg_lock, flags);
>> -}
>> -
>> -static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr, unsigned int data)
>> -{
>> -	writeb(data, dw_hdmi->hdmitx + addr);
>> -}
>> -
>> -/* Helper to change specific bits in controller registers */
>> -static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
>> -					  unsigned int addr,
>> -					  unsigned int mask,
>> -					  unsigned int val)
>> -{
>> -	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
>> -
>> -	data &= ~mask;
>> -	data |= val;
>> -
>> -	dw_hdmi->data->dwc_write(dw_hdmi, addr, data);
>> -}
>> -
>>   /* Bridge */
>>     /* Setup PHY bandwidth modes */
>> @@ -353,13 +264,15 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
>>   	struct meson_drm *priv = dw_hdmi->priv;
>>     	/* Enable and software reset */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xf);
>> -
>> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
>> +			   PHY_FIFOS | PHY_CLOCK_EN | PHY_SOFT_RST,
>> +			   PHY_FIFOS | PHY_CLOCK_EN | PHY_SOFT_RST);
>>   	mdelay(2);
>>     	/* Enable and unreset */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0xe);
>> -
>> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
>> +			   PHY_FIFOS | PHY_CLOCK_EN | PHY_SOFT_RST,
>> +			   PHY_FIFOS | PHY_CLOCK_EN);
>>   	mdelay(2);
>>   }
>>   @@ -382,27 +295,30 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi,
>> void *data,
>>     	/* TMDS pattern setup */
>>   	if (mode->clock > 340000 && !mode_is_420) {
>> -		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
>> -				  0);
>> -		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
>> -				  0x03ff03ff);
>> +		regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_01,
>> +			     0);
>> +		regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_23,
>> +			     0x03ff03ff);
>>   	} else {
>> -		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
>> -				  0x001f001f);
>> -		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
>> -				  0x001f001f);
>> +		regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_01,
>> +			     0x001f001f);
>> +		regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_23,
>> +			     0x001f001f);
>>   	}
>>     	/* Load TMDS pattern */
>> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x1);
>> +	regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_CNTL,
>> +		     TOP_TDMS_CLK_PTTN_LOAD);
>>   	msleep(20);
>> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
>> +	regmap_write(dw_hdmi->top, HDMITX_TOP_TMDS_CLK_PTTN_CNTL,
>> +		     TOP_TDMS_CLK_PTTN_SHFT);
>>     	/* Setup PHY parameters */
>>   	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>>     	/* Disable clock, fifo, fifo_wr */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
>> +	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
>> +			   PHY_FIFOS | PHY_CLOCK_EN | PHY_SOFT_RST, 0);
>>     	dw_hdmi_set_high_tmds_clock_ratio(hdmi, display);
>>   @@ -433,8 +349,11 @@ static enum drm_connector_status
>> dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
>>   			     void *data)
>>   {
>>   	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
>> +	unsigned int stat;
>>   -	return !!dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0) ?
>> +	regmap_read(dw_hdmi->top, HDMITX_TOP_STAT0, &stat);
>> +
>> +	return !!stat ?
>>   		connector_status_connected : connector_status_disconnected;
>>   }
>>   @@ -444,17 +363,18 @@ static void dw_hdmi_setup_hpd(struct dw_hdmi
>> *hdmi,
>>   	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
>>     	/* Setup HPD Filter */
>> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_HPD_FILTER,
>> -			  (0xa << 12) | 0xa0);
>> +	regmap_write(dw_hdmi->top, HDMITX_TOP_HPD_FILTER,
>> +		     FIELD_PREP(TOP_HPD_GLITCH_WIDTH, 10) |
>> +		     FIELD_PREP(TOP_HPD_VALID_WIDTH, 160));
>>     	/* Clear interrupts */
>> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>> -			  HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL);
>> +	regmap_write(dw_hdmi->top, HDMITX_TOP_INTR_STAT_CLR,
>> +		     TOP_INTR_HPD_RISE | TOP_INTR_HPD_FALL);
>>     	/* Unmask interrupts */
>> -	dw_hdmi_top_write_bits(dw_hdmi, HDMITX_TOP_INTR_MASKN,
>> -			HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL,
>> -			HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL);
>> +	regmap_update_bits(dw_hdmi->top, HDMITX_TOP_INTR_MASKN,
>> +			   TOP_INTR_HPD_RISE | TOP_INTR_HPD_FALL,
>> +			   TOP_INTR_HPD_RISE | TOP_INTR_HPD_FALL);
>>   }
>>     static const struct dw_hdmi_phy_ops meson_dw_hdmi_phy_ops = {
>> @@ -467,23 +387,22 @@ static const struct dw_hdmi_phy_ops meson_dw_hdmi_phy_ops = {
>>   static irqreturn_t dw_hdmi_top_irq(int irq, void *dev_id)
>>   {
>>   	struct meson_dw_hdmi *dw_hdmi = dev_id;
>> -	u32 stat;
>> +	unsigned int stat;
>>   -	stat = dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_INTR_STAT);
>> -	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_INTR_STAT_CLR, stat);
>> +	regmap_read(dw_hdmi->top, HDMITX_TOP_INTR_STAT, &stat);
>> +	regmap_write(dw_hdmi->top, HDMITX_TOP_INTR_STAT_CLR, stat);
>>     	/* HPD Events, handle in the threaded interrupt handler */
>> -	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL)) {
>> +	if (stat & (TOP_INTR_HPD_RISE | TOP_INTR_HPD_FALL)) {
>>   		dw_hdmi->irq_stat = stat;
>>   		return IRQ_WAKE_THREAD;
>>   	}
>>     	/* HDMI Controller Interrupt */
>> -	if (stat & 1)
>> +	if (stat & TOP_INTR_CORE)
>>   		return IRQ_NONE;
>>     	/* TOFIX Handle HDCP Interrupts */
>> -
>>   	return IRQ_HANDLED;
>>   }
>>   @@ -494,10 +413,10 @@ static irqreturn_t dw_hdmi_top_thread_irq(int
>> irq, void *dev_id)
>>   	u32 stat = dw_hdmi->irq_stat;
>>     	/* HPD Events */
>> -	if (stat & (HDMITX_TOP_INTR_HPD_RISE | HDMITX_TOP_INTR_HPD_FALL)) {
>> +	if (stat & (TOP_INTR_HPD_RISE | TOP_INTR_HPD_FALL)) {
>>   		bool hpd_connected = false;
>>   -		if (stat & HDMITX_TOP_INTR_HPD_RISE)
>> +		if (stat & TOP_INTR_HPD_RISE)
>>   			hpd_connected = true;
>>     		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
>> @@ -512,63 +431,25 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>>   	return IRQ_HANDLED;
>>   }
>>   -/* DW HDMI Regmap */
>> -
>> -static int meson_dw_hdmi_reg_read(void *context, unsigned int reg,
>> -				  unsigned int *result)
>> -{
>> -	struct meson_dw_hdmi *dw_hdmi = context;
>> -
>> -	*result = dw_hdmi->data->dwc_read(dw_hdmi, reg);
>> -
>> -	return 0;
>> -
>> -}
>> -
>> -static int meson_dw_hdmi_reg_write(void *context, unsigned int reg,
>> -				   unsigned int val)
>> -{
>> -	struct meson_dw_hdmi *dw_hdmi = context;
>> -
>> -	dw_hdmi->data->dwc_write(dw_hdmi, reg, val);
>> -
>> -	return 0;
>> -}
>> -
>> -static const struct regmap_config meson_dw_hdmi_regmap_config = {
>> -	.reg_bits = 32,
>> -	.val_bits = 8,
>> -	.reg_read = meson_dw_hdmi_reg_read,
>> -	.reg_write = meson_dw_hdmi_reg_write,
>> -	.max_register = 0x10000,
>> -	.fast_io = true,
>> -};
>> -
>> -static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
>> -	.top_read = dw_hdmi_top_read,
>> -	.top_write = dw_hdmi_top_write,
>> -	.dwc_read = dw_hdmi_dwc_read,
>> -	.dwc_write = dw_hdmi_dwc_write,
>> -	.cntl0_init = 0x0,
>> -	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
>> +static const struct regmap_config top_gx_regmap_cfg = {
>> +	.reg_bits	= 32,
>> +	.reg_stride	= 4,
>> +	.reg_shift	= -2,
>> +	.val_bits	= 32,
>> +	.max_register	= 0x40,
>>   };
>>   -static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
>> -	.top_read = dw_hdmi_top_read,
>> -	.top_write = dw_hdmi_top_write,
>> -	.dwc_read = dw_hdmi_dwc_read,
>> -	.dwc_write = dw_hdmi_dwc_write,
>> -	.cntl0_init = 0x0,
>> -	.cntl1_init = PHY_CNTL1_INIT,
>> +static const struct regmap_config top_g12_regmap_cfg = {
>> +	.reg_bits	= 32,
>> +	.reg_stride	= 4,
>> +	.val_bits	= 32,
>> +	.max_register	= 0x40,
>>   };
>>   -static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>> -	.top_read = dw_hdmi_g12a_top_read,
>> -	.top_write = dw_hdmi_g12a_top_write,
>> -	.dwc_read = dw_hdmi_g12a_dwc_read,
>> -	.dwc_write = dw_hdmi_g12a_dwc_write,
>> -	.cntl0_init = 0x000b4242, /* Bandgap */
>> -	.cntl1_init = PHY_CNTL1_INIT,
>> +static const struct regmap_config dwc_regmap_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 8,
>> +	.max_register = 0x8000,
>>   };
>>     static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>> @@ -581,41 +462,107 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>   	/* Bring HDMITX MEM output of power down */
>>   	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
>>   -	/* Enable APB3 fail on error */
>> -	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>> -		writel_bits_relaxed(BIT(15), BIT(15),
>> -				    meson_dw_hdmi->hdmitx + HDMITX_TOP_CTRL_REG);
>> -		writel_bits_relaxed(BIT(15), BIT(15),
>> -				    meson_dw_hdmi->hdmitx + HDMITX_DWC_CTRL_REG);
>> -	}
>> -
>>   	/* Bring out of reset */
>> -	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>> -				       HDMITX_TOP_SW_RESET,  0);
>> -
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
>>   	msleep(20);
>>   -	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>> -				       HDMITX_TOP_CLK_CNTL, 0xff);
>> +	/* Enable clocks */
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_CLK_CNTL,
>> +		     TOP_CLK_EN);
>>     	/* Enable normal output to PHY */
>> -	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_BIST_CNTL,
>> +		     TOP_BIST_TMDS_EN);
>>     	/* Setup PHY */
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, meson_dw_hdmi->data->cntl1_init);
>> -	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, meson_dw_hdmi->data->cntl0_init);
>> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1,
>> +		     meson_dw_hdmi->data->cntl1_init);
>> +	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
>> +		     meson_dw_hdmi->data->cntl0_init);
>>     	/* Enable HDMI-TX Interrupt */
>> -	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
>> -				       HDMITX_TOP_INTR_CORE);
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_INTR_STAT_CLR,
>> +		     GENMASK(31, 0));
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_INTR_MASKN,
>> +		     TOP_INTR_CORE);
>> +}
>> +
>> +static int meson_dw_init_regmap_gx(struct device *dev)
>> +{
>> +	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
>> +	struct regmap *map;
>>   -	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>> HDMITX_TOP_INTR_MASKN,
>> -				       HDMITX_TOP_INTR_CORE);
>> +	/* Register TOP glue zone */
>> +	writel_bits_relaxed(GX_CTRL_APB3_ERRFAIL, GX_CTRL_APB3_ERRFAIL,
>> +			    meson_dw_hdmi->hdmitx + HDMITX_TOP_REGS + GX_CTRL_OFFSET);
>>   +	map = devm_regmap_init(dev, &hdmi_tx_indirect_mmio,
>> +			       meson_dw_hdmi->hdmitx + HDMITX_TOP_REGS,
>> +			       &top_gx_regmap_cfg);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init top regmap\n");
>> +
>> +	meson_dw_hdmi->top = map;
>> +
>> +	/* Register DWC zone */
>> +	writel_bits_relaxed(GX_CTRL_APB3_ERRFAIL, GX_CTRL_APB3_ERRFAIL,
>> +			    meson_dw_hdmi->hdmitx + HDMITX_DWC_REGS + GX_CTRL_OFFSET);
>> +
>> +	map = devm_regmap_init(dev, &hdmi_tx_indirect_mmio,
>> +			       meson_dw_hdmi->hdmitx + HDMITX_DWC_REGS,
>> +			       &dwc_regmap_cfg);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init dwc regmap\n");
>> +
>> +	meson_dw_hdmi->dw_plat_data.regm = map;
>> +
>> +	return 0;
>> +}
>> +
>> +static int meson_dw_init_regmap_g12(struct device *dev)
>> +{
>> +	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
>> +	struct regmap *map;
>> +
>> +	/* Register TOP glue zone with the offset */
>> +	map = devm_regmap_init_mmio(dev, meson_dw_hdmi->hdmitx + HDMITX_TOP_G12A_OFFSET,
>> +				    &top_g12_regmap_cfg);
>> +	if (IS_ERR(map))
>> +		dev_err_probe(dev, PTR_ERR(map), "failed to init top regmap\n");
>> +
>> +	meson_dw_hdmi->top = map;
>> +
>> +	/* Register DWC zone */
>> +	map = devm_regmap_init_mmio(dev, meson_dw_hdmi->hdmitx,
>> +				    &dwc_regmap_cfg);
>> +	if (IS_ERR(map))
>> +		dev_err_probe(dev, PTR_ERR(map), "failed to init dwc regmap\n");
>> +
>> +	meson_dw_hdmi->dw_plat_data.regm = map;
>> +
>> +	return 0;
>>   }
>>   +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxbb_data = {
>> +	.reg_init = meson_dw_init_regmap_gx,
>> +	.cntl0_init = 0x0,
>> +	.cntl1_init = PHY_CNTL1_INIT | PHY_INVERT,
>> +};
>> +
>> +static const struct meson_dw_hdmi_data meson_dw_hdmi_gxl_data = {
>> +	.reg_init = meson_dw_init_regmap_gx,
>> +	.cntl0_init = 0x0,
>> +	.cntl1_init = PHY_CNTL1_INIT,
>> +};
>> +
>> +static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>> +	.reg_init = meson_dw_init_regmap_g12,
>> +	.cntl0_init = 0x000b4242, /* Bandgap */
>> +	.cntl1_init = PHY_CNTL1_INIT,
>> +};
>> +
>>   static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>> -				void *data)
>> +			      void *data)
>>   {
>>   	struct platform_device *pdev = to_platform_device(dev);
>>   	const struct meson_dw_hdmi_data *match;
>> @@ -640,6 +587,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	if (!meson_dw_hdmi)
>>   		return -ENOMEM;
>>   +	platform_set_drvdata(pdev, meson_dw_hdmi);
>> +
>>   	meson_dw_hdmi->priv = priv;
>>   	meson_dw_hdmi->dev = dev;
>>   	meson_dw_hdmi->data = match;
>> @@ -682,10 +631,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "Failed to enable all clocks\n");
>>   -	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>> -					      &meson_dw_hdmi_regmap_config);
>> -	if (IS_ERR(dw_plat_data->regm))
>> -		return PTR_ERR(dw_plat_data->regm);
>> +	ret = meson_dw_hdmi->data->reg_init(dev);
>> +	if (ret)
>> +		return ret;
>>     	irq = platform_get_irq(pdev, 0);
>>   	if (irq < 0)
>> @@ -717,8 +665,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-g12a-dw-hdmi"))
>>   		dw_plat_data->use_drm_infoframe = true;
>>   -	platform_set_drvdata(pdev, meson_dw_hdmi);
>> -
>>   	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>>   	if (IS_ERR(meson_dw_hdmi->hdmi))
>>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>> @@ -751,8 +697,7 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
>>   		return 0;
>>     	/* FIXME: This actually bring top out reset on suspend, why ? */
>> -	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>> -				       HDMITX_TOP_SW_RESET, 0);
>> +	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
>>     	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.h b/drivers/gpu/drm/meson/meson_dw_hdmi.h
>> index 08e1c14e4ea0..3ab8c56d5fe1 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.h
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.h
>> @@ -28,6 +28,7 @@
>>    *     0=Release from reset. Default 1.
>>    */
>>   #define HDMITX_TOP_SW_RESET                     (0x000)
>> +#define  TOP_RST_EN				GENMASK(4, 0)
>
> Well NAK, the registers are named HDMITX_TOP_XXXX in the datasheet,
> and TOP_XXXX defines could collide with other too generic defines,
> and in any case don't mix defines renaming with other changes.
>
> Just move the GENMASK in a new patch and leave the HDMITX_ prefix alone.
>
>>     /*
>>    * Bit 31 RW free_clk_en: 0=Enable clock gating for power saving; 1= Disable
>> @@ -45,7 +46,8 @@
>>    * Bit 1 RW tmds_clk_en: 1=enable tmds_clk;  0=disable. Default 0.
>>    * Bit 0 RW pixel_clk_en: 1=enable pixel_clk; 0=disable. Default 0.
>>    */
>> -#define HDMITX_TOP_CLK_CNTL                     (0x001)
>> +#define HDMITX_TOP_CLK_CNTL                     (0x004)
>> +#define  TOP_CLK_EN				GENMASK(7, 0)
>>     /*
>>    * Bit 31:28 RW rxsense_glitch_width: starting from G12A
>> @@ -53,7 +55,9 @@
>>    * Bit 11: 0 RW hpd_valid_width: filter out width <= M*1024.    Default 0.
>>    * Bit 15:12 RW hpd_glitch_width: filter out glitch <= N.       Default 0.
>>    */
>> -#define HDMITX_TOP_HPD_FILTER                   (0x002)
>> +#define HDMITX_TOP_HPD_FILTER                   (0x008)
>> +#define  TOP_HPD_GLITCH_WIDTH			GENMASK(15, 12)
>> +#define  TOP_HPD_VALID_WIDTH			GENMASK(11, 0)
>>     /*
>>    * intr_maskn: MASK_N, one bit per interrupt source.
>> @@ -67,7 +71,7 @@
>>    * [  1] hpd_rise_intr
>>    * [  0] core_intr
>>    */
>> -#define HDMITX_TOP_INTR_MASKN                   (0x003)
>> +#define HDMITX_TOP_INTR_MASKN                   (0x00c)
>>     /*
>>    * Bit 30: 0 RW intr_stat: For each bit, write 1 to manually set the interrupt
>> @@ -80,7 +84,7 @@
>>    * Bit     1 RW hpd_rise
>>    * Bit     0 RW IP interrupt
>>    */
>> -#define HDMITX_TOP_INTR_STAT                    (0x004)
>> +#define HDMITX_TOP_INTR_STAT                    (0x010)
>>     /*
>>    * [7]    rxsense_fall starting from G12A
>> @@ -92,13 +96,12 @@
>>    * [1]	  hpd_rise
>>    * [0]	  core_intr_rise
>>    */
>> -#define HDMITX_TOP_INTR_STAT_CLR                (0x005)
>> -
>> -#define HDMITX_TOP_INTR_CORE		BIT(0)
>> -#define HDMITX_TOP_INTR_HPD_RISE	BIT(1)
>> -#define HDMITX_TOP_INTR_HPD_FALL	BIT(2)
>> -#define HDMITX_TOP_INTR_RXSENSE_RISE	BIT(6)
>> -#define HDMITX_TOP_INTR_RXSENSE_FALL	BIT(7)
>> +#define HDMITX_TOP_INTR_STAT_CLR                (0x014)
>> +#define  TOP_INTR_CORE				BIT(0)
>> +#define  TOP_INTR_HPD_RISE			BIT(1)
>> +#define  TOP_INTR_HPD_FALL			BIT(2)
>> +#define  TOP_INTR_RXSENSE_RISE			BIT(6)
>> +#define  TOP_INTR_RXSENSE_FALL			BIT(7)
>>     /*
>>    * Bit 14:12 RW tmds_sel: 3'b000=Output zero; 3'b001=Output normal TMDS data;
>> @@ -112,29 +115,31 @@
>>    *     2=Output 1-bit pattern; 3=output 10-bit pattern. Default 0.
>>    * Bit 0 RW prbs_pttn_en: 1=Enable PRBS generator; 0=Disable. Default 0.
>>    */
>> -#define HDMITX_TOP_BIST_CNTL                    (0x006)
>> +#define HDMITX_TOP_BIST_CNTL                    (0x018)
>> +#define  TOP_BIST_OUT_MASK			GENMASK(14, 12)
>> +#define  TOP_BIST_TMDS_EN			BIT(12)
>>     /* Bit 29:20 RW shift_pttn_data[59:50]. Default 0. */
>>   /* Bit 19:10 RW shift_pttn_data[69:60]. Default 0. */
>>   /* Bit  9: 0 RW shift_pttn_data[79:70]. Default 0. */
>> -#define HDMITX_TOP_SHIFT_PTTN_012               (0x007)
>> +#define HDMITX_TOP_SHIFT_PTTN_012               (0x01c)
>>     /* Bit 29:20 RW shift_pttn_data[29:20]. Default 0. */
>>   /* Bit 19:10 RW shift_pttn_data[39:30]. Default 0. */
>>   /* Bit  9: 0 RW shift_pttn_data[49:40]. Default 0. */
>> -#define HDMITX_TOP_SHIFT_PTTN_345               (0x008)
>> +#define HDMITX_TOP_SHIFT_PTTN_345               (0x020)
>>     /* Bit 19:10 RW shift_pttn_data[ 9: 0]. Default 0. */
>>   /* Bit  9: 0 RW shift_pttn_data[19:10]. Default 0. */
>> -#define HDMITX_TOP_SHIFT_PTTN_67                (0x009)
>> +#define HDMITX_TOP_SHIFT_PTTN_67                (0x024)
>>     /* Bit 25:16 RW tmds_clk_pttn[19:10]. Default 0. */
>>   /* Bit  9: 0 RW tmds_clk_pttn[ 9: 0]. Default 0. */
>> -#define HDMITX_TOP_TMDS_CLK_PTTN_01             (0x00A)
>> +#define HDMITX_TOP_TMDS_CLK_PTTN_01             (0x028)
>>     /* Bit 25:16 RW tmds_clk_pttn[39:30]. Default 0. */
>>   /* Bit  9: 0 RW tmds_clk_pttn[29:20]. Default 0. */
>> -#define HDMITX_TOP_TMDS_CLK_PTTN_23             (0x00B)
>> +#define HDMITX_TOP_TMDS_CLK_PTTN_23             (0x02c)
>>     /*
>>    * Bit 1 RW shift_tmds_clk_pttn:1=Enable shifting clk pattern,
>> @@ -143,18 +148,22 @@
>>    * [	1] shift_tmds_clk_pttn
>>    * [	0] load_tmds_clk_pttn
>>    */
>> -#define HDMITX_TOP_TMDS_CLK_PTTN_CNTL           (0x00C)
>> +#define HDMITX_TOP_TMDS_CLK_PTTN_CNTL           (0x030)
>> +#define  TOP_TDMS_CLK_PTTN_LOAD			BIT(0)
>> +#define  TOP_TDMS_CLK_PTTN_SHFT			BIT(1)
>>     /*
>>    * Bit 0 RW revocmem_wr_fail: Read back 1 to indicate Host write REVOC MEM
>>    * failure, write 1 to clear the failure flag.  Default 0.
>>    */
>> -#define HDMITX_TOP_REVOCMEM_STAT                (0x00D)
>> +#define HDMITX_TOP_REVOCMEM_STAT                (0x034)
>>     /*
>>    * Bit	   1 R	filtered RxSense status
>>    * Bit     0 R  filtered HPD status.
>>    */
>> -#define HDMITX_TOP_STAT0                        (0x00E)
>> +#define HDMITX_TOP_STAT0                        (0x038)
>> +#define  TOP_STAT0_HPD				BIT(0)
>> +#define  TOP_STAT0_RXSENSE			BIT(1)
>>     #endif /* __MESON_DW_HDMI_H */

-- 
Jerome
