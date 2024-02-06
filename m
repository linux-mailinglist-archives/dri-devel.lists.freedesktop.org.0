Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9CD84B9B2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B39112C92;
	Tue,  6 Feb 2024 15:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="zdnaWU3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0298E10EF28
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707233664;
 bh=XgiTQotyP9cWm8ZvuJIfQXTCZ2Bws18URvrJ3C6ih5o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zdnaWU3dQCBPaHawdFqk+TpHGBsy+8XTi/w9HV5A1zSvZ8wzLHyYU90RZkjH/i6AC
 /s/dpRIpHmXcN8UtJuCh0qogYhcA2UWRjs2S+THEYAPzy074hGux2r0y0PvDRCprTE
 ELQ99cuivMdcen7JrMB9FvDAiGjRHdIS+cgKiHAVx4PrXcdwArws8pHVipRyRXkHiU
 9WqbjcScAuHvx6O70h5PB8Om0OlsL1Z73MALwP9kBCgaiYp90JiKRZh3jInp4pv0jF
 lK0gquna27UbNnRPCMtZsYsB/zqshFd6zMBWFERiPKgbB8lghow387ws6gb/YRcIBg
 96toMZPVUphMQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B172A37803EE;
 Tue,  6 Feb 2024 15:34:23 +0000 (UTC)
Message-ID: <bd1b6561-d862-4482-aa1b-365429dd4e1c@collabora.com>
Date: Tue, 6 Feb 2024 16:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x
 feature for DisplayPort
Content-Language: en-US
To: "mac.shen" <mac.shen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: shuijing.li@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240205055055.25340-1-mac.shen@mediatek.com>
 <20240205055055.25340-3-mac.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240205055055.25340-3-mac.shen@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 05/02/24 06:50, mac.shen ha scritto:
> Add HDCP2.x feature for DisplayPort.
> When userspace request the kernel protect future content communicated
> over the link with Content_Protection property, the feature will do
> HDCP2.x authentication if the sink support HDCP2.X.
> 
> Changes in v2:
> - remove switch case, and refine code to make more clear
> - remove some definitions, and use the definitions in
>    include/drm/drm_hdcp.h
> - use the struct which defined in include/drm/drm_hdcp.h
> - do HDCP2.x authentication when userspace request the
>    kernel protect future content communicated
> per suggestion from the previous thread:
> https://lore.kernel.org/all/8fff59b5567449d8201dd1138c8fa
> 9218a545c46.camel@mediatek.com/
> 
> Signed-off-by: mac.shen <mac.shen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/Makefile       |    1 +
>   drivers/gpu/drm/mediatek/mtk_dp.c       |  297 +++++--
>   drivers/gpu/drm/mediatek/mtk_dp.h       |   99 +++
>   drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c | 1021 +++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h |   52 ++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h   |    4 +-
>   drivers/gpu/drm/mediatek/mtk_dpi.c      |    3 +
>   7 files changed, 1392 insertions(+), 85 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index c80e6c2f9336..50ea069b047e 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -27,6 +27,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>   
>   mtk-dp-objs := tlc_dp_hdcp.o \
> +		  mtk_dp_hdcp2.o \
>   		  mtk_dp.o
>   
>   obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk-dp.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e4c16ba9902d..7ff72f15528b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (c) 2019-2022 MediaTek Inc.
> + * Copyright (c) 2019-2024 MediaTek Inc.
>    * Copyright (c) 2022 BayLibre
>    */
>   
> @@ -8,13 +8,13 @@
>   #include <drm/display/drm_dp.h>
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_bridge.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_panel.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_hdcp_helper.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> @@ -30,10 +30,10 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
>   #include <linux/soc/mediatek/mtk_sip_svc.h>
> -#include <sound/hdmi-codec.h>
> -#include <video/videomode.h>
>   
> +#include "mtk_dp.h"
>   #include "mtk_dp_reg.h"
> +#include "mtk_dp_hdcp2.h"
>   
>   #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
>   #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
> @@ -52,43 +52,6 @@
>   #define MTK_DP_VERSION 0x11
>   #define MTK_DP_SDP_AUI 0x4
>   
> -enum {
> -	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
> -	MTK_DP_CAL_CLKTX_IMPSE,
> -	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0,
> -	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1,
> -	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2,
> -	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3,
> -	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0,
> -	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1,
> -	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2,
> -	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3,
> -	MTK_DP_CAL_MAX,
> -};
> -
> -struct mtk_dp_train_info {
> -	bool sink_ssc;
> -	bool cable_plugged_in;
> -	/* link_rate is in multiple of 0.27Gbps */
> -	int link_rate;
> -	int lane_count;
> -	unsigned int channel_eq_pattern;
> -};
> -
> -struct mtk_dp_audio_cfg {
> -	bool detect_monitor;
> -	int sad_count;
> -	int sample_rate;
> -	int word_length_bits;
> -	int channels;
> -};
> -
> -struct mtk_dp_info {
> -	enum dp_pixelformat format;
> -	struct videomode vm;
> -	struct mtk_dp_audio_cfg audio_cur_cfg;
> -};
> -
>   struct mtk_dp_efuse_fmt {
>   	unsigned short idx;
>   	unsigned short shift;
> @@ -98,44 +61,6 @@ struct mtk_dp_efuse_fmt {
>   	unsigned short default_val;
>   };
>   
> -struct mtk_dp {
> -	bool enabled;
> -	bool need_debounce;
> -	int irq;
> -	u8 max_lanes;
> -	u8 max_linkrate;
> -	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> -	u32 cal_data[MTK_DP_CAL_MAX];
> -	u32 irq_thread_handle;
> -	/* irq_thread_lock is used to protect irq_thread_handle */
> -	spinlock_t irq_thread_lock;
> -
> -	struct device *dev;
> -	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
> -	struct drm_connector *conn;
> -	struct drm_device *drm_dev;
> -	struct drm_dp_aux aux;
> -
> -	const struct mtk_dp_data *data;
> -	struct mtk_dp_info info;
> -	struct mtk_dp_train_info train_info;
> -
> -	struct platform_device *phy_dev;
> -	struct phy *phy;
> -	struct regmap *regs;
> -	struct timer_list debounce_timer;
> -
> -	/* For audio */
> -	bool audio_enable;
> -	hdmi_codec_plugged_cb plugged_cb;
> -	struct platform_device *audio_pdev;
> -
> -	struct device *codec_dev;
> -	/* protect the plugged_cb as it's used in both bridge ops and audio */
> -	struct mutex update_plugged_status_lock;
> -};
> -
>   struct mtk_dp_data {
>   	int bridge_type;
>   	unsigned int smc_cmd;
> @@ -319,12 +244,28 @@ static struct regmap_config mtk_dp_regmap_config = {
>   	.name = "mtk-dp-registers",
>   };
>   
> +u32 mtk_dp_get_system_time(void)
> +{
> +	u32 tms = (u32)((sched_clock() / 1000000) % 1000000);

You want to use ktime_get_coarse_ns() or ktime_get_mono_fast_ns() and not
sched_clock(), besides, I don't get the sense of the MOD 1000000.....

Whatever, I'd write this one like:

u32 mtk_dp_get_system_time_ms(void)
{
	return (u32)(ktime_get_coarse_ns() / 1000000ULL);
}

...but then I don't get why you're not simply using the time in nanoseconds
and converting it to milliseconds all the time: okay, ns would be 64-bits but
I don't see the problem about that?!

If it is about not changing the wait time constants that are expressed in
milliseconds, you can simply redefine something like

#define SOME_MAX_WAIT_MS	20

to

#define MS_TO_NS(x)		((x) * NSEC_PER_MSEC)

#define SOME_MAX_WAIT_MS	MS_TO_NS(20)

...so that your functions won't perform any division, won't care about casting
between u32 and u64, won't ever be affected by possible overflows, so way less
possible issues to care about.

I say that wins over a total of 1-4 bytes of memory saving :-)

> +	return tms;
> +}
> +
> +u32 mtk_dp_get_time_diff(u32 pre_time)
> +{
> +	u32 post_time = mtk_dp_get_system_time();
> +
> +	if (pre_time > post_time)
> +		return ((1000000 - pre_time) + post_time);
> +	else
> +		return (post_time - pre_time);
> +}
> +
>   static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
>   {
>   	return container_of(b, struct mtk_dp, bridge);
>   }
>   
> -static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
> +u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
>   {
>   	u32 read_val;
>   	int ret;
> @@ -350,8 +291,8 @@ static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
>   	return ret;
>   }
>   
> -static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
> -			      u32 val, u32 mask)
> +int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
> +		       u32 val, u32 mask)
>   {
>   	int ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
>   
> @@ -1865,6 +1806,160 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
>   	mtk_dp_digital_sw_reset(mtk_dp);
>   }
>   
> +void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
> +{
> +	if (!only_hdcp1x && dp_tx_hdcp2_support(&mtk_dp->hdcp_info))
> +		return;
> +
> +	if (tee_add_device(&mtk_dp->hdcp_info, HDCP_NONE) != RET_SUCCESS)
> +		mtk_dp->hdcp_info.auth_status = AUTH_FAIL;
> +}
> +
> +static void mtk_dp_check_sink_esi(struct mtk_dp *mtk_dp)
> +{
> +	u8 clear_cp_irq = BIT(2);
> +
> +	if (mtk_dp->hdcp_info.hdcp2_info.enable) {
> +		dp_tx_hdcp2_irq(&mtk_dp->hdcp_info);
> +		drm_dp_dpcd_write(&mtk_dp->aux,
> +				  DP_DEVICE_SERVICE_IRQ_VECTOR, &clear_cp_irq, 0x1);
> +	}
> +	/*hdcp 1.x do not need irq*/
> +}
> +
> +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)

static int mtk_dp_hpd_sink_event(...)

> +{
> +	ssize_t ret;
> +	u8 sink_count;
> +	u8 sink_count_200;
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT_ESI, &sink_count);
> +	if (ret < 0) {
> +		drm_info(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);
> +		return;

return ret

> +	}
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count_200);
> +	if (ret < 0) {
> +		drm_info(mtk_dp->drm_dev,
> +			 "Read DP_SINK_COUNT_ESI failed: %ld\n", ret);
> +		return;

return ret

> +	}
> +
> +	mtk_dp_check_sink_esi(mtk_dp);

return 0;

> +}
> +
> +static void mtk_dp_hdcp_handle(struct work_struct *data)
> +{
> +	struct mtk_dp *mtk_dp = container_of(data, struct mtk_dp, hdcp_work);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in)
> +		return;
> +
> +	if (mtk_dp->hdcp_info.auth_status == AUTH_PREPARE) {
> +		mtk_dp_check_hdcp_version(mtk_dp, false);
> +		if (mtk_dp->hdcp_info.hdcp2_info.enable)
> +			dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, true);
> +		else
> +			mtk_dp->hdcp_info.auth_status = AUTH_ZERO;
> +	}
> +
> +	while (mtk_dp->hdcp_info.hdcp2_info.enable &&
> +	       mtk_dp->hdcp_info.auth_status != AUTH_FAIL &&
> +			mtk_dp->hdcp_info.auth_status != AUTH_PASS) {

Set an iteration limit to this, or it can potentially spin forever.

while (x && y && z && some_number > 0 {
	if (...) do_something()

	some_number--;
}

if (it_never_ran)
	return -ESOMETHING

return 0;

> +		if (mtk_dp->hdcp_info.hdcp2_info.enable)
> +			dp_tx_hdcp2_fsm(&mtk_dp->hdcp_info);
> +	}
> +}
> +
> +static void mtk_dp_hdcp_prop_work(struct work_struct *work)
> +{
> +	struct mtk_dp *mtk_dp;
> +	struct delayed_work *dework;
> +	struct drm_device *drm_dev;
> +
> +	dework = to_delayed_work(work);
> +	mtk_dp = container_of(dework, struct mtk_dp, prop_work);
> +
> +	if (!mtk_dp->conn) {
> +		dev_err(mtk_dp->dev, "connector is null!");
> +		return;
> +	}
> +
> +	drm_dev = mtk_dp->conn->dev;
> +
> +	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> +

if (mtk_dp->hdcp_info.auth_status == AUTH_PASS)
	mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_ENABLED;
else if (mtk_dp->hdcp_info.content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
	mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
else
	mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;

That's more readable :-)

> +	if (mtk_dp->hdcp_info.content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
> +		mtk_dp->hdcp_info.content_protection =
> +		(mtk_dp->hdcp_info.auth_status == AUTH_PASS) ? DRM_MODE_CONTENT_PROTECTION_ENABLED :
> +		DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +	else
> +		mtk_dp->hdcp_info.content_protection =
> +		(mtk_dp->hdcp_info.auth_status == AUTH_PASS) ? DRM_MODE_CONTENT_PROTECTION_ENABLED :
> +		DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> +
> +	dev_info(mtk_dp->dev, "update CP, content protection: %d, auth status:%d\n",
> +		 mtk_dp->hdcp_info.content_protection, mtk_dp->hdcp_info.auth_status);
> +	drm_hdcp_update_content_protection(mtk_dp->conn, mtk_dp->hdcp_info.content_protection);
> +
> +	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> +}
> +
> +static void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, struct drm_connector_state *state)
> +{

I propose:

static void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, struct 
drm_connector_state *state)
{
	unsigned int old_content_protection = mtk_dp->hdcp_info.content_protection;
	unsigned int new_content_protection = state->content_protection;
	unsigned int hdcp_content_type = state->hdcp_content_type;

	dev_dbg(mtk_dp->dev, "CP type and protection, atomic: %d, %d, driver:%d, %d\n",
		hdcp_content_type, content_protection,
		mtk_dp->hdcp_info.hdcp_content_type, mtk_dp->hdcp_info.content_protection);

	if (new_content_protection != DRM_MODE_CONTENT_PROTECTION_DESIRED &&
	    (hdcp_content_type == mtk_dp->hdcp_info.hdcp_content_type ||
	     new_content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
		return;

	mtk_dp->hdcp_info.content_protection = new_content_protection;

	if (old_content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
		dev_dbg(mtk_dp->dev, "disable HDCP\n");
		if (mtk_dp->hdcp_info.hdcp2_info.enable)
			dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);

		drm_hdcp_update_content_protection(mtk_dp->conn,
						   mtk_dp->hdcp_info.content_protection);
	} else {
		mtk_dp->hdcp_info.hdcp_content_type = hdcp_content_type;
		mtk_dp->hdcp_info.hdcp2_info.stream_id_type = hdcp_content_type;

		if (mtk_dp->hdcp_info.auth_status == AUTH_FAIL ||
		    mtk_dp->hdcp_info.auth_status == AUTH_ZERO) {
			dev_dbg(mtk_dp->dev, "enable HDCP\n");
			mtk_dp_authentication(&mtk_dp->hdcp_info);

			queue_delayed_work(mtk_dp->hdcp_workqueue,
					   &mtk_dp->prop_work, msecs_to_jiffies(2000));
	}
}




> +	unsigned int hdcp_content_type = state->hdcp_content_type;
> +	unsigned int content_protection = state->content_protection;
> +
> +	dev_dbg(mtk_dp->dev, "CP type and protection, atomic: %d, %d, driver:%d, %d\n",
> +		hdcp_content_type, content_protection,
> +		mtk_dp->hdcp_info.hdcp_content_type, mtk_dp->hdcp_info.content_protection);
> +
> +	if ((content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED &&
> +	     mtk_dp->hdcp_info.content_protection == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
> +		(hdcp_content_type != mtk_dp->hdcp_info.hdcp_content_type &&
> +		 content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
> +		mtk_dp->hdcp_info.content_protection = content_protection;
> +
> +		dev_dbg(mtk_dp->dev, "disable HDCP\n");
> +		if (mtk_dp->hdcp_info.hdcp2_info.enable)
> +			dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);
> +
> +		drm_hdcp_update_content_protection(mtk_dp->conn,
> +						   mtk_dp->hdcp_info.content_protection);
> +	}
> +
> +	if (content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED ||
> +	    (hdcp_content_type != mtk_dp->hdcp_info.hdcp_content_type &&
> +		 content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)) {
> +		mtk_dp->hdcp_info.content_protection = content_protection;
> +		mtk_dp->hdcp_info.hdcp_content_type = hdcp_content_type;
> +		mtk_dp->hdcp_info.hdcp2_info.stream_id_type = hdcp_content_type;
> +
> +		if (mtk_dp->hdcp_info.auth_status == AUTH_FAIL ||
> +		    mtk_dp->hdcp_info.auth_status == AUTH_ZERO) {
> +			dev_dbg(mtk_dp->dev, "enable HDCP\n");
> +			mtk_dp_authentication(&mtk_dp->hdcp_info);
> +
> +			queue_delayed_work(mtk_dp->hdcp_workqueue,
> +					   &mtk_dp->prop_work, msecs_to_jiffies(2000));
> +		}
> +	}
> +}
> +
> +void mtk_dp_authentication(struct mtk_hdcp_info *hdcp_info)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in)
> +		return;
> +
> +	hdcp_info->auth_status = AUTH_PREPARE;
> +
> +	dev_info(mtk_dp->dev, "dp start HDCP work");
> +	queue_work(mtk_dp->hdcp_workqueue, &mtk_dp->hdcp_work);
> +}
> +
>   static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   {
>   	struct mtk_dp *mtk_dp = dev;
> @@ -1894,9 +1989,11 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   		}
>   	}
>   
> -	if (status & MTK_DP_THREAD_HPD_EVENT)
> +	if (status & MTK_DP_THREAD_HPD_EVENT) {
>   		dev_dbg(mtk_dp->dev, "Receive IRQ from sink devices\n");
> -
> +		/*check if need clear hpd irq*/
> +		mtk_dp_hpd_sink_event(mtk_dp);

		ret = mtk_dp_hpd_sink_event(mtk_dp);
		if (ret)
			do_something;

> +	}
>   	return IRQ_HANDLED;
>   }
>   
> @@ -2233,6 +2330,7 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   					struct drm_bridge_state *old_state)
>   {
>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_connector_state *connector_state;
>   	int ret;
>   
>   	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
> @@ -2243,6 +2341,8 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   		return;
>   	}
>   
> +	connector_state = drm_atomic_get_connector_state(old_state->base.state, mtk_dp->conn);
> +
>   	mtk_dp_aux_panel_poweron(mtk_dp, true);
>   
>   	/* Training */
> @@ -2272,6 +2372,14 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   	mtk_dp->enabled = true;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   
> +	/* Enable hdcp if it's desired */
> +	dev_info(mtk_dp->dev, "hdcp_content_type:%d, content protection: %d",
> +		 connector_state->hdcp_content_type, connector_state->content_protection);

I'm not sure if this message is really informative for the user. I'd say no.
In that case, dev_dbg()

> +	if (connector_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +		mtk_dp->hdcp_info.hdcp_content_type = connector_state->hdcp_content_type;
> +		mtk_dp_authentication(&mtk_dp->hdcp_info);
> +	}
> +
>   	return;
>   power_off_aux:
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> @@ -2284,6 +2392,17 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>   {
>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>   
> +	if (mtk_dp->hdcp_info.hdcp2_info.enable)
> +		dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);
> +
> +	if (mtk_dp->hdcp_info.content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +		mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> +		dev_info(mtk_dp->dev, "update CP, content protection: %d\n",
> +			 mtk_dp->hdcp_info.content_protection);

dev_dbg()

> +		drm_hdcp_update_content_protection(mtk_dp->conn,
> +						   mtk_dp->hdcp_info.content_protection);
> +	}
> +
>   	mtk_dp->enabled = false;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   	mtk_dp_video_enable(mtk_dp, false);
> @@ -2418,6 +2537,8 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
>   
>   	drm_display_mode_to_videomode(&crtc_state->adjusted_mode, &mtk_dp->info.vm);
>   
> +	mtk_dp_hdcp_atomic_check(mtk_dp, conn_state);
> +
>   	return 0;
>   }
>   
> @@ -2657,6 +2778,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	INIT_WORK(&mtk_dp->hdcp_work, mtk_dp_hdcp_handle);
> +	INIT_DELAYED_WORK(&mtk_dp->prop_work, mtk_dp_hdcp_prop_work);
> +	mtk_dp->hdcp_workqueue = create_workqueue("mtk_dp_hdcp_work");
> +	if (!mtk_dp->hdcp_workqueue) {
> +		dev_err(mtk_dp->dev, "failed to create hdcp work queue");
> +		return -ENOMEM;
> +	}
> +
>   	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
>   	mtk_dp->bridge.of_node = dev->of_node;
>   	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.h b/drivers/gpu/drm/mediatek/mtk_dp.h
> new file mode 100644
> index 000000000000..85c0cf0005c0
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#ifndef _MTK_DP_H_
> +#define _MTK_DP_H_
> +
> +#include "tlc_dp_hdcp.h"
> +#include <drm/drm_bridge.h>
> +#include <sound/hdmi-codec.h>
> +#include <video/videomode.h>
> +
> +enum {
> +	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
> +	MTK_DP_CAL_CLKTX_IMPSE,
> +	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0,
> +	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1,
> +	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2,
> +	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3,
> +	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0,
> +	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1,
> +	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2,
> +	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3,
> +	MTK_DP_CAL_MAX,
> +};
> +
> +struct mtk_dp_audio_cfg {
> +	bool detect_monitor;
> +	int sad_count;
> +	int sample_rate;
> +	int word_length_bits;
> +	int channels;
> +};
> +
> +struct mtk_dp_info {
> +	enum dp_pixelformat format;
> +	struct videomode vm;
> +	struct mtk_dp_audio_cfg audio_cur_cfg;
> +};
> +
> +struct mtk_dp_train_info {
> +	bool sink_ssc;
> +	bool cable_plugged_in;
> +	/* link_rate is in multiple of 0.27Gbps */
> +	int link_rate;
> +	int lane_count;
> +	unsigned int channel_eq_pattern;
> +};
> +
> +struct mtk_dp {
> +	bool enabled;
> +	bool need_debounce;
> +	int irq;
> +	u8 max_lanes;
> +	u8 max_linkrate;
> +	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> +	u32 cal_data[MTK_DP_CAL_MAX];
> +	u32 irq_thread_handle;
> +	/* irq_thread_lock is used to protect irq_thread_handle */
> +	spinlock_t irq_thread_lock;
> +
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct drm_connector *conn;
> +	struct drm_device *drm_dev;
> +	struct drm_dp_aux aux;
> +
> +	const struct mtk_dp_data *data;
> +	struct mtk_dp_info info;
> +	struct mtk_dp_train_info train_info;
> +	struct mtk_hdcp_info hdcp_info;
> +	struct work_struct hdcp_work;
> +	struct delayed_work prop_work;
> +	struct workqueue_struct *hdcp_workqueue;
> +
> +	struct platform_device *phy_dev;
> +	struct phy *phy;
> +	struct regmap *regs;
> +	struct timer_list debounce_timer;
> +
> +	/* For audio */
> +	bool audio_enable;
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct platform_device *audio_pdev;
> +
> +	struct device *codec_dev;
> +	/* protect the plugged_cb as it's used in both bridge ops and audio */
> +	struct mutex update_plugged_status_lock;
> +};
> +
> +u32 mtk_dp_get_system_time(void);
> +u32 mtk_dp_get_time_diff(u32 pre_time);
> +u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset);
> +int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val, u32 mask);
> +void mtk_dp_authentication(struct mtk_hdcp_info *hdcp_info);
> +
> +#endif /* _MTK_DP_H_ */
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
> new file mode 100644
> index 000000000000..8528e33f3f49
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
> @@ -0,0 +1,1021 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#include "mtk_dp_hdcp2.h"
> +#include "mtk_dp_reg.h"
> +#include "mtk_dp.h"
> +
> +u8 t_rtx[HDCP_2_2_RTX_LEN] = {
> +	0x18, 0xfa, 0xe4, 0x20, 0x6a, 0xfb, 0x51, 0x49
> +};
> +
> +u8 t_tx_caps[HDCP_2_2_TXCAPS_LEN] = {
> +	0x02, 0x00, 0x00
> +};
> +
> +u8 t_rn[HDCP_2_2_RN_LEN] = {
> +	0x32, 0x75, 0x3e, 0xa8, 0x78, 0xa6, 0x38, 0x1c
> +};
> +
> +u8 t_riv[HDCP_2_2_RIV_LEN] = {
> +	0x40, 0x2b, 0x6b, 0x43, 0xc5, 0xe8, 0x86, 0xd8
> +};
> +
> +static void dp_tx_hdcp2_fill_stream_type(struct mtk_hdcp_info *hdcp_info, u8 uc_type)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34D0, uc_type, 0xff);
> +}
> +
> +static void dp_tx_hdcp2_set_state(struct mtk_hdcp_info *hdcp_info, u8 main_state, u8 sub_state)
> +{
> +	hdcp_info->hdcp2_info.hdcp_handler.main_state = main_state;
> +	hdcp_info->hdcp2_info.hdcp_handler.sub_state = sub_state;
> +}
> +
> +static void dp_tx_hdcp2_set_auth_pass(struct mtk_hdcp_info *hdcp_info, bool enable)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +
> +	if (enable) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3400, BIT(11), BIT(11));

#define SOMETHING BIT(11) please - and same for BIT(4). No magic numbers.

> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, BIT(4), BIT(4));
> +	} else {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3400, 0, BIT(11));
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, 0, BIT(4));
> +	}
> +}
> +
> +static void dp_tx_hdcp2_enable_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +
> +	DPTXHDCPFUNC();

What would that be?! That's not upstream quality.

> +	dp_tx_hdcp2_set_auth_pass(hdcp_info, enable);

Also...

u32 version;

if (!enable) {
	tee_hdcp_enable_encrypt(hdcp_info, enable, HDCP_NONE);
	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, 0, BIT(5) <--- define it!);

	return;
}

if ...
	version = HDCP_V1;
else if ...
	version = HDCP_V2;
else
	version = HDCP_V2_3;

enable encrypt, update_bits

> +	if (enable) {
> +		u32 version = HDCP_V2_3;
> +
> +		if (hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info[1] & BIT(0))
> +			version = HDCP_V1;
> +		else if (hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info[1] & BIT(1))
> +			version = HDCP_V2;
> +
> +		tee_hdcp_enable_encrypt(hdcp_info, enable, version);
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, BIT(5), BIT(5));
> +	} else {
> +		tee_hdcp_enable_encrypt(hdcp_info, enable, HDCP_NONE);
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, 0, BIT(5));
> +	}
> +}
> +
> +static int dp_tx_hdcp2_init(struct mtk_hdcp_info *hdcp_info)
> +{
> +	int err_code = HDCP_ERR_NONE;
> +
> +	DPTXHDCPFUNC();

Seriously, a call to "DPTXHDCPFUNC()" is nothing we should ever see upstream.

> +
> +	memset(&hdcp_info->hdcp2_info.hdcp_tx, 0, sizeof(struct hdcp2_info_tx));
> +	memset(&hdcp_info->hdcp2_info.hdcp_rx, 0, sizeof(struct hdcp2_info_rx));

All memset zero first, all memcpy last.
Makes that more readable.

> +	memcpy(hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx, t_rtx, HDCP_2_2_RTX_LEN);
> +	memcpy(&hdcp_info->hdcp2_info.hdcp_tx.tx_caps, t_tx_caps, HDCP_2_2_TXCAPS_LEN);
> +	memcpy(hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n, t_rn, HDCP_2_2_RN_LEN);
> +	memcpy(hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv, t_riv, HDCP_2_2_RIV_LEN);
> +
> +	memset(&hdcp_info->hdcp2_info.hdcp_handler, 0, sizeof(struct hdcp2_handler));
> +	memset(&hdcp_info->hdcp2_info.ake_stored_km, 0, sizeof(struct hdcp2_ake_stored_km));
> +
> +	dp_tx_hdcp2_enable_auth(hdcp_info, false);
> +

	return HDCP_ERR_NONE;

> +	return err_code;
> +}
> +
> +static bool dp_tx_hdcp2_inc_seq_num_m(struct mtk_hdcp_info *hdcp_info)
> +{
> +	u32 tmp = 0;

u32 tmp = drm_hdcp_be24_to_cpu(...)

> +
> +	tmp = drm_hdcp_be24_to_cpu(hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m);
> +
> +	if (tmp == 0xFFFFFF)

#define SOMETHING 0xFFFFFF

	if (tmp == SOMETHING)
		return false;

> +		return false;
> +
> +	tmp++;
> +
> +	drm_hdcp_cpu_to_be24(hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m, tmp);
> +	return true;
> +}
> +
> +static bool dp_tx_hdcp2_process_rep_auth_stream_manage(struct mtk_hdcp_info *hdcp_info)
> +{
> +	bool ret = false;

You don't need bool ret.

> +
> +	hdcp_info->hdcp2_info.hdcp_tx.k[0] = 0x00;
> +	hdcp_info->hdcp2_info.hdcp_tx.k[1] = 0x01;
> +
> +	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[0] = 0x00; //Payload ID
> +	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[1] = hdcp_info->hdcp2_info.stream_id_type;
> +
> +	ret = dp_tx_hdcp2_inc_seq_num_m(hdcp_info);

	return dp_tx_hdcp2_inc_seq_num_m(hdcp_info);

> +
> +	return ret;
> +}
> +
> +static bool dp_tx_hdcp2_recv_rep_auth_send_recv_id_list(struct mtk_hdcp_info *hdcp_info)
> +{
> +	bool ret = false;
> +	u8 *buffer = NULL;
> +	u32 len = 0, len_recv_id_list = 0;
> +	int rc = 0;
> +
> +	len_recv_id_list = hdcp_info->hdcp2_info.device_count * HDCP_2_2_RECEIVER_ID_LEN;
> +	len = len_recv_id_list + HDCP_2_2_RXINFO_LEN + HDCP_2_2_SEQ_NUM_LEN;
> +	buffer = kmalloc(len, GFP_KERNEL);
> +	if (!buffer) {
> +		pr_err("2.x: Out of Memory\n");

can we use dev_err instead?

> +		return ret;
> +	}
> +
> +	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.receiver_ids,
> +	       len_recv_id_list);
> +	memcpy(buffer + len_recv_id_list,
> +	       hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info, HDCP_2_2_RXINFO_LEN);
> +	memcpy(buffer + len_recv_id_list + HDCP_2_2_RXINFO_LEN,
> +	       hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v, HDCP_2_2_SEQ_NUM_LEN);
> +
> +	rc = tee_hdcp2_compute_compare_v(hdcp_info, buffer, len,
> +					 hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.v_prime,
> +		hdcp_info->hdcp2_info.hdcp_tx.send_ack.v);
> +
> +	if (rc == RET_COMPARE_PASS) {
> +		ret = true;
> +		DPTXHDCPMSG("2.x: V' is PASS!!\n");
> +	} else {
> +		DPTXHDCPMSG("2.x: V' is FAIL!!\n");
> +	}

This if branch is probably useless.

> +
> +	kfree(buffer);

	return !!(rc == RET_COMPARE_PASS)

> +	return ret;
> +}
> +
> +static bool dp_tx_hdcp2_recv_rep_auth_stream_ready(struct mtk_hdcp_info *hdcp_info)
> +{
> +	bool ret = false;
> +	u8 *buffer = NULL;
> +	u32 len = 0;
> +	int tmp = 0;
> +
> +	len = HDCP2_STREAMID_TYPE_LEN + HDCP_2_2_SEQ_NUM_LEN;
> +	buffer = kmalloc(len, GFP_KERNEL);
> +	if (!buffer) {
> +		pr_err("2.x: Out of Memory\n");
> +		return ret;
> +	}
> +
> +	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_tx.stream_id_type, HDCP2_STREAMID_TYPE_LEN);
> +	memcpy(buffer + HDCP2_STREAMID_TYPE_LEN,
> +	       hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m,
> +	       HDCP_2_2_SEQ_NUM_LEN);
> +	tmp = tee_hdcp2_compute_compare_m(hdcp_info, buffer, len,
> +					  hdcp_info->hdcp2_info.hdcp_rx.stream_ready.m_prime);
> +
> +	if (tmp == RET_COMPARE_PASS) {
> +		ret = true;
> +		DPTXHDCPMSG("2.x: M' is PASS!!\n");
> +	} else {
> +		DPTXHDCPMSG("2.x: M' is FAIL!!\n");
> +	}

same here, if branch useless.

> +
> +	kfree(buffer);
> +	return ret;
> +}
> +
> +static bool dp_tx_hdcp2_check_seq_num_v(struct mtk_hdcp_info *hdcp_info)
> +{
> +	if ((hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[0] == 0x00 &&
> +	     hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[1] == 0x00 &&
> +			hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[2] == 0x00) &&

fix indentation please

> +		hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt > 0xFFFFFF) {
> +		DPTXHDCPMSG("2.x: SeqNumV Rollover!\n");
> +		return false;
> +	}
> +
> +	if ((hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[0]
> +		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0xFF0000) >> 16)) ||

See bitfield.h and use those macros, or this is totally unreadable.

> +			(hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[1]
> +		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0x00FF00) >> 8)) ||
> +			(hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v[2]
> +		!= (u8)((hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt & 0x0000FF)))) {
> +		DPTXHDCPMSG("2.x: Invalid Seq_num_V!\n");
> +		return false;
> +	}
> +
> +	hdcp_info->hdcp2_info.hdcp_handler.seq_num_v_cnt++;
> +	return true;
> +}
> +
> +static void dp_tx_hdcp2_err_handle(struct mtk_hdcp_info *hdcp_info, int err_msg, int line)
> +{
> +	pr_err("2.x: MainState:%d; SubState:%d;\n", hdcp_info->hdcp2_info.hdcp_handler.main_state,
> +	       hdcp_info->hdcp2_info.hdcp_handler.sub_state);
> +
> +	switch (err_msg) {
> +	case HDCP_ERR_UNKNOWN_STATE:
> +		pr_err("2.x: Unknown State, line:%d\n", line);
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP_2_2_AUTH_FAIL);
> +		break;
> +
> +	case HDCP_ERR_SEND_MSG_FAIL:
> +		pr_err("2.x: Send Msg Fail, line:%d\n", line);
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP_2_2_NULL_MSG);
> +		break;
> +	case HDCP_ERR_RESPONSE_TIMEROUT:
> +		pr_err("2.x: Response Timeout, line:%d!\n", line);
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP_2_2_NULL_MSG);
> +		break;
> +
> +	case HDCP_ERR_PROCESS_FAIL:
> +		pr_err("2.x: Process Fail, line:%d!\n", line);
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP_2_2_NULL_MSG);
> +		break;
> +
> +	default:
> +		pr_err("2.x: NO ERROR!");

pr_err("no error\n"); ?!?!?

Unless having no error is an error, this doesn't make any sense, at all.

> +		break;
> +	}
> +}
> +
> +static bool dp_tx_hdcp2_read_msg(struct mtk_hdcp_info *hdcp_info, u8 cmd_ID)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +	bool ret = false;

You don't need bool ret.

> +	u8 size = 0;
> +
> +	switch (cmd_ID) {
> +	case HDCP_2_2_AKE_SEND_CERT:
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_CERT_RX_OFFSET,
> +				 (void *)&hdcp_info->hdcp2_info.hdcp_rx.cert_rx, HDCP2_CERTRX_LEN);
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RRX_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.send_cert.r_rx, HDCP_2_2_RRX_LEN);
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.send_cert.rx_caps,
> +				 HDCP_2_2_RXCAPS_LEN);
> +
> +		hdcp_info->hdcp2_info.read_certrx = false;
> +		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_AKE_SEND_CERT\n");
> +		break;
> +
> +	case HDCP_2_2_AKE_SEND_HPRIME:
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_HPRIME_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.send_hprime.h_prime,
> +				 HDCP_2_2_H_PRIME_LEN);
> +
> +		hdcp_info->hdcp2_info.read_h_prime = false;
> +		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;
> +

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_AKE_SEND_HPRIME\n");
> +		break;
> +
> +	case HDCP_2_2_AKE_SEND_PAIRING_INFO:
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_EKH_KM_RD_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.pairing_info.e_kh_km,
> +				 HDCP_2_2_E_KH_KM_LEN);
> +		hdcp_info->hdcp2_info.read_pairing = false;
> +		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_AKE_SEND_PAIRING_INFO\n");
> +		break;
> +
> +	case HDCP_2_2_LC_SEND_LPRIME:
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_LPRIME_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.send_lprime.l_prime,
> +				 HDCP_2_2_L_PRIME_LEN);
> +
> +		hdcp_info->hdcp2_info.read_l_prime = false;
> +		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_LC_SEND_LPRIME\n");
> +		break;
> +
> +	case HDCP_2_2_REP_SEND_RECVID_LIST:
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXINFO_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info,
> +				 HDCP_2_2_RXINFO_LEN);
> +		hdcp_info->hdcp2_info.device_count =
> +			((hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info[1] & 0xf0) >> 4)
> +				| ((hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info[0]
> +				& BIT(0)) << 4);
> +
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.seq_num_v,
> +				 HDCP_2_2_SEQ_NUM_LEN);
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_VPRIME_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.v_prime,
> +				 HDCP_2_2_V_PRIME_HALF_LEN);
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RECV_ID_LIST_OFFSET,
> +				 hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.receiver_ids,
> +			hdcp_info->hdcp2_info.device_count * HDCP_2_2_RECEIVER_ID_LEN);
> +
> +		hdcp_info->hdcp2_info.read_v_prime = false;
> +		hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_REP_SEND_RECVID_LIST\n");
> +		break;
> +
> +	case HDCP_2_2_REP_STREAM_READY:
> +		size = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_MPRIME_OFFSET,
> +					hdcp_info->hdcp2_info.hdcp_rx.stream_ready.m_prime,
> +					HDCP_2_2_MPRIME_LEN);
> +
> +		if (size == HDCP_2_2_MPRIME_LEN)
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = true;
> +		ret = true;

return true;

> +		DPTXHDCPMSG("2.x: HDCP_2_2_REP_STREAM_READY\n");
> +		break;
> +
> +	default:
> +		DPTXHDCPMSG("2.x: Invalid DPTX_HDCP2_OffSETADDR_ReadMessage !\n");
> +		break;
> +	}
> +
> +	return ret;

return false;

> +}
> +
> +static bool dp_tx_hdcp2_write_msg(struct mtk_hdcp_info *hdcp_info, u8 cmd_ID)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +	bool ret = false;

same story here.

> +
> +	switch (cmd_ID) {
> +	case HDCP_2_2_AKE_INIT:
> +		tee_hdcp2_soft_rst(hdcp_info);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_RTX_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx, HDCP_2_2_RTX_LEN);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_TXCAPS_OFFSET,
> +				  (void *)&hdcp_info->hdcp2_info.hdcp_tx.tx_caps,
> +				  HDCP_2_2_TXCAPS_LEN);
> +
> +		ret = true;
> +		DPTXHDCPMSG("2.x: HDCP_2_2_AKE_Init !\n");
> +		break;
> +
> +	case HDCP_2_2_AKE_NO_STORED_KM:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_EKPUB_KM_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.no_stored_km.e_kpub_km,
> +				  HDCP_2_2_E_KPUB_KM_LEN);
> +
> +		ret = true;
> +
> +		DPTXHDCPMSG("2.x: HDCP_2_2_AKE_NO_STORED_KM !\n");
> +		break;
> +
> +	case HDCP_2_2_AKE_STORED_KM:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_EKH_KM_WR_OFFSET,
> +				  hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m,
> +				  HDCP_2_2_E_KH_KM_LEN);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_M_OFFSET,
> +				  hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m +
> +				  HDCP_2_2_E_KH_KM_LEN,
> +				  HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN);
> +
> +		ret = true;
> +
> +		DPTXHDCPMSG("2.x: DPTX_HDCP_2_2_AKE_STORED_KM !\n");
> +		break;
> +
> +	case HDCP_2_2_LC_INIT:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_RN_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n, HDCP_2_2_RN_LEN);
> +
> +		hdcp_info->hdcp2_info.read_l_prime = true;
> +		ret = true;
> +
> +		DPTXHDCPMSG("2.x: HDCP_2_2_LC_INIT !\n");
> +		break;
> +
> +	case HDCP_2_2_SKE_SEND_EKS:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_EDKEY_KS_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.send_eks.e_dkey_ks,
> +				  HDCP_2_2_E_DKEY_KS_LEN);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_RIV_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv, HDCP_2_2_RIV_LEN);
> +
> +		hdcp_info->hdcp2_info.ks_exchange_done = true;
> +
> +		ret = true;
> +		DPTXHDCPMSG("2.x: HDCP_2_2_SKE_SEND_EKS !\n");
> +		break;
> +
> +	case HDCP_2_2_STREAM_TYPE:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.stream_id_type, 1);
> +
> +		ret = true;
> +		DPTXHDCPMSG("HDCP2_MSG_DP_STREAM_TYPE !\n");
> +		break;
> +
> +	case HDCP_2_2_REP_SEND_ACK:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_V_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.send_ack.v,
> +				  HDCP_2_2_V_PRIME_HALF_LEN);
> +
> +		ret = true;
> +		DPTXHDCPMSG("2.x: HDCP_2_2_SEND_ACK !\n");
> +		break;
> +
> +	case HDCP_2_2_REP_STREAM_MANAGE:
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_SEQ_NUM_M_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m,
> +				  HDCP_2_2_SEQ_NUM_LEN);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_K_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.k, HDCP2_K_LEN);
> +		drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_STREAM_ID_TYPE_OFFSET,
> +				  hdcp_info->hdcp2_info.hdcp_tx.stream_id_type,
> +				  HDCP2_STREAMID_TYPE_LEN);
> +
> +		dp_tx_hdcp2_fill_stream_type(hdcp_info, hdcp_info->hdcp2_info.stream_id_type);
> +
> +		ret = true;
> +		DPTXHDCPMSG("2.x: HDCP_2_2_STREAM_MANAGE !\n");
> +		break;
> +
> +	default:
> +		DPTXHDCPMSG("2.x: Invalid HDCP2_OffSETADDR_WriteMessage !\n");
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static void dp_tx_hdcp2_rest_variable(struct mtk_hdcp_info *hdcp_info)
> +{
> +	hdcp_info->hdcp2_info.read_certrx = false;
> +	hdcp_info->hdcp2_info.read_h_prime = false;
> +	hdcp_info->hdcp2_info.read_pairing = false;
> +	hdcp_info->hdcp2_info.read_l_prime = false;
> +	hdcp_info->hdcp2_info.ks_exchange_done = false;
> +	hdcp_info->hdcp2_info.read_v_prime = false;
> +}
> +
> +int dp_tx_hdcp2_fsm(struct mtk_hdcp_info *hdcp_info)
> +{
> +	static u32 timeout_value;
> +	static u8 pre_main;
> +	static u8 pre_sub;
> +	static u32 pre_time;
> +	int err_code = HDCP_ERR_NONE;
> +	bool stored = false;
> +	u32 time;
> +	int ret = 0;

Avoid double assignments, don't initialize ret to 0 here.

> +	bool tmp = false;
> +
> +	if (pre_main != hdcp_info->hdcp2_info.hdcp_handler.main_state ||
> +	    hdcp_info->hdcp2_info.hdcp_handler.sub_state != pre_sub) {
> +		DPTXHDCPMSG("2.x: Port(M : S)= (%d, %d)",
> +			    hdcp_info->hdcp2_info.hdcp_handler.main_state,
> +			    hdcp_info->hdcp2_info.hdcp_handler.sub_state);
> +		pre_main = hdcp_info->hdcp2_info.hdcp_handler.main_state;
> +		pre_sub = hdcp_info->hdcp2_info.hdcp_handler.sub_state;
> +	}
> +
> +	switch (hdcp_info->hdcp2_info.hdcp_handler.main_state) {
> +	case HDCP2_MS_H1P1:
> +		/* HDCP2_MS_H1P1 */
> +		/* HDCP_2_2_AUTH_FAIL */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AUTH_FAIL) {
> +			pr_err("2.x: Authentication Fail!\n");
> +			dp_tx_hdcp2_enable_auth(hdcp_info, false);
> +			hdcp_info->auth_status = AUTH_FAIL;
> +		}
> +		break;
> +
> +	case HDCP2_MS_A0F0:
> +		/* HDCP2_MS_A0F0 */
> +		/* HDCP_2_2_NULL_MSG */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_NULL_MSG) {
> +			if (!hdcp_info->hdcp2_info.enable) {
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP_2_2_AUTH_FAIL);
> +				DPTXHDCPMSG("2.x: Sink Doesn't Support Hdcp2x!\n");
> +				break;
> +			}
> +
> +			dp_tx_hdcp2_init(hdcp_info);
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1, HDCP_2_2_NULL_MSG);
> +			DPTXHDCPMSG("2.x: Sink Support Hdcp2x!\n");
> +		}
> +		break;
> +
> +	case HDCP2_MS_A1F1:
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_NULL_MSG */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_NULL_MSG) {
> +			if (hdcp_info->hdcp2_info.retry_count >= HDCP2_TX_RETRY_CNT) {
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP_2_2_AUTH_FAIL);
> +				pr_err("2.x: Try Max Count\n");
> +				break;
> +			}
> +
> +			hdcp_info->hdcp2_info.retry_count++;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1, HDCP_2_2_AKE_INIT);
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_INIT */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AKE_INIT) {
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_AKE_INIT);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +			dp_tx_hdcp2_rest_variable(hdcp_info);
> +			hdcp_info->hdcp2_info.read_certrx = true;
> +
> +			hdcp_info->hdcp2_info.hdcp_handler.send_ake_init = true;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1, HDCP_2_2_AKE_SEND_CERT);
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_SEND_CERT */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AKE_SEND_CERT) {
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time < HDCP_2_2_CERT_TIMEOUT_MS) {
> +				msleep(20);
> +				break;
> +			}
> +			if (hdcp_info->hdcp2_info.read_certrx)
> +				dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_AKE_SEND_CERT);
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
> +				break;
> +
> +			ret = tee_ake_certificate(hdcp_info,
> +						  (u8 *)&hdcp_info->hdcp2_info.hdcp_rx.cert_rx,
> +						  &stored,
> +				hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m +
> +				HDCP_2_2_E_KH_KM_LEN,
> +				hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m);
> +
> +			if (ret != RET_COMPARE_PASS) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			hdcp_info->hdcp2_info.hdcp_handler.stored_km = stored;
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
> +					      hdcp_info->hdcp2_info.hdcp_handler.stored_km ?
> +					HDCP_2_2_AKE_STORED_KM :
> +					HDCP_2_2_AKE_NO_STORED_KM);
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_NO_STORED_KM */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AKE_NO_STORED_KM) {
> +			DPTXHDCPMSG("2.x: Get Km, derive Ekpub(km)\n");
> +
> +			tee_enc_rsaes_oaep(hdcp_info,
> +					   hdcp_info->hdcp2_info.hdcp_tx.no_stored_km.e_kpub_km);
> +			/* Prepare e_kpub_km to send */
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_AKE_NO_STORED_KM);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1, HDCP_2_2_AKE_SEND_HPRIME);
> +			timeout_value = HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS;
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_STORED_KM */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AKE_STORED_KM) {
> +			/* Prepare ekh_km & M to send */
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_AKE_STORED_KM);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			err_code = HDCP_ERR_NONE;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1, HDCP_2_2_AKE_SEND_HPRIME);
> +			timeout_value = HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS;
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_SEND_HPRIME */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AKE_SEND_HPRIME) {
> +			if (hdcp_info->hdcp2_info.read_h_prime)
> +				dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_AKE_SEND_HPRIME);
> +
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time > timeout_value) {
> +				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
> +				break;
> +
> +			ret = tee_ake_h_prime(hdcp_info,
> +					      hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx,
> +					      hdcp_info->hdcp2_info.hdcp_rx.send_cert.r_rx,
> +				hdcp_info->hdcp2_info.hdcp_rx.send_cert.rx_caps,
> +				(u8 *)&hdcp_info->hdcp2_info.hdcp_tx.tx_caps,
> +				hdcp_info->hdcp2_info.hdcp_rx.send_hprime.h_prime,
> +				HDCP_2_2_H_PRIME_LEN);
> +			if (ret != RET_COMPARE_PASS) {
> +				if (hdcp_info->hdcp2_info.hdcp_handler.stored_km)
> +					tee_clear_paring(hdcp_info);
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (hdcp_info->hdcp2_info.hdcp_handler.stored_km)
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2, HDCP_2_2_LC_INIT);
> +			else
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A1F1,
> +						      HDCP_2_2_AKE_SEND_PAIRING_INFO);
> +
> +			pre_time = mtk_dp_get_system_time();
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +		}
> +
> +		/* HDCP2_MS_A1F1 */
> +		/* HDCP_2_2_AKE_SEND_PAIRING_INFO */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state ==
> +			HDCP_2_2_AKE_SEND_PAIRING_INFO) {
> +			if (hdcp_info->hdcp2_info.read_pairing)
> +				dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_AKE_SEND_PAIRING_INFO);
> +
> +			/* Ekh_Km must be available less than 200ms, Give mode time for some Rx */
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time >	HDCP_2_2_PAIRING_TIMEOUT_MS * 2) {
> +				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
> +				break;
> +
> +			/* Store m, km, Ekh(km) */
> +			tee_ake_paring(hdcp_info,
> +				       hdcp_info->hdcp2_info.hdcp_rx.pairing_info.e_kh_km);
> +
> +			hdcp_info->hdcp2_info.hdcp_handler.send_pair = true;
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2, HDCP_2_2_LC_INIT);
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +		break;
> +
> +	case HDCP2_MS_A2F2:
> +		/* HDCP2_MS_A2F2 */
> +		/* HDCP_2_2_LC_INIT */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_LC_INIT) {
> +			/* prepare Rn to send */
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_LC_INIT);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +			hdcp_info->hdcp2_info.hdcp_handler.send_lc_init = true;
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A2F2, HDCP_2_2_LC_SEND_LPRIME);
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +
> +		/* HDCP2_MS_A2F2 */
> +		/* HDCP_2_2_LC_SEND_LPRIME */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_LC_SEND_LPRIME) {
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time < HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS)
> +				break;
> +
> +			if (hdcp_info->hdcp2_info.read_l_prime)
> +				dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_LC_SEND_LPRIME);
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
> +				break;
> +
> +			ret = tee_lc_l_prime(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n,
> +					     hdcp_info->hdcp2_info.hdcp_rx.send_lprime.l_prime,
> +					     HDCP_2_2_L_PRIME_LEN);
> +			if (ret != RET_COMPARE_PASS) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			DPTXHDCPMSG("2.x: L' is PASS!!\n");
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A3F3, HDCP_2_2_NULL_MSG);
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +		break;
> +
> +	case HDCP2_MS_A3F3:
> +		/* HDCP2_MS_A3F3 */
> +		/* HDCP_2_2_NULL_MSG */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_NULL_MSG) {
> +			tee_ske_enc_ks(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv,
> +				       hdcp_info->hdcp2_info.hdcp_tx.send_eks.e_dkey_ks);
> +
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_SKE_SEND_EKS);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (!hdcp_info->hdcp2_info.repeater)
> +				dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_STREAM_TYPE);
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A3F3, HDCP_2_2_SKE_SEND_EKS);
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +
> +		/* HDCP2_MS_A3F3 */
> +		/* HDCP_2_2_SKE_SEND_EKS */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_SKE_SEND_EKS) {
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time >= HDCP_2_2_DELAY_BEFORE_ENCRYPTION_EN)
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A4F4, HDCP_2_2_NULL_MSG);
> +		}
> +		break;
> +
> +	case HDCP2_MS_A4F4:
> +		/* HDCP2_MS_A4F4 */
> +		/* HDCP_2_2_NULL_MSG */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_NULL_MSG) {
> +			if (!hdcp_info->hdcp2_info.repeater) {
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5, HDCP_2_2_AUTH_DONE);
> +				break;
> +			}
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A6F6,
> +					      HDCP_2_2_REP_SEND_RECVID_LIST);
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			pre_time = mtk_dp_get_system_time();
> +		}
> +		break;
> +
> +	case HDCP2_MS_A5F5:
> +		/* HDCP2_MS_A5F5 */
> +		/* HDCP_2_2_AUTH_DONE */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_AUTH_DONE) {
> +			DPTXHDCPMSG("2.x: Authentication done!\n");
> +			hdcp_info->auth_status = AUTH_PASS;
> +			hdcp_info->hdcp2_info.retry_count = 0;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5, HDCP_2_2_NULL_MSG);
> +			dp_tx_hdcp2_enable_auth(hdcp_info, true);
> +		}
> +		break;
> +
> +	case HDCP2_MS_A6F6:
> +		/* HDCP2_MS_A6F6 */
> +		/* HDCP_2_2_REP_SEND_RECVID_LIST */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state ==
> +			HDCP_2_2_REP_SEND_RECVID_LIST) {
> +			if (hdcp_info->hdcp2_info.read_v_prime)
> +				dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_REP_SEND_RECVID_LIST);
> +
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time > HDCP_2_2_RECVID_LIST_TIMEOUT_MS) {
> +				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg)
> +				break;
> +
> +			pre_time = mtk_dp_get_system_time();
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A7F7,
> +					      HDCP_2_2_REP_VERIFY_RECVID_LIST);
> +		}
> +		break;
> +
> +	case HDCP2_MS_A7F7:
> +		/* HDCP2_MS_A7F7 */
> +		/* HDCP_2_2_REP_VERIFY_RECVID_LIST */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state ==
> +			HDCP_2_2_REP_VERIFY_RECVID_LIST) {
> +			if ((hdcp_info->hdcp2_info.hdcp_rx.receiverid_list.rx_info[1]
> +				& (BIT(2) | BIT(3))) != 0) {
> +				pr_err("2.x: DEVS_EXCEEDED or CASCADE_EXCEDDED!\n");
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			/* check seqNumV here */
> +			tmp = dp_tx_hdcp2_check_seq_num_v(hdcp_info);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			tmp = dp_tx_hdcp2_recv_rep_auth_send_recv_id_list(hdcp_info);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A8F8, HDCP_2_2_REP_SEND_ACK);
> +		}
> +		break;
> +
> +	case HDCP2_MS_A8F8:
> +		/* HDCP2_MS_A8F8 */
> +		/* HDCP_2_2_REP_SEND_ACK */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_REP_SEND_ACK) {
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_REP_SEND_ACK);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time > HDCP2_REP_SEND_ACK) {
> +				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9, HDCP_2_2_REP_STREAM_MANAGE);
> +			hdcp_info->hdcp2_info.hdcp_handler.retry_cnt = 0;
> +		}
> +		break;
> +
> +	case HDCP2_MS_A9F9:
> +		/* HDCP2_MS_A9F9 */
> +		/* HDCP_2_2_REP_STREAM_MANAGE */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_REP_STREAM_MANAGE) {
> +			tmp = dp_tx_hdcp2_process_rep_auth_stream_manage(hdcp_info);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			tmp = dp_tx_hdcp2_write_msg(hdcp_info, HDCP_2_2_REP_STREAM_MANAGE);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_SEND_MSG_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			pre_time = mtk_dp_get_system_time();
> +			hdcp_info->hdcp2_info.hdcp_handler.recv_msg = false;
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9,
> +					      HDCP_2_2_REP_STREAM_READY);
> +		}
> +
> +		/* HDCP2_MS_A9F9 */
> +		/* HDCP_2_2_REP_STREAM_READY */
> +		if (hdcp_info->hdcp2_info.hdcp_handler.sub_state == HDCP_2_2_REP_STREAM_READY) {
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time <= HDCP_2_2_STREAM_READY_TIMEOUT_MS / 2)
> +				break;
> +
> +			dp_tx_hdcp2_read_msg(hdcp_info, HDCP_2_2_REP_STREAM_READY);
> +
> +			time = mtk_dp_get_time_diff(pre_time);
> +			if (time > HDCP_2_2_STREAM_READY_TIMEOUT_MS) {
> +				err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			if (!hdcp_info->hdcp2_info.hdcp_handler.recv_msg) {
> +				if (hdcp_info->hdcp2_info.hdcp_handler.retry_cnt
> +					>= HDCP2_STREAM_MANAGE_RETRY_CNT) {
> +					err_code = HDCP_ERR_RESPONSE_TIMEROUT;
> +					dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +					break;
> +				}
> +
> +				hdcp_info->hdcp2_info.hdcp_handler.retry_cnt++;
> +
> +				dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A9F9,
> +						      HDCP_2_2_REP_STREAM_READY);
> +				break;
> +			}
> +
> +			tmp = dp_tx_hdcp2_recv_rep_auth_stream_ready(hdcp_info);
> +			if (!tmp) {
> +				err_code = HDCP_ERR_PROCESS_FAIL;
> +				dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +				break;
> +			}
> +
> +			dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A5F5, HDCP_2_2_AUTH_DONE);
> +		}
> +		break;
> +
> +	default:
> +		err_code = HDCP_ERR_UNKNOWN_STATE;
> +		dp_tx_hdcp2_err_handle(hdcp_info, err_code, __LINE__);
> +		break;
> +	}
> +
> +	return err_code;
> +}
> +
> +void dp_tx_hdcp2_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
> +{
> +	hdcp_info->hdcp2_info.enable = enable;
> +
> +	if (enable) {
> +		hdcp_info->auth_status = AUTH_INIT;
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_A0F0, HDCP_2_2_NULL_MSG);
> +	} else {
> +		hdcp_info->auth_status = AUTH_ZERO;
> +		dp_tx_hdcp2_set_state(hdcp_info, HDCP2_MS_H1P1, HDCP_2_2_NULL_MSG);
> +		dp_tx_hdcp2_enable_auth(hdcp_info, false);
> +	}
> +
> +	hdcp_info->hdcp2_info.retry_count = 0;
> +}
> +
> +bool dp_tx_hdcp2_support(struct mtk_hdcp_info *hdcp_info)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +	u8 tmp[3];
> +	int ret;
> +
> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RX_CAPS_OFFSET, tmp, HDCP_2_2_RXCAPS_LEN);
> +
> +	if (HDCP_2_2_DP_HDCP_CAPABLE(tmp[2]) && tmp[0] == HDCP_2_2_RX_CAPS_VERSION_VAL) {
> +		hdcp_info->hdcp2_info.enable = true;
> +		hdcp_info->hdcp2_info.repeater = tmp[2] & BIT(0);
> +	} else {
> +		hdcp_info->hdcp2_info.enable = false;

if (!HDCP_2_2_DP_HDCP_CAPABLE(tmp[2]) || tmp[0] != HDCP_2_2_RX_CAPS_VERSION_VAL) {
	hdcp_info->hdcp2_info.enable = false;
	return false;
}

hdcp_info->hdcp2_info.enable = true;
hdcp_info->hdcp2_info.repeater = tmp[2] & BIT(0);

> +	}
> +
> +	DPTXHDCPMSG("2.x: CAPABLE: %d, Reapeater: %d\n", hdcp_info->hdcp2_info.enable,
> +		    hdcp_info->hdcp2_info.repeater);
> +
> +	if (!hdcp_info->hdcp2_info.enable)
> +		return false;
> +
> +	ret = tee_add_device(hdcp_info, HDCP_VERSION_2X);
> +	if (ret != RET_SUCCESS) {
> +		pr_err("2.x: HDCP TA has some error\n");
> +		hdcp_info->hdcp2_info.enable = false;

		return false;

> +	}
> +

	return true;

> +	return hdcp_info->hdcp2_info.enable;
> +}
> +
> +bool dp_tx_hdcp2_irq(struct mtk_hdcp_info *hdcp_info)
> +{
> +	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
> +	u8 rx_status = 0;
> +
> +	drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
> +			 HDCP_2_2_DP_RXSTATUS_LEN);
> +
> +	if (rx_status & BIT(0)) {

#define SOMETHING BIT(0) please

> +		DPTXHDCPMSG("2.x: READY_BIT0 Ready!\n");
> +		hdcp_info->hdcp2_info.read_v_prime = true;
> +	}
> +
> +	if (rx_status & BIT(1)) {
> +		DPTXHDCPMSG("2.x: H'_AVAILABLE Ready!\n");
> +		hdcp_info->hdcp2_info.read_h_prime = true;
> +	}
> +
> +	if (rx_status & BIT(2)) {
> +		DPTXHDCPMSG("2.x: PAIRING_AVAILABLE Ready!\n");
> +		hdcp_info->hdcp2_info.read_pairing = true;
> +	}
> +
> +	if (rx_status & BIT(4) || rx_status & BIT(3)) {
> +		DPTXHDCPMSG("2.x: Re-Auth HDCP2X!\n");
> +		dp_tx_hdcp2_set_start_auth(hdcp_info, true);
> +		mtk_dp_authentication(hdcp_info);
> +	}
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
> new file mode 100644
> index 000000000000..df309d3dcc6e
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019-2024 MediaTek Inc.
> + */
> +
> +#ifndef _MTK_dp_HDCP2_H_
> +#define _MTK_dp_HDCP2_H_
> +
> +#include "tlc_dp_hdcp.h"
> +
> +/* Timeout relative */
> +#define HDCP2_REP_SEND_ACK 2000
> +
> +/* Patch for QD980 LLCTS */
> +#define HDCP2_TX_RETRY_CNT 3
> +#define HDCP2_TX_LC_RETRY_CNT 1023
> +#define HDCP2_STREAM_MANAGE_RETRY_CNT 8
> +
> +/* HDCP2.2 Msg IDs */
> +#define HDCP_2_2_STREAM_TYPE 20
> +#define HDCP_2_2_REP_VERIFY_RECVID_LIST 21
> +#define HDCP_2_2_AUTH_FAIL 22
> +#define HDCP_2_2_AUTH_DONE 23
> +
> +enum ENUM_HDCP2TX_MAIN_STATE {

lower case names for enums please.

> +	HDCP2_MS_H1P1 = 0,
> +	HDCP2_MS_A0F0 = 1,
> +	HDCP2_MS_A1F1 = 2,
> +	HDCP2_MS_A2F2 = 3,
> +	HDCP2_MS_A3F3 = 4,
> +	HDCP2_MS_A4F4 = 5,
> +	HDCP2_MS_A5F5 = 6,
> +	HDCP2_MS_A6F6 = 7,
> +	HDCP2_MS_A7F7 = 8,
> +	HDCP2_MS_A8F8 = 9,
> +	HDCP2_MS_A9F9 = 10
> +};
> +
> +enum ENUM_HDCP_ERR_CODE {
> +	HDCP_ERR_NONE = 0,
> +	HDCP_ERR_UNKNOWN_STATE,
> +	HDCP_ERR_SEND_MSG_FAIL,
> +	HDCP_ERR_RESPONSE_TIMEROUT,
> +	HDCP_ERR_PROCESS_FAIL
> +};
> +
> +int dp_tx_hdcp2_fsm(struct mtk_hdcp_info *hdcp_info);
> +void dp_tx_hdcp2_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable);
> +bool dp_tx_hdcp2_support(struct mtk_hdcp_info *hdcp_info);
> +bool dp_tx_hdcp2_irq(struct mtk_hdcp_info *hdcp_info);
> +
> +#endif /* _MTK_dp_HDCP2_H_ */
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 709b79480693..5cf5059762ed 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -1,8 +1,9 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (c) 2019-2022 MediaTek Inc.
> + * Copyright (c) 2019-2024 MediaTek Inc.
>    * Copyright (c) 2022 BayLibre
>    */
> +
>   #ifndef _MTK_DP_REG_H_
>   #define _MTK_DP_REG_H_
>   
> @@ -277,6 +278,7 @@
>   #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
>   #define MTK_DP_TRANS_P0_34A4				0x34a4
>   #define LANE_NUM_DP_TRANS_P0_MASK				GENMASK(3, 2)
> +#define MTK_DP_TRANS_P0_34D0                0x34D0
>   #define MTK_DP_TRANS_P0_3540				0x3540
>   #define FEC_EN_DP_TRANS_P0_MASK					BIT(0)
>   #define FEC_CLOCK_EN_MODE_DP_TRANS_P0				BIT(3)
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4e3d9f7b4d8c..7f4a8f7dfce2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -25,6 +25,7 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_of.h>
>   #include <drm/drm_simple_kms_helper.h>
> +#include <drm/display/drm_hdcp_helper.h>
>   
>   #include "mtk_disp_drv.h"
>   #include "mtk_dpi_regs.h"
> @@ -820,6 +821,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   	}
>   	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
>   
> +	drm_connector_attach_content_protection_property(dpi->connector, true);
> +
>   	return 0;
>   
>   err_cleanup:

This driver needs lots of cleanups to reach upstream quality.

Regards,
Angelo

