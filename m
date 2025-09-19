Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387BB87E11
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 06:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F86410E932;
	Fri, 19 Sep 2025 04:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z8MkYVos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89DB10E930
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 04:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAuNwus/TVrbmGcf9wwJAHCQgvmGPGNe6MVEx6+jC5JtaZBIp9VAUOep+AeTm9/LbTEwupshSBjzSFhb0xyWeCW3fiq3C231x5iL5P+geCVuGhlPZ7Qj3aDbxefn3A/edNmU+lMmBDOcMzdX9ffDMwXU3ONnxuXB6ZUEoeeLVVyCT6a656N7nmgKR+3lWHuoMTVe0IcqB/GpZeFHlOi5bU0tfKfK79tkLVngTsBtbYssejTwD3BWKR/S5S8IJIzWYMZGD+9JdcMlwG6QZ6gSU0uxkVUsOTvRXHR2GidKZXjEY62DofB4Xs2zqTwxwghV+Yb7EHxnfpMeSX4n7DpOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsAstO579vDi/kBFDhyR/KaZwekQUHXAGBhjfoPozPI=;
 b=i9bf0hUjVKT+5JwvcuetM9cVVOqWSRpM5w8HfnTeq8OOdtYT+j8Jzh2O/g31rKVLgaBQnBIPPz9/WHAXbm2ZY7o+Y5/N9/oVEFCJxyThlztyX8THaEJLLwb5G+GprPCdSB9LRko67fXyn6D75+p1qEAv7KFWItXWwGpTJVSiT4ojGIgNCvp1eK2YbedtbcRjMnLRbal+VVzChoQkV80Y6VnNJc74jMKC8+lZyRJCqoUQb0gH0ZM3yTMWXz3NtTphdeesf48LFbTzJKQnZY1fb1VRQk4tT3rm/xwwygz5tzui+8eQheZfdXlNxtY38tPE4cPrF9cdfheGQBpsZ5wskw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsAstO579vDi/kBFDhyR/KaZwekQUHXAGBhjfoPozPI=;
 b=Z8MkYVos93QoYQaecFgZ7yUZAOw3diIkWHI3k0QwgVhVV7jiESKEq/8UByjm7DCEowRiLzGELgD2T8eemaQQTXkXk7zOOAj/M5226zOzm7AgQxK5W+ZE/yuubv80h9ZoSMTj6S+r7Ms2U0RBJNIKQwrNr0Y/OKKNcgMqjNTKe85+66t5JB+M3ivXRliaNnijUXUEEB9IWgManfueffLdkS4ZIRdde3P2dMTEutlY7gsSaI0Y9rZXVvH+W3A1E6gADPfhJYzQbakCOZioVGS3sAexLD9myoKg3DaM0iuuPjqExHPKWhJnBIHIS0FSmbJ3nApZJCuist4c2EY52RtzDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM4PR12MB6376.namprd12.prod.outlook.com (2603:10b6:8:a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Fri, 19 Sep
 2025 04:51:28 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 04:51:27 +0000
Message-ID: <5b9da42e-49a2-4229-81ce-625ce00ed7b2@nvidia.com>
Date: Fri, 19 Sep 2025 14:51:20 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 02/15] mm/huge_memory: add device-private THP support to PMD
 operations
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-3-balbirs@nvidia.com>
 <2A0E854D-0B0B-48A8-A87F-E9D38C6823EF@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <2A0E854D-0B0B-48A8-A87F-E9D38C6823EF@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM4PR12MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 528f0d3e-6826-4ec6-00b0-08ddf7383140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2xxeUZoS0lseURlTnN1Q1d0WGhGNkpGYlMzV0dQNTR0ZTFaWGlYUjl6TXhR?=
 =?utf-8?B?M3M1RFNJZEpzdmVIRktzSDBaOVF4UXk2RkNaNUJEbGtQWTdVTHVlZmNxbFZD?=
 =?utf-8?B?ajgzSkhxZUh2QUU1R256L0tKb1NNcng0d2R4dXdrbjNkV01vYXBZbnA2STRu?=
 =?utf-8?B?VE1UOHlWVHZiNTkrMkhPTHJzYnY1TThZVk5YelF0dzdVWW9hS0tqVlJRL091?=
 =?utf-8?B?NGh0WldhTkNiTXRoZk1vK3JWTFF2Vml4SFh3SGREemtWNG02dm54R1I0RWxM?=
 =?utf-8?B?TU8raGQ2K1FkbXV0M3ZSVjMrRkU0N0Q3YzlOWGRFbTQrM2dRSndzdzE2N2gv?=
 =?utf-8?B?VGJnVFRIL3M0NWlCTTR5KzA5Tk1xNzBVRThCMW9ldmZIQ1MwcFpzR0hYK2wy?=
 =?utf-8?B?MjFCT1lOaHNZb0dEaVBOZ05kTHFTYUJCeDBBZkcrRzROUE5sWmp0TkEwbzcw?=
 =?utf-8?B?ZXlCakdQTC8xLzdwMDVaanhMRzl2WCt0NTJEMXdhekx6YlNhYW03R1lpN0w2?=
 =?utf-8?B?TFBzUW5DKzJnbVFseW9qK2Y5eFpFbE1FaTNEdVFsWEswSndhTmRLSEhzSmtv?=
 =?utf-8?B?SzlJTmQ4Tml1czQ2U0dRYTNjSkJVYnJaWTd5Wk90MXA2MXM1bHFnQjlBL29S?=
 =?utf-8?B?V2RCR0R0SGM1cEhDOE5IdmNta3dPbVRnN21zemdQNXNpWUcwb2JoRWptbzZz?=
 =?utf-8?B?NXpSdU5QaUhmdk11YW04Tll2SDRmNGNmWlk1TGtJQ0dpV00wZkFEazFtVExj?=
 =?utf-8?B?ZVF5ZllVcWpodG5oSkJMd2svM3UwOFZtbXF6OEdiTElZNEUyMXBjYmVVR2xs?=
 =?utf-8?B?TjJvdEVXMjRvMHRvelJiTTEyUlA0ZDFBazJoZlZVa04wdVhKR2NON0hIMktB?=
 =?utf-8?B?ZGJHSTNqWVZJc2NQcGZUNlE0N1c5bU9yTkZUbXlrMkRPOVFVVkxqMUlBOGFF?=
 =?utf-8?B?dG4vZnd0clpFMitMbEQrVzhvSHo0WlNpdmxxdFVLZ1hTUjNqNmVCMUVIK2t6?=
 =?utf-8?B?RCtHNjhCNGJhZk91T3l3ZFVkTEFWc1JHakRaSDRyRzhKUERaeTRyVWs3RFVk?=
 =?utf-8?B?aUZTOTJ2SXVhUVlOb2krWWNQbk5aVnZ4YnNMaU1uVWQvUi9SRldIZUFIeUIw?=
 =?utf-8?B?amY4N2x3STNaTmJmc3BaUWRvZFhSUUt2VllpYi82cUNYd3dJRzlxeVovNnZh?=
 =?utf-8?B?eEhtVUhBV04yaDlPbVdNTUZhWnRxeWFoRnY3VW9Yam5Hem1vU2RzZDNpMUE1?=
 =?utf-8?B?T1grOG1CREVORU43YWhHVHhIN3k0R29iUWhETzBuOENwL0tWNkJlVCs5SUVk?=
 =?utf-8?B?dXpJTDBxREtwdlJsMGJKZGJvTUkySjc5NnV4RTk4UlFsaGpiQXEwZDNKdFdh?=
 =?utf-8?B?ZmdaczNvRkVZSXRDcitnNTVaMC9VZ3JDL0Fwbmk3TjM5K1gvM3lhOEpKenYx?=
 =?utf-8?B?R2ZoT0dPbkhCNnBRYklrd0wvOEdyY0NUWGFsdFB3Vm5MRkVFRlp4SllxZ1Js?=
 =?utf-8?B?RVAyM0V5U25BanVmRXZkQ3Bld3VWSkRYb2hmWTRwdlZpUlp1YlFrb1EreTVo?=
 =?utf-8?B?cXoyWnREK0JzTFFGd2hMV1JWQWJSdmRIVzUxdnJqeTAzWHhzQnNsWGRSMzVG?=
 =?utf-8?B?RUZ1SHJ1TW1iSlhqRXZOVzB3RW9SdE5sczBLOFdKRTdJUmdUUFdJTWF1SGw4?=
 =?utf-8?B?SGx5OVJYRldJanlIOFUrMkRoY0dBemlmTEtlTzNvdHpCSnY0Wnp6dytFK0gv?=
 =?utf-8?B?eHQ4N3RvNkVrTTV3RGVkalFWNW1vQmFBcnBHenFuTGpMclY4OWlQQWZ4RTFU?=
 =?utf-8?B?aWp0cmJLWXcxWVRFZ2xmU0xWU3BFVEhWbGQ3SUpLai9kZ21vc000WTROaHJB?=
 =?utf-8?B?ZEcxRHNUSjd0SWJrR1RjQzRyaGhOSkU5NmtTeVVjekpONlZFSGFVdkRxZnRE?=
 =?utf-8?Q?IoKT9w1bJMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9IaTBjRDBkMDN3M09YNUx3eTY5bnpnaGhDRjhGaWVkZ3hYU3FCdGFsbzhX?=
 =?utf-8?B?NmF2Zklzc0oxb0JNTlFRM2NuMnRESlZtb1UyaVdEeDl2SzBxWFR5eEh5cW1B?=
 =?utf-8?B?MjlNNXJ2VFMwWmdOY2Ura0NERDBiT20wK0cybTVjNnE3L09OVDluWi9ib3J5?=
 =?utf-8?B?WTVFWXZtcm5yVHhzb0FSZDJRTHJIb2xqaWlQZ0txdVVWdU56djdVVmFhdEZw?=
 =?utf-8?B?Z2lMSTJFZlpZMHlzSTd6bjB4VGZoUS9qMFc2MXBFb01IbXVkMEdIdlJqTm8r?=
 =?utf-8?B?L29iYUYwVTBZMkZnMHE2OXh3YmdVRG1TTnNNYUROdjZoRXl1ZjZYVTNyN2t3?=
 =?utf-8?B?MEJxNmFTdXpUeW93U3d4dVR4dGdpbnAxcjkvR0xZUFlhdFpxTWtvNTV4aEhR?=
 =?utf-8?B?cFpNV0dRYjlXRDJDUlhhUXdwYkI2UmE1dldtdnB2K2NkZG1IR1pSRlNWR2NX?=
 =?utf-8?B?TDNNU25qNUZJeFB5Y0hZbElQZU0rYkoybnJtT2dCL3orbFRUQXpCOFdwOHRz?=
 =?utf-8?B?RWxnWTg5Rnl2VjJoWU9vU3pDUnY3MTRtRjZob0ozdUpSQ3RlTG16QUh5bm1G?=
 =?utf-8?B?RU40Nmp4bzNmcG9UL2hPeDVmaDA2dW5tNDhMdCtNeGorK281ZmZQOW1IOWxL?=
 =?utf-8?B?a0gxY1BzaTVZOXQrNmJEcldnWGs3QWNPSlhxQ0FRMUpoN2YwZEVpVllZMWh5?=
 =?utf-8?B?cVVTWDdNRVhGZ0NqOHNZbXBreWd3b3VCczk1VlVaNUdvajl5TG5LelpMdktp?=
 =?utf-8?B?WU95aTlhb2FHM1NxVFpZNzFPVDh3a3d5M1hPc0x0UWl6MHJxcGQyVU1EalQr?=
 =?utf-8?B?SHBnMXZSeFdua3lWMldmMFI0RnVmaERoM1MzUkZGMW1TRkFZVlhldWFScU40?=
 =?utf-8?B?bXl6dWpmV2tLK1liT2VOeEFYRmdyK0poWEhWb2xONVZjSHBuYlQwcm8yZlZz?=
 =?utf-8?B?VGFLcTJiKzAyRGtGc3d2TTFkL1d0aFRZdGg1ZnhXVkF2TmZ0SkZMQUNkZzVv?=
 =?utf-8?B?ODYrODFqZEZTcGVJbmQ0ZVl2WjByajNCNnEybEFjUURteVBOaDljOHZMU0JX?=
 =?utf-8?B?NkZYb29JWXA1OFF3emNlZUo1T0Roa0daKzF2b3V2dFg1eGljcUlpdWpkeGp1?=
 =?utf-8?B?dkNMWEF5VnMxamxHelljQXZmTVhoSTZTa0s0S2xvczJzZENtVXB5dGMrMnRp?=
 =?utf-8?B?eHdXVTFlTHIzc1FQeVVhVnM4MVV3SkpSdlZ2MEdRQ0IyRGErOHVoM2c2NjN5?=
 =?utf-8?B?eFFIbmE2TSs0TUh5MUIyNDRxbGl6TkFCUUFDOWc0enRyMEFNYW1GZTkvTW9Z?=
 =?utf-8?B?K1J2eCtPejRrRmU3Uk5vZmt1RkFWOU9pZnRQaWErN08ydHcvazJsVkFxV0Nv?=
 =?utf-8?B?em0ydXAzYTR3NFhHZDBtdnJzMnhYaDRNVXFFMHhpRkhEYWFDVnU4Z1RNM0h6?=
 =?utf-8?B?NkdrOStJRnBuYmxTUTF5THdpQ2JQeDlHRXRMT3JIT2tTUEpLUDl4em1MWXRP?=
 =?utf-8?B?cDFha1ljOEFWeGFGRVBpc0ZCanRqUjhOMEFxYmdid25GcDJQNjFUT2VjV0J0?=
 =?utf-8?B?aHF3LzRiclMzU2tHWWs2Qk90cUhVMFYvaEgyTVlZMElCZWt2OE9vT0hHU1dF?=
 =?utf-8?B?cE1Mbk1aT3dOVnVUUWwxcGlDMEVCeEtXb2pQYWFlZEZVTVp2TkNVek5PbUE0?=
 =?utf-8?B?ZFNmcjhCSWxGTXZlTzlYY2UxOUg2VmFtT2x5aHU0TTdtQW13eEhJUXNEeEp6?=
 =?utf-8?B?ZVJLQWc3OVNuVzZOOHZ0cWl3UW1ZUUVDL1RoOVZzYlhYRStKcnB4aHJBdk16?=
 =?utf-8?B?dUdXQXV2dVYwSmdEeGFsZ3RBTGRaUW4xL3JpSEltdy9od2h1ZDY5UzJDVUNw?=
 =?utf-8?B?NHVmS0t6bFJDMWNtVUsxOVJlNjRxRy9EVnVFdTgrd3h3d05nQmdFUTBKSEwx?=
 =?utf-8?B?Wm1ON0s1SjFaZllyeWVGaXRUaHZ4elZVRGU1K1IyeVlBVXlTWmhXQlpCQ0lE?=
 =?utf-8?B?Z2loOGdDRzFuRkRkSHlQbE5kcnR5YkpSRGV5SHdsd21mUTY3NWIwNkdXR2hH?=
 =?utf-8?B?dHhITHByengxT0hRNHpqdkxlVU9xSEs1NlY4S3I4UHJqY2duSmtKdHhDQWNy?=
 =?utf-8?B?aVNyNFMyeFpNTjRjczJkNUhHZytnMVJtZUdOVmwvbUwzeXZlSEVJcFdZcWV5?=
 =?utf-8?Q?MPNYVV6Y9P1Pk8xKM0gtiquq9u4pcuPovj6Yc/tG/llj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 528f0d3e-6826-4ec6-00b0-08ddf7383140
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 04:51:27.5336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGqWPaJBWS9wodzUyMuTk9A4G+4AtThMSjXgKDIRvalkQCMd85b7NstNXmF0W5xWPwXG/Vf+T9X3/SCcNTgCdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6376
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

On 9/19/25 04:45, Zi Yan wrote:
> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> 
>> Extend core huge page management functions to handle device-private THP
>> entries.  This enables proper handling of large device-private folios in
>> fundamental MM operations.
>>
>> The following functions have been updated:
>>
>> - copy_huge_pmd(): Handle device-private entries during fork/clone
>> - zap_huge_pmd(): Properly free device-private THP during munmap
>> - change_huge_pmd(): Support protection changes on device-private THP
>> - __pte_offset_map(): Add device-private entry awareness
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>> ---
>>  include/linux/swapops.h | 32 +++++++++++++++++++++++
>>  mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
>>  mm/pgtable-generic.c    |  2 +-
>>  3 files changed, 80 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 64ea151a7ae3..2687928a8146 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>  }
>>  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>
>> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
>> +
>> +/**
>> + * is_pmd_device_private_entry() - Check if PMD contains a device private swap entry
>> + * @pmd: The PMD to check
>> + *
>> + * Returns true if the PMD contains a swap entry that represents a device private
>> + * page mapping. This is used for zone device private pages that have been
>> + * swapped out but still need special handling during various memory management
>> + * operations.
>> + *
>> + * Return: 1 if PMD contains device private entry, 0 otherwise
>> + */
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +	return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
>> +}
>> +
>> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>>  static inline int non_swap_entry(swp_entry_t entry)
>>  {
>>  	return swp_type(entry) >= MAX_SWAPFILES;
>>  }
>>
>> +static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
>> +{
>> +	return is_pmd_migration_entry(pmd) || is_pmd_device_private_entry(pmd);
>> +}
>> +
> 
> non_present seems too vague. Maybe just open code it.

This was David's suggestion from the previous posting, there is is_swap_pfn_entry()
but it's much larger than we would like for our use case.

> 
> 
>>  #endif /* CONFIG_MMU */
>>  #endif /* _LINUX_SWAPOPS_H */
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 5acca24bbabb..a5e4c2aef191 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1703,17 +1703,45 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>  	if (unlikely(is_swap_pmd(pmd))) {
>>  		swp_entry_t entry = pmd_to_swp_entry(pmd);
>>
>> -		VM_BUG_ON(!is_pmd_migration_entry(pmd));
>> -		if (!is_readable_migration_entry(entry)) {
>> -			entry = make_readable_migration_entry(
>> -							swp_offset(entry));
>> +		VM_WARN_ON(!is_pmd_non_present_folio_entry(pmd));
>> +
>> +		if (is_writable_migration_entry(entry) ||
>> +		    is_readable_exclusive_migration_entry(entry)) {
>> +			entry = make_readable_migration_entry(swp_offset(entry));
>>  			pmd = swp_entry_to_pmd(entry);
>>  			if (pmd_swp_soft_dirty(*src_pmd))
>>  				pmd = pmd_swp_mksoft_dirty(pmd);
>>  			if (pmd_swp_uffd_wp(*src_pmd))
>>  				pmd = pmd_swp_mkuffd_wp(pmd);
>>  			set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +		} else if (is_device_private_entry(entry)) {
>> +			/*
>> +			 * For device private entries, since there are no
>> +			 * read exclusive entries, writable = !readable
>> +			 */
>> +			if (is_writable_device_private_entry(entry)) {
>> +				entry = make_readable_device_private_entry(swp_offset(entry));
>> +				pmd = swp_entry_to_pmd(entry);
>> +
>> +				if (pmd_swp_soft_dirty(*src_pmd))
>> +					pmd = pmd_swp_mksoft_dirty(pmd);
>> +				if (pmd_swp_uffd_wp(*src_pmd))
>> +					pmd = pmd_swp_mkuffd_wp(pmd);
>> +				set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +			}
>> +
>> +			src_folio = pfn_swap_entry_folio(entry);
>> +			VM_WARN_ON(!folio_test_large(src_folio));
>> +
>> +			folio_get(src_folio);
>> +			/*
>> +			 * folio_try_dup_anon_rmap_pmd does not fail for
>> +			 * device private entries.
>> +			 */
>> +			folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
>> +							dst_vma, src_vma);’
> 
> folio_get() and folio_try_dup_anon_rmap_pmd() are needed, because
> contrary to the migration entry case, this folio exists as
> a device private one.
> 

Is that a question?

>>  		}
>> +
>>  		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>>  		mm_inc_nr_ptes(dst_mm);
>>  		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
>> @@ -2211,15 +2239,16 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  			folio_remove_rmap_pmd(folio, page, vma);
>>  			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>>  			VM_BUG_ON_PAGE(!PageHead(page), page);
>> -		} else if (thp_migration_supported()) {
>> +		} else if (is_pmd_non_present_folio_entry(orig_pmd)) {
>>  			swp_entry_t entry;
>>
>> -			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
> 
> It implies thp_migration_supported() is true here. We could have
> VM_WARN_ONCE_ON(!thp_migration_supported()), but that might be too much.
> 

Yes, since we've validated that this is a pmd migration or device
private entry.

>>  			entry = pmd_to_swp_entry(orig_pmd);
>>  			folio = pfn_swap_entry_folio(entry);
>>  			flush_needed = 0;
>> -		} else
>> -			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +
>> +			if (!thp_migration_supported())
>> +				WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +		}
>>
>>  		if (folio_test_anon(folio)) {
>>  			zap_deposited_table(tlb->mm, pmd);
>> @@ -2239,6 +2268,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  				folio_mark_accessed(folio);
>>  		}
>>
>> +		if (folio_is_device_private(folio)) {
>> +			folio_remove_rmap_pmd(folio, &folio->page, vma);
>> +			WARN_ON_ONCE(folio_mapcount(folio) < 0);
>> +			folio_put(folio);
>> +		}
>> +
>>  		spin_unlock(ptl);
>>  		if (flush_needed)
>>  			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
>> @@ -2367,7 +2402,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  		struct folio *folio = pfn_swap_entry_folio(entry);
>>  		pmd_t newpmd;
>>
>> -		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
>> +		VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd));
>>  		if (is_writable_migration_entry(entry)) {
>>  			/*
>>  			 * A protection check is difficult so
>> @@ -2380,6 +2415,9 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>  			newpmd = swp_entry_to_pmd(entry);
>>  			if (pmd_swp_soft_dirty(*pmd))
>>  				newpmd = pmd_swp_mksoft_dirty(newpmd);
>> +		} else if (is_writable_device_private_entry(entry)) {
>> +			entry = make_readable_device_private_entry(swp_offset(entry));
>> +			newpmd = swp_entry_to_pmd(entry);
>>  		} else {
>>  			newpmd = *pmd;
>>  		}
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 567e2d084071..0c847cdf4fd3 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>
>>  	if (pmdvalp)
>>  		*pmdvalp = pmdval;
>> -	if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>> +	if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>>  		goto nomap;
>>  	if (unlikely(pmd_trans_huge(pmdval)))
>>  		goto nomap;
>> -- 
>> 2.50.1
> 
> Otherwise, LGTM. Acked-by: Zi Yan <ziy@nvidia.com>
> 

Thanks Zi!
Balbir
