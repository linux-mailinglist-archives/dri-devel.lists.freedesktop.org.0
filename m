Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E8A333E2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ECF10E334;
	Thu, 13 Feb 2025 00:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GVLaXDqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217C110E334
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:14:03 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5450d56199cso1598021e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739405641; x=1740010441; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9yF1fK737Q+aQg+9cDbOgE7aPGSAgXjxveKV/fRfrr4=;
 b=GVLaXDqqTRBEALqHiRgML1h7yxqL5sldtAFXnSu5I+GfJp/yk7ch3cqYBaC6v1q+OZ
 k7FklXTK3v2yupAW5PY4ukhIIoxx92p787ewSp68Lor2mLfmglLwnwJSBAEU2u2qOzRy
 04ls3O+/hTIf35wxWyIVMfLaK5AqptG1GcM0VZhlRaQK1bqwy9j0ER8UJ5mOAOrHyRp1
 i6S5Yo+HHQxbWPu3xrVVcRKkMMvUo1IFbaY7Cqt1X0PRfinqT3Pjpd10sONhyrFs2HE8
 XgpHPn3FM1uuUVb1Pp8PaFDNd7YqNsaTuAlvHJt1PD66Lx8IHlxqRhnCe262qifUsb+T
 Vssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739405641; x=1740010441;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yF1fK737Q+aQg+9cDbOgE7aPGSAgXjxveKV/fRfrr4=;
 b=RqP+L6h1ChsHOPfuvdKwtpCf3/FvVGDiIaHfnufpUn6zNDf0+5O3Y/LrS0Y/4Kyrec
 7u5I64sOuiKcJjSd75wiHquBBg7sjRFnSaCkGpb/MAyoMDxzrhi3EzIcawvd3GMYMMHQ
 Q/Ter7sI5T/rwEbH5GSk/hzpDyODCnv+BfnjIyYG+RlVwNwGIZn2jWpSTJ/WRiq+Xo9B
 THz/PpXyEFwi0MDo5yznSL+5jzuMbgDt7PVzZ+D2mCGXzvxrWkcXsRliXYUF/SFwD03O
 OkT8iVal23uE4vnyS7AQVUBjPObReXKuBGEaI46CsSJ/a7dK/p7UD8Mf/Fy8QWLW5DA8
 OnLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/C10Ske1alwcaITGEfZnt6O3ObV6C4arcBoQANYAjHXzzEXV+bfTUWKHtZxUId6q3MUNXx565q4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaXZdWBrP1TkAXMuO2EKyCd7XCV2a+ZT6Cikz75VKOSgyl+fLN
 gduUTv4sBB30dmrKu/zyCYHCZZk5aoqkSUVF3ZYeMkRylw4loBW+imTD9zyS/GE=
X-Gm-Gg: ASbGncsQHp4hedhL39MqmOR5m0bRWnHuuEKu7olaPFqxwzD4WimfmFziA3Pe2NQkcD4
 9zBaxjQz/Yc4XLjAbif7yKo6Sb+M4IAjZJBiWuLs2A79r+wheiIT+kL8zJzm9X/Mx09O++kcTG2
 +NYnNZJ5sPCABMOsH0k6uMhxytf4yUKIHWRcNO/ZLIbn04kcdfqO94cgcXIL3rH7G6j8Hcc6SK7
 GBKFIurovz+i8GKKvp0BHjMQ6AZ6pIbZTf/WicP89Xo+52/fGBwltvOQwH44ifLbsgBNpXrhhWy
 HAok+6qE5EKlRcd6T1ULTADKP00i/2qEG8ZsmkNf95RouRrKssCTG4lunglnZlK2j1oFLK8=
X-Google-Smtp-Source: AGHT+IHcX9X0o6kk8d0T8nSizhu76Axq/vXBFtT5TpumgM7W5f6PgrDPA08I0Sf9aXAe2V2hwWS4qw==
X-Received: by 2002:a05:6512:3ba3:b0:545:11a3:7775 with SMTP id
 2adb3069b0e04-5451dfcb82fmr210497e87.7.1739405641223; 
 Wed, 12 Feb 2025 16:14:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10ccc5sm13571e87.178.2025.02.12.16.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:14:00 -0800 (PST)
Date: Thu, 13 Feb 2025 02:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 3/7] drm/hisilicon/hibmc: Getting connector
 info and edid by using aux channel
Message-ID: <tjyng2vv2l32wzpicc2nuzfk2skaxvku3bjjm46tqg2qlzl35i@imdwvv7qy3kr>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-4-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:55PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Registering drm_aux and using it to get connector edid with drm functions.
> Refactoring some structs to fit aux's register framework. We need change

Nit: EDID, AUX.

> a lot about getting member of drm_aux, because we change it's postions from
> struct hibmc_dp_dev to struct hibmc_dp.

Why? Please describe the reasons, not what is being done. It might be
beneficial to split the patch into two parts:
 - move the drm_aux + make it compile
 - the rest of the changes.

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - deleting type conversion, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 16 ++++++----
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  7 +++--
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 22 +++++++-------
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 30 +++++++++++--------
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  5 ++++
>  7 files changed, 52 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> index 0a903cce1fa9..e0bb9b14d9d8 100644
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
> +	struct hibmc_dp *dp_priv = container_of(aux, struct hibmc_dp, aux);
> +	struct hibmc_dp_dev *dp = dp_priv->dp_dev;
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
> index e7746bc4b592..d613da8b544c 100644
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
> index ee1ff205ff56..77f02d5151f7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -168,7 +168,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->dev = drm_dev;
>  	dp_dev->base = dp->mmio + HIBMC_DP_OFFSET;
>  
> -	hibmc_dp_aux_init(dp_dev);
> +	hibmc_dp_aux_init(dp);
>  
>  	if (hibmc_dp_serdes_init(dp_dev))
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
> index 43a4b656493f..4a99a9b7e3c4 100644
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
> index 603d6b198a54..795c5b1a6b99 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -13,20 +13,24 @@
>  #include "hibmc_drm_drv.h"
>  #include "dp/dp_hw.h"
>  
> -static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
> -{
> -	int count;
> +static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> +	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc,
> +};
>  
> -	count = drm_add_modes_noedid(connector, connector->dev->mode_config.max_width,
> -				     connector->dev->mode_config.max_height);
> -	drm_set_preferred_mode(connector, 1024, 768); // temporary implementation
> +static int hibmc_dp_late_register(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
>  
> -	return count;
> +	return drm_dp_aux_register(&dp->aux);
>  }
>  
> -static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> -	.get_modes = hibmc_dp_connector_get_modes,
> -};
> +static void hibmc_dp_early_unregister(struct drm_connector *connector)
> +{
> +	struct hibmc_dp *dp = to_hibmc_dp(connector);
> +
> +	drm_dp_aux_unregister(&dp->aux);
> +}
>  
>  static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
>  	.reset = drm_atomic_helper_connector_reset,
> @@ -34,6 +38,8 @@ static const struct drm_connector_funcs hibmc_dp_conn_funcs = {
>  	.destroy = drm_connector_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.late_register = hibmc_dp_late_register,
> +	.early_unregister = hibmc_dp_early_unregister,
>  };
>  
>  static inline int hibmc_dp_prepare(struct hibmc_dp *dp, struct drm_display_mode *mode)
> @@ -103,8 +109,8 @@ int hibmc_dp_init(struct hibmc_drm_private *priv)
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
