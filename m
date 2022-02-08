Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C044AD382
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4ED10E5A3;
	Tue,  8 Feb 2022 08:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB61110E59D;
 Tue,  8 Feb 2022 08:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuXxksN0b0u+vb0omF4IMv5SD32SxC8jKHcS1bVKDu4+jdw1xgMq0f1YpJb/D8tr4twpYc9lCLoLPMViAp52ha7rjN/6iUgWfrvJPiH/+5s+/DJ8pidst9aM4F5iAjYcCY1pW/rXnYf4ugZrelVT9NCR0Sx4xblwKh0TnVlH/W/aP86w+/GHPpMxgeAVnbTbFNnF2RXGZn7ZnwisEwrpgxqMmCvJbhx3hJP5AkXAqIiJUQygxTJl1dtR06l2xz0FkgJi2f8X1lvPTd8cO9F23zrux/YUmjNvkzgEL9noypqAUQw3NsxAFbqPUFTdjGYKTaLE4fAs9cmdfBjoYJ/zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tyn7cxWmGX1U23zhTevKwkbhsGVR52kEp144JhyqTSM=;
 b=acSn05nB/Sa8r/wj64lCnK2VMc/65joc2UnJw/qDen9xkGvlZUqGHQDZGAYKDay5OcP9vWDN4Y/iK96gv5Pp/f4Rg+dI921SAk4BhpCIkqG/uGX9BZNHh0WF8WZvXCv2mOBnvIkJvbRO+o0wa9XT8O1/mPxNDxckQatZyQGR3z7QTPUkivmwUoQ5L4IF5i4EMOASmV42qLq1b5k9Al+hqfjLLTksdg0aheXH+EUdWxzFRU/J5mntUZpvR9pixkfpftmsQPvmIEIczI2FJh0RonRjOli/ovsL/NoP5pKmkbUgS6Y+h82uXbQclYeIj1olShbZJgGfTZD6Syr7Q2xyQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tyn7cxWmGX1U23zhTevKwkbhsGVR52kEp144JhyqTSM=;
 b=NIooCz/FdSxLu9yXFr4GeiLs4ist+Z3Gh5NZwK7GUvXTok9jn8cYCPWa1QY4PX50jLmZROC/VXk5Ax/JD40+sflBhGKbgIKLK5NY0tY/rvLihGZEzDPnKtftSz9x0xSZW2nPfbU1qpPrvi4oM9n0EhyT00nRyEA0FGta89U7IRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB4629.namprd12.prod.outlook.com (2603:10b6:a03:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 08:33:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:33:21 +0000
Message-ID: <00c5b899-ed35-44a0-6b22-bc3e882e49d4@amd.com>
Date: Tue, 8 Feb 2022 09:33:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Content-Language: en-US
To: zhanglianjie <zhanglianjie@uniontech.com>
References: <20220208081443.28210-1-zhanglianjie@uniontech.com>
 <108cc1b0-8630-7f41-5ef9-73df69d250e9@amd.com>
 <400b7279-b738-5614-dff7-0e2f6f395a0e@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <400b7279-b738-5614-dff7-0e2f6f395a0e@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::31) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90fc0054-761b-4720-b5b3-08d9eadda9be
X-MS-TrafficTypeDiagnostic: BYAPR12MB4629:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB46290449DFD0FAE94EC4F833832D9@BYAPR12MB4629.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxWdkZ2AvKe6ax/3jz9Kh1c0Ls/SQZRncVyrqombmJc0gKKIK90HhcWDCTAO9M1TZxbEhcazmnAbHkaYqw2BR7+LRh5vRVOxZ3u4iK+lzbd59sG2+NGrrjq0h+BczPPGwsENdqMXrJMUQj+8fUBWzXIhnnhCrGLF+6TL+iRcvXoI+d7Q3eHpXp1kb1C36V3JloeyuwEd+pSSvJQjl7uv5QcwlSiITfvjdr2cntCwKnOY8N4dNbT/2fFF+b31Y4TabixU5ydUtiMwdD6pfSyEJZWF1yv2yvFLamtBFpUUBWGoghyZTq9Z37SWavXOWP61dLAZCbL5vAnF2FAoyLJ0SO4beIJiaWoLEx7GbfpsoX4Y6csCttbE8CN336C9YyyiaGWlL1D26EPEXjB2hEJlQ+s6cYiX5O/AZ0HOeIapier+nqkp/x5ll6LL1yKXqCCQpObQFsYrr/SyTqPIeKaDYpn8fnViOkv4+M6Q8z1TMEHZ7TgaTO4WkWLsV408fv63LZTo22hlluCaFSmtEESrpFBZJGB1VAfo23CEyUmck7xyH9z+NCrzOjTp1q9rk2pHTToy8avVgJT3WJfQ1Fzegb3YstKcpXmrbsK+IadbQepkMr45bnZMzKfzPaSr/evnTINNBc7J6mPzNuusap8eqISgbr90+darUNMu0d5tBHno8YNNqhUXgZmHxSySigo4tj174NzRRzY8RxicRt27NRodaqS0K4LGjS/NrOb3Oo8zYKjunlz9zGVLiGDb9OH6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66556008)(8936002)(66946007)(66476007)(5660300002)(186003)(54906003)(86362001)(6916009)(31686004)(6486002)(6506007)(31696002)(6666004)(508600001)(83380400001)(38100700002)(4326008)(2906002)(8676002)(2616005)(6512007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpEcTE0SVJ4ZkpGY3h5RmZIZVAzK3h1cTlpNmpOYVYyMGkrZTV5enZNY3NZ?=
 =?utf-8?B?bGYzL012bk1vK01FckF6ZFAzRmR6b1NVeDhjOEVxbXdYU3YxNGhFTmNlWVh0?=
 =?utf-8?B?a0hUVEtqcWU4ZmZUY0VGL29nMGpPV0dLM2haOTNMY3pwRGhEeG1Va2pyOVhv?=
 =?utf-8?B?cFFUYVc1Tnhub1FtQ1RLWldnNE1ETW1YOUhZZEVaVkowdkNqVFJYNW5lN0lk?=
 =?utf-8?B?Z1kvK0diaUk1ZzlmcU41NXJDYVE4elgrTERPL3BWWDhJYlk0VzVOVVFhNlNr?=
 =?utf-8?B?cHcvLzN3VW1zRDNPRlVGR1cyUlkzck1TWFpzanZmQkJFMy9TVURTV1A0U1dE?=
 =?utf-8?B?dTFyVWR4ZGpkV2hjS1UwU2ZLRFNsNEt4cjhlU0xueWI3VXMvYzl3QjUzN2dy?=
 =?utf-8?B?cjFpb1hxWVY5UmpTWng1djFIT3FCRllHd0dWZ29DeUduRXZhMFUwRk03WUVZ?=
 =?utf-8?B?Z1VmaGtBbVUwMEdBU0VoVm8zanNjcW43eHcwbWVWamlWaG5pRnlXaEJ4RzZl?=
 =?utf-8?B?Mk1NYm1hWFVIenV2Rmk0Wm11Z0VxcEROUVQ0SjY1a1hycTZBVDAvWERLdVJQ?=
 =?utf-8?B?a3MyZ1pGdHNWYnlBMGgxZi9BNTl0d2xveHJXZlNjeDFjZzhJVEJFV0Mxd2sr?=
 =?utf-8?B?MXE1N3IxK2d0MWxweng0aUxrZnlUOGVDL0VkalhOb3lLNDdqdm5LeHFHdjhi?=
 =?utf-8?B?OTc1WWt5U0YwejlyU2d6ZWFFVEVRSlBDUlRhZmZLRkRvN2U2Y3VjS0RBdnAw?=
 =?utf-8?B?T3BmSU11UTJ5WDNnci94NkpwYUt3L2dnQUJpbjNRdmlHeG9tN21KOEJBQjlo?=
 =?utf-8?B?TnljdFkvY1hhOVdwdFV3YUVEWmJpT2hGenFSMXZhVmhhZmllNjMyUHByZmo0?=
 =?utf-8?B?Mkc1SFp2VXZLejlHZ3RheDdJL0ZpMlpxK2pZVHBkWlZ4WjBqNGxFL01sOU85?=
 =?utf-8?B?bVkxbGUwZlp3aFh6bTdwUXRBaEIxeEdGTGZ0Q3pNN3JGUjhzREl1M0czMjUy?=
 =?utf-8?B?RURWdXhtRVZOWXVrZVdZNFhkSW1mbVpPcWV3ZFdybExVM011dVgxS1ZZQ3hB?=
 =?utf-8?B?ckJSVDlOMjNpV043bno5Z0RtTXNpczRVTHVZRVVBaS80elIvMFBmS2hRVEtZ?=
 =?utf-8?B?VVE1eUNETmo4SlJSQ1REVGFMenpyVnFXRGdtT2k2YmpLZ1pDbjRNeUQ2aGZt?=
 =?utf-8?B?MjZnSEMyTTliZDN0NTg1VFM4VVpLVlo4RzJHMjZydXJCbjNhY1NrR0dtVWNQ?=
 =?utf-8?B?YmRzdGlNTy9kOWk3akFjTkVBa05pUW83YU9rUEs1Q3I2dGpuMERTMmNHZHcz?=
 =?utf-8?B?TGtyeEtXMzFCNFZ5MUVBbzdsM3liRFIvR0c5Zm0yYnZxeWdRdjB4SktHdFdN?=
 =?utf-8?B?TTVUSjhNUHcrME1sNTdqN0lNZHJQektZK2xNSWZzdzFPKzMxang3MWg0dFlk?=
 =?utf-8?B?WXNZM2ZqN0l6c0VJWVVYQUxLelFiaUprdW40cG4rK2NjakJ2U1dEaHd2ZnUz?=
 =?utf-8?B?M1ZwbDJQd21xeU9HemZUaVJMK2pEYnZXWEFNc3JvY1YyYUswQ3V2UEJmQ29a?=
 =?utf-8?B?T09KUjk2emt3OUpGSCtVd2QvYVBqMnVUTkNlUHZRbnJrVHJ6MmgwZkJQS2Yz?=
 =?utf-8?B?SUM1TW1UdUpYMDAzeUFWWHZtVThmSmJ3dzNpUnBQVUhzWi9McmJ1eEx5bjJj?=
 =?utf-8?B?Y2tuMW9LN2hkS1dFUHgvcGxXeGpCSzN4aW0wc2FVakFXbUpZcnd4VlQvZEpK?=
 =?utf-8?B?b3hrM0JGYTBWa2VuWXV2NHo1SlJMVENjVWp6Zk1WS0xUNnowL3FHa1dWT1Jp?=
 =?utf-8?B?NGdzVElSa29FeVdhdGRXcnlYdzkvb3R0QlFkWGUrOVhIdHhEK2tLSnA2UXk1?=
 =?utf-8?B?cFZuS3lhZVVHRDlBWHlWZXNsQVF6UUFNVWpBbGwxbWVvOEZqSHBxbmJCcTd6?=
 =?utf-8?B?M3hrOUJ2R05xeURNNDZOUmowVERKYTNsRGp4cXBacVhXOENjeFpKYTV5WDFB?=
 =?utf-8?B?aUloMURIWWlYRkhoSEF3RzZycXZwQ05QZDhUSW51Q0RxQlpGRk5OZktFdyts?=
 =?utf-8?B?bVBsWnZLZ2g2N2h3bGRDeVlkOVFsZWxDMVIrUVc3VVlQZnZVSkRrdmRXV3g3?=
 =?utf-8?B?ZUtEYldSQWtqQzVlWW1WZlBjK0NFSmZSR2duVDQzRGhQK0NKRDhtUXJIbldO?=
 =?utf-8?Q?EyCZq6v6ERZBjH2jBykLGj0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fc0054-761b-4720-b5b3-08d9eadda9be
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:33:20.9124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2d8hgc8K9Rl+06bmh/JRP5R5EdLhPFbDwAfOAdIdz0tEHe/uKHOVk/tgKT1SAuM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4629
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
Cc: David Airlie <airlied@linux.ie>, PanXinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think so, Alex will probably pick that up.

Thanks,
Christian.

Am 08.02.22 um 09:28 schrieb zhanglianjie:
> I am very sorry that I submitted many times due to the character 
> coding problem. Can PATCH V4 be used?
>
>> I'm scratching my head what you are doing here?
>>
>> That's the fives time you send out the same patch, so something is 
>> going wrong here :)
>>
>> Please double check why that lands in your outbox over and over again.
>>
>> Regards,
>> Christian.
>>
>> Am 08.02.22 um 09:14 schrieb zhanglianjie:
>>> after the buffer object is successfully mapped, call 
>>> radeon_bo_kunmap before the function returns.
>>>
>>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c 
>>> b/drivers/gpu/drm/radeon/radeon_uvd.c
>>> index 377f9cdb5b53..0558d928d98d 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
>>> @@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct 
>>> radeon_cs_parser *p, struct radeon_bo *bo,
>>>       handle = msg[2];
>>>
>>>       if (handle == 0) {
>>> +        radeon_bo_kunmap(bo);
>>>           DRM_ERROR("Invalid UVD handle!\n");
>>>           return -EINVAL;
>>>       }
>>> @@ -559,12 +560,10 @@ static int radeon_uvd_cs_msg(struct 
>>> radeon_cs_parser *p, struct radeon_bo *bo,
>>>           return 0;
>>>
>>>       default:
>>> -
>>>           DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
>>> -        return -EINVAL;
>>>       }
>>>
>>> -    BUG();
>>> +    radeon_bo_kunmap(bo);
>>>       return -EINVAL;
>>>   }
>>>
>>> -- 
>>> 2.20.1
>>>
>>>
>>>
>>
>>
>
>
>

