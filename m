Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80BAFDCE9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 03:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A46C10E1DC;
	Wed,  9 Jul 2025 01:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="rEhNdc7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C1E10E1DC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 01:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H30So9AdIyWkMEDjX7oZ8/lNt3wPb9URPVhtN/UoCoY=; b=rEhNdc7sYP5QbjLhEpRTTFVnp0
 ClbZhjfAN7rxmvfHdU7gK/TyLwxr0S4kyalUfl6O5lQVbmwXXj0GAm4y+D6eHK19w6rd00nl0NBD4
 fhsuc8+x4XfWBA6rw4mEUfEnTtaQdM97t9U+z2s5w8yIQjP/8QMnayxU0WH9CyApz47kIFv/YFPA2
 SO/Dvu2ZgUt6lOpKpAsS7uK0CjRMTS4bZ8lI7F0Y4ll1dm0R2X718scvBUGcN28ufbPYTYfZwSDrT
 wnrScpmzaMiDupKZt2STDmWCcWNUU3sEIBfENoqZ3F+wu3VOc5Zw3TE4pj2qn5RhnrS79LcW+7FUo
 4SwvH3bQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uZJcD-00Amxc-2j;
 Wed, 09 Jul 2025 04:28:54 +0300
Message-ID: <17629989-891c-4026-b9d6-3e1403adba6c@kapsi.fi>
Date: Wed, 9 Jul 2025 10:28:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma_buf/sync_file: Enable signaling for fences when
 querying status
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20250708-syncfile-enable-signaling-v1-1-9f6e6cd9fcda@nvidia.com>
 <1ebba600-31d2-48ed-b08b-46d667d38054@amd.com>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <1ebba600-31d2-48ed-b08b-46d667d38054@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/8/25 11:20 PM, Christian König wrote:
> On 08.07.25 14:03, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> dma_fence_get_status is not guaranteed to return valid information
>> on if the fence has been signaled or not if SW signaling has not
>> been enabled for the fence. To ensure valid information is reported,
>> enable SW signaling for fences before getting their status.
> 
> I don't know how often I had to rejected that patch now, we really need to improve the documentation :(

Sorry :(

Improved documentation certainly would be good. I've thought of SW 
signaling as a kernel-side 'optimization' and not something that would 
be visible to the user space. Perhaps documentation could also mention 
situations where calling this without enabling signaling is useful. 
Anyway, I'll fix our issue in userspace by adding the zero-timeout poll 
instead.

Thanks!
Mikko

> 
> The fence info query exists to query the status *without* enabling signaling, that is the whole purpose of the function!
> 
> If you want to enable signaling *and* query the status then just poll on the sync file file descriptor with a zero timeout.
> 
> If the signaling timestamp or error code is needed then that can be retrieved after signaling through the info IOCTL.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/dma-buf/sync_file.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
>> index 747e377fb95417ddd506b528618a4288bea9d459..a6fd1d14dde155561b9fd2c07e6aa20dc9863a8d 100644
>> --- a/drivers/dma-buf/sync_file.c
>> +++ b/drivers/dma-buf/sync_file.c
>> @@ -271,6 +271,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
>>   	const char __rcu *timeline;
>>   	const char __rcu *driver;
>>   
>> +	dma_fence_enable_sw_signaling(fence);
>> +
>>   	rcu_read_lock();
>>   
>>   	driver = dma_fence_driver_name(fence);
>> @@ -320,6 +322,7 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
>>   	 * info->num_fences.
>>   	 */
>>   	if (!info.num_fences) {
>> +		dma_fence_enable_sw_signaling(sync_file->fence);
>>   		info.status = dma_fence_get_status(sync_file->fence);
>>   		goto no_fences;
>>   	} else {
>>
>> ---
>> base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
>> change-id: 20250708-syncfile-enable-signaling-a993acff1860
>>
> 

