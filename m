Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2E6A28745
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F012B10E76A;
	Wed,  5 Feb 2025 10:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hNHjbTa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175F110E76A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 10:02:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-540201cfedbso5905549e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738749754; x=1739354554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6tthie2AMgfczBe+cPCWEPv8r35bgR8C8bmKfufzVOU=;
 b=hNHjbTa7nKfp0uzLSEo04FnInvdLMiqS7CgDFJ0ZLhLahdHLCQRxIWQgvqBJqxMHGL
 H+6VyDhgTJVf9/Wd3rP/XukdQBnZ90NmCsaspDjYA44Dwb2cy1R7BK9AqQul4Oc+lhSZ
 gsOYru+1XnGX18t4tIqUwT1rPRCpLD/of8ClqRGv+/VEe6TlpAhSFxgGxRGtNRSfbhWF
 BJ5Gc6TQGrUbemIJuZxpJKW1C4a1Z3dPZQhumAMyrIwMG0xBXIdkagvNh4w67jZB3P4A
 kxDeHmo6zDNenTBLtACcDuPXb9NXofiMuHZyR/8NQx1WZCy7489cSgDaNpW4HEN60ox7
 EGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738749754; x=1739354554;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6tthie2AMgfczBe+cPCWEPv8r35bgR8C8bmKfufzVOU=;
 b=T4TMJWkFwwDw/AjBr1Ec+P5tG/+fcc+O++wVOsvMv2Cyzrb+vi/3mQo1ZN+gXFLKKY
 9zxYqSgThP34uvo40i0d1nkA71GWa3X8AzPzewwWII0q2KN+gWWydLTZvHmubno5UEwa
 tWSg/E8O571f7e70TOr6EM76EkJ5FRtkETjmESZm5jH/rYIYi6Rs/RLLmO53JV2f2gtb
 BgdYwYvZiyQ8AZ4sd5SIimDxghfgkafzThUuYAWI6VdL4WtM/lDlxGPaX6vlRcXF7v6i
 dHlupVZsVya/45e8P3vv6gZBOWZgXLT8CudCt2m18B/UqlUca4b2XoF95FXiNl1FRFYI
 pELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWifRL0+p2ZGSs9s8Av92gD7vBUo6P5/IDrWB3PNz8n2O+Elb1ERBAzz7oPu42dslL442oT4ihce9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS/HBPXWERZMMaj0yHM8CXkb7My8zklMhTEh6Y3IcRXVeTOdLA
 VIj6JOtKRnHJ8CTNR0QnbYMcO2qRIPt/TFe+48EtsGT/bHq2RyPtcHpfLpAFVdg=
X-Gm-Gg: ASbGncsdy7foqr6IEWqVk/HN1gfAvqzfNaA+z0QSML8kxAK8ZW8+u6KI+gR4GVROqUB
 m7FtPLuWpESe64k6N+92AmkZHSeaWtpA4QXqU76u5xfhfsOYZu/TndXLaoqzlHdIAawC8ce2DF1
 OtPMPwCFf/8D8aBRKsPigt94dO9EdxzXFxa3TgREkEKrhyqeQcck0U2xABY0mGV1ptAwchGGBv7
 rIgp6ajBSUE9ai31oMWLJ7jsOveICAJlxiwbLK2wYPL7VwXWuXMeaHly3Qk7CMQcat2+A0ehf4x
 cnmAYxIQoOJp9l1k8Sf8j//p+u79q/Lj2NVORAABlFLHx8i93jUWzWCu
X-Google-Smtp-Source: AGHT+IGrVgsdJfeqSutmhZYYLCzNXW43RxqKlbaqEEOCIK4Z6umuyLbuTi/9uO8y00VrhQtJdGIUiw==
X-Received: by 2002:a05:6512:2398:b0:543:f1a0:9e82 with SMTP id
 2adb3069b0e04-54405a1069cmr582676e87.6.1738749754054; 
 Wed, 05 Feb 2025 02:02:34 -0800 (PST)
Received: from [127.0.0.1] (85-76-37-138-nat.elisa-mobile.fi. [85.76.37.138])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebe219e8sm1859539e87.106.2025.02.05.02.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:02:33 -0800 (PST)
Date: Wed, 05 Feb 2025 12:02:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
CC: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com,
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shiyongbang@huawei.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_drm-dp_3/4=5D_dr?=
 =?US-ASCII?Q?m/hisilicon/hibmc=3A_Add_debugf?=
 =?US-ASCII?Q?s_interface_to_enable_colorbar_feature_and_get_link_status?=
User-Agent: Thunderbird for Android
In-Reply-To: <4594feeb-abbd-4f73-b2e9-d375acf3d9c2@huawei.com>
References: <20250127032024.1542219-1-shiyongbang@huawei.com>
 <20250127032024.1542219-4-shiyongbang@huawei.com>
 <wvulxrhuyzcsy5dwe7oaipjklqfgsurlkb74szungtq3vsvgs3@73v2lesfdvee>
 <4594feeb-abbd-4f73-b2e9-d375acf3d9c2@huawei.com>
Message-ID: <AF758F07-1121-4A3F-8A51-85DA530A8B57@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 5 February 2025 10:18:00 EET, Yongbang Shi <shiyongbang@huawei=2Ecom> wr=
ote:
>> On Mon, Jan 27, 2025 at 11:20:23AM +0800, Yongbang Shi wrote:
>>> From: Baihan Li <libaihan@huawei=2Ecom>
>>>=20
>>> Create 3 files in drm debugfs:
>> This definitely needs to be split=2E
>
>Hi Dmitry,
>
>Right, I got it=2E I will split any patch which has mutiple fileds changi=
ng blended together=2E
>
>
>>> colorbar-cfg: Get/Set colorbar cfg
>> What does that mean?
>>=20
>It's a dp's color bar output, and we have a configuration that
>we can set color bar's color type and stripe movement=2E

What is a DP colour bar?

>
>
>>> hibmc-dp: Get dp link status
>>> hibmc-dp-edid: Print edid information
>> edid-decode /sys/class/drm/card0-DP-1/edid ?
>
>Yeah, we can directly use "cat" to print edid info by it=2E I will add co=
mments and
>example in next series git log=2E

What is the benefit in having a nonstandard EDID decoder in the kernel if =
you can use cat to get hexdump from sysfs and then use any of the tools ava=
ilable for EDID deciding?

>
>
>>> Signed-off-by: Baihan Li <libaihan@huawei=2Ecom>
>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei=2Ecom>
>>> ---
>>>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm=2Eh  |   3 +
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Ec    |  58 +++++
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Eh    |  44 ++++
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link=2Ec  |  40 +++-
>>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg=2Eh   |   4 +-
>>>   =2E=2E=2E/drm/hisilicon/hibmc/hibmc_drm_debugfs=2Ec   | 214 ++++++++=
++++++++++
>>>   =2E=2E=2E/gpu/drm/hisilicon/hibmc/hibmc_drm_dp=2Ec    |   2 +
>>>   =2E=2E=2E/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Ec   |   3 +
>>>   =2E=2E=2E/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Eh   |   2 +
>>>   10 files changed, 363 insertions(+), 10 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs=
=2Ec
>>>=20
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/dr=
m/hisilicon/hibmc/Makefile
>>> index 35a74cc10c80=2E=2Ec14f5182c067 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
>>> @@ -1,5 +1,6 @@
>>>   # SPDX-License-Identifier: GPL-2=2E0-only
>>>   hibmc-drm-y :=3D hibmc_drm_drv=2Eo hibmc_drm_de=2Eo hibmc_drm_vdac=
=2Eo hibmc_drm_i2c=2Eo \
>>> -	       dp/dp_aux=2Eo dp/dp_link=2Eo dp/dp_hw=2Eo dp/dp_phy=2Eo hibmc=
_drm_dp=2Eo
>>> +	       dp/dp_aux=2Eo dp/dp_link=2Eo dp/dp_hw=2Eo dp/dp_phy=2Eo hibmc=
_drm_dp=2Eo \
>>> +	       hibmc_drm_debugfs=2Eo
>>>     obj-$(CONFIG_DRM_HISI_HIBMC) +=3D hibmc-drm=2Eo
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm=2Eh b/drivers/=
gpu/drm/hisilicon/hibmc/dp/dp_comm=2Eh
>>> index 7edcecd5a5f0=2E=2E67f6c81a35ed 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm=2Eh
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm=2Eh
>>> @@ -26,6 +26,9 @@ struct hibmc_link_status {
>>>   struct hibmc_link_cap {
>>>   	u8 link_rate;
>>>   	u8 lanes;
>>> +	int rx_dpcd_revision;
>>> +	bool is_tps3;
>>> +	bool is_tps4;
>>>   };
>>>     struct hibmc_dp_link {
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Ec b/drivers/gp=
u/drm/hisilicon/hibmc/dp/dp_hw=2Ec
>>> index 50050908606f=2E=2E9c8b91ff0e3b 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Ec
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Ec
>>> @@ -226,3 +226,61 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct=
 drm_display_mode *mode)
>>>     	return 0;
>>>   }
>>> +
>>> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
>>> +{
>>> +	return dp->dp_dev->link=2Ecap=2Elink_rate;
>>> +}
>>> +
>>> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
>>> +{
>>> +	return dp->dp_dev->link=2Ecap=2Elanes;
>>> +}
>>> +
>>> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp)
>>> +{
>>> +	return dp->dp_dev->link=2Ecap=2Erx_dpcd_revision;
>>> +}
>>> +
>>> +static const struct hibmc_dp_color_raw g_rgb_raw[] =3D {
>>> +	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
>>> +	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
>>> +	{CBAR_RED,       0xfff, 0x000, 0x000},
>>> +	{CBAR_ORANGE,    0xfff, 0x800, 0x000},
>>> +	{CBAR_YELLOW,    0xfff, 0xfff, 0x000},
>>> +	{CBAR_GREEN,     0x000, 0xfff, 0x000},
>>> +	{CBAR_CYAN,      0x000, 0x800, 0x800},
>>> +	{CBAR_BLUE,      0x000, 0x000, 0xfff},
>>> +	{CBAR_PURPLE,    0x800, 0x000, 0x800},
>>> +	{CBAR_BLACK,     0x000, 0x000, 0x000},
>>> +};
>>> +
>>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cba=
r_cfg *cfg)
>>> +{
>>> +	struct hibmc_dp_dev *dp_dev =3D dp->dp_dev;
>>> +	struct hibmc_dp_color_raw raw_data;
>>> +
>>> +	if (cfg->enable) {
>>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(9),
>>> +					 cfg->self_timing);
>>> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(8=
, 1),
>>> +					 cfg->dynamic_rate);
>>> +		if (cfg->pattern =3D=3D CBAR_COLOR_BAR) {
>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10),=
 0);
>>> +		} else {
>>> +			raw_data =3D g_rgb_raw[cfg->pattern];
>>> +			drm_dbg_dp(dp->drm_dev, "r:%x g:%x b:%x\n", raw_data=2Er_value,
>>> +				   raw_data=2Eg_value, raw_data=2Eb_value);
>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10),=
 1);
>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(=
23, 12),
>>> +						 raw_data=2Er_value);
>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK=
(23, 12),
>>> +						 raw_data=2Eg_value);
>>> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK=
(11, 0),
>>> +						 raw_data=2Eb_value);
>>> +		}
>>> +	}
>>> +
>>> +	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cf=
g->enable);
>>> +	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CT=
RL);
>>> +}
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Eh b/drivers/gp=
u/drm/hisilicon/hibmc/dp/dp_hw=2Eh
>>> index 53b6d0beecea=2E=2Ef2f59f2feb3c 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Eh
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw=2Eh
>>> @@ -14,6 +14,44 @@
>>>     struct hibmc_dp_dev;
>>>   +enum hibmc_dp_cbar_pattern {
>>> +	CBAR_COLOR_BAR,
>>> +	CBAR_WHITE,
>>> +	CBAR_RED,
>>> +	CBAR_ORANGE,
>>> +	CBAR_YELLOW,
>>> +	CBAR_GREEN,
>>> +	CBAR_CYAN,
>>> +	CBAR_BLUE,
>>> +	CBAR_PURPLE,
>>> +	CBAR_BLACK,
>>> +};
>>> +
>>> +struct hibmc_dp_color_raw {
>>> +	enum hibmc_dp_cbar_pattern pattern;
>>> +	u32 r_value;
>>> +	u32 g_value;
>>> +	u32 b_value;
>>> +};
>>> +
>>> +struct hibmc_dp_cbar_cfg {
>>> +	bool enable;
>>> +	bool self_timing;
>>> +	u8 dynamic_rate; /* 0:static, 1-255(frame):dynamic */
>>> +	enum hibmc_dp_cbar_pattern pattern;
>>> +};
>>> +
>>> +enum hibmc_dp_hpd_status {
>>> +	HIBMC_DP_HPD_DETECTING,
>>> +	HIBMC_DP_HPD_IN,
>>> +	HIBMC_DP_HPD_OUT,
>>> +	HIBMC_DP_HPD_SHORT, /* Short hpd (irq_hpd) */
>>> +	HIBMC_DP_HPD_DET_FAIL,
>>> +	HIBMC_DP_HPD_IN_SIMULATE,
>>> +	HIBMC_DP_HPD_OUT_SIMULATE,
>>> +	HIBMC_DP_HPD_SHORT_SIMULATE,
>>> +};
>>> +
>>>   struct hibmc_dp {
>>>   	struct hibmc_dp_dev *dp_dev;
>>>   	struct drm_device *drm_dev;
>>> @@ -21,10 +59,16 @@ struct hibmc_dp {
>>>   	struct drm_connector connector;
>>>   	void __iomem *mmio;
>>>   	struct drm_dp_aux aux;
>>> +	struct hibmc_dp_cbar_cfg cfg;
>>> +	bool is_inited;
>>>   };
>>>     int hibmc_dp_hw_init(struct hibmc_dp *dp);
>>>   int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *=
mode);
>>>   void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
>>> +int hibmc_dp_get_dpcd(struct hibmc_dp *dp);
>>> +u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
>>> +u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
>>> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cba=
r_cfg *cfg);
>>>     #endif
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link=2Ec b/drivers/=
gpu/drm/hisilicon/hibmc/dp/dp_link=2Ec
>>> index 695cb9c0b643=2E=2E20849f1ebd0c 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link=2Ec
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link=2Ec
>>> @@ -4,9 +4,11 @@
>>>   #include <linux/delay=2Eh>
>>>   #include <drm/drm_device=2Eh>
>>>   #include <drm/drm_print=2Eh>
>>> +
>>>   #include "dp_comm=2Eh"
>>>   #include "dp_reg=2Eh"
>>>   #include "dp_phy=2Eh"
>>> +#include "dp_config=2Eh"
>>>     #define HIBMC_EQ_MAX_RETRY 5
>>>   @@ -42,11 +44,7 @@ static int hibmc_dp_link_training_configure(struc=
t hibmc_dp_dev *dp)
>>>   		return ret >=3D 0 ? -EIO : ret;
>>>   	}
>>>   -	ret =3D drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
>>> -	if (ret)
>>> -		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>>> -
>>> -	return ret;
>>> +	return 0;
>>>   }
>>>     static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int =
pattern)
>>> @@ -189,15 +187,17 @@ static int hibmc_dp_link_training_cr(struct hibm=
c_dp_dev *dp)
>>>   	bool level_changed;
>>>   	u32 voltage_tries;
>>>   	u32 cr_tries;
>>> +	u32 max_cr;
>>>   	int ret;
>>>     	/*
>>>   	 * DP 1=2E4 spec define 10 for maxtries value, for pre DP 1=2E4 ver=
sion set a limit of 80
>>>   	 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage r=
etries)
>>>   	 */
>>> +	 max_cr =3D dp->link=2Ecap=2Erx_dpcd_revision >=3D DP_DPCD_REV_14 ? =
10 : 80;
>>>     	voltage_tries =3D 1;
>>> -	for (cr_tries =3D 0; cr_tries < 80; cr_tries++) {
>>> +	for (cr_tries =3D 0; cr_tries < max_cr; cr_tries++) {
>>>   		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
>>>     		ret =3D drm_dp_dpcd_read_link_status(dp->aux, lane_status);
>>> @@ -234,7 +234,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_=
dp_dev *dp)
>>>   		voltage_tries =3D level_changed ? 1 : voltage_tries + 1;
>>>   	}
>>>   -	drm_err(dp->dev, "dp link training clock recovery 80 times failed\=
n");
>>> +	drm_err(dp->dev, "dp link training clock recovery %u times failed\n"=
, max_cr);
>>>   	dp->link=2Estatus=2Eclock_recovered =3D false;
>>>     	return 0;
>>> @@ -244,9 +244,17 @@ static int hibmc_dp_link_training_channel_eq(stru=
ct hibmc_dp_dev *dp)
>>>   {
>>>   	u8 lane_status[DP_LINK_STATUS_SIZE] =3D {0};
>>>   	u8 eq_tries;
>>> +	int tps;
>>>   	int ret;
>>>   -	ret =3D hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
>>> +	if (dp->link=2Ecap=2Eis_tps4)
>>> +		tps =3D DP_TRAINING_PATTERN_4;
>>> +	else if (dp->link=2Ecap=2Eis_tps3)
>>> +		tps =3D DP_TRAINING_PATTERN_3;
>>> +	else
>>> +		tps =3D DP_TRAINING_PATTERN_2;
>>> +
>>> +	ret =3D hibmc_dp_link_set_pattern(dp, tps);
>>>   	if (ret)
>>>   		return ret;
>>>   @@ -313,11 +321,27 @@ static int hibmc_dp_link_downgrade_training_eq=
(struct hibmc_dp_dev *dp)
>>>   	return hibmc_dp_link_reduce_rate(dp);
>>>   }
>>>   +static void hibmc_dp_update_caps(struct hibmc_dp_dev *dp)
>>> +{
>>> +	dp->link=2Ecap=2Erx_dpcd_revision =3D dp->dpcd[DP_DPCD_REV];
>>> +
>>> +	dp->link=2Ecap=2Eis_tps3 =3D (dp->dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV=
_13) &&
>>> +			       (dp->dpcd[DP_MAX_LANE_COUNT] & DP_TPS3_SUPPORTED);
>>> +	dp->link=2Ecap=2Eis_tps4 =3D (dp->dpcd[DP_DPCD_REV] >=3D DP_DPCD_REV=
_14) &&
>>> +			       (dp->dpcd[DP_MAX_DOWNSPREAD] & DP_TPS4_SUPPORTED);
>>> +}
>>> +
>>>   int hibmc_dp_link_training(struct hibmc_dp_dev *dp)
>>>   {
>>>   	struct hibmc_dp_link *link =3D &dp->link;
>>>   	int ret;
>>>   +	ret =3D drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
>>> +	if (ret)
>>> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>>> +
>>> +	hibmc_dp_update_caps(dp);
>>> +
>>>   	while (true) {
>>>   		ret =3D hibmc_dp_link_training_cr_pre(dp);
>>>   		if (ret)
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg=2Eh b/drivers/g=
pu/drm/hisilicon/hibmc/dp/dp_reg=2Eh
>>> index 99ba9c951c41=2E=2Ec43ad6b30c2c 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg=2Eh
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg=2Eh
>>> @@ -23,6 +23,8 @@
>>>   #define HIBMC_DP_VIDEO_MSA1			0x11c
>>>   #define HIBMC_DP_VIDEO_MSA2			0x120
>>>   #define HIBMC_DP_VIDEO_HORIZONTAL_SIZE		0X124
>>> +#define HIBMC_DP_COLOR_BAR_CTRL			0x260
>>> +#define HIBMC_DP_COLOR_BAR_CTRL1		0x264
>>>   #define HIBMC_DP_TIMING_GEN_CONFIG0		0x26c
>>>   #define HIBMC_DP_TIMING_GEN_CONFIG2		0x274
>>>   #define HIBMC_DP_TIMING_GEN_CONFIG3		0x278
>>> @@ -72,6 +74,6 @@
>>>   #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
>>>   #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>>>   #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
>>> -#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION GENMASK(31, 20)
>>> +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
>>>     #endif
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs=2Ec b/d=
rivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs=2Ec
>>> new file mode 100644
>>> index 000000000000=2E=2Ef6885399c2b3
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs=2Ec
>>> @@ -0,0 +1,214 @@
>>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>>> +// Copyright (c) 2024 Hisilicon Limited=2E
>>> +
>>> +#include <linux/debugfs=2Eh>
>>> +#include <linux/device=2Eh>
>>> +#include <linux/seq_file=2Eh>
>>> +#include <linux/pci=2Eh>
>>> +
>>> +#include <drm/drm_drv=2Eh>
>>> +#include <drm/drm_file=2Eh>
>>> +#include <drm/drm_debugfs=2Eh>
>>> +#include <drm/drm_edid=2Eh>
>>> +
>>> +#include "hibmc_drm_drv=2Eh"
>>> +
>>> +static void hibmc_dump_edid(struct seq_file *m, const struct edid *ed=
id)
>>> +{
>>> +	const struct detailed_pixel_timing *pixel_data;
>>> +	int i;
>>> +
>>> +	seq_puts(m, "EDID:\n");
>>> +	seq_printf(m, "\theader: 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0=
x%02x 0x%02x\n",
>>> +		   edid->header[0], edid->header[1], edid->header[2], edid->header[=
3],
>>> +		   edid->header[4], edid->header[5], edid->header[6], edid->header[=
7]);
>>> +
>>> +	seq_puts(m, "Vendor & product info:\n");
>>> +	seq_printf(m, "\tmfg_id: 0x%02x 0x%02x\n", edid->mfg_id[0], edid->mf=
g_id[1]);
>>> +	seq_printf(m, "\tprod_code: 0x%02x 0x%02x\n", edid->prod_code[0], ed=
id->prod_code[1]);
>>> +	seq_printf(m, "\tserial: 0x%08x\n", edid->serial);
>>> +	seq_printf(m, "\tmfg_week/year: 0x%02x 0x%02x\n", edid->mfg_week, ed=
id->mfg_year);
>>> +
>>> +	seq_puts(m, "EDID version:\n");
>>> +	seq_printf(m, "\tversion: 0x%02x\n", edid->version);
>>> +	seq_printf(m, "\trevision: 0x%02x\n", edid->revision);
>>> +
>>> +	seq_puts(m, "Display info:\n");
>>> +	seq_printf(m, "\tinput: 0x%02x\n", edid->input);
>>> +	seq_printf(m, "\twidth_cm: 0x%02x\n", edid->width_cm);
>>> +	seq_printf(m, "\theight_cm: 0x%02x\n", edid->height_cm);
>>> +	seq_printf(m, "\tgamma: 0x%02x\n", edid->gamma);
>>> +	seq_printf(m, "\tfeatures: 0x%02x\n", edid->features);
>>> +
>>> +	seq_puts(m, "Color characteristics:\n");
>>> +	seq_printf(m, "\tred_green_lo: 0x%02x\n", edid->red_green_lo);
>>> +	seq_printf(m, "\tblue/black_white_lo: 0x%02x\n", *(&edid->red_green_=
lo) + 1);
>>> +	seq_printf(m, "\tred_x/y: 0x%02x 0x%02x\n", edid->red_x, edid->red_y=
);
>>> +	seq_printf(m, "\tgreen_x/y: 0x%02x 0x%02x\n", edid->green_x, edid->g=
reen_y);
>>> +	seq_printf(m, "\tblue_x/y: 0x%02x 0x%02x\n", edid->blue_x, edid->blu=
e_y);
>>> +	seq_printf(m, "\twhite_x/y: 0x%02x 0x%02x\n", edid->white_x, edid->w=
hite_y);
>>> +
>>> +	seq_puts(m, "Est=2E timings and mfg rsvd timings:\n");
>>> +	seq_printf(m, "\test_timings_t1/2: 0x%02x 0x%02x\n",
>>> +		   edid->established_timings=2Et1, edid->established_timings=2Et2);
>>> +
>>> +	seq_puts(m, "Standard timings 1-8:\n");
>>> +	for (i =3D 0; i < ARRAY_SIZE(edid->standard_timings); i++) {
>>> +		seq_printf(m, "\tstandard_timings[%d] hsize/vfreq_aspect: 0x%02x 0x=
%02x\n",
>>> +			   i, edid->standard_timings[i]=2Ehsize,
>>> +			   edid->standard_timings[i]=2Evfreq_aspect);
>>> +	}
>>> +
>>> +	seq_puts(m, "Detailing timings 1-4:\n");
>>> +	for (i =3D 0; i < ARRAY_SIZE(edid->detailed_timings); i++) {
>>> +		pixel_data =3D &edid->detailed_timings[i]=2Edata=2Epixel_data;
>>> +		seq_printf(m, "\tdetailed_timing[%d] pixel_clock: 0x%04x\n",
>>> +			   i, edid->detailed_timings[i]=2Epixel_clock);
>>> +		seq_printf(m, "\tdetailed_timing[%d] hactive: %u\n", i,
>>> +			   (pixel_data->hactive_hblank_hi & 0xf0) << 4 | pixel_data->hacti=
ve_lo);
>>> +		seq_printf(m, "\tdetailed_timing[%d] vactive: %u\n", i,
>>> +			   (pixel_data->vactive_vblank_hi & 0xf0) << 4 | pixel_data->vacti=
ve_lo);
>>> +	}
>>> +
>>> +	seq_puts(m, "Others:\n");
>>> +	seq_printf(m, "\textensions: 0x%02x\n", edid->extensions);
>>> +	seq_printf(m, "\tchecksum: 0x%02x\n", edid->checksum);
>>> +}
>>> +
>>> +static int hibmc_dp_edid_show(struct seq_file *m, void *arg)
>>> +{
>>> +	struct drm_info_node *node =3D m->private;
>>> +	struct drm_device *dev =3D node->minor->dev;
>>> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>>> +	struct edid *edid;
>>> +	char name[20];
>>> +	int idx;
>>> +
>>> +	if (!drm_dev_enter(dev, &idx))
>>> +		return -ENODEV;
>>> +
>>> +	edid =3D drm_get_edid(&priv->dp=2Econnector, &priv->dp=2Eaux=2Eddc);
>>> +	if (edid) {
>>> +		drm_edid_get_monitor_name(edid, name, ARRAY_SIZE(name));
>>> +		seq_printf(m, "Monitor name: %s\n", name);
>>> +		hibmc_dump_edid(m, edid);
>>> +		kfree(edid);
>>> +	} else {
>>> +		seq_puts(m, "No connector available!\n");
>>> +	}
>>> +
>>> +	drm_dev_exit(idx);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int hibmc_dp_show(struct seq_file *m, void *arg)
>>> +{
>>> +	struct drm_info_node *node =3D m->private;
>>> +	struct drm_device *dev =3D node->minor->dev;
>>> +	struct hibmc_drm_private *priv =3D to_hibmc_drm_private(dev);
>>> +	int idx;
>>> +
>>> +	if (!drm_dev_enter(dev, &idx))
>>> +		return -ENODEV;
>>> +
>>> +	seq_printf(m, "enable lanes: %u\n", hibmc_dp_get_lanes(&priv->dp));
>>> +	seq_printf(m, "link rate: %d\n", hibmc_dp_get_link_rate(&priv->dp) *=
 27);
>>> +	seq_printf(m, "vfresh: %d\n", drm_mode_vrefresh(&priv->crtc=2Emode))=
;
>>> +	seq_printf(m, "dpcd version: 0x%x\n", hibmc_dp_get_dpcd(&priv->dp));
>>> +
>>> +	drm_dev_exit(idx);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static ssize_t hibmc_control_write(struct file *file, const char __us=
er *user_buf,
>>> +				   size_t size, loff_t *ppos)
>>> +{
>>> +	struct hibmc_drm_private *priv =3D file_inode(file)->i_private;
>>> +	struct hibmc_dp_cbar_cfg *cfg =3D &priv->dp=2Ecfg;
>>> +	u32 input =3D 0;
>>> +	int ret, idx;
>>> +	u8 val;
>>> +
>>> +	ret =3D kstrtou32_from_user(user_buf, size, 0, &input);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	val =3D FIELD_GET(GENMASK(13, 10), input);
>>> +	if (val > 9)
>>> +		return -EINVAL;
>>> +	cfg->pattern =3D val;
>>> +	cfg->enable =3D FIELD_GET(BIT(0), input);
>>> +	cfg->self_timing =3D FIELD_GET(BIT(1), input);
>>> +	cfg->dynamic_rate =3D FIELD_GET(GENMASK(9, 2), input);
>>> +
>>> +	ret =3D drm_dev_enter(&priv->dev, &idx);
>>> +	if (!ret)
>>> +		return -ENODEV;
>>> +
>>> +	hibmc_dp_set_cbar(&priv->dp, cfg);
>>> +
>>> +	drm_dev_exit(idx);
>>> +
>>> +	return size;
>>> +}
>>> +
>>> +static int hibmc_dp_dbgfs_show(struct seq_file *m, void *arg)
>>> +{
>>> +	struct hibmc_drm_private *priv =3D m->private;
>>> +	struct hibmc_dp_cbar_cfg *cfg =3D &priv->dp=2Ecfg;
>>> +	u32 output =3D 0;
>>> +	int idx;
>>> +
>>> +	if (!drm_dev_enter(&priv->dev, &idx))
>>> +		return -ENODEV;
>>> +
>>> +	/* bit[0]: 0: enable colorbar, 1: disable colorbar
>>> +	 * bit[1]: 0: timing follows XDP, 1: internal self timing
>>> +	 * bit[2,9]: 0: static colorbar image,
>>> +	 *           1~255: right shifting a type of color per (1~255)frames
>>> +	 * bit[10,13]: 0~9: color bar, white, red, orange,
>>> +	 *             yellow, green, cyan, bule, pupper, black
>>> +	 */
>>> +	output =3D cfg->enable | (cfg->self_timing << 1) |
>>> +		 (cfg->dynamic_rate << 2) | (cfg->pattern << 10);
>>> +
>>> +	drm_dev_exit(idx);
>>> +
>>> +	seq_printf(m, "hibmc dp colorbar cfg: %u\n", output);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int hibmc_open(struct inode *inode, struct file *filp)
>>> +{
>>> +	return single_open(filp, hibmc_dp_dbgfs_show, inode->i_private);
>>> +}
>>> +
>>> +static const struct file_operations hibmc_dbg_fops =3D {
>>> +	=2Eowner   =3D THIS_MODULE,
>>> +	=2Ewrite   =3D hibmc_control_write,
>>> +	=2Eread    =3D seq_read,
>>> +	=2Eopen    =3D hibmc_open,
>>> +	=2Ellseek  =3D seq_lseek,
>>> +	=2Erelease =3D single_release,
>>> +};
>>> +
>>> +static struct drm_info_list hibmc_debugfs_list[] =3D {
>>> +	{ "hibmc-dp", hibmc_dp_show },
>>> +	{ "hibmc-dp-edid", hibmc_dp_edid_show },
>>> +};
>>> +
>>> +void hibmc_debugfs_register(struct hibmc_drm_private *priv)
>>> +{
>>> +	struct drm_connector *dp_conn =3D &priv->dp=2Econnector;
>>> +	struct drm_minor *minor =3D priv->dev=2Eprimary;
>>> +
>>> +	/* create the file in drm directory, so we don't need to remove manu=
ally */
>>> +	debugfs_create_file("colorbar-cfg", 0200,
>>> +			    dp_conn->debugfs_entry, priv, &hibmc_dbg_fops);
>>> +
>>> +	drm_debugfs_create_files(hibmc_debugfs_list, ARRAY_SIZE(hibmc_debugf=
s_list),
>>> +				 minor->debugfs_root, minor);
>>> +}
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp=2Ec b/driver=
s/gpu/drm/hisilicon/hibmc/hibmc_drm_dp=2Ec
>>> index fac8485a69d9=2E=2Ecc1f9ee0656f 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp=2Ec
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp=2Ec
>>> @@ -146,5 +146,7 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>>>     	drm_connector_attach_encoder(connector, encoder);
>>>   +	dp->is_inited =3D true;
>>> +
>>>   	return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Ec b/drive=
rs/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Ec
>>> index bade693d9730=2E=2E3d4d5185c523 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Ec
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Ec
>>> @@ -352,6 +352,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>>>   		goto err_unload;
>>>   	}
>>>   +	if (priv->dp=2Eis_inited)
>>> +		hibmc_debugfs_register(priv);
>> Please use debugfs_init() callback for that
>>=20
>>=20
>>> +
>>>   	drm_client_setup(dev, NULL);
>>>     	return 0;
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Eh b/drive=
rs/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Eh
>>> index 3ddd71aada66=2E=2Eff61efb8a2ab 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Eh
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv=2Eh
>>> @@ -69,4 +69,6 @@ int hibmc_ddc_create(struct drm_device *drm_dev, str=
uct hibmc_vdac *connector);
>>>     int hibmc_dp_init(struct hibmc_drm_private *priv);
>>>   +void hibmc_debugfs_register(struct hibmc_drm_private *priv);
>>> +
>>>   #endif
>>> --=20
>>> 2=2E33=2E0
>>>=20

