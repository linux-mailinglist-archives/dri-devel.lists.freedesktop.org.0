Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D96AB6C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 08:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EEA10E034;
	Mon,  6 Mar 2023 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848E410E034;
 Mon,  6 Mar 2023 07:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THUltGt1RQQ2CUc2hVTJq3rPQunGTX6V1vp05Pio2xXsPPFG37jUi02y4pUo5FSXi3Q5DMcQnG7KtcfEGtCCJmLVaDRYltfZiGTzd6b02PEEgIeImY91lYoA5Uz/RSiG3GTA+Jit7QUbbIggCUZL2R6urY4ntZulxIEyPTUuLwtjWmknYU7JmR0IVx2RZSm+dXaXikyMzwQfSGAcMWFWuuZhaSSuqIatBViVcpU2EySfKBts3XI9pgoCrFwZnew6Fxt8gaVA8Pig7k7zril9F29yuvJGjQqhMIw7uTJ+b6R+tv03HaOA1t8U0WFeqWiNmotV3p9mmZj1q0yvft1tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO6gdqY/4UTSuqydNSgDMI20UEOtIb/OIzinKz/5rps=;
 b=HVpbie+zJfAWfrwX7mX0HbRWK9dl5tndQh6YXUctpNUsZ3ieU51bT/ue4/RO2dnzVHhAkAViqCx+Z/O9q1Xn3dr+q+H60ToeBXNfrEfeCnBghN495Nb9LEtgq9BWxcm6h/E8Zjmj5n7PLT+v3J6GcXQlES8tmLKkSC6iNyEuUeR41PNC1Fjnwlsao7QOHirPlTZ+trBpiBpzRwTcJIAl5kPSY3a5S7zgIvboPRx7ysJctJByD+/3wzLCCl3conb9aev1SgAZQAGFRKSWs9eiGzxDU/fSoguXKwzQ0OQ4IcaeschKWmu5G9x8T3/VgkAAk42UjWBHAIAlqRHE+LGKCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO6gdqY/4UTSuqydNSgDMI20UEOtIb/OIzinKz/5rps=;
 b=KV3g5fvD+ZqXtba/92RALqE7LCV3Jv9ZE3ZQ60djo5nCtZ+Ae8CfFHgzKiqGecTdRoN/ILEkPc7jhP5lS+G8tBUVK4KuUhC12Inmiq6U7XjAXYq6kT/5QMxu2ABD4u5FVgRthXMu32PeDKj1C3n/+g3MGMTd+oeY5sUIhPA8iac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 07:07:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6156.026; Mon, 6 Mar 2023
 07:07:45 +0000
Message-ID: <c545b13c-0b01-093a-7fad-22199fcd6a96@amd.com>
Date: Mon, 6 Mar 2023 08:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/amdgpu: Use uncached ioremap() for LoongArch
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
References: <20230305052137.4030323-1-chenhuacai@loongson.cn>
 <8554af4a-5592-2102-7c8c-21f4dec3aff2@amd.com>
 <CAAhV-H45Hpuyqhxr5EMOZRgapp6hWmG8jYDykXDVjbs1bLt-Jw@mail.gmail.com>
 <37d1184d-bdbd-f20c-e9c8-285912e44eac@xen0n.name>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <37d1184d-bdbd-f20c-e9c8-285912e44eac@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 130ef58d-0307-4c2b-3d96-08db1e117c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnMwpG+4SdbOObVLmkBT20INYEzBuLePUmNP31qGk7cGBA7rMfRoRQ9npaXES9PgPOIEU/414syd8/1VZihmjrriFqyACY2cMo1ksGLU0HWkGmtiqWMrKAo9I+nGJLSviAJpaBAJZ9MKAYu7J+cBV+ni2LgS4XyoRTnSRfOqUiV8eB8nL46hfYDaVVK616WgLWj/N7kYZaUqH9CFFRoctpnKqvtZNjcI3CIynqOzRVOwBGz0WhMF/LPQmucWtdMzYUUDVDeYtdn+8cel4NrnJv6XvqE/y2S+Pe0JyzDVPq5/kD/JVZzVhBcDFqJG7lgMpDuN3AlnQLK0sEn8ySgDHoxeoAYJz75Wa8p9bUyVRxPjowJabpGujnsqvSGTVFRW+4EWxUld5MW0RLY5ylldU/UJi0D4k5L0vYb6dWrmGb7XbAYWkNgc26FEcb/PZV5MGDB30HzUX4/sz6R1HAv/gwGgT9kE322zKvm9ZzVVAogxHSZdIJGRqvo0JFE9XL0TlSUVHMDhTM8nQ2dyWkiRi4ycw72RTgSBi1NOAZJ/7gJb6lQ5RHISXNUNLYyB55y5TKQ6NEETbcqdHT5/whbivbaN0uR49bfxILv6EB8u+xNuH1/n2bKonZTEc+dmAmLWSncZ4rgHFZ78+uWWHTYxFminwRfKIv5LlW+1XbPuA38VKaXY7CBSull1eTrcfgKm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199018)(5660300002)(478600001)(86362001)(31696002)(31686004)(41300700001)(66476007)(66946007)(66556008)(2906002)(8936002)(110136005)(966005)(38100700002)(8676002)(4326008)(6486002)(26005)(6506007)(6512007)(6666004)(2616005)(316002)(53546011)(54906003)(186003)(36756003)(83380400001)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDFVZ2FMd3NMamxjaVR5TEVWRkp6RDZzbWNDNDFXL0tGdmNXZXRZczdQbW9y?=
 =?utf-8?B?STNBZytrWmx5SElVT3RFZGR1ZHZoVGhvVXdHTUw5Z3RkbDNrd0pBZ3JyZitX?=
 =?utf-8?B?bzZxZFBKa0xsamRMakYzWEtrNmQ4azJJVXAwTDFUTm5ldVpQTE42dXcxZ2Fa?=
 =?utf-8?B?aHovL2ZJYXpwL3dpZG5mRGxjdWw5TDhLZEw1Z2JXRk9qR2c5V0xSWmJmNjda?=
 =?utf-8?B?Qkp6ZXo4MGx0U09WSFJPVFJCYVBqdGdaK3hVckxxeHU0U0MzZXRadkwvOG9n?=
 =?utf-8?B?eStVd0c2MUJ4a05Vd3ZGd0RWaHF3Y1AzMzIyNkhaV3FRREdGS0d0SEp0aWRp?=
 =?utf-8?B?VG0ybFBkVStlejVENmVnTEtxN3h0clJyMVNHTmtpTDR1K1VFd0xmb2RlSVA3?=
 =?utf-8?B?Y3BaTDR5WlBJOTRtV0RGUUZYY1RzOC8vMW9iQ1FwalRCRENJRkxLVTJYdkJL?=
 =?utf-8?B?eFc1MFRxMjVrdEFoQ2wzaVBUVE13SnJpMHdCUUQ3cTBja3pnQ0tGdmhhYnhZ?=
 =?utf-8?B?bUpKM3c1MEh5dFNmc2hmbVpwMkdURVJIMGhCbnlKT3lhQS9HYno0eG1aNDFP?=
 =?utf-8?B?cjVzQUJXQW5PWlI3YStkWW5ZT3pkY1MyMFBvSlBKOU1Jb3N2RGRDa1gyaTA5?=
 =?utf-8?B?TTA4VkdWMDVlb3hzS1VjWDkyeWFMc0RnaEJ1bnVHUGVmajhNVnZ2MnlCeUJp?=
 =?utf-8?B?Q0dRTitsc2xjYmhMT2k0dHpwYWNhQjU2TitqNTk2ejJFVSsrZ0ZkM1RoUVdC?=
 =?utf-8?B?MVIvRTRVa09Db3pReVBkYWVYZ3N3dlFvY09DZ0FjNVJvaXB4YU9PNnZnSFQ0?=
 =?utf-8?B?NFdBaE9NeWw5MDJtOWd5bThQdDB0dnV3b09rbG1HQ3lIMEpSV2ZzY0NGZWl4?=
 =?utf-8?B?eCs5THNYcVptWCtTMkV6NjA1TjRYK29RSjRjdEhiYU1OUjJjT1h3V2NDMWR3?=
 =?utf-8?B?WUhDTEJTSFpUWnhydWNRSUZkb2x0WG9HQ2ZNMExyeGRtL3ZIQXMra0hpZTR1?=
 =?utf-8?B?RXRoQXJsTzZmcHhxd0d6d1k5aEZldmp1cmRMeHRSRjlHSi9PV05HTkMvTGNj?=
 =?utf-8?B?aEhsSGdkMUxxS2NxdU41N1d3bVpkeEVzS1Vra1kxcEhiN3V1cXdTR3cySHBC?=
 =?utf-8?B?Tml1cUJ0NjhLVHo4NUt2QUZkaERjV24xQjNLZEJFSHFPOUxuLy9FNmZTVENr?=
 =?utf-8?B?MUpnUWJQQkdUVW01UGtEN01lOXBrU2dOTmthS2RsRWpzekU4ODhjQnF0UGNz?=
 =?utf-8?B?VHY3QU1HWmRyanFiLzk4NC9zYlBiZmh5SForZWl6bjRBa0U0Y2pxbFhQRE11?=
 =?utf-8?B?SklwUFlvT1Z2UVdCelp1b2piYjRXRHkyd2tZbFFJdXAxL0NHVi9kalpuamxh?=
 =?utf-8?B?cVcwRDIwUDA2aXVVS0ZaRDduc1E1aEZkdWxHcFN4dXZ2dHNkN3hKaUhhN0c0?=
 =?utf-8?B?bnpoakxaT3hZMFNqaitSOHZNcmNiVlZFWlRXZjNtZ3JOTnhVZjFNd1gzVEhS?=
 =?utf-8?B?MDNCKzM1eU1YWVhBQWhhSkJPa1pXMmdQNDR6UkR0NUFUb29WeUFvclg0NGdV?=
 =?utf-8?B?MFk4bjVBZVJLUEF1VXJVWGxlbjFNZTBBWUVWTWlIZmRUMTY3a2hDcXcrTGRR?=
 =?utf-8?B?V2dxeGhGNGlYT1YwbWZha0xSVDF3a3NDNURlT2p2NzJBMTJudGp1VTVyZ2pv?=
 =?utf-8?B?RlNTTllSQ0c4LzQyOWo3NHE5dDQ0YXNuWmt2SEwwWDd1cjduUzBDNm05WEpI?=
 =?utf-8?B?MFZKUlE1dHVXS0wwRkl2Nkx0VlljQnZEcjRPc0kzNDR0Z3gwbXNBU0diNmpV?=
 =?utf-8?B?eXNHUkgxSmduWlhGTEMyVVpXdE9sT3RxdThvbCtGYUttc0hNeTFJSVA3K3Y1?=
 =?utf-8?B?UDU0eVdCLzdMWCthREVXamd0SXF5azY4bnRseDBwa2tKYURQekZUNUZZZ2xG?=
 =?utf-8?B?dUpEbTJiWEVDcTVMNjJqMWlXUTFXMWFsOXBqVVhGR2s1TFM0REZEVHQyUnow?=
 =?utf-8?B?MHNsVkloeHJDVlk0L3k2VFMyL0RmUmxRMTdkVkQ1V2x3TnZTSjBacmR5WkM0?=
 =?utf-8?B?d2xjVG52cHhyMStrNFo3ZlprTSt1bkc2Y2Vsa2FGVHZCemhlN0JxL2hpelJU?=
 =?utf-8?Q?balGKU3q58/kgXlejHdATPvw7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130ef58d-0307-4c2b-3d96-08db1e117c15
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 07:07:45.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5mpBVZYd2V0svGIZ5kph4nLYL6yxTBCjLW+TcQGNK6MLBITf+Lf0hGvq20kKnZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120
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
Cc: David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.03.23 um 04:01 schrieb WANG Xuerui:
> On 2023/3/6 10:49, Huacai Chen wrote:
>> Hi, Christian,
>>
>> On Mon, Mar 6, 2023 at 12:40 AM Christian König
>> <christian.koenig@amd.com> wrote:
>>>
>>> Am 05.03.23 um 06:21 schrieb Huacai Chen:
>>>> LoongArch maintains cache coherency in hardware, but its WUC attribute
>>>> (Weak-ordered UnCached, which is similar to WC) is out of the scope of
>>>> cache coherency machanism. This means WUC can only used for write-only
>>>> memory regions. So use uncached ioremap() for LoongArch in the amdgpu
>>>> driver.
>>>
>>> Well NAK. This is leaking platform dependencies into the driver code.
>> Then is it acceptable to let ioremap() depend on 
>> drm_arch_can_wc_memory()?
>
> Note: he's likely meaning "is it acceptable to use 
> drm_arch_can_wc_memory() to decide between ioremap() and ioremap_wc()".
>
> Although I doubt it's acceptable to you (driver) folks either, because 
> while drm_arch_can_wc_memory() does isolate platform details from 
> driver proper, it's still papering over platform PCIe violation in 
> VRAM domain. Still better than having platform defines though.

Well agree on the PCIe violations, but drm_arch_can_wc_memory() is just 
for a completely different use case.

drm_arch_can_wc_memory() checks if system memory can be accessed write 
combined as well (which is a PCIe extension) or needs to be accessed 
with caching enabled (which is a core PCIe requirement).

So completely different topic and no using this here is not acceptable 
either.

The key point is that when WUC only works with write only mappings you 
*can't* use that to implement ioremap_wc().

> Also making use of drm_arch_can_wc_memory might fix this fdo issue [1] 
> on aarch64 too (where I replied earlier). It seems people simply can't 
> stop inventing such micro-architectures sadly...

I don't think that will help for this bug. WC on iomem is known to work 
correctly on aarch64 and well tested. What doesn't work is using WC on 
system memory.

And in the case of aarch64 it's not a core issue with the platform, but 
rather that some hw implements get it right and some get it wrong.

I already had an in deep discussion with ARM folks about that and it 
seems that some hw implementations think they can combine the core IP 
with some cheap PCIe root complex and it just magically works.

Regards,
Christian.

>
> [1]: https://gitlab.freedesktop.org/drm/amd/-/issues/2313
>
>>>
>>> When you have a limitation that ioremap_wc() can't guarantee read/write
>>> ordering then that's pretty clearly a platform bug and you would 
>>> need to
>>> apply this workaround to all drivers using ioremap_wc() which isn't
>>> really feasible.
>>>
>
> I agree in this case perhaps all of ioremap_wc() usages would have to 
> degrade into ioremap() for correctness on such platforms. In which 
> case amdgpu wouldn't have to be individually called out / touched 
> anyway. Whether this is easily doable/upstreamable is another question 
> though...
>

