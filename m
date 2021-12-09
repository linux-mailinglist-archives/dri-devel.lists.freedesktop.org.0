Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C346EFA6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05DB10E290;
	Thu,  9 Dec 2021 16:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3348189CF6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:27:45 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id k2so9537102lji.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OD6dYNHp3btewwqvoNpB45FBLhPMDMantLC3BV7Jwf8=;
 b=ptKqzU0lblnbFQfnFsgXMY56ZMm6hIK+YQHm7mhiCZyk98AA1QuLf+LKWJTzP4iHM5
 7L4MXYXYRFTel5qGrkB0pkpQRj8k7rrnkN8bYzppq15x284viWL7fwJJAhcGll16XLjd
 4BXZh+0sPpaGaevNZlSq8LwHolN1rre9Ldwm2wJlUCKoOEa/viJMibpl1KxGbdwG65Ap
 3+czmC9WaSX3A5EOxWLcZTEZYORCQV1km0PSk85Up8L9DeaJazfvgqgFU9Ag+HMIDczR
 L1f2WZQSwYJ6rUjs0r9kJDgfp8Bo2n05DkjQp2ap/xJq+CgNvf0aoff8gGao2PnCuP5O
 6Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OD6dYNHp3btewwqvoNpB45FBLhPMDMantLC3BV7Jwf8=;
 b=t/U/Mz/1+MxjC7fRlaBdMUVPozLhg3LrTbnThpkpmMkZ4sMRnVpdnKg4rj3MpEQenS
 dr5EOe1+p9Db4Z/EPDfH93GqbJXXWebNaJCg2aZrBBEYY949hvY7X7xB3D0tzQBDFEoD
 NnmdLT2Ma/zlJ+dwBhTcsqcCNkqiDO1weITorUB+gBfDANPfCJCzyZUdhVtvWZrto4YX
 GaJBjzGk18dX+iLqRi7GQGr/v2NPjHjWHKzt6xQKSTvJDPDLcZGjvuNA3BAQ7mO1sVCx
 j6rFhsBM3b7Ne6xKVJl+RM67KJubX3gsFfeE4vzxcFHol97a4et/xTvPCQDTjdcqkCIQ
 pEsg==
X-Gm-Message-State: AOAM530DYYXgTowm9O0ZDO224x+uUbdobbFMXRlcSwevRwlvf3Bligaj
 raMPpVLZBfXkjNgzINUxSbcbKUWNP/Q=
X-Google-Smtp-Source: ABdhPJxSeQGBSZJYWjqYDF7X0RJoeNROhixN+DYE4tIatKvSS72CGZCgQCS0z23+R58yd2ZKFmcZkQ==
X-Received: by 2002:a2e:e09:: with SMTP id 9mr6798621ljo.172.1639063663537;
 Thu, 09 Dec 2021 07:27:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id y7sm21114lfj.90.2021.12.09.07.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 07:27:43 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To: Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, sumit.semwal@linaro.org, thierry.reding@gmail.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72ea6030-5f2d-4f51-3a42-8386c3638c65@gmail.com>
Date: Thu, 9 Dec 2021 18:27:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

09.12.2021 18:05, Akhil R пишет:
> Emulate the SMBus block read using ContinueXfer and SMBus using GPIO
> interrupt.
> 
> For SMBus block read, the driver  reads the first byte with ContinueXfer
> set which will help to parse the data count and read the remaining bytes
> without stop condition in between.
> SMBus alert is implemented using external gpio interrupt.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 54 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a5be8f0..3b70013 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -14,6 +14,7 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -226,6 +227,11 @@ struct tegra_i2c_hw_feature {
>  	bool has_interface_timing_reg;
>  };
>  
> +struct tegra_i2c_smbalert {

smbalert isn't a word, should be smbus_alert. Same for the GPIO name and
other places.

> +	struct i2c_smbus_alert_setup alert_data;
> +	struct i2c_client *ara;

What "ara" stands for? Please use meaningful names, like alert_dev for
example.

I don't see where this member is used at all, please remove it.

> +};
> +
>  /**
>   * struct tegra_i2c_dev - per device I2C context
>   * @dev: device reference for power management
> @@ -280,6 +286,8 @@ struct tegra_i2c_dev {
>  	int msg_err;
>  	u8 *msg_buf;
>  
> +	struct tegra_i2c_smbalert smbalert;

All properties must have doc comment.

>  	struct completion dma_complete;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> @@ -1232,6 +1240,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		return err;
>  
>  	i2c_dev->msg_buf = msg->buf;
> +
> +	/* The condition true implies smbus block read and len is already read*/

Proper SMBus capitalization in comments. Mussing whitespace in the end
of the comment.

> +	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
> +		i2c_dev->msg_buf = msg->buf + 1;
> +
>  	i2c_dev->msg_buf_remaining = msg->len;
>  	i2c_dev->msg_err = I2C_ERR_NONE;
>  	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
> @@ -1388,6 +1401,15 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			else
>  				end_type = MSG_END_REPEAT_START;
>  		}
> +		/* If M_RECV_LEN use ContinueXfer to read the first byte */
> +		if (msgs[i].flags & I2C_M_RECV_LEN) {
> +			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
> +			if (ret)
> +				break;
> +			/* Set the read byte as msg len */
> +			msgs[i].len = msgs[i].buf[0];
> +			dev_dbg(i2c_dev->dev, "reading %d bytes\n", msgs[i].len);
> +		}
>  		ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], end_type);
>  		if (ret)
>  			break;
> @@ -1415,7 +1437,8 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	u32 ret = I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
> -		  I2C_FUNC_10BIT_ADDR |	I2C_FUNC_PROTOCOL_MANGLING;
> +		  I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_10BIT_ADDR |
> +		  I2C_FUNC_PROTOCOL_MANGLING;
>  
>  	if (i2c_dev->hw->has_continue_xfer_support)
>  		ret |= I2C_FUNC_NOSTART;
> @@ -1727,6 +1750,29 @@ static int tegra_i2c_init_hardware(struct tegra_i2c_dev *i2c_dev)
>  	return ret;
>  }
>  
> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
> +	struct gpio_desc *alert_gpiod;
> +	struct i2c_client *ara;
> +
> +	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
> +	if (IS_ERR(alert_gpiod))
> +		return PTR_ERR(alert_gpiod);
> +
> +	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
> +	if (smbalert->alert_data.irq <= 0)
> +		return smbalert->alert_data.irq;
> +
> +	ara = i2c_new_smbus_alert_device(&i2c_dev->adapter, &smbalert->alert_data);
> +	if (IS_ERR(ara))
> +		return PTR_ERR(ara);
> +
> +	smbalert->ara = ara;
> +
> +	return 0;
> +}
> +
>  static int tegra_i2c_probe(struct platform_device *pdev)
>  {
>  	struct tegra_i2c_dev *i2c_dev;
> @@ -1821,6 +1867,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>  	if (err)
>  		goto release_rpm;
>  
> +	if (device_property_read_bool(i2c_dev->dev, "smbus-alert")) {

I'd move this device_property_read_bool() inside of
tegra_i2c_setup_smbus_alert(), for consistency with the rest of the code
in this driver.

Although, you shouldn't need it at all, use devm_gpiod_get_optional().

> +		err = tegra_i2c_setup_smbalert(i2c_dev);
> +		if (err)
> +			dev_warn(&pdev->dev, "smbus-alert setup failed: %d\n", err);

GPIO may probe-defer, must be dev_err_probe() here.
