Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87A55965C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 11:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840510E064;
	Fri, 24 Jun 2022 09:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C2C10E4AC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 09:22:44 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o4fWT-0001bX-2p; Fri, 24 Jun 2022 11:22:41 +0200
Message-ID: <1a694037c631c298c6952cdf4bf54fcc6d2f08e9.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] drm/etnaviv: add simple moving average (SMA)
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Fri, 24 Jun 2022 11:22:39 +0200
In-Reply-To: <20220621072050.76229-2-christian.gmeiner@gmail.com>
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
 <20220621072050.76229-2-christian.gmeiner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, "moderated list:DRM DRIVERS FOR VIVANTE
 GPU IP" <etnaviv@lists.freedesktop.org>, "open list:DRM DRIVERS FOR VIVANTE
 GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Dienstag, dem 21.06.2022 um 09:20 +0200 schrieb Christian Gmeiner:
> This adds a SMA algorithm inspired by Exponentially weighted moving
> average (EWMA) algorithm found in the kernel.
> 
Still not sure about this one. I _feel_ that a simple moving average
over a period of one second does not do a good job of reflecting the
real GPU load for a bursty workload, where EWMA might be better suited.
But then I also don't have a real informed opinion to offer on this.

Regards,
Lucas

> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sma.h | 53 +++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_sma.h
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sma.h b/drivers/gpu/drm/etnaviv/etnaviv_sma.h
> new file mode 100644
> index 000000000000..81564d5cbdc3
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sma.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Etnaviv Project
> + */
> +
> +#ifndef __ETNAVIV_SMA_H__
> +#define __ETNAVIV_SMA_H__
> +
> +#include <linux/bug.h>
> +#include <linux/compiler.h>
> +
> +/*
> + * Simple moving average (SMA)
> + *
> + * This implements a fixed-size SMA algorithm.
> + *
> + * The first argument to the macro is the name that will be used
> + * for the struct and helper functions.
> + *
> + * The second argument, the samples, expresses how many samples are
> + * used for the SMA algorithm.
> + */
> +
> +#define DECLARE_SMA(name, _samples) \
> +    struct sma_##name { \
> +        unsigned long pos; \
> +        unsigned long sum; \
> +        unsigned long samples[_samples]; \
> +    }; \
> +    static inline void sma_##name##_init(struct sma_##name *s) \
> +    { \
> +        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
> +        memset(s, 0, sizeof(struct sma_##name)); \
> +    } \
> +    static inline unsigned long sma_##name##_read(struct sma_##name *s) \
> +    { \
> +        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
> +        return s->sum / _samples; \
> +    } \
> +    static inline void sma_##name##_add(struct sma_##name *s, unsigned long val) \
> +    { \
> +        unsigned long pos = READ_ONCE(s->pos); \
> +        unsigned long sum = READ_ONCE(s->sum); \
> +        unsigned long sample = READ_ONCE(s->samples[pos]); \
> +      \
> +        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
> +      \
> +       WRITE_ONCE(s->sum, sum - sample + val); \
> +       WRITE_ONCE(s->samples[pos], val); \
> +       WRITE_ONCE(s->pos, pos + 1 == _samples ? 0 : pos + 1); \
> +    }
> +
> +#endif /* __ETNAVIV_SMA_H__ */


