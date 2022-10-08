Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FC15F8197
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 02:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290D310E158;
	Sat,  8 Oct 2022 00:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 504 seconds by postgrey-1.36 at gabe;
 Sat, 08 Oct 2022 00:36:41 UTC
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org
 [213.239.216.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A19F10E158
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Oct 2022 00:36:41 +0000 (UTC)
Received: from [192.168.20.2] (unknown [77.239.252.99])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 0E66C1400F8;
 Sat,  8 Oct 2022 00:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=donut; t=1665188895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0zdQeYgf/ToW2BBlsYl7mtXmi8A/E12FwtrlpMw834=;
 b=y2slcH71PCWLYvM1D/ge/XIMHeAX0ypPRFiTMOfcB4WB5grIYnNPFS0DgyhRXqZo67pjw7
 fU0h3VvKjyL7XBuurKYslV2QYJdbmrTeWwD3b6aes4f+FssClFNZYEiepynYlv4pUa9ax1
 TKSAzdSqcwSc3g4Y9Kg0IorXD8TEsYI=
Message-ID: <fd332d80-b237-08be-e6d1-903364bd5ceb@postmarketos.org>
Date: Sat, 8 Oct 2022 03:28:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] drivers: gpu: drm: add driver for samsung
 s6e3fc2x01 cmd mode panel
Content-Language: en-US
To: Nia Espera <a5b6@riseup.net>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221007111442.51481-1-a5b6@riseup.net>
 <20221007111442.51481-2-a5b6@riseup.net>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20221007111442.51481-2-a5b6@riseup.net>
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 07.10.2022 14:14, Nia Espera wrote:

> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };				\
> +		int ret;						\
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +

There is now a standard macro for this - mipi_dsi_dcs_write_seq() [1] , 
so you don't need to reinvent it.

> +static void samsung_s6e3fc2x01_reset(struct samsung_s6e3fc2x01 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(2000, 3000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}

There is a high chance that first gpiod_set_value() is not needed, only 
the last 2.

[1] https://elixir.bootlin.com/linux/latest/C/ident/mipi_dsi_dcs_write_seq

-- 
Regards
Alexey Minnekhanov
