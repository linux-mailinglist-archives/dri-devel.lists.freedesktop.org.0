Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F06E4C29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 16:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7431B10E40E;
	Mon, 17 Apr 2023 14:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE5210E1FB;
 Mon, 17 Apr 2023 14:58:08 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 17 Apr
 2023 17:58:06 +0300
Received: from [192.168.211.128] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 17 Apr
 2023 17:58:06 +0300
Message-ID: <04cce0d9-33b7-b6d5-e75e-581e3fdad530@fintech.ru>
Date: Mon, 17 Apr 2023 07:58:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/ttm: fix null-ptr-deref in radeon_ttm_tt_populate()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
References: <20230417143431.58858-1-n.zhandarovich@fintech.ru>
 <fc9d282d-e1ac-b99f-7ba0-77bb9c52cca4@amd.com>
Content-Language: en-US
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <fc9d282d-e1ac-b99f-7ba0-77bb9c52cca4@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/23 07:42, Christian König wrote:
> 
> 
> Am 17.04.23 um 16:34 schrieb Nikita Zhandarovich:
>> Currently, drm_prime_sg_to_page_addr_arrays() dereferences 'gtt->ttm'
>> without ensuring that 'gtt' (and therefore 'gtt->tmm') is not NULL.
>>
>> Fix this by testing 'gtt' for NULL value before dereferencing.
>>
>> Found by Linux Verification Center (linuxtesting.org) with static
>> analysis tool SVACE.
>>
>> Fixes: 40f5cf996991 ("drm/radeon: add PRIME support (v2)")
>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>> ---
>>   drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
>> b/drivers/gpu/drm/radeon/radeon_ttm.c
>> index 1e8e287e113c..33d01c3bdee4 100644
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -553,7 +553,7 @@ static int radeon_ttm_tt_populate(struct
>> ttm_device *bdev,
>>           return 0;
>>       }
>>   -    if (slave && ttm->sg) {
>> +    if (gtt && slave && ttm->sg) {
> 
> The gtt variable is derived from the ttm variable and so never NULL
> here. The only case when this can be NULL is for AGP and IIRC we don't
> support DMA-buf in this case.
> 
>>           drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
> 
> Just use ttm->dma_addresses instead of gtt->ttm.dma_address here to make
> your automated checker happy.
> 
> Regards,
> Christian.
> 
>>                              ttm->num_pages);
>>           return 0;
> 

Thank you for your reply, you are absolutely right.
Apologies for wasting your time.

Nikita
