Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC1E8C84F0
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 12:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BCC10EE8F;
	Fri, 17 May 2024 10:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IwCDPTGM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A01510E29B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715942225;
 bh=nr2RVcaS3Fx7M56dgJm7Q03MlI3yuezRRQRfyTmjjG0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=IwCDPTGMfccHM/2vWg8g8i52O1ausYB1KEmwgL1WRtt7ge3k+PLBaejjocEboqIKa
 jyfhWLezqxiwx+9hOxUOEafgEfQrD7JyaLmNBlAB4UOtTNFakqQWXxqoTNcrHENn5k
 zp+Z/+DHIL/dvHiwiNYGvPVSnzxMwT0uqYA24h7acU///le41H3vWS8eJBRVHdJdZp
 vs1N0Yit6sn1b/cNf8zrPmBGTnSbLT1miGZitdcFUY8ElxRVdi16girpbeZ2xpSYup
 VuVNGSW+3gGHiIb8r+ZDS4MttyLr5/ErH1O2W7awu9WXf2UtSm8RBgMSgFxrLRFFD+
 g33erZ6DLtgVQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39E313782198;
 Fri, 17 May 2024 10:37:04 +0000 (UTC)
Message-ID: <ec3cea1f-86c7-4e9d-b538-57862c358c2f@collabora.com>
Date: Fri, 17 May 2024 12:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] drm/bridge: it6505: This patch fixes hibernate to
 resume no display issue
To: kuro <kuro.chung@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>,
 Kenneth Haung <kenneth.hung@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240517021654.1034218-1-kuro.chung@ite.com.tw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240517021654.1034218-1-kuro.chung@ite.com.tw>
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

Il 17/05/24 04:16, kuro ha scritto:
> From: Kuro Chung <kuro.chung@ite.com.tw>
> 
> This patch added a FIFO reset bit for input video. When system power resume,
> the TTL input of it6505 may get some noise before video signal stable
> and the hardware function reset is required.
> But the input FIFO reset will also trigger error interrupts of output
> module rising.Thus, it6505 have to wait a period can clear those
> expected error interrupts caused by manual hardware reset in one
> interrupt handler calling to avoid interrupt looping.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> 

Your Signed-off-by tag is missing.

Regards,
Angelo

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
>   1 file changed, 49 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 469157341f3ab..5703fcf4b7b00 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1307,9 +1307,15 @@ static void it6505_video_reset(struct it6505 *it6505)
>   	it6505_link_reset_step_train(it6505);
>   	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_MUTE);
>   	it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00);
> -	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
> +
> +	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, TX_FIFO_RESET);
> +	it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
> +
>   	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_FIFO);
>   	it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
> +
> +	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET);
> +	usleep_range(1000, 2000);
>   	it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
>   }
>   
> @@ -2245,12 +2251,11 @@ static void it6505_link_training_work(struct work_struct *work)
>   	if (ret) {
>   		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
>   		it6505_link_train_ok(it6505);
> -		return;
>   	} else {
>   		it6505->auto_train_retry--;
> +		it6505_dump(it6505);
>   	}
>   
> -	it6505_dump(it6505);
>   }
>   
>   static void it6505_plugged_status_to_codec(struct it6505 *it6505)
> @@ -2471,31 +2476,53 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
>   	schedule_work(&it6505->link_works);
>   }
>   
> -static void it6505_irq_video_fifo_error(struct it6505 *it6505)
> +static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
>   {
> -	struct device *dev = it6505->dev;
> -
> -	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -	flush_work(&it6505->link_works);
> -	it6505_stop_hdcp(it6505);
> -	it6505_video_reset(it6505);
> +	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
>   }
>   
> -static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> +static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_status)
>   {
>   	struct device *dev = it6505->dev;
> +	int reg_0d, reg_int03;
>   
> -	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
> -	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
> -	flush_work(&it6505->link_works);
> -	it6505_stop_hdcp(it6505);
> -	it6505_video_reset(it6505);
> -}
> +	/*
> +	 * When video SCDT change with video not stable,
> +	 * Or video FIFO error, need video reset
> +	 */
>   
> -static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> -{
> -	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
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
>   }
>   
>   static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> @@ -2508,15 +2535,12 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>   	} irq_vec[] = {
>   		{ BIT_INT_HPD, it6505_irq_hpd },
>   		{ BIT_INT_HPD_IRQ, it6505_irq_hpd_irq },
> -		{ BIT_INT_SCDT, it6505_irq_scdt },
>   		{ BIT_INT_HDCP_FAIL, it6505_irq_hdcp_fail },
>   		{ BIT_INT_HDCP_DONE, it6505_irq_hdcp_done },
>   		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
>   		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
>   		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
>   		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
> -		{ BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
> -		{ BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_overflow },
>   	};
>   	int int_status[3], i;
>   
> @@ -2546,6 +2570,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>   			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
>   				irq_vec[i].handler(it6505);
>   		}
> +		it6505_irq_video_handler(it6505, (unsigned int *) int_status);
>   	}
>   
>   	pm_runtime_put_sync(dev);


