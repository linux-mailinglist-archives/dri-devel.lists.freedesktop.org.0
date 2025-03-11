Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B60A5BFE3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD9710E576;
	Tue, 11 Mar 2025 12:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSAt1IRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A0010E575;
 Tue, 11 Mar 2025 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694411; x=1773230411;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+wSiuYNixsIexUo/b2nuZTQ60cNKy2Hix/eHtoe4a+0=;
 b=CSAt1IRPYP7bAAnVfWtwgKpMSgd7ufLiYAly5p86mnjt7dp8KlIyZDs6
 Xt2N5cDj7lk1zM8R7HFXrZwMixB9GyuNIcbFuMp8mM9ZUk+I2ribIlNIA
 H1CmrqWF04KiJBeX8+Izy0ws2cjS1hfCNYs5ldMWsfeQmykwoV/+INiOr
 H58mTYLndLO1B6auwx1sqCZ/psYls7RHNTbGUvvlHmy00AfL9QJpv1QHe
 bg1gzmzxaxclKfGbm8nU43ySt9WMQMNfaIEKv9vfL2nMTUvS00ydP78mG
 Gcjvd0Ty9EMbx92KItvXBR7mob/oGX8C26wBoz1A5bwdVojbjWkb8ljHF A==;
X-CSE-ConnectionGUID: n7mFJK/tTEevZednY7kBHg==
X-CSE-MsgGUID: PS0P4TVrSHi5hlF5/NJlSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54101263"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54101263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:00:10 -0700
X-CSE-ConnectionGUID: 8h++dslbSsC2eyNVyeNqwQ==
X-CSE-MsgGUID: ky5rHx1ZRW2vTAZrQbjn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="125197324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:00:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:00:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:00:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:00:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWZwoEmqZXxN5pwJ3I1EznFC5tPaEvv7I8phqWQHzhvSFgVhHHJU/5TO6bIFtVjAmsarQqbKXCu5UEwHtQ1cX4HeW5JS7CkM03fCXD1ANFDZLJ2yON4PCPhDsEvB0/CDk5DhPmDfP3HP+lNWjq/VFvIxEmkjclo3f0QO5R+N6j7d3mU54P6hPaGYB5pOQsH3zjIKm6HWJRl+IS0xa6V6IcXOKRp3vXCsgAWNYZQ8zb82GepcbQtc5AuKHyYE7AneOQWecUb+UC4tCLAdYKknsQmz/9htFbm/ywVwtGFQKchHDKPBPXVZjxjv0dvfQJO/x17brcpjJoOPFTjjtoeYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY6YpPpbJoS27jG018wXdp7PntZBT1rkHjOcVHYG1fg=;
 b=Ug4IowWl9LD1A/1obsUfh17uX8SSxQUx4Udn4bLHYDypv0hV3Yjcw2I1eIHgMCzpHvHsbBhyEEEw7hThpWDC6Hrwc8F/nykSlCirJ1QhWTLqXuygJ2UnVoKIvmqcM0HvOAbiY5NvoxIlv652gEdUH5z/6cBb9ikvbrWjFeMsNXq1OpIWGgFvg06MLUE/v+KkyrfUTSfvrOP+chM9a1tunoOCoSIdLjondLsQZbweNlJVqgCdm2z3+OWlhO2fa8I67vZGPI6Ho+4rkA4civh0Rf5m0+qDeyjtXF2v0WQ4j5Vwm6k8EefgEN4xA+HYOXWQpbI8DsrCsKDGb3MFq1zvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:00:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:00:07 +0000
Message-ID: <d992fb93-b227-46a4-9ba3-819acb4df8c3@intel.com>
Date: Tue, 11 Mar 2025 17:30:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/i915/display: Add filter lut values
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-5-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-5-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: bd65e37f-0879-4f04-a321-08dd6094445a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3RNZzMvelBVQmYyMDNUN1QyZmg4U09ERnZEbTl0Ym03RGNTbVViZFJ4K0kx?=
 =?utf-8?B?eUFIeklsR3RTeElvN1RzNkwrZFNiN1FDTDVYeHYvbFMvc2VQc2Y2b3JMRDdl?=
 =?utf-8?B?TVpvdmFEcjZCYTdZNmlBVjFqbzdWeFVLb2h3aEJmYXE1Y050T0txZmtWZmUr?=
 =?utf-8?B?d1pBaEVHQURiQW5LcGhrS1hyRFdGbHRya1ZNRGNuOSt0Vm05WGpyMnM0eWg4?=
 =?utf-8?B?d3ZqMGk2M21zZVE5ZkhYblY5QVhWQTV1eW4vUURYYzU3TkZlVW42OHpYNURO?=
 =?utf-8?B?bnk0NnZRS2hTWDV5ZkFMSkRxMk9BR2IxT2Nhb1krVm9nd0NxQk02cTVxeFgv?=
 =?utf-8?B?d3Z6TnFSVi9zZytRMkd3c2FDY3pUSU1YNWJPMm1YUW13MTB3T3BiOFptZzNF?=
 =?utf-8?B?SWVDeUVtOGthMUVwdEVuUytGUVFDcEw0UzFjNFd6YUJzb2JBekVKZTRUbCtI?=
 =?utf-8?B?UFV4OWlNK29jRGMwUmNiRzBJTFhzZVF2VVd0Q0JEZDBoZDhRM2ZjcjRiZ05o?=
 =?utf-8?B?SCtGK09BZkpFa0FUS0haZlRodERoOVZvSDVCcEJ3czBuTmFrKytCaXZtYjJZ?=
 =?utf-8?B?ZC9BZEp0S1kzMjJiZkVwZVRNU0prUytvZXovZUxMY3VBQlhFTkg3Z0xGc0dx?=
 =?utf-8?B?NjBEZXZHZG9hQUhFN0RRaEtENXVaTXVwQXJaZkNBYkh0cG0wZDlDd0lCaytX?=
 =?utf-8?B?ZTQ0OWlKbEdVYWRkZXdPK1RBeWtWNDcwWkFEODR3NzNhSXM5RFFMMWxyek9Y?=
 =?utf-8?B?Zkd3bnViVmhlNm10R0RON0wxTzZFZEU2azFOeml5bFprY1J1VjhXazZ2TFZy?=
 =?utf-8?B?UURnMUZUUTA5czIrbmR3TWNEUVpJeUdlZzFBd3ZTdklDWTFKYmdnVk1LTk03?=
 =?utf-8?B?dlVJczVZRTRNNlE0MTVDeDEyOHVJZkZQdVZHblNQcFg4cmwzZTZETnRMaTJ4?=
 =?utf-8?B?MGY3ZFdWMDl6ZW5JQlczYjg5emVGTmZ1ZitiTHppbTdjVmVpOWZGT1U5eHkv?=
 =?utf-8?B?Vi9uYjNuSTlDWms2aGFEUjJHc25NSDNIbkJZSTdTWi9rNEtqbkRINWE2ZVdp?=
 =?utf-8?B?UFAwSHRpbVNvd05zUTZJTXFTMnQ2d0RoSThYU2FUSVFIS29NbnNoOW9NbVVX?=
 =?utf-8?B?LzRGY2FzamI3VmFlcmk5MWJCVWlFanlhWmZpMVY5U1ZKWFlUTWRKUDJ4YzA3?=
 =?utf-8?B?bURyaXlIWWdZMkNPM3FyWWgrRXNoTFRhUWx6MUs0VzA3SFVibkJaVXVFcm9u?=
 =?utf-8?B?YU9PdUp0eEI4TVp1UEVuRXBHa2p0VHJZQnBIM0VZN1gzdUZNZkszbmEwSlQ5?=
 =?utf-8?B?ZHZXU1Y3aWdOd05BM0dXT01RSFFhcnRUQ28ybjlMaFFZMWJ4QTVMQW5JaENX?=
 =?utf-8?B?eGZySGFvNFEyTnR2cjY3TFRycVNScjNEQkFGZXBLU0t3ek95QWRTajQzSm9o?=
 =?utf-8?B?bjdmL3hKZXlkY0tYb3ZxY0VTM05ncHgvSG5qaWZDcnZjUHBRNU5DSVFrZFdY?=
 =?utf-8?B?cXZ4d0xYUUUrYUVUSTQyd2JNaDdCb2E2MEhraDIydlNWTEZtdWR3WmlHcWhL?=
 =?utf-8?B?dkZLTTE5aUc5NEdJTi9GRUxzUHZFNHphQXZkYlFVdkZ2cUFsOGtiNmlmTjlI?=
 =?utf-8?B?b2E3VXBlY3pJK3lNandzdFpLdGJEZndwQ290enNOVEJHUDRVb2RNRGZzOTI1?=
 =?utf-8?B?VXAxeDNLbXVJa0FhTUFOTisyRzhCd0lqcDFIcWIwUWpVTGkzVlIyaUtjcGt2?=
 =?utf-8?B?NkgvQUJyOERwZVhZVW11K1QxZ3hIeWhFSkg1NFhYV0tUWSt1L3kyT1pOV0Iv?=
 =?utf-8?B?ZXI1THVnRnJkeENsTHFDRFAwWlBUczlGclh1cnV2TTlqSS85YU5wZGVLRUFt?=
 =?utf-8?Q?CONVGpOfy2pb+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1h3cm5veU00ZW93WHpjdzc3QW9oQU1GR0N2cGNTKzJxMC91Z2F2SWZudE1n?=
 =?utf-8?B?cHE3S2tTRC84YUNaMDJRMUhkZTgzdlpnQ2ZrQ3JFd0k0bVdvbzJpMDFNRksy?=
 =?utf-8?B?bFVWQUpsVWlZTlg4MWFCVGFYcTVxc0xLYndtRituRFRZbWxDZjJqa2FaQlVk?=
 =?utf-8?B?WmEzaTVwNS9sMHRUN3NvSXNYaE1NVzhOSkkwRzQxRFpoUlJPSGhabzhod2Jq?=
 =?utf-8?B?dVkyK1dJUE5LcEtzd2VycjYxa0JPK2o0UUZZVzNxTFN0RlNIWHZLRi8yWWJC?=
 =?utf-8?B?c1BHQ3ZXRG9VNkFBUU9qeWNEdmYxanJXbzc1M0JCT2pxWXcwSEdmZzhGa0hX?=
 =?utf-8?B?UWhXK1lhbmNBSG40TTF0dUIwV1VWQjl0SEJPemVxdlRMRG9POUlRbkFSK2lk?=
 =?utf-8?B?d3ZBQWdTbEJrVlRvalVjLzNqREFlNGVWY0F0TXhSaGI5TjU0QW11OTJ6dDFl?=
 =?utf-8?B?WHZlOXhqazNmOFd3dEg5UWpqYXNNcHc5aURVVHNJcXc3dHMyQWlSNUtpRUFN?=
 =?utf-8?B?VU9tK04zMk0yeFp6dEJsVXRaaENYZU9XbnF0QVBQbkc1ZjlJd1h2SHNUT3g1?=
 =?utf-8?B?eXFaMWpSOE5NS2U3QjVveFZZN3BBb1ZJMGU1cVpSbkU4VzNmTjhHcSttWlJ0?=
 =?utf-8?B?L0Y0SE1VSEt3M1NzUkJYeDZqRllrT0hOZHQ4c2dtZHd6L0pTSnZoU1pvZzBu?=
 =?utf-8?B?aUYrTWxPc25kV1I4SjQyMC9hVE5WQ2V2OU9RUGRDaFR2Wk9WbWhlZWZzbS9M?=
 =?utf-8?B?TVgrS0ZrMUV4VW9uVGRKdmpoQ1Z2UGRiaVJoU0x3Q2ZWWUVocjVmS3BCTEJO?=
 =?utf-8?B?Yzg1WjhQMGk4bERVcmI1Vy9LMTNCbXlMK2FVSkltRGoxMzNtOWlyLzVHbllX?=
 =?utf-8?B?dXNrS3dzdFcvVTY3OWhTRlJYVnJSYkUzR2N3d1pwVTZuRThBY0hQZGxvdCtl?=
 =?utf-8?B?SFU5SzhFbXBLenpBcmdkZTF4MTFFWFdzM1FTUlozRGV5MmMzK0F0Ry84N3RP?=
 =?utf-8?B?ZkVTZDNxWURtNllHVWk3OWtBdVM5a1ZGT2pYUDUvRDFZTlBITlY4MXBBSGhH?=
 =?utf-8?B?cjBDVkdIN0pEZ3pCZEVqOEkyM08wMlRSMHdXMkR3V3htSHRXeXdLSTVVazFj?=
 =?utf-8?B?bE9yWWpUK1hpbXVreUNyZzZNdElUQ1JiTGNKRG9zOWY0RlBFcHd3SHZPdjZ4?=
 =?utf-8?B?Z0owWEJQUzF6VHVlT09wV1RRMEVtbFRNbW4zaVVtWHFOV1R4UnRSc2JyRHhT?=
 =?utf-8?B?VWp3QlpBVmpPbkxneDF4cWhrV2N5aS9ZaHFoOTZhMW5DV05DZ3pLM2VvTjE0?=
 =?utf-8?B?RWdQclhQVVBFV08rcm9SRXBPYVRlNzFUNU9lSkUzbnRIVEpjL1ZpUUE4SXk2?=
 =?utf-8?B?VTMzRk9YWkhDbHhTUWxwN2RYVjZHVVd6VEJ4c0FZdllxNDRxMDFPTGV2Uktq?=
 =?utf-8?B?YlIxeE83SXFXYnhVbWhYZHB6d1d5T0JJalJPRXozQldPR2RTMTFqNUgzL0dM?=
 =?utf-8?B?eXZMSXJ1R0Mxd28yMTEzOUdHeGZ0QTBZL1VRTW1nTWUzaDFERVUzMU04T0Zs?=
 =?utf-8?B?WnlPRUtyMU4vVy9FN2F6c1U5MnFUSFlKckhoMEM5T1ZXem9iVUdRYjc4Rm9k?=
 =?utf-8?B?Vk9iWmg4N205ZVpOWHBFWmJiTVFPckY1MnhESGh5TnY0UllKQ2tUSnFxSm5B?=
 =?utf-8?B?a1Y0N1o3TS9jRGxtSjFxcnFXQWZmTDNZWk9zRlhvMzQxV2JZODhXWGlLcU9h?=
 =?utf-8?B?UCtsWE1UcGZuNDZMZTdJamtreFZkZ1o4aDFiOGJXRW4wNkZRTmtIWVFrNTNz?=
 =?utf-8?B?MzdGQ09NYjRVSmdoK1BGclJWYjkrcWxhQytkZ20wa01FcFM5cER0WWlUKzNw?=
 =?utf-8?B?aHh5aHE0NVhKdG9qQ2RBeEI2Y1pFNmNDOG1aTW5jZmkwWmZqK3RJT0Vvc08r?=
 =?utf-8?B?eFZ6ZmloVERpa0d6WW9UL25aOFhDek1UNnpnKys0QkZjeXp6M1JIbGhoY3RI?=
 =?utf-8?B?UnR1azBXbENLcEduRFQ3NEQyZHNaL2tqZXNJR0luUjROcUlNM3o1UWZkblRi?=
 =?utf-8?B?MjhFRUY0NUM1elpUMmFpRVd0QXZRM0xJNVFYNUdCQjVhN2Rya3g0RjVZcHc2?=
 =?utf-8?B?WUk1dnR5SHMveWNrMURQSlkxdjVleDdtaFpISmM4cEZVU3prQnllNGt0SURj?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd65e37f-0879-4f04-a321-08dd6094445a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:00:07.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8UGcrlcpK+35ivphYIDfmssHD9xj8EeUFQj4qjA5AIibzNH7qg7jEnDF0A9JlwqiSXKYfqWRxsyCD0uEUtu8mlrXpP2LyaI2ZGhlMl9r34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Add the register bits related to filter lut values
> and populate the table.
Lets have some more details about the LUT values and the fact that they 
are only needed to be loaded once.
With that fixed this looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c     | 22 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  3 +++
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 11 ++++++++++
>   3 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index 2c406e7c5fb6..ed72bccbb93f 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -25,6 +25,28 @@
>    * to original image.
>    */
>   
> +/* Default LUT values to be loaded one time. */
> +static const u16 sharpness_lut[] = {
> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	int i;
> +
> +	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
> +		       INDEX_AUTO_INCR | INDEX_VALUE(0));
> +
> +	for (i = 0; i < ARRAY_SIZE(sharpness_lut); i++)
> +		intel_de_write(display, SHRPLUT_DATA(crtc->pipe),
> +			       sharpness_lut[i]);
> +}
> +
>   void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> index 6e308c367c17..faeed50de2ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -9,8 +9,11 @@
>   #include <linux/types.h>
>   
>   struct intel_crtc_state;
> +struct intel_crtc;
>   
>   int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
>   void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> index e5fa4d9bb309..c61755a401ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -19,5 +19,16 @@
>   #define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
>   #define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
>   
> +#define _SHRPLUT_DATA_A                        0x682B8
> +#define _SHRPLUT_DATA_B                        0x68AB8
> +#define SHRPLUT_DATA(pipe)             _MMIO_PIPE(pipe, _SHRPLUT_DATA_A, _SHRPLUT_DATA_B)
> +
> +#define _SHRPLUT_INDEX_A               0x682B4
> +#define _SHRPLUT_INDEX_B               0x68AB4
> +#define SHRPLUT_INDEX(pipe)            _MMIO_PIPE(pipe, _SHRPLUT_INDEX_A, _SHRPLUT_INDEX_B)
> +#define   INDEX_AUTO_INCR              REG_BIT(10)
> +#define   INDEX_VALUE_MASK             REG_GENMASK(4, 0)
> +#define   INDEX_VALUE(x)               REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>   #endif /* __INTEL_CASF_REGS__ */
>   
