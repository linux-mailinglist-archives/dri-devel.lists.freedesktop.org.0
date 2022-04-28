Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9152E512BC4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 08:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D1E10E27C;
	Thu, 28 Apr 2022 06:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E810E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 06:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHOBeZRGvxuX2Mz3CWiybDgMpVKaj4ZO4Cn3bDqlPIMQjvZ9Q09Lkhm+vSxrhqeLzIx7uqdq9jYKzkW0xJunWeGQPY/Q8O4A2ersesLjY55OdD+tSJrUlqGokqC9sdOGTjgrKKxJnFZ0PVLljVFSgnwgKh+b7qZddzrB1Mc2fsGgg8KfzWAAxICOMsNgDVhV27tM4LjvtyZmOopj5wm4/NjTAE2Oih0r9el2Um5zFRLGpnAEVwo2OADDPDW4Iz65BgaKGJKtG0RMQLPu362TzUpOjDOnJfrlE+gYARZwLtOqrv733Hl9Kt+qQPoNRB8o09WW4yqsm3/pO/9Yj2Atdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtU2Q6mut1QeDI6sGageJjOQYbUbcncExj/wYTyawoQ=;
 b=HBn2V/t2HcLSJDTPPSGuph1uyjQVU3oBWVcuLX8N/Pk19vhdCa2kBZCfMRAFi5AUn+KQjfkiug4tQUDh6US5VZn5fwbxSGg9Zl/Hgwyu7+nCqCvJKskz46jFrkqA96THVT+kfKXVtb9nqAyJr7ZQdYhftbtvfURYLtuMFe4wapuUlxKlc90NkBF8m1IkxHt+6052DQRwQA6e8VHDLiKblU9yFCO/z8qu8ek7Vn72bhzwo4Lq6LjaNLBM0MIXkP5UGShzrTGLSWgQDJ+k2OVwcb4GuJ+wLgIza8sFbrrbHvMWWqh1td1O0JTXkfCYZRd13McONOMMOHr73pCXW4Ev2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtU2Q6mut1QeDI6sGageJjOQYbUbcncExj/wYTyawoQ=;
 b=qN/Lz9+yYJ0tWu9istEFA+8LyZ1MRQ/4R3z88FNrqvkWbnw0Ek0MGGAq6CCtkVNyoVyvi8lMmF30Fd0MvCWptZHqChTLeNUCXwTeeGstRmYegZJORhda7IAHTi6jh/iBuFbxPjzhZuF97DI1tr2eepvJjNRTdqXNR4vR1YEietk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR1201MB2471.namprd12.prod.outlook.com (2603:10b6:903:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Thu, 28 Apr
 2022 06:41:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Thu, 28 Apr 2022
 06:41:33 +0000
Message-ID: <4bea78f5-2a09-55de-264a-aec9bc7c4678@amd.com>
Date: Thu, 28 Apr 2022 08:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm: handle kernel fences in
 drm_gem_plane_helper_prepare_fb
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220421191002.2251-1-christian.koenig@amd.com>
 <YmlpViYhgZF3+EHE@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YmlpViYhgZF3+EHE@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0006.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c92d94eb-445c-4451-f1ec-08da28e2225e
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2471:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2471A8CD8154ACCAFB8E9D1C83FD9@CY4PR1201MB2471.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: of+McYLkgqH3oDRLiJj6OBtga/1c0hup0JM8j0hvkXPFajecFABEhImIKZkiU7JHeFp0MHYhjwK6fleAO54Jyqi+1HsaPR51K1IIW2m0cpB8jOpvnNn+/I268bsaEnzio2pJtybaeB2Wz7VGuk1pTvutjdNFoIFgI/+MhmBtiA+Xg6Hcz1nlHqBg4xXD0PbaDIO98+FLqWXSD6T8P7+tTu87gbFSA4kyLwQS0z1gMhra/13tnn6QJVrROdmkMLLWTwXVxgGXS7bYJQxwMsgYN4wh8RijlQpLCoK+vSxE7nhjyr+6AMUyl+oixDDfxk+etqkFBw0aGCoYoFJYS9VytlzHkqSA5Ae21+VN5RkO8IQqrlTaPpVaOkM+/UmOKsszNF9UqTpS/zOo4pTzhI1QEIMZVE1YBZ54sFIT9ZmEKuyWLEydo2rMXOdax4qGjVMXA1Ler3fD/0A9VNDX4+kNNPnqC82KrF0pTttnDwrE5uLq9/zHgLfg8+q64qfbH23fyZV9UqShyF0o6hC6v+fW+idPsjDnZ6iylLcfRZcBHMEDTN5PE+Ramj/6W8YFwWR+O4ny4qpk4wurpS+1Gau0K+zCbtVOYolClm+EdYJbIhzjBkGQzty2PGgR02+GdpwtEMS4FMafjgZm92mGtD42GAMl4syWhIua2Lzr6IUyvJJGg4jAhWm9Jq98s1Gr7OB3u4w9iJ5Yde3APzek7//HNxDH3K/nmoSQ3479/i0uBZRV+5R3kYS6ASnfNMCgxOkT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(8936002)(6506007)(6512007)(2616005)(6666004)(36756003)(66574015)(5660300002)(83380400001)(31686004)(186003)(110136005)(2906002)(8676002)(316002)(508600001)(66476007)(66556008)(4326008)(38100700002)(86362001)(66946007)(6486002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjZCWGowTWhySzR0dk1PeG93Z3ViUk5wNFlQUmZEd2lUY09OVTFhckNlYVJo?=
 =?utf-8?B?ckdYRlRvdlFmd2dpNUhXL2wxM0ZNamVBL0NMRTlpNkxQeXJzSHJ3R3NwbG1K?=
 =?utf-8?B?Y3FDbjJUMXJJU2ZRUWlVRFZoYkZzRkNTamY1NVV3c2JBeDVBZFFFcmhzL0ps?=
 =?utf-8?B?c3lRZnNaUVp2Rm9QekEydjBMRkllMG5nUnIyYnFhTXRBMDk5WkhyWmVwUi9y?=
 =?utf-8?B?a21yNThHdWRvdmNOV0hYbEV2OHE0cGFHVWdwejJmMFJtR21QR1V3QmE1Mkdh?=
 =?utf-8?B?WDhjTmdsVTl6QnZISEFJb0hHSDdVT3dkUktTa0trN21idGpwNGY0aEI2RVlW?=
 =?utf-8?B?Mm1JT01aQzJia1VQUkdsWVIwcEdFckVHWjd5dFF6cXZZN1dBRzFQVlY0dXN1?=
 =?utf-8?B?eG0rZzRBTG5Tb3dSdmhNZEZlbHB1U3EydUx3Vks0Uy9GZVhlR21wNlJuMGFL?=
 =?utf-8?B?NmVSQnF5MWF3YmRraGFQZ2pVdXlpMjl0M0lXSW1lMythNHpVVVVtU0Iwam9r?=
 =?utf-8?B?VlBSeHpQYmpvL09XR0RuZEFZMUh5U2hWOFBvKzg5WGVTQkxMQWU4MGZLS1V0?=
 =?utf-8?B?MnJ6MmYvdzRFWFc2MjRmekxjWTB4VmIyaG1oUGMwaEd3MlRWWWx1YTBsenBm?=
 =?utf-8?B?UGdBZjVNL2MyVHFKdDQ5Y1Bsc3JYaXE3bkM2cDU1bnlKR1BPWUFPcFhZSEFH?=
 =?utf-8?B?cEdBbFZQbjc5V3dFMmRFd0x3N1Z4dk5KRW5FTmIyeUgxUkdGYTdpZnZYckt1?=
 =?utf-8?B?MjB4dDhzZGpwVm8yM2RZUkoyRml0YkpVZjZtZmZwRDIzQy9CTnhGcUN5d1pC?=
 =?utf-8?B?UVpwZ3psVHpKaTBwWGt3SWdZaEpXNTlmWVAzRHpOdXBRVXpGM29VSEVnNWg5?=
 =?utf-8?B?bUpRMjJQSy9Cd08xMnEydi8xcEUwLzV4QmRzNStEaHhKU2tMSFBVUkpRVmVN?=
 =?utf-8?B?aUY3cDRTcWd1ODlsYmF0bDJGVFB5cHVmZUdsdjNoUmluRnEyWmZ0bGgxdWpJ?=
 =?utf-8?B?QklRR2U0empWVzdkSE5WTUg3OVk1bnFROGlNMHo0Sm1uNmNLU2ZNSnhPSDVi?=
 =?utf-8?B?VmYwcU44S05mY3FhT0pKRTJJQ3o3T2lVQTdhRXFSeTlUS3RDc2FaaTViREFQ?=
 =?utf-8?B?NFQwbmV0MlU1VW9lUXFlSVRIMWc2OVMyLzkrVjBrREFyYmU1MjFPYTNjNWlO?=
 =?utf-8?B?VUlGRUk4VGZKMU1lYnNtZDZlbWsrRVZzVHJwZW02TlZ5SGJtbERqMGorVmg2?=
 =?utf-8?B?VmxRSll6UlVIL00yRzRHcHl3Qmh5ZWNKdWEydGJkU2pWV1FyTG4rTlIyenhm?=
 =?utf-8?B?WUFTSUZIdFRoYWg1ODVxSTllTHhSLzJHTExZOEZoMWRIZGxERURoTlBPendY?=
 =?utf-8?B?ZU5hRGxsZS8wa2VqNlM1UitXeTcyRnc0Zm5iTXhlb3RQSTVEQ3A0VGJvdHM4?=
 =?utf-8?B?NTdMNXU2SFhzVGVlYU4yZ25FYW8wcEg0MXNyaW1adnVPMGNrNlJ5VTdGUFlO?=
 =?utf-8?B?cUxQVUJtQWZqMjdrditiZHNXbEdpWXE3ZjJtSUpMbnJ4WXJMZHdRZEFIVWZX?=
 =?utf-8?B?eTZUK1NjNDQrODFnTVMrSzJlSGpHMVhYRHA0ZHFpSGNLQWtBeFQ2eHNzdDcr?=
 =?utf-8?B?UllrakswVWZ0MFJtQWhiRWVPeUp5LzRqa3c0bTcxVWhhTWZzeXNyMmZ1VFJD?=
 =?utf-8?B?ak1tNTNOMEJpMXM0aHdFc3NtTW5iV1JUbWZObEFTQWF4M01salhnM1EwcmVa?=
 =?utf-8?B?S2kxTEtMNEdCTnk0SUErbTA4MFc1bzRJeWxkaUhkVkdDaGdVYmQvZkRUK00v?=
 =?utf-8?B?L3grY0lkaTFrSG8xWWZBakF2VTFHQ2tDZmwvdVRRQWpVdFFvczlRQ0VZaHAw?=
 =?utf-8?B?OHQyb3daY0FMaUpua2lRNENkZEZaSFMvemVacjI5aW1Yb1NoUnBVT2J5ekox?=
 =?utf-8?B?YmVnT3NSajBqN0VNdlVqRXRCWWNQRlAwanYvdXIvM0UxMS84VU1OL09vUkZ6?=
 =?utf-8?B?UGxaQnYyVm5qOFEvc2hvQUEydUJHUDF2cWpPNG5qQ2ZhVXdqVytmdUFmNWVQ?=
 =?utf-8?B?S1B3cG5jeHhTZElyVWpvcDZmZWpQd1BNMGo4bjlucVRSQ1VuWHhmRlB3VGl4?=
 =?utf-8?B?RGNzLzJwWEQrVUw5VytzV0NKZnEvOUJjdVRoczZmUjIzVkRUaUZCbTRQUnRy?=
 =?utf-8?B?a2VrZVdudWNsV3hEU2ZCQVRTL2VuTmQ3MWE0Qkl0dVFTSWY4Z0JHYU91YUM2?=
 =?utf-8?B?dU9MTmxBSTZEWVRmMithV2VGV1NaZUs2OFhjQnp3NWVMVlcwTHRCRGRQdWVy?=
 =?utf-8?B?U1pOei9IR0U2L2pDZ3YrZmpOQ1RYdk9nR2FsdHJlTE9ZdldsMDBjQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92d94eb-445c-4451-f1ec-08da28e2225e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 06:41:33.1807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1v9BJ+x/uECVNtR0JwYe5FSS220ZmeW29TpcgRRDMaKRHh0ilLbEamgP+MGsYi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2471
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.04.22 um 18:03 schrieb Daniel Vetter:
> On Thu, Apr 21, 2022 at 09:10:02PM +0200, Christian König wrote:
>> drm_gem_plane_helper_prepare_fb() was using
>> drm_atomic_set_fence_for_plane() which ignores all implicit fences when an
>> explicit fence is already set. That's rather unfortunate when the fb still
>> has a kernel fence we need to wait for to avoid presenting garbage on the
>> screen.
>>
>> So instead update the fence in the plane state directly. While at it also
>> take care of all potential GEM objects and not just the first one.
>>
>> Also remove the now unused drm_atomic_set_fence_for_plane() function, new
>> drivers should probably use the atomic helpers directly.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Is this enough to have amdgpu (and well others using ttm) fully rely on
> this for atomic kms updates? Anything to clean up there? Would be neat to
> include that in this series too if there's anything.

At least I strongly think so. I just haven't removed the 
dma_resv_wait_timeout() from amdgpu_dm_commit_planes() because that is 
simply not code I'm very familiar with.

>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c       | 37 ---------------
>>   drivers/gpu/drm/drm_gem_atomic_helper.c | 63 +++++++++++++++++++++----
>>   include/drm/drm_atomic_uapi.h           |  2 -
>>   include/drm/drm_plane.h                 |  4 +-
>>   4 files changed, 54 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index c6394ba13b24..0f461261b3f3 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -254,43 +254,6 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
>>   
>> -/**
>> - * drm_atomic_set_fence_for_plane - set fence for plane
>> - * @plane_state: atomic state object for the plane
>> - * @fence: dma_fence to use for the plane
>> - *
>> - * Helper to setup the plane_state fence in case it is not set yet.
>> - * By using this drivers doesn't need to worry if the user choose
>> - * implicit or explicit fencing.
>> - *
>> - * This function will not set the fence to the state if it was set
>> - * via explicit fencing interfaces on the atomic ioctl. In that case it will
>> - * drop the reference to the fence as we are not storing it anywhere.
>> - * Otherwise, if &drm_plane_state.fence is not set this function we just set it
>> - * with the received implicit fence. In both cases this function consumes a
>> - * reference for @fence.
>> - *
>> - * This way explicit fencing can be used to overrule implicit fencing, which is
>> - * important to make explicit fencing use-cases work: One example is using one
>> - * buffer for 2 screens with different refresh rates. Implicit fencing will
>> - * clamp rendering to the refresh rate of the slower screen, whereas explicit
>> - * fence allows 2 independent render and display loops on a single buffer. If a
>> - * driver allows obeys both implicit and explicit fences for plane updates, then
>> - * it will break all the benefits of explicit fencing.
>> - */
>> -void
>> -drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
>> -			       struct dma_fence *fence)
> I was a bit on the fence with ditching this, but the only offender not
> using the prepare_fb helpers is i915, and so just more reasons that i915
> needs to get off its hand-rolled atomic code with its own funky dependency
> handling and everything.

Yeah, agree totally. amdgpu should now also work out of the box, I just 
didn't dared to actually enable it in the same patch.

>
>> -{
>> -	if (plane_state->fence) {
>> -		dma_fence_put(fence);
>> -		return;
>> -	}
>> -
>> -	plane_state->fence = fence;
>> -}
>> -EXPORT_SYMBOL(drm_atomic_set_fence_for_plane);
>> -
>>   /**
>>    * drm_atomic_set_crtc_for_connector - set CRTC for connector
>>    * @conn_state: atomic state object for the connector
>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> index a6d89aed0bda..8fc0b42acdff 100644
>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>   
>>   #include <linux/dma-resv.h>
>> +#include <linux/dma-fence-chain.h>
>>   
>>   #include <drm/drm_atomic_state_helper.h>
>>   #include <drm/drm_atomic_uapi.h>
>> @@ -141,25 +142,67 @@
>>    * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> You forgot to update the kerneldoc here, and also the reference to the
> same function in the IN_FENCE_FD.
>
> I think it'd be best to put a reference to that DOC: section here, and
> adjust the uapi property doc to just state that the explicit fence will
> overrule implicit sync. And then maybe also mention here that USAGE_KERNEL
> fences are still obeyed.
>
> With these changes (which should make sure that all references to
> drm_atomic_set_fence_for_plane() are truly gone) this is
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ok, going to update the doc and push this if nobody objects.

Thanks,
Christian.

>
>
>
>>    * explicit fencing in atomic modeset updates.
>>    */
>> -int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>> +int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
>> +				    struct drm_plane_state *state)
>>   {
>> +	struct dma_fence *fence = dma_fence_get(state->fence);
>>   	struct drm_gem_object *obj;
>> -	struct dma_fence *fence;
>> +	enum dma_resv_usage usage;
>> +	size_t i;
>>   	int ret;
>>   
>>   	if (!state->fb)
>>   		return 0;
>>   
>> -	obj = drm_gem_fb_get_obj(state->fb, 0);
>> -	ret = dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, &fence);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
>> -	 * to handle more fences in general for multiple BOs per fb.
>> +	/*
>> +	 * Only add the kernel fences here if there is already a fence set via
>> +	 * explicit fencing interfaces on the atomic ioctl.
>> +	 *
>> +	 * This way explicit fencing can be used to overrule implicit fencing,
>> +	 * which is important to make explicit fencing use-cases work: One
>> +	 * example is using one buffer for 2 screens with different refresh
>> +	 * rates. Implicit fencing will clamp rendering to the refresh rate of
>> +	 * the slower screen, whereas explicit fence allows 2 independent
>> +	 * render and display loops on a single buffer. If a driver allows
>> +	 * obeys both implicit and explicit fences for plane updates, then it
>> +	 * will break all the benefits of explicit fencing.
>>   	 */
>> -	drm_atomic_set_fence_for_plane(state, fence);
>> +	usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(state->fb->obj); ++i) {
>> +		struct dma_fence *new;
>> +
>> +		obj = drm_gem_fb_get_obj(state->fb, i);
>> +		if (!obj)
>> +			continue;
>> +
>> +		ret = dma_resv_get_singleton(obj->resv, usage, &new);
>> +		if (ret)
>> +			goto error;
>> +
>> +		if (new && fence) {
>> +			struct dma_fence_chain *chain = dma_fence_chain_alloc();
>> +
>> +			if (!chain) {
>> +				ret = -ENOMEM;
>> +				goto error;
>> +			}
>> +
>> +			dma_fence_chain_init(chain, fence, new, 1);
>> +			fence = &chain->base;
>> +
>> +		} else if (new) {
>> +			fence = new;
>> +		}
>> +	}
>> +
>> +	dma_fence_put(state->fence);
>> +	state->fence = fence;
>>   	return 0;
>> +
>> +error:
>> +	dma_fence_put(fence);
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>   
>> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
>> index 8cec52ad1277..4c6d39d7bdb2 100644
>> --- a/include/drm/drm_atomic_uapi.h
>> +++ b/include/drm/drm_atomic_uapi.h
>> @@ -49,8 +49,6 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
>>   			      struct drm_crtc *crtc);
>>   void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
>>   				 struct drm_framebuffer *fb);
>> -void drm_atomic_set_fence_for_plane(struct drm_plane_state *plane_state,
>> -				    struct dma_fence *fence);
>>   int __must_check
>>   drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>>   				  struct drm_crtc *crtc);
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 2628c7cde2da..89ea54652e87 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -74,9 +74,7 @@ struct drm_plane_state {
>>   	 *
>>   	 * Optional fence to wait for before scanning out @fb. The core atomic
>>   	 * code will set this when userspace is using explicit fencing. Do not
>> -	 * write this field directly for a driver's implicit fence, use
>> -	 * drm_atomic_set_fence_for_plane() to ensure that an explicit fence is
>> -	 * preserved.
>> +	 * write this field directly for a driver's implicit fence.
>>   	 *
>>   	 * Drivers should store any implicit fence in this from their
>>   	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_plane_helper_prepare_fb()
>> -- 
>> 2.25.1
>>

