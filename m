Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCA3A8B5D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 23:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF25D6E1EE;
	Tue, 15 Jun 2021 21:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F496E1EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 21:47:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a1so574255lfr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qy++EBDFaZvqgW1m5dlJjqlqqRntruqLJpN8Iy2Fv4E=;
 b=Nym15taujVAAmzyaYHFyzI8sHtY6x4g1W0VAbFhykXsx5of73+d8ZQhFmZIj9Wlt3y
 wlqYe7TjDxI22C8U8cYWfh9P4eg00mnYYpTOJedwAZOuS/8/Q/77HSofJXsiUSo6vkcP
 W9AENC77oVK2I0OP8J4/oudI8pPhP02BqStctJykLMuqznmgy60Tvyboglw6VwScW0/b
 oIYJ70Yi37DM8xin5aYFAAlOz+UbmIaqbnMYBt1+zG9hgd4SFH103oH09dPsUMmvqz1I
 /wISy8dd0xtTMx+o+HjwTFT6zFwRYl26G9Z7+WqcucG39ydd0cpfaU2aTQpNzFjd6DAA
 dtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qy++EBDFaZvqgW1m5dlJjqlqqRntruqLJpN8Iy2Fv4E=;
 b=L/Y+uek/yRHyiCIMlzCtyRLPkZfJU779hEIQGXQgSQGjlHVbEfPAXIJp/Q2bdYSTnt
 mPhf8r2sgjS7oO35q+Qj8zakMBdzjMWCDz5IUdXBKr54FX6yTzJwB28bUQDmeGlNpXsl
 P0BvXkeOTlE+CJssf/7tC4/Mw1MIpNh9o89Od+oLpAzGmIqNyCsoQ6osIpnArlwYV7+Y
 ACX72azDAWluorTO5YvbHu3MO5QSWXhuXrdMpgHOrzfI8Em39hv7LtRlxWTHU9C3Ozy5
 w1BEaoKwN916s4vKDFMHlJc0VqKzNvoKcm0e7flmDCT3KSNzKl6EvQwQWPTB+OZ+x9Od
 F/dg==
X-Gm-Message-State: AOAM533ia8a0889tDNQO+ylbEhrl3x2aJwJQVbJXGF7618tQH5QtNMEI
 c5ijJiu0Su14yq32xrdRozZyf4s25Iw=
X-Google-Smtp-Source: ABdhPJzgD1p44mcbnLOeVGJlHvz/io+GuULyRYbswGgzwLUw837NRJokSgSiDtP70pubdqGsWLS+cg==
X-Received: by 2002:ac2:549c:: with SMTP id t28mr1020384lfk.205.1623793655799; 
 Tue, 15 Jun 2021 14:47:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
 by smtp.googlemail.com with ESMTPSA id m22sm5447ljj.45.2021.06.15.14.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 14:47:35 -0700 (PDT)
Subject: Re: [PATCH v7 01/15] gpu: host1x: Add DMA fence implementation
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-2-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3867c5c2-7cf1-66f2-96fe-74ed106f590c@gmail.com>
Date: Wed, 16 Jun 2021 00:47:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-2-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

..
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> new file mode 100644
> index 000000000000..2b0bb97f053f
> --- /dev/null
> +++ b/drivers/gpu/host1x/fence.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Syncpoint dma_fence implementation
> + *
> + * Copyright (c) 2020, NVIDIA Corporation.
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/slab.h>
> +#include <linux/sync_file.h>

Stale headers

> +#include "fence.h"
> +#include "intr.h"
> +#include "syncpt.h"
> +
> +DEFINE_SPINLOCK(lock);

static

...
> +static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
> +	int err;
> +
> +	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
> +		return false;
> +
> +	dma_fence_get(f);
> +
> +	/*
> +	 * The dma_fence framework requires the fence driver to keep a
> +	 * reference to any fences for which 'enable_signaling' has been
> +	 * called (and that have not been signalled).
> +	 * 
> +	 * We provide a userspace API to create arbitrary syncpoint fences,
> +	 * so we cannot normally guarantee that all fences get signalled.
> +	 * As such, setup a timeout, so that long-lasting fences will get
> +	 * reaped eventually.
> +	 */
> +	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));

I don't see this API. Please always remove all dead code, make patches
minimal and functional.

...> +int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32
*threshold)
> +{
> +	struct host1x_syncpt_fence *f;
> +
> +	if (fence->ops != &host1x_syncpt_fence_ops)
> +		return -EINVAL;
> +
> +	f = container_of(fence, struct host1x_syncpt_fence, base);
> +
> +	*id = f->sp->id;
> +	*threshold = f->threshold;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(host1x_fence_extract);

dead code
