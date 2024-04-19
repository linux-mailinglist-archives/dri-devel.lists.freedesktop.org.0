Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93358AADA8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0410E297;
	Fri, 19 Apr 2024 11:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jdF3RFt5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC61110EDB3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:24:38 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-518b9527c60so2108764e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713525877; x=1714130677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MwvCeAUNO+rgXSg2G7IWncCCquc5f0yHXUdIPMY2MPI=;
 b=jdF3RFt5tF05nAuS3bEVZwqwC8n8d0Ca8sCy5cYyhCZSIf89H9kELk7TjPBGhaEW3W
 Dx+bfmugNhJC9pZcJEib0vJmW9qNrsdhsnJnyFaCdTvFtR1zOHOCfij8I16Q/dn22nnq
 gG6W3Q5YK1EkkWGmedKI4AnnyDJdDidm2j3RpxL27UZB9LSobM6vXxgV+IIwRblAlPBC
 axLZohfaMugCfqvQ9B/sX6q55rKZLMpeQs0ZrtG0UsgbWv1TMjWJJj4qlruyX1cE6FGE
 0ySQI5kt6EMtPws9PNFCv5aJnG04m9wthKD/psgGk1SaPl5cbls8wSR1BJLNuKqqbCtA
 K7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713525877; x=1714130677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwvCeAUNO+rgXSg2G7IWncCCquc5f0yHXUdIPMY2MPI=;
 b=ccJdv7ciOSrZC4SH1krjDMUa9eKZBb3jfKvA31YYKId9fABjXpoT2aKgsNTlASD21Z
 YQBCDn1xieZ/qoK2wuKFQ5Qfc4lYX8HfoHDL9yZQ9XGQjz/A2lTkhhAYZM2H/QR5nUjH
 6dTIMqH6ybm/DbFAkTN79f4qUpyCUcuctF03rEvMCc3kTartDAlD0lhjNO1/76VcDRMb
 llaGxeMee/S+crgoi/+U00Gjmg2tDjPGst6GoJbf+pcmGmWHwTCpc9jMXRgXzocQx1hd
 F+L5e0He4wb7o318/GfQtYcnt+226eXk2jnNmFHSrQ5n/jVGFkriQi8oXafntpXLWwYI
 jZtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/M16vYVdk3XXqhlNvHrKoqPSet8/5KeR6IPpbz8glthoqBcfXDGPRUI2r1f3V3Q6/tSmddJfY014oq/YlEvT9SrtzW32vgHYFXHLqc6RS
X-Gm-Message-State: AOJu0YyvHCPjtiTjRrC9rPEBBWgpxNnFe1UHpM2GMtjeikcxwOHnarYo
 EqnBtNvm9NBv38B21wGfY2xJAGBkOQ02Ww8Xa/9iwDNPKjv2z2WJ/NInUcAb7X8=
X-Google-Smtp-Source: AGHT+IFyCOPkhisTDpbq53VipCfhKB4DLaR7MMdCd6PwJ9EbyXU3vLpcrrHU055gY63rlscgjAuQUg==
X-Received: by 2002:ac2:4a71:0:b0:518:d956:5c5e with SMTP id
 q17-20020ac24a71000000b00518d9565c5emr1533956lfp.67.1713525876651; 
 Fri, 19 Apr 2024 04:24:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a19380f000000b0051aaf26f4a0sm418919lfa.101.2024.04.19.04.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:24:36 -0700 (PDT)
Date: Fri, 19 Apr 2024 14:24:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kuro <kuro.chung@ite.com.tw>
Cc: Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Kenneth Haung <kenneth.hung@ite.com.tw>, 
 Kuro Chung <kuro.chung@ite.corp-partner.google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/1] UPSTREAM: drm/bridge: it6505: fix hibernate to
 resume no display issue
Message-ID: <wk5v2qd3if22t5obgqeyrestc4bc464gtagimq4lpgtx2n3f6v@2s4cuyvgwvbo>
References: <20240419073809.706471-1-kuro.chung@ite.com.tw>
 <20240419073809.706471-2-kuro.chung@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419073809.706471-2-kuro.chung@ite.com.tw>
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

On Fri, Apr 19, 2024 at 03:38:07PM +0800, kuro wrote:
> From: Kuro <kuro.chung@ite.com.tw>
> 
> ITE added a FIFO reset bit for input video. When system power resume,
> the TTL input of it6505 may get some noise before video signal stable
> and the hardware function reset is required.
> But the input FIFO reset will also trigger error interrupts of output module rising.
> Thus, it6505 have to wait a period can clear those expected error interrupts
> caused by manual hardware reset in one interrupt handler calling to avoid interrupt looping.
> 
> Signed-off-by: Kuro Chung <kuro.chung@ite.corp-partner.google.com>

Generic, please drop 'UPSTREAM' part of the subject. Do not use such
tags for sending patches upstream.

> 
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 181 +++++++++++++++++++---------
>  1 file changed, 124 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index b53da9bb65a16..4fd693b4b68ca 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -802,8 +802,8 @@ static void it6505_int_mask_enable(struct it6505 *it6505)
>  		     BIT(INT_RECEIVE_HPD_IRQ) | BIT(INT_SCDT_CHANGE) |
>  		     BIT(INT_HDCP_FAIL) | BIT(INT_HDCP_DONE));
>  
> -	it6505_write(it6505, INT_MASK_02, BIT(INT_AUX_CMD_FAIL) |
> -		     BIT(INT_HDCP_KSV_CHECK) | BIT(INT_AUDIO_FIFO_ERROR));
> +	it6505_write(it6505, INT_MASK_02, BIT(INT_HDCP_KSV_CHECK) |
> +			 BIT(INT_AUDIO_FIFO_ERROR));
>  
>  	it6505_write(it6505, INT_MASK_03, BIT(INT_LINK_TRAIN_FAIL) |
>  		     BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
> @@ -1317,10 +1317,17 @@ static void it6505_video_reset(struct it6505 *it6505)
>  	it6505_link_reset_step_train(it6505);
>  	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_MUTE);
>  	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00);
> -	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
> +
> +	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
> +	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
> +
>  	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_FIFO);
>  	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
> +
> +	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
> +	usleep_range(1000, 2000);
>  	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
> +

Extra empty line.

>  }
>  
>  static void it6505_update_video_parameter(struct it6505 *it6505,
> @@ -1861,16 +1868,29 @@ static void it6505_reset_hdcp(struct it6505 *it6505)
>  	/* Disable CP_Desired */
>  	it6505_set_bits(it6505, REG_HDCP_CTRL1, HDCP_CP_ENABLE, 0x00);
>  	it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, HDCP_RESET);
> +	it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, 0x00);
>  }
>  
>  static void it6505_start_hdcp(struct it6505 *it6505)
>  {
>  	struct device *dev = &it6505->client->dev;
>  
> -	DRM_DEV_DEBUG_DRIVER(dev, "start");
> -	it6505_reset_hdcp(it6505);
> -	queue_delayed_work(system_wq, &it6505->hdcp_work,
> -			   msecs_to_jiffies(2400));
> +	/*
> +	 * If video not stable, no need turn on HDCP
> +	 * After video stable
> +	 * SCDT IRQ ->Link Training-> HDCP
> +	 */
> +	if (it6505_get_video_status(it6505)) {

Won't this be easier:

if (!it6505_get_video_status(it6505)) {
	DRM_DEV_DEBUG_DRIVER(dev, "Video not ready for HDCP");
	return;
}


> +		DRM_DEV_DEBUG_DRIVER(dev, "start");
> +		it6505_reset_hdcp(it6505);
> +
> +		queue_delayed_work(system_wq, &it6505->hdcp_work,
> +				   msecs_to_jiffies(2400));
> +
> +			return;
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "Video not ready for HDCP");
>  }
>  
>  static void it6505_stop_hdcp(struct it6505 *it6505)
> @@ -2249,12 +2269,11 @@ static void it6505_link_training_work(struct work_struct *work)
>  	if (ret) {
>  		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
>  		it6505_link_train_ok(it6505);
> -		return;
>  	} else {
>  		it6505->auto_train_retry--;
> +		it6505_dump(it6505);

This seems like an unrelated change. Please split this to a separate
commit.

>  	}
>  
> -	it6505_dump(it6505);
>  }
>  
>  static void it6505_plugged_status_to_codec(struct it6505 *it6505)
> @@ -2309,14 +2328,24 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
>  	DRM_DEV_DEBUG_DRIVER(dev, "dp_irq_vector = 0x%02x", dp_irq_vector);
>  
>  	if (dp_irq_vector & DP_CP_IRQ) {
> -		it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
> -				HDCP_TRIGGER_CPIRQ);
> +
> +		DRM_DEV_DEBUG_DRIVER(dev, "DP_CP_IRQ :hdcp_status = 0x%02x", it6505->hdcp_status);
> +
> +		/*
> +		 * Some TYPE-C devces trigger CP_IRQ when system resume
> +		 * And IT6505 HDCP is in idle state
> +		 * No Need trigger 6505 HDCP control.
> +		 */
> +		if (it6505->hdcp_status == HDCP_AUTH_GOING)
> +			it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
> +					HDCP_TRIGGER_CPIRQ);
>  
>  		bstatus = it6505_dpcd_read(it6505, DP_AUX_HDCP_BSTATUS);
>  		if (bstatus < 0)
>  			return bstatus;
>  
>  		DRM_DEV_DEBUG_DRIVER(dev, "Bstatus = 0x%02x", bstatus);
> +

Separate commit too.

>  	}
>  
>  	ret = drm_dp_dpcd_read_link_status(&it6505->aux, link_status);
> @@ -2328,9 +2357,24 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
>  	DRM_DEV_DEBUG_DRIVER(dev, "link status = 0x%*ph",
>  			     (int)ARRAY_SIZE(link_status), link_status);
>  
> -	if (!drm_dp_channel_eq_ok(link_status, it6505->lane_count)) {
> +	/*
> +	 * when recive HPD_IRQ signal from DP SINK
> +	 * No need to process link status when DP link is not in ready state
> +	 */
> +	if ((it6505->link_state == LINK_OK) &&
> +		(!drm_dp_channel_eq_ok(link_status, it6505->lane_count))) {

Please indent to the opening bracket.

> +
> +		if (it6505->hdcp_desired)
> +			it6505_stop_hdcp(it6505);
> +
>  		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -		it6505_video_reset(it6505);
> +
> +		/*
> +		 * Link symble lost , need restart trainig
> +		 * if no video, wait for video SCDT IRQ
> +		 */
> +		if (it6505_get_video_status(it6505))
> +			schedule_work(&it6505->link_works);
>  	}
>  
>  	return 0;
> @@ -2408,21 +2452,6 @@ static void it6505_irq_hpd_irq(struct it6505 *it6505)
>  		DRM_DEV_DEBUG_DRIVER(dev, "process hpd_irq fail!");
>  }
>  
> -static void it6505_irq_scdt(struct it6505 *it6505)
> -{
> -	struct device *dev = &it6505->client->dev;
> -	bool data;
> -
> -	data = it6505_get_video_status(it6505);
> -	DRM_DEV_DEBUG_DRIVER(dev, "video stable change interrupt, %s",
> -			     data ? "stable" : "unstable");
> -	it6505_calc_video_info(it6505);
> -	it6505_link_reset_step_train(it6505);
> -
> -	if (data)
> -		schedule_work(&it6505->link_works);
> -}
> -

It looks now that you have a separate set of changes here, realted to
IRQ processing. Please split HDCP fixes and the IRQ-related changes.

>  static void it6505_irq_hdcp_done(struct it6505 *it6505)
>  {
>  	struct device *dev = &it6505->client->dev;
> @@ -2442,13 +2471,6 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
>  	it6505_start_hdcp(it6505);
>  }
>  
> -static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)
> -{
> -	struct device *dev = &it6505->client->dev;
> -
> -	DRM_DEV_DEBUG_DRIVER(dev, "AUX PC Request Fail Interrupt");
> -}
> -
>  static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
>  {
>  	struct device *dev = &it6505->client->dev;
> @@ -2475,31 +2497,69 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
>  	schedule_work(&it6505->link_works);
>  }
>  
> -static void it6505_irq_video_fifo_error(struct it6505 *it6505)
> +static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)

Any reason for not using the existing test_bit() ?

>  {
> -	struct device *dev = &it6505->client->dev;
> -
> -	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -	flush_work(&it6505->link_works);
> -	it6505_stop_hdcp(it6505);
> -	it6505_video_reset(it6505);
> +	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
>  }
>  
> -static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> +static void it6505_irq_scdt(struct it6505 *it6505)

Please refrain from moving the functions in the same commit as changing
them. It is hard to check what happened with it6505_irq_scdt().

>  {
>  	struct device *dev = &it6505->client->dev;
> +	bool data;
>  
> -	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
> -	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -	flush_work(&it6505->link_works);
> -	it6505_stop_hdcp(it6505);
> -	it6505_video_reset(it6505);
> +	data = it6505_get_video_status(it6505);
> +	DRM_DEV_DEBUG_DRIVER(dev, "video stable change interrupt, %s", data ? "stable" : "unstable");
> +
> +	it6505_calc_video_info(it6505);
> +	it6505_link_reset_step_train(it6505);
> +
> +	if (data)
> +		schedule_work(&it6505->link_works);
>  }
>  
> -static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> +
> +static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
>  {
> -	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> +	struct device *dev = &it6505->client->dev;
> +	int reg_0d, reg_int03;
> +
> +	/*
> +	 * When video SCDT change with video not stable,
> +	 * Or video FIFO error, need video reset
> +	 */
> +
> +	if ((!it6505_get_video_status(it6505) &&
> +		(it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_status))) ||
> +		(it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int *) int_status)) ||
> +		(it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *) int_status))) {
> +
> +		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> +		flush_work(&it6505->link_works);
> +		it6505_stop_hdcp(it6505);
> +		it6505_video_reset(it6505);
> +
> +		usleep_range(10000, 11000);
> +
> +		/*
> +		 * Clear FIFO error IRQ to prevent fifo error -> reset loop
> +		 * HW will trigger SCDT change IRQ again when video stable
> +		 */
> +
> +		reg_int03 = it6505_read(it6505, INT_STATUS_03);
> +		reg_0d = it6505_read(it6505, REG_SYSTEM_STS);
> +
> +		reg_int03 &= (BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
> +		it6505_write(it6505, INT_STATUS_03, reg_int03);
> +
> +		DRM_DEV_DEBUG_DRIVER(dev, "reg08 = 0x%02x", reg_int03);
> +		DRM_DEV_DEBUG_DRIVER(dev, "reg0D = 0x%02x", reg_0d);
> +
> +		return;
> +	}
> +
> +
> +	if (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_status))
> +		it6505_irq_scdt(it6505);
>  }
>  
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> @@ -2512,15 +2572,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  	} irq_vec[] = {
>  		{ BIT_INT_HPD, it6505_irq_hpd },
>  		{ BIT_INT_HPD_IRQ, it6505_irq_hpd_irq },
> -		{ BIT_INT_SCDT, it6505_irq_scdt },
>  		{ BIT_INT_HDCP_FAIL, it6505_irq_hdcp_fail },
>  		{ BIT_INT_HDCP_DONE, it6505_irq_hdcp_done },
> -		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
>  		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
>  		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
>  		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
> -		{ BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
> -		{ BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_overflow },
>  	};
>  	int int_status[3], i;
>  
> @@ -2546,10 +2602,13 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  		irq_vec[0].handler(it6505);
>  
>  	if (it6505->hpd_state) {
> +
>  		for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
>  			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
>  				irq_vec[i].handler(it6505);
>  		}
> +
> +		it6505_irq_video_handler(it6505, (unsigned int *) int_status);
>  	}
>  
>  	pm_runtime_put_sync(dev);
> @@ -3072,9 +3131,17 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
>  	DRM_DEV_DEBUG_DRIVER(dev, "start");
>  
>  	if (it6505->powered) {
> -		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> -					     DP_SET_POWER_D3);
> +
>  		it6505_video_disable(it6505);
> +
> +		/*
> +		 * After Set link video mute,
> +		 * wait 20ms before send D3 to DP sink
> +		 */
> +		usleep_range(20000, 25000);

Separate commit.

> +
> +		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> +						DP_SET_POWER_D3);
>  	}
>  }
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
