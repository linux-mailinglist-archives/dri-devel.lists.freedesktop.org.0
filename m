Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9294DAAC8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 07:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC24610E62A;
	Wed, 16 Mar 2022 06:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765110E566;
 Wed, 16 Mar 2022 06:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdJPUooo9OGR+GrTFG6373cDiNjfv4+7z+zDaMSyUs0H0QQavKsudzTCEnuSA1i6qnTIsv4jXo0V/ufvf8VGKE8yzgYJe9n1LoTI8xjobNxoXn4Pc3RNGN80Ohv1l+SXMgoUCkqrarnHQPgX2oBrEcdV7VGYSC9YHEQHJkCLvLvgAtS7F+tZaWleBvFYXjtMUGkzW4SsQW30Ly7z2TEs66L5XfLmPqn4dZD9uAmIKGZ+m12m24CQRNAE5fiVLl4unmF8cKiI62ARRi8c/m1JUn9p0WFjHDsqVcfG5en8NGiFcK2GcE7ogBduyUNCXiUNkvsVg/ynr8UgfjJ0iBsmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4iVwuJi+BPUZmcnbGeSkv2LaJEOWkLPlrHYvcx3Ul8=;
 b=NLysolhQUOMyU/SVm56d7psUfQ8LiGySDtlCC2NBY1W9nwXtoNZjc/WFOqA0HR84eIvbLfRQdX54mtadpx2OseTl85BhcMcU3+Wv4ftRKUfzWy+Iu6hfMGwGKQbNf9Dqvx4Ftj8E4n2tOP59+Z0rH0ZkkgZ6uUIXlXj5pQhbaXYzLnHrUfJgAJLxvVQ7QjZ5odJGn2XHI1pbAw5H4HneSri+hfwN3clQw9w4sVcSj63WYMz6RLLaTTY1ZA5usWtPsHQcWoUuEzQja8nfcJEKwjkVr9rTCj/QebpLCxq47epGhuyWzZ2o45acd8eXi97P8b4/Sbc6vwRWGtHba+jhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4iVwuJi+BPUZmcnbGeSkv2LaJEOWkLPlrHYvcx3Ul8=;
 b=Hppfk0MOTnfBH3HIdh9i6FVCsflMYskXizTZO1JkKiHOMGu/b3acaY02HI6/m7rKQ+Uh6EbEwTjZGbA10bTrmU/ad7NwXKGwltAv7COKLZmj7fC43nV5fS30esFYnO8gMAa0UAYyV/WNWkJUqkWBL0ucH5iHYDXyBFp4PqbFufA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 06:39:17 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 06:39:17 +0000
Message-ID: <537b9740-f7c3-dae6-a683-42dbef4e1b4c@amd.com>
Date: Wed, 16 Mar 2022 12:19:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
 <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
 <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
 <3601c42f-0787-e21d-460b-44a5a100b710@amd.com>
 <a19344ef-748c-7692-8089-d39dc562d0b3@molgen.mpg.de>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <a19344ef-748c-7692-8089-d39dc562d0b3@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::18) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: adcec189-9967-4407-2eb6-08da0717b1aa
X-MS-TrafficTypeDiagnostic: BN9PR12MB5162:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB516243E782B3EF679ECB160BE4119@BN9PR12MB5162.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zR/vhwOShpt9r6/uIcuHOW28oIapHc7+oarh/0tOMsyb44Q2KpPXuEGr7XIYznVlkW2GXiVWGg+aR/Mx6JCAe/XugvlHwXaEOi+UfxZnZ8lZLPfzMbfER9dYjjo3OO0IXrvOftR+Zo2M9x6wB2N2L8qYzSrhortJ67KIi3elsLu9dvQxMZ9nJqg9AHGZNyTZLWly/xFP7vt5NIxrx9/RguEVEPIH5yAKtedVIZltyaGHEi34t9v8blkFFrJEA+Q9k/ayh/zvgpD3GElr5luFgfDku0JNqsTqqichhrpgkk/sAZsDF+sn1Z+bJxn4GnpOQ68NNwlxi1Bo7TueXxP5ZYgTwqMzbLiT5enYN+BmIFnCBKLfaz8dsihcfvuDgc7/0lwnsJ6K0UkjkqcpoJCOJZlG75Ca88zRLaO2lTyH68empH4Dr8WHDIVorhWcHYlsh8vqf0/Rwma1KdmRNQircJhtK+lUSig6lDKk+h9opOdnpA+kL2s3b2glGVvh6JMeR8fOJ9idOooa+NNGWm5R5kgelviTKg8zU7W/l+ninpTT3ostKIAvwOAultM6PvvqHRmZwGN/z1V7i5H4Kfo3UTdDbpDuLtdGQ+MfZo9wlgejIJzbiLYzKBEoChMheEDmx5tip7YbRuwgKqiQF1m6UtszuZP51oBHoXvQ9wuTeqIDwak7wjxeYKTfK245JCO/d4l35T962Pr34OM2uYPJm1rEJRRBaRpyYsj6+38vnG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(6666004)(31686004)(45080400002)(316002)(6916009)(6506007)(53546011)(6512007)(86362001)(31696002)(2616005)(83380400001)(5660300002)(508600001)(8936002)(2906002)(6486002)(966005)(38100700002)(26005)(66946007)(186003)(66476007)(8676002)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm1ocU1iTnplTWJUcHp4MWRHeE1xVTJNdWJiWE5vV0Q3U0FBazRGaXlOU2R4?=
 =?utf-8?B?ZEVmRFRNNnN5UGZrRXpjRXgyV00xTWJ3RUdjTjlGVFBoNlppbFBuclJ5bmdp?=
 =?utf-8?B?VlN0SlU3NVhVZGtqWVBNRitDSUREUndJRDlyaXNzUHRxZlBsNzJ2b09XVUNK?=
 =?utf-8?B?azFWdEZDd3FnWDY5d2lDZWJ5RFFRdlg0dFVEZlNsb2JsSjhpdFFuRi85bHdh?=
 =?utf-8?B?bG1xVXUvb25USjliYmxrNjl5SVZWR05uOGJLY1NsRnZySG1IeENKbjg2Q1V5?=
 =?utf-8?B?NElyckhxTW91ak5ZTjQ4YVpmOWpROFhNbHZLdzkwSXJBTkpkVjFaZWZWSVJm?=
 =?utf-8?B?d3V3SUlZbDdsbnh0RDNhMnRDc0wrWlU2cG81QWFoME1nV2paMjRqNVNEK2x6?=
 =?utf-8?B?S1l2azdod01RTVJQam5DQXVpTlltS2NiWEpkZnlKcGQzZm1yTWlOZkxreDJC?=
 =?utf-8?B?c1NXR0NUSXBVN1dSYlUvOTNKVE8rZHdoaTVLaWVZYTZwLzBESnZieFQ4Y2Ry?=
 =?utf-8?B?Zk11T3lQTXRyZVZFQU5yTTRKaE1SeHBVekxHTE9GZ3diSmFmWVdCNVh2YVhO?=
 =?utf-8?B?MkpvYWhOajRtRTYzS0FZS3JuVGw3OXp0cmZUek55T1JCUkhsRmp5d2dpa2Rt?=
 =?utf-8?B?Wmx6UzdUWjdsaS9qMHNaNFB5MngrWm0wZ0FmZkErMXB2R0Jyd3JvL2REQ3dL?=
 =?utf-8?B?eTFFd21yclczNzRuTTY0NzVSd3pFZUdIbXprRE5HSTZ1Zm45VG5FeHk4M2t5?=
 =?utf-8?B?d25aTDNQMU9TRkFTbUJPSW9MOExTMnFRK2NxbkVrbERKNXNzWVdiYkNoQVdL?=
 =?utf-8?B?YmN3OEpsMi82QzRkTTNvVGlkclJWUjdJaDlUeWVyRVRUQkRPOEZsRHQ1SmYv?=
 =?utf-8?B?TDdvcDBJWVJZR0NlZHJuSG8yQndJaWcvWGIrRFQ4cHAwWHFHUXZtYVVVd1Q0?=
 =?utf-8?B?V05heUZ6Z0xjUFJXSlViUmkySkQwazIzSTZ2L3BpL1ZnY3F6WjJOTjJiejRj?=
 =?utf-8?B?UHh3YXphYlRxUG9OemJTWGVkanpZaUdKRExFbFZxZHc3TTh2MmY5NkIzZTRV?=
 =?utf-8?B?SncrcndJNWU5OW0vMXlFVFFKQkNQeDBmcGRoRHJKSzE3bXRYNEh2bmFnR2Ry?=
 =?utf-8?B?WFJUdTcyd0I0RTN0L2tlcTd6OTZjY1JzbGFQMTZjbW44TGxCNytYNnZOZ0U0?=
 =?utf-8?B?VUcrNlNGY0tIK1JteUNpQldCRjVkZ2I1amh5SEcrNmdBVVpjclAvaUQrVk8z?=
 =?utf-8?B?d3IyOExEcitiK1cxVjlNbHpYb2w0WExRZW5PV3ZCZzRUdGpPTk5VQ21oMlNU?=
 =?utf-8?B?a09ncmx5WjZHaENHVGdieUgxZkU3N0RHT29yRURJWGZTa1BFbWFkOHF3YVZP?=
 =?utf-8?B?SmJiZ3NmajBRNFFnc1kxeVdHY2kzK284bHRjdkRzeUJTSU9aUHQxWkhWeFpn?=
 =?utf-8?B?MUpCMGVOUDlmTDhBNzg1QW1VVXduTll1d2xabFVscnF5cDFkY205bTFVRWZO?=
 =?utf-8?B?d1B6WE5WaDN0bk43OWpTN1JZQ2pVOWhUOEtTT21IdG1BVnQ3dkpsYnpNUmZZ?=
 =?utf-8?B?NWNONno0S3BYRkFZcVlUUXBqUi9VNEhsY3NxQnRyN2xDMlFFTVR3TnF0V2Jp?=
 =?utf-8?B?alNDYjdoS1VDdTVOeUpJNEJtQXNCS3JkK0p0YjBFdmpvR2pJRWdiM0VqUUNF?=
 =?utf-8?B?SCtkZkJkSWNab0F4VXNpdjRacUYyUCsrZ0JiL1huYW5iVWtjUU5ZY000ZGxy?=
 =?utf-8?B?d2lJcWhzZTR2cUJQS2QrN1RtN1lndFBMN2grcjNVTWRzdTQ4Z2dlQm5xeEQ4?=
 =?utf-8?B?MjZReFd4NUY4SFcxTlM2TFRSNlFQZ3J5aHA1bTdJV0Q1SzN6TXpLN0xicTdJ?=
 =?utf-8?B?MjJCNmM1ZDF5Z0g4bk0wdENyVmorcEhUMjJOSGc5Zm1uU3Q5QnRVa1I0QTF0?=
 =?utf-8?Q?QG2gepIUWz78oiGb3LJYlIuMSZoEgShz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcec189-9967-4407-2eb6-08da0717b1aa
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 06:39:17.6615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjLh3epCH5ibnpl6T9MSg06mzUwFwW0oMO1KLcIkKbc3dFoMjgdTDPVtOTRvGOaBHCUtLyxNLRygPhDFm/uXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162
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



On 15/03/22 9:14 pm, Paul Menzel wrote:
> Dear Arunpravin,
> 
> 
> Am 15.03.22 um 16:42 schrieb Arunpravin:
> 
>> On 15/03/22 2:35 pm, Paul Menzel wrote:
> 
>>> Am 15.03.22 um 10:01 schrieb Arunpravin:
>>>
>>>> On 15/03/22 1:49 pm, Paul Menzel wrote:
>>>
>>>>> Am 14.03.22 um 20:40 schrieb Arunpravin:
>>>>>> handle a situation in the condition order-- == min_order,
>>>>>> when order = 0, leading to order = -1, it now won't exit
>>>>>> the loop. To avoid this problem, added a order check in
>>>>>> the same condition, (i.e) when order is 0, we return
>>>>>> -ENOSPC
>>>>>>
>>>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>>>
>>>>> Please use your full name.
>>>> okay
>>>
>>> You might also configure that in your email program.
>> yes
> 
> Not done yet though. ;-)
> 
done in v2 :)
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_buddy.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>>> index 72f52f293249..5ab66aaf2bbd 100644
>>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>>
>>>>> In what tree is that file?
>>>>>
>>>> drm-tip - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm-tip%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7C3610aafe216d421c715c08da069ac1d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829559006306914%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=GM3iXiDQCx%2BM4pD1nmivRFRvkehwTNd2Jtd713cF51g%3D&amp;reserved=0
>>>> drm-misc-next - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7C3610aafe216d421c715c08da069ac1d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829559006306914%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=i7pvmDJu310XRX7h3cQ344j5RYHq7fBZ520l%2F%2Br1%2BQU%3D&amp;reserved=0
> 
> Thank Outlook. Now everybody feels safe.
> 
>>>>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>>>     			if (!IS_ERR(block))
>>>>>>     				break;
>>>>>>     
>>>>>> -			if (order-- == min_order) {
>>>>>> +			if (!order || order-- == min_order) {
>>>>>>     				err = -ENOSPC;
>>>>>>     				goto err_free;
>>>>>>     			}
>>>
>>> Thank you for the hint. So the whole function is:
>>>
>>> 	do {
>>> 		order = min(order, (unsigned int)fls(pages) - 1);
>>> 		BUG_ON(order > mm->max_order);
>>> 		BUG_ON(order < min_order);
>>>
>>> 		do {
>>> 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>>> 				/* Allocate traversing within the range */
>>> 				block = alloc_range_bias(mm, start, end, order);
>>> 			else
>>> 				/* Allocate from freelist */
>>> 				block = alloc_from_freelist(mm, order, flags);
>>>
>>> 			if (!IS_ERR(block))
>>> 				break;
>>>
>>> 			if (order-- == min_order) {
>>> 				err = -ENOSPC;
>>> 				goto err_free;
>>> 			}
>>> 		} while (1);
>>>
>>> 		mark_allocated(block);
>>> 		mm->avail -= drm_buddy_block_size(mm, block);
>>> 		kmemleak_update_trace(block);
>>> 		list_add_tail(&block->link, &allocated);
>>>
>>> 		pages -= BIT(order);
>>>
>>> 		if (!pages)
>>> 			break;
>>> 	} while (1);
>>>
>>> Was the BUG_ON triggered for your case?
>>>
>>> 	BUG_ON(order < min_order);
>> no, this BUG_ON is not triggered for this bug
>>>
>>> Please give more details.
>>
>> there is a chance when there is no space to allocate, order value
>> decrements and reaches to 0 at one point, here we should exit the loop,
>> otherwise, further order value decrements to -1 and do..while loop
>> doesn't exit. Hence added a check to exit the loop if order value becomes 0.
> 
> Sorry, I do not see it. How can that be with order ≥ min_order and the 
> check `order-- == min_order`? Is min_order 0? Please explain that in the 
> next commit message.
> 
please check v2, yes when min_order is 0, the above said situation may
occur.And, since the order is unsigned int, I think it will not trigger
the BUG_ON(order < min_order) when order becomes -1. Hence I think we
needed a check !order to exit the loop.

Regards,
Arun
> 
> Kind regards,
> 
> Paul
> 
