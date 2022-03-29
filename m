Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816C4EAC35
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AAE10F00A;
	Tue, 29 Mar 2022 11:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDD910E86F;
 Tue, 29 Mar 2022 11:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV0P3Vw/zhAZ67FSZrrZPQvTjo3Ak2ZfVld9BFKk2XXMJblr+2dhvO0bScsLF7/RJ8uXisemFAUAX3866v4VawVtrGS69SecHAuFCs6YZMJAlP/mBMWmoy9lGPAjir6PrKkx2Yt0zE1aZdX5oUW8gG+7XQ5E3q37juI7ez/AUT50mc/16kmo6i3UwqGgxcZIq4CIaAKZ06kAc1C6hqOFZLdWJ2CKikep/BTYp106Y3zE7gU5hmqf3/j/n/WkJyCpbt0C1yc5g7xZna0AMHVJ4Tnx20ZSYva0P5E+BD91x3DCULrTCPmJ5cWG2KBoM8QfDppDDneUHdisX3ubZIiLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHfjRLfApo0hpjYZYyYJKlBVktr1cDSApNBK33p6j3U=;
 b=ARhznZJMhtuhT3btuzZt4FoJPuhnp8OQXyU3IDg2992Y96BYMWzf5fbZKHGAb5jrSddNUJJr2x6Ok0g4BaDnvI60GOpafzc/5QvuCfPpcDNaKSt445BZb0NVuJCk0CAPHy68n9xmyTaM2sH8GQoBszB01EaGOFgFRGLrzugFY5DkTnPkTNz3ueEl8a6+XBdfcYGBPEmMEwejpiRqkuWNOZaFwGrDoRfQzKlxecCB3T0zfpAZON4u2JlT/Z1ueo+Q4GCD1+ftOD/GqpWep258DhC6XbEQfdIyMDVAND9JnwVEbcomGMcuw9o/vpsWl6Y615w05IMaaz4qZR2NNPtHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHfjRLfApo0hpjYZYyYJKlBVktr1cDSApNBK33p6j3U=;
 b=oWRzYofgZ/sAT272st5i3sMNezVuKED9xQxOw31zn8pAtUDnM/FzrTo4Drn9bqqg3KFBiIcVTk4trAWd/FvB82Qpcl8MHAkLB8pUppjznLFK/XzIpAWvMJ/nhx+cZ3xsKWuB1IfKwniraFihxe8xPufeKWWu/1zy4/exvRYhPos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3140.namprd12.prod.outlook.com (2603:10b6:408:67::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Tue, 29 Mar
 2022 11:26:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 11:26:04 +0000
Message-ID: <a7afe4bb-307e-3c80-5722-8cf322252074@amd.com>
Date: Tue, 29 Mar 2022 13:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm: add a check to verify the size alignment
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
 <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
 <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0065.eurprd07.prod.outlook.com
 (2603:10a6:203:2::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0b7c55a-5bd2-49a3-5c16-08da1176e90a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3140:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB31401BA6E3A9EE10B73223D7831E9@BN8PR12MB3140.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FCReQP+5usDa4QYRF2OUF+z12YdlKiRfNkSTZQMiO7VDJM5L9AqXTy75ZTQBMlNqPzGVyXmGzI6SgwoAKtwc2XAploroSWufsOvagrziCD7SxxvD1vOeNBcqZaA0dOVty54pEt9r03omBRLJ/gWKw3ApBF3HHRU/gzoGPbVU53dbOuoiGT+tVkACu6hbMIUqZ9kBPDq6S5G7iko3HftAe1orBL5ARDIDePTMYn0o2MJLGCR6L374mlO08QCjFcQYaApaXpJVm2M7YqGx23/1LUMl2xOgk6+TwAxu68IalcbSAdLjI2ICfJNx2YIxfDI+qyHkrWa+zEslBChsejjzlRC5v4OF/yYx8yy2RJrs16q4+/F6NAbkD4EBC4pAs0x8OlKSeGhQz61lTmX20pqa1WW0jxOGF0OYv9Tn2dXXSusZmusb4i4kMplbuTLhy/ShlpvXsLI9kX71CguagF5qo52/xc9T95AiNJTDsuT2eSpKZD1KW/ZxhdeILeqQc7XVTGWJjog+yAvsRnYrW+VNbOfQMDUe7XY7TlRYJmw97SpK8NP9Aip3W2YYnj1V/54j9QgbOBgxRZSEAVWFRnoy7zY20r9VqP89xWUZFdQLCmaaZJqRE0F5d+u3dol5yRoDfnFCltRnMUB1vhBo4dynq4UCEG7TksonbrBiJKs/eDemCizm6fgutCplftlIcJxDVnWlKVvUit1Cb5Jv8uZfS2TTXAOj6WMCKkd0jE4TMR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66476007)(4326008)(53546011)(66946007)(6486002)(6666004)(66556008)(38100700002)(6506007)(508600001)(316002)(110136005)(31696002)(86362001)(83380400001)(66574015)(6512007)(26005)(186003)(2616005)(36756003)(31686004)(5660300002)(2906002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnh6ZHE2M2RQSWdzWDdwT3pRTmhiMktENk1oSkF1Sk01bzVkOGNzekNxWkxh?=
 =?utf-8?B?Tm5KYVZPRjg0R3pFcmswSHgzcFl6cHZHcUJ0YnhwY2x6MkY2WlcydE9mQzlv?=
 =?utf-8?B?UFpTTTI0cXh1YVd6NDlxd0J3azVNREhFMjRoZm5WUHZKVWRxbmcxMDR5OUFh?=
 =?utf-8?B?aE1XN2lVZUsrQWpzbXVVS3BHU2hFZXQzOThaKzBGTkE5cVkvVTMzYldpK1h2?=
 =?utf-8?B?cndRSWZncVlUcHBGS1ZnelZ0NGc0dk5Qc0VFbnl2aldWQit5bDV2aWQ2T0Na?=
 =?utf-8?B?VS8zS3k1VzlOSkN6Z1VhYlQ1dHlUZHA3UXB3UlRpMm5waEdVVFlscDFMSExs?=
 =?utf-8?B?TlRjTVFBbjMySmU5UTNsSVFBTlNQTnY3RmZlQ2JIM3M1L0IyTnk4aWJ5RWR4?=
 =?utf-8?B?b29FdmNWVE8rMU5aWi9hdFJTaUd1ZVRxVjJ1Q3krZzRRdXFuazBSNFNCV0xh?=
 =?utf-8?B?T2g3WTF2aXdwZ1hlOEZaTi9uY3ZOWHRNVWdoMDYyb2RjbHFESElvVjZjN1Bu?=
 =?utf-8?B?WEJjMXVQRlpLK3VVaEhNMUhVd2xtL3Q5NmZUNG1UaDB0dlBsMHNyZWNWSG1G?=
 =?utf-8?B?blBDMDVPb0tzNTJlZ0grNE5XOVVvK0NUYTZMR1NGMDZuSUQwanFYVERzYVl1?=
 =?utf-8?B?YW1wKzNHRTdKeUdZZVk0c1kxVVF3YTZyV1dUazFyTHc5UVVKaHdmbXZaTXBP?=
 =?utf-8?B?WEJETzkvem5wZDJ3UkQ1dWRWc29HL0lxQWNrS1NUWENDYnlaMU95SXgxdERy?=
 =?utf-8?B?cThMOGFyZFJkV0ZPK2J2a0tMOGF3MDFvQ0dKNERiTmtrYTQvTnhtTHN1dEk3?=
 =?utf-8?B?T0VPeHdkZXpzNjMvZmVOVVVtR3BJL3lEdXRPdkJXVkFPRk9helZQSmJtVDdS?=
 =?utf-8?B?elFmb3hiNnFqNWtFQUNxemIyeHdjbDB6QThNVk1rZlcvL0dXSnN4L0xHdHZl?=
 =?utf-8?B?eksybmVSZlJrT1JtMGhHaFpEb3E1bFNQaCtrQ0V2ZDRZMkFTa1dQZGd6R1hY?=
 =?utf-8?B?TFJhK1B0ZUJUVWJ2UFZ5NXVNc0hxbEVDbzVqNlNscDd5TzlJRG9zb1ZoOTdB?=
 =?utf-8?B?SHF2OXZQOGhyNGJhdGdRdmFHb2V2MFNPa1VNc0dqVStrMktKT0p1ZnhPdzhs?=
 =?utf-8?B?aVlGaGxRVlVqU0VYT0pmRGw2THJHc3pJdmVyNW0rdldRYzMyZDdCZko2NnBT?=
 =?utf-8?B?RmZKWDdGY1ZUMnlhaWNaNUYvdGVVZWVUU21kV3lSZE5SbThMM1ByWmxYWExY?=
 =?utf-8?B?TGtRUnFxWW1XY082WTJSelNGZFRTbXJUKzV0akIwd3FCMXlPZWdLcS9kZDBW?=
 =?utf-8?B?TEhIR3phbEs3LzBiVmd2TFd5VGpOUWpDQTkwQitUbGN5TnA2Zkc3OXhFUXRw?=
 =?utf-8?B?OSs4VjFzcTRBVDhRWW1obUdNakhvT2dGNDYzR01JdElUN2JrT0pvZnRZQm5T?=
 =?utf-8?B?ZlNFb0JZR2dkSDliMjc5cTh1UlJveW1maHJnQlVLa3cxZUZWMnNEejFLaG1L?=
 =?utf-8?B?ZUJ3ZG1FTVF0WTdZSjExdlg2ekZGTUZ6enNQbGI3T05uWU5uekQzQUhPMVRm?=
 =?utf-8?B?OVlSaWd3NTJvYnJYMlh3cXo1WkVRS1ljTkZBbzU5cnpRWmVHZVFuUkFpU2FF?=
 =?utf-8?B?SXNUSTQzU3hNMC9mblVCSmM3c2xWdlVaeUozZjRLd1hsaW9kT2JWeTVYMjh1?=
 =?utf-8?B?U0lrNXVZYm5lcWZlaDlxVHBhSUwyVFQ5djhUNVp1UkQzdFJONTlsQldzVUx2?=
 =?utf-8?B?MGJvWU82bUhpcjliYURKSVd0MjNxdFVPMW5CaEtkVERhSlJ4UFRJdTJoeUhi?=
 =?utf-8?B?ck5lT2NsaUFNcXRBMDc0U25aVzk3NmFuNlF6eVBFSXBiWUJvNnB2cnFJbXc3?=
 =?utf-8?B?VnNCNktlUDRxM0syRmNrN2pNV0FMQ0hoRXJ2ZlJvb3J3aGYvVklpeEV3WnEx?=
 =?utf-8?B?UXJQVmZCMU5iQi9UV3cxMlp3akcwS3ZRSGptNDhManNlOHJLRDk4cHJObDRp?=
 =?utf-8?B?RUw2Ung3eEJpNytsMTNFK1NEVERoOFVKN0VkdGV0N2xSNi9vMjRzNTl5TTVG?=
 =?utf-8?B?RlFmZUVJVTFmZEw1SE1JUSs3L3h2cDNrUmg5TU5SUHJKTFE3aUtwcDAwMWxC?=
 =?utf-8?B?ZXJCNVBMUktENmUzWWhwL1Ixa2tPRE5JcG1IanNiVTdXbVlJT1lxQmFPMUM3?=
 =?utf-8?B?SmFJK2RLaUJZVU9UcmcyeENkWGI4L3VNMmtqck93OStSNmtPUHBlTkUxMVFW?=
 =?utf-8?B?bFlUc1dkZ0pQc3Rtcis4blU0ZkFPUlVYMHJDTmF1N1d2MVVTak94WXYyMUVh?=
 =?utf-8?B?UW5KNjdnR3ZzQU5PMkxjZlp6RlB4U2orVmxZWEcwVTE0RUt6R0x3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b7c55a-5bd2-49a3-5c16-08da1176e90a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 11:26:04.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKJJ8nCq8s0uirS70NDOosoiBzcUzhl7y1GcghLRaN2xhzXd3YMFVPCqBLXwmByU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3140
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 13:28 schrieb Arunpravin Paneer Selvam:
> On 23/03/22 1:15 pm, Christian König wrote:
>> Am 23.03.22 um 08:34 schrieb Arunpravin Paneer Selvam:
>>> Add a simple check to reject any size not aligned to the
>>> min_page_size.
>>>
>>> handle instances when size is not aligned with the min_page_size.
>>> Unigine Heaven has allocation requests for example required pages
>>> are 257 and alignment request is 256. To allocate the left over 1
>>> page, continues the iteration to find the order value which is 0
>>> and when it compares with min_order = 8, triggers the BUG_ON(order
>>> < min_order). To avoid this problem, we added a simple check to
>>> return -EINVAL if size is not aligned to the min_page_size.
>>>
>>> v2: Added more details to the commit description
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>    drivers/gpu/drm/drm_buddy.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 72f52f293249..b503c88786b0 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>    	if (range_overflows(start, size, mm->size))
>>>    		return -EINVAL;
>>>    
>>> +	if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
>>> +		return -EINVAL;
>>> +
>> I'm not that happy with the handling here.
>>
>> See a minimum page size larger than the requested size is perfectly
>> valid, it just means that the remaining pages needs to be trimmed.
>>
>> In other words when the request is to allocate 1 page with an alignment
>> of 256 we just need to give the remaining 255 pages back to the allocator.
> In one of the previous mail Matthew explained that i915 expects to
> return -EINVAL error code if size is not aligned to min_page_size.
>
> can we just modify in amdgpu code where we round_up the size to the
> min_page_size value and keep this error handling in drm_buddy.c?

Yeah, I'm fine with that as well now.

I realized that this is probably the easiest option to check if an 
allocation is contiguous or not between the alloc and trim.

So having two functions for that sounds like a good idea to me.

Thanks,
Christian.

>> Regards,
>> Christian.
>>
>>>    	/* Actual range allocation */
>>>    	if (start + size == end)
>>>    		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>
>>> base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b

