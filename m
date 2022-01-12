Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320748C4CE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 14:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B64112A62;
	Wed, 12 Jan 2022 13:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C892112A62
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 13:28:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m1so8157068lfq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 05:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vcp8GJVgQ14fhi2aVH8vB0V+28GNfkn/ctIdXHUi7M8=;
 b=F40Rd3hsIIYaUVRLmmfYrV+xzxId9sTpd6h5G7fN1tRc/iqsMsi3NJv64DCz/BsH5i
 ZW4MpX44dRRCTZiprrBq3X9tL3++gHQk49JQv1JfiC2BEfBdcraDtyjAXDMKGaBmXR6s
 2IY6CosFIYfs4GHc19C1maADfb78rBVJateVvd9s3wYuA2nZr2E3rBPbQIBYiZCANXfD
 EsxS0vJeagiwLE+bjxwL91B9Q+Bf7DytXA4jhQdnBfPM2ql3OxDx5F0sycO1wtHqhRDO
 yN2N0WuQv2gJhal1wQ1bNYk6lik725npco42rwQi27caGxMZokuremMxzBDkVrDLRPQV
 xH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vcp8GJVgQ14fhi2aVH8vB0V+28GNfkn/ctIdXHUi7M8=;
 b=cC7PpSNPNeTwkpw47swSmE9FDM0Bb5JfQTcTwo5oYZHnbI4bUxOzpuIOkAZRnJdHb9
 Zvvlu8hjIL6tcHXDWP03a/UkEhALEWQcrPrxBrleaoy42yUKBYr7vqf0my1w0c972Cw+
 21dtLzrkNcAeZSn6vvYQRvHcrOa7ByVCnA1ug9AJfRG/exh1SkIqRy3Q484vXOZY/w8q
 Hb6R028FQWe4Tj8ZwzI81+wmu0HUE1zbsozuxH9jeVJwWIQxbCF1CdE/QfGE6V9j4wZd
 pZTRjfe+wi/Ktr0vStGbIFrqxApjzJ4zFLEmdtCzWaCrd2GQifVLNVtsj3lk5anH1UTY
 pDvA==
X-Gm-Message-State: AOAM531SDA+kGOswMZ74Ee6flDbbe/Nv/NgwV/dYO0cfPjWIBLcfB75v
 FWQBqTx/GgA8q3hDQelIyvs=
X-Google-Smtp-Source: ABdhPJxr7+7apLhYfkYT+bIgOKAO1RFno1+AtMjDh+VJMemDBHzR0qoBnu3dJQ6bnlPCcfbh2F10lA==
X-Received: by 2002:a2e:98c5:: with SMTP id s5mr1197535ljj.221.1641994122737; 
 Wed, 12 Jan 2022 05:28:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-62-108.dynamic.spd-mgts.ru.
 [94.29.62.108])
 by smtp.googlemail.com with ESMTPSA id k32sm1640497lfv.196.2022.01.12.05.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 05:28:42 -0800 (PST)
Subject: Re: [PATCH v2 0/3] clk: Implement a clock request API
To: Maxime Ripard <maxime@cerno.tech>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210914093515.260031-1-maxime@cerno.tech>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a5400ae3-f181-91fc-bc35-db989584c70b@gmail.com>
Date: Wed, 12 Jan 2022 16:28:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914093515.260031-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Russell King <linux@armlinux.org.uk>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

14.09.2021 12:35, Maxime Ripard пишет:
> Hi,
> 
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
> 
> This implements a mechanism to raise and lower clock rates based on consumer
> workloads, with an example of such an implementation for the RaspberryPi4 HDMI
> controller.
> 
> There's a couple of things worth discussing:
> 
>   - The name is in conflict with clk_request_rate, and even though it feels
>     like the right name to me, we should probably avoid any confusion
> 
>   - The code so far implements a policy of always going for the lowest rate
>     possible. While we don't have an use-case for something else, this should
>     maybe be made more flexible?

Hello Maxime,

On NVIDIA Tegra we use interconnect framework for converting of
workload-based memory bandwidth requirement to the memory clock rate
[1]. All Tegra SoCs have two display controllers and other memory
clients, ICC takes care of summing and updating memory bandwidth for us,
which in the end results in a freq change of the shared memory controller.

[1] https://git.kernel.org/linus/04d5d5df9

Not so long time ago me and Thierry Reding were looking at yours v1 and
back then Thierry suggested that the same ICC approach might work for
yours case. I'm now looking at the v2 and yours discussion with Stephen
Boyd, and it appears that ICC is indeed what you really need. Have you
considered to use ICC?
