Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91ED3AB8F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 15:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C38710E46E;
	Mon, 19 Jan 2026 14:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FV58vSGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BF10E469;
 Mon, 19 Jan 2026 14:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4CwrO+wMVL3t17v3iXWCtWeJjlZ2z6Cm1IUmZOKCuIJmBE0/GGpMEJbVw7RFZEVIflxlwEOs1Jr9WGfien6RHUy/kFgm7Qkc8Dt56lSxVVR4mnE4F1qLcBr2u6YSxF5OzINQkzEr4jSb9l66mEmyJ0KaR0FL7HufvErl+qPspbM8aedm24rgcNypMAn40cNQQvxL+HjcPWq2KY+WIOkB6erQVV/9+16fDXYiSpMBMxUH9oR8eOX9NCzwuuKf+uMBlJgXBhTLXh/7C3dEJS3/cE1BTgXsKxy6czD2YJbuvz9Gfqvyw4d4gJvDTa4eiDXZcGvxOs0yO+vQ/TN/XvMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrnHJMK4C6g4RG0ei88aLmlPvSAUcceN453tcQ+An0w=;
 b=f8JqQb/l30msHY2GgApSOlzEgICCn2pXbIHvnoK10DBNftg7+uXpEFSJhZkh0IGy7u/f8wFM7wSeMsq0PAcO00GRDw9wch+ZR02SZi1/RhFaRe0tVHthwKQXSZ+eljHS+2+w/eLTEbPQZ8S5c3WAfGXwfs4sF0SqEBITjIidlT87XWjt05NqBFd3LG615rJ60808iqA5614vYoai5Vw8S5zdK5NYqiKzavSLx9MUaJwLFw9sHoQbGEUXB+GO4qk53JfK6MOWUHq/SNgoUzHMadZeH062X4GaqH9NOgdR3FKex19/f7vjn19DgPZ/t6FSkl1TFbD6J/e5xGyzlzjxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrnHJMK4C6g4RG0ei88aLmlPvSAUcceN453tcQ+An0w=;
 b=FV58vSGRpaU1lIrroo+FILBS4I43MNhTyijxXI9wNXRwP277Pd6/isLO/53bsb5gzQq5ltVlQXTkrilrZThHw3ufxyN7/1RPm6KOUV6Ned4Xz/gRdM93LvYH8zn0TjdG829DJ+oMxR5sBM0XOLiF2GeilqGwYcQ56U1ENXz8O7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Mon, 19 Jan
 2026 14:21:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:21:21 +0000
Message-ID: <a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com>
Date: Mon, 19 Jan 2026 15:21:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke
 semantics
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
 <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
 <20260119130244.GN13201@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260119130244.GN13201@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:408:ee::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 915ed456-0634-4146-bca8-08de5766048c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnJzQTZiK0NaOVRGbXQ3UXhoQzQrdmtyajN3RFNmYnl0NEhEM0JtMm1SUm50?=
 =?utf-8?B?eVFtRGtxenc1Y3h5MkRXZHpVcHlhaXM1clNSSndJckdiOWpEdU1oai9Nb2xG?=
 =?utf-8?B?WGJVbnd0eWFEMlhEYXM5MWxLcy9lMFJOQ2g3dlZ4Z3JxTHpmMzh0Z2VVNngv?=
 =?utf-8?B?TUEvUDE2clkzeVFmQWJyRGpZbkpmbDZ2WUE2eVFSVHU2dEZjcGpsUWx2UVlN?=
 =?utf-8?B?WHVnZW41UzNSNXB2MXd3V3JlaE5FSkhCS1duSkliNGZQR0FHdzZtaGNjSnI2?=
 =?utf-8?B?ejA0UU9HWWZqSkRodEFIZ283dmZMcDFEcG1sWDhCTlFTTEwydHJEVDJHTm9G?=
 =?utf-8?B?cFRQL2xkMHhvYktIRGpKNVVBMnZBbEVDaytCdVVKOEhPNjE5SlpBZTBPOW80?=
 =?utf-8?B?YytPRHRHQWZZNitNVlNYWUs0WDU4dk42eHVpSXRwTDl3SGxNWUUwRC80c0l2?=
 =?utf-8?B?UjhrdkhSR1JyVzZnZGNuQ2l4TVYvbDE4ellITWZUWVZvOVJQc3BYMEdEem15?=
 =?utf-8?B?QUpsTWZaT1FEZTduZmZac0lubkg2SzN1bGNQNEZOcWFUeHRUMFdWSzFMYU9h?=
 =?utf-8?B?Z3ZVOUVkZFIxaEVDUUhxZHhYQUU1MC9TSWRHNGd6b1FuUm9XcEVuMVlja3Z3?=
 =?utf-8?B?dWtiblFYNEJtQWUzWkkwZ2lsMHlDUUNCeExGNUZEU3NKZjVXRm5RbUxRQUtM?=
 =?utf-8?B?cVZjaHNibDAwdEtoWUNYeEt3L0t5S1ZaY0VoclFlbnlCQXlUN1ZLZElEKzJF?=
 =?utf-8?B?d0tleEgwVUZzZUMrUTRDTHBydXVlN0g2WGV5YmlSVHY1NWJTZmsyRmt2SG5p?=
 =?utf-8?B?VDErUS9pNUw5T3NYdTA4d3YxM1RuWVd2WCsvaWhkQ0NXNld4dTM2Rms0V2Nw?=
 =?utf-8?B?OFkzakQ1cjRNZkVNYVJYTXpMQ3ZUalB2Q1NnZXZqdkw0WVo1czA0MzA2N0FQ?=
 =?utf-8?B?ZjJzcEhCd0l2aS91TTFnSFMwZ1ZnaVVrTG15NzBKSDcrSDNnanhNV1BVNTVw?=
 =?utf-8?B?WC9CenJuTnZ5SXNxV3FxTmJMYS9IWnppNnp3M1hOYm5GaDlmUGJNUmFGNFYx?=
 =?utf-8?B?Sy9jemowVkZRRzM2M1lNOVFSY2RCSFlTZmZlY3BveU5wN3F0NkZ4MUJjTlcv?=
 =?utf-8?B?cms3TVBqSEthcm5yUXdhdXZSNk52YkRoc1ltUFVFVWFaeTRDc3lqV3AxSDM0?=
 =?utf-8?B?TkJjNkxFR0VOdlpRc0hhSFdON000TU9GZ2RKSEsrbFVKaXlGVVg5Zngxejkr?=
 =?utf-8?B?Q09NNmxRaUlsNlJBUVpndHpiVW5BZkVXZkx2S2NKbmlYb2krblBPc1IwOHY5?=
 =?utf-8?B?c2tWcWNqdVl6S0l6Ni9GQ2xwWTlPRFRIYitxbmdmTjZtcE9ZMWNyTFE5Z3Mv?=
 =?utf-8?B?WFRjZ3dXS1c2RXpzM3VMK3AxM0RqNXRyOVQxUXFoQVhTZW4ycE1LVXp4Wm5O?=
 =?utf-8?B?cytpWEwyd1pBY0g1VHp6NGNZclBnOW9VTU9NWDBNdi9ZWG94K3pGeDBZRXRN?=
 =?utf-8?B?alNkNVlCOU1BQ0dySzcvczhqdytvWGlnVTZEUFFITHVkc2J4RUE0YUUyWGZv?=
 =?utf-8?B?VFJWczEvdkZSdVhqZHNzVDBCWFVKZGZPelVHYzBhQUdTZU1lK044L2J5QkYw?=
 =?utf-8?B?VjgrbEg3ZWZ3TjVVQVBycGxUcnVvWmMxVmpqQ0NnN2xwY3h1Qnd5ckFHbjcw?=
 =?utf-8?B?SEVGU25vSHdBRUd0SWtYT2VqY3BObnNBTlVYdGU1UHArcmQydFFhU3VjS2pN?=
 =?utf-8?B?a1J2ODZEQll3blBlb0ZPVUdycWNLS2Y1S3FlbW1ZMTRQWTJkeGRwS1FoV081?=
 =?utf-8?B?NHdiNTdUVUVVdFcwMGdsQmJJSHNad1VDaWd0UkRzWnlEN3dESEJxSVVFa0RD?=
 =?utf-8?B?bXMvczYzNndqMGR6ZTJQdnl4WWtjdVBzNjFnd25RblQzV2M2RlpaaHh3UGtk?=
 =?utf-8?B?a3p3MnlHRXdIaHRpc0FLSGIvM25mc3ZXNWl3N3Qza29LTFZ6cE0wdTVjZ3U5?=
 =?utf-8?B?TWRoTU9kMkVmQkVQTUx6L0tTR25FK3lHQVg2OG1vL29tL3ptVzl1TFRyWGZS?=
 =?utf-8?B?dEpZbWNmVFBpWWVEOExMbUVpU250R1V6cm40UmZGUjFubmFYVEhMcjRmVE5a?=
 =?utf-8?Q?sX6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0RieW1HcVh6WlltK1FITzhmYS8xY1VkYUtqMVNhUExCYitMR3BBWm16NkVG?=
 =?utf-8?B?UEd2RlpRVGZ0VjRReWFMTnpCeTFNa2Y3QWNlejIwSTRCNVZ4V0NEN0pkWW1r?=
 =?utf-8?B?bWVFK0tUbWlzNWNlNHVFWC9ESHhsZWdwZnFCWExaNjhKeitmK0VBY0J5THU3?=
 =?utf-8?B?Q0NGODlUUVZCSmg4aEFod1gxZzUva3pUNzV5ZENLbjBHQm9waGozMjJpRWw3?=
 =?utf-8?B?RE5kTi9ld0gvSU1pUGUxeUVKbGorMEJvZE5VbThrYk5EdnpGSTFUaU9ycWho?=
 =?utf-8?B?bE9SOXovYmJEaEp5QUVhT0pMVnZLVlZ4bFFRTStHM1VaV3VTU0M0bzFVVDk5?=
 =?utf-8?B?dXZkazBXLzl4bDZQK3BVQzJUQjlyMkJ1UUw0R2lOQWZyMzNyNlVBVEZUR3dm?=
 =?utf-8?B?Y1MxVStVcEtTZC9iV1dMUG5ReHJNZDc1aXhlcERsOEZpbDd1TzFYOUJ0ZURr?=
 =?utf-8?B?K3krbmw1YjBmNkNoWnJXc2cxV0FzYllXeGpsY2dFeDJIRzNiY3UxVWhtSkx1?=
 =?utf-8?B?K3hKWGREUUc3Q0pLcnlyT2RQSHhDQzN4bHdQVWNqSVowVnBBREtPZHBlVHds?=
 =?utf-8?B?WXo3a0x5YXM2d0swOVhpQlJDeFFsNXpJZEtlTHZCZ0tzOEltYzVqSEd5azFU?=
 =?utf-8?B?YjR1dmg5UzZ1V3o3a0h4WHovTTJoaCt3b2dSc1hETVpiYnJIOXFuN0U0OXBN?=
 =?utf-8?B?WlVnNTRVMXpuTGs1SGxqejdUdEVvZmJacmRCcWw1aExXaXViOUVQTExaRnox?=
 =?utf-8?B?ZnlXdFo0N2FGRXpBSzJJSUI3SWpHRkRmb0JnRGwwZE1UK2g5VTlDL08wSkpT?=
 =?utf-8?B?VHFVb2YzYU1TUnlMOHErRTkyaFFSRnpkMERGc1FpNDc4ZFVhT1BNcE9wd2Nr?=
 =?utf-8?B?QkFJQTFvbnZ1OVBaTFVsWGJ0NVY0UUtrVmhxU1NRaUwwUlRyaFFad0NyNlha?=
 =?utf-8?B?MmV0MWhIRGYwUXZROE1GNjFGcmJvbTNvRTJGY2FFTmZUM2J4ZnRlbnczSjhQ?=
 =?utf-8?B?WGV1S0lZZnl6eFBFbXduWndIMGhrVkY1OGV0YTRUaVF5bXJQSW8zNmlNdW4w?=
 =?utf-8?B?bzlRaVg2N3VIL1ZlTGhZamN1MEhHN25QYmxTZjZjZDVFSTExdUNMUkVKNlUz?=
 =?utf-8?B?YkRXK21EbmxwbE51NEJsOUJZcUNHdzRXQzV3RlM2SExRRXY5Mk90WTZDM2oy?=
 =?utf-8?B?S3lUUVk4SEl5S29lV0FFMXRUYmpJMUQ0Z2dBTi9ZVzdJaVlLc0liQWNiWS81?=
 =?utf-8?B?WGR2ZGFaYzIvOGFZZnZucmpVZE1sN2ppNk90akVjZWtpdlp2VnZIV1ozN1A3?=
 =?utf-8?B?eFFTb0lydjIrcll1ZVVsRmI0d0pDS0tNWEpubFlLZ1o1OFhsZllJT2RJa2Rm?=
 =?utf-8?B?NUM3NkNDMTI0RHVtRnVSMUdKVEFIZmp1WVowM1hQSk9YMjBEQ1ZsbVNRZHk3?=
 =?utf-8?B?RkUzaDUyZW0vRk1iMG1ZaW8rblh2ZVlnRmJaZWJidzZFaGFNYllNeThsK0di?=
 =?utf-8?B?UE5ad2IxaG9YZEYwMlBRN1FycGpXamRJQUdENW0xVkYyZXdicEpuTFdJb3Fp?=
 =?utf-8?B?aGVMNUx0dkp3enB1bldmbzBlWEE0R2tkWERZcU5MQm1pQlZwSEJxc0V4azd5?=
 =?utf-8?B?RjFtZXdWTXI1ejJqeUdXaGdDS1BISWxvZVRWaWxQTHdabHRpWXZnRlJYOVRq?=
 =?utf-8?B?bWhKQzRzZ1E0Q3V2YU9CWUdOMG1vQkdzeFcwYUw2NkJQcEY0YURFUnBKUk5v?=
 =?utf-8?B?NXJqRDFiYjBNNGxmWjZhV2FvK1VkaW9JY3BQSEoxQXJVSVhscndULzhNTDdD?=
 =?utf-8?B?UTZ1Z0ZndnlXTVRTSldRejVzUGFYQ1FPY0J4TVozcEh1eXNwZ2pzNXFIYlJW?=
 =?utf-8?B?RzJ5Vlp3Q3NZbW01UlIzS2NycHJVdWFDRFE0N2RPbTkyWnJkbnUvZ3NYZkhT?=
 =?utf-8?B?aWs2UGVXU0diaEhONXVZVHVqWm9NdU83c21ENkE5YXFodlR1YTNRSEJyZXlh?=
 =?utf-8?B?ckphdHlMcGl2OWVxWloxLzJrZUM3bHo3N2VhNUM3YU5iRnBNK0pZNk0vNHlp?=
 =?utf-8?B?WUNYWUVUbTVvNmRYbE1Qbk5hTlBNM1FKRE1FVHg2a2FFbWU2aHdiSmNTYXJ1?=
 =?utf-8?B?STlOMkl5cWFlaFNFbmgwcFlXL0EvdE04NlJuV3pjdi9sMW1CSXRjajFUdVpa?=
 =?utf-8?B?c3VVcFd1QzRxV1FUMkwyTlloYnc5aUdFTmhKS2hkd2oyZkRmRXh6NStTUFZt?=
 =?utf-8?B?RE1xNENXQTRoNmdhZS9UOWtwOHcrbFhXa05JVmhNQ2QwVHU2OW5ZdTBMVDFN?=
 =?utf-8?Q?WVvG8tfo0ot2i7cPKa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915ed456-0634-4146-bca8-08de5766048c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:21:20.9979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwd4glkPGw8vvmzahsejUPWzb8asERqPe5fBFbCoxJlhmF5vfAomO67/Csb6q82i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
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

On 1/19/26 14:02, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 01:12:45PM +0100, Christian König wrote:
>> On 1/18/26 13:08, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> DMABUF ->pin() interface is called when the DMABUF importer perform
>>> its DMA mapping, so let's use this opportunity to check if DMABUF
>>> exporter revoked its buffer or not.
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>>  drivers/vfio/pci/vfio_pci_dmabuf.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> index d4d0f7d08c53..af9c315ddf71 100644
>>> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>>> @@ -20,6 +20,20 @@ struct vfio_pci_dma_buf {
>>>  	u8 revoked : 1;
>>>  };
>>>  
>>> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
>>> +{
>>> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
>>> +
>>> +	dma_resv_assert_held(priv->dmabuf->resv);
>>> +
>>> +	return dma_buf_attachment_is_revoke(attachment) ? 0 : -EOPNOTSUPP;
>>
>> It's probably better to do that check in vfio_pci_dma_buf_attach.
> 
> I assume you are proposing to add this check in both
> vfio_pci_dma_buf_attach() and vfio_pci_dma_buf_pin(). Otherwise,
> importers that lack .invalidate_mapping() will invoke dma_buf_pin()
> and will not fail.

vfio_pci_dma_buf_attach() alone should be sufficient. It is always called, even for importers lacking invalidate_mapping().

Regards,
Christian.

> 
>>
>> And BTW the function vfio_pci_dma_buf_move() seems to be broken:
>>
>> void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
>> {
>>         struct vfio_pci_dma_buf *priv;
>>         struct vfio_pci_dma_buf *tmp;
>>
>>         lockdep_assert_held_write(&vdev->memory_lock);
>>
>>         list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
>>                 if (!get_file_active(&priv->dmabuf->file))
>>                         continue;
>>
>>                 if (priv->revoked != revoked) {
>>                         dma_resv_lock(priv->dmabuf->resv, NULL);
>>                         priv->revoked = revoked;
>>                         dma_buf_move_notify(priv->dmabuf);
>>
>> A dma_buf_move_notify() just triggers asynchronous invalidation of the mapping!
>>
>> You need to use dma_resv_wait() to wait for that to finish.
> 
> We (VFIO and IOMMUFD) followed the same pattern used in  
> amdgpu_bo_move_notify(), which also does not wait.
> 
> I'll add wait here.
> 
> Thanks
> 
>>
>>                         dma_resv_unlock(priv->dmabuf->resv);
>>                 }
>>                 fput(priv->dmabuf->file);
>>         }
>> }
>>
>> Regards,
>> Christian.
>>
>>
>>> +}
>>> +
>>> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
>>> +{
>>> +	/* Do nothing */
>>> +}
>>> +
>>>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>>>  				   struct dma_buf_attachment *attachment)
>>>  {
>>> @@ -76,6 +90,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>>>  }
>>>  
>>>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
>>> +	.pin = vfio_pci_dma_buf_pin,
>>> +	.unpin = vfio_pci_dma_buf_unpin,
>>>  	.attach = vfio_pci_dma_buf_attach,
>>>  	.map_dma_buf = vfio_pci_dma_buf_map,
>>>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
>>>
>>

