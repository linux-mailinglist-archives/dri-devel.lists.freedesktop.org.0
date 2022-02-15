Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3904B677A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 10:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF61B10E426;
	Tue, 15 Feb 2022 09:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2FC10E434
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8D3931F43B3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644917034;
 bh=hcFgN+kiCWyV67UTRX3dStpLJO5sEXbV1LYXA+9D5z8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S7jfbAdb/5nprt+0wj2VMT0eCmVD1a3pkyqXisfTHz2JX2wH/4aNjS9IJDrcXQxUk
 kn3fd++81y+RbTiEiKwetSJ9OsX0Kk2526HQL+baoenLf8wi+W2BuIzcSmUOCtPma/
 zW4YKSeDZRrgtgFKk2TD9LFg0j6GCYuNwtQoE5i+q1zjFr8CRwa/jPdjVHqYMv9ilS
 z3q7rQnlaxfPrc1KFDjMi26kMNO9guQF9SEXSeFtIHrA3hinlZrIYQR14ur0dIxnS9
 YdSEjLTqp6kdASK9c0K0SMK3a1SxQC9xx/gwt+zktVba1joLR3+yzs1U+w7mZ8wFgM
 h7dhyw/b1JrhA==
Message-ID: <5119045c-3c30-3625-d7ba-3100eda3ccbd@collabora.com>
Date: Tue, 15 Feb 2022 10:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/panfrost: Dynamically allocate pm_domains
Content-Language: en-US
To: Alyssa Rosenzweig <alyssa@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
 <YgrBwwT37DpOOkt5@maud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YgrBwwT37DpOOkt5@maud>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/02/22 21:55, Alyssa Rosenzweig ha scritto:
> mali_kbase hardcodes MAX_PM_DOMAINS (=5 for the mt8192 kernel). I have
> no real objection to it but Angelo did. Maybe should've marked this RFC.

Clarifying, the suggested patch was not a big objection, but I think that it
would be a nice preventive cleanup that is useful for the power tree that has
to be managed on MT8192 and possibly on other SoCs.

I would expect to see a variable amount of PM domains to take care of as time
goes by (with new SoCs, not necessarily only MediaTek) due to granular power
optimizations but, at the same time, dynamically allocating the pm_domain_devs
and links structures makes this driver to also be nice with older platforms,
where memory is a little more constrained, allowing Linux to have a lighter
footprint, even if not by much.

Logic for this footprint saving is "a little here, a little there, becomes a
bit more considerable" (of course, being aware of both upsides and downsides
in dynamically allocating things, and avoiding to write gigabytes of text to
explain common knowledge).

P.S.: Thank you all!

Regards,
Angelo

> 
> On Mon, Feb 14, 2022 at 03:31:32PM -0500, Alyssa Rosenzweig wrote:
>> MT8192 requires 5 power domains. Rather than bump MAX_PM_DOMAINS and
>> waste memory on every supported Panfrost chip, instead dynamically
>> allocate pm_domain_devs and pm_domain_links. This adds some flexibility;
>> it seems inevitable a new MediaTek device will require more than 5
>> domains.
>>
>> On non-MediaTek devices, this saves a small amount of memory.
>>
>> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.c | 14 ++++++++++----
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  5 ++---
>>   2 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>> index ee612303f076..661cdec320af 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>> @@ -127,7 +127,10 @@ static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
>>   {
>>   	int i;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
>> +	if (!pfdev->pm_domain_devs || !pfdev->pm_domain_links)
>> +		return;
>> +
>> +	for (i = 0; i < pfdev->comp->num_pm_domains; i++) {
>>   		if (!pfdev->pm_domain_devs[i])
>>   			break;
>>   
>> @@ -161,9 +164,12 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
>> -			"Too many supplies in compatible structure.\n"))
>> -		return -EINVAL;
>> +	pfdev->pm_domain_devs = devm_kcalloc(pfdev->dev, num_domains,
>> +					     sizeof(*pfdev->pm_domain_devs),
>> +					     GFP_KERNEL);
>> +	pfdev->pm_domain_links = devm_kcalloc(pfdev->dev, num_domains,
>> +					      sizeof(*pfdev->pm_domain_links),
>> +					      GFP_KERNEL);
>>   
>>   	for (i = 0; i < num_domains; i++) {
>>   		pfdev->pm_domain_devs[i] =
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index 8b25278f34c8..98e3039696f9 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -22,7 +22,6 @@ struct panfrost_job;
>>   struct panfrost_perfcnt;
>>   
>>   #define NUM_JOB_SLOTS 3
>> -#define MAX_PM_DOMAINS 3
>>   
>>   struct panfrost_features {
>>   	u16 id;
>> @@ -87,8 +86,8 @@ struct panfrost_device {
>>   	struct regulator_bulk_data *regulators;
>>   	struct reset_control *rstc;
>>   	/* pm_domains for devices with more than one. */
>> -	struct device *pm_domain_devs[MAX_PM_DOMAINS];
>> -	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
>> +	struct device **pm_domain_devs;
>> +	struct device_link **pm_domain_links;
>>   	bool coherent;
>>   
>>   	struct panfrost_features features;
>> -- 
>> 2.34.1
>>
