Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840266E5E36
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 12:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156A10E73C;
	Tue, 18 Apr 2023 10:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7FA10E73C;
 Tue, 18 Apr 2023 10:07:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 391EF625AC;
 Tue, 18 Apr 2023 10:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DFCC433EF;
 Tue, 18 Apr 2023 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681812440;
 bh=R/KFdzXCgnetVU5Nex15rrtlAf5YzHR9xzJSb9o4Y2Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LXRNfcbnzbR/JRb37sh45HIKT358NsFj41T9b15kR2krRa+JbvD70anAojbmzyq90
 C5BOw6QjNuWpdUoBSu4grqRa+C5kfVGd0oVbD9r/5cC7fB/47IOm2Jt3SKbU0MwEzJ
 AWRoFZKbphe2b3sOoFwrXei9lmV9atifBODRhrQ0yWa/3JGvymVIJ1g8o+zyIj+3v7
 3CHRCfc//HX5Uw4HgbwL0kM2Ul8fUhEJYOUZ/+6p2aWIWyEcw5Ur1+9oDM8K5AKtO0
 gMeuGXFeRHKsOtO9i7m1OmEej4oLZQLykAH6XkY2oKpIJLBrJsjD2K5W3tV/OGquxT
 KRoxLu9xKqceA==
Message-ID: <d41669a1-9e18-defb-d0cc-d43d7be7d23e@kernel.org>
Date: Tue, 18 Apr 2023 12:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Daniil Dulov <d.dulov@aladdin.ru>
References: <20230418065521.453001-1-d.dulov@aladdin.ru>
 <ZD5ZFoEk92MNQpqD@ashyti-mobl2.lan>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZD5ZFoEk92MNQpqD@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 10:47, Andi Shyti wrote:
> Hi Daniil,
> 
> On Mon, Apr 17, 2023 at 11:55:21PM -0700, Daniil Dulov wrote:
>> Pointer mqd_mem_obj can be deallocated in kfd_gtt_sa_allocate().
>> The function then returns non-zero value, which causes the second deallocation.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
>> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>> index 3b6f5963180d..bce11c5b07d6 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
>> @@ -119,7 +119,8 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
>>  	}
>>  
>>  	if (retval) {
>> -		kfree(mqd_mem_obj);
>> +		if (mqd_mem_obj)
>> +			kfree(mqd_mem_obj);
> 
> I think this is not needed. kfree() returns immediately if
> mqd_mem_obj is NULL.
> 

Yep, the tool has to be fixed because such patch is just misleading.
However different point - the commit description actually describes
entirely different case: double free. Maybe the issue is true, just the
fix is wrong?

Best regards,
Krzysztof

