Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFE6E0A76
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA1E10EAA0;
	Thu, 13 Apr 2023 09:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5268710EA9C;
 Thu, 13 Apr 2023 09:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksed7qm8+DI8o2ekWTziZF+yVDiLtPq4lz/DD8TL3ZE2J8sEsInB+lMoIzC/L4U/feg+bandivkL3zbzvOS3vP2Z5nGq09OQs4bg0v/gMI366J0REHxyPEWdLvB55rGYxfvn3Z0+HN5qOHDLtmT7rYxCt0qpmeeNSa1tf+Jq3YEnS7YVnrpisxsoxBW4XVyUw5AbW8529frhGMD8MprVkRQOrTFeiayPy0LmWdDSSjI7lWHRIpJmijNmmROGggIsn1FqQBxqJr10+SfqSIaXBTGKRYSce2yt4mSy4wgpivAUXTUz2fUG/V5nGECas1wMi/mX+Vwzn3Ei3973FEVVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGBAZqIvRq021UuoDRvOyRPjqaSuQLnoyu4DbRMt5JA=;
 b=iGKY+7FCrjcVjbI1ZYRnPGwG+hdu5DrNXxFUuA71hUeT40OS3P/HUx6tXu//L6+7nF3Dw5qUKUUK7GFOE0xKxuoYpW8TFK/zXehMJsyqh5I01NpWNsqeeKqjppt/fBBHXcZh2/V/NCc0j2KK6Ug2IXEPW+QKCQ1gd45TPzdLUb6Z05D/W6DYV7HOBCFFEQFbVKWyQ2FtTVBdF74Ao3ZuDYETSeYY6FhU6V3EssGxMxUzCyDaHnsyhNKX7QI7wNxO6c2PxhMod0zUWxBeiwO0joUaX3MkEbKcGOHdsYt9Q3ErxUzElXuJdbXZdI9Ou3FnH3m+Zf6QRLBWWQOYDlAOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGBAZqIvRq021UuoDRvOyRPjqaSuQLnoyu4DbRMt5JA=;
 b=SxF2oH/PeVk51eS72Ju0DOkF2JM9NQifJsXG3K4ahESntm235r7eFynGm0pVIEOGoWSfHpbuy/M33psdT1AuVQBLpjIKZwmKI0zv21M2B71Yd/0rdY00gmtvDgWN3GQhjHPg7bgfMFdWiGya9jpnglJotyNYY6VNscDh529EK9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 09:45:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 09:45:59 +0000
Message-ID: <178a7ee4-1406-ff0f-4529-034f600785a9@amd.com>
Date: Thu, 13 Apr 2023 11:45:54 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uFVWh16ng_tyuTu-0k4k7Wq5LjpwvJgYuidy-YVPEEQ=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4356:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee88fbb-e324-4ab8-e9ff-08db3c03e2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNGyD0RbCKm0vydZbmyR3QyGm9DcUpliLuiCjnXu3oEeeHSnS1h8ijH+4TwTlL7sVFjlu06F9fizU8eaPXCIzeVBkB0mIlgxacSwwxXzUuNSOYg2FCVc6o5JH3o1dy8FcS86z1XOgtu2HJk0Zjj6d1EvoLjfbDdeIEMsdIrv1Ydli8DKfSlTaG2/VTXoHBD8eTa5EvJrWNJ4VeHdOhBkodN7mQ5adBoe+R3A4y9dijJ8rP0WKTLbKu0KkIjNXRlFRv0Yywc6irrF/8h6u90CeemHzX7j7xdRv4a8X/QSi/QeAJcnhNRttAt9Z91DrNpnwlvxGaU1AG0nIaCbZKH+1JCabMJEcdoHE08n2j7ue1sZrCaaPeH39cBXJiQdhFZh9m3lSqPDHUpzalEk33J5xgUO79qW/qqcwXGeugZQ5sFmhxwSEf/9KbCV0JwVGYvK46SngyyhuBbyqlu4MOuHA+26y+ShWgi8x44LQNzcUENeAJgg2SUn0/GLfFzDgbH7mhhXVowsnZlM9sOpAMYD3ExeWd6uouJGU+XrIqULthGl3/+pnRl0rUMWv9oTEUlm+0B/YXANDRC5NnpJtPBUtr68l7MK60mFmBJDB1DycxIP3FrZqnnLvURNmjnRqvgXkNHbkuFYaylVmycueWb7Pw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199021)(5660300002)(8936002)(478600001)(31686004)(54906003)(6666004)(6916009)(83380400001)(41300700001)(4326008)(966005)(8676002)(66946007)(66556008)(6486002)(66476007)(316002)(6506007)(6512007)(186003)(26005)(2906002)(66574015)(2616005)(38100700002)(31696002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXpuOXBqdDJ0T3N0em50NjkzcERvZkFZUDJaa0lkZkJTVmxkL3Q2RXdNQWRq?=
 =?utf-8?B?cE5kWVpXTWtSeUp3Y2RhV01KbVZMODZKUG9oQkt4RzB0aVg5MHo0YmVTdTNN?=
 =?utf-8?B?eXdKVm5nOURBa0owZVVJdm5xczl2eDBpMXZOWUNhZURCaFdZT0V4L25NRUhT?=
 =?utf-8?B?Q0RqRm1Gd0VTb0FvSDIzTk54N0d4cE1keldVeElTYkdGQWpoQjlLVkxZZUVn?=
 =?utf-8?B?NGZFWWpPRXV1WTh0Sk1QaE5MK1FUV0QyTURwUElEN3VYM1Mydm1KK21HbGpi?=
 =?utf-8?B?SEhQRk9RYkh5V3Job0NiUTVaQW5wenVtWHZveGE1ZjVMdTg1ZTl0QmFVN0RH?=
 =?utf-8?B?TWo1UTFVb3djU1BhYzl6akRiTlF4bElmTFZvY0tzV2oxdkR5UHl6YWp2SUdh?=
 =?utf-8?B?NTI4WjZUYWVyU1VqdzFaWWhwWkNYVWswc0lMWVFZOWlSdllweXN1MS9FNEF4?=
 =?utf-8?B?ZE8vSlNOZFZld3dxUWo0aDdMaDFVdzZkaG1ud3hVTTQ1NVhlUDF2QURrYXBw?=
 =?utf-8?B?YWUrNW5oRFZPc3pveU5ldUxqQ1k2SnVPak51UVhNczE1Z212S2FRTy82Nk4z?=
 =?utf-8?B?SFZBMmJFd2pBQjZrbnFhb1JUTWJuVndjbmNuSWEvWDFIcUdPMlJnOCtIQXBZ?=
 =?utf-8?B?VU9CN1AvS1l3S2FJdWVONFhVWVFzMWs4MEVYNldzZWYrcTZseTVjdUdEcE5j?=
 =?utf-8?B?VFF5SUR0N0o4MXJ5cmt2RFgvKzBuaUlLZ3k5c1Vsakk0SzJMdGt1cWVlUVlr?=
 =?utf-8?B?SmZMazhCU0wvZ0VHR2VONVNvUldQZkh5RnAvVmZWSzAyTDlIemJkdTNyeWV4?=
 =?utf-8?B?K2E2WFVHM3NqZkxWWVE2cXpSc2QveVZENE5iTGdOWW1iRFg0bkhGck9pTzVu?=
 =?utf-8?B?eG9odXcrdDFVYWJCMGpHN3MreGF2WlRtM2Z4b29KUkU5KzBLR0tvMmt5aWdi?=
 =?utf-8?B?WGVXa1d4b3lJUXQxOS90UThxQmRSQVZvVTdlT3BNSEduaXU3OGNpanBZUUZ0?=
 =?utf-8?B?Z21wZmJaR0pPYXordHAwR0ZyTk9nODgyUXRrb2dKbTFDVy9USFY1VGpKSGVm?=
 =?utf-8?B?QmhIc1pMTFpjRDVPTWdPVFpUTTFhM1pGNXpaQXJNTFVOR29Hcnh5RHpldXFj?=
 =?utf-8?B?SzhkaVNDMXV5eVFMaXIvd0tTSU1obW5hUGt1ZmZDSVFOek9mV0hHZWdRYm0y?=
 =?utf-8?B?MGlFNFk4cy9vTXladTl0T1hLOW9UU1pwdHBNZTliR084cWZSMmg0TDUrek5l?=
 =?utf-8?B?ZEhMVFR0dTlDYm9UZVBjME5PNUNZcDREZ1lPMkJJaitndWJpTXZ3OFFWNE9H?=
 =?utf-8?B?a1lrczArMHkzN0xUVGlXaXhlRXR0R0RiR0UvbU5QNUM2ejVmaUNIUmNBOVJw?=
 =?utf-8?B?OTJQTUlPQXdiZlBnb3N5cS9TaFlyTXc2T2Y0dWFYVzdlUnhDUitpbzBHaHJQ?=
 =?utf-8?B?ZFUrVEczTEpUc3BZbm9hM2FRWjJNM3J2UTcxZ2pwaGtneCt2VC9XYUNiNG9k?=
 =?utf-8?B?YXlKK0NvREhzdTVJR3pId0UrOUhtMmg0K0lnRTh4bG1RdVN4dCtPL0lqMkNJ?=
 =?utf-8?B?cmlDUkhsNk5zcW90NXNjcUpabGVQL2tja1RiYit2eFgwQ0JVSExjUTdRWEhp?=
 =?utf-8?B?VEEzVnRiUEtCNWtmRGgvY3ZPakZUc0x0T3NEdDB4TmtFWXJZOU9QTzFLUGlz?=
 =?utf-8?B?azVPMGlkVXR0Z2lkNk9qN2dleHJaUEZIWjVwMDRPZFJSck9lK29qRmVmU2hT?=
 =?utf-8?B?dzQ0ZWJrckRRYXdPM1FpMkRJOFJOTmE3TExiczBlQ3IvcFJaOVNDQ1hEUmVo?=
 =?utf-8?B?dGZnUGU2aVZ2YmsrM1dsNm9wSGE1SytlYlM0M2Z0eXF2TG5nVHVESUdUbUNs?=
 =?utf-8?B?OERzQXpmNFNld0FyclpyQjFKc092dUZvQTVBTmpkRFRuaGc4dDFLaU5NZVpn?=
 =?utf-8?B?VU9udCs4cXdDN1g2bHpVNVg0dzg2aTVnelgyUmhqbDVYQkhEUVdHMDZDaS8x?=
 =?utf-8?B?SnM0SHNBNzZOSVJFV2tZQUpGblNLWXp2RHZJYVRjRmRMbkgwK0VyZGNQT1hO?=
 =?utf-8?B?QlNiaVB5Ri9YcVQ0RGkzTjZaNlVVd2ltdzArMzBUVTNhM21vcy9yVHpVMHd5?=
 =?utf-8?Q?3xvc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee88fbb-e324-4ab8-e9ff-08db3c03e2c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:45:59.1135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGF69ie4O4oU6+w0RNqgDOdBRlT2rJK7zJazQsvF7fZgIv7f+PXWyY8tXHKHthcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
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

Am 13.04.23 um 10:48 schrieb Daniel Vetter:
> On Wed, 12 Apr 2023 at 16:18, Christian König <christian.koenig@amd.com> wrote:
>> Am 12.04.23 um 11:08 schrieb Daniel Vetter:
>>> On Tue, 11 Apr 2023 at 15:45, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian König wrote:
>>>>> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
>>>>>> On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
>>>>>>> When swapping out, we will split multi-order pages both in order to
>>>>>>> move them to the swap-cache and to be able to return memory to the
>>>>>>> swap cache as soon as possible on a page-by-page basis.
>>>>>>> Reduce the page max order to the system PMD size, as we can then be nicer
>>>>>>> to the system and avoid splitting gigantic pages.
>>>>>>>
>>>>>>> Looking forward to when we might be able to swap out PMD size folios
>>>>>>> without splitting, this will also be a benefit.
>>>>>>>
>>>>>>> v2:
>>>>>>> - Include all orders up to the PMD size (Christian König)
>>>>>>> v3:
>>>>>>> - Avoid compilation errors for architectures with special PFN_SHIFTs
>>>>>>>
>>>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>> Apparently this fails on ppc build testing. Please supply build fix asap
>>>>>> (or I guess we need to revert). I'm kinda not clear why this only showed
>>>>>> up when I merged the drm-misc-next pr into drm-next ...
>>>>> I'm really wondering this as well. It looks like PMD_SHIFT isn't a constant
>>>>> on this particular platform.
>>>>>
>>>>> But from what I can find in the upstream 6.2 kernel PMD_SHIFT always seems
>>>>> to be a constant.
>>>>>
>>>>> So how exactly can that here break?
>>>> There's some in-flight patches to rework MAX_ORDER and other things in
>>>> linux-next, maybe it's recent? If you check out linux-next then you need
>>>> to reapply the patch (since sfr reverted it).
>>> So I looked and on ppc64 PMD_SHIFT is defined in terms of
>>> PTE_INDEX_SIZE, which is defined (for book3s) in terms of the variable
>>> __pte_index_size. This is in 6.3 already and seems pretty old.
>> Ah! I missed that one, thanks.
>>
>>> So revert? Or fixup patch to make this work on ppc?
>> I think for now just revert or change it so that we check if PMD_SHIFT
>> is a constant.
>>
>> Thomas do you have any quick solution?
> I guess Thomas is on vacations. Can you pls do the revert and push it
> to drm-misc-next-fixes so this won't get lost?

The offending patch hasn't showed up in drm-misc-next-fixes nor 
drm-misc-fixes yet. Looks like the branches are lacking behind.

I can revert it on drm-misc-next, but I', not 100% sure that will then 
get picked up in time.

Christian.

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> preemptively for that. Normally I think we could wait a bit more but
> it's really close to merge window PR and I don't like handing too many
> open things to Dave when he's back :-)
> -Daniel
>
>> Christian.
>>
>>>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
>>>>>>>     1 file changed, 19 insertions(+), 11 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>> index dfce896c4bae..18c342a919a2 100644
>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>> @@ -47,6 +47,11 @@
>>>>>>>     #include "ttm_module.h"
>>>>>>> +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
>>>>>>> +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
>>>>>>> +/* Some architectures have a weird PMD_SHIFT */
>>>>>>> +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * struct ttm_pool_dma - Helper object for coherent DMA mappings
>>>>>>>      *
>>>>>>> @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
>>>>>>>     static atomic_long_t allocated_pages;
>>>>>>> -static struct ttm_pool_type global_write_combined[MAX_ORDER];
>>>>>>> -static struct ttm_pool_type global_uncached[MAX_ORDER];
>>>>>>> +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
>>>>>>> +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
>>>>>>> -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
>>>>>>> -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
>>>>>>> +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
>>>>>>> +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
>>>>>>>     static spinlock_t shrinker_lock;
>>>>>>>     static struct list_head shrinker_list;
>>>>>>> @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>>>>             else
>>>>>>>                     gfp_flags |= GFP_HIGHUSER;
>>>>>>> - for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
>>>>>>> + for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
>>>>>>>                  num_pages;
>>>>>>>                  order = min_t(unsigned int, order, __fls(num_pages))) {
>>>>>>>                     struct ttm_pool_type *pt;
>>>>>>> @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>>>>>>>             if (use_dma_alloc) {
>>>>>>>                     for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>                                     ttm_pool_type_init(&pool->caching[i].orders[j],
>>>>>>>                                                        pool, i, j);
>>>>>>>             }
>>>>>>> @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>>>             if (pool->use_dma_alloc) {
>>>>>>>                     for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>>>>>> -                 for (j = 0; j < MAX_ORDER; ++j)
>>>>>>> +                 for (j = 0; j < TTM_DIM_ORDER; ++j)
>>>>>>>                                     ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>>>>>>             }
>>>>>>> @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
>>>>>>>             unsigned int i;
>>>>>>>             seq_puts(m, "\t ");
>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>                     seq_printf(m, " ---%2u---", i);
>>>>>>>             seq_puts(m, "\n");
>>>>>>>     }
>>>>>>> @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
>>>>>>>     {
>>>>>>>             unsigned int i;
>>>>>>> - for (i = 0; i < MAX_ORDER; ++i)
>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i)
>>>>>>>                     seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
>>>>>>>             seq_puts(m, "\n");
>>>>>>>     }
>>>>>>> @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>>>>>     {
>>>>>>>             unsigned int i;
>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
>>>>>>> + BUILD_BUG_ON(TTM_DIM_ORDER < 1);
>>>>>>> +
>>>>>>>             if (!page_pool_size)
>>>>>>>                     page_pool_size = num_pages;
>>>>>>>             spin_lock_init(&shrinker_lock);
>>>>>>>             INIT_LIST_HEAD(&shrinker_list);
>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>                     ttm_pool_type_init(&global_write_combined[i], NULL,
>>>>>>>                                        ttm_write_combined, i);
>>>>>>>                     ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
>>>>>>> @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
>>>>>>>     {
>>>>>>>             unsigned int i;
>>>>>>> - for (i = 0; i < MAX_ORDER; ++i) {
>>>>>>> + for (i = 0; i < TTM_DIM_ORDER; ++i) {
>>>>>>>                     ttm_pool_type_fini(&global_write_combined[i]);
>>>>>>>                     ttm_pool_type_fini(&global_uncached[i]);
>>>>>>> --
>>>>>>> 2.39.2
>>>>>>>
>>>> --
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch
>>>
>

