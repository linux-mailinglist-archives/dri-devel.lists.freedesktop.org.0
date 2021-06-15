Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1203A8BB0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1778D89AAD;
	Tue, 15 Jun 2021 22:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAAF89AAD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:19:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp38so845950lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kx2V6/kii0fkN6ERxcXygqp8Bpu9empcp2wroAAgz0s=;
 b=fQdVlFl6JUzBWWoK1G2plSLcQIE5I9bTMe605J3/Y3fNiY1k96PaFJ+1X81tIHfNUY
 82jTvlBVChkOVCUV9MByRcNXlMobaTW3PUbFDQBBzpcTx5+iu2s3mit/Zn0t+sXC5SVM
 2b3swh9kirOaIYwi1ob0oyT+4hnIJGX30yFwPpx+sxDAChnFcJE2FbtjzlFEj7DCo8r0
 9F1whDmk3gUk0O2wqTtQ3UF9X1Uj9fECC6N63ityVtR/M9AITMzfAYTA1y2oWZYgEIs7
 iuvLdtamdQ1wkxkhd80T0/xqocVD6AQ7gkceSNUOP6fSpT6GWLqfvVQFhDlFHNd5TrfG
 4YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kx2V6/kii0fkN6ERxcXygqp8Bpu9empcp2wroAAgz0s=;
 b=KIC+DpyiSMurJ7/hgj6tCk2xc+dNrSIcN682uSDvOqfCP7n0daMGBiPrFl7Ym65edE
 MUE8gqrfU+RxIh87Vd0F4irbccluE6pNBuIO7Fw9ttqW1oKW3cgyo/Rs8vocR8+Mfqmq
 HTJ3CbPn/tnU4b0MNrLIRKWMmyZ7VykRpYbDcPqVAuTsWfui80D03ClcTKB65i6dYLF+
 b8Iti/psOz5LvfDDNe+foo22ns4NM90mdRQ9iU9NvqqsLutsWgwV1EM2zL2Z31IALUuF
 uJNNLSPujPy3SV60wQotu3b6wY6gjhwV8uDIoJAmfaksFahx9sTOUCdEItmP84U2K3fA
 CYzg==
X-Gm-Message-State: AOAM531XfjxhQWggjmtlErCgiJuwKjAe05LnXkM0DsOiOYBaZbrEMBlJ
 xLPVACfqLX7cQBC8e3wdbqs=
X-Google-Smtp-Source: ABdhPJwVA6yfmt55TjhnUlf1uqobLgrF8pecoI/UQREatg97iah54jqHs3HCHhSdBFcrLXeHGJTifg==
X-Received: by 2002:ac2:5edd:: with SMTP id d29mr1144897lfq.57.1623795592922; 
 Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
 by smtp.googlemail.com with ESMTPSA id x22sm35110lfu.171.2021.06.15.15.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b1f0d64c-1ad3-186d-85df-0e2fa473bfd3@gmail.com>
Date: Wed, 16 Jun 2021 01:19:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

10.06.2021 14:04, Mikko Perttunen пишет:
> +++ b/drivers/gpu/drm/tegra/gather_bo.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#include "gather_bo.h"
> +
...
> +const struct host1x_bo_ops gather_bo_ops = {
> +	.get = gather_bo_get,
> +	.put = gather_bo_put,
> +	.pin = gather_bo_pin,
> +	.unpin = gather_bo_unpin,
> +	.mmap = gather_bo_mmap,
> +	.munmap = gather_bo_munmap,
> +};

I think it's a wrong to model host1x bo as a part of DRM driver. It is
akin to the ill-defined model of DRM GEMS represented by host1x_bo that
current mainline driver uses.

Host1x BO should belong to Host1x driver. DRM BO should belong to DRM
driver. Mixing them together makes no sense, it is very unnatural and
confusing. This should be a part of the driver reorganization discussion.
