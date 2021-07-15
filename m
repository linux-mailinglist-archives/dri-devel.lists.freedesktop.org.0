Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E14E3CA16D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 17:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4496E832;
	Thu, 15 Jul 2021 15:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5356E832
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:26:25 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y42so10585092lfa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pwgJCon9nCgOfdweHqPCtSYWnR/Tmiv3AEfGAwUX/Ig=;
 b=B/FYL1vrHNRhRSchZNW254RE0VbNaFwkL9dpxD3oO73ZK9097d/OivNvrj94PdEseF
 UQUcVN6YKvSDmktIqfeBtC+DXITe/7E5EwwqNlhHFmZ7ta32Y5hG0KQ8q49vsTMyRBs6
 zXZeQEyZIOm2oY9TjcH9ZyRB+xiIrc0rJyKFh9EyrnYkfXTMzM0l/Exg8QKVHX4Uxt7c
 th3o+wfDy5PaY8jWM8iWmTNSgSDaslScphQusFPZmI8TU6l565BRFLxQX0l5xJsx2lSq
 EUsgGPbGas4InfIV+ThTh2pE/Xg8/ejBtoutfhJIw6+LcwGpBIWIWv1Hc4ccoQSbXc0Y
 Xk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pwgJCon9nCgOfdweHqPCtSYWnR/Tmiv3AEfGAwUX/Ig=;
 b=H7km0Bxfriu84CTMPZffIXbNbmCTR7PR8vHGGp1I+YW1XZSaVadr9MgaQZ1jEyVn6y
 0e4fsgka9v7EtgP1hrzB5l791HSbFw6Jo3sFJRVIL9QcLjH7CB6JzYgscS62jDW5kZIt
 oJeQlCHR59HoeQ5n1scRxhnmpjr7or6APQpvOzGThvhG8fvrJHdOS37kmcWIGVGX1hkD
 B5BkDxXaKa8KTPgcHrnoDh00xBES1CwmjXVkNCZqqlv8y3vltzwdsdDfJBup7Ys7GW6o
 AkLP4wfArp2BhUo2WxkjC+TSY+alj9X59LM3CezuLPbPSbJmWLfInuhFQzkPK1z/3FNe
 JIkQ==
X-Gm-Message-State: AOAM531pKfGqEhO41rgeMfwYNqib++XwRGR2Ogy5Y/Sgbt5FqqZ6nRXy
 CjzzhD09Qsz+U0NRVk862EE=
X-Google-Smtp-Source: ABdhPJwYzpMZuuHfEVQVi0dDR1Lf3mUn0GL9YiaenC6oCVG07jEOp5GTB0SYlVfputOkkkjLSMdijQ==
X-Received: by 2002:a19:5f43:: with SMTP id a3mr3868266lfj.504.1626362783717; 
 Thu, 15 Jul 2021 08:26:23 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id r7sm436354lfr.242.2021.07.15.08.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 08:26:22 -0700 (PDT)
Subject: Re: [PATCH v8 01/14] gpu: host1x: Add DMA fence implementation
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <20210709193146.2859516-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f7d06cec-c930-ba7c-2393-975e2e69e5fd@gmail.com>
Date: Thu, 15 Jul 2021 18:26:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709193146.2859516-2-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

09.07.2021 22:31, Thierry Reding пишет:
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> new file mode 100644
> index 000000000000..06c6b86237bd
> --- /dev/null
> +++ b/drivers/gpu/host1x/fence.c
> @@ -0,0 +1,209 @@
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
> +
> +#include "fence.h"
> +#include "intr.h"
> +#include "syncpt.h"
> +
> +DEFINE_SPINLOCK(lock);

*static*
