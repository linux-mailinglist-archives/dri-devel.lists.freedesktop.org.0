Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13942B2A4AA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 15:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4010E009;
	Mon, 18 Aug 2025 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1NcP56+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C817410E009;
 Mon, 18 Aug 2025 13:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHgpCaM944b1l66BoPc63m+JqP8Af9fTlYyiyQqjOvcVAB8j9IwlrMPiC1USSVF9N25osbF59kIHnxuQJNqYYNI9c8B1JF4MMbeDeYXboaH/QVO7rU+U3rlGOPQALfRc3Tl/3WTv3709KJRx/lsjCteQJQXw2SkJZuTKWOY8GH+VxYR1dnL1lbXguXK23YgiP4DcVFdJTDa6utHFD1TxjxqNysxW4Nnxby33URRuoQI2dvyGOK2qO9hglk4OKE9qsyl54PwI53Oi4rzXPP00eOk2LxvO/SpNtllv0CJ1l6cUxuQOsovFvDQJs9lV5dpWl/QBm0vCtGTCgo42g5QYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uxv+qr1//0w9w4Do1THNGfU7GlTw+lN2aye8Cl7IssM=;
 b=Qayp+LsEBt2wuxKyO1PK9PhNhedsOOdttoXa9RHE7Omht66gzwjXS2r91VCf9Aq5D/KvBjHT74lCdrMs/fh1My9DOy6OTi8llHqF65dKu1MGrilRefKcHoyKf/y7GQLuyQTC91LkYTgS9XCbsO7GanMDGJ8SIb2nQJqMcT0HyDObHLA3gk2crNpl9qMg0IA4r4IfyZOGrMNbPVRhHXJcgT6Y6ctg+4QfO5seLkg95oxo0qhSaVrYI9Y72wbE8kAIJlZNF6SVMF18vvKwu+KSzFqoAcr5ct+0rEgJ9DAH+A5kXArLabNN/Em4dKOph4zIN35RefrfrumizRWFu9mpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uxv+qr1//0w9w4Do1THNGfU7GlTw+lN2aye8Cl7IssM=;
 b=1NcP56+1uuUwigBNiqgd3l2EI+QAPFwmSQ2kQxoEC34/i7O8xJEV1nty3HCQ/jASLCv50r3qjRqey0QUOaYQwuOXrLmBCxQ/s/ZsIjracNzvcgduUIEWk37g+4SobBaak9Wuska6dTQh+FnMQzR6icq+0jKCTEjqa+ixVKLVS0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Mon, 18 Aug
 2025 13:23:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 13:23:42 +0000
Message-ID: <6cb1d152-898a-4cc4-a086-44d85cf7a24d@amd.com>
Date: Mon, 18 Aug 2025 15:23:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Pin buffer while vmap'ing exported dma-buf
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250818084148.212443-1-tzimmermann@suse.de>
 <6f409954-2e01-4e87-b8b7-5688bea837f6@amd.com>
 <7c2d8894-7eb5-4c86-a80a-935fcf24ef83@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7c2d8894-7eb5-4c86-a80a-935fcf24ef83@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 336ab661-9458-4ace-8410-08ddde5a73b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktaQTNqR3pFd2NyZjFZcnRBUjFEVldJR3ZWUEhvdGpWSGdTdEs1WURCajE0?=
 =?utf-8?B?Zm00a3Y1d0ZaOXNFYWg5azd3WDIrS053bjhNeWhKNXkrQm5XOEFxOFU0RFZG?=
 =?utf-8?B?T0x6cVBqa1ZvUythRSszckdRQ045cTlUMjA2UUhCV0ZRWFNhNytYWnBBNXFS?=
 =?utf-8?B?cFAwRStDQkhPZXVjaTRrTlhMZ3JrZm1IUHZZbG5Qc1VXN2dNK3p5M211NVlz?=
 =?utf-8?B?TkRuaWljbDlhQWV0YkE4bXBxa20yWWpFZFliRG9XMnF5MWhRSzVNUlJzM1lI?=
 =?utf-8?B?ME5SQ0lXaWwvdDVZOGZaZ3FpL1g1QWFrT3FnR2RLN1JFSG5zOWZJQ3R3MVg5?=
 =?utf-8?B?MkNiSmd2dldobmRRWnZDRUkveDlFTlFLNDk3aVQ2a1h4dHdBTmR4ZnRVYnpm?=
 =?utf-8?B?dXFwRzRKV29pTmQyNmJ0c1hhSDJNOE1WREoxQklQVmNBaHFmcit4cjZ3Ulc4?=
 =?utf-8?B?YWNkTzlOZGhXNHhtbDVUTWdySTFJUlN2VVVjeHpsOXlUSDdjOUl1cmJNTE5W?=
 =?utf-8?B?OXNINXM2a0JRaXk3RlB1elk5THNPc3IrNU50VWN1UFFvbFQ4R2FTRHdlTStP?=
 =?utf-8?B?bE9GRWlsem1TTjBMc2tLMngxTFA4dHNRQlhCTnE4QTJtMCtaT2JRY1JDR20y?=
 =?utf-8?B?RXJGVmVxeWg5aFo0OVN0emk4K2Q2SzR3MWgzYkc2b21iVVNsalpoWkdRQWhr?=
 =?utf-8?B?Yi9MOCs3SUlUY2NqOHd1TlVPNDFZSGtpelZOWWNJcWpiQm1Hak9WRVVLTFh1?=
 =?utf-8?B?SlQ2aHJYZmIvNWxLZmdvS2pXZml5RVpaaUNxdWhBa29RQXdlZHdXcFd4MkZF?=
 =?utf-8?B?QWV2N0UwS01oUnJmOXNPY3ZuOWMxTHdjbzVpNWdIamVwSHBiSlhmWVNzMzVk?=
 =?utf-8?B?emlrRDNUWmg3NzdoMlFxaHMxZjFHK1pSaFR0czBPSXo2YW1iNkdsMFdMMUlx?=
 =?utf-8?B?bjJRRmRVK2pZbkx0eHRDS2tUS3NRQ1BZejBSanZld0tSeHJUeEpOeGdZZ2ZT?=
 =?utf-8?B?QmtTTnVpNFg1TzYrQ3dQMXg3WEtNME5NYXJndW1zL0lBUVB2ZkZqWmJManc0?=
 =?utf-8?B?MGxLaXhZbktCbkg5ZVE5RnB5cGdFQU82ZER3Y2R2aDk0M1g5b0NDNVRCZ1E0?=
 =?utf-8?B?VFlReGpQbkN6enBUNHJwMTNlR2U3Ykg4TzNaWWJNdkFYS2dVUU9wdklUSWhN?=
 =?utf-8?B?dFZnVUVHWW9yeVkwb2p2RUY3VUdwWHJUVGx0TXZ2MU04QU5PeXNTL1pOc1lS?=
 =?utf-8?B?dHcxZklJNE9NeitqUmV0MXJlcmErSzl0ay9nYVk5blFTb0J0M2JMdEZ4aXM4?=
 =?utf-8?B?T1hYcUlsMC9kUXVobjI4SDdVUENxVExwWk5vMmlHOGpvRHgyMkFjTGlLdEJi?=
 =?utf-8?B?ektkR1NWdXZZQUM3dGdrdDZ3U2Q4N0VIS0g5TXY1UTBEV3dNOGtUSUEzWkU1?=
 =?utf-8?B?UmlrZVU5a09IbkVwZ0NNUWZNSTVhd0tDZjJCN3BYb1hrdG5YRjdUMk9pSGJK?=
 =?utf-8?B?VG1Bb1A2L1Rha2NVeUpBMHIzK00zQlhDOVFsWkJjWU9CcnVlZTZaSjZXNEdD?=
 =?utf-8?B?Uk5NT1R4aHUwTStxTXdSUS8raDh1cHBSZEVZei9uRDBnVWhzZHZEdUxrT3Bu?=
 =?utf-8?B?V2VvYjFuVk9KeVR0V0hlR29KcmdPSUljcnRlM3lwMDA2WHRtdnVkNUEvemZN?=
 =?utf-8?B?UFJuV2hzN3RtSW9PMDJPZmFFVVBkejAwb2dlTjJrSWRtajlhejVnUlBNVzF5?=
 =?utf-8?B?c290QXRyK3VkS3BhVjlPWmhWYXBzcm1hSEFrclRVUnFWUEtrNlgzYStVYU83?=
 =?utf-8?B?ZVVyN2tpYk9DZ1NielUzekdaZzVwQmZMSGJocXIyZUdLZWpreFZra1R3UVFn?=
 =?utf-8?B?OGJ6UHdMRm03Z1paOVVZSFJIZ3lSMGxBVlVESHk2alRtYUxxT0lWWnJIYW0y?=
 =?utf-8?Q?3vcE37udhpg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVo0eGx3dXZhTDRpVmFTTmdIVDN1RXRzaVV0cW14cURHNkExZTl4QktETlF1?=
 =?utf-8?B?WnZxOEVVMVh5MFp3L3BENnhzaGlNV0tDZEZmNGgrVmRJbVJBYU1TRk82b0sw?=
 =?utf-8?B?V1JXMWxhbDROdDZlV2lNN2svK2tNcWdmM0RJNytUMm13bUZ4YmpuREtNdUtv?=
 =?utf-8?B?REowTzdMMWtyUFk2dE9NZkkrMWMwWFlzSVhZb09oU2xnZTd1NGl6RFc4UlJp?=
 =?utf-8?B?VUROaFEzTEFXN3hjcE5QTVBiYVZNclU5cHFHYXZEdmFVSU56RUJVYU1idXBI?=
 =?utf-8?B?WmxLZ1BQWklreVYrOURwTUpxdVZKQWlVMUtVb0JheHc5M2tJZXBPWkVLVzlO?=
 =?utf-8?B?WHppVkdicjlmeWFqR1QySjVBMU1vUTBDbDd6Y0VDYjl1RVdmVW5FR25yaHpl?=
 =?utf-8?B?eEg0OGVrOU4yaUZqcUJFQjMzZUp6ZHhpUlIvL0YrNUNUNE1iYWJOVDVoWWZM?=
 =?utf-8?B?a0NoOXB5c2ZGS3JpYTM4TGtGZXQxRUxwNW5KTjdLNzBLTWlvLzFwb2VSbHFF?=
 =?utf-8?B?eEZ2RkFCS1NZQ2drVVFDSkQ3WktJZ24wOGlTMm9wdzhaT0lhQXZab3RLVFVU?=
 =?utf-8?B?aGt1RFM2KzZ0Y2dLL2ZOSjNQUjlZcHl4VFNVUnFkbWgxZko3UnRjM212T1JU?=
 =?utf-8?B?d0RMbUpSdGdZUVk0aWF3RENhZUxDam9sQW5selhMRi91Ry83TGhPNkxhaVNH?=
 =?utf-8?B?dlNTam9YZ2l2TmdibTZEa1h6TVlSejVORmN0MjYwcWZCejRTbjN1L3liL2Yv?=
 =?utf-8?B?UHBhbk93RjJpM25oVWZzTTZweUM1eWhCYUJzYzdsSDdoZU9FWVRHRHRXdUtM?=
 =?utf-8?B?NXVYS1B6YXcwS2txeHZQWi9UaVRxMWNYR2NqNTdjMjhsK1lNYlJ1NnVyb0Uw?=
 =?utf-8?B?QmN5Mlh3dStQT1NMbW5zdnpvYmxYNEVmYzY1SVZqWVNabGdWUk05SE54dTBT?=
 =?utf-8?B?MFIwZkRZQ3ZlWi8zUE8reUJvU1RxekFkb0QrenVpUzJhLzJXQ1c1MklKQThK?=
 =?utf-8?B?Ui8vN2JZS05WNE03cC9OWTdVT09nUGRpMGlHNHI2dEowbVlTTkc4WGFra2JK?=
 =?utf-8?B?VUNUU3pqZTJ4TE4xOEdWMmtETEp3bThRdDZVRWFMYktPaE9aRDhPTWFtNlBt?=
 =?utf-8?B?eUJqZm53S1VEZ2h4R0xSdGFKeG1ZQTRkc2pMcjhsZmhEcndHRFcrbk91cXI4?=
 =?utf-8?B?UGYxWHhHYkJ4MjQ3TVpNTkUwTkZQeVFxVjFrRUxnSUo4bHpjemIvM2RpU0JC?=
 =?utf-8?B?dzVSMjVmRHRmcUVnR3VtRkd6dGphTy91WE9EeW4vWlBVSHBhMzZkMG00dWRr?=
 =?utf-8?B?RElKVS9GNy9HanFqS3h3MmgwV21yQUN4SEY3eWlnUFY2VCtmZVl6aDNqS0Z3?=
 =?utf-8?B?bjRmWUZlNzQvcjRuMDF1NlFZMXdzWDRRdWEvWFNaWTZlSkdGNFN2L2Z3Qjl1?=
 =?utf-8?B?UjQ3U0JjSHhDUlU0NjhnWDBXQndLRHIycU1UNU5uSTFTK0dwREZLMFNuUEhB?=
 =?utf-8?B?dmVtUHRuN3poc2lxdmpSNkt1bGU0d3dqRjlkUTJyQTQ3dzVxNVNwUFQ5Y1JM?=
 =?utf-8?B?NEZ4K1lPeThTTU1SVGxtUldhQ0UvWlowdUEzYkdldEZMQk1id29pWDk5ZjlQ?=
 =?utf-8?B?TG1QRE5ZRVdpaTVFa0VSMnI1c3Q4ODNUTWJ2VEd0STNXanJBUm11c1BPaGlS?=
 =?utf-8?B?YlFBODFYem9ZY2JMSFNmclJWWWF0R2VCa2xTWUpYR1UwYWU0MUFadDJlYWQr?=
 =?utf-8?B?cEpOekpySlBEZm53SDYxVTVtTk0zWk1Db1lUMCtQSEdTQzFxM1IwYVh0KzBZ?=
 =?utf-8?B?MFBnaG9nTmljL0ZPcms5bG5wK1NLQjVIWHk2K0xqV1J1UUVNM0ZLT1Ftaktz?=
 =?utf-8?B?Z0NmdGVEaHlYT3dQTDRmQUdzMEhBWjhwS2IzeFdLaXcvaGVhM3ZFTGFCOHdu?=
 =?utf-8?B?aWxwTHhrVUszbUMyemJoL29BdUtKQWNUS1d1bEVXelYyeGlKY09JUVcvZXds?=
 =?utf-8?B?SjdzOGNxeFBOTnR3YmJJTDQxYkpHR1U1TXpVdE93UzkzMEoyYk1wL2s3dUxR?=
 =?utf-8?B?Z2xYWFo0bzcrVHk0NmppUGhiNUZtTmNPNENqOHRyNGJvSDdvUXZEdHlSS2ht?=
 =?utf-8?Q?iOqUid4U+pg5A8qs3H26DHSWs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336ab661-9458-4ace-8410-08ddde5a73b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 13:23:42.7186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEaSMTWWqvgs9CQmcPYUt+l4A9b5e+ky/OL4Da3YNS3ZGBgK5weGWEcVz+ZKD0Rz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614
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

On 18.08.25 14:46, Thomas Zimmermann wrote:
> Hi
> 
> Am 18.08.25 um 14:40 schrieb Christian König:
> [...]
>>> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>> +{
>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>> +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Pin to keep buffer in place while it's vmap'ed. The actual
>>> +     * location is not important as long as it's mapable.
>> Yeah, exactly that won't work here. Most of the locations are not CPU accessible.
>>
>> You could use AMDGPU_GEM_DOMAIN_GTT, that should most likely work in all cases but isn't necessarily the most optimal solution.
> 
> No problem about that, but why not a bit more flexibility? When udl copies from the buffer, it is likely pinned to VRAM.
> 
> A bit mask of _CPU, _GTT, and _VRAM should work fine. The other domains are probably irrelevant for our use case.

The problem is that as soon as you pin into this domain you get an error if you try to pin into another domain.

So if you try to use the same buffer with udl and amdgpu scanout and pin it into GTT -> error.

If you try to use the same buffer with udl and V4L and pin it into VRAM -> error.

There is not works for everybody case here and we need to guess. Pinning it into GTT is just what works most likely.

Regards,
Christian.

> 
> Best regards
> Thomas
> 
>>
>> Regards,
>> Christian.
>>
>>> +     *
>>> +     * This code is required for exporting to GEM-SHMEM without S/G table.
>>> +     * Once GEM-SHMEM supports dynamic imports, it should be dropped.
>>> +     */
>>> +    ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_MASK);
>>> +    if (ret)
>>> +        return ret;
>>> +    ret = drm_gem_dmabuf_vmap(dma_buf, map);
>>> +    if (ret)
>>> +        amdgpu_bo_unpin(bo);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>>> +{
>>> +    struct drm_gem_object *obj = dma_buf->priv;
>>> +    struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
>>> +
>>> +    drm_gem_dmabuf_vunmap(dma_buf, map);
>>> +    amdgpu_bo_unpin(bo);
>>> +}
>>> +
>>>   const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>       .attach = amdgpu_dma_buf_attach,
>>>       .pin = amdgpu_dma_buf_pin,
>>> @@ -294,8 +326,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>>>       .release = drm_gem_dmabuf_release,
>>>       .begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>>>       .mmap = drm_gem_dmabuf_mmap,
>>> -    .vmap = drm_gem_dmabuf_vmap,
>>> -    .vunmap = drm_gem_dmabuf_vunmap,
>>> +    .vmap = amdgpu_dma_buf_vmap,
>>> +    .vunmap = amdgpu_dma_buf_vunmap,
>>>   };
>>>     /**
> 

