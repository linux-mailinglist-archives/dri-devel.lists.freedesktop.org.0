Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E6A20C5A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 15:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F4F10E291;
	Tue, 28 Jan 2025 14:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x6iZ8n3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BABD10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 14:53:45 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-307325f2436so62115641fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738076023; x=1738680823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LKT8C5qKG34pGX4G+U1Om54wC+dlXmCR9iI7JAq0ryA=;
 b=x6iZ8n3CYXUQqOMvlaSsbjHI8BwMzkwn3mDFXxc9aSza4WUOGd3z5TG3WFKXm00A73
 3ijmhBvJqnmGxK0FRUjYvSN3vUr72eUNuURQ14yVe/sjDLxW39rxTWoPEsKCtzrdN7Zo
 uYQb9qt6dqMxild7yFBiXezgvXUtZtqaCCdt4g+n+42D/HRsO8ul63y6jv/YmaBHHBCq
 Vovj2Ef7T4J3hmas67MQAN1pE6V00RCHSc7ghI/rjRaQng3Vzg+d+zVjfq45Pcj2Q6Wz
 bUnttM3vamg97Ec9VPvW+qFPaS0uJbB2uTc9ddTZ8g+Bp69HrIaQ4m56965egni1jNxu
 0VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738076023; x=1738680823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKT8C5qKG34pGX4G+U1Om54wC+dlXmCR9iI7JAq0ryA=;
 b=B52dtv6XwUvIVuaYbIcg8JuvzPYf7y2Kx4EfXMiplHr1F+yOm6zw646oiZfIX+qz9O
 InYP1lLSX0fCBBStMPg5mIMoMn7rmU3IkgU7X2HKldX+eoBcJ6FpcZP/HEfELFGAHmFl
 s7sxncCQHs9h4LRk7xeOjo6lmNDrUCjVZEwTA/+MneG4TDBgNXe9neCnF+aKXTQFM/5j
 f01qeZB7LK8nYQ2tMKi8NrWYprpqbhJW2T0PwYcpl33tWIySNxOBI6XRxWAokOljBOLv
 zepTTUOxmmJZW68+J14DXFzwiKwEV7r3m/P6w7R8LKl2ep2ruRAe03DM0DIQgHVVCtg7
 7eXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaR1wLKVOIYtNhyzKLkZ0RWpo8jWQRUHn2IYHMx+/UsQP2psJoCxgImSTQH4AEvZK3/GRVE8NJPFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsCyhBwVpTPcg2PMEmHagr/xSoMIqligl+f5CqXqX8UpYHQBAe
 N+oWfVfKt16rYLMDYqa//GYddYLjmA8hTUgFsTK0UMsxd+tBbW2nOX32CbLqcXc=
X-Gm-Gg: ASbGncsZ5vTzpCcE1AGLySBtdh1HW5ohoBUBaPbW6fnK3vn0oA41rR2E+eSs1PqAnRT
 jIqLGsJCEZCtA6L7pAqYoivYnPEwCrmw8iUBIMXc2UvPQ1GHrUJHWcJ15LkUYxf5Pk9rVo2VYZQ
 GBrDjCiNZZEew8WJ3BXP7WuE/6fe03UIV3vk5X9KmS09ySJuB48C8yodmu/wYycJxuyMxLPGsNU
 iOIJF7dnehL7TvduFEnrDBmodSIGSbdRE1b/F8fOZp1KQEsRV0fxFvVnhu+csIIrozUyEkKiZSI
 60uEvLK3iqUK1MW+/P8gIk/23njUTbd9fLjknit3CVzvL16NpyifOsT1czzMQdFc6xS6NOA=
X-Google-Smtp-Source: AGHT+IEA7a8mq+S3PLs0BGu/4VWsUb4IRMn1KN9n2iCjKrF9tIgFFjEyquAT3U5w7aXCOofo4WeJ9Q==
X-Received: by 2002:a2e:a498:0:b0:302:3b3f:fdab with SMTP id
 38308e7fff4ca-3072cb1f4bamr149455581fa.28.1738076023217; 
 Tue, 28 Jan 2025 06:53:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba6b006sm18452801fa.22.2025.01.28.06.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 06:53:41 -0800 (PST)
Date: Tue, 28 Jan 2025 16:53:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 drm-dp 2/4] drm/hisilicon/hibmc: Getting connector
 info and edid by using aux channel
Message-ID: <zeorivlzvfvxxc25gd7adbdlodzi6qd4lnu7elsbfabnyktpxn@nbc2ojwzc75o>
References: <20250127032024.1542219-1-shiyongbang@huawei.com>
 <20250127032024.1542219-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127032024.1542219-3-shiyongbang@huawei.com>
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

On Mon, Jan 27, 2025 at 11:20:22AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Registering drm_aux and using it to get connector edid with drm functions.
> Refactoring some structs to fit aux's register framework.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 16 +++++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  7 +++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 22 +++++-----
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 40 +++++++++++++++++--
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 +++
>  7 files changed, 72 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> index 0a903cce1fa9..c07c970d2e50 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_print.h>
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> +#include "dp_hw.h"
>  
>  #define HIBMC_AUX_CMD_REQ_LEN		GENMASK(7, 4)
>  #define HIBMC_AUX_CMD_ADDR		GENMASK(27, 8)
> @@ -124,7 +125,8 @@ static int hibmc_dp_aux_parse_xfer(struct hibmc_dp_dev *dp, struct drm_dp_aux_ms
>  /* ret >= 0 ,ret is size; ret < 0, ret is err code */
>  static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
>  {
> -	struct hibmc_dp_dev *dp = container_of(aux, struct hibmc_dp_dev, aux);
> +	struct hibmc_dp_dev *dp = ((struct hibmc_dp *)container_of(aux, struct hibmc_dp,
> +								   aux))->dp_dev;

You should not need type conversion here.

>  	u32 aux_cmd;
>  	int ret;
>  	u32 val; /* val will be assigned at the beginning of readl_poll_timeout function */
> @@ -151,14 +153,16 @@ static ssize_t hibmc_dp_aux_xfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *
>  	return hibmc_dp_aux_parse_xfer(dp, msg);
>  }
>  
> -void hibmc_dp_aux_init(struct hibmc_dp_dev *dp)
> +void hibmc_dp_aux_init(struct hibmc_dp *dp)
>  {
> -	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
> -	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
> -	hibmc_dp_reg_write_field(dp, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
> +	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_SYNC_LEN_SEL, 0x0);
> +	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_TIMER_TIMEOUT, 0x1);
> +	hibmc_dp_reg_write_field(dp->dp_dev, HIBMC_DP_AUX_REQ, HIBMC_DP_CFG_AUX_MIN_PULSE_NUM,
>  				 HIBMC_DP_MIN_PULSE_NUM);
>  
>  	dp->aux.transfer = hibmc_dp_aux_xfer;
> -	dp->aux.is_remote = 0;
> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
> +	dp->aux.drm_dev = dp->drm_dev;
>  	drm_dp_aux_init(&dp->aux);
> +	dp->dp_dev->aux = &dp->aux;
>  }
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index 00b23301d26e..7edcecd5a5f0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -11,8 +11,11 @@
>  #include <linux/kernel.h>
>  #include <linux/bitfield.h>
>  #include <linux/io.h>
> +
>  #include <drm/display/drm_dp_helper.h>
>  
> +#include "dp_hw.h"
> +
>  #define HIBMC_DP_LANE_NUM_MAX 2
>  
>  struct hibmc_link_status {
> @@ -32,7 +35,7 @@ struct hibmc_dp_link {
>  };
>  
>  struct hibmc_dp_dev {
> -	struct drm_dp_aux aux;
> +	struct drm_dp_aux *aux;
>  	struct drm_device *dev;
>  	void __iomem *base;
>  	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
> @@ -58,7 +61,7 @@ struct hibmc_dp_dev {
>  		mutex_unlock(&_dp->lock);				\
>  	} while (0)
>  
> -void hibmc_dp_aux_init(struct hibmc_dp_dev *dp);
> +void hibmc_dp_aux_init(struct hibmc_dp *dp);
>  int hibmc_dp_link_training(struct hibmc_dp_dev *dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 0dac4cfdde7c..50050908606f 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <drm/drm_managed.h>
>  #include "dp_config.h"
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> @@ -156,7 +157,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	struct drm_device *drm_dev = dp->drm_dev;
>  	struct hibmc_dp_dev *dp_dev;
>  
> -	dp_dev = devm_kzalloc(drm_dev->dev, sizeof(struct hibmc_dp_dev), GFP_KERNEL);
> +	dp_dev = drmm_kcalloc(drm_dev, 1, sizeof(struct hibmc_dp_dev), GFP_KERNEL);

Too many unrelated changes at the same time. How is devm -> drmm
connected to the DP AUX? Please split it away.

>  	if (!dp_dev)
>  		return -ENOMEM;
>  
> @@ -167,7 +168,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->dev = drm_dev;
>  	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
>  
> -	hibmc_dp_aux_init(dp_dev);
> +	hibmc_dp_aux_init(dp);
>  
>  	if (hibmc_dp_phy_init(dp_dev))
>  		return -EAGAIN;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 4dc13b3d9875..53b6d0beecea 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -10,6 +10,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_print.h>
> +#include <drm/display/drm_dp_helper.h>
>  
>  struct hibmc_dp_dev;
>  
> @@ -19,6 +20,7 @@ struct hibmc_dp {
>  	struct drm_encoder encoder;
>  	struct drm_connector connector;
>  	void __iomem *mmio;
> +	struct drm_dp_aux aux;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> index 1124cd70c320..695cb9c0b643 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -27,7 +27,7 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>  	/* set rate and lane count */
>  	buf[0] = dp->link.cap.link_rate;
>  	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> -	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
> +	ret = drm_dp_dpcd_write(dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
>  	if (ret != sizeof(buf)) {
>  		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
>  		return ret >= 0 ? -EIO : ret;
> @@ -36,13 +36,13 @@ static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
>  	/* set 8b/10b and downspread */
>  	buf[0] = DP_SPREAD_AMP_0_5;
>  	buf[1] = DP_SET_ANSI_8B10B;
> -	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
> +	ret = drm_dp_dpcd_write(dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
>  	if (ret != sizeof(buf)) {
>  		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
>  		return ret >= 0 ? -EIO : ret;
>  	}
>  
> -	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
> +	ret = drm_dp_read_dpcd_caps(dp->aux, dp->dpcd);
>  	if (ret)
>  		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
>  
> @@ -85,7 +85,7 @@ static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
>  
>  	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_PAT_SEL, val);
>  
> -	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
> +	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
>  	if (ret != sizeof(buf)) {
>  		drm_dbg_dp(dp->dev, "dp aux write training pattern set failed\n");
>  		return ret >= 0 ? -EIO : ret;
> @@ -115,7 +115,7 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
> +	ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
>  	if (ret != dp->link.cap.lanes) {
>  		drm_dbg_dp(dp->dev, "dp aux write training lane set failed\n");
>  		return ret >= 0 ? -EIO : ret;
> @@ -198,9 +198,9 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  
>  	voltage_tries = 1;
>  	for (cr_tries = 0; cr_tries < 80; cr_tries++) {
> -		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(dp->aux, dp->dpcd);
>  
> -		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
> +		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
>  		if (ret != DP_LINK_STATUS_SIZE) {
>  			drm_err(dp->dev, "Get lane status failed\n");
>  			return ret;
> @@ -224,7 +224,7 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  		if (ret)
>  			return ret;
>  
> -		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
> +		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
>  					dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
>  			drm_dbg_dp(dp->dev, "Update link training failed\n");
> @@ -251,9 +251,9 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>  		return ret;
>  
>  	for (eq_tries = 0; eq_tries < HIBMC_EQ_MAX_RETRY; eq_tries++) {
> -		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
> +		drm_dp_link_train_channel_eq_delay(dp->aux, dp->dpcd);
>  
> -		ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
> +		ret = drm_dp_dpcd_read_link_status(dp->aux, lane_status);
>  		if (ret != DP_LINK_STATUS_SIZE) {
>  			drm_err(dp->dev, "get lane status failed\n");
>  			break;
> @@ -278,7 +278,7 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>  		if (ret)
>  			return ret;
>  
> -		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
> +		ret = drm_dp_dpcd_write(dp->aux, DP_TRAINING_LANE0_SET,
>  					dp->link.train_set, dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
>  			drm_dbg_dp(dp->dev, "Update link training failed\n");
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index 603d6b198a54..fac8485a69d9 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -15,11 +15,27 @@
>  
>  static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  {
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +	const struct drm_edid *drm_edid;
>  	int count;
>  
> -	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> +
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	if (drm_edid) {

No need for a conditional, please drop.

> +		count = drm_edid_connector_add_modes(connector);
> +		if (count)
> +			goto out;
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
>  				     connector->dev->mode_config.max_height);
> -	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
> +	drm_set_preferred_mode(connector, 1024, 768);

You don't need this anymore, please drop it.
drm_helper_probe_single_connector_modes() will add a default 640x480 per
the standard.

> +
> +out:
> +	drm_edid_free(drm_edid);
>  
>  	return count;
>  }
> @@ -28,12 +44,28 @@ static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
>  	.get_modes = hibmc_dp_connector_get_modes,
>  };
>  
> +static int hibmc_dp_late_register(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	return drm_dp_aux_register(&dp->aux);
> +}
> +
> +static void hibmc_dp_early_unregister(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	drm_dp_aux_unregister(&dp->aux);
> +}
> +
>  static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.late_register = hibmc_dp_late_register,
> +	.early_unregister = hibmc_dp_early_unregister,
>  };
>  
>  static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
> @@ -103,8 +135,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
>  
>  	drm_encoder_helper_add(encoder, &hibmc_dp_encoder_helper_funcs);
>  
> -	ret = drm_connector_init(dev, connector, &hibmc_dp_conn_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> +	ret = drm_connector_init_with_ddc(dev, connector, &hibmc_dp_conn_funcs,
> +					  DRM_MODE_CONNECTOR_DisplayPort, &dp->aux.ddc);
>  	if (ret) {
>  		drm_err(dev, "init dp connector failed: %d\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> index d982f1e4b958..3ddd71aada66 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
> @@ -47,6 +47,11 @@ static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
>  	return container_of(connector, struct hibmc_vdac, connector);
>  }
>  
> +static inline struct hibmc_dp *to_hibmc_dp(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct hibmc_dp, connector);
> +}
> +
>  static inline struct hibmc_drm_private *to_hibmc_drm_private(struct drm_device *dev)
>  {
>  	return container_of(dev, struct hibmc_drm_private, dev);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
