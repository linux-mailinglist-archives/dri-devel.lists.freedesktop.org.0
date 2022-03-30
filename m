Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879944EBD39
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EB910F822;
	Wed, 30 Mar 2022 09:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE9710F81D;
 Wed, 30 Mar 2022 09:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuG+WwUm4ZZQZsOq6oEgug09jheJVcmdeBJZL/zEPJJBqaT9FmqwD5snpQ8PbjQ8iYLc6gUtEkllxHxYu1gW39uXZVtqh1baoP8aWVkm8mFx8+rXayvv9IVv79I5qCJcRd+iJZ916OnfaQfnpv4FpqtSNi09bzBPeTMk1cf5AO4rbh1W107TKDgRhTtZFypUVw7HavhQSDQb7ebKBde3kBtKEYNvRqfSw128qgIFAJpKL/R58/9v5BuzR67ARUV1mjMUAldq46ckLN+PloXSwKnNDp5bk4tnC6KCbHJoTFtzIXeo2hZY4fr25504YzgAG1Qq5JhUf0prMVynLEWvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEr87n3X0MWYNN387CER/UKraQZ+vZsu0nI1JiJT6A4=;
 b=YLq9QI/t+qT0+bRT4VGn+VBqSej5MHBXiTRh8wSBZy9b+XbGJdmgiKShNVZcNFNeAwznW3ZT7R0CzuN3MjeVHlzxvVH+u0d35BaHYbv4nsRES8q49smN/xFmHVh77qS9KKe+F0/ZKsxwaxzGpHd4qValiQk+iTQ5LTvw6TbfPAlobizlTD+5++dk3gUaubQZZsNgCyG/6BqQolShwWvNuTOpZ4xtZtzggOpQ+WDrALdFkP4lMpqGQucDTQOqhlMhZXWCpHo6djKgssUj3heZ3CqQthQZ19tumCZ5xF0Tiv6UXkB6JNlQdNMNd6RgMr6cnQZF5ln7qPX5qsDLc8fIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEr87n3X0MWYNN387CER/UKraQZ+vZsu0nI1JiJT6A4=;
 b=WwRGIPGl++oW2n/BV8j7Cemz9UHirVu+VfDoiPZ6OcIQugxPrTvJ5mdUDrglQHs4hYVsho1ASF8JxBf1B9jIlOC09W0yOsOc0ga89bBb/Ql2TmwATPwYBUUb9vjr/huVBQLoPh71KdYWi4uV52m9Vmss+USc/uKnkRWE4nbMhbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM5PR12MB1898.namprd12.prod.outlook.com (2603:10b6:3:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:07:27 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:07:27 +0000
Message-ID: <f05553f7-f49d-1803-86bf-1e9de37455de@amd.com>
Date: Wed, 30 Mar 2022 14:47:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: add a check to verify the size alignment
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220323073426.228866-1-Arunpravin.PaneerSelvam@amd.com>
 <72e9b499-f31f-41d3-aee2-130f83115fc1@gmail.com>
 <66f75c1b-41e1-5f96-cad7-aeffb95ce712@amd.com>
 <CAM0jSHMZUUj70JCMDogWdzxxk1sJj7MsVprTkN-bnSUeUg1C6Q@mail.gmail.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CAM0jSHMZUUj70JCMDogWdzxxk1sJj7MsVprTkN-bnSUeUg1C6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f896d3b-cd35-414d-4a7b-08da122cb61d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1898:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB18981FE6D84046856F8698E5E41F9@DM5PR12MB1898.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLUMvFyamuCLNX71Axxcvo4lnh2rLurq5FQ6/GkmY7bVVj7dU0UNM/z15CgTKyB+8xJZ8roqptn68byyxt1selTUDXtXhW1FcxlSliKnn4rZ2ziY6sIM9Yja5NB84Z3DgiBQlFLoi9S39qVEXSJDwTfjPqzr+9s47+pt0GcshLzTjnSYTETnTPAG3Qmoq0Jf2QugUd+dYibJf/78lBne3Fu34Nj93F64UP0RuxF1OsOxUwuL0fyftdzt387YJfUz/6IBSJmbyOm4TegZR4f+f5iovszZl76zb4d2C4XhIa9leDLAaWCWYFU7MymH+TuhR7vvB54tQXVRmggDbakx6vr9XpDtC7OVbKZu4OVCJJJtjfsnkBKalpf3ZJbAHJ174chYejukBA8MxQ9nWBZRtNaMNIbpcgupcPmoamqUBV9UGcTJJIJxcuRn504Kbj49gr4f5w8oFRmZj+xcIB/Ht3m1Hsr0YuLmwlhbGeTRfpLYCEw/n6+k+DZ6ddzDnTYT9X83M3HpXmUFMh2XQ8m9NzxqZoXqDCPZccSTfJu9zO1uu6s+mknr/5SJeAcGZq11wsJ3YrsHGx84CMtcKB3I0DvX8HyTi6rahG3DwT8rIkUiIBLDMhINKyz2qkIhgZW9jzY4rh2vPXVzeceJL+XkZvx4/rwchgIDkBQlp1N2e2ZuHXyxzRgnCEWTW5s15ZlOUAUD62gBt7E7T0XvQU9kBAYqNeXji2uE/Jw/Yf+ocSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66556008)(26005)(186003)(83380400001)(38100700002)(66574015)(66476007)(5660300002)(8936002)(6512007)(31686004)(316002)(8676002)(54906003)(53546011)(66946007)(6506007)(86362001)(6666004)(2616005)(2906002)(6486002)(6916009)(31696002)(36756003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWdOeXJiVFYvRWRGc2tzc3NHeEhtbmY0R3NYOWxBbm1UcnUyT2hQb2FrRDUr?=
 =?utf-8?B?eVNYRm1iSXRSaXFFOWdHdzIwK0w5SXFLK3pzQlprMmtNT05PbG0xS2RmU2hX?=
 =?utf-8?B?am9OTExSUnZSMTJ3YWxSREVOeHVJSW9iZDk4bFAwME01OEw0bklqdk92VGZj?=
 =?utf-8?B?ai8yaURva0tYWGdhbzZtT1V5UUpnOEhRQkFES205bzRrNVpDU0RrYmcvQTd1?=
 =?utf-8?B?UUxjY3hnRzhmeER3Wm9SSjVKOHA1dmlMMTlVaW5pZ0RQblFWbjM1ak5iM3JB?=
 =?utf-8?B?WDNxWFdaNFRzU3RPZFB4dzdzaUtMVisxR01xQ29BeitDZG9IMUcvMHJTTXVR?=
 =?utf-8?B?WWJrbVczZkZiNVlyOVlaQWI5UXJzSC8yZmxsNEFRcDBaei9Bb3ZDZG8weVRO?=
 =?utf-8?B?bk4yVWJUZ2xCa3huYUJLamZpQjkxc0FtRktyS0FqVG1YaE5XaExoMU04NXo3?=
 =?utf-8?B?VldLd3pQZ2pwc28xSGlXVGVTLytpTzVML081Vkp1Z1A0c3ZaTFFvR21oWHlR?=
 =?utf-8?B?a1k5SnNMMXdvTmNqb2I4WlFyaFkvckFtdG80cGxRV2h2VHhSRXVDbEJOdi9N?=
 =?utf-8?B?Z2kxQi9rUjNTUCtwcVMwM1M5Mmp2MExiRCtoOW9NZDZQU1RVK1dzd3R1Y0Rs?=
 =?utf-8?B?SzFPcHFmSGpoZ2FiQlJRRHBVTFpxcUFoNTZpaklyQVV5SVpUOXAydFpaczRQ?=
 =?utf-8?B?ZVB5Y2RyT2ZHdHJ6STFyQ3RWaTVsVmJOVTJsRDhyeWE4S0xLZDg0OWJqTTN2?=
 =?utf-8?B?RHA4aXFPVUdwelBmSDNzY2lmUlNBRFVDOXJMQUsweVJMKzV1RUlsYzg4Zmpm?=
 =?utf-8?B?MUpzNmpVZFBTK3lvVDlsUWt6aWI5ZXJyMjVnUHh1Q1o2OG92bHJKRmR1V2hq?=
 =?utf-8?B?YzNGajdycjBZQ29XZ2w0TzhwTkErU1hjWTJVdDlFZ0M1VDNyZ0ZhWlpLZi9K?=
 =?utf-8?B?cEpaYmt5SFpkNmV1K1hGSWNRTGtLWDY2VGhReFNjTkk0aTFocHZITzVNeHMv?=
 =?utf-8?B?dHU0aVgzNkV1bm85bURLZW1OVUJlbFBJaUI3T2NnU0R1Y0Fud01jcUs3aCtR?=
 =?utf-8?B?N0pGT2tVWENtYkpuK0VjcmRmUWorS3AwL2lGSUFaeS9DcTlhb3RqN3BxM05N?=
 =?utf-8?B?ZVRqcjU5Wk85dURqSEdUNWRXNUpzeExnTXp1bzVVSzN4MWFJQXpJNmFFQ2dZ?=
 =?utf-8?B?R01VbHhQR2tsWDJGT0lqSEhYTUM5eUk1c3QyVnpnb0svbXgzSFpHNGN5ZmJN?=
 =?utf-8?B?cERXUm0rVFZjeldOZnhUZ1ZlUERHSEUwOEdUN3hNZmc3VlRvQ1lVczR6eTdo?=
 =?utf-8?B?a3pWWjJyUzJLOUxhVEVxZ0Z6OGljVk1DYXU4aVZSQUJRQXJxVWJ3b2tCb0RG?=
 =?utf-8?B?bktMRituY2FDdjhEZ0NmSi9tYm5Yc2NsV0V5UmxLMmp2TlIzMGFyK2o3Yk1x?=
 =?utf-8?B?S1pTeDdvQ0dRRHVBUDcrbE1URG9aSHZERzVvVk1KOVFtcllMSG41OTJrYlJZ?=
 =?utf-8?B?RW5ZdzRsSmdOb0FqNkJxZnMyNzZsbUpBYkh6T2ZaVjhyeWIrdEJ4c2x1Y0tq?=
 =?utf-8?B?Znpxd2t0MmhZRjhibnRVc3k4VVYwUmd6VUV4OVpuUHE4YnlnaU9yVUhVelIv?=
 =?utf-8?B?dVY2a0NOSTV6RGFxL2xVdFhQTHVGWkI1YlRsc3FBcGs3RlZNT0J2dGpGS1ds?=
 =?utf-8?B?aXR4NU1ITnBKblR6MzBiTFRiSnJoWGFHbnlwQmtLekRlaG1MdGtYNWZGbkVX?=
 =?utf-8?B?ZEN3U0hxVkVHQ2dENlBwUG84UnF0VDZtWGVpVUYyRGVqL1E4SU12cmhlNEtp?=
 =?utf-8?B?TXBBT0JwZVRUTUw3VTBzMHZkWHMxdEQzcE44V3Mzbnc3SXFNdENad3g0M3dJ?=
 =?utf-8?B?YTNiZGdvS3czWHBPRHEvQVJyRytEbmJTTElEL2FNQkNtN1FwTi92ZGo0NUdw?=
 =?utf-8?B?THdMY2hZd3ZpVTlaQ29jY2xPWG5qUm5hL2FuWkZkWXZDVFpZbG1kWXRzcWY1?=
 =?utf-8?B?TmtxbkVjTU9Yc0dyRmVvL0tmTEkzRmJrWk1zcjRxM0FQWnExQjYxWTZGUm14?=
 =?utf-8?B?Y21zb1BnT0FIS25xbkF2cWxJVFdqeG1HQitrMmNVTFV4bzZjS2EySWFBOWg1?=
 =?utf-8?B?VVhBcHRXcUsxRUtnS3BXcVc3ZHZJNHVqZG1FSVVsVENFTG8rb0pVY0M1T3pY?=
 =?utf-8?B?T04wLy9oUWpOdm9sVFlkMk5vTUVHbElUNVFNNkh2SHVscHJnU3lOUXhibER3?=
 =?utf-8?B?UDhRTmhyalIweFpjRWNYTUhlcTA4QmtkdE5lL094UlhGWGd5YUNWSnYxUnAz?=
 =?utf-8?B?ZkFiWjJJK0xFNVRCbVJ2cy9YTXhGSm9hTndQcHhmT0FrUi9ZcmE1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f896d3b-cd35-414d-4a7b-08da122cb61d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:07:27.3641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al8hjC0S3BmrwWvWKbWC8EkGCHNZdJLAXF5W1AFENUrtkc4nt0KCmGdOZ9/sFizo77ZIsgZc1R+FvNxFUT9T4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1898
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29/03/22 4:54 pm, Matthew Auld wrote:
> On Tue, 29 Mar 2022 at 12:17, Arunpravin Paneer Selvam
> <arunpravin.paneerselvam@amd.com> wrote:
>>
>>
>>
>> On 23/03/22 1:15 pm, Christian König wrote:
>>> Am 23.03.22 um 08:34 schrieb Arunpravin Paneer Selvam:
>>>> Add a simple check to reject any size not aligned to the
>>>> min_page_size.
>>>>
>>>> handle instances when size is not aligned with the min_page_size.
>>>> Unigine Heaven has allocation requests for example required pages
>>>> are 257 and alignment request is 256. To allocate the left over 1
>>>> page, continues the iteration to find the order value which is 0
>>>> and when it compares with min_order = 8, triggers the BUG_ON(order
>>>> < min_order). To avoid this problem, we added a simple check to
>>>> return -EINVAL if size is not aligned to the min_page_size.
>>>>
>>>> v2: Added more details to the commit description
>>>>
>>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index 72f52f293249..b503c88786b0 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -661,6 +661,9 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>>>      if (range_overflows(start, size, mm->size))
>>>>              return -EINVAL;
>>>>
>>>> +    if (WARN_ON(!IS_ALIGNED(size, min_page_size)))
>>>> +            return -EINVAL;
>>>> +
>>>
>>> I'm not that happy with the handling here.
>>>
>>> See a minimum page size larger than the requested size is perfectly
>>> valid, it just means that the remaining pages needs to be trimmed.
>>>
>>> In other words when the request is to allocate 1 page with an alignment
>>> of 256 we just need to give the remaining 255 pages back to the allocator.
>>
>> In one of the previous mail Matthew explained that i915 expects to
>> return -EINVAL error code if size is not aligned to min_page_size.
> 
> We could also move the WARN_ON() into i915 as a separate patch, and
> just change the default buddy behaviour to transparently handle the
> rounding + trim, if you prefer. I don't have a strong opinion.

ok, I sent a patch handling rounding + trim in drm_buddy_alloc_blocks()
function. Please review the patch.
> 
>>
>> can we just modify in amdgpu code where we round_up the size to the
>> min_page_size value and keep this error handling in drm_buddy.c?
>>>
>>> Regards,
>>> Christian.
>>>
>>>>      /* Actual range allocation */
>>>>      if (start + size == end)
>>>>              return __drm_buddy_alloc_range(mm, start, size, blocks);
>>>>
>>>> base-commit: 056d47eaf6ea753fa2e21da31f9cbd8b721bbb7b
>>>
