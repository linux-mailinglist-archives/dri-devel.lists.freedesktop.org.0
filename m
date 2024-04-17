Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385D78A7D7A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 09:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65E113277;
	Wed, 17 Apr 2024 07:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXEXLrX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5616E113277
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713340550; x=1744876550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g92kkv0L+PiXwV7A8xWkfxZho/SEm85Ksduv+zdGWCY=;
 b=IXEXLrX7En5DAPGbSegvSfh/lEYvNhYU3201i/2VsSZ+j8xG4Zc5pwTd
 RFdV6LxSj38hM3IubH8PYwVWboqznQyu8HfPRa/iVXl7e5Z87oknAAUVn
 sqM2HsMztE0l5qs945IVga2l4iZ2+8ul/0FvTyV8pGmOFV2CHE5RUAp4h
 Y2apzC/EnyuW7SvnKJTe8G67zaV1I0WqUwz0JVDHG43aWPloK9nGqrBCk
 h0Vq+Gpa+caCxnZF0MoQESKpNhI56CMYd+J/E1HtMdI0wiNcJ4j7hqXl5
 PtBXp1QNHgi3mpdY9tNNiiP3iUmGIEhi4EQMxn6S2NwFHwY7Hk4xtWyHM Q==;
X-CSE-ConnectionGUID: MFGP+ZVzQ+qiJDYNmcUkvw==
X-CSE-MsgGUID: Fb/YnGGRSumj4ZMcZpYISw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12602438"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12602438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 00:55:49 -0700
X-CSE-ConnectionGUID: sd8DvxGXSh2iLcjalvc/fg==
X-CSE-MsgGUID: 4jhjntDGTKaEV1GFrxd5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="53508561"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 00:55:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 00:55:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 00:55:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 00:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTkr+VEieo0xESTSBWjWxTwNLSxyXEKm8VntyefxoqBfhDNEEDO/JA5h/XOYe2ul1RDtnIQFHJonEJWa98g2df7Y+5tkTlmsgHMM9iGRgdXSAjx1oLAydSa9PIS5xfE3BP+jWr0zB6LEIGEfG19YeMUAwKaOQwoGzrDu0LanuEh+eM49qcumjdb+W1FUJYSWKY9shLz4ErARUo485qsEm/Teph03X2+RJICHnMNbkqBMncAx0939X2WnoDdq0QPibqXbhu682TmR3B7K5U61ycDp2jKuoeXYhWx9Nr6e16rvirslKnU72EzftxtUFaZ1k/LEKO0A/gEVS5q4kBwKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTXm0V3bpBKpuO6cVs0gHrA/ZImHcn45+YkCf/mGiv8=;
 b=Fn5CZNzs8PHhHWQB4Z9xOWamE81ESpW5b+5b7ar3wCxE3cX2SPMTl/jTkU4gY6OylKp6bx3cr7ymeziI4Qpm5vLMUBSI5M+q4l2LDnGqrGB8hzEuiDj44GMA6YZV2de32Euv5g+9ikUPzpTw3NELFtJi/41BdwvZFp8SgNCw46RtBCZEm7Sw1DtTUvQy+Tpsuhp/vNvZWVIm6SXwQ/aNTaRZU03GqB6r+Mrhe6cqzybVs2VsZRYdP4jamgQMpoiN7sp2Uw3PsRnmNtRFeJGIppmyIVjfZDT7Iuo4HV9mq5bPGY746bdMPTSJoaT8qR24o0qNqnUFniRqCI490bfRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SN7PR11MB6654.namprd11.prod.outlook.com (2603:10b6:806:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 07:55:35 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%6]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 07:55:35 +0000
Message-ID: <85ad3250-b5fb-4275-b42a-e33789d4e496@intel.com>
Date: Wed, 17 Apr 2024 09:55:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/9] drm/ttm/tests: Add tests with mock resource
 managers
To: "Somalapuram, Amaranath" <asomalap@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Amaranath
 Somalapuram" <Amaranath.Somalapuram@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <bb45017745c8aba53e7b36aad47e66c4843771e3.1711117249.git.karolina.stolarek@intel.com>
 <8ab51b6a-c23f-7581-27c9-bff5a6f26bf6@amd.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <8ab51b6a-c23f-7581-27c9-bff5a6f26bf6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::16) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SN7PR11MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8db063-cc7a-4269-7ec6-08dc5eb3c35e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qbt9s8Gw5ESbRkjZN9iA19Xs5SQURmWuJxNBa9aqAopUxrhY2aQYfVIPLbY96ZCvcHCVDHRCr6gRhgew953rw/xO0rI/SHSu8xE23WrPQ0dQBIT5dJ84m3WHVKVhVj95SAay3/G9UP8YipjKNRI1tYDhQpjv3BcutIyiY0ueyfqod4s7HjaCtLrVtXUNX/ERGsM9malC/HgQlJpbF/36bug30nq3em/eVMqzLCgULI7IhDeyJA+VGxek35UKaGLb3AXWkr5k38hzPy+SEwoHB7Nk3ufEONJKPt5/psq6Sdarktfgfu6nRrvhXLvJbb/LUlRyhXE5nLN7BOL9h4ZsuS2ndkF8Z9qO/mdxPoUNn5zq5tPptTV3k3P2m+ExbMsTGt/rM113m3EgEcRXbasJ+LIyyeHsCsBRt8ZLwjkngMXH6FBF4Vrjeml/JLF8eaz/mLfE6aXGl4u5o6mI+efiBDrtI313CLxno+OqDqGXl9guLAkmtOWRF+z1LBPKx5Sv3/rJSPqd7dKb29mPMcSDgtFVaDOCkBd8D/LsauWvXMcenUj9Mv6JvhRalsQZw5rKf0BA2A312tAYUElWOvtGFhc3BdRiEmSdOjI+w3V9FFW5G8tspXumbSzRVK1rZ9Ab4nnQdW4COLB4bsL22d/9JI9NLi7xpi75cj4S7eGZLSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDMwTjB3emhmNGNBQkp5VjYybThoMFlhQUs3Z2h4MFYyOGJwWXdlSytCMXhY?=
 =?utf-8?B?LzlKWTRlQVoraHRrOGZNOXhLNElpWVR6dXhRRUI3RmxNTkh5SFdZekpmN01K?=
 =?utf-8?B?cjVkUE4zNk1iYVlza0I4Rk9IdUZXSlB1eC9GTWZjbDdOR0hhNlB4MjZNTUlI?=
 =?utf-8?B?NU14bXE2aHZISmZ2OTJNcmtJMmhSMUF5VzBZNHJWaVBBR3haejRaWk1FN2FY?=
 =?utf-8?B?TCt0RnpYK3JVRkpsdzdwVWpRWXdtVkwwZlZzb1ErcjhkbEpqaDhoMFFNenp6?=
 =?utf-8?B?SGlmNjZVcUxCbWtyRGhtbkErMWkrL3NyRXhhQnN3SXAyMzFsRlRrdnVQdHNR?=
 =?utf-8?B?bkhRSnBsdjBNYWFUVG43dGhMbEY2RGQvVHQ2Mi9Xa2FZSk1vNS85RThkVDhl?=
 =?utf-8?B?YlE4QXRueWJUdDVrM2VsRGtQc1FWWlltdWRpZ0VBR3ZJR0hsVFluUlRtMEgr?=
 =?utf-8?B?elVSWkdKNzFDck9kTVU0R1ljTlVFV3p4TXF5ekFlc3VDVHlsVkNLMDJiUVZN?=
 =?utf-8?B?VmJTWS82TWRVZTcraFJKN3ozNlM5VG4zVzRoUUdtTXZudklkQWsyanNrbXJq?=
 =?utf-8?B?Q2NadkRVbzNJNzg3NlZsd2thNVpwckxkY2dFWFA1N1FGOWNBenNTeWIyNUtF?=
 =?utf-8?B?bjVHQm9pQnRuTURmaE9iNTgyZ1haM0ZiZkptTEx5K1NNWVBoeWIxUGxOOVE1?=
 =?utf-8?B?S0MwS1RvN3FndVBsVWtjOXVFRVNtYkhtdXAySHJtR3lmNUpoTncwZU5CWXI0?=
 =?utf-8?B?SExacE9vZlUzRGRRMWpXR1RMcDkvV3U1amtxM0F4U0wrWEkzemt5cmZIWG9J?=
 =?utf-8?B?SzlwTDRmZGtueEY0bFRic2Q0aDZqTkgza0VadXhTUEZjRStjSmdrRGwyUmFZ?=
 =?utf-8?B?NmNyWlorZ1lJWVFVcGtreXloT3JXQURxTC9rYkdZYWtndnBwQklrK3hSUG8w?=
 =?utf-8?B?bUtLTFVBSmR3OXJCM0pHWUt2K2FERXZJemIxaFZQcllVcVdnZEkyV1Mrczl3?=
 =?utf-8?B?RzFGdklRMGxKdUsvMkk4OGtqelBwODRPOHZhOTJIc3B1MmVSMWJESy8wUkR6?=
 =?utf-8?B?Uis1Tk9ReG9HNmpDeEFWOXk3ZDFObzVoSzFxNC92Z0t4T1I0MXR1UVZlb3dx?=
 =?utf-8?B?K3A2Y3ZBQmRCUmlnOEFZdVplTEI5VFFyM2lxZVhWUjRDSHQvdld3aklFRjUz?=
 =?utf-8?B?MHFqRktwaUVTOEtlQSt0M3dSdXZPbEdDY0hZcUVOUWJsTWY1OHFXQWdUSW5C?=
 =?utf-8?B?ZEN0cHJvanJTaEk5MU1tUEZ3VFFzT3V0UlMwb2RwWDR4SEJIUGE3aW9tN0pr?=
 =?utf-8?B?YW4yZkEyWTdBQ3VjM3NkKyswdTE3VGZ3MitsZ1FucHIxQVo0OElCaDBzVUJs?=
 =?utf-8?B?aWpQOE1aSFg3QklqbmhXWE14SjFiNldZNjdURG9zZFFzNHJkcE5lMEVPc21x?=
 =?utf-8?B?OTBhRWVhL3NIdUhzTDloZ0NMVVp3VnBOSGRhNU9QQnNkbE9FYzZJd0Z4TC9B?=
 =?utf-8?B?eGNiWGZ6OWZWZ2tySmtBSzBNNG5rdXQ4OFFpU1RzT3E0SCtzRERmaW5wYW1K?=
 =?utf-8?B?QTJmdUtQT2NsY2pRaE44ZXpmSGVMUXE1MHM3WDBIV3JaV1hqL0o5OFd5NC9Y?=
 =?utf-8?B?TTBpKzRtTDRHUUtCMEY3S3c1YUFsZXZJY2ZZUFhiM3ZZN09WdTc1YWdIMEE4?=
 =?utf-8?B?VTJxUkdpMngvdWVxMDZsL211Y3ltdlB4VENWTzYvRUdxZHh3c1ArdUFjekdi?=
 =?utf-8?B?UGpjMVZMajFsK1VFM28wZHB1eXVaT2F6Z3NNZE00d1NneUw1T2Z0ck9NRDlU?=
 =?utf-8?B?aW1wdUR3eHAwVzYzeGkwWGM3TnJSQjZBMmhnNFM1MG5DWjI4bmUxU3h6NW9O?=
 =?utf-8?B?RGZDMGxqd3hrUG90V2kxdWtUK3lCZ1YrWUNVWGw4c1BTVW1JRnBOY2pTbWRt?=
 =?utf-8?B?VEFqUEdFVDlsVUR3dlorUXd1K25KUHdpNEVsTzY5d1dXNmxWK0xuQ2JwSkdy?=
 =?utf-8?B?UldQL21GZDJvd3NJeDFvdEJ3aGdpand1T2hVMFhIVWVWSE1qSngyZXBjUVlx?=
 =?utf-8?B?bXI5ZUgvdVFCdDVRTHJuMUxKaHlJZG53SDVNdVFQR1N2RkdBMk9LYURkT0dl?=
 =?utf-8?B?QURkYjlQWld5eFVaQXY0V3RoQ2FLeklrZDQzdXh4cGJ5SHNGN1paOVprNDhK?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8db063-cc7a-4269-7ec6-08dc5eb3c35e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 07:55:35.1289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BiVUkOtvC3quTr4Yud+N+KUW+rpnMX6hD67ZJgs6obZha64P14z+hNrqP4XiSxsCrbQ5MLzp7uff2fMHnNwHxQdVcXWVsfDJaYItc7/kx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6654
X-OriginatorOrg: intel.com
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

Hi Amaranath,

Many thanks for your review and comments.

On 15.04.2024 14:10, Somalapuram, Amaranath wrote:
>> +static void ttm_bo_validate_basic(struct kunit *test)
>> +{
>> +    const struct ttm_bo_validate_test_case *params = test->param_value;
>> +    uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
>> +    struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
>> +    struct ttm_placement *fst_placement, *snd_placement;
>> +    struct ttm_test_devices *priv = test->priv;
>> +    struct ttm_place *fst_place, *snd_place;
>> +    uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
>> +    struct ttm_buffer_object *bo;
>> +    int err;
>> +
>> +    ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
>> +
>> +    fst_place = ttm_place_kunit_init(test, fst_mem, 0);
>> +    fst_placement = ttm_placement_kunit_init(test, fst_place, 1);
>> +
>> +    bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +    drm_gem_private_object_init(priv->drm, &bo->base, size);
>> +
>> +    err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
>> +                   fst_placement, PAGE_SIZE, &ctx_init, NULL,
>> +                   NULL, &dummy_ttm_bo_destroy);
>> +    KUNIT_EXPECT_EQ(test, err, 0);
>> +
>> +    snd_place = ttm_place_kunit_init(test, snd_mem, 
>> DRM_BUDDY_TOPDOWN_ALLOCATION);
>> +    snd_placement = ttm_placement_kunit_init(test, snd_place, 1);
>> +
>> +    err = ttm_bo_validate(bo, snd_placement, &ctx_val);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_EXPECT_EQ(test, err, 0);
>> +    KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
>> +    KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
>> +    KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
>> +    KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>> +    KUNIT_EXPECT_EQ(test, bo->resource->placement,
>> +            DRM_BUDDY_TOPDOWN_ALLOCATION);
>> +
>> +    ttm_bo_put(bo);
>> +    ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> 
> ttm_mock_manager_fini for fst_mem is missing ?
> 
> Regards,
> S.Amarnath

For fst_mem, I'm reusing sysmem manager which gets cleaned in
ttm_device_fini(), so there's no need to call fini on it beforehand.

All the best,
Karolina
