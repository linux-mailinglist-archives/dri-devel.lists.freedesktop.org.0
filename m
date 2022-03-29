Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7ED4EAC18
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A0110EFEA;
	Tue, 29 Mar 2022 11:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2069.outbound.protection.outlook.com [40.107.95.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6610EFE3;
 Tue, 29 Mar 2022 11:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNozaY6EIKuk49BHdQoy8Bx58YdDwI/BNnk0ScNXzTYxymyQZE7VDCdXCiiyaAbXO0scysYI7CaohXoicgdkOFk8TtGneL+PHyoRnFHNzW4+Pzx3U+eQi1ipZjOjmPCwuH9ZhTmh/QIGmJOG4CN9rZMC5zEBJxxID65zb5wHF4GP+IRbvdiGrgTepoS4rt36vB1E3rl9CH4CKP/2tb2ehNzKGkbf3McvNNpnyI4bqzJ5TfjsBmxgAHCqr7AAYptfXxvHtFy0o2hi+74zcj/ZgIt/2CvhypgUQONHxqK7hHLxetvDS2xQIVRaycOwDs2G5oFPu494vD+1ga2ozZ4mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5NRXJ72n/URJqB0jJGjiR2MZNfHe0ql/ABQWGBZmlM=;
 b=hbP8kdfg6X4U+qnBXOehDYKyOUJKUstmgZOQAzhC6SWxKabthzaQDE5xIQ3PfAonNLqVi5x5WkRnTKgigPWBwoqsAoC9xYIdWJdcQmn6khvhRWeG2a0q6iRPqf007fnKq6YbrUXJFMc0S4mgWsd7OkSOv7b7/FoJA0vUnUoasgLbf7933CeusNPH6ooraJICBrP2IrBSQUrQthWm3eyDlmAmYHmTKLYBLQ2rc1pMsfMEgJ2rVLfUl5sPxNGxYh7CDSSZ/pljzzk0jDb787fWWOqELH//mHlolNHTe28mnOftpmDbsWM4dbGf508p809tACW+I2iGNRwSs5YtR1PoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5NRXJ72n/URJqB0jJGjiR2MZNfHe0ql/ABQWGBZmlM=;
 b=RP3AP12rpSmWLeOGtMaQeO/70II1/67l5SmI8za+2z9NEhDz9lVc70E9fmQ0sjNvg0qU3kxOiIx2A+PaEDwO3ve/Hu0mXf4w7u8LrojFpTrXEfUQbK1AW2Qol0xv7jvG84hdU4s+/mtsUVTxhomtUjZDDy5At0uTiLY7FsvhlT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 11:17:45 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:17:45 +0000
Message-ID: <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
Date: Tue, 29 Mar 2022 16:58:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: add a check to verify the size alignment
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
 <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::26) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 568524ed-9b34-474e-13da-08da1175bf68
X-MS-TrafficTypeDiagnostic: DM4PR12MB5819:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB581956053DC0F9E1FE52CE9BE41E9@DM4PR12MB5819.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99AHvV1kSnnP+7/65qxgSwZiGgZtAcBEV5z2jLzJyDjfCB220fBuybCb/OkAEoWGwAu631Jy9Wgf12wvbL7ngdh+c8A+zb9MR/f5VKt46SavXwpVfIdueQ33a4/d/Dxe2VjBlBZaKV5iBZ0zD5FOL4quzjKaoj6GGRyvHc28S/vaiQoXxoqUARSvIga0NO/a/laqIdNCWXqImUrMXTsCufnj/1dYoQtRrT6psugDOq8JqfHXn8Y/lHgelj54ocfO/Yq3V95kIM/blXTzO50Nf+xmFhFs7051+qf8GmQfZjFQU5NW8wx+67raUW+a/iH2hk+tcmPe2ZoAIYbZSWpfxssb0nVUyVCVinyAQqupYmHi27bCBolK3jGcvzCcfgPDJLa4WXpULfrPUtqrmj8Nf+l9WkDyLDOVhx/0uPoRbmDnIqH/JoBvNVQJmzD2y4ccHv9rqnvShQAPGTu4dTd2EerTsHO3OfzDkUbSlohfZaF2NEjUyfvw91unDjKI870bPSf6MRv9E7nt03oMUHmCQTLf+Z7w/UCBpV/SbhzKvB0HYigqDj328JSSxuwUmJuGrI4pnRb7c3dVvYvZ8nnxApPydA+84Sp3OOEq3TTk665eSkFYIdglL5LTZfH8rJimYqB8fW1E1MNnVfSO/6O/c31njWyJ3wbK9YVztGa9laCkPurKyGDEfss7ww9bdN3r9YtFCb9WsOujEzUYPzn/uCIXG5OYzHlyaHTJuXp5NrKtW5lHUTSXhM4NkQoaz4NB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(53546011)(316002)(6512007)(31686004)(2906002)(66476007)(4326008)(86362001)(36756003)(66946007)(8676002)(186003)(66556008)(66574015)(5660300002)(508600001)(38100700002)(6666004)(83380400001)(2616005)(6486002)(8936002)(31696002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVoaDllYUlUSEZOVVNzbUZBeEtOaHNRYVBQRmRzdWRtTHByMzk1VVhMWDk4?=
 =?utf-8?B?MVI0MWtld0g1Q1lHNzMxTGwyZ1JkV0ZzbnhLb2tCTWVtUnNXZFBrOW84dEhI?=
 =?utf-8?B?cFZNQkRwaVo2NW13ZXRLWFF5RmphcmhMN3VWMG1sU2dDVjFwdTJTS0ZrUkc2?=
 =?utf-8?B?UVErcktpUGtWM005ZlBLcmdPOXVvNDVYQU5QemppeTdLT1BhOGVvWXJicnc4?=
 =?utf-8?B?SWZHeFA0TGR4M1dHUk91eE82UHVGdjd4aVdvQkhOZDBZdk9ITGw0VUlqS2VM?=
 =?utf-8?B?QWQvTjlTZG9RZlNCb2NmYkhTMVM0M1IzejRETzRSY2JMOUJSWkw4WUtGTUNB?=
 =?utf-8?B?ZlBFNEUwc1kzUm1UeEthUWJMN3F2TXo2VWNLTGh2SXY2L3JaejBvOUlOa1Vu?=
 =?utf-8?B?M3NLU3BsbitGVGdGbkZNTEdFUXBwZFMvTGJEelJJTW9uR2xGS3JQRFQrVjcv?=
 =?utf-8?B?OWdOclhnc0hFT05yeFBRelcxSVY4R2h6VTZuS2JweWhubTdyQlNTcXBIaUNT?=
 =?utf-8?B?djQzNVo3a1dwWjlpUWM3M3c0VWFiQXRQRGpqYmRUUEtTa3kxZS9HOWpxUHdi?=
 =?utf-8?B?cldCRmU1SVdCMWI3RHFacGtYTEtZQnRJYjZuSGtTYVhvbzQvV21ocXhlckFI?=
 =?utf-8?B?bTNzdnJEdUFvcVM5R2k0dUpZdFMxQTRtTnRDQ3I2YW9oKzR0eDhPbFI2cUx0?=
 =?utf-8?B?blNnaVpydG5DaDhwemsxS1RCWkd3N1pZQm1ZeWhZYXMzZ2hxdUxUSU5WQU5t?=
 =?utf-8?B?cFMwNWc1MSswUTZUY2oyRW51WG0xYy9Pa2MveTRMQmZ6ZDBUSE13Mm01NHAy?=
 =?utf-8?B?bkVZRlhTK2dEMW8xY3lCUTFFYnpjbTU0Y1l4R3RPWXhXUFh3bTQxbUE2emo3?=
 =?utf-8?B?bUt3ODlHMlZ6WEJwVXpJN2lKaUZLUnk3a2czVFp3amRaQ2V4NXZ3WFBSSXk4?=
 =?utf-8?B?OWRJRXJ2UU0vRGJkbGxUcmkyOFZjby9ZMzNRVS9TNXNRYTRoYVB1dFJEcDha?=
 =?utf-8?B?cDN6SGZQcldPZi8wZ3hDVWpLdSt3bnpuQ1U0NW5wZzB4RW05ZUxpS21RRUpk?=
 =?utf-8?B?dlNKR1J4SUEwc0xNNXlYaEZ0d09nb3JWWjdUZkE2WWl4RVpxTk10WHpvK0Qv?=
 =?utf-8?B?YlBiY0psQ1BOWDJVSWpDWkNnOXBrSndYd1A0SVQvajc2akVDRXJRdlJ6Qy9z?=
 =?utf-8?B?REI5blFEU0FDSEZQMXJtSGZUYU5Uay8zZzRCamxCMTc0Y2s4bHVPRTk4L2dY?=
 =?utf-8?B?SjF3MkNJNjVQZTNzemZhMmo2ck1FWjBQSzhoT3ovOXB2a0ExNkVHbUdpQ0R6?=
 =?utf-8?B?YmRESDQ3aXQ3M3lWZ0s0NEtmNjZGclprczRwajZrMmdYV0tBUGJBejdib2pP?=
 =?utf-8?B?ZUVmUXlZQVE1NFhvV2FDSVBZZHFERzNzODl4aTgvSlNGVU1rWU04YThUWDF1?=
 =?utf-8?B?R0lnMzZaS0ZiWkJGdjRhNEFSRExOU0tkQlVNU3phcm5iMXFQSFMzWEtxaWdl?=
 =?utf-8?B?SGYwbkZOYmgwQjFrbG9heGlzUDRNNHgyTkRFUWJOREpsNnc3UnVCaUlzNFcw?=
 =?utf-8?B?cm1TVUtMazVQY0hMT2VkM0doYW4xTDZ2Ui92VXNGYWlVMTlvRHVUV2x4SUUx?=
 =?utf-8?B?ZzVOZStiM2FqTE4xaFhTSFk0YUJSc1l5RmczWGh4TE5iZW5TVjZ4Nkg2ZG5a?=
 =?utf-8?B?RVVJRVRmb2toL1JkWFhPNm5VbDhFeTNTZ0tEUUc2RDVFL2NpbDBWcHJ4WWM5?=
 =?utf-8?B?LzFSNnc0Zm5pNitEYXZBeTBnMC91bnlBekUyT0c3Z1diWi9pTG1EZ0VGZVBi?=
 =?utf-8?B?cGtNVWpwWUxKQVlYd3M0QUhRd1YzTUpTQXIxajBib2J5Z3lCQmFkcllnV29k?=
 =?utf-8?B?RFVycEdyT1BaY1JNYi9jdC9GaVRpNjFJc25pcXViOXdEVHpVV0hRZWY1UHZG?=
 =?utf-8?B?S1ZxYUZqV0hNeDFzRFJrbkgwY212aTV0alVMOHNZNHlqR1hSdDN6RlRMWVQr?=
 =?utf-8?B?VkVZdkIxVTZzTXpxZ2IrRm00eDJQVUJMVWx0UGhQT3liSGs4RjN0TGMva2pU?=
 =?utf-8?B?WGFnU0lwSGRodHY4NERLMHYxOUd2L2V3ZFhYNUdHSTIwS2pEZFpiU1owSHVm?=
 =?utf-8?B?NkRlNnFEK205VjIwOVhsN2trbEgzbThTSUovTWVCTXpPeWllTDhUUkVwS0lJ?=
 =?utf-8?B?QnFsS3didjRyMUM4UnRrTHp2WDlCSEVIeXljL0locFVSVFppRzRwNkNEZVZP?=
 =?utf-8?B?eUxaN1lycXhPS21oWFFEK1FncmlWcmNmRGo2V2NiN2JFQ3laYWtBWFBLWE4y?=
 =?utf-8?B?Mk16N2YrQ0RxbkkvRDBpM2RTVG53a0Nrc1RWVHlxMUExZS9QakpJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568524ed-9b34-474e-13da-08da1175bf68
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:17:44.9429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eayk7XNM5BiI7ZxkcvhQcAgf0vCZXIoZJjbxsMhsqo/wLzVNTnsWK2MUlMfXAI9J+na6IDV2UxJqLujJUuMPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/03/22 1:15 pm, Christian König wrote:
> Am 23.03.22 um 08:34 schrieb Arunpravin Paneer Selvam:
>> Add a simple check to reject any size not aligned to the
>> min_page_size.
>>
>> handle instances when size is not aligned with the min_page_size.
>> Unigine Heaven has allocation requests for example required pages
>> are 257 and alignment request is 256. To allocate the left over 1
>> page, continues the iteration to find the order value which is 0
>> and when it compares with min_order = 8, triggers the BUG_ON(order
>> < min_order). To avoid this problem, we added a simple check to
>> return -EINVAL if size is not aligned to the min_page_size.
>>
>> v2: Added more details to the commit description
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..b503c88786b0 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   	if (range_overflows(start, size, mm->size))
>>   		return -EINVAL;
>>   
>> +	if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
>> +		return -EINVAL;
>> +
> 
> I'm not that happy with the handling here.
> 
> See a minimum page size larger than the requested size is perfectly 
> valid, it just means that the remaining pages needs to be trimmed.
> 
> In other words when the request is to allocate 1 page with an alignment 
> of 256 we just need to give the remaining 255 pages back to the allocator.

In one of the previous mail Matthew explained that i915 expects to
return -EINVAL error code if size is not aligned to min_page_size.

can we just modify in amdgpu code where we round_up the size to the
min_page_size value and keep this error handling in drm_buddy.c?
> 
> Regards,
> Christian.
> 
>>   	/* Actual range allocation */
>>   	if (start + size == end)
>>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>
>> base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b
> 
