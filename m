Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73234D9EBE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1B010E279;
	Tue, 15 Mar 2022 15:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71310E279;
 Tue, 15 Mar 2022 15:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE2QqITt/JtqwNFFnv3NBt7hv/cQ2+UC/uPr/f5jwk8YE5Xjs3V4CGWabQwHvkSixRhJA0oovf/yUzU97aYH4zT199atGCU3n/A+n9vFc641r5BKOsj6z+EAkhZvHjH4ICLaJpYWUC357BWe2eF7yb3wQrrtpb+WhpngFIaEEzSd37iP0bTH/L0F6PafroqOFauPOqLHTe24LKDqQKDe62XBOVm4jorTl9L5CvGiZZofjVJjUW//i6Ida0vTpPRqQt1/bxakS5lgAUdYz/s6xmHZCRL2bZLYveoI3SaBnLmPYdBkzwM9pnDrbrAJGTveG72gF6jDCJLQrz41u675hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI/Pgf47zWQuWKwcfnJy5nXOqjGSb6Waq0C69ITBASc=;
 b=Kp5EQjsNsaz9PUcTdLutdTIa6vzygFfi1KcaLKbg2S4QXhbqQU7OyVH/lRcppugKXP+XxUd0eQzGxNBGhq/hI7ze9qP6bWTH4M6fIo2AD4zJiX/XCWO2Aoryosv667cgwwhzEmOZgo9kbaCuUNIvr9GXmhWvZ3IgkVwCRAlejEDlkwvtg/5AJ94GCKsMcJfl9AnFBFNIMaP2FpwLywX/ywSVzshp1iUhU5x/gk3g7nZjU39LCD0vUi3wrimOhvLlAqlHjgscJM3xgy+F78Vla4BIZnyFa0zZkvo/Ew676ipmeRm1ZRz3gnwI7oN86j/GBMuCzaczvYLI/2Z22tIGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI/Pgf47zWQuWKwcfnJy5nXOqjGSb6Waq0C69ITBASc=;
 b=NqAReoZnZDHWY3JZu/laNIRjkpU6f4rh5HUc6r6N/tRYfa6ArRBx8u8TKxuSrhnVNqP1FpOKSQ38PN+BpLOMuWkRQ5yk7ttwJUWOmHuLGyF6c7bKB9AhT2SjAF2dcv7PUoflg/0MIaBAAOD70UAn6JR2eN6Z0W8gArADhg97osE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BYAPR12MB3222.namprd12.prod.outlook.com (2603:10b6:a03:12c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Tue, 15 Mar
 2022 15:31:56 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%5]) with mapi id 15.20.5081.014; Tue, 15 Mar 2022
 15:31:56 +0000
Message-ID: <3601c42f-0787-e21d-460b-44a5a100b710@amd.com>
Date: Tue, 15 Mar 2022 21:12:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
 <0b9a8cc2-2f34-48c9-7960-727615eb2edb@molgen.mpg.de>
 <1e410ba3-60d9-6a09-6a5d-625145c1c80a@amd.com>
 <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <cd074d23-ee36-dd5f-bde5-1f5dd41a76be@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR0101CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce2a31f5-dbdc-41f9-9112-08da0698f025
X-MS-TrafficTypeDiagnostic: BYAPR12MB3222:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB32228702522A44EEC055D9CAE4109@BYAPR12MB3222.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yLwzktrYDrGgt4zi/3kKyP8IYJJOVjl3d72yJrn7PiMIuubBZFHzFnA5d/6ZkTPlTCQaWx1lydlD5LNNLe7TR6UoWvvM3FaFgVTB9NkK7tKYEQpX15ZKFQaGLaUf6yV4GBxBDSYRY+4jrB/occNluAuuHVMGMBUWuf25LUBoD8SKXmxx1gEYBFCVj7CcbBZe6Ibhshydn4LOQAz0gIsm+nGzB70cWmb5ugX6QnqpYfg7RnUJU1xRW7RuF8sabg1Wsb9AjuPurzTZrBPhpA28gUd22n2pqOQxkB0MP0xUPFV4JdM/lAqLxTJLYFevEPJ0u1dg4zV/OeegYpnTjAfXGa0FgkEtoJCGnR9UsdGLzoewbaRmJsLMiKwe4uHSPgXuPLVM6e5LjlmsOO6DZUWwvTW4q5ITWrgOmQfcZwwu2VFvHIKoI6Hax7QK0tKPhgTBIIhyUAXKs6HOETnqvCNqV+0zlJSP2Td0duoduHT4PF328dKvuC3dzOAHEs5mK0dbTI1Tzx8WdQzARqS1ZEtL5W81ZZ9hqSlibJfr8xQxEdkfHjE1pIgYgeBHkLLOHFft0YTWshkDGa3tHtDaBXCzxVHc8q06zbU0Us51OWU/Adb+qoWiBDfT7u08NSgWoHYsb4Xqc0JMi6hD95og+iDC9uQSR0Pf3CxGapBEo7dIHvkp3v4Bt7Dfv3clwWZDadcy+R3YT1K9tS8XNba389Yn1al0kxzRwEp/iYUYLSzFW5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66556008)(66476007)(6916009)(66946007)(4326008)(316002)(508600001)(966005)(6486002)(38100700002)(86362001)(36756003)(31696002)(31686004)(45080400002)(53546011)(186003)(2616005)(26005)(6512007)(6506007)(6666004)(2906002)(5660300002)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWNlVkNMbVNmNmhxdkx3VGwyK1ZDaDhNSmk1cktoQ2ZXMDB1TE1EVDNJSXRU?=
 =?utf-8?B?WmhCb2xvMGcvQkU2QXZVaFYreW5OdTBlNkpiTEJZT0ZzcTdiRUw2UEtQYXQv?=
 =?utf-8?B?d3FGaER5ZlBxRDFiYy95MU1OTWt0Mm40aDVmY09JTHJHNEppd2c2S0MyZFAy?=
 =?utf-8?B?VllHbU9Fa1VXZFkzaGxuQnE0dzBEUHhpTUQvazk1OUpQRDFJUGtwc2V5dVdG?=
 =?utf-8?B?eTN0S2xGVmNQRkh3K0lwZEdaOHB5eWdlakU2L2NkV2xUbll1cDllMnhTNnc1?=
 =?utf-8?B?Q2R2MUo5N1FaaVZsQ3M1VzNwUlRzd1dqa28rRDM0UkNLTHFYa3U4bmN2dXgw?=
 =?utf-8?B?S2t6akE2Y2Z6MnI2QXE0eUVRdGVMOGpLejRrVUdLQ3h3aldFbVlJZVUzdFA3?=
 =?utf-8?B?TmtMN1lnTStyL3paZEFoQ0JkRE1rSWhFaU9ZSEs1RmlraUllN2hDYkM4UTBq?=
 =?utf-8?B?cWtCcC9uYkQ3dkZWWGJZTDdxaEwraEgxcTVaREhicEN6N05vNlhkbWQwQTZH?=
 =?utf-8?B?S3VjZ0dsZWlmUkMvZkJWOWZXdEhxa0V6dVJsMzZ3eVhWVUlMcWRQeU8raFZT?=
 =?utf-8?B?cStVZCtzais2S0VxaHlRU0tHU2djRWNmSjkwRk9CclZHUGgyRjBQdDR0R2Jv?=
 =?utf-8?B?RVo5VCsvamZrQjh1WWhsSktiZ1JSeWxxWEhKdCs2c3BibHRxM204ZDhPRzZK?=
 =?utf-8?B?dmt3cTJBZmU1YUFsanJwa2FMQjhtTGxxSVVORUVtWTBNZ2NQNllKR3ZNMGQ0?=
 =?utf-8?B?ZHYvS2pYYzF6d1d2aWJpQWg2ODNET1Y0K0JPcFV4cW1HRDZjRTAreGJ6bjhx?=
 =?utf-8?B?OXpSNFdIUC9HWmlnMCtPZ21GMXFnZzZpamN4cHUyS0FpalBRK3V1VjY5MFRH?=
 =?utf-8?B?ZFRveVBMcGtLVW8vL09yQjJqUkcvaitYZi8vaXlHOTFkaGRmZ3VCc0JVM3Ni?=
 =?utf-8?B?UnpiYWgycm80UGFSdEFGQ1hrdG1DOEdXRnVaUGxuWGtMTDk5MVZtdTZoTnZa?=
 =?utf-8?B?aytGTWFaamRSRUVMWGRSdHh2V3o4WWwzTmhSa3I0OGMwWUd5WWlTTjRSbjhs?=
 =?utf-8?B?aUdHTUdtQklKM2JpUXBTYzN6Z2k4Y25YUTBGalBlblJOTVNUb3U1bVFiS2gw?=
 =?utf-8?B?dktaN2h4NUo0azhxc3h5b3FyTFJOT0QySzB1UHBVSE03ZVQxcFRYNlRFS2Zr?=
 =?utf-8?B?eUExSWVTMk90a2NtMFdwNnR0TXE0RUQ5MklVNURlUFhYNTQ3WFQ5bW96MWk0?=
 =?utf-8?B?Z0FPRTgrVUVSOFNCaFpLdHpRMDI4TmsvOGpkSzVraUdEQ3pDd2MwZU5mSEls?=
 =?utf-8?B?MmFoT2xQdzMxMFdFa1pTMlFXNCtPTStxbDVZZjBBMlluTzMwakdKRkdKTHBS?=
 =?utf-8?B?ajk5Q2tqOWhDNG82aGFYZ25kUktMZU8yd3BNdTlsbTNiTkZKNWxFdHpZMlcz?=
 =?utf-8?B?RWVwUlVkNW1zQ2ZEL3pHZ2pYaXlIVWhvdDBISGxkUTZOOEFIOW40N1AvTHBG?=
 =?utf-8?B?aXVWRmxNQjIvTXJ4OWFBdG0rdHpKeUkwZkVYaHJBWVpTTjhNYW1NcWdheDBN?=
 =?utf-8?B?aHBzZFRmTCtEQzlDVHB1Nkp1MzRrUzRoVE0yUFhtWGIvZk5JYnU4TEZlQlhN?=
 =?utf-8?B?Ni9vTmJmck1DeXU1UmVjczIxbGV1c2s2YXBiYnhObGNVUWkzd2ovNmFuTHR1?=
 =?utf-8?B?Y3ZNRzl6ZGRXdnFvRW9BSmhpTUhuVmFYUm15bjRvZ0FobGt6WW9CVytQWFRs?=
 =?utf-8?B?bDFyeUZRSnVQbEo0Zld1VDE2M2Q0b3JtY2JFTFhNYWFCTGJiaDdyNEJzN1N5?=
 =?utf-8?B?Y2xLZkk1MnFudWQwb0wvSTRZakZ2SjlETFRMNkY0Z0VHTkdDOTVJTVNBL0Z6?=
 =?utf-8?B?SE9FMmNiUzRBRjlLcGg4bnpLUi92UGoyNGJDRVJGZEhVUlpBcWVvTGY4VHQ0?=
 =?utf-8?Q?OZpZTcUpHssH5f/YunX8GW9GTkiUyJsN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2a31f5-dbdc-41f9-9112-08da0698f025
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 15:31:56.5447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9F5upNtRYfILl2htWazPB5yV4iLcJfojwTHrMGKLrDLMa99v7SEJrecG1v6/M5xtLhC8LKANHWxxBaTmoOBbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3222
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/03/22 2:35 pm, Paul Menzel wrote:
> Dear Arunpravin,
> 
> 
> Am 15.03.22 um 10:01 schrieb Arunpravin:
> 
>> On 15/03/22 1:49 pm, Paul Menzel wrote:
> 
>>> Am 14.03.22 um 20:40 schrieb Arunpravin:
>>>> handle a situation in the condition order-- == min_order,
>>>> when order = 0, leading to order = -1, it now won't exit
>>>> the loop. To avoid this problem, added a order check in
>>>> the same condition, (i.e) when order is 0, we return
>>>> -ENOSPC
>>>>
>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>
>>> Please use your full name.
>> okay
> 
> You might also configure that in your email program.
yes
> 
>>>> ---
>>>>    drivers/gpu/drm/drm_buddy.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 72f52f293249..5ab66aaf2bbd 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>
>>> In what tree is that file?
>>>
>> drm-tip - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm-tip%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc456573102c04191cf9708da0662f798%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829319396954551%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=5Bspe5QGjQ0KHfVI8%2F%2BXqxR45q6tOL4FE2fVD3uwL%2FM%3D&amp;reserved=0
>> drm-misc-next - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Ftree%2F&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cc456573102c04191cf9708da0662f798%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637829319396954551%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=g2S14TfsHF5ORo9jTZ3uA0l1BH8mnAxk2OWYJeF5i8k%3D&amp;reserved=0
>>
>>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>    			if (!IS_ERR(block))
>>>>    				break;
>>>>    
>>>> -			if (order-- == min_order) {
>>>> +			if (!order || order-- == min_order) {
>>>>    				err = -ENOSPC;
>>>>    				goto err_free;
>>>>    			}
> 
> Thank you for the hint. So the whole function is:
> 
> 	do {
> 		order = min(order, (unsigned int)fls(pages) - 1);
> 		BUG_ON(order > mm->max_order);
> 		BUG_ON(order < min_order);
> 
> 		do {
> 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> 				/* Allocate traversing within the range */
> 				block = alloc_range_bias(mm, start, end, order);
> 			else
> 				/* Allocate from freelist */
> 				block = alloc_from_freelist(mm, order, flags);
> 
> 			if (!IS_ERR(block))
> 				break;
> 
> 			if (order-- == min_order) {
> 				err = -ENOSPC;
> 				goto err_free;
> 			}
> 		} while (1);
> 
> 		mark_allocated(block);
> 		mm->avail -= drm_buddy_block_size(mm, block);
> 		kmemleak_update_trace(block);
> 		list_add_tail(&block->link, &allocated);
> 
> 		pages -= BIT(order);
> 
> 		if (!pages)
> 			break;
> 	} while (1);
> 
> Was the BUG_ON triggered for your case?
> 
> 	BUG_ON(order < min_order);
no, this BUG_ON is not triggered for this bug
> 
> Please give more details.

there is a chance when there is no space to allocate, order value
decrements and reaches to 0 at one point, here we should exit the loop,
otherwise, further order value decrements to -1 and do..while loop
doesn't exit. Hence added a check to exit the loop if order value becomes 0.

Thanks,
Arun

> 
> 
> Kind regards,
> 
> Paul
> 
