Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F4B6C7DDD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 13:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599B910E091;
	Fri, 24 Mar 2023 12:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF58310E091
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679660293; x=1711196293;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PKE0MEshjiDwVlOUwR4Uz4lxMO0rQWAJqCRKBhjdS1k=;
 b=MneyLKVWYbdgYUDXS92K1vG0vYbn95j5h9yyQFgoAX54tAheg3HBwBAt
 q2LUw/KK4IHIf4zXLEVlT3cctafmMEKGGRAXuP2nTktxfWyU7x/zXWyUQ
 w0HMAJhsoOpTDkLUGsYLZ6/NGNKK8XyBZoLczqi6ntiGj2B3oMRFxj2Yp
 +Dlm+6unNk8+3oNdllT8hMR8rxL29ISF6IRnVjk/AT/AlfSR5HE12dGg/
 JNFKAIqCIEXIGP8KuTnlSwSaRzy/BCbhuiDIdUgvSwGoaSXT80AxJwQK9
 Rbqf+6NXWpebQXaKkAswoXPivd4C01UB3E/ea4JlZws1EW/AdC3JuahmZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328182533"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="328182533"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 05:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771867047"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="771867047"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.24.232])
 ([10.213.24.232])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 05:18:09 -0700
Message-ID: <f4573a49-ae05-07bf-4e7c-70037b4596b9@intel.com>
Date: Fri, 24 Mar 2023 13:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/bridge: it6505: Add lock for it6505 i2c bank
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20230324072958.2993946-1-hsinyi@chromium.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230324072958.2993946-1-hsinyi@chromium.org>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 kenneth.hung@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.03.2023 08:29, Hsin-Yi Wang wrote:
> From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
>
> When the i2c bank register (REG_BANK_SEL) is set to 1,
> only the registers belong to bank 1 can be written.
> There will be a race condition when a process is writing
> bank 0 registers while another process set the bank to 1.
> Add a mutex to handle regmap read/write locking for
> registers in multiple i2c bank. Since the driver now
> owns the lock, there's no need to use regmap API's lock.
>
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 72 ++++++++++++++++++++++-------
>   1 file changed, 55 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index bc451b2a77c28..1a8dcc49fc1ee 100644
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
> @@ -414,12 +414,14 @@ struct it6505 {
>   	struct mutex extcon_lock;
>   	struct mutex mode_lock; /* used to bridge_detect */
>   	struct mutex aux_lock; /* used to aux data transfers */
> +	struct mutex bank_lock; /* used to protect i2c bank access */
>   	struct regmap *regmap;
>   	struct drm_display_mode source_output_mode;
>   	struct drm_display_mode video_info;
>   	struct notifier_block event_nb;
>   	struct extcon_dev *extcon;
>   	struct work_struct extcon_wq;
> +	int bank_state;   /* 1 indicates bank 1, 0 indicates bank 0 */
>   	int extcon_state;
>   	enum drm_connector_status connector_status;
>   	enum link_train_status link_state;
> @@ -502,8 +504,22 @@ static const struct regmap_config it6505_regmap_config = {
>   	.val_bits = 8,
>   	.volatile_table = &it6505_bridge_volatile_table,
>   	.cache_type = REGCACHE_NONE,
> +	.disable_locking = true,
> +	.can_sleep = true,
>   };
>   
> +static int it6505_config_bank(struct it6505 *it6505, unsigned int reg_addr)
> +{
> +	int err = 0, target = !!(reg_addr > 0xff);
> +
> +	if (target != it6505->bank_state) {

It would be better to return if equal, this way you can avoid indentation.

> +		err = regmap_write(it6505->regmap, REG_BANK_SEL, target);
> +		if (!err)
> +			it6505->bank_state = target;
> +	}
> +	return err;
> +}
> +
>   static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
>   {
>   	unsigned int value;
> @@ -513,7 +529,10 @@ static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
>   	if (!it6505->powered)
>   		return -ENODEV;
>   
> -	err = regmap_read(it6505->regmap, reg_addr, &value);
> +	mutex_lock(&it6505->bank_lock);
> +	err = it6505_config_bank(it6505, reg_addr);
> +	err |= regmap_read(it6505->regmap, reg_addr & 0xff, &value);

Shoudn't be rather if (!err) err = regmap_read(...) ?

> +	mutex_unlock(&it6505->bank_lock);
>   	if (err < 0) {
>   		dev_err(dev, "read failed reg[0x%x] err: %d", reg_addr, err);
>   		return err;
> @@ -531,8 +550,10 @@ static int it6505_write(struct it6505 *it6505, unsigned int reg_addr,
>   	if (!it6505->powered)
>   		return -ENODEV;
>   
> -	err = regmap_write(it6505->regmap, reg_addr, reg_val);
> -
> +	mutex_lock(&it6505->bank_lock);
> +	err = it6505_config_bank(it6505, reg_addr);
> +	err |= regmap_write(it6505->regmap, reg_addr & 0xff, reg_val);
> +	mutex_unlock(&it6505->bank_lock);
>   	if (err < 0) {
>   		dev_err(dev, "write failed reg[0x%x] = 0x%x err = %d",
>   			reg_addr, reg_val, err);
> @@ -551,7 +572,10 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
>   	if (!it6505->powered)
>   		return -ENODEV;
>   
> -	err = regmap_update_bits(it6505->regmap, reg, mask, value);
> +	mutex_lock(&it6505->bank_lock);
> +	err = it6505_config_bank(it6505, reg);
> +	err |= regmap_update_bits(it6505->regmap, reg & 0xff, mask, value);
> +	mutex_unlock(&it6505->bank_lock);
>   	if (err < 0) {
>   		dev_err(dev, "write reg[0x%x] = 0x%x mask = 0x%x failed err %d",
>   			reg, value, mask, err);
> @@ -892,7 +916,10 @@ static void it6505_aux_reset(struct it6505 *it6505)
>   
>   static void it6505_reset_logic(struct it6505 *it6505)
>   {
> +	mutex_lock(&it6505->bank_lock);
> +	it6505_config_bank(it6505, REG_RESET_CTRL);
>   	regmap_write(it6505->regmap, REG_RESET_CTRL, ALL_LOGIC_RESET);
> +	mutex_unlock(&it6505->bank_lock);

Why not call it6505_write ?
>   	usleep_range(1000, 1500);
>   }
>   
> @@ -972,9 +999,14 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
>   	it6505_write(it6505, REG_AUX_ADR_16_19,
>   		     ((address >> 16) & 0x0F) | ((size - 1) << 4));
>   
> -	if (cmd == CMD_AUX_NATIVE_WRITE)
> +	if (cmd == CMD_AUX_NATIVE_WRITE) {
> +		mutex_lock(&it6505->bank_lock);
> +		it6505_config_bank(it6505, REG_AUX_OUT_DATA0);
>   		regmap_bulk_write(it6505->regmap, REG_AUX_OUT_DATA0, buffer,
>   				  size);
> +		mutex_unlock(&it6505->bank_lock);
> +	}
> +
>   
>   	/* Aux Fire */
>   	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
> @@ -1197,9 +1229,12 @@ static int it6505_send_video_infoframe(struct it6505 *it6505,
>   	if (err)
>   		return err;
>   
> -	err = regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
> +	mutex_lock(&it6505->bank_lock);
> +	err = it6505_config_bank(it6505, REG_AVI_INFO_DB1);
> +	err |= regmap_bulk_write(it6505->regmap, REG_AVI_INFO_DB1,
>   				buffer + HDMI_INFOFRAME_HEADER_SIZE,
>   				frame->length);
> +	mutex_unlock(&it6505->bank_lock);

Common code with it6505_aux_operation, maybe it6505_bulk_write ?

Have you checked if regmap does not support banking? IMO it should be 
implemented there.

Regards
Andrzej

>   	if (err)
>   		return err;
>   
> @@ -1267,7 +1302,6 @@ static void it6505_init(struct it6505 *it6505)
>   	it6505_write(it6505, REG_TIME_STMP_CTRL,
>   		     EN_SSC_GAT | EN_ENHANCE_VID_STMP | EN_ENHANCE_AUD_STMP);
>   	it6505_write(it6505, REG_INFOFRAME_CTRL, 0x00);
> -	it6505_write(it6505, REG_BANK_SEL, 0x01);
>   	it6505_write(it6505, REG_DRV_0_DB_800_MV,
>   		     afe_setting_table[it6505->afe_setting][0]);
>   	it6505_write(it6505, REG_PRE_0_DB_800_MV,
> @@ -1277,7 +1311,6 @@ static void it6505_init(struct it6505 *it6505)
>   	it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
>   	it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
>   	it6505_write(it6505, REG_SSC_CTRL2, 0x42);
> -	it6505_write(it6505, REG_BANK_SEL, 0x00);
>   }
>   
>   static void it6505_video_disable(struct it6505 *it6505)
> @@ -1506,11 +1539,9 @@ static void it6505_setup_ssc(struct it6505 *it6505)
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
> @@ -1983,8 +2014,11 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
>   	it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ,
>   			HDCP_EN_M0_READ);
>   
> -	err = regmap_bulk_read(it6505->regmap, REG_M0_0_7,
> +	mutex_lock(&it6505->bank_lock);
> +	err = it6505_config_bank(it6505, REG_M0_0_7);
> +	err |= regmap_bulk_read(it6505->regmap, REG_M0_0_7,
>   			       sha1_input + msg_count, 8);
> +	mutex_unlock(&it6505->bank_lock);
>   
>   	it6505_set_bits(it6505, REG_HDCP_CTRL2, HDCP_EN_M0_READ, 0x00);
>   
> @@ -2577,6 +2611,9 @@ static int it6505_poweron(struct it6505 *it6505)
>   	}
>   
>   	it6505->powered = true;
> +	mutex_lock(&it6505->bank_lock);
> +	it6505->bank_state = 0;
> +	mutex_unlock(&it6505->bank_lock);
>   	it6505_reset_logic(it6505);
>   	it6505_int_mask_enable(it6505);
>   	it6505_init(it6505);
> @@ -3359,6 +3396,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
>   	mutex_init(&it6505->extcon_lock);
>   	mutex_init(&it6505->mode_lock);
>   	mutex_init(&it6505->aux_lock);
> +	mutex_init(&it6505->bank_lock);
>   
>   	it6505->bridge.of_node = client->dev.of_node;
>   	it6505->connector_status = connector_status_disconnected;

