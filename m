Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDA4AC161
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E719710E2B3;
	Mon,  7 Feb 2022 14:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4C110E29C;
 Mon,  7 Feb 2022 14:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jug7BrhOINg8AGV0NXG614u5YXE1yOttaBBxSiLUqGAydWXGYb5aj+Nf9Q62CardJInvKZAoq6Hc/Pt0U1uu1RpJezT3dBc/UcqfpxTR6oCraCrRfyOY4N/TVWkeSzJddWWueW2P7FcIRoK26VsY33YiqPvji1W+kd6Knhna5u2kv/16h7z304xfK/zysal1dMGkcbaPp+4BLGGy2Zsc/6V8CamzP6pllwAQXwut0HM8KCCvgyFa5GYnHcDQMtcIDILI4DfhVeR9mOSCwsyAahY1WoCet+WW8yzHynoju/QFvLSGY9rOPhAAHLU7qec62FfkKg8Wsbtpw3MMZgonZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcwnHNo8oLMe2RWFVk1Skb9zShvZzxndlmJwaTi7gzA=;
 b=Nw8KljmK7rEyDBG9doakxS7jZdJGdZBubdvPQ1ISiN8EPy7pGyOafO8yW3S9AVpqFtBB/1B+d8mmLtIlBwNuSQmJW4foz9nW/ypSaISJoQjbiSz1boiLZHGaQVmdkrnAptCTbfgkDHfS/WIvOfiAJ567TzGAyVt0O/QdmLfAOGiwtlPBkhVpQbScl16SZ00WXEkTbIJVUfgkjdoFOi4IkRvuTKZZUZjuHK12NO4gk+ONTpxqYhtlUxHbHVeRT7yuKsD7LQVKsNtEfqnSG2S/Fn2m5Zge32HAhs+c2zJ1a80YRQLGKlfB3rd7RoMTNTYRGtxRHoEfZoUyaCVymAx5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcwnHNo8oLMe2RWFVk1Skb9zShvZzxndlmJwaTi7gzA=;
 b=jxybwD9xRvpXE/NLVdt28ChpOoaR4S/JtO9F5GoVJ+nG9s+OHCzREazeNFfqtPiG7h+m6JO8VfhEtK0B9YclDL/Pch9KkCJTPQQq5SNEPQgE8OwQ2xdi6fJ6c5LOODKVDGkhUUAcHFsEWge+cbW7+yusb5F9hI8BVGQcyKLD/FQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB2864.namprd12.prod.outlook.com (2603:10b6:208:ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 14:37:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 14:37:16 +0000
Message-ID: <aa92b781-b1cf-04ea-7073-d53651d72579@amd.com>
Date: Mon, 7 Feb 2022 15:37:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] drm/i915/ttm: Evict and store of compressed object
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
 <20220207135335.GA15175@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220207135335.GA15175@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0136.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36470abc-b558-4ccf-6c7a-08d9ea475628
X-MS-TrafficTypeDiagnostic: MN2PR12MB2864:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB28648FBA20E2C3686A7FA66D832C9@MN2PR12MB2864.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXj4zBR4lGnPY/FN3yImzl36Mw0UwPCJFDVUXYVmz/ruGebeRyreJq3fKbt6W4llFT1bIrXB3Xc+sPRpPirOfu+Zhi65VY0JGwr+exPk2MvT7uEgj5C18OrGT/5ADDLu9AWQHfkQlha5ldBZ1LtEGPB0EjCSr+T/+g6Q80g5dRh+316uNljgqXlTx8L9FC/bTV+FwLgwq0pAz34PIKGMiQdBGIrC2uVGdm2ESwibkc6f9QhV0YVlHVGBCIIZtSxOXr+G3kdnxvtG3WsUNGXpwFyU+OfJxD8p1rdZ8aE/dKnLic0J40T9F5orFbDWiOFV3scaVmsCO3lhqzpyXEbA5aNBEjyCOQsdNdEnmP7sSxGlgTeKXX1oTsxKhrKHsn3OghBbp5WQDZagP14XOVQXa0WZ/K+HTt6BDpIHiuQ+wnulnfwYa77QHXA+jfR70HhEicpK3XL2Xsj4dqwFrh3D5/7TNcldW5ciErbcX2phb2jvXZMmqYvtMwGa5Yat2+qb3rZkuPJ0jxudGKGmhPrEYiuNlOn2/cmM8CQqq9Ab6QxxriNbxBFhmrygjXrgNoST/JdLZvoeds9OgIUzOPsPyXiW+UXxUHwpYu3WTC4+JWiGtTbe0cRgoYPeYCEhog35KBHymBPu7DfDufG3VMEcyRz5p+WO7DDy2UyCF6tnZ2y4KvuoOOyI32tVnES709JI7o2Zn9Q9An+4PsnxfhVFGFxNONcYLshX5L8ETPUuSlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(966005)(6486002)(186003)(45080400002)(53546011)(83380400001)(54906003)(6506007)(6666004)(6512007)(31686004)(5660300002)(316002)(6916009)(66574015)(31696002)(4326008)(66476007)(66556008)(2906002)(66946007)(86362001)(8676002)(8936002)(508600001)(2616005)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmEzLzg3NG11bGc1dFZtODhFYUpRUTArVDQ2SVlGcmFuTUFtWDMyejlsc0Ez?=
 =?utf-8?B?SmVxYXEybVArdDV3a1RXVmFhelF6Y3hCbGwvdmZmeEorb1prbHNBZzFoZXRM?=
 =?utf-8?B?L2VwemNnS3NkWC83Y2ZzUzhNOXl0MnZlWXp1WVZGMXFURWtWNlhXTG1aTjJC?=
 =?utf-8?B?Ky9NeGI2M2JROTNMcmtneGlPRTZOcU5aNUVzVGM4NFBIL0VBN0lXZmYrNDJv?=
 =?utf-8?B?eURYcExkN25xaHhSTDE5YzU0L0xRNjA1Q2NEVElwMUJINHdJMGthT2Nod2w3?=
 =?utf-8?B?b3ZWdE9kU0UxTThiM3dLNDMwRjdYRUIyb1NGclVGZjBWdEE5RzlIM0ZCUzNW?=
 =?utf-8?B?azNzNVpIeDhEOGNqTEJPYUVyWGp1bW1IR00vaTBtNlJjME9LKzdoVkRVUk5R?=
 =?utf-8?B?MzlqSlQ3eWp3aUREdlB4OWJKYnI1SUFXbHI3WEJEMGJNQUFzbnlBR3p6ZmFw?=
 =?utf-8?B?aUx5eXQxSVNTc1RETHZINW5WeEdoRWowUU1QRUxzbkErT1NtbFZrallDM09P?=
 =?utf-8?B?MVpEdUxYVEJLaUM5V3FVRTRrcnRsZDRUVjJCTSsvazA3MEJZbmlmMHFacVhS?=
 =?utf-8?B?NzdtOFQ4U1FkSTVJTG00aGpQU1VKenRyeFJXc2o3WXJpc2VGMWQ2ZlN0Ui9x?=
 =?utf-8?B?OERaRWM4M0hTditseU02bG1iaHZpcmdOby9UZGVSOUh5VVZIWEZuQ3FSM08v?=
 =?utf-8?B?VXVQYXVuNUFZaG9SNzlVakovK200THc0QTMxeXhyR3cxRjdpOUhiNGlBdlBB?=
 =?utf-8?B?bS8vR1I3dVJ0akJ3MGFVMUNoWHNkTTVOajhwZ005d3huUFZjb2w0Nm1US3hR?=
 =?utf-8?B?R05WdGtPZ3VFK3pya2lrQUNHL090aUxKMEFWbnh1QVpraytPcWNjRW9NbWgz?=
 =?utf-8?B?ZjNYUTM4b3U3MmNPTTVORzhkY3pLWDZ1SEtJVDVOV3RaVC84Um1MRjVMWFh4?=
 =?utf-8?B?SUI4N3MyS3p6VWdYcEc3SVNlanArazNCQm8rdW9QcGNXUngrVmxBSkg0ckRP?=
 =?utf-8?B?bHZ2cnREbllJVStRWVQrcUhYcU9WSzk0ZUpOUkV2MDdrYWhzL21iZ2RXTUhw?=
 =?utf-8?B?SGN2djYzSjA0dFpHVlpyM0lROVc0QmVBTnp4MjVwUWhDT2NXbXJESVpBUzlw?=
 =?utf-8?B?VDY4Ynp4emFVQ0pxbEtDcUJnT3NkYjM1cUh0YUVRUEN3ZU45UklHWC8wanZw?=
 =?utf-8?B?YTBBaU5xeWNjM0pVQkZBM0hKL2FaeVVjNFRqSktVNE8xL3p2T09yNUFMc2Y0?=
 =?utf-8?B?QVpLenk3OU5XSkFwQ05TT0x2cko0blhTMFdQRFZBZGl4Uk5UYTdweGtkL1Ur?=
 =?utf-8?B?NjVJTnExZEpFclRJUDYvWUc0VDJFSE84R2NSQ0FJcllEZFRXNDBiazc0ZTZK?=
 =?utf-8?B?a3NwQ3JkSUZiaXYwTW8vRGI1YWI1QWsrRk5ralNCWjE0NGFBWXVNWStsY1NX?=
 =?utf-8?B?OW5TLzNJaEtxc3VUTTNLaDJDV29QS2p5UXVrNXh6eWU1QWU1RC9FdGRSdUhP?=
 =?utf-8?B?L3BWZDgyOXBvRzdjbFZxSUhQSjJNUW9qaytGZjNGMmlwYjlrMm9Ma1pDWE1y?=
 =?utf-8?B?em9GOWxJTFFLR1FoOWpiMDFKWlZnSlQwT2tGRjkwMkZNc1RCL2NzNkFRYjhC?=
 =?utf-8?B?S09DamkvRjFkckZQS1lBZDdndm9VL3ZsWk1nOHFUYnphdi9YTFUzS2ZMcGxW?=
 =?utf-8?B?SytCSnV4Tzh3ZDJRMFNsSitxazlub2VaT09SMXVhWnp0NEFMZjZWR3RuVnBX?=
 =?utf-8?B?VHEwZzNiZWZVMHZOVlFtdmtNMDVuNlpGK0xnV1R0NTlUcG1odmNNdXNOSW4w?=
 =?utf-8?B?NkVzWFRMMU5FRjA2ZTVYV01tR3o0OFoyV1g5UUkzd2NhbTk4NTA5NkIwL1Nq?=
 =?utf-8?B?YXppSjRoRXBvc2RzMW43V2N1SHd2UUJhRm9GbXF4alQ3RjR1aEFTWUp0eUJM?=
 =?utf-8?B?dTdiVDZmNGhEaTVaU1FXM0FNL2FqdFpVRWxxcTM4TXEzdHA2dTBaM2xlVUkw?=
 =?utf-8?B?VzJ3L3RMTElXMFhoV2VvVHFST2Y2c0REQTNSSCtKeHNiNGYwRWwzbnY1UDZR?=
 =?utf-8?B?RWtLd1N4M2RBY3NncnVYQ3NWcEJmdHZpbGZmbHlFRFpMcWZVbmhoUkFKQ0hy?=
 =?utf-8?B?R2xUUGxwYXVLeVRYVGZJNHlUanZjRlBrYnFveVhyS1NiS05nOEZtcjN4K1dh?=
 =?utf-8?Q?5Lsp43hgXGVuw8VszhMo0oQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36470abc-b558-4ccf-6c7a-08d9ea475628
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 14:37:16.0421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIGHk/Yhym73ESdp6BPnkNLgac+ibr5CqbzGY4TqK+eSlQIvS/Mvf3dzjSp179ls
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2864
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.02.22 um 14:53 schrieb Ramalingam C:
> On 2022-02-07 at 12:41:59 +0100, Christian König wrote:
>> Am 07.02.22 um 10:37 schrieb Ramalingam C:
>>> On flat-ccs capable platform we need to evict and resore the ccs data
>>> along with the corresponding main memory.
>>>
>>> This ccs data can only be access through BLT engine through a special
>>> cmd ( )
>>>
>>> To support above requirement of flat-ccs enabled i915 platforms this
>>> series adds new param called ccs_pages_needed to the ttm_tt_init(),
>>> to increase the ttm_tt->num_pages of system memory when the obj has the
>>> lmem placement possibility.
>> Well question is why isn't the buffer object allocated with the extra space
>> in the first place?
> Hi Christian,
>
> On Xe-HP and later devices, we use dedicated compression control state (CCS)
> stored in local memory for each surface, to support the 3D and media
> compression formats.
>
> The memory required for the CCS of the entire local memory is 1/256 of the
> local memory size. So before the kernel boot, the required memory is reserved
> for the CCS data and a secure register will be programmed with the CCS base
> address
>
> So when we allocate a object in local memory we dont need to explicitly
> allocate the space for ccs data. But when we evict the obj into the smem
>   to hold the compression related data along with the obj we need smem
>   space of obj_size + (obj_size/256).
>
>   Hence when we create smem for an obj with lmem placement possibility we
>   create with the extra space.

Exactly that's what I've been missing in the cover letter and/or commit 
messages, comments etc..

Over all sounds like a valid explanation to me, just one comment on the 
code/naming:

>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching)
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long ccs_pages)

Please don't try to leak any i915 specific stuff into common TTM code.

For example use the wording extra_pages instead of ccs_pages here.

Apart from that looks good to me,
Christian.

>
>   Ram.
>> Regards,
>> Christian.
>>
>>> This will be on top of the flat-ccs enabling series
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F95686%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce54bb7576a334a76cab008d9ea4138e5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637798388115252727%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V9wQZvb0JwtplIBSYYXGzrg%2BEMvn4hfkscziPFDvZDY%3D&amp;reserved=0
>>>
>>> For more about flat-ccs feature please have a look at
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F471777%2F%3Fseries%3D95686%26rev%3D5&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ce54bb7576a334a76cab008d9ea4138e5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637798388115252727%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=aYjoTKMbZvi%2Fnr7hkSH4SYGxZIv8Dj210dNrBnUNpQw%3D&amp;reserved=0
>>>
>>> Testing of the series is WIP and looking forward for the early review on
>>> the amendment to ttm_tt_init and the approach.
>>>
>>> Ramalingam C (2):
>>>     drm/i915/ttm: Add extra pages for handling ccs data
>>>     drm/i915/migrate: Evict and restore the ccs data
>>>
>>>    drivers/gpu/drm/drm_gem_vram_helper.c      |   2 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  23 +-
>>>    drivers/gpu/drm/i915/gt/intel_migrate.c    | 283 +++++++++++----------
>>>    drivers/gpu/drm/qxl/qxl_ttm.c              |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_agp_backend.c      |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_tt.c               |  12 +-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
>>>    include/drm/ttm/ttm_tt.h                   |   4 +-
>>>    8 files changed, 191 insertions(+), 139 deletions(-)
>>>

