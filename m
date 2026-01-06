Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B623BCF73EE
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A2310E27F;
	Tue,  6 Jan 2026 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t1O7Fdot";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AEA10E27F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:14:45 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47d3ffb0f44so4242825e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687284; x=1768292084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hsbhODKYiDBbbpkA3mcIKIQvyY/a/kZRZ0n4N3mPZUQ=;
 b=t1O7FdotTAOIAvicPi7ZYwtE1KJitd1bUbnEqEv+AFSS9QVikGtviGoq1n6N5eQp0F
 PZ+f9xpkLZHXA2XvkjGkY09zFwnQq71AJA6bGrx+t8o6i4STdqZkPUHuCMdOzMQNMfZB
 zWFE/pq8BQ9hqiWO5i+dKKTm9baEpPvEmTc5f5fK+yMFCZhjKqxGH1JrI6PLV/klORFr
 vAaayUc8e0cPBIZSz7CDmR1T+O3mbCC+l6ouw8NHpiiYgbDyKcAfPfP1U3CzzkkKAQ0e
 xAfONEymMwsU/eAhOvKa1CbZvhxmiWMzPBoBtLh7yYQOeATbUa6SDM72hcsB5Jc8z0zz
 7ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687284; x=1768292084;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hsbhODKYiDBbbpkA3mcIKIQvyY/a/kZRZ0n4N3mPZUQ=;
 b=pNrR8NCYVCqwXUVHesi0xs/VHxbpGpdy2fUm/yf4u0jQJ2GX1IYZh3+GOWkFA5rEOO
 CXCF6ieyxFk60xpkyhPdwqQQ9XYXMwOEZznSSBBJXa5ilzV+NPJBxSW3AE+DTkm1D6PH
 5M7DqjGwpbkGTlFREkKWVM96jVYC7Hj60bIF7iBt/UF9Tf/XedoAX99sdaY262eX2Hz/
 8wq66JqlD2FnBCD7m2QyzB5tJxTcBfH6t86U1qQ2Y+qGdIbAdP2/TtIVC+mXNv7pmGQU
 rOkrD6NVYjJe8ECEL4t0YgPg4ShiAaKhDEKqi8LqUEKtLCuB7toGCccYJ393cu+6VCjA
 zEJQ==
X-Gm-Message-State: AOJu0YyoCiDQ5NGn9KCv/IAYZlMuK5GzNBpjz1My3ty9z4tUai2eokL9
 BDRdGqU5XE+c2LxyS16hV74jbzzr6yDr8FLdUg8V/IlrJnr4uC1P1zIXsBrgQOYdymg=
X-Gm-Gg: AY/fxX6xY0grutH6cbIDFSc95jRtXU4PZxdyeAWo+XlDivZ5S5Xc7/PDP02uVfmtLba
 cXcaifb/5ZXS9FwCfv0N2CGTFyJBOmmn7d6TZhr8Y4CUo4dTytaNU71ssJs1ZjgMkmTVp6cVjre
 C0IzhZIJCgzLVgGlyuBkGgZ0eZDJA+FHtCUlWbnqNZzMhxhz286EjPvJB66ivk+SEipoKNniU0H
 hDrvZAKhiXtYdcs8Cb5s/TKxBDpk967WcszwixIWV1NQXXNDC2fW92pBDntCU3G//Z3s23ex4xt
 qLyDxuYiVqkUVLOV+vInDWW65NbaP2MrkFBrWxvpczZWJBZjifPk8s1dfwziBMr+Mq/xvI8sTya
 suWTYPkG2OOkLLjn2W8WlnlsVMw40K1L8IKTbruU5m7OYanjrENI0kceh0FLqE5dV7mfQNibDhw
 shu3RWvdJBbZpVQVn41cx3cjaLiiyf/hTul3A5h5hv1IBdq+CpYYOyIYRieNY9kl8=
X-Google-Smtp-Source: AGHT+IEo/cEdVt+kAuBnVAn1B1frcg3KiCPcCbKfsb2qonT7RUDDdNbIUJxduxhJOTIp7Q1I4t2ocA==
X-Received: by 2002:a05:600c:4f93:b0:477:569c:34e9 with SMTP id
 5b1f17b1804b1-47d7f098b9amr24885335e9.23.1767687283483; 
 Tue, 06 Jan 2026 00:14:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df8besm2858552f8f.26.2026.01.06.00.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:14:43 -0800 (PST)
Message-ID: <838b799c-5dfa-4efe-956a-ad5bf16826d6@linaro.org>
Date: Tue, 6 Jan 2026 09:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] drm/panel: mantix: Improve power on sequence timings
To: sebastian.krzyszkowiak@puri.sm, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
 <20260105-mantix-halo-fixes-v1-2-1ebc9b195a34@puri.sm>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260105-mantix-halo-fixes-v1-2-1ebc9b195a34@puri.sm>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/26 21:24, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> FP8006P datasheet mentions:
> 
>> It is necessary to wait 15msec after releasing RESX before sending
>> commands. Also Sleep Out command cannot be sent for 120 msec.
> 
> This hasn't been respected by the driver so far, which could interfere
> with the LCD init code sequence performed by the controller. In some cases
> this leads to VCOM voltage being set to a wrong value, causing "halo"
> effects, temporary burn-in around the edges of the screen and degraded
> image contrast.
> 
> T3 and T4 are counted from when VDDI is enabled. There's no need to add
> them when we've already waited more than that in T2 and T2d.
> 
> While FT8006P datasheet does not mention a delay between exiting sleep
> mode and turning the display on, code provided by the vendor uses 120ms
> there and it happens to be the same value as required in newer datasheets
> for newer controllers from the same family, so it seems appropriate to
> use it here as well.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index fafd80f3e952..bb5489e4d7a9 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -58,11 +58,9 @@ static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
> -	mipi_dsi_msleep(dsi_ctx, 20);
>   
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
>   	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
> -	mipi_dsi_msleep(dsi_ctx, 20);
>   }
>   
>   static int mantix_enable(struct drm_panel *panel)
> @@ -75,8 +73,11 @@ static int mantix_enable(struct drm_panel *panel)
>   	if (!dsi_ctx.accum_err)
>   		dev_dbg(ctx->dev, "Panel init sequence done\n");
>   
> +	/* remainder to 120ms (7.3.1 Note 4) */
> +	mipi_dsi_msleep(&dsi_ctx, 70);
> +
>   	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
>   
>   	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   	mipi_dsi_usleep_range(&dsi_ctx, 10000, 12000);
> @@ -147,10 +148,10 @@ static int mantix_prepare(struct drm_panel *panel)
>   		return ret;
>   	}
>   
> -	/* T3 + T4 + time for voltage to become stable: */
> -	usleep_range(6000, 7000);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(100, 200);
>   	gpiod_set_value_cansleep(ctx->tp_rstn_gpio, 0);
> +	usleep_range(100, 200);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   
>   	/* T6 */
>   	msleep(50);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
