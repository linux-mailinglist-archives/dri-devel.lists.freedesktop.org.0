Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95233574BB3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4E927D4;
	Thu, 14 Jul 2022 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4991214;
 Thu, 14 Jul 2022 11:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfeouXmZ0V/WNxNIEcO+rWd1Xr+SMB6ETDqZR0Kw3bX7YA+79/lHns+6IEu+MwUE3EOWkQN5+cL9I8Tq+QguVODJlX9dDWrMx7IfCnHUQ8Fgq3tZb6E2ex2T1Mny4HTKgSQO6tuXHp4uppefIGEaxQxY4fRbEBjEq+GezRW/J41SjNBwggBDBlm2jSlIw9bGDSlk0cOO9OhyYrk5ZeC3Zxl1C+BVkXK7wdKeOjcMoGhQGDpb+hDV/5EeZvQ4ZFhxZXowUuv5BQe5RAX0G7IYtiqVpQRNeUs6RrrnIa84t10uXSYyqHNml81VlVJXxSj84VeMWg+pjPRx8Qv+a1ZYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ms2q7g+kIw2qwzw0Ikwj2NJKQGtcwMXurGgUHkp9xs=;
 b=Ljds8k6w86tmFM7BnmYnpdvICIN3L5u5rVRPuJze5zttnE0xWXCVtBAmAMktCeRY55qePZ25oA+7F91dHK2Toh1q2sU6APcds+WjinLVFrPnm1WEJ3aYRdeHH3xpm5W48NMyqDn5Ccw0zCmsbPTIfXZU02EGypzPQc0QmNvfEcyTxRNR2iKMjNLU5EHh24MQlA8nKygK2yo6pO4Y/3+hotW1dPVHmFrsWV90HlP3MdoC0nyNiu3kW2j0mKjcVUvY9ueJq/vwFVwD85/1ps/N4HNEiFdT/hmS9UAU7DGhcDxfc8WPDbib8aFJsHN1PUPeYMlQTgA6gJGpHq6bWMr/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ms2q7g+kIw2qwzw0Ikwj2NJKQGtcwMXurGgUHkp9xs=;
 b=fDYe+k4qaiKVJ0sxe6ZHkiSR8Fu+osSIKG8BUYLOF4ze2J2gonB20y3zgsXP51amLcpKBom0VLSP4ObbTzvDnPHFF+jVmN82Pg1iaAkT3uKkSuvC30jw97gn9Yh1VSaRSK5krie2VdQ3HMqEKUT5J7xtnFdrUaR22MYHWp+ZvjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Thu, 14 Jul
 2022 11:20:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Thu, 14 Jul 2022
 11:20:27 +0000
Message-ID: <0b2029a5-d832-cb12-8fd7-33b1d5f7486b@amd.com>
Date: Thu, 14 Jul 2022 13:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH v3 2/7] drm: Add drm_memcpy_from_wc() variant
 which accepts destination address
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
References: <20220426165148.1784-1-balasubramani.vivekanandan@intel.com>
 <20220426165148.1784-3-balasubramani.vivekanandan@intel.com>
 <20220713154443.4c2qljbqdlrbaft5@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220713154443.4c2qljbqdlrbaft5@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0140.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1398c5dc-3edd-46f3-bad0-08da658ada94
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D76ope826mwT/JEuy3MeM6JDDKAriNtxDJR1+844q9ovTvolhnhk+kvm5xSFRdHk1SsFmsJehaJw0x2k/0hbg479Al82fR8EO5LZtdOFMdMQ9TkMlZblmkODh2rE3xvUUcDkTkwARP5qFLXVvmL7oKcw0dtyHaaNbVjcgrqnCMxgjTrhdDvxa//3B1NSFKoZHyjc8Yv3/24zD7PDU9nmaHKdWBUv5+cqkVO5pg1tih/peK2MqDGxcGhGRQRTFp2qe7sl4eysK5NQ4MRS6FPFL7/+n7hb4xCwT9ZM+IPLzqdsX1Sa0Wuv5Ap/IhGg0Q3bAwfizYEm86j57jjZmGDnqSRHmmnHhhhKOOHiM3mBtbLBS5B8IuclY7s5rNEBFTqp2lfANRSv9XVUd2s168c/b7jzc/xbDRktmIu8TFWAp2QbVZUBxa+VAeCPbqZUg9GvhMGGMel5e3KRxdgVaCQp2vDnzun7PF1vhP/E3P99eukiw4fo2i8Rd1jMn2a5mDSxeLXfgFaL5nieYL947X2snWI1NdBvkINoMiQyz3F1ep9/PeVAwV9c6erbrdnAqOvTc5kLJCeKYQmqu9SwQWZO/Bsucpokd2XVlr/u5R5iEH0NwK3E3fIiBk3XN6TQQvLE/jHe0J5E75bYzBnRU8esCeYElmcBfXFNsL9fSJARF5RXeelNsRCD1zGenXrA9t45CIip6mU7yFAqSNhrs+cFX96737mXR8MjlL3zBBEuLMwEZ5YSpTk6m2StxIob6Tkw5ncKkDhFjY+JaycELguld8XiF2WTx4fFPS+nu1dBrUiaNi7reu6nfmokGDrCcUpyjTZVKeE3FW1Zsc4okp2KTnGbNtUU8ZJrKxxlD4vpFBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(83380400001)(316002)(41300700001)(186003)(66476007)(26005)(8676002)(31686004)(6486002)(36756003)(4326008)(54906003)(2906002)(110136005)(6506007)(6666004)(8936002)(478600001)(6512007)(7416002)(5660300002)(2616005)(31696002)(66946007)(86362001)(66556008)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDVGaVlrSEhkNnpGNCtYa2NFQ2R4dm42RnpLN2VFRU5SQ245L1BJbDFlTnVB?=
 =?utf-8?B?NXlCL1ZXUHdUSGt3dVNIcUxNNXpHcktodFRFY2RXUkNJUzczQmNYcCtOOVRp?=
 =?utf-8?B?L2dCTG5jSEVZU3BWU1hzUGFCWlVwUTBFTkVCamI2cjVoejFOQk9YVVNaOW1S?=
 =?utf-8?B?ZGZVQnU0bStGcEpnZ2krNUM1c2xvdFNrQ2p1MXJXZTlNVStDTVZrdERuOGdP?=
 =?utf-8?B?Z2d3bEhRbDZnaDBYQnZOQVMzcW8vSGtzTFl5blYxVUJpWVNTdUtUa3g0eG9Y?=
 =?utf-8?B?QjlYZWx1SEdSK1UrdU8wa05vM0d2OXJheFlUTWd6VEIwd2VIWTNheDdYRGxj?=
 =?utf-8?B?c0h2MUVWb2ZidStHZGdRRmF4a29XUzRWZExaK3l3R2tOcXRIMlFEcmxmVVlV?=
 =?utf-8?B?aG5uL3NoU0owTTRSUXJVSHkrWjFXTjczaVpHZU5Wc3BLaTRUTjlnSU10U04x?=
 =?utf-8?B?dDJrV1NIUmgzKzg3cVN6eEJlUEg2ZHoxRUFDcVJuVlcyY21XVDV0NFJ4N1lK?=
 =?utf-8?B?M2ZxZC9LSmZrNGFJOVBRT0FvSWhUUC9yanVDRVZqcitnUjhGS21sTFpmN2FU?=
 =?utf-8?B?ZEZEQ2JlNG1tdXdCcHVtVkp4ZWMxRG8vNS9oRzliR21sOHkzY2hsZjViYzZC?=
 =?utf-8?B?VTBtRC9GL0xrQ0JEZ01LWU5yWUdJamFzTnVwRGJ0Lzl2WHF2b0JwUHdvSGxH?=
 =?utf-8?B?bWorZS94SVBYOW9uM292ZkgrcmMvMUZIaDV6a0xKOEp6ZHNKa0lBRGx4VnhJ?=
 =?utf-8?B?b1pNYlVHeGlFV3p5RiswKzBOdGJlTVFoVWRjTGl3SDltbnUwQ05JZXZsSTVy?=
 =?utf-8?B?VUNNc0N0VWMzeVRYSVVqa21yZTMzVllvQTR3dmdwbnowa1d2d0FYelF6bDRy?=
 =?utf-8?B?anVYUTVwWjBvTEo0d2d3V2N2T08yc2xpVzdmbmkzL3duTFE4dWJkRE1VYkxI?=
 =?utf-8?B?RWlBckw1dHVEZ1hlSTJoNVhvMXY5N3VtaURIOXMzZnlwcU1PS09Da1kvcWhR?=
 =?utf-8?B?a0Y5RGJMM3p5MFk1d0tTNEZJaWtaNVB1aVJRcHZSdFRiRDV3S2dFd011bTM0?=
 =?utf-8?B?aHBKaDMwVXRXN0pTbDYrTTVXdU5PZEszem15YUJwMnJHRDRDajFFTTdoZndD?=
 =?utf-8?B?YXhpV1g3UkNRcEp4REkzUWRXaDZCVlVYKzgrdGdySmNQY3RubSs3WHdqZE1K?=
 =?utf-8?B?bnZFMG55dXdiVjVrVjdoaCs0TDU3QzR0NFJtbzE4Nms1NEQ1Nm0yMW15anJu?=
 =?utf-8?B?N3daQWphQ2lpVUxWMjhhZ1A3b2QzZUIwUEZZK2pSNVg3eFZVcysweVp6YmJk?=
 =?utf-8?B?MHBTbG5nTUI0aUljckF6dWY5YW4xR1J0YWc3WTJpTFJ2bUZ2R1pXZldGMENH?=
 =?utf-8?B?QmR0cGlFVG9Mc1ZxTG1WWUdPNU8vWHpQRnN0K1lha2ZndXlaVHpIYjJZOVRj?=
 =?utf-8?B?U3cwNzdxdDZlSkE5TWxVM0tKVnU4bGd5R08wVUhCVy9xc1RZL251cnFnYU92?=
 =?utf-8?B?M1RycGUrOUx2YktyYlBmYjB4dHh1NWZHT3pEWFVhVXBLY042UkhFbXVsWWsy?=
 =?utf-8?B?bVZIVFJJVG9qUDZ4elNqOEd0bXhRRUJJdHhCakFEMHFyMUNGb1ZRRjlhZEJ3?=
 =?utf-8?B?TmhBT21vdTJQVVFNU01kdDV1NFdiMWllMmllakpUQUh3TlNPRFBOcEVQMUM3?=
 =?utf-8?B?Ty9jZEgwV3ZRVmZvbFVVUUgwYmM1VGZPRGs2cDRxaitLcDFud21DMGtOZFlS?=
 =?utf-8?B?RUY3WHJEQldGK0xTYy9kSG9LNllLZCtiN1dPdVdnSVdkNEVvb0hnRmQ0SlZB?=
 =?utf-8?B?MWt1bWxiWkVsUHZUZzFmcW1hT1BTTGJRdE9HeWZDaGRVWVhQclBkanVqZTVO?=
 =?utf-8?B?cnlsRnljRndFbWp0dWdvNHpaM2JlR2lranN4VjllT1F2ekkwUUEyUkNkUlJZ?=
 =?utf-8?B?OE50SlRyTG1RR2NWTGNwUlNlMHFqZG1HZVhURmh5TTJpUWk0dURoSGh5ZWha?=
 =?utf-8?B?Ym9CYURadVFDL1RKMUZNYlordFM3R2ZyY2x5ZzdLQjF1UVRKSUtMaW9UYkhj?=
 =?utf-8?B?R1dBOVZzRDUvajNpT0l5ZkhvcXJGVHlGVmhjbWxzaTdKTnJLbnVuUllqRkFn?=
 =?utf-8?Q?3pAJcaIsgBuaithlAq0MEXCLy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1398c5dc-3edd-46f3-bad0-08da658ada94
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 11:20:27.5137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJvovckUJwNO5SAEcOUHpDAJ7O0H3TRXFGFtmg9IhpSV8AzStL5Nfm9kcUXRn+f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757
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
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 siva.mullati@intel.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.07.22 um 17:47 schrieb Lucas De Marchi:
> On Tue, Apr 26, 2022 at 10:21:43PM +0530, Balasubramani Vivekanandan 
> wrote:
>> Fast copy using non-temporal instructions for x86 currently exists at 
>> two
>> locations. One is implemented in i915 driver at i915/i915_memcpy.c and
>> another copy at drm_cache.c. The plan is to remove the duplicate
>> implementation in i915 driver and use the functions from drm_cache.c.
>>
>> A variant of drm_memcpy_from_wc() is added in drm_cache.c which accepts
>> address as argument instead of iosys_map for destination. It is a very
>> common scenario in i915 to copy from a WC memory type, which may be an
>> io memory or a system memory to a destination address pointing to system
>> memory. To avoid the overhead of creating iosys_map type for the
>> destination, new variant is created to accept the address directly.

Well that is pretty much a NAK. iosys_map was created to avoid exactly 
this kind of usage.

Creating a temporary iosys_map instance on the stack should have 
basically no overhead at all.

>>
>> Also a new function is exported in drm_cache.c to find if the fast copy
>> is supported by the platform or not. It is required for i915.
>>
>> v2: Added a new argument to drm_memcpy_from_wc_vaddr() which provides
>> the offset into the src address to start copy from.
>>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
>
>            ^ utf-8 error?
>
>>
>> Signed-off-by: Balasubramani Vivekanandan 
>> <balasubramani.vivekanandan@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> drivers/gpu/drm/drm_cache.c | 55 +++++++++++++++++++++++++++++++++++++
>> include/drm/drm_cache.h     |  3 ++
>> 2 files changed, 58 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> index 2e2545df3310..8c7af755f7bc 100644
>> --- a/drivers/gpu/drm/drm_cache.c
>> +++ b/drivers/gpu/drm/drm_cache.c
>> @@ -358,6 +358,55 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
>> }
>> EXPORT_SYMBOL(drm_memcpy_from_wc);
>>
>> +/**
>> + * drm_memcpy_from_wc_vaddr - Perform the fastest available memcpy 
>> from a source
>> + * that may be WC to a destination in system memory.
>> + * @dst: The destination pointer
>> + * @src: The source pointer
>> + * @src_offset: The offset from which to copy
>> + * @len: The size of the area to transfer in bytes
>> + *
>> + * Same as drm_memcpy_from_wc except destination is accepted as 
>> system memory
>> + * address. Useful in situations where passing destination address 
>> as iosys_map
>> + * is simply an overhead and can be avoided.
>> + */
>> +void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
>> +                  size_t src_offset, unsigned long len)
>> +{
>> +    const void *src_addr = src->is_iomem ?
>> +                (void const __force *)src->vaddr_iomem :
>> +                src->vaddr;
>
> checking this again... this is a layer violation. We do have some in
> the codebase, but it'd be good not to add more.

Yes, agree completely. That here is something we should try hard to avoid.

>
> later I'd like these memcpy variants to be moved iosys-map. I'm not sure
> if Thomas Zimmermann or Christian agree. Cc'ing them here.

Again yes, that sounds like a good idea to me as well.

>
> Maybe we could scan the codebase and add a function in iosys-map like:
>
>     void *iosys_map_get_ptr(struct iosys_map *map, bool is_lmem)
>
> ... which is similar to the ttm_kmap_obj_virtual() function we have in
> ttm.
>
> so the cases where the layer is violated at least they come from a
> single function call in iosys_map API rather than directly accessing
> is_iomem/vaddr_iomem/vaddr. Thomas/Christian, any opinion here?

As noted above creating an iosys_map instance on the stack has basically 
no overhead at all.

So we should really switch those functions over to using the structure 
directly.

Regards,
Christian.

>
> Lucas De Marchi
>
>> +
>> +    if (WARN_ON(in_interrupt())) {
>> +        iosys_map_memcpy_from(dst, src, src_offset, len);
>> +        return;
>> +    }
>> +
>> +    if (static_branch_likely(&has_movntdqa)) {
>> +        __drm_memcpy_from_wc(dst, src_addr + src_offset, len);
>> +        return;
>> +    }
>> +
>> +    iosys_map_memcpy_from(dst, src, src_offset, len);
>> +}
>> +EXPORT_SYMBOL(drm_memcpy_from_wc_vaddr);
>> +
>> +/*
>> + * drm_memcpy_fastcopy_supported - Returns if fast copy using 
>> non-temporal
>> + * instructions is supported
>> + *
>> + * Returns true if platform has support for fast copying from wc 
>> memory type
>> + * using non-temporal instructions. Else false.
>> + */
>> +bool drm_memcpy_fastcopy_supported(void)
>> +{
>> +    if (static_branch_likely(&has_movntdqa))
>> +        return true;
>> +
>> +    return false;
>> +}
>> +EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>> +
>> /*
>>  * drm_memcpy_init_early - One time initialization of the WC memcpy code
>>  */
>> @@ -382,6 +431,12 @@ void drm_memcpy_from_wc(struct iosys_map *dst,
>> }
>> EXPORT_SYMBOL(drm_memcpy_from_wc);
>>
>> +bool drm_memcpy_fastcopy_supported(void)
>> +{
>> +    return false;
>> +}
>> +EXPORT_SYMBOL(drm_memcpy_fastcopy_supported);
>> +
>> void drm_memcpy_init_early(void)
>> {
>> }
>> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>> index 22deb216b59c..d1b57c84a659 100644
>> --- a/include/drm/drm_cache.h
>> +++ b/include/drm/drm_cache.h
>> @@ -77,4 +77,7 @@ void drm_memcpy_init_early(void);
>> void drm_memcpy_from_wc(struct iosys_map *dst,
>>             const struct iosys_map *src,
>>             unsigned long len);
>> +bool drm_memcpy_fastcopy_supported(void);
>> +void drm_memcpy_from_wc_vaddr(void *dst, const struct iosys_map *src,
>> +                  size_t src_offset, unsigned long len);
>> #endif
>> -- 
>> 2.25.1
>>

