Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA9B438B6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 12:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672AC10E23E;
	Thu,  4 Sep 2025 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MqEsJ7O4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8035210E23E;
 Thu,  4 Sep 2025 10:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAmXUftxUlnHIsub6aqDB+WDCxFwKGGc/HavSX3NmjyosBJLQAO/HEpzQjUOeyrzT1OQdFU4k5PUEjZkBcrCZISWPz3EZPN1jI9xQwfeRFT+phqPYyJZrFt27ISBNWPxlm9WKr+kFGT6Oi3UVML9CH2Gsp5Di0r8BSlusuAWpC9q0hHVg/YIybYYY88c9B2vhhrKKEYqoqqMCJdp61Ww2C24mTR0fk0cY0VPG5SCnw2zzNsLOamegbSqRo6VS3TMTqSjalxUGy/bR1/gKxWEzFsbd0lCpYeRm/lSSOrO3a6bEob6MyGo0xxVXYq1FfnGCrbcB4NP2Zdg0/eI7aDRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khIne0JjcMvWOTr1/4VeF23kNPFRfG5jkYoZDjrQ/AI=;
 b=GFs9wQTWy3nNKCvgUxKbcfMg4EMqc0K6Ross4AW+3l/Hpno/IQPcVU9StlbxFhDSQ7mu8UED6wMq8bGH9ibzkBdHY7fvjUU3Via3H3l2ZHe6TvTbriHxWWwU065JV8MO05iL9jn5zp3L8g9qcOgp2UsqRtMNHpH6sFwcKFkrp8XCPh2aH7pIqKdQLAo/iUZ6k65RZ0tXCQT+Kr4VIZnTJSTV7dT+GJboUHK6tj95VHhEk+jamOAy82gA3sMobv6gS49EWwBXnYNDw09NoG5mjIh+4EQLfRbdtWCeXrBrdNxMvBH3Kjz/Ha37A7NZPCRpqwDHKVXp3WLo8BPO5Dodow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khIne0JjcMvWOTr1/4VeF23kNPFRfG5jkYoZDjrQ/AI=;
 b=MqEsJ7O49NTQF/pMHQFla3WiatUmz6tQbSUHEjmFnbtv/phwrtSzpwwPxK2aCduledlMB/hZrM+V2QfO1OjPCGjazuW21ZsS8LygLNkFFAGY19xMW8ZWJXBGCghXZpo/MTl4f37Da3uDKuAFZz/szR5M476xPvdHU91vVORHBB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 10:27:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 10:27:29 +0000
Message-ID: <3407fd9d-68e0-4c45-9761-98ede450bb25@amd.com>
Date: Thu, 4 Sep 2025 12:27:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250901083107.10206-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250901083107.10206-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::17) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b77a947-d445-403b-b2eb-08ddeb9da67e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXNPRVZJWEt1THE2RCtBY3dwaEE3YnUyUi9zNE1wRHU3M2xsVmtlRGZ3Z0Rj?=
 =?utf-8?B?YXRYTVQxTGt5Q1BQQ3MvM3JRNWQwOENlNTVaZnhQSWRYTW9OL082RXlRNFBS?=
 =?utf-8?B?bk4xeVJBZ0c0d1loeHFKejRsZ3BibUk2amcvbHlqaS9lMTdxT1Q0YlZzY3M4?=
 =?utf-8?B?OXgzT0lhcy8zYkxKWXdEN214MkV1NEVYcWFOSDNFMURpVFVWVEI0bTNOMGR4?=
 =?utf-8?B?RmN4d0JwTjREM2tIRmdxa2FOU3NZdDhIN1MwakVrRHlySUFZZzZPU0JIalUv?=
 =?utf-8?B?TmhLcXk3em82a0FFL1p0V09lUHVBdTB5QVJkZlVJQnJVVGdsZlE4MTVhcDBX?=
 =?utf-8?B?b1JpdEJYOU1yVXFxbmZHRXpQTUJTTGgrMXFpSEhZUk1rUTJvVkw3VjM4UTEw?=
 =?utf-8?B?V0Y0MlgwNzFTNXJpeWZic09BeWdvUWVpVEtueWFmS05aeDJsQjZ0d3VSM3FM?=
 =?utf-8?B?T3VML2NwQ2pLNFdtdnFub0hrbTFtRFhIbWVQRytONDJSL2lKOXVQZEhLclUw?=
 =?utf-8?B?ZTlIM3N4d1A4NSs0ckxaMDJaOVpNV1U0S1FNV3NKWDRTYytoQ2pvakJKMXhR?=
 =?utf-8?B?WUxQcUFKVnNlVmhneWVYL0oxR2NsZWl3YWkwTEh3ajR5VGFHc1NrazFrZmRo?=
 =?utf-8?B?bkxKb3BwZ1FWWHlxZlJza1Y0ck5GYVRWcG90RHRoaVFhR1hoelY3T0s4UHdR?=
 =?utf-8?B?ZjVTYWh3dmNjSlN0ZEdCSmJkditIK3ZoWlhZU3h2ZDBkenFYQloxVk1XWHQx?=
 =?utf-8?B?bzFBQkt4ZkVJVFpFbTRIQUJtekxYUFBvTThBQjF1ZG1kK081MWw4dllsdlRu?=
 =?utf-8?B?WEs5UUpyRUdYWjl4WE10M1JjWGJSaUt3OWlXRjdQbnIvcTd0L3dKbzFvK245?=
 =?utf-8?B?THJTSER1c2JkTTBlYlBpTmhuRUV6L1lOem5odHJ1c1c2L1B2RUNnZXBOdHdk?=
 =?utf-8?B?OVJmUVJQSEcxeWZHZlNXTE5oR2Ztd2NFUE4rbUNEYk5uL3I2clVIT0xxSHUz?=
 =?utf-8?B?Mkh2NkNDQWJtUFdrL3dPSWpNZGtLaVZOYjJ4cTlkd2k4TWRRSkF6ZHB2RDdG?=
 =?utf-8?B?YTNhRUs1bWw3YjllTG5yYWl1ZThBWXZsSEZGMnhWWExJTEIrNTI0TkkxMkNU?=
 =?utf-8?B?VnR2ZVp5R3RJZmdyRUFmKyt2T2w4R3REZzd5S1JuVEdYakFRUkpsMFBFZk1n?=
 =?utf-8?B?MFdENXIybU04eXBISzF2NlRZKzhtL0FOTWhwM21mOEwvN016QzdZSGRiVWJn?=
 =?utf-8?B?ZWVpNThheTZLcW9jZGlDbmplUERyS0RxRDlYd0MvYWk4NE1VMlJrY09IbmFw?=
 =?utf-8?B?TlZmeTZMYUlqWHQ5aitsMEYreFY0Z0FXc2tZVzVCNVd3a3VIRVpueHZuQTRv?=
 =?utf-8?B?bkxOckpWVXNHOUxzenJTWUF6cjRnNDlpWDZURFZEQUUyVFNGOFQ5RGdMenBm?=
 =?utf-8?B?RTZpWWtpWHQzd2ZxNFRndkFaTEg4a1MzRHlYb3lzOTlUY3JWR2o4TE1Uam9F?=
 =?utf-8?B?aFZLalExdTNybGNlbEp1cklpVGJnenIxMGpYSkdBa3J0R2k3Y2dUd1JQRTVT?=
 =?utf-8?B?TnRtWCtRNzE4RTJOb1BpelpXSnR3R1NEclY3dGtTeWNvRDg0U1ZueVN6K0xa?=
 =?utf-8?B?MWI0eWZQL09EZmNKN2VieEdudzEzdzZmaHRkcUp1Vjc1N2ZxbzUyd2Z3Nncv?=
 =?utf-8?B?REVGTGE5cmFReWhSN0E1OXpFYjVDSjd3N0xtTG93TFZVSzdwZlM5N1VvVkI0?=
 =?utf-8?B?eURLdnhZTmNjSGh2cUlFVUNLWVpFUFFmNmFBYVhEQXp2WFYyWVRQSnlyUlJL?=
 =?utf-8?B?UnlkMFVWbC9VWkwzTVNnUDJTdDVOK2NhU2RoTE4rQjlwS3BWVzlyVVpuaWlu?=
 =?utf-8?B?bk45OE1uK3RqOS92ckUzc3FWYlhjVzhFdzcwcldBUDkzanBSTzN2b1pnaHhU?=
 =?utf-8?Q?Y61BlvsL3Tg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alUxY0ZVM0lPMTZ2bG9zVXQzZkd2eElsc3BZb0h3aFQ2VS9EVVFsQmlnNjZ3?=
 =?utf-8?B?WlBJWXpnL3MxbC9CcFQ0VS9UQ2k4YjZ2VVZKSklZVWtrTGppZXU5S1JreDFS?=
 =?utf-8?B?VmwwTnU5VlExTGYzY3VzL1ZmSGdLUmZYZEJhaG1ZMnNYcEF5SzNNbzFpcm1J?=
 =?utf-8?B?VmMrZWc3azBqcThqNHZPRVZvQnBkUGRBcDBjSzZnbzhqQmswN0FDN3ZvQkxT?=
 =?utf-8?B?YVdGTjRmT3FsdFJJQUwyMXFFdlZDanNsMG5ydDZqTG04bUZCcExyOGR6UHZD?=
 =?utf-8?B?Mm1SZXFRT3EySG95bDdBTkRXdnBxbFpYY1lVVkNoVDlaYmZDM3VWMStsMTNM?=
 =?utf-8?B?RzJYaVdlbkV2VjFXa1NCYVQyZUw2UklaRGJNSUl2YlFlRWhOWVhDOCtMSTdF?=
 =?utf-8?B?SDBxUDdIY1ovcktxYVZGN0VHWG5FeWZUTFBRNDNrbXlDTFEzeVY4MkJ0eVJR?=
 =?utf-8?B?S1dvU2xRdmpQY2luMTFEUHVnUWMvRGZYcFFhWDB1R1d6U0dKQ3NxU1VQeEpW?=
 =?utf-8?B?VzBERnM1K2FiMExuT1dOUWMrakcreFZuakptZU9zYjJENjNJaG9PbkI0VUg1?=
 =?utf-8?B?T2lQMXFXNFRiazlPWEJRUVJrQUF3WEJ6TDMwdGZsQXF1Z1RJVHZ3UWpTMWFT?=
 =?utf-8?B?eXQ3NlZmNFRrTlNOWHhHa1NtNThqYkl5eXJsNVcvZkplWXFUWjYxQzNZMUs0?=
 =?utf-8?B?MEEya0hEaDlpTDd6dnVZRzFOd2wyYnRpdGtMd2hPZHgxcW5ZQmVsVkkrNTFB?=
 =?utf-8?B?ZUZHUi9UaldGN09tOHpSN0VLbm4vam9FM1VleHZEUEFpVzJLMnBlM2pqbG5p?=
 =?utf-8?B?UTBwQkxYQlRaR3FCdUEvd2wrWTc1ajRNSnYxT3FneHNIemkyRldraGdua09N?=
 =?utf-8?B?QTJnRU1zbTdOa1VITnpKY1ppenJkUHlJL0dPQVFFZ1NXWXpnNnhYNGI1ODNX?=
 =?utf-8?B?bGF4MG0xdzFkVHdNeDFCYzNhMXJrU3ZEVFFwMTNVeE9FcFMrRlBGeWJvYWlW?=
 =?utf-8?B?eENDZmtmNWpwMVdqQlR0ZEF1VkJmeG1neVNVcStST2J0c0JaR0FVTzB4SDN5?=
 =?utf-8?B?MGxLWTh0a01yWi9ydDkrTk03U0tEQlMyZlBnSXlBOGNJb0RTTDRQRWZ2TzJz?=
 =?utf-8?B?QXJJNUpNZlJGZThiQ0UxRUd5TVdGS1c5Q2FFVmk3bHdiWW9wVGVmWURBYk9Z?=
 =?utf-8?B?bUNUNG9GSGE1azlVQWhETjg0YzhrRUhjQ2ZQdld5QmNVMVJHempFV2pycUNN?=
 =?utf-8?B?S0srMklhWVBvd2pkOUl4WUt6dlUxelA3T2JTdTdnaUNJRDdYVEE0SHViUk95?=
 =?utf-8?B?SlJFNHlnS2hQTkZrRHhZZ1NSTTV0djA0bFF5SVpha1FGY1hic2ZlUzZZZ0I2?=
 =?utf-8?B?MUpVS2l1aSsxRnh4aXFlWnVSejZ1NzE1cTNxcmg3S2hORWVhZUh1a1NNbEQv?=
 =?utf-8?B?ZDhBMWxlSTVESm4xUGlPUE1qZ05wZW1uMlVRM2kzTlVMVVJSZ2crSjhGeUhO?=
 =?utf-8?B?K2VMdjBQcEJMN05tU2dDN2hIZ0lMdzY5clpLZC9uNlJzWkxUTnA5Z3F3bnFO?=
 =?utf-8?B?VTRYU0w3KzlqVDhmLzZzaVBuSHMyc0JTWXpuZ0VjcnhnN1FzNnNzYkJTN3pV?=
 =?utf-8?B?YjJtRmNxRVlXZEV2SHZnaDhVaXBNZkhMRjFWVGdUYi9QeHBRTzltcUg1UDZn?=
 =?utf-8?B?ZGJwd2Z0SGVwejhlMFJNMm1nVHByWWlVRU01enN1M1pNR0tma3hRNTZqV3hI?=
 =?utf-8?B?b2duNlNBVHRGenlvYXBhOU1hcXk0aDNkcG9wVjh4aFFyWWdMMUxXQTFJOTNo?=
 =?utf-8?B?SmVtNG1RRm83THFoYmJxR2V3YTFOenBVeDM4bTlmeHhjeUdkZ3ZrbEhOZGFS?=
 =?utf-8?B?MmY1OEw0VnNsY21MQXdsRjdDNHdqMlMvVERQNTU3Tm9wVm1TamtRcU5FR1dp?=
 =?utf-8?B?NWpGUVQ5OVFSU2hibzVKdzl2M3l3SEJkdmhzbFdZUGhLaGJxUFV3Q0xud085?=
 =?utf-8?B?eWRibGtQTDdTU0ZQZWhROGM5Q3RwVlRHK01RMFVYa3R3bHhjeHo1M0JzY0NX?=
 =?utf-8?B?V3F1MStxS3hBa053U2lVdkF6c3pmcUNiUjlnbkowSFY3TmRyVloyRm1MRUZM?=
 =?utf-8?Q?aMxKpQD9lD9EMsBWdQ5Ts6SvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b77a947-d445-403b-b2eb-08ddeb9da67e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 10:27:29.5807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdFO69xYSCgYSFKsK/WfuLYwOelbIatDMNnoKTUe8sSdYBPjWwCTT5SKU2LPNDDq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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

On 01.09.25 10:31, Philipp Stanner wrote:
> This reverts:
> 
> commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")
> 
> from the drm/sched teardown leak fix series:
> 
> https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.org/
> 
> The aforementioned series removed a blocking waitqueue from
> nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
> prevents jobs from leaking, which the series fixed.
> 
> The waitqueue, however, also guarantees that all VM_BIND related jobs
> are finished in order, cleaning up mappings in the GPU's MMU. These jobs
> must be executed sequentially. Without the waitqueue, this is no longer
> guaranteed, because entity and scheduler teardown can race with each
> other.

That sounds like exactly the kind of issues I tried to catch with the recent dma_fence changes.

Going to keep working on that and potentially using this here as blueprint for something it should catch.

Regards,
Christian.

> 
> Revert all patches related to the waitqueue removal.
> 
> Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")
>   - Add Fixes-tag
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++---------------
>  drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 +++---
>  5 files changed, 24 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 9f345a008717..869d4335c0f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  	return ret;
>  }
>  
> -void
> -nouveau_fence_cancel(struct nouveau_fence *fence)
> -{
> -	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&fctx->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&fence->base)) {
> -		dma_fence_set_error(&fence->base, -ECANCELED);
> -		if (nouveau_fence_signal(fence))
> -			nvif_event_block(&fctx->event);
> -	}
> -	spin_unlock_irqrestore(&fctx->lock, flags);
> -}
> -
>  bool
>  nouveau_fence_done(struct nouveau_fence *fence)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 9957a919bd38..183dd43ecfff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
>  
>  int  nouveau_fence_emit(struct nouveau_fence *);
>  bool nouveau_fence_done(struct nouveau_fence *);
> -void nouveau_fence_cancel(struct nouveau_fence *fence);
>  int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
>  int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 0cc0bc9f9952..e60f7892f5ce 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -11,7 +11,6 @@
>  #include "nouveau_exec.h"
>  #include "nouveau_abi16.h"
>  #include "nouveau_sched.h"
> -#include "nouveau_chan.h"
>  
>  #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
>  
> @@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
>  {
>  	struct nouveau_sched *sched = job->sched;
>  
> -	spin_lock(&sched->job_list.lock);
> +	spin_lock(&sched->job.list.lock);
>  	list_del(&job->entry);
> -	spin_unlock(&sched->job_list.lock);
> +	spin_unlock(&sched->job.list.lock);
> +
> +	wake_up(&sched->job.wq);
>  }
>  
>  void
> @@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
>  	}
>  
>  	/* Submit was successful; add the job to the schedulers job list. */
> -	spin_lock(&sched->job_list.lock);
> -	list_add(&job->entry, &sched->job_list.head);
> -	spin_unlock(&sched->job_list.lock);
> +	spin_lock(&sched->job.list.lock);
> +	list_add(&job->entry, &sched->job.list.head);
> +	spin_unlock(&sched->job.list.lock);
>  
>  	drm_sched_job_arm(&job->base);
>  	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> @@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
>  	nouveau_job_fini(job);
>  }
>  
> -static void
> -nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
> -{
> -	struct nouveau_fence *fence;
> -	struct nouveau_job *job;
> -
> -	job = to_nouveau_job(sched_job);
> -	fence = to_nouveau_fence(job->done_fence);
> -
> -	nouveau_fence_cancel(fence);
> -}
> -
>  static const struct drm_sched_backend_ops nouveau_sched_ops = {
>  	.run_job = nouveau_sched_run_job,
>  	.timedout_job = nouveau_sched_timedout_job,
>  	.free_job = nouveau_sched_free_job,
> -	.cancel_job = nouveau_sched_cancel_job,
>  };
>  
>  static int
> @@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  		goto fail_sched;
>  
>  	mutex_init(&sched->mutex);
> -	spin_lock_init(&sched->job_list.lock);
> -	INIT_LIST_HEAD(&sched->job_list.head);
> +	spin_lock_init(&sched->job.list.lock);
> +	INIT_LIST_HEAD(&sched->job.list.head);
> +	init_waitqueue_head(&sched->job.wq);
>  
>  	return 0;
>  
> @@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
>  	return 0;
>  }
>  
> +
>  static void
>  nouveau_sched_fini(struct nouveau_sched *sched)
>  {
>  	struct drm_gpu_scheduler *drm_sched = &sched->base;
>  	struct drm_sched_entity *entity = &sched->entity;
>  
> +	rmb(); /* for list_empty to work without lock */
> +	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
> +
>  	drm_sched_entity_fini(entity);
>  	drm_sched_fini(drm_sched);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index b98c3f0bef30..20cd1da8db73 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -103,9 +103,12 @@ struct nouveau_sched {
>  	struct mutex mutex;
>  
>  	struct {
> -		struct list_head head;
> -		spinlock_t lock;
> -	} job_list;
> +		struct {
> +			struct list_head head;
> +			spinlock_t lock;
> +		} list;
> +		struct wait_queue_head wq;
> +	} job;
>  };
>  
>  int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index d94a85509176..79eefdfd08a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  	u64 end = addr + range;
>  
>  again:
> -	spin_lock(&sched->job_list.lock);
> -	list_for_each_entry(__job, &sched->job_list.head, entry) {
> +	spin_lock(&sched->job.list.lock);
> +	list_for_each_entry(__job, &sched->job.list.head, entry) {
>  		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
>  
>  		list_for_each_op(op, &bind_job->ops) {
> @@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  
>  				if (!(end <= op_addr || addr >= op_end)) {
>  					nouveau_uvmm_bind_job_get(bind_job);
> -					spin_unlock(&sched->job_list.lock);
> +					spin_unlock(&sched->job.list.lock);
>  					wait_for_completion(&bind_job->complete);
>  					nouveau_uvmm_bind_job_put(bind_job);
>  					goto again;
> @@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  			}
>  		}
>  	}
> -	spin_unlock(&sched->job_list.lock);
> +	spin_unlock(&sched->job.list.lock);
>  }
>  
>  static int

