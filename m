Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6FA5046D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ED710E00A;
	Wed,  5 Mar 2025 16:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mk4MLJl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D366210E00A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 16:20:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 097F3A45AC8;
 Wed,  5 Mar 2025 16:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3DAC4CED1;
 Wed,  5 Mar 2025 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741191643;
 bh=HWjA/54qT1T38UrU9K3wIAlo9/R2j+5fLIVn8dgqyXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mk4MLJl+uuKL2Nffx6CigEQOKXqD4rQShmjlajABN45BiRggskUECk5yxrAhgRVpj
 NLku0mu9r4Ml+HRtk6VvXyPE0BTWlsTGYPa0FSX6WLr0elpiX7VVIFiCJImpKoE9Pr
 muGYG6bMan4XsqT/uRRFfWYINWUYKibRmUJ+jrQ2Wv9IoEzkZcPP/R0XzweUyCPUwW
 56wHr3athTy9mo3UFevOvmznabo1v+K94IYcUPClc9e3WRPykNyZ8hcKh/16tE4TNW
 59zSeG4YlSZ77m/4+KZ1jCk0zx/r9hSFpJrW8Rdd82qeCwvVXCTpFXulUDSJCVx7Ey
 2gtltonjeWO/w==
Date: Wed, 5 Mar 2025 16:20:31 +0000
From: Simon Horman <horms@kernel.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 03/18] bitops: Add parity16(), parity32(), and
 parity64() helpers
Message-ID: <20250305162031.GO3666230@kernel.org>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-4-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301142409.2513835-4-visitorckw@gmail.com>
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

On Sat, Mar 01, 2025 at 10:23:54PM +0800, Kuan-Wei Chiu wrote:
> Introduce parity16(), parity32(), and parity64() functions for
> computing parity on 16-bit, 32-bit, and 64-bit integers, respectively.
> These functions use __builtin_parity() or __builtin_parityll() when
> available, ensuring efficient computation. If the input is a
> compile-time constant, they expand using the _parity_const() macro to
> allow constant folding.
> 
> These additions provide parity computation helpers for larger integer
> types, ensuring consistency and performance across different
> bit-widths.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 63 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index 4c307d9c1545..41e9e7fb894b 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -276,6 +276,69 @@ static inline __attribute_const__ int parity8(u8 val)
>  	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
>  }
>  
> +#ifndef _parity16
> +static inline __attribute_const__ int _parity16(u16 val)
> +{
> +	return __builtin_parity(val);
> +}
> +#endif
> +
> +/**
> + * parity16 - get the parity of an u16 value
> + * @value: the value to be examined

nit: This really ought to be @val to match the function signature.
     Likewise for parity8, parity32, and parity64.

> + *
> + * Determine the parity of the u16 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity
> + */
> +static inline __attribute_const__ int parity16(u16 val)
> +{
> +	return __builtin_constant_p(val) ? _parity_const(val) : _parity16(val);
> +}

...
