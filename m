Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FE598ECF4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 12:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326AA10E0E2;
	Thu,  3 Oct 2024 10:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73FEA10E0E2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 10:30:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 834C7339;
 Thu,  3 Oct 2024 03:30:30 -0700 (PDT)
Received: from [10.1.39.32] (e122027.cambridge.arm.com [10.1.39.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3225F3F64C;
 Thu,  3 Oct 2024 03:29:58 -0700 (PDT)
Message-ID: <4c8cf37c-1576-4633-9f75-01e26e95f6c2@arm.com>
Date: Thu, 3 Oct 2024 11:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Add missing OPP table refcnt decremental
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241003002603.3177741-1-adrian.larumbe@collabora.com>
 <20241003091740.4e610f21@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241003091740.4e610f21@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/10/2024 08:17, Boris Brezillon wrote:
> On Thu,  3 Oct 2024 01:25:37 +0100
> Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
> 
>> Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
>> retrieves the OPP for the maximum device clock frequency, but forgets to
>> keep the reference count balanced by putting the returned OPP object. This
>> eventually leads to an OPP core warning when removing the device.
>>
>> Fix it by putting OPP objects as many times as they're retrieved.
>> Also remove an unnecessary whitespace.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> 
> Reviewed-by: 

I assume that tag shouldn't be there ;)

>> ---
>>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> index 2d30da38c2c3..c7d3f980f1e5 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> @@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>>  		return PTR_ERR(opp);
>>  	dev_pm_opp_put(opp);
>>  
>> -	err =  dev_pm_opp_set_rate(dev, *freq);
>> +	err = dev_pm_opp_set_rate(dev, *freq);
>>  	if (!err)
>>  		ptdev->pfdevfreq.current_frequency = *freq;
>>  
>> @@ -177,6 +177,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>  	 */
>>  	pfdevfreq->current_frequency = cur_freq;
>>  
>> +	dev_pm_opp_put(opp);
>> +
> 
> Shouldn't this be moved after the dev_pm_opp_set_opp() that's
> following?

I agree.

I'm not sure what the devfreq maintainers would think, but there's now a
few drivers that basically want find_available_max_freq() exported - if
you're interested in a wider cleanup then it might be worth looking at.

Steve

>>  	/*
>>  	 * Set the recommend OPP this will enable and configure the regulator
>>  	 * if any and will avoid a switch off by regulator_late_cleanup()
> 

