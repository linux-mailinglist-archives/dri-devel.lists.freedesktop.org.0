Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3D2B77D6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7D06E420;
	Wed, 18 Nov 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473DD8994D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:24:41 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 19so4715475wmf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 12:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uFgfIH0qmM2n17BDKaKrcq4LBODq5k4QOoezQr/yK4Q=;
 b=vJmRBtG5Y4PKYnYzUVh08Dqvpcn/A+iQlTefDkvBSaY/otn7EDLv0dIIj3ExHDw5TK
 DJhn0fmMls/fo3Ji04nfqYpC6VAJIrSLNF1zevXLRp+Mqs0gIX3k1ay250TfmDCvRB05
 +OFGUIWqHJivI8tvxU/N+BXqMuYAmxnqziUr/zXER+4xntRWIfLL4Km6b98Y3TvV59GU
 eCTzi5TRJcLVXq0HVatVqEhWOZJHM4JeETvtJEpY6E3ejXSsyHLJMnRl9ptM2VzXUngX
 y3G3hvj79F6xHWtKigSGV3YGOmPS8F7zoviWPz5zt2J2EGLFG8jcg5kblMW5AUYS5yq7
 YUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uFgfIH0qmM2n17BDKaKrcq4LBODq5k4QOoezQr/yK4Q=;
 b=RyGI2EImrychqKjWPv5P4U2dQ0VIimnG6XxgO373OpiWWrIgDmDjfVCb0dXLdqTVgS
 6cSzNQ5iSmiyLsH1IwwYZiWPK+Fg0Wqkqai0/nPyJdBer/DdMDohklpvwj5MKrE8IALm
 SNrbH+AYG1+5YjbyBstybqnEb2Tl5Ag6eeE1q4IX80paIAzHgWyJ+zcSl0pvGaBPmG3i
 DW7itib74za088ovloc62OYoaklhwVDLAGmNIDZbc/GiITvYRrO+nIM7UhxosbRPLr6I
 UucUlxt+8601C511NUZDy5SR7QVXMgqrOK7TbeIA3dluutlXngd+ivPuLCzK8ossuiFn
 AckA==
X-Gm-Message-State: AOAM530TpAGENBlUgJ7ZtONHVV6k5lvZjna6Pw6ONiZ7g47MSX908j4F
 7tY7tGJTGUlujbmEln6fCJE7L6MiN+FmeA==
X-Google-Smtp-Source: ABdhPJwcGefASVcjHgpreQsZnk+jCTM8HC7WIOgyOmgrLL/gpuFF2XEZQHvIGAjfywFtjECtmDfZ7g==
X-Received: by 2002:a1c:2643:: with SMTP id m64mr903602wmm.28.1605644679580;
 Tue, 17 Nov 2020 12:24:39 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id m18sm27902466wru.37.2020.11.17.12.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 12:24:38 -0800 (PST)
Subject: Re: [PATCH v9 01/17] memory: tegra30: Support interconnect framework
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-2-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
Date: Tue, 17 Nov 2020 22:24:37 +0200
MIME-Version: 1.0
In-Reply-To: <20201115212922.4390-2-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you working on this!

On 15.11.20 23:29, Dmitry Osipenko wrote:
> Now Internal and External memory controllers are memory interconnection
> providers. This allows us to use interconnect API for tuning of memory
> configuration. EMC driver now supports OPPs and DVFS. MC driver now
> supports tuning of memory arbitration latency, which needs to be done
> for ISO memory clients, like a Display client for example.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>   drivers/memory/tegra/Kconfig       |   1 +
>   drivers/memory/tegra/tegra30-emc.c | 349 +++++++++++++++++++++++++++--
>   drivers/memory/tegra/tegra30.c     | 173 +++++++++++++-
>   3 files changed, 501 insertions(+), 22 deletions(-)
> 
[..]> diff --git a/drivers/memory/tegra/tegra30.c 
b/drivers/memory/tegra/tegra30.c
> index d0314f29608d..ea849003014b 100644
> --- a/drivers/memory/tegra/tegra30.c
> +++ b/drivers/memory/tegra/tegra30.c
[..]
> +
> +static int tegra30_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_mc *mc = icc_provider_to_tegra_mc(src->provider);
> +	const struct tegra_mc_client *client = &mc->soc->clients[src->id];
> +	u64 peak_bandwidth = icc_units_to_bps(src->peak_bw);
> +
> +	/*
> +	 * Skip pre-initialization that is done by icc_node_add(), which sets
> +	 * bandwidth to maximum for all clients before drivers are loaded.
> +	 *
> +	 * This doesn't make sense for us because we don't have drivers for all
> +	 * clients and it's okay to keep configuration left from bootloader
> +	 * during boot, at least for today.
> +	 */
> +	if (src == dst)
> +		return 0;

Nit: The "proper" way to express this should be to implement the
.get_bw() callback to return zero as initial average/peak bandwidth.
I'm wondering if this will work here?

The rest looks good to me!

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
