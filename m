Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58044BD989
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 13:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D3A10E48F;
	Mon, 21 Feb 2022 12:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C16310E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X9BeRJcZSSZze7JRyDJH3PybPrLEA2YnLuJEnI8H+Ro=; b=FUtxbuhW1rqJy9qhbUuNnzjwac
 rnwAmWQoTeFq7x/FZCBG9IBUIOf6yTDLaVhvHTocrJRibQKfdal8Fiw9T+v4RVtEuug0rNi1rbRAv
 Dl8wHNERdybmv2HkyO+q7NcIpJJjI+HJqn1g+m4Yzw9unJ7f2SlRK0hW9JgYw1B/DKnHLsX0OYSEM
 KCBnPuGjZ2QW6IhMAwGIQ0XqzDL+BdsSgzpadj/CPaN6dsZf/hgAOL5iZSzym8/Z4CXcSgjI+akI1
 TFBukz+TD0093D2MSqqDgp0HJpSNMp7dxY7SBWH9hsYELN36Jj8lzAM94nvIzOoB2vsBDNVR23B/i
 RbLMduVg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nM7Sl-0001x6-KF; Mon, 21 Feb 2022 14:06:43 +0200
Message-ID: <ea65fcd6-9451-7f5b-f4a9-57b8575f09ff@kapsi.fi>
Date: Mon, 21 Feb 2022 14:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 9/9] drm/tegra: Support context isolation
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-10-mperttunen@nvidia.com>
 <2b4dd244-f918-4d26-2322-00a0bb226ccf@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <2b4dd244-f918-4d26-2322-00a0bb226ccf@gmail.com>
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

On 2/19/22 20:35, Dmitry Osipenko wrote:
> 18.02.2022 14:39, Mikko Perttunen пишет:
>> +	if (context->memory_context && context->client->ops->get_streamid_offset) {
>              ^^^
>> +		int offset = context->client->ops->get_streamid_offset(context->client);
>> +
>> +		if (offset >= 0) {
>> +			job->context = context->memory_context;
>> +			job->engine_streamid_offset = offset;
>> +			host1x_context_get(job->context);
>> +		}
> 
> You should bump refcount unconditionally or you'll get refcnt underflow
> on put, when offset < 0.

This refcount is intended to be dropped from 'release_job', where it's 
dropped if job->context is set, which it is from this path.

> 
>> +	}
>> +
>>   	/*
>>   	 * job_data is now part of job reference counting, so don't release
>>   	 * it from here.
>> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
>> index 9ab9179d2026..be33da54d12c 100644
>> --- a/drivers/gpu/drm/tegra/uapi.c
>> +++ b/drivers/gpu/drm/tegra/uapi.c
>> @@ -33,6 +33,9 @@ static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
>>   	struct tegra_drm_mapping *mapping;
>>   	unsigned long id;
>>   
>> +	if (context->memory_context)
>> +		host1x_context_put(context->memory_context);
> 
> The "if (context->memory_context &&
> context->client->ops->get_streamid_offset)" above doesn't match the "if
> (context->memory_context)". You'll get refcount underflow.

And this drop is for the refcount implicitly added when allocating the 
memory context through host1x_context_alloc; so these two places should 
be independent.

Please elaborate if I missed something.

Thanks,
Mikko
