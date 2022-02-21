Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5B14BD979
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 12:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1744A10E55C;
	Mon, 21 Feb 2022 11:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396FA10E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k++dA0QZ/l0Udf5bpYqTGcUCwXaoUM28Erkwayg30Jc=; b=DjFpUsSjsqvQ/gdEZdw8Rwa5Qo
 9bXoOF1KTGBZPvp/rgZaf8yjzzKLP/CnTfXLXHxNahmNv+N3orhjP30d45zXNSyVNLdhnYAfKwb4Z
 RdZDWWyx5V+p2DZX1qChy8TvuoqPeByQau/37fzk1n2ruNUWTV+klAJ0okIv3AqAd/re6huAOP/Cs
 Z3al4naD7nxzxQhO5ec1AdRE8qA0HgbWtD/xEGMtJdjmIAer25KKsinCjvChQ/QbnHc9hgoI0UObV
 MtWELb4j25Syy6af3x6augoBrkrIZbIX1nPAE9ui+L3bLUFM7FwBo4yvzXLF5HNwa8VteE/Kid7IW
 ikdpDZ2A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nM70t-0002ZP-Mh; Mon, 21 Feb 2022 13:37:55 +0200
Message-ID: <8a1387e5-b68f-db90-9ab5-0b8606ca8841@kapsi.fi>
Date: Mon, 21 Feb 2022 13:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 3/9] gpu: host1x: Add context device management code
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-4-mperttunen@nvidia.com>
 <2605a614-0a2c-85ac-576a-048f38f9d366@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <2605a614-0a2c-85ac-576a-048f38f9d366@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/19/22 19:52, Dmitry Osipenko wrote:
> 18.02.2022 14:39, Mikko Perttunen пишет:
>> +	for (index = 0; index < cdl->len; index++) {
>> +		struct iommu_fwspec *fwspec;
>> +
>> +		ctx = &cdl->devs[index];
>> +
>> +		ctx->host = host1x;
>> +
>> +		device_initialize(&ctx->dev);
>> +
>> +		ctx->dev.dma_mask = &context_device_dma_mask;
>> +		ctx->dev.coherent_dma_mask = context_device_dma_mask;
>> +		dev_set_name(&ctx->dev, "host1x-ctx.%d", index);
>> +		ctx->dev.bus = &host1x_context_device_bus_type;
> 
> host1x_context_device_bus_type will be an undefined symbol if
> CONFIG_TEGRA_HOST1X_CONTEXT_BUS=n? Please compile and test all combinations.

But this file is only built if CONFIG_HOST1X, which selects 
CONFIG_TEGRA_HOST1X_CONTEXT_BUS?

Mikko
