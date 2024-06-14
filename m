Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E2B908FDB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EB310EDCF;
	Fri, 14 Jun 2024 16:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TMNe8lCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F99010EDD3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:16:42 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52c84a21b8cso2216097e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718381801; x=1718986601; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DxfXutc6OWPI+LqABeJ5/om1fvUK/kk9/lRBZity8Nk=;
 b=TMNe8lCr6KEWqpvb7/Sd1olKqG7fFXajI3n32JsLjw05LkBuxjyRg6iVifWdJYPBWS
 m33V9MydPMDumwXHNGaXutMb2MZ75a0TUr7l8LEsuAnzsi4Km6sKbdnNs8lJ+GNNZxtv
 Zd/LVVjO5p32wZHN2dq8wotG3thgOiPJJlIoabpjiMovqWL38LvWxp9qwqeMJvaIPEkS
 7L3vqBWwwBNrUZYPFvNg+EVtwUN2QaT3EO1Jmc5stdBDxcB7BkJITSKYQLRoE3iLyKJ0
 n57Ca+qshDoYDmnR6te1sy/jJFyouHuEBKsZ4CUqsm0kCc8TzH54ZF3xh3g5oXgPYHyG
 FSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718381801; x=1718986601;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DxfXutc6OWPI+LqABeJ5/om1fvUK/kk9/lRBZity8Nk=;
 b=dhwXaOtDeb2xm1AIhISllPwTqdA0/xYSHm+1vL1XHKhsnG8K5rvuCn+4ubrzfb6NMf
 Y6TpYB/zhhqTOJXE/0UqvD+lioYR1Bp8t3H5mmfW6D3SI2oJpr98XUR7X9F/jWKxmwKf
 xUZhYQJGzek46UZjQXkrxhmj+MVGBi3dG8w1jbYBUmbYdWqOiFIdORRlwbYVh++DbUNd
 XJ1Io85oW2Lh7O7kDx9dGEXnhz8mmn8d5+nUc0Oq3csMYZX/JLpP98n/YMTZmn/1wHpO
 PFIAuGbfKV7ILLaCXa2LXhVffHZTv9Fc0eAW3/i2nSrKzpi3IoNNN/B0KpkKcu+xqKFC
 HM4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhwcPIJB5XO9RDh0dI8PhFGOdwGw9BJK+JQAq+b4zRQoSj+M5xEHTswVafrfVjr3LQfiRLQEgWSdKE2xIVUEuUeqnO4A4aRYW4mJssqq2i
X-Gm-Message-State: AOJu0YyUxoOCPZ7xmJIgmyl+wfqxjJE+tdGZzzJaD1s/AOpWsvSJcfb0
 bpG8eqvKIDlFtlxtnodZxmJPFCNYfzhboYcfqt1TaHAcRcdtDap/Jo3PP2v5u94=
X-Google-Smtp-Source: AGHT+IFWh49tFkOdBloSDX4IJrQng477dOMe80RX0kExz3XThklhLq1u8q6ZcYalsgMEcQ+B5wozZg==
X-Received: by 2002:ac2:5b10:0:b0:52c:8355:422a with SMTP id
 2adb3069b0e04-52ca0227784mr2017409e87.9.1718381800964; 
 Fri, 14 Jun 2024 09:16:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282dd55sm552715e87.65.2024.06.14.09.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:16:40 -0700 (PDT)
Date: Fri, 14 Jun 2024 19:16:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] drm/panel: jd9365da: Modify the method of sending
 commands
Message-ID: <5nsbxkuoka7gnnvbvmvjxqpec47glfusz4hrvk4qqdofbgcppy@3u32y2xsh33m>
References: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240614145510.22965-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614145510.22965-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Fri, Jun 14, 2024 at 10:55:07PM GMT, Zhaoxiong Lv wrote:
> Currently, the init_code of the jd9365da driver is placed
> in the enable() function and sent, but this seems to take
> a long time. It takes 17ms to send each instruction (an init
> code consists of about 200 instructions), so it takes
> about 3.5s to send the init_code. So we moved the sending
> of the inti_code to the prepare() function, and each
> instruction seemed to take only 25μs.

Additional details about the DSI host would be appreciated. I guess that
the difference in time used to send the command is due to the DSI host
interleaving commands between video frames, but it would be nice to have
that spelled in the commit message.

> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
>  .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 781 +++++++++---------
>  1 file changed, 393 insertions(+), 388 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 4879835fe101..b39f01d7002e 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -19,17 +19,13 @@
>  #include <linux/of.h>
>  #include <linux/regulator/consumer.h>
>  
> -#define JD9365DA_INIT_CMD_LEN		2
> -
> -struct jadard_init_cmd {
> -	u8 data[JD9365DA_INIT_CMD_LEN];
> -};
> +struct jadard;
>  
>  struct jadard_panel_desc {
>  	const struct drm_display_mode mode;
>  	unsigned int lanes;
>  	enum mipi_dsi_pixel_format format;
> -	const struct jadard_init_cmd *init_cmds;
> +	int (*init)(struct jadard *jadard);
>  	u32 num_init_cmds;
>  };
>  
> @@ -52,21 +48,9 @@ static int jadard_enable(struct drm_panel *panel)
>  {
>  	struct device *dev = panel->dev;
>  	struct jadard *jadard = panel_to_jadard(panel);
> -	const struct jadard_panel_desc *desc = jadard->desc;
>  	struct mipi_dsi_device *dsi = jadard->dsi;
> -	unsigned int i;
>  	int err;
>  
> -	msleep(10);
> -
> -	for (i = 0; i < desc->num_init_cmds; i++) {
> -		const struct jadard_init_cmd *cmd = &desc->init_cmds[i];
> -
> -		err = mipi_dsi_dcs_write_buffer(dsi, cmd->data, JD9365DA_INIT_CMD_LEN);
> -		if (err < 0)
> -			return err;
> -	}
> -
>  	msleep(120);
>  
>  	err = mipi_dsi_dcs_exit_sleep_mode(dsi);
> @@ -117,9 +101,21 @@ static int jadard_prepare(struct drm_panel *panel)
>  	msleep(10);
>  
>  	gpiod_set_value(jadard->reset, 1);
> -	msleep(120);
> +	msleep(130);
> +
> +	ret = jadard->desc->init(jadard);
> +	if (ret < 0)
> +		goto poweroff;

Plese don't mix refactoring with functional changes. Please split this
into two patches, one for using _multi and another one for moving init
to prepare()

>  
>  	return 0;
> +
> +poweroff:
> +	gpiod_set_value(jadard->reset, 0);
> +		/* T6: 2ms */
> +	usleep_range(1000, 2000);
> +	regulator_disable(jadard->vccio);
> +
> +	return ret;
>  }
>  


-- 
With best wishes
Dmitry
