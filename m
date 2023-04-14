Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD26E2058
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 12:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6E910ECAB;
	Fri, 14 Apr 2023 10:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637FC10ECAB;
 Fri, 14 Apr 2023 10:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs+y+HTWW9VX5hAVYkPnp2F0cnredLNL6dI3SbmWy59VU0eaZdKa1zFmRlCm6va3AK0do/GtNzVDxongdtKvGqdH6+nOz6f9MnDJYy4JCOzP1Wx/gEdlH+iNUIFCcYLuyL1mj6n2hpCxO0iE/SjzY+lJuTo8jPBMQJMSNh3NNt/M7AYer2hC5ukE4A/d9LFink1mI4KCDMTri8CZrvPKOWmX/j8ccRtLNlBZgPz7ZySsOsiJWnRtMahwutOLH1oLPS34qXZ5HYQQsKRnWymifrT1rO7RZzR8nzPp8ikaLezsNgZmj/I9FxgO/L+OghZHLcxbTbYoFluIQB9wesx6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wkif7BA7QDG6TWAdI4D/nGaYLJctU71KNiSdyLbs4Qg=;
 b=Gj5aP69juTIbdIINt0uOfmaREbcQIfhj97ZOlSwLCG5jxYJrnV21sP56Cw9+5xY2971Y8I7s+u3hxe6ESLWXhMNpHqcL7v0A5RoLOJa0zVGkaOGm8P+eN9t5WAUkRYolNAbvfhlL+PWNhgc170kVZb0aYcuDxXpfJpmVPMfbCadPE+zL3eTyEiUY20cIOEPbV7PeHdZsDm/sNmb270vVP0MppdXFp6B0LRWnGrbNXhrj6VgoaC1Cqe4gpQWzDJo2HTAcdeKTArsRgh0K32Lk57Hwb30S/OT9nNGzFl5isYY0nZyOd0qYzENZTB1/98bkKUa0MGVLNtmrW/yTn565vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wkif7BA7QDG6TWAdI4D/nGaYLJctU71KNiSdyLbs4Qg=;
 b=kpmKxoBB+KAaVtH8nHG8Cm5OGmkN5IrCriZEDVR+PyORn32W8CH190cvNP/j0x+WRkmfqkRWmzXAwHvZhO578bsoXUTL+J/2e3uLXg+qMEWPWD67jPaZdGmkK9U3AEnrt9BzLzuq3tlBMAXd78lmMzf7AhImAhtTluLi0gPc0lI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:11:39 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 10:11:39 +0000
Message-ID: <8af45b2b-6c53-83e8-6f14-1e3091658e3e@amd.com>
Date: Fri, 14 Apr 2023 12:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
 <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
 <CAKMK7uEZdWjs9snGdNpzBthOWz0YSCZh-rNKOGywLWozzpFwbA@mail.gmail.com>
 <ae672182-f7a4-7107-1071-1561c49bc122@amd.com>
 <CAKMK7uFVWh16ng_tyuTu-0k4k7Wq5LjpwvJgYuidy-YVPEEQ=A@mail.gmail.com>
 <178a7ee4-1406-ff0f-4529-034f600785a9@amd.com>
 <CAKMK7uHgUuqWJuqmZKrxi2mNiqExhmMif-naYnzUSj-puW-x+A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uHgUuqWJuqmZKrxi2mNiqExhmMif-naYnzUSj-puW-x+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0d000a-21bd-49e8-a000-08db3cd0a2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LmSPf3a+OkTCqA8XjUqPfCdWuQbgn5p511n0MNfeLMPV+6aPEXF2Bupa1THa5sY14Y8RhBhEf8QN1eZD7j6AflB/RqWjVfwY2L2zZ85yiKxuhgYfavXcu6QOmAl+FT5KdP1Pz+Fk1iTw1CZ97fjx2eSqyuHgYwrf/LJBEQgICrV2YHvva/j3xB17NseLrZzQLa714Bs9Y79yctUmJIsO9MNwbVY734p+bw26ArftiA3iI+If5iXAocKCPJNqmwn93u8gayyP1skDUpeusT4gfx9oYkyohLmKKx/E8Yx5DA8Ho8lvzFxgdpgpIN/yDFMlbR5vSUBBe+zwR5AGGFdSKTICZBkGLpZYfn1leZZ9u5vGai4nmf8BDwhbvGwVeFj8FFCvvcPs5JyGcPm4Om4n9VCM6mV6sRYPLBfCdGuHOmoa7UF8lzpFBe3zN7rPnNXamebMe35J2+AwEsEMMGlR4EJBWgr7aI+DID+vQNnp73ChMHx2sKzEUXvLGdpnPXS4evThtuLnTytrky7kS3dgRoalBdq0w0GE4csZuDkjVNXLXv+Dfyyt49XEZHFBv5+nt6/pl2I4HZAUcbz03eMwevonTxkb7Q4QruBxkrbIUzWI+luGgWV0q126kIb2rfYYqxWSUP/7Wef0pH0CzqPb3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199021)(2906002)(31686004)(8676002)(8936002)(5660300002)(478600001)(41300700001)(316002)(66946007)(66476007)(83380400001)(36756003)(66556008)(54906003)(4326008)(6916009)(186003)(966005)(38100700002)(86362001)(6486002)(6506007)(6666004)(6512007)(2616005)(31696002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZLWUkvVWI2c3p1TG9wYmhua012QWNJVzZuUkV0elY4czlpVGdQaTJZNVRQ?=
 =?utf-8?B?bzA5Nnh6Q3R5cW9lN2t4U01KU0VEWm9hU1JXbkV3Y0w1cklkb291UGFqL1Ur?=
 =?utf-8?B?aXlCWFpZOE1oUnpHdldqYVY1MDc4MC9RUWR2RHlySWg1Vmx0b2NJN2dPQTBu?=
 =?utf-8?B?ZHZBNksrdXJVQlZheUJwdlR1QWc2aTRGU2VtQXBWVjFEMFV2UCsvN0V3cWc4?=
 =?utf-8?B?aW56ZjBiTXhCcGtxUzVNd1FzL3RxSWtpcTJjNjd3WFVJU0dEWVJJM1ZpN2du?=
 =?utf-8?B?QmxmcG91OVQ3SnlHZXExeVZpbkVNMURQSjdsZVVUKzNjTUNPajQyNjNGcnpE?=
 =?utf-8?B?TEdhNWNBemlmVXcxMm9oMlFSelZ6VFNVcWEwL1hEd2VvTzduc1R2aDBtNU9W?=
 =?utf-8?B?U0d1Ny9oWUdxSk4xbEtHSEhzK2FlVml1MjIvZW0wOVFML2JZMGpjNXJta1o4?=
 =?utf-8?B?eGlJeWQrQnl4TGczdmJmNE9lckkxWGJsT2Z4dVlaL0tlV05kTks4dTBCR1or?=
 =?utf-8?B?MWVqbTVZVThTSDBSa2hmbGlxWWZ3dDkwa0Rvc2xWWnlZU1drZ09HN084TWhF?=
 =?utf-8?B?TlBQQ2x3a0Nyd2hFSDA4NFNHdGxJWFhXU0MyYUV1ZXV6QXNIeEdmcDBwN3Ja?=
 =?utf-8?B?M0IwYlJzNUFIMkoxeGI5b1hwSHdRQ3FYL2pVM0NpZWFYSFpVM0VzVUpvK0hu?=
 =?utf-8?B?aDlLcjFlV08xZEhNUE1vbnZuVnNMditpMFBqb1FCVFFnVUVoMjNWK2RmZ1JZ?=
 =?utf-8?B?eFp2elVYQWlvcDBHT0VTWmpsZmczREVKYTYwb0g3SFdpZE5LYWUyUFJtQzdO?=
 =?utf-8?B?TFd1cE03RFBDeUVESkRhTHF4VHFRQVU0dDZiYTlxUkhieXlhRDZZZUdnMGtj?=
 =?utf-8?B?bm1Fdld2aUc4UDM4YjB3dmNyZkVtTHhteUF3ZnlBUTFBYVBHVlZJTGtiNU4y?=
 =?utf-8?B?c0p4VDM0aFVBbHh1R1FoeXBxUzJKd3NTWFlQamNHbzMvdXYwWklRazFIVmZn?=
 =?utf-8?B?S0U3Qkp0TVVMamh2Vkg4QU1LaVZ1aGhyU1BzMldEODNTMmM2Qk1CT25HMTlH?=
 =?utf-8?B?VlJmUFVNalhuNGhIN3pvZ29VRTIxbE92YysvVHFhKzREaDhFLzEyeGdaMTJR?=
 =?utf-8?B?N0JNNXFRVWl1VTNLcG1ETEhLY2xJS1NVVXBZbzFUZExzbnExU3pwSlNmZFhv?=
 =?utf-8?B?UERxME93cEpIYkFVdyswVlBaUGwxUTNqdUx6ZTMvaElHaXlqcVhTdGRxKytZ?=
 =?utf-8?B?WGt1eGVJOFd6T2JJeURqSmdHSDhlNlZRQi9wQnZ2VGtQektCZEJ5c3g0Tlpn?=
 =?utf-8?B?bGFKd1c4eGhNd3J5ZEw1Tmk4cGh0UzVOc3ZHL2JXaFhqeTBhNDFwcS92WFNY?=
 =?utf-8?B?L2NPOGVTSlVRMzBjOXUxV3VXbEV2UUNiYU1sNWZBbkFuTC9IU1YzbTRNTlJl?=
 =?utf-8?B?aHI1c0FQRkFLUEx3RG1tQUp1WUg2azE5S3c3MTUwMDNnOXRFQmNlb2xiOXc4?=
 =?utf-8?B?MUF3bmNQNnpubmZ1eWRIbzRxOTBNVTJoQ0FnNXdtOVV6elcvTmcvTURacTdu?=
 =?utf-8?B?MFlybTRMbWJtcXUxWm9PTm1CNjdQQ3lWT1AvTk1LUkRhUHgvNllqeFh2eGFE?=
 =?utf-8?B?Vk9UYjJTc0xiZTFsaTlSams3RmJWbVVHNGs5YkV1VDdTaVRKcTdOZ0JzbTFj?=
 =?utf-8?B?M24xYWlvWGxBb01jZGpyUFZUcTBVRGE1dHFxQ0tWcnk3TkNZdUpxVFIyVjdL?=
 =?utf-8?B?aGMzVVFNY211ZVl0RFJzeWJQZDlnVjlOM2FvbzZwZUY2Q1ZwaWVsblZ3bEdK?=
 =?utf-8?B?cndjQ3RPd3Zyb3BmT1JDaERWQmxmdFd5M2NIUG1UcE1wRlpmRkZ6MG5xcitT?=
 =?utf-8?B?OXZua0F4MzUxNWIvZ0dQRUtBeGFWUFFlUHBNNS9YaW5sWEJiUW9qRnpoOFBx?=
 =?utf-8?B?RUZwaUhyc0N6NjNDa1dNRUR3NHVMc0ZBR1NUa1ZtL25kbkdCZHBWRTBPVHd0?=
 =?utf-8?B?ZGJ0U1VLWFBmSjQ4S3JadkQ3YjJyeDFkY0NDYjdmS3BYbXpaOVllK3FvL0dq?=
 =?utf-8?B?NEtGMFFWMnN2OXNSMUl2K0NBQjl4TW5qUks3WDZmS2lXcmZtMzdKV1ZsRVdt?=
 =?utf-8?B?SGF1cFJ6SjVHdmV3YkY3TFRicUhCZzg4dGhaeWFiWWNHL1R0cUE4UnNndzRH?=
 =?utf-8?Q?8GmuX0on2hjiphLgupLpXCmIo23mRznqYlmqmYulr4qz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0d000a-21bd-49e8-a000-08db3cd0a2f6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:11:39.0067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FuiyV9wm8fJFYudt9drr9VhZqEvmzaWlGiArPAu2YKhmDBSxjJ0PGZJZxOYITsy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.04.23 um 15:13 schrieb Daniel Vetter:
> On Thu, 13 Apr 2023 at 11:46, Christian König <christian.koenig@amd.com> wrote:
>> Am 13.04.23 um 10:48 schrieb Daniel Vetter:
>>> On Wed, 12 Apr 2023 at 16:18, Christian König <christian.koenig@amd.com> wrote:
>>>> Am 12.04.23 um 11:08 schrieb Daniel Vetter:
>>>>> On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian König wrote:
>>>>>>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
>>>>>>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
>>>>>>>>> When swapping out, we will split multi-order pages both in order to
>>>>>>>>> move them to the swap-cache and to be able to return memory to the
>>>>>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>>>>>> Reduce the page max order to the system PMD size, as we can then be nicer
>>>>>>>>> to the system and avoid splitting gigantic pages.
>>>>>>>>>
>>>>>>>>> Looking forward to when we might be able to swap out PMD size folios
>>>>>>>>> without splitting, this will also be a benefit.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>> - Include all orders up to the PMD size (Christian König)
>>>>>>>>> v3:
>>>>>>>>> - Avoid compilation errors for architectures with special PFN_SHIFTs
>>>>>>>>>
>>>>>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>> Apparently this fails on ppc build testing. Please supply build fix asap
>>>>>>>> (or I guess we need to revert). I'm kinda not clear why this only showed
>>>>>>>> up when I merged the drm-misc-next pr into drm-next ...
>>>>>>> I'm really wondering this as well. It looks like PMD_SHIFT isn't a constant
>>>>>>> on this particular platform.
>>>>>>>
>>>>>>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT always seems
>>>>>>> to be a constant.
>>>>>>>
>>>>>>> So how exactly can that here break?
>>>>>> There's some in-flight patches to rework MAX_ORDER and other things in
>>>>>> linux-next, maybe it's recent? If you check out linux-next then you need
>>>>>> to reapply the patch (since sfr reverted it).
>>>>> So I looked and on ppc64 PMD_SHIFT is defined in terms of
>>>>> PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variable
>>>>> __pte_index_size. This is in 6.3 already and seems pretty old.
>>>> Ah! I missed that one, thanks.
>>>>
>>>>> So revert? Or fixup patch to make this work on ppc?
>>>> I think for now just revert or change it so that we check if PMD_SHIFT
>>>> is a constant.
>>>>
>>>> Thomas do you have any quick solution?
>>> I guess Thomas is on vacations. Can you pls do the revert and push it
>>> to drm-misc-next-fixes so this won't get lost?
>> The offending patch hasn't showed up in drm-misc-next-fixes nor
>> drm-misc-fixes yet. Looks like the branches are lacking behind.
>>
>> I can revert it on drm-misc-next, but I', not 100% sure that will then
>> get picked up in time.
> It's there now, Maarten forwarded drm-misc-next-fixes this morning.
> That's why I pinged here again, trees are ready to land the revert :-)

Just pushed it.

Christian.

> -Daniel
>
>> Christian.
>>
>>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>
>>> preemptively for that. Normally I think we could wait a bit more but
>>> it's really close to merge window PR and I don't like handing too many
>>> open things to Dave when he's back :-)
>>> -Daniel
>>>
>>>> Christian.
>>>>
>>>>>>>>> ---
>>>>>>>>>      drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
>>>>>>>>>      1 file changed, 19 insertions(+), 11 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>> index dfce896c4bae..18c342a919a2 100644
>>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>>> @@ -47,6 +47,11 @@
>>>>>>>>>      #include "ttm_module.h"
>>>>>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>>>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>>>>>> +/* Some architectures have a weird PMD_SHIFT */
>>>>>>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
>>>>>>>>> +
>>>>>>>>>      /**
>>>>>>>>>       * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>>>>>>>>       *
>>>>>>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
>>>>>>>>>      static atomic_long_t allocated_pages;
>>>>>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>>>>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>>>>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>>>>>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>>>>>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>>>>>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
>>>>>>>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>>>>>>>>      static spinlock_t shrinker_lock;
>>>>>>>>>      static struct list_head shrinker_list;
>>>>>>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>>>>>>              else
>>>>>>>>>                      gfp_flags |= GFP_HIGHUSER;
>>>>>>>>> - for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>>>>>>>>> + for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>>>>>>>>>                   num_pages;
>>>>>>>>>                   order = min_t(unsigned int, order, __fls(num_pages))) {
>>>>>>>>>                      struct ttm_pool_type *pt;
>>>>>>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>>>>>>>              if (use_dma_alloc) {
>>>>>>>>>                      for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>>>                                      ttm_pool_type_init(&pool->caching[i].orders[j],
>>>>>>>>>                                                         pool, i, j);
>>>>>>>>>              }
>>>>>>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>>>>>              if (pool->use_dma_alloc) {
>>>>>>>>>                      for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>>>                                      ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>>>>>>>              }
>>>>>>>>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>>>>>>>>>              unsigned int i;
>>>>>>>>>              seq_puts(m, "\t ");
>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>>>                      seq_printf(m, " ---%2u---", i);
>>>>>>>>>              seq_puts(m, "\n");
>>>>>>>>>      }
>>>>>>>>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>>>>>>>>>      {
>>>>>>>>>              unsigned int i;
>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>>>                      seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>>>>>>>>              seq_puts(m, "\n");
>>>>>>>>>      }
>>>>>>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>>>>>>>      {
>>>>>>>>>              unsigned int i;
>>>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>>>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
>>>>>>>>> +
>>>>>>>>>              if (!page_pool_size)
>>>>>>>>>                      page_pool_size = num_pages;
>>>>>>>>>              spin_lock_init(&shrinker_lock);
>>>>>>>>>              INIT_LIST_HEAD(&shrinker_list);
>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>>>                      ttm_pool_type_init(&global_write_combined[i], NULL,
>>>>>>>>>                                         ttm_write_combined, i);
>>>>>>>>>                      ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
>>>>>>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
>>>>>>>>>      {
>>>>>>>>>              unsigned int i;
>>>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>>>                      ttm_pool_type_fini(&global_write_combined[i]);
>>>>>>>>>                      ttm_pool_type_fini(&global_uncached[i]);
>>>>>>>>> --
>>>>>>>>> 2.39.2
>>>>>>>>>
>>>>>> --
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> http://blog.ffwll.ch
>

