Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2304E9972
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768810EC95;
	Mon, 28 Mar 2022 14:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80FA10EC95
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLU4dMFj1ZD2g49vAIw1oG2gnK1yBteweuzhpPPdX/Y0dhcgX8E4FLZ/WYy2RT7MZXOcjxGyRV5gDdlzb947y3R7gfd0JHvFDaQyrLCJQ/RfWUJbQroPoLz8it1hQ/KgXx4OcvLGhCcEqp+jAR0vdtls0EfDO/XfK8XOuGAw3xi5fC7gWHjGSAc+ALLmFPiBx/IoxoU9AW1lOT68MDVZoBg3Nc0qhK5s+mgj6lMfBiEIw5K4uZVcnuL6L/RYyCmlx+JqIq0VussYG0zPmT36qSk9TT04oOF4kQp/3uKNjl6bsLiMpJW7iY1sfP5SyWKUtGRa2rt2x8D/f/PS9zsgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVy6cTt2HMdMOXVyRU70O5hP0O/d1bFzcfKl8REYjeE=;
 b=DumS2puhcazJkNq4fkIrbbyP7v6fEvksAlsQglTfksIa7eOyNcrMEqviiixiJAG++pceUAKTZ8yLT0UA5KYqXX8TJLsV/GJ8nVkCMyjhGQ7nr+Lq0INtngLq4A0/cfifd+DZLv8l2SfXPKPp3vRkxcv6slmYn8o2SjdkfLxjPcdAcrIWmyJ5qHNaX24Dskv7RXbBZ5C+4/sENGfAeniMAEO+tZZKtL2kKARO/wOwaw4qJi2l8a6Ga9awoKPac/XHqG6AMMw+kmOlxZ9mvV2pgXAQBG/cyZ9xTazevhbIjUT1LfIOsHuKuX5/ofprmbNTjHhhnzdgxkemotdYQw8DIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVy6cTt2HMdMOXVyRU70O5hP0O/d1bFzcfKl8REYjeE=;
 b=LfwOIfLqITQJykIVxo4PQsAgZDhUi/hWsV4JjZJblNxYsajHINz3W0r06RlL/orNS6u5odjEK07pBvVrBklWTwNz8ns1pWpMFMZqK0BeA/S5praxD+dGEanIrb0EUsHJQ6c6JyntkZQD9LsFCrMlynFcmdBz0/OwmJYyfUsqfj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4831.namprd12.prod.outlook.com (2603:10b6:208:1b9::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 14:26:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 14:26:50 +0000
Message-ID: <33e990e7-b6fc-d9f8-5dee-4a809ec80d6c@amd.com>
Date: Mon, 28 Mar 2022 16:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf: add dma_fence_unwrap
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220311110244.1245-1-christian.koenig@amd.com>
 <Yj3e0QjbnPoG7n4I@intel.com> <35cc3bd5-c0ab-0bd1-9603-4971234fbcd6@amd.com>
 <338d0623-1161-c958-101f-dc7d8ef12f99@gmail.com>
 <YkHEutP7ylbVgJjf@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YkHEutP7ylbVgJjf@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72f741c4-5e3d-435f-8fa4-08da10c6ff26
X-MS-TrafficTypeDiagnostic: MN2PR12MB4831:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4831A335F432BDDCCC70F196831D9@MN2PR12MB4831.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jGipElsyBSHg1xcOtQCiWmKU3hV7YklWGjDrVRVB9NcTPGIZlGw+XgZY4S3DQ5nGSgKGZNK9Fv8K8tD2y038XRpNRQNnMdLoii6OsloRXXwv7hccQDv54fNjRAlWVeXZapVHIMWzKjFxFWWbuofoftaanKHhMM50UtO5qhPcBDuLJJq2YaXVVMNvk8DjKRThjV42WksceJ7E05mTWd/kxnt/0s4DsO7MS9f/ZAIVc+Yunk5HZN7WjU/5Eim7CA+nxxkjxYuD0sLzLOvU6ojXUsDwnzpiJfBZkQieDTsA0XlSUK8dsVwfMLLLuuTiTjlovhaG7a1Ao8TYpGYp1oglpphVRK5/LvKfwmj65Q9n350oR/P8Nwmt1SxzFpN9A7vA4sMpevc0EqZDwqN04Z7oDTYfg7k2CkdyM0o/Rc7YUEvz9BmsQchYgqPTEjFMK0pRL8L5KXt3vDyNLKOcNugzjnr7FCpQ7oZL8Ua7L57gGgvZ0OQra6fmOKqoFk9zq6q09XeEhf11x8WTgeLcOqcs0Q+QrRd4r6/UnpfWyEDml9vrdOfRfq0wT1OliyrKCbIP2l+seTp+B3cFBWJaQQOVvMvdOyPJ2Vmui/Nth5aOah2yiSXGydUqRzyJjk/D+GHZQuzKV9YsSkGluDqiQ1yyGtLQ7xWoJeXNen20MoSzVO+0gyh5cabQtPYdOeLYzBlLDhmB1FXGrGQpOCeqbcK1yV2ir17a+ji1yUrIXhs7uduyQeAdKQYRxASP6KXDjZCcnkbDaD6Ac4Upw34077aq51jkLhSCO1JM/JnpatVvf3CmJEENN60IRgyI6svY7Ql
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(2616005)(186003)(66574015)(6512007)(6506007)(6666004)(508600001)(45080400002)(83380400001)(6486002)(966005)(66946007)(7416002)(316002)(66476007)(8676002)(4326008)(8936002)(31686004)(38100700002)(5660300002)(66556008)(36756003)(2906002)(54906003)(110136005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGxDVEdJaVllNjVYVDZEUkhQNW5PWmQ5bmF4VTRJeExOdHpScU5mWkkyb2xV?=
 =?utf-8?B?ZzI4cHdBZ0F4SnYzRnJOeFkwaGY3azgzV2dPaHRjTWdLRDR4Y2hhSWdkRVdS?=
 =?utf-8?B?UlhnbWErdXZtT1pVSHhTVmtFaG5ka2Q5cmdSSlRoSjVWQ1RBa1AxMUQrY1Fz?=
 =?utf-8?B?RlNwSmc2c0pxSW41QzV6d0dSclEzYktGS0h0Z3JMMUVCalhQZWxvejJnVytZ?=
 =?utf-8?B?LzVmcERXdkZnR2l2UnJ4K0FFUmlienhVQmZXTGVDdzZSZjNiMGUyWUNVd3Ro?=
 =?utf-8?B?VUI0YWNwU09aR21iMSs1VDJYMmltWXM4SUVlWDlsWTlLMXB5eXRjbEVOYlRS?=
 =?utf-8?B?SWZyT3dyRmFyUDBmU1pnWWl4RVMwcGhjczhMbEp4SkZ0bnRJVlRlclYwMTFH?=
 =?utf-8?B?M3VBNURFQzM2Um13aEV2NkJ2eGdLS2drTjVobXcyb3UzY1dGUHhBWldyMHdD?=
 =?utf-8?B?bnNmNjRDTXJrMUliTlNaczIxVmozdDdGSHUwckpUTmw2MWZoakVPVVR6cGw0?=
 =?utf-8?B?TEVIRkxUdjh5eEpldHJjUjNodmV3VW43QmJQbERmVTNvLzJUTkVUdSthQm1F?=
 =?utf-8?B?WHAzL3owZGZqR0Q5d2toQXJuODRXQldvTXR0VHFOQzdhVjJ0T3JwY2ovWkkw?=
 =?utf-8?B?OWtQNkppTWxhNmV5OG1XRWFnZWRSRjFxdkh5cTZIUHBBNGJTTEZEWkI0RlZO?=
 =?utf-8?B?V2N2eWM0SHlweVN0cDRESGgzVDlQMU90clRVcmFtck12WGlNbE5SQ095L1l4?=
 =?utf-8?B?VFRsbENZWGFkWTBVbDBiWGtVY1VzamVDMURnQTJTdnZ4YlBvZStPZ3J1Q3Nm?=
 =?utf-8?B?d1cxR1ZYcWxKTFdseWttdWRwZnozR2Rrc3lIL1RyZjg1THdNZk9Pd1RKRlN3?=
 =?utf-8?B?ZGFsRzVuVGxaTXRjcDl5T0lrVks1d2JldFUxNyttNmRhYlZBUGFxQ0sxdjk4?=
 =?utf-8?B?d0FlZmF5bHo3OHNVZWFlQ0NvL3c4a2pRQ0tRYWh6cy9WQXZRK1FtQUdrdU9M?=
 =?utf-8?B?bTVILzZkZXVlcGRLa1BzU0llTUpIcmZJM3FKVTZsYnE0YUFQVFNGVWp0OGp6?=
 =?utf-8?B?MlFqM1dlKzdrL0FaT0Z5QXFJbnJKa0xZR3RjTVUzbW1UWUdhdzV0dGF0Tmha?=
 =?utf-8?B?Tnh3RW4xaWtEYkxTSVRkWUc5YXNtRnRFY0laN0JqeXdOWENQTlR3SmZLY0NQ?=
 =?utf-8?B?WTArWU5PVCtPa252RDl1M0NuMjEydUtRdWZYNmxEOE1mazhDOURGWEhuTkVy?=
 =?utf-8?B?MjdjMU5lZEJDSVBtSWQzYllhMTlrY05nVnVhZUVxVmJZWk1kMmdIMU1pbXVU?=
 =?utf-8?B?VFoxcVUzd1haS2ZGOXRCbHd3QkV5d3poZmZuTXQ4MVY2dUNReU83RExERzkv?=
 =?utf-8?B?VGtxWWcvMDh2MEE4R09SVmw5OGpFSDhkOEswNk1VL1BmNFp2UThkNElpK1ZF?=
 =?utf-8?B?OTV3TGwwUUFkRmtyWDFiNDVsZkJ0d1dxUC83TmF4OG5tcUxObFEvMURiRnpr?=
 =?utf-8?B?MERMNzEwZjVDSFpFcVcxSUhUaGh5SHFkb3RhVHcxbE1ZMjBqcDJpMzd3bjRx?=
 =?utf-8?B?VnBEWHNRbkRBdHk5MXVnQmRCWlJqajh0czBQRkdLaTUyQXZnaGdGc2J1VG9X?=
 =?utf-8?B?amJaVDkyc3R6YjVjOGcxL3pHRFowd2ZoR3BvZkFZMlp5WnhScVNOTHZxQW1X?=
 =?utf-8?B?LzlYZzdkdWs0Sjh4QXlPbUxEVGdiaG5ZTkxzbzI5dTRBdDZSaUltQ1QvWm45?=
 =?utf-8?B?b2Exa2NIL2NjV1B0Sm9ZS2RBcmxCUG5FcTIraXA0b2duRUJuTitCVDN6ZHNG?=
 =?utf-8?B?NVZLVmZnL0VISFF1ZFhQMU9NZ2RnNmJobHR4ZFlyeE9xUHo5ZytZckdIMU1n?=
 =?utf-8?B?V0lSNlVTcVM4NXl5MlRjK2hQVXRuQXROWFA3K2lVZU1KSlI2cVNidEMwUFRH?=
 =?utf-8?B?eFFiZ1U0dXhzajRIa2g4Ymxsc1hVNnByc3R3VW5EdlhzdjBJY1JLZmRRMDFJ?=
 =?utf-8?B?bGRmdXB0QzA1NlhLZG51QzJrbCtiVEx3VzNiSklzMTdiS01ucVJNS1l2WkdI?=
 =?utf-8?B?SkJ6OFRMOGVIdk9YQXp1Z0VmMXZ1YlczVEdieVpCcWFZeG9YMTJBY0o4V1Jy?=
 =?utf-8?B?eDVleU5GZ1IyTmp0ay9xc2ladjVkUWh6a21pNlhKeUxLRmZjdkRlMVNId0Zi?=
 =?utf-8?B?WXovVG5iT0gxdkRYVWhGN045czBHbTFVaUErbmZNSm8yZS84V3piUUFRMitm?=
 =?utf-8?B?elRLUjRMN2kyK3phcnlld1F4Y1gvN3Z4dyt2WjhmUE1tZzNXaHRUaURwbkJD?=
 =?utf-8?B?Mm1wNlJnTk94M1ZWWUJlWlVSb1hjRjZ4ZVBoNDA1Z3c5dnlCWmlTMEk5N1BQ?=
 =?utf-8?Q?/DPf/qpHE0ZqGsGX8t/sRd2HyCrNuPG6PQjysAdCYuubL?=
X-MS-Exchange-AntiSpam-MessageData-1: GQ9dLROHxR2rCw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f741c4-5e3d-435f-8fa4-08da10c6ff26
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:26:50.0070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrSruUMCfMCyIxxihqnIAwzcCB0ZkiHL7dJvaj0c5MnmQZoAk1VtlNm++OhmRX4P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4831
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, gustavo@padovan.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.03.22 um 16:22 schrieb Daniel Vetter:
> On Mon, Mar 28, 2022 at 12:28:31PM +0200, Christian König wrote:
>> Hi Ville & Daniel,
>>
>> Am 25.03.22 um 16:28 schrieb Christian König:
>>> Am 25.03.22 um 16:25 schrieb Ville Syrjälä:
>>>> On Fri, Mar 11, 2022 at 12:02:43PM +0100, Christian König wrote:
>>>>> Add a general purpose helper to deep dive into
>>>>> dma_fence_chain/dma_fence_array
>>>>> structures and iterate over all the fences in them.
>>>>>
>>>>> This is useful when we need to flatten out all fences in those
>>>>> structures.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> One of the dma-buf patches took down Intel CI. Looks like every
>>>> machine oopses in some sync_file thing now:
>>>> <1>[  260.470008] BUG: kernel NULL pointer dereference, address:
>>>> 0000000000000010
>>>> <1>[  260.470020] #PF: supervisor read access in kernel mode
>>>> <1>[  260.470025] #PF: error_code(0x0000) - not-present page
>>>> <6>[  260.470030] PGD 0 P4D 0
>>>> <4>[  260.470035] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>> <4>[  260.470040] CPU: 0 PID: 5306 Comm: core_hotunplug Not tainted
>>>> 5.17.0-CI-CI_DRM_11405+ #1
>>>> <4>[  260.470049] Hardware name: Intel Corporation Jasper Lake
>>>> Client Platform/Jasperlake DDR4 SODIMM RVP, BIOS
>>>> JSLSFWI1.R00.2385.D02.2010160831 10/16/2020
>>>> <4>[  260.470058] RIP: 0010:dma_fence_array_first+0x19/0x20
>> I've looked into this and the root cause seems to be that the new code
>> doesn't handle dma_fence_arrays with zero elements.
>>
>> That is rather easy to fix, but a dma_fence_array with zero number of
>> elements is most likely a bug because under the wrong circumstances it can
>> create a dma_fence instance which will never signal.
>>
>> I've send out a patch on Frinday ([PATCH] dma-buf: WIP dma_fence_array_first
>> fix) which avoids the crash and prints a warning if anybody tries to create
>> a dma_fence_array with zero length.
>>
>> Can you test this?
> It's in drm-tip now (in the fixup branch) so drm-tip results should have
> the result soonish:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2Findex.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C0afc74b5df0c4ea384af08da10c672fa%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637840742273792356%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SL2CuMgM6lCSOhDTvs%2FaFg6zRlc7F3X%2BNkf6GuGMGXI%3D&amp;reserved=0?

How do I find something in there? Is there a search function over all 
the test results?

Thanks,
Christian.

>
> Cheers, Daniel

