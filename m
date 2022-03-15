Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6FA4D9EFB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0135D10E52D;
	Tue, 15 Mar 2022 15:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4010E51F;
 Tue, 15 Mar 2022 15:44:57 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5ae8f9.dynamic.kabel-deutschland.de
 [95.90.232.249])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1EA7A61EA1927;
 Tue, 15 Mar 2022 16:44:55 +0100 (CET)
Message-ID: <a19344ef-748c-7692-8089-d39dc562d0b3@molgen.mpg.de>
Date: Tue, 15 Mar 2022 16:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Arunpravin.PaneerSelvam@amd.com
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
 <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
 <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
 <3601c42f-0787-e21d-460b-44a5a100b710@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <3601c42f-0787-e21d-460b-44a5a100b710@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Arunpravin,


Am 15.03.22 um 16:42 schrieb Arunpravin:

> On 15/03/22 2:35 pm, Paul Menzel wrote:

>> Am 15.03.22 um 10:01 schrieb Arunpravin:
>>
>>> On 15/03/22 1:49 pm, Paul Menzel wrote:
>>
>>>> Am 14.03.22 um 20:40 schrieb Arunpravin:
>>>>> handle a situation in the condition order-- == min_order,
>>>>> when order = 0, leading to order = -1, it now won't exit
>>>>> the loop. To avoid this problem, added a order check in
>>>>> the same condition, (i.e) when order is 0, we return
>>>>> -ENOSPC
>>>>>
>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>
>>>> Please use your full name.
>>> okay
>>
>> You might also configure that in your email program.
> yes

Not done yet though. ;-)

>>>>> ---
>>>>>     drivers/gpu/drm/drm_buddy.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>> index 72f52f293249..5ab66aaf2bbd 100644
>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>
>>>> In what tree is that file?
>>>>
>>> drm-tip - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm-tip%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc456573102c04191cf9708da0662f798%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829319396954551%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=5Bspe5QGjQ0KHfVI8%2F%2BXqxR45q6tOL4FE2fVD3uwL%2FM%3D&amp;reserved=0
>>> drm-misc-next - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc456573102c04191cf9708da0662f798%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829319396954551%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=g2S14TfsHF5ORo9jTZ3uA0l1BH8mnAxk2OWYJeF5i8k%3D&amp;reserved=0

Thank Outlook. Now everybody feels safe.

>>>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>     			if (!IS_ERR(block))
>>>>>     				break;
>>>>>     
>>>>> -			if (order-- == min_order) {
>>>>> +			if (!order || order-- == min_order) {
>>>>>     				err = -ENOSPC;
>>>>>     				goto err_free;
>>>>>     			}
>>
>> Thank you for the hint. So the whole function is:
>>
>> 	do {
>> 		order = min(order, (unsigned int)fls(pages) - 1);
>> 		BUG_ON(order > mm->max_order);
>> 		BUG_ON(order < min_order);
>>
>> 		do {
>> 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>> 				/* Allocate traversing within the range */
>> 				block = alloc_range_bias(mm, start, end, order);
>> 			else
>> 				/* Allocate from freelist */
>> 				block = alloc_from_freelist(mm, order, flags);
>>
>> 			if (!IS_ERR(block))
>> 				break;
>>
>> 			if (order-- == min_order) {
>> 				err = -ENOSPC;
>> 				goto err_free;
>> 			}
>> 		} while (1);
>>
>> 		mark_allocated(block);
>> 		mm->avail -= drm_buddy_block_size(mm, block);
>> 		kmemleak_update_trace(block);
>> 		list_add_tail(&block->link, &allocated);
>>
>> 		pages -= BIT(order);
>>
>> 		if (!pages)
>> 			break;
>> 	} while (1);
>>
>> Was the BUG_ON triggered for your case?
>>
>> 	BUG_ON(order < min_order);
> no, this BUG_ON is not triggered for this bug
>>
>> Please give more details.
> 
> there is a chance when there is no space to allocate, order value
> decrements and reaches to 0 at one point, here we should exit the loop,
> otherwise, further order value decrements to -1 and do..while loop
> doesn't exit. Hence added a check to exit the loop if order value becomes 0.

Sorry, I do not see it. How can that be with order ≥ min_order and the 
check `order-- == min_order`? Is min_order 0? Please explain that in the 
next commit message.


Kind regards,

Paul
