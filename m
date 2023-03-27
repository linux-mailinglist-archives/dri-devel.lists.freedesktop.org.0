Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD086C9DE9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 10:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EAA10E096;
	Mon, 27 Mar 2023 08:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CD010E096
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679905983; x=1711441983;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rQkQFFARodZAWLn6M7t7NWjKx+Qr4ZsrnIS1liy4gUk=;
 b=SGRv3NZTFTzpgECatpNWjfmNsym27hESd59CErN6hl5r7D5ijCIdPd1Y
 9GgPzA5FkwICkCtOkf8PT8ncT4lltjr0vSROVKE0d62vuC5fzTRJkx+3S
 wG55LFeSVkq/wTNMmQGEdSDbH8dYoR6wy/2ASP+DYUOV8afVYWTspYRPU
 XJidw8wN2YKLcoLHnF7wFAMOkBeViH2PY0bkLERDUhOzeu9tftXXmHvrY
 w+LjeZCfalKZmEBStW8Y1+R+DWpNtEQxZQXVVv9ErBnICVeHEKhCSu31h
 ncu9rzjF29cjdoGySwgwRkKiIupacAlz81bKmUyPmanXJX+Q48WaQDi1w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="338932285"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="338932285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 01:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="713790151"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="713790151"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.71])
 ([10.213.25.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 01:32:59 -0700
Message-ID: <c78389ca-ca0d-da13-7471-21aff6cc346c@intel.com>
Date: Mon, 27 Mar 2023 10:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: it6505: Add range and selector_reg
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20230327044804.3657551-1-hsinyi@chromium.org>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230327044804.3657551-1-hsinyi@chromium.org>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 kenneth.hung@ite.corp-partner.google.com, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27.03.2023 06:48, Hsin-Yi Wang wrote:
> There are 2 banks on it6505, and when writing to different bank,
> REG_BANK_SEL needs to be set to the targeted bank. The current code set
> this additionally, which causes a race condition when a process is
> writing bank 0 registers while another process set the bank to 1. Set
> ranges in regmap config so the regmap API would handle the bank changes.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Looks cool, especially comparing to locking patches.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 34 +++++++++++++++++++----------
>   1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index bc451b2a77c28..abaf6e23775eb 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -258,12 +258,12 @@
>   #define REG_AUD_INFOFRAM_SUM 0xFB
>   
>   /* the following six registers are in bank1 */
> -#define REG_DRV_0_DB_800_MV 0x7E
> -#define REG_PRE_0_DB_800_MV 0x7F
> -#define REG_PRE_3P5_DB_800_MV 0x81
> -#define REG_SSC_CTRL0 0x88
> -#define REG_SSC_CTRL1 0x89
> -#define REG_SSC_CTRL2 0x8A
> +#define REG_DRV_0_DB_800_MV 0x17E
> +#define REG_PRE_0_DB_800_MV 0x17F
> +#define REG_PRE_3P5_DB_800_MV 0x181
> +#define REG_SSC_CTRL0 0x188
> +#define REG_SSC_CTRL1 0x189
> +#define REG_SSC_CTRL2 0x18A
>   
>   #define RBR DP_LINK_BW_1_62
>   #define HBR DP_LINK_BW_2_7
> @@ -489,7 +489,7 @@ static const struct it6505_audio_sample_rate_map audio_sample_rate_map[] = {
>   };
>   
>   static const struct regmap_range it6505_bridge_volatile_ranges[] = {
> -	{ .range_min = 0, .range_max = 0xFF },
> +	{ .range_min = 0, .range_max = 0x1FF },
>   };
>   
>   static const struct regmap_access_table it6505_bridge_volatile_table = {
> @@ -497,11 +497,27 @@ static const struct regmap_access_table it6505_bridge_volatile_table = {
>   	.n_yes_ranges = ARRAY_SIZE(it6505_bridge_volatile_ranges),
>   };
>   
> +static const struct regmap_range_cfg it6505_regmap_banks[] = {
> +	{
> +		.name = "it6505",
> +		.range_min = 0x00,
> +		.range_max = 0x1FF,
> +		.selector_reg = REG_BANK_SEL,
> +		.selector_mask = 0x1,
> +		.selector_shift = 0,
> +		.window_start = 0x00,
> +		.window_len = 0x100,
> +	},
> +};
> +
>   static const struct regmap_config it6505_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
>   	.volatile_table = &it6505_bridge_volatile_table,
>   	.cache_type = REGCACHE_NONE,
> +	.ranges = it6505_regmap_banks,
> +	.num_ranges = ARRAY_SIZE(it6505_regmap_banks),
> +	.max_register = 0x1FF,
>   };
>   
>   static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
> @@ -1267,7 +1283,6 @@ static void it6505_init(struct it6505 *it6505)
>   	it6505_write(it6505, REG_TIME_STMP_CTRL,
>   		     EN_SSC_GAT | EN_ENHANCE_VID_STMP | EN_ENHANCE_AUD_STMP);
>   	it6505_write(it6505, REG_INFOFRAME_CTRL, 0x00);
> -	it6505_write(it6505, REG_BANK_SEL, 0x01);
>   	it6505_write(it6505, REG_DRV_0_DB_800_MV,
>   		     afe_setting_table[it6505->afe_setting][0]);
>   	it6505_write(it6505, REG_PRE_0_DB_800_MV,
> @@ -1277,7 +1292,6 @@ static void it6505_init(struct it6505 *it6505)
>   	it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
>   	it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
>   	it6505_write(it6505, REG_SSC_CTRL2, 0x42);
> -	it6505_write(it6505, REG_BANK_SEL, 0x00);
>   }
>   
>   static void it6505_video_disable(struct it6505 *it6505)
> @@ -1506,11 +1520,9 @@ static void it6505_setup_ssc(struct it6505 *it6505)
>   	it6505_set_bits(it6505, REG_TRAIN_CTRL0, SPREAD_AMP_5,
>   			it6505->enable_ssc ? SPREAD_AMP_5 : 0x00);
>   	if (it6505->enable_ssc) {
> -		it6505_write(it6505, REG_BANK_SEL, 0x01);
>   		it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
>   		it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
>   		it6505_write(it6505, REG_SSC_CTRL2, 0x42);
> -		it6505_write(it6505, REG_BANK_SEL, 0x00);
>   		it6505_write(it6505, REG_SP_CTRL0, 0x07);
>   		it6505_write(it6505, REG_IP_CTRL1, 0x29);
>   		it6505_write(it6505, REG_IP_CTRL2, 0x03);

