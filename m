Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E54E4FB0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BAF10E652;
	Wed, 23 Mar 2022 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C288410E652;
 Wed, 23 Mar 2022 09:47:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCv+JukBEQCnUhvbI+PrHkgEatPp6/F3pnHNfxiSzWAD6wbp9WIYRWTLgerZVOh6Ziy/gMTDJq8S6gx7LgTsXzoH0b3dS38WQokbivJvF86ZhiG7T4CJ11LaW6r4E6xyyQDfuaPKx4636uXuxFVIYK79vnuCFEUSp0DYodwAAa8Omw2WCGGDRqPf0Y3Q6xClmP/OlkpLnr0ShX9B3D8HTq4x6kFtsEIShFeW673kv6QVvpVum9SSzERlGXwxFKIgz3KmMz+SFUtVnVoCDhbKKoeoAVkxZoyjLSd2QwBxb++Q2wmGPPhvYN26AvPIypQtj/1ddVIUbIBzvZjAO6UcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q//8ZV1vmEIo2hXahr1TIOR5984uuIqsG3S4V66hgS4=;
 b=C/cc/9loFxYP8RwhRv69MPALLXMEPQ6WjrYak2qzkmyhH+8J39Sj5FHY//+AofEa/ogyIfMMUTED8bKETSZDlKysD+vx2JiaCVCgL45BlimGPNCh3B/13Jgpc4Ks2iXSgVTSa4N4gNpvd+VSDg3n2IW80ArxA1dUogQ0lPPopRkoV5NIp6FqGTUHS/9hKBNRu/wiomjhVMRYyXsdBHS+nRrw3w3Yck94wtWu94W3KLlFRalPk7PSdJkP5D2bN6KLPZhAM3HUpVKw0IkDyQdjEd7kIvph7LPZGGJLyqN/WnfXNyuADfCiFT7QIzjodiMXRa+dgjb3qlMCKLq9MPMBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q//8ZV1vmEIo2hXahr1TIOR5984uuIqsG3S4V66hgS4=;
 b=hUydpsX12GBu5twh71LPwqRUk668H5ucDn3eTdGTdOwpzK5Dd6dGpsuEyeGf7dpo+rW+1lrW+iu220Y5F3i/8ZUc1BfRyenMA5l+CS53bcizBBTJGess16FoeNT438MUWpBy9DSn1datxcbv4fP0ag8+vie5m+5l2PWnvunFHBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB3068.namprd12.prod.outlook.com (2603:10b6:5:3e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 09:47:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 09:47:00 +0000
Message-ID: <549ca2a0-cc07-d3eb-685f-ab289f5d7690@amd.com>
Date: Wed, 23 Mar 2022 10:46:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] drm/qxl: replace ioremap by ioremap_cache on arm64
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Cong Liu <liucong2@kylinos.cn>,
 airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 ray.huang@amd.com, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220322093444.1236582-1-liucong2@kylinos.cn>
 <e2bc20e4-41e1-7162-257c-f2ad3309f1cb@amd.com>
 <a6acb2ce-2465-6619-e3fd-ac34ddf07d35@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a6acb2ce-2465-6619-e3fd-ac34ddf07d35@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0135.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a04f4a-5e9b-46a4-ea4a-08da0cb2137f
X-MS-TrafficTypeDiagnostic: DM6PR12MB3068:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB30689D02481E505FAA1B535A83189@DM6PR12MB3068.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukGAd37i0XH1E471VdmanyOqSFWB9xxeXHpwVAV2r59wic/fJkDWatL3FoJfUNu/86l1ZcwP6zvI+1K7YzrQNhHEQCdFffbSh1XHS4vatNWHyi7D/7w9aaH7PlBWCTv/tSNWXUeWFZfJlaC5AuaUPgbOxYGZLCvFiH/YKUcMkohMKdmof/yVYa3I9LUEsclkkOTUmZ1Ihw6dBRn9O0O0EDsjDmLE2iixwY76rJxwJUplv/Ohn+YoEhseiw29c5x0KSZEG4ykMVPZxWKgEDe32GnIM4nK2B4J6ru+Lu0EmvONZlTQ3u8/pVnwIrj6sQczTgiFnXIv9tyFpTZ+x3v49Cxia4MS+afCLpzL/PTQw5iSIKaZ22jemqMWDeT2bqUNlOCn5pzqYcNXkoj8L7FiZBv459K04YMG2qmmxcIRQLGZbgffTiw6l3cAXRjGEKsFKXiPnVTyTSygjdbC/RUypiqCgeHMAAd+iMumQYvMQTZtIiWcRBXQIkfAulmYfHm41c0Pjw4tHC6+XBhkvGnvWNJaE/GbJkRsPZeuyTyS9sti/94yldkO5pIaQVSm/qCKiiRNh4mDMRlNYV+TfWiIgOV15pOQf0cV5Mofndp2e1gDsW7xYr4ZuLX93fNiwqaupb2o/oGj0OFYD3cL/vs8ls04uKNkyh+MEbcDtBvT+cWFvFbSk074bd4+fCmz1WiOTL0AvOHsxEaDgVtCE8fK6dUSTvtdzKxuorf/G2IS1lmVth45arDGdV6Re6ARJAJbNQ8AgMXossKBs/Cx84pdaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(66946007)(6506007)(31696002)(2906002)(86362001)(6512007)(53546011)(110136005)(38100700002)(6486002)(921005)(316002)(5660300002)(8936002)(508600001)(8676002)(66556008)(2616005)(66476007)(26005)(66574015)(31686004)(186003)(83380400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW95NWlGVHJQYm9WdnBNQjlyTXcvTHBNTDROSFAwb3ZITzByTzdka2kxcVIw?=
 =?utf-8?B?OE90TWRzeXcvcXF3OUoraXJ1QStOYnBwZCtyNHdLZFd3NTk0WTVsSnZBcnBh?=
 =?utf-8?B?VnZOeGtueFRVVnZwS0N6TWd3R01CeGhBdDlTSDVwcDArZGFhUUp1Mm04TGxm?=
 =?utf-8?B?L0dEeW9hakdFUEIyTlJHRkkzNU1WRzIwUGlkWVpNZTFXelg3bWZkd1dZSDVu?=
 =?utf-8?B?Rk4wRzZwRm1xNFp1bHJnU0loZnJSaXE0am9iVkxUaFFHVW40OGo0T0tFZit6?=
 =?utf-8?B?ZzFJeHNuMDFlTlNCV0FWaUVPendtL2dzR0twZS9vZHRXRSs2LzdoNFFWcVpk?=
 =?utf-8?B?SGlsMVNaNG05WG40K1BwVHRhc0VRV0J2OEpXVmp4T3RrMnBIQ3lmcHpLTXhK?=
 =?utf-8?B?K2dEazZ4bHR4UHZLL01DTEdVM1dqMGJiU0txSGdBN1JQQWFpZTMyenhhdTZv?=
 =?utf-8?B?RmFMVXN0MlNuYjhIb2x5VnNPSnA0TDJVbjJ4QTJIN1dYUWpZQkFBQVBHWklv?=
 =?utf-8?B?R3BsN3RxcUkzV2pUMnRsN0ErdzNMMGhRU1phUWhFSUc2U09jQUFCRDF1T2Rr?=
 =?utf-8?B?am1hUGNFM095U1hCVHNvVTNwYmlhRW5DTm5xU3dkUXN3WGVKcVQ1Q2ZXVEZB?=
 =?utf-8?B?WHFSTVdYUUdtRXJXOTc2a2hsYzIvdDRpVmp0ZkxkekQxeVBGaU9PZUxwTEdO?=
 =?utf-8?B?YlZWczNaT3l6ZnJZWnRhTVpUQ2wxb1RKcWQ2SEJORjc0c1ZkRWZQQ3ovSTZQ?=
 =?utf-8?B?NFlkRDc1MFM3NXV2ZnBUd09DWGc1ekgyM0xkeFQyNFRUcHk3Ty9rOU1XMC9W?=
 =?utf-8?B?ZTkxdGkrNzRBWkNUU1AyZ3FZdi92SCtETFE1UnZLSDVwMVpFQm9WTHVZLy90?=
 =?utf-8?B?YWVIMG1jSG5qdXE0Ty9JbEFiZ013L0VuVyt3c3NYMGpTcGphUkdoYXJPZ0NQ?=
 =?utf-8?B?SjRHdnFxR2xacEgrcUQrOHU0VnlidUMyL3BDbkJzRXBtaG4xdEhOaDgzck9O?=
 =?utf-8?B?YU9ucXEwcnV0YXZ3MFpHeStGaDJ1NnE3bHQxS2drWFJONFp6Z1RTSGErMFRH?=
 =?utf-8?B?UEMwOUttVUwvTjNlZjlsanc0a1ZiNmN2YUZydVZya0RnM1hyVkRkN1gzL2s3?=
 =?utf-8?B?RTlMZUlWVndyYW0vUWo0RkJZRUxlc3JHYzhsU21JdGZmUi8xcTZpVzJSRlhi?=
 =?utf-8?B?M2JxYWhQem0vcVU1RWtsaWJ2SklUTTk0U3dHQ09hYy9RNS9yQ2xaSXFuSDZI?=
 =?utf-8?B?WWtKZklPTDFDcEVHU2JhWjE4cFdmalRsUEtuVFZ2bW9sRlBtbVBoUWp2cEdG?=
 =?utf-8?B?Qk9BNDR3M0paekd1SlFzZlFCQXhNQlArZFRVOEF6YlF5ZjJUQ2JwN1FhQnFL?=
 =?utf-8?B?a1BnNHAvN2xYUmQzdUZ3SUFwa3J5Z09qMXBIcU5EMlFvZDlzYXRGVkRzeXhC?=
 =?utf-8?B?bWgzWlZpaFRrMWdBNkRNYm5wWmNTT3BDZnBkSlY3MUQwRUIyQTk2Q014NnBh?=
 =?utf-8?B?NGZ6YktWb2xPOTBMUW9qa1o3N2lTRjZZUnZzeWd6bFJMVVZYaThoeTNTdFdQ?=
 =?utf-8?B?VDNYUGxteUZ0VDhTNExYMFdtYnE5UllTd3d1dk05SzdCMXZmVUp4U25vUWNZ?=
 =?utf-8?B?UGhWUG83dFVXc1prdCtIOHNYeHV3QVQzcVQ3NW5mdDQ5aDVyMWxGMXlnM3Bm?=
 =?utf-8?B?Zk1lV3hoSHdyRU41eVFIYyt6MUhiREw3eVNhTUVLK083OUthbGtpTnNuSmNi?=
 =?utf-8?B?cllOWUFYMjl2a2MxWll0OHplQlB2S2NQY1FNSkFxcDhUaVRuUVBsdzk1MUVN?=
 =?utf-8?B?LzRSQllLSDE0WlFhS1QzRitvQ1dPSEgyenhrdG5QMkswWDNWSW5LQStyTGNs?=
 =?utf-8?B?cGF1NktmVGJDRzJyNDV0VG5GdHB5OHRObGIyVGhDeERETWRhQlNyNWFRUysy?=
 =?utf-8?Q?yL+0lKC55grEPpEkd4l3GgiJNxGOs6jb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a04f4a-5e9b-46a4-ea4a-08da0cb2137f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 09:47:00.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEdjqxqlwJK6kymQmIB5AiwBWmy6F34QcWQDBlUZ/PxkKRDBQLmN5Z4SfwTXqucQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3068
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

Am 23.03.22 um 10:45 schrieb Robin Murphy:
> On 2022-03-23 07:15, Christian König wrote:
>> Am 22.03.22 um 10:34 schrieb Cong Liu:
>>> qxl use ioremap to map ram_header and rom, in the arm64 implementation,
>>> the device is mapped as DEVICE_nGnRE, it can not support unaligned
>>> access.
>>
>> Well that some ARM boards doesn't allow unaligned access to MMIO 
>> space is a well known bug of those ARM boards.
>>
>> So as far as I know this is a hardware bug you are trying to 
>> workaround here and I'm not 100% sure that this is correct.
>
> No, this one's not a bug. The Device memory type used for iomem 
> mappings is *architecturally* defined to enforce properties like 
> aligned accesses, no speculation, no reordering, etc. If something 
> wants to be treated more like RAM than actual MMIO registers, then 
> ioremap_wc() or ioremap_cache() is the appropriate thing to do in 
> general (with the former being a bit more portable according to 
> Documentation/driver-api/device-io.rst).
>
> Of course *then* you might find that on some systems the 
> interconnect/PCIe implementation/endpoint doesn't actually like 
> unaligned accesses once the CPU MMU starts allowing them to be sent 
> out, but hey, one step at a time ;)

Ah, good point! I was already wondering why that sometimes work and 
sometimes doesn't.

Thanks,
Christian.

>
> Robin.
>
>>
>> Christian.
>>
>>>
>>>    6.620515] pc : setup_hw_slot+0x24/0x60 [qxl]
>>> [    6.620961] lr : setup_slot+0x34/0xf0 [qxl]
>>> [    6.621376] sp : ffff800012b73760
>>> [    6.621701] x29: ffff800012b73760 x28: 0000000000000001 x27: 
>>> 0000000010000000
>>> [    6.622400] x26: 0000000000000001 x25: 0000000004000000 x24: 
>>> ffffcf376848c000
>>> [    6.623099] x23: ffff0000c4087400 x22: ffffcf3718e17140 x21: 
>>> 0000000000000000
>>> [    6.623823] x20: ffff0000c4086000 x19: ffff0000c40870b0 x18: 
>>> 0000000000000014
>>> [    6.624519] x17: 000000004d3605ab x16: 00000000bb3b6129 x15: 
>>> 000000006e771809
>>> [    6.625214] x14: 0000000000000001 x13: 007473696c5f7974 x12: 
>>> 696e696666615f65
>>> [    6.625909] x11: 00000000d543656a x10: 0000000000000000 x9 : 
>>> ffffcf3718e085a4
>>> [    6.626616] x8 : 00000000006c7871 x7 : 000000000000000a x6 : 
>>> 0000000000000017
>>> [    6.627343] x5 : 0000000000001400 x4 : ffff800011f63400 x3 : 
>>> 0000000014000000
>>> [    6.628047] x2 : 0000000000000000 x1 : ffff0000c40870b0 x0 : 
>>> ffff0000c4086000
>>> [    6.628751] Call trace:
>>> [    6.628994]  setup_hw_slot+0x24/0x60 [qxl]
>>> [    6.629404]  setup_slot+0x34/0xf0 [qxl]
>>> [    6.629790]  qxl_device_init+0x6f0/0x7f0 [qxl]
>>> [    6.630235]  qxl_pci_probe+0xdc/0x1d0 [qxl]
>>> [    6.630654]  local_pci_probe+0x48/0xb8
>>> [    6.631027]  pci_device_probe+0x194/0x208
>>> [    6.631464]  really_probe+0xd0/0x458
>>> [    6.631818]  __driver_probe_device+0x124/0x1c0
>>> [    6.632256]  driver_probe_device+0x48/0x130
>>> [    6.632669]  __driver_attach+0xc4/0x1a8
>>> [    6.633049]  bus_for_each_dev+0x78/0xd0
>>> [    6.633437]  driver_attach+0x2c/0x38
>>> [    6.633789]  bus_add_driver+0x154/0x248
>>> [    6.634168]  driver_register+0x6c/0x128
>>> [    6.635205]  __pci_register_driver+0x4c/0x58
>>> [    6.635628]  qxl_init+0x48/0x1000 [qxl]
>>> [    6.636013]  do_one_initcall+0x50/0x240
>>> [    6.636390]  do_init_module+0x60/0x238
>>> [    6.636768]  load_module+0x2458/0x2900
>>> [    6.637136]  __do_sys_finit_module+0xbc/0x128
>>> [    6.637561]  __arm64_sys_finit_module+0x28/0x38
>>> [    6.638004]  invoke_syscall+0x74/0xf0
>>> [    6.638366]  el0_svc_common.constprop.0+0x58/0x1a8
>>> [    6.638836]  do_el0_svc+0x2c/0x90
>>> [    6.639216]  el0_svc+0x40/0x190
>>> [    6.639526]  el0t_64_sync_handler+0xb0/0xb8
>>> [    6.639934]  el0t_64_sync+0x1a4/0x1a8
>>> [    6.640294] Code: 910003fd f9484804 f9400c23 8b050084 (f809c083)
>>> [    6.640889] ---[ end trace 95615d89b7c87f95 ]---
>>>
>>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
>>> ---
>>>   drivers/gpu/drm/qxl/qxl_kms.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c 
>>> b/drivers/gpu/drm/qxl/qxl_kms.c
>>> index 4dc5ad13f12c..0e61ac04d8ad 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_kms.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
>>> @@ -165,7 +165,11 @@ int qxl_device_init(struct qxl_device *qdev,
>>>            (int)qdev->surfaceram_size / 1024,
>>>            (sb == 4) ? "64bit" : "32bit");
>>> +#ifdef CONFIG_ARM64
>>> +    qdev->rom = ioremap_cache(qdev->rom_base, qdev->rom_size);
>>> +#else
>>>       qdev->rom = ioremap(qdev->rom_base, qdev->rom_size);
>>> +#endif
>>>       if (!qdev->rom) {
>>>           pr_err("Unable to ioremap ROM\n");
>>>           r = -ENOMEM;
>>> @@ -183,9 +187,15 @@ int qxl_device_init(struct qxl_device *qdev,
>>>           goto rom_unmap;
>>>       }
>>> +#ifdef CONFIG_ARM64
>>> +    qdev->ram_header = ioremap_cache(qdev->vram_base +
>>> +                   qdev->rom->ram_header_offset,
>>> +                   sizeof(*qdev->ram_header));
>>> +#else
>>>       qdev->ram_header = ioremap(qdev->vram_base +
>>>                      qdev->rom->ram_header_offset,
>>>                      sizeof(*qdev->ram_header));
>>> +#endif
>>>       if (!qdev->ram_header) {
>>>           DRM_ERROR("Unable to ioremap RAM header\n");
>>>           r = -ENOMEM;
>>

