Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8F859B77
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 05:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C67A10E0B8;
	Mon, 19 Feb 2024 04:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CDrcIMa1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137010E078;
 Mon, 19 Feb 2024 04:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SujN5MPt6BZ0sdGysaAwa1Ixr84dF4xYLSKt5gyUp0m7Ya9lhA262Ts2nqAZBuhaDiL8t+2Wh5yun8tZl00P0GmE4vDHyL1STLvOSEf+gdOO4TPXSjFSTVOadawJXo0YPTF7soHc7c6QC9/Akf1xMVOPNRBhfO6LenLVvi5pNEIM/mNMVr6VSY+uELAU3if+LI5RV0yG7bWSfQyjFfhk0Ksq5WkU4LV7eRbGN//Th3XFASOUVMHQD8vZrvtHcGZwOqgz/DUQG47vZ+wvp+5pPMXCIFhAX775PXz6zOex14YT0ZazuDtbRhTja0hRQMmBfT9I1RfLv310khm2OppHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZSGItubn4swwZJyILwzPCUASoWftue/ucI7QOS58Jo=;
 b=LEsARkspRA1aQnzQVH0dspem5Yx6O3+BJqX/l1RYw05LXH01aa2RA/8Jxl9pgALHaj/jk/BM+q1jADPJAg5PGxzqEliT+fc4agWloqN0LaLIplQhl65tGhcWhLTg9woLFrdywDsRDz3cEwdk10vvK9LYGivHy91MZvwXmBAMnPS+eQ2RTwBzjcmNuV/02d2kizYONovw8gsPmRIi4L1aDPSV1NhlSjyNetyr+6gxHOTldXo2fTd33vOUUYoNAAsTy8Q9Yb0qVLCPWjBIWWpSLUL7Pmxl6TINALD0yvKVhwy7WK8dQJHAMKHvZ7th1hNgC3IWJrU+IQHgK8y7PpRjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZSGItubn4swwZJyILwzPCUASoWftue/ucI7QOS58Jo=;
 b=CDrcIMa14VRz35kpzrip73dBcwUUft/K2ihNigvR6wyAXwRt1n2tPEHSsmQNL4JvVIfM/c0KYUTofsV5KteRJrjGw5Fk+Rbhl3c3oJOeMR6TN0n2BeYY8AmnyEpqs9ydRotMzVbLRURhPHY0Tk3CbY6wQYnpVP0HbewGXULuZgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 04:55:12 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6%6]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 04:55:12 +0000
Message-ID: <dbc0f30e-2f5d-683c-116f-78aad68f5a29@amd.com>
Date: Mon, 19 Feb 2024 10:25:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Modify duplicate list_splice_tail call
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, mario.limonciello@amd.com, spasswolf@web.de,
 stable@vger.kernel.org
References: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
 <bb158180-c354-458b-8aab-bb224bcb3fbc@intel.com>
 <210c7dbe-7357-47f0-a40a-0c82c3cd96d9@amd.com>
 <fc77efca-137c-4d39-b74a-6a3e1ca39987@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <fc77efca-137c-4d39-b74a-6a3e1ca39987@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d773597-b04b-4996-a0c5-08dc3106f45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3+1wZS0LUNJBIe5MO2OcjELDJCqYJzuV8+Y3VDl4ZsoIe4QGx8LJxsiEs+vWx8Za4XuuaHILrXB5dPb+Ep3p01e3uN90JfNcVV2klVnISu0QSpa0U7WMocv20ndZ5sURBbq5oA6qOYVw0Z5JNs3aeAz4rT1Muf99/QZ3hU/+iJ8npeqR9WDw/Lpl5o5BHS9oxMweghbkOwwshc4nqTVQSSLVrq5VyuwqpF8rxpnCWA+K/S5QVs86j/fwFqYOqpoJN9kStSlwCVhIq1wijDuzSOnqs5oYbPsxeNbBvdbmEhQk5N/xy8oyyJkoYYyoQZi+85TgBkpV0kQzg3kVlrtuVVq5RNRyry0HeH9SZClMWjHuZLV3tqlbhbn6Z9k5E5tRMjDQFqwM8hXubZ1c3Dg/mHkKgDC+YNjCCNe0aYZQFxa48ugnpJnLAquaCfyd8QEsOD2T+rnHTLy4az3vlecD9qOyPySx1hCDouV9cBKzXhzFvzyBc9T5JfN31SPEfSa9eK1R/gqNlYW5oB395tW6oai41L0eWlu3vKS+3mz/8M0mPQKgrL+xJTyhbH+ucdt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(110136005)(316002)(41300700001)(6666004)(2906002)(66476007)(66556008)(66946007)(5660300002)(4326008)(8676002)(8936002)(83380400001)(86362001)(31696002)(6486002)(478600001)(26005)(6512007)(53546011)(36756003)(6506007)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmd1NGlGS1RoYVZGNS9LZTBHUjFVR2RabzNiV1g5K29KQ2lkTXpwWjc2YkV5?=
 =?utf-8?B?TW5qRzNmVjdOMmlQWXh0Q0VzVWY2c1BwZ1RCUGJ3QXpZOVRHQlZFTk9wbDhN?=
 =?utf-8?B?WnpKRkw4ajlQd3RJNWRzSGw3WDh2WWVnNUJ4eUtiOTg0Mk56S2Fsd0NNaXQy?=
 =?utf-8?B?MTJRN28vVTRldzg3S3dQeUt4VUU2SDVmS2Z4cGUrLzVpcmdpMHZQOEE5V0RP?=
 =?utf-8?B?NkxhMGo5ck1ManZrbWZPclVOYVp4WWw5YytxZ0NpTzZMbFAvbGRuMUNhREVV?=
 =?utf-8?B?SFUydkxJVWJKZU9HL0pZT25oWkNaMGlnK25xWGZ1VWRWQzR6am4yaDhTNnlZ?=
 =?utf-8?B?QkN0QjUzTUlNbWlGWjdKNDY2a2FSeEZYbXM0dzdSVVh4cGFpTTRsQW9BWkcw?=
 =?utf-8?B?YklhZEhjc3NrWlVmd1NjbmhuUXBUejhrNnk3T2traEI1cFBOaGsraWxPejhG?=
 =?utf-8?B?NUVja3NObklzOEdJQ1hON1l0L2pINnphQTd4aEZQbkM0MWNPNW56STNvek94?=
 =?utf-8?B?VGRMRUJkU0JFVmN5Z3IyU3JMZ0RZL1Z2MGZnL0pMTHpVVWF4cUhUamVlaWQv?=
 =?utf-8?B?Vjd4cUxBdHA4SlZwS0o1dGwvajFQcjVQSGNzZS9UclZvL2NXWHVWRDN5bC9j?=
 =?utf-8?B?ZzY4Y3RVaDJvNTZBZzY3NVhPd3NXa1V6aWtqTSs2bUVwb3g5ekc3OXEwNXZN?=
 =?utf-8?B?SGdsTmhWMVJSODRZK1Z6bzJZLzZqTzhZWlBHL0I1ZWRQdzBkanlBcnRXUndM?=
 =?utf-8?B?Z0luRjROQmhmUkMvcU9aVnU4TURrM1d5WWt1eEFEK3JxTnYreUs4QzN5K2k1?=
 =?utf-8?B?b3o2bnJjWlloU3p3MFdyV1Y1ZlpIbXI5ZG81VVBQbWFHS2RJZzNrb0RObGcr?=
 =?utf-8?B?MXhRNWFaWUZCa1EvNU5WdHB4STBnNDZMbTNXdU5JWHlTQnVPZUF6OFpsOWZ2?=
 =?utf-8?B?S3A2MnBieUVZeUxBZkRTcEp0VUI0M2V0WE0xMTBSUUlOSitjWTFDSHpvY2NN?=
 =?utf-8?B?VVFwOVhqVk5RQjFmQWI1REFmZmFRODNRT21jL3lIZ2ttTkpQcXVjUFJIcysy?=
 =?utf-8?B?OG9adzRieG5YM25mZGZ0U2JuMmVuV3FPUjFUckx5aXhDamVrNWhVRk85VWpZ?=
 =?utf-8?B?SG5nMU1tVFRhQUcwR0EzcXN2ZjVXOUx0NElGRXF2c2hSeFEvRjV0eDB1R2RO?=
 =?utf-8?B?Sk9CTVoyeHpNckM5cjR2L3ZTeThrWmpjQXhZYkRVM3ZZUkNGbjNmUk80TFoy?=
 =?utf-8?B?c01URXVubkZiWTdjYkxydVRYTDFZQjJnRXpGQkNCYW1QVnNxbXF0OXZnaWxt?=
 =?utf-8?B?dVFnRWw2UURYNnlsQUxaYXRQYkUrSWNKQ1k5WG50UzZsTkIwc01jeUtSWjhv?=
 =?utf-8?B?Yys3REpJdXF3aTZKTGVLTFpUU0RLeDhNVzF1RE1GcGxEYVJsOGttbUZxczlu?=
 =?utf-8?B?MHJNaXdLZnhseS9JaStvNFQ5S3ppL2wrcVlJblUvU1RjTVVrODhOOFVDRVlB?=
 =?utf-8?B?N0VuTnNFUVdBQ3RXd2RKQk9tNnFDdjVmbmhNWGN4S09wdzlYTzVCaDE1VDlE?=
 =?utf-8?B?T2FOVXpZYzFNRnVtY3BoZkFjYzg3M0YzWlpLb1hPeG91ZTlDTkYrRjJGZzVv?=
 =?utf-8?B?N2tJNGtKU1NVaWk5eWJSbkpHWkJYN3JOd2JKSUVBRVExSTdTRGxXRHN3R3ZH?=
 =?utf-8?B?K1BBamRhaHl5TCszTjJIK210S1Rsc3dwQjAxUno1eThnRGgzK2YydWVLeGhI?=
 =?utf-8?B?NkFWTm9DT3B6SCtBcjNqaCtnQ1dibWpMdUlnRkRRMFJKWVZ3Y2VGVkJlNEpr?=
 =?utf-8?B?WjE1VUFyWlk2NU9GeVJmUkpIeUZEKyt2TUY1dnhpUWZ4b3hqc0NmZ3NPVVVJ?=
 =?utf-8?B?UTZ1U1NUdFFlQnVGOFBOVjNSSHp4NmhZd3hzVDhMTG8ybUl1amRGbFllVmcy?=
 =?utf-8?B?OTNGZHMvOXdWSy9Xc1BrUVprT2w1Zk9QdGVoL3ZBTDM1WTZrMkZibHpwa2Js?=
 =?utf-8?B?eWFvSWllcTZzMW4vUTNTdTczVXJMa0owZlJ5NFBXaUpDZGpJUGc4cldaZEc5?=
 =?utf-8?B?dk1ralVMRG9mLytsYTF4RlhqV0prcWkvNDVYcStkM1g2K0Y3YnF3dTJqOFdm?=
 =?utf-8?Q?j7097sIZEj/21qPWXToXuFNQ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d773597-b04b-4996-a0c5-08dc3106f45b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 04:55:12.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1wP5uA3GQDQBznA9vvmyYJVhU8d5jDU1DoYniSKu2zRcegrzsGhaMkj2xR6IXhmBnDl3iit3cL/QLDOC/s94w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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

Hi Christian,

On 2/16/2024 5:29 PM, Christian König wrote:
>
>
> Am 16.02.24 um 12:46 schrieb Arunpravin Paneer Selvam:
>>
>>
>> On 2/16/2024 4:41 PM, Matthew Auld wrote:
>>> On 16/02/2024 10:00, Arunpravin Paneer Selvam wrote:
>>>> Remove the duplicate list_splice_tail call when the
>>>> total_allocated < size condition is true.
>>>>
>>>> Cc: <stable@vger.kernel.org> # 6.7+
>>>> Fixes: 8746c6c9dfa3 ("drm/buddy: Fix alloc_range() error handling 
>>>> code")
>>>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>> index c1a99bf4dffd..c4222b886db7 100644
>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>> @@ -538,13 +538,13 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>           list_add(&block->left->tmp_link, dfs);
>>>>       } while (1);
>>>>   -    list_splice_tail(&allocated, blocks);
>>>> -
>>>>       if (total_allocated < size) {
>>>>           err = -ENOSPC;
>>>>           goto err_free;
>>>>       }
>>>>   +    list_splice_tail(&allocated, blocks);
>>>
>>> Sigh. Can we extend the unit test(s) to catch this?
>> Sure, Let me check.
>
> In the meantime I'm going to push this one to drm-misc-fixes.
Thank you!
>
> Regards,
> Christian.
>
>>
>> Regards,
>> Arun.
>>>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>>
>>>> +
>>>>       return 0;
>>>>     err_undo:
>>>>
>>>> base-commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea
>>
>

