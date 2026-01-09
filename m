Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA87D0BAA1
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 18:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709410E90E;
	Fri,  9 Jan 2026 17:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kI42mGF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE1F10E90E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 17:32:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 37EA8600B0;
 Fri,  9 Jan 2026 17:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB23AC4CEF1;
 Fri,  9 Jan 2026 17:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767979926;
 bh=NUMdQS00w2uiyTP712LRVWwLS5uwiQjstrFqaeib/HU=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=kI42mGF7mAGgB1DUaM+HCHA+uJSf0Kwy4CJNgL+Ylroq6HKbf82uGgUy2ORKePL25
 uz+erEJF/9Fm+bfY2dy3RwC8pD2jcAX1ynaDvuxqlUUdbQqOGLXubcaCx5Nr2f9lIx
 ux8TgPEY45Jx7xw4u57Xc2R/uprcqt1Z58+aYh6cuPr0/q7NHjo9U6Ta2QLiuB1pwH
 n3qCaDl+5CiU/K9CWP8Q6hK8/KkufrxMNzfDIqA9sdl1vONCN0jEV6jJnEhFfF+2g2
 SXukyakydNz4q8Lhul1Wn8JA9ki60XdT5DEs9dNXxIyYpgfkyvMGBxkA4WcvkXeZCl
 OvlGbpEINqBLw==
Message-ID: <685f4a41-b90c-4f8f-b4be-531eae1905ce@kernel.org>
Date: Fri, 9 Jan 2026 11:32:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/dp: Add byte-by-byte fallback for broken USB-C
 adapters
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
References: <20251204024647.1462866-1-acelan.kao@canonical.com>
Content-Language: en-US
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251204024647.1462866-1-acelan.kao@canonical.com>
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

On 12/3/25 8:46 PM, Chia-Lin Kao (AceLan) wrote:
> Some USB-C hubs and adapters have buggy firmware where multi-byte AUX
> reads consistently timeout, while single-byte reads from the same address
> work correctly.
> 
> Known affected devices that exhibit this issue:
> - Lenovo USB-C to VGA adapter (VIA VL817 chipset)
>    idVendor=17ef, idProduct=7217
> - Dell DA310 USB-C mobile adapter hub
>    idVendor=413c, idProduct=c010
> 
> Analysis of the failure pattern shows:
> - Single-byte probes to 0xf0000 (LTTPR) succeed
> - Single-byte probes to 0x00102 (TRAINING_AUX_RD_INTERVAL) succeed
> - Multi-byte reads from 0x00000 (DPCD capabilities) timeout with -ETIMEDOUT
> - Retrying does not help - the failure is consistent across all attempts
> 
> The issue appears to be a firmware bug in the AUX transaction handling
> that specifically affects multi-byte reads.
> 
> Add a fallback mechanism in drm_dp_dpcd_read_data() that attempts
> byte-by-byte reading when the normal multi-byte read fails. This
> workaround only activates for adapters that fail the standard read path,
> ensuring no impact on correctly functioning hardware.
> 
> Tested with:
> - Lenovo USB-C to VGA adapter (VIA VL817) - now works with fallback
> - Dell DA310 USB-C hub - now works with fallback
> - Dell/Analogix Slimport adapter - continues to work with normal path
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

As this fixes reads for some existing hardware on the market and is just 
in fallback path I feel this is low risk.  I've applied this to 
drm-misc-fixes.

a8f49a0043011 (HEAD -> drm-misc-fixes) drm/dp: Add byte-by-byte fallback 
for broken USB-C adapters

> ---
> v2. 1. Move the workaround from intel_dp_read_dprx_caps() to
>         drm_dp_dpcd_read_data(), so that it applies to all DPCD reads across
>         all DRM drivers benefit from this fix, not just i915.
>      2. Move the definition of drm_dp_dpcd_readb() before
>         drm_dp_dpcd_read_data()
> ---
>   include/drm/display/drm_dp_helper.h | 57 +++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index df2f24b950e4..14d2859f0bda 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -551,6 +551,22 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>   ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
>   			  void *buffer, size_t size);
>   
> +/**
> + * drm_dp_dpcd_readb() - read a single byte from the DPCD
> + * @aux: DisplayPort AUX channel
> + * @offset: address of the register to read
> + * @valuep: location where the value of the register will be stored
> + *
> + * Returns the number of bytes transferred (1) on success, or a negative
> + * error code on failure. In most of the cases you should be using
> + * drm_dp_dpcd_read_byte() instead.
> + */
> +static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
> +					unsigned int offset, u8 *valuep)
> +{
> +	return drm_dp_dpcd_read(aux, offset, valuep, 1);
> +}
> +
>   /**
>    * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
>    * @aux: DisplayPort AUX channel (SST or MST)
> @@ -570,12 +586,29 @@ static inline int drm_dp_dpcd_read_data(struct drm_dp_aux *aux,
>   					void *buffer, size_t size)
>   {
>   	int ret;
> +	size_t i;
> +	u8 *buf = buffer;
>   
>   	ret = drm_dp_dpcd_read(aux, offset, buffer, size);
> -	if (ret < 0)
> -		return ret;
> -	if (ret < size)
> -		return -EPROTO;
> +	if (ret >= 0) {
> +		if (ret < size)
> +			return -EPROTO;
> +		return 0;
> +	}
> +
> +	/*
> +	 * Workaround for USB-C hubs/adapters with buggy firmware that fail
> +	 * multi-byte AUX reads but work with single-byte reads.
> +	 * Known affected devices:
> +	 * - Lenovo USB-C to VGA adapter (VIA VL817, idVendor=17ef, idProduct=7217)
> +	 * - Dell DA310 USB-C hub (idVendor=413c, idProduct=c010)
> +	 * Attempt byte-by-byte reading as a fallback.
> +	 */
> +	for (i = 0; i < size; i++) {
> +		ret = drm_dp_dpcd_readb(aux, offset + i, &buf[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	return 0;
>   }
> @@ -609,22 +642,6 @@ static inline int drm_dp_dpcd_write_data(struct drm_dp_aux *aux,
>   	return 0;
>   }
>   
> -/**
> - * drm_dp_dpcd_readb() - read a single byte from the DPCD
> - * @aux: DisplayPort AUX channel
> - * @offset: address of the register to read
> - * @valuep: location where the value of the register will be stored
> - *
> - * Returns the number of bytes transferred (1) on success, or a negative
> - * error code on failure. In most of the cases you should be using
> - * drm_dp_dpcd_read_byte() instead.
> - */
> -static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
> -					unsigned int offset, u8 *valuep)
> -{
> -	return drm_dp_dpcd_read(aux, offset, valuep, 1);
> -}
> -
>   /**
>    * drm_dp_dpcd_writeb() - write a single byte to the DPCD
>    * @aux: DisplayPort AUX channel

