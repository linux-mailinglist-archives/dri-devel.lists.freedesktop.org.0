Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABE4E2083
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 07:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5110E200;
	Mon, 21 Mar 2022 06:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4975110E082;
 Mon, 21 Mar 2022 06:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6KwR0paIcz9yQyZGZc3ri50JHV9wxiO9Tuab7iHUiihTXOec0u/A7zdQyJp9JYfAHWL1PH8DxF+OlUsbuajJCBl6dILPLuyubFK0lKo151exLoUxkEwxb2iW4WuL/2Zrfsr8D+Q45ZNyv15GvrOdwYrs2+8+rpbEzDDTCW9hqULSA4UwlGItle0tzl8nXlbmwDikNAUuL1e/wyg3zGR1TZk6TltJhpWZ28cVN8kuUe1IJUgDo+eNJJ41ai1PaMz31GCqEKBRhTsqg+HdvRl7eXCN1eZc2xUZCsm+i1zWO/H0FO3UG8m16RzgT/ON46z0J1LeLc9TQOq5F0dlxNnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1/5yosEQ7pUHu/QT6PKKEKF0Xmpcy7iYaU+WLqyUs8=;
 b=k9J5ISuE9ALhl3nLwaVty+RX9kG8XkI7hrU51k+3GFlZQUkWEzFnG4LfaVkQWYmvf7JTI8WRcampMZKxhVoCN8kfcnWr01VLm4MTJy4NWY4TvLm9BJlM1zpDR9Ja2XbG0i+xUnAte3sdsO4dpbENFyUGuIn0doS9iOJ9xPLHI3t7Gd9BMOVbToJ6xxX84Yh/89Z/dIWvkSRlYocJzPjHIAVhpxbzuhkYOxLrXsbnDTVNjjT24o3bnIns2zEDOpVTdxIe+VbRZDomaut6S7Tu9m/nMpi6b3XEWIt0DvtBgUdj2h/dMFCITDrWboACSBhBsX80PZdl2Gq5vddGueUj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1/5yosEQ7pUHu/QT6PKKEKF0Xmpcy7iYaU+WLqyUs8=;
 b=NhXL8bVkxvk2k3i7auBcD7ofXir/1hasL+ugMkbigjZh4bxwZzCNd1hY5PYHL2yKIgPQUNecKazRa5vp+3GFxQt1dMii9ZhptX7z9q7fnp7yH2XIltNu0+fedLOjpBam+TkWMFWQw8HE727pg9zdAjDx6396wJVpTpupEzBlu98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4349.namprd12.prod.outlook.com (20.181.62.21) by
 BN9PR12MB5258.namprd12.prod.outlook.com (13.101.158.52) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 06:13:32 +0000
Received: from SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef]) by SA0PR12MB4349.namprd12.prod.outlook.com
 ([fe80::e15c:41ca:1c76:2ef%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:13:32 +0000
Message-ID: <3d1e58bc-0f15-6f8c-1f58-82ef324b6611@amd.com>
Date: Mon, 21 Mar 2022 11:54:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
 <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
 <6a7a0038-0de9-ada8-aefe-2725d8f0b309@gmail.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <6a7a0038-0de9-ada8-aefe-2725d8f0b309@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::7) To SA0PR12MB4349.namprd12.prod.outlook.com
 (2603:10b6:806:98::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 632a283b-e6cc-47c6-d404-08da0b01ecea
X-MS-TrafficTypeDiagnostic: BN9PR12MB5258:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52586742B7D2D76E0CDA901BE4169@BN9PR12MB5258.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0a4aP0Ptlfz608impb0qvM1f5qTAX4VK7aOk60qNhuRSTtb1CKl1OJEcZPcewsgE9tLxeMfm+RSWYyw9Q1cDYLHgY3v6skIMzSRq7hwKFakM9YRjuGOZfuY4IU1btQ6XlzCB36JBnwLHGZFiFtFBSE3Y0lyv5XnD/n8OmjMg8V7OT9W6stW+LtdX8dM2rM0YQAsZ9Ocbnkl3QcK7MBrHwpGwaisMw3m6JlLt3txLmwNzO/L0SyH39YcsDFk/YvGZoU8m26lh/BfRcZz0DaJhJ7n+8dnBTbhpP4i5pnxaqnxpUZQpZY9upgVkav5ZSsVgblpcEXO7vyDhyDGDtBIEMjL1IHmIT6//7rumMUXtrH0dKGKy7Y64FvqduxiQQgUD5Duizni+nwDQOQ1v/dBdr4vPE6LvXgxqZ9nkfVUauAJlYyAJioX5cFGVYT8isIurPdSSKHqyIvSkXdL+08KdaY4vPJhaS076eF188CdTyc/ge7/+jIEy2Pga4ySdpjoE09FpabJv605tJ2N7FkllLbYhYBo+OTZQ29hZfva5jI4WcNOAMCO2svCvSY3hwtJpmdHcG0d+kMv/9Agiz8os+Li01VhTEGC86APQ4HPdC4/xjKM0JFzM90kodddNdsETrqcGQDvAEf9Zq3pLxVHGVaZZT0pZ5KdrqZ5S9cB708+IG3K5TJE23gx7maJ+6hxULaBd1goeWvnASnOfaa0GuukbpYlc/elocOjlkNAuRVv+JbS4WPE2S0z9OAC+Ud82
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(83380400001)(186003)(66574015)(26005)(31686004)(2906002)(966005)(6486002)(6506007)(508600001)(110136005)(45080400002)(31696002)(8936002)(6512007)(2616005)(5660300002)(66476007)(8676002)(66946007)(4326008)(66556008)(6666004)(316002)(53546011)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2QwS0RzeDM3RmhaYXFXc01SdktCZUhCVjdzSGtRYzhJNzIwcFMxZFg4UmpP?=
 =?utf-8?B?N0p0R0czdkhkNG1USjhRZHU3Mkd6cWVaS0NwaUs1TitoUHVlN3lNMC9ZM2xH?=
 =?utf-8?B?czVjR2NTK0h5STFXRU5vTlRWZUswVEdvS0JsOUV4MTBMOWR3TXJJQ2dNSzdZ?=
 =?utf-8?B?dWtoUnJncUF5aVQ3Nnk1eDJmRUdIb2h2cHJhOW5PZ1JyVnB0SjZ2VFNuckxw?=
 =?utf-8?B?cFE4RTluNTM2bmR4MHBWNkVEbzB2djJGdHNyR2t0K05pbGNFNFM1UVIwQmhh?=
 =?utf-8?B?VFBWM0pJekt1d1FkeGJqdVNTUDdSbTFMYnFid3FwYk9PdmQ5cHFkcVJNblhN?=
 =?utf-8?B?Qk1xQytuUG9DdWVMWU5RVytuQ1BVN2lmeUlJN09LeXE0Y3hQajVhTnl4dHYw?=
 =?utf-8?B?eHEzMXZLNllNVmcvYnNSK3lGTEJlWEZZSXcxR3pjUmZnZ1ZLM3oyMEJjSEkw?=
 =?utf-8?B?ZnBkV3dPWjRsWkYzK1g5NCtWNkZ3aEJXK29aaTl3a1ltUm0wNmg0RjI3R3Qr?=
 =?utf-8?B?dXF2YlVpNHBDTzBRbFNBV3J3U0lqalZkVU0yN1JqVkE4TXMrK3BpV0ZzV0Nz?=
 =?utf-8?B?b2ZieEpJOGZobUdaVk1SNkQ4UE9LVjk0Tks5MzlBRWNFVEo4cE5aRllFa3hQ?=
 =?utf-8?B?dFBKdGlZRzB1eTJObjBEcm5pWTB0YmErdm50Rm10T2NNZUhUMlBudEdzcDg1?=
 =?utf-8?B?UmNmNUZxUUFkcDRBYzFPU1BRVWgvbjliRHNCMndjM0NhR21MdW5DcE43L1BZ?=
 =?utf-8?B?ME4xRnZEUmxJNzFFSnVaWU9zaXpFM1pWTVZDWGZ2TWM1NHFWenFZdzZud25W?=
 =?utf-8?B?NmFMZDdBYkdoeFZrbGhBTmVkWlBBaXo0OFdvY09UWUdpYVdkNktRb2pyYU03?=
 =?utf-8?B?ZVBmQjVJeXBOZUJPZy9OSDAwY3ZNOUEvQ3NHaVB3bUVYNUpKZ2l0bUs1cWxr?=
 =?utf-8?B?ZmRFNkZmWnB3L1Aya1ZZQm1EY2M1YXFPVWRCeDFCSklKVGVKVldISU5IZklv?=
 =?utf-8?B?cWZzaDl5K3A0Y3dTWS9MZ3BrTHZyd0V1ZUYzZVorUXpPV2d6TWloM3hFdTNr?=
 =?utf-8?B?Q2ppcUhjOERON25GV1huc0FYcTdtZXg3NDVIcXBNMWRVWDVKMnBHY1B6NXNv?=
 =?utf-8?B?RTdTZTdRM0RBTjBQN0ZyL3BuRTRmU0NyY2NVRFdBM1d2N2FzYWpMdWJSa2pz?=
 =?utf-8?B?RmRxVng2WkxLbjZZWlZaNVZpc2dTWllyS0dlcnpNSFcxc2dhWXVRQ250Q3JW?=
 =?utf-8?B?WVo3aUhNemhzKzAweUdIWWsvUStYSjdJWVRaTE5Pem4rV1BqMDZmSUw3U3ZM?=
 =?utf-8?B?YjJkcVgycFI1RmNkMS9rYzBzWUR4VmtlUUk4OG9FNGdwV3MwQ2VrNE9raG5i?=
 =?utf-8?B?dVJOV0RleEVXV3BGSGNlS2RBSEluQ0U0STJoNjZjWHNBeldYSVlhb0V2MG55?=
 =?utf-8?B?cVZHRHlFSmhaV0w3SUFuY2IvRG1pZHp1KzZtM01oRU1qdjNiTFVSNWRZM3My?=
 =?utf-8?B?dGZZSjFPeW9yLzlOd3dXN1o1bG1BNk1oNEpEdmdCN2xuR2MzLytHbmpXeHB4?=
 =?utf-8?B?NnlJMUxsVmswQnMyRjZOM0R5TnBEUUFicnkzMnVpNnhHcmZkYm9ySng2TTZV?=
 =?utf-8?B?cVV5S2JiNzNjbmgvMDF2L1NjWFVBY3Bob05FT29pSGZTUXJXOXF2Yi9LUThj?=
 =?utf-8?B?cmpCcEFrTE80NHpvSVRMeVBxbmptUXB0RkdTQ2JISGhPMHU4R3Y5ZnowdzZV?=
 =?utf-8?B?L0xXL1FvbU16aWw5NmRtSEwzZlBsbnhlOHRsUHZ5SzNpaktIWHJEUWViV0p0?=
 =?utf-8?B?K3NRSUpuQTNORmVScUwwY2dCcHBjTVcrOEZFSTRSQUR2UG9CdmxNZmE2OGMv?=
 =?utf-8?B?M2c0QUh0Nmp3WnFadWszZ0x6ZDk4ZUExM1AyYVljT0k2VkFTeDBhZWhiWEpI?=
 =?utf-8?Q?7l2y0m7XnMXhPRffN4DD9lM71rBELB2d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632a283b-e6cc-47c6-d404-08da0b01ecea
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 06:13:32.8248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rppihUaRa0GC4ywfbNzztiHyeKIshC2MCedSJHrfBWSEIFU/1yg5pPheADS4YDuLrH5+ntt6uXwrSaXo7xgqDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5258
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/03/22 6:02 pm, Christian König wrote:
> Am 16.03.22 um 12:31 schrieb Matthew Auld:
>> On 16/03/2022 06:34, Arunpravin Paneer Selvam wrote:
>>> handle a situation in the condition order-- == min_order,
>>> when order = 0 and min_order = 0, leading to order = -1,
>>> it now won't exit the loop. To avoid this problem,
>>> added a order check in the same condition, (i.e)
>>> when order is 0, we return -ENOSPC
>>>
>>> v2: use full name in email program and in Signed-off tag
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index 72f52f293249..5ab66aaf2bbd 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>               if (!IS_ERR(block))
>>>                   break;
>>>   -            if (order-- == min_order) {
>>> +            if (!order || order-- == min_order) {
>>
>> It shouldn't be possible to enter an infinite loop here, without first 
>> tripping up the BUG_ON(order < min_order) further up, and for that, as 
>> we discussed here[1], it sounded like the conclusion was to rather add 
>> a simple check somewhere in drm_buddy_alloc_blocks() to reject any 
>> size not aligned to the min_page_size?
> 
> Sounds good to me as well.
> 
> And just to make it clear: I don't review the functionality here, that's 
> up to you guys.
> 
> Just giving my Ack on things like style and pushing the end result 
> upstream as necessary.
> 
> So let me know when you have settled on a solution.

I sent a drm buddy patch adding a simple check to verify the size
aligned to the min_page_size.

In amdgpu part patch, I have a check if size is not aligned to the
min_page_size, we are enabling the is_contiguous flag, therefore the
size value round up to the power of two and allocated, Later, the
allocated block trimmed to the original requested size.

> 
> Regards,
> Christian.
> 
>>
>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F477414%2F%3Fseries%3D101108%26rev%3D1&amp;data=04%7C01%7CArunpravin.PaneerSelvam%40amd.com%7Cf03d93b31c7d47b1389c08da074915cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637830307722869478%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=i3Pw3Go9Niu20Z4CF0IiWKPgTYTBPyK0SJYVq02fx0A%3D&amp;reserved=0
>>
>>>                   err = -ENOSPC;
>>>                   goto err_free;
>>>               }
>>>
>>> base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175
> 
