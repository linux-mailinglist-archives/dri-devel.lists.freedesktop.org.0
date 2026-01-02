Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CABCEEE87
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 16:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1810E2B6;
	Fri,  2 Jan 2026 15:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c4BIqDuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011055.outbound.protection.outlook.com
 [40.93.194.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FA910E2C9;
 Fri,  2 Jan 2026 15:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i61d2QieUZXdvebpeR1H4s5lbZXX1Go/nHEDe09oAkh/35AwpHURagW9QVfFt+/mV+Lhh8HpyDJnNBqvnWiJXGcxG8D1b6y3Ek5SMwxKRnQruK4bnryE/gCc4fx/UI3xJd8p19KIRK1rk3leuDPiXO7Qic3Zwi/KnqenBd9C1Vni8DfIZe5sOlJExP4GIeFtnabXuJy4sgD7liNyz+DDzTqKfr9e91bLWinrcmO6UQerlOXLjh9PTBJjY2qCMD1Rp1LyyJd79yexqHmKdocTvxZolILi+dW8GHb1B0IHJGwamB3RctAqGwRYN169Fd8OTV8lx0oTPNG6xYR9VTKb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2SRosXTUp99PZLKNbMsmUrBxGWeUcGZAaVNwo+uWx0=;
 b=ZV2x0uPBj7bD1y/hhgIvgdSW552GGKMb5DUk+/IGUPiY/VQ0xWx3Li4zBK/+JWVd+mNQGD6pfQxFtC5A4aZjhdt0iltKXBLFy41V7E/JckMLEKi8bPN5FB4j68Ky1jwJPnqQUd+rDMmdjx6mZGiPOAG1M74pnIlKLwtl1lIuMaez752ShsOBxifQJlLVVVswyQ5xaVxQMooDuD1R/Izk5fBfCbibu8TL7AFd306UIEFi9+R3k+mVQfGqmGgoM303pR2SGi2ws4sAl6pV37Kuc5s1s1U5kngaibnE03B/fgabBpMvP5mlB8jCb4ZnPi0CnwonTuisRm0Ii0cN3Ec26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2SRosXTUp99PZLKNbMsmUrBxGWeUcGZAaVNwo+uWx0=;
 b=c4BIqDuRnJe43Pi9nWnvL10aPB2l3+ULEmgjLhHUYGfLU1tRRwEP8EHChdivlR5XkldjcR5Kg42gx3Re7FUBUZJniX0hilYT4+RIwzC7/F6q/R/rPAR3uGnuecc84d3HstGAlh/tifI+OPzou/NMPK123xerw80YmIU51wRdzZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DS7PR12MB6189.namprd12.prod.outlook.com (2603:10b6:8:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 15:51:01 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 15:51:01 +0000
Message-ID: <91c20790-ceb6-4efe-957d-2ad7fd930fdb@amd.com>
Date: Fri, 2 Jan 2026 10:50:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: suryasaimadhu <suryasaimadhu369@gmail.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org
Cc: siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com,
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251218104533.1551352-1-suryasaimadhu369@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20251218104533.1551352-1-suryasaimadhu369@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0429.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::19) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DS7PR12MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: c57210b3-3a01-409c-f6b4-08de4a16bab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTZQZURMSFlpWElUS2s1ZEJRSTlrY2hhVmRuV09UUVkxK1JVenRJUmdpL1cz?=
 =?utf-8?B?WlpnY0xIQ0xQdm1FZ0dTUG1ha2t5Wk9mTEFobm5TSFFETmNvSVF1Z1loc2Z5?=
 =?utf-8?B?RlRzN25yUS9yUFZkOHBOalR6dzEyL3Rlb1F3eFlBL1pLdmFiUW5RRyt6QUZP?=
 =?utf-8?B?am9xNWZabGt3SmQxSEJ4SVBSQkVHbnpBUWx0MmVPS0Y4YXhORGpMTmNWZC9O?=
 =?utf-8?B?UjRieWZ1NzdxVmI4WmNheHl5bExSM3VvdklqTFBPWjl3QXNuTTMwMDVMSDBY?=
 =?utf-8?B?dW1QNVBaZTg4dXZ5a0h4cXhaWEh4NVNhVGwyWVN4a3J0SnZSbVBZY05IRGtw?=
 =?utf-8?B?elZDejhIZ1NmMktBMmx0M1pHd0MrWTE3Q2QvcHhKSHFjci9VLzNtNFA0Z3pY?=
 =?utf-8?B?RjAvZkd5YUJwR0liSGMzSWJ5TEt3bS9kRThhTnBTdFhLKzRnSVAwWGZ2VW5i?=
 =?utf-8?B?QlJiT2RIVk1wU1dMeUtiNkFyS3YwaFg0UEZRQW9EaExhOStvSmk1VndKQity?=
 =?utf-8?B?NlhPS0tDWnV1dFRXSDZGOXZUWE1pSmd4Q2dMU3JxVWVUYVBNeEh6Y0RZMERk?=
 =?utf-8?B?dE5KdHo4SFY4dENodldjUVJGdDBrTVBGT0ptcHhpbExSdkdZbmhpR3YwRjg4?=
 =?utf-8?B?UzNJT1kvbjNBL3FOSmhFdWNyd3BJT1E4MWVoSTJKSWQzakpTb0FnbXNKTUsw?=
 =?utf-8?B?bjNRalhidm9ZUFdQeWtQeGdOWjlHZG5qbTFrQjdxQ0piNHF0ZS9WRDlUbGdE?=
 =?utf-8?B?Z2lzZHJoMkxkMzMrZFdBL0xuWlZkWVVMbzZyYkMwYk10MWNtL1JtZDkzQzZP?=
 =?utf-8?B?M2crZ2F1ZUpab2NQVUNlNnR0cVNweEF2MWI4M2FZQVVyZ2VBUEk1TzBZbDdV?=
 =?utf-8?B?MDRiUEZ0VUxRR2RqdnFyaTlZZVpwbmVma2lDM0pBQkZkTTN6a1BDZG5oQ2tG?=
 =?utf-8?B?MGxncmFJa29sVkdpTkg0Q2phUmFMRGszYm1JTjVKd1NDbzdvZi8wTWduWlBC?=
 =?utf-8?B?NU5LOW1BZmpwWnI3UkxhL2w3RG9PZy8vR29qR0duR0NRbFhCQmpyYXFvNXhS?=
 =?utf-8?B?V2Q0MzFKQkVxTzI1bHJYclZxNkxiSW84MVNhOTRSZDFzYjFaamZzbWpEZ2FF?=
 =?utf-8?B?VDZ1K0g1dmlXQmFsd3dnZUZvdFJ0R2hCRXp6L0c0WmdnRHdwaG1VeEJkVGJh?=
 =?utf-8?B?RjdibFo3VTZGQ01oL0kxelRxNUNGN2dJR0FNcE85aXJMcmJnOWpIQkFDT3ln?=
 =?utf-8?B?L2JYMlNyR2lTc0NFa002YzdCc3g3VWJ6VXRGQzVNZHlIZUdKSVIwK3BCRkVS?=
 =?utf-8?B?VkJYcW1DMHJoRE0zZXlxekxzd05IcUc1VzVGb2F2R1JEcTNMTW1WUFVaTHRm?=
 =?utf-8?B?OHEvQ2tEOU0vY01JNTVyMWZYUnZaMzdVTzVyWXhKK3QrdjYzV2UxenNFcWZw?=
 =?utf-8?B?R2ZQSmpybFZQY0k4Q0o1Mm1ldlNrZFBQelk5TmZzTFJOZzA3dUM4SjUycVdi?=
 =?utf-8?B?TENYUzd0UXVuWGdVL3BvNTAyMVZDWThoSUNBMFQwL25kUkpRMlNoOXVNNzN5?=
 =?utf-8?B?WjIyT3BGbXYzdFh1dkRjc1hFWGhEclozRURzQWhndlhpWWRxR00rYWpOU3Fr?=
 =?utf-8?B?TTIzSWtJOWp0V2w4U1N1N3VwZUlwVmxqcmFJdkVyZmdMN0ovdGZ3QmRMTDNp?=
 =?utf-8?B?OWx2TlM1ZWFQejdIUkMrQm1uQkNqSXU3bExPcGs3KzF2TWM3Y2Rrb3l0b1Fp?=
 =?utf-8?B?bjMwK2hsOUxhMWtRQmJnaS84WlU3NDd1eHJMVDhUaktraFVTcmZCODV6dDhL?=
 =?utf-8?B?KzlTUFBZR28rZzh0ZVFQYnIwWlFwVXVVaklNV1ZBdHk4Tk9Fa3d1VTY2TWdp?=
 =?utf-8?B?TU1NREttSExOMkl3am0xMUdqeWFHTzdxczMyc3ZVODF3cE5LaFA0RnVWWjNt?=
 =?utf-8?Q?4NBfr0ThX5l5iq1ElnWaVfaiQjJyE7sz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NSZi9XS1BJT2VaaStSUFhqYkxJOWFwYSt4OFNlUW1xUEw4ejk5TXhvUXUr?=
 =?utf-8?B?aGVWVVJpVXFWUFpQNzNRM3I0bE9pQXFDYkdlVDJuelZ0VGhsRVRNQTdhZy9J?=
 =?utf-8?B?SXJoWDJBM1VNMFdzTmI2c2ZDRWIxdFM4TDdKbk1vZ3pUUW5rbGEwVnNKL1Rj?=
 =?utf-8?B?SjFOYkFxYitUQWZkTXhVQVdkSDBJRkV5VGdObktLTVJScEVzWUZkNFdvNjdy?=
 =?utf-8?B?ZXNjRWo3RUVsUlBpN3ZjeUUwdWN0dytqTXdmamFseE9YeDdNbG1Ua2pMRUw3?=
 =?utf-8?B?Szk3eXRnbjJFcDhTTlZpbHRlYUhDeTZDWi9JTS9VMnI0aHlVVFVLcFlUdURk?=
 =?utf-8?B?UnZZY3EvcUVSQWd6cXEydjBDOHdBWm12VUNNMnd5MlJYQnVIdW5rSlJqMWhI?=
 =?utf-8?B?TGlnUFlPK2wrMlZnRElCYjFFYUV1OVJlRlV1endjWDJYQ2RVYUl3YVdzL3dx?=
 =?utf-8?B?N09weDN6REIxWllySVNRM0xzcmRJY21oMEoyRElsalJPdFJBWjhPY01OeXcz?=
 =?utf-8?B?aUkwRDZXSXkyTHVJbXhpbnkxVC93dkZ6dW1ocHNmblRUVWFreUVVdzg4WW9I?=
 =?utf-8?B?TTJiemlKSG1CcEZlemFjb29BNVdxY0dzQkdWWHM2ZDV6Y1JuZTlJOG43eDZ0?=
 =?utf-8?B?aFdoQ1k5eXQ1bVhVa0x4dlNFd2ZEZWN3NnQ1S3RkRk44SEh2YlhJR09LWWRO?=
 =?utf-8?B?NWEzMjhkWW1sek9Cbit5eHNHWjk5Z3ptTlFvaHZkZWZ0NmJsbW1CRkw5VUJI?=
 =?utf-8?B?dnRLWTFkZ2ovWlREYVlUckxnOHVkamZGN1NpOHkxZUkwK3RLelpJdUFIcE44?=
 =?utf-8?B?WlI2QmFMWll5TEpRdi9Ta2IxZWFkZCtOR0U2NlpoR2lPeWgwWmtUcTVHYnM3?=
 =?utf-8?B?NzNUQng1RnNHdlJlb3ZSazErNjM5ZkRqTDJwZGV5QVFHOUg1VWVndVJwcEtp?=
 =?utf-8?B?QkFiZ0YyRXBSekRuUExtRHB0TG5lTHlaeCs4eEd0emRLZDFuUHVHQ3daOXNG?=
 =?utf-8?B?Q0ljUmtFaFdGMmRoNUpUMXlXLzlpRXZIcTd3ODFsVTRIRlFpY3dGblVIRjhx?=
 =?utf-8?B?SDI5SFVQRU52MThpaVVvcWUzV1Z0TkQ1SUcwM2NjaEowOENrWFlGYnNvUmkr?=
 =?utf-8?B?anpIOXFoVWRaMUxkQVJicDlsbFdSeVpUTGF4WFFXajIvaVJDbEFwbUg0aFVN?=
 =?utf-8?B?U3FzUlZseEVPYllSK1VTay9Kb1d4dFE1bkhCZkFObW1mQ3hSWmFQUEZVc0ln?=
 =?utf-8?B?VnFKdXlUbHg1cmVJeTIvUEhQSldlZ0dMVkJUTkd6RWpwamlzU3A4Mmgya3Mw?=
 =?utf-8?B?OFZKV1FtTGdySGFObE5SQzEvWTdNd0MzTnkwTDRCTUJWVzQ5WDZXUEFFSEhD?=
 =?utf-8?B?RDdqbVhidVZWRUxNMWQ4b0xBSHhuY0FTQjNkTFlGcUFzZk5wN0ZiYW5lb3k4?=
 =?utf-8?B?MHUyZWNOQ3k0ZzZUU1NGOFhtODRDSHZFU1NleXJrZE1SaElkQlk3Z3F2VDdN?=
 =?utf-8?B?c1VRaXhJaVl0U1hpM2t1aU1WdkpZK1k3bllYNTVOUXRNaTdLWHVCY044QjVq?=
 =?utf-8?B?cStrKzBQY1pqVXFOT283Uko2MjU5YVBIS21VcmhjYURVNEVIWW1yZUZyTFlB?=
 =?utf-8?B?NkxvRS9ieXUzSEFKYzJqTTl6SFIwUWRZMHYwd0F6ZUdnUjJ2endadXh6TVh3?=
 =?utf-8?B?djJBTWZ4dnVCOUIzQ0F1UFBBbUorcUdHWUZvcUdrWnRPWFV4SDJHNUxLNjUv?=
 =?utf-8?B?VVdNT3FRNWRMYzhjTVpEeVF6MmNFbGk3K2E4R0hEMXFVNVpSR01UcDVxYXBa?=
 =?utf-8?B?ZmpsaURpR01IZitQMTEyQkZ5a3ZuSDU3ZDRSblk3a3RnSmFQeTVUQmNXMW80?=
 =?utf-8?B?WkFNS3VpcEdLdGRYUnovaEN3MHp4VWI2YUpQSmlCN2RHSCtuMmdxK3VJMEhu?=
 =?utf-8?B?K2xUTTRoSnhuOTI2YnlwOTd2M0pMckhlb3J2NXh1dFR1NGhzdmRUMk00Z2Vw?=
 =?utf-8?B?emFISDR5akRGRkVBN1ZIK0UrVkJTN3EySW1BaUtvZDlpR21EUzdnc3RzMU5Z?=
 =?utf-8?B?am1ScUxQNmVRZDNWbklxN3hOWnFKRS95VGpCRkdIQ0p5aUxOTjZGYjd2V3Ra?=
 =?utf-8?B?dkE0RkxzRUhVQUFoS3JseGhSWFo1aU9qZHIweTZPTmo2S0xEVzFVSUpLdkFQ?=
 =?utf-8?B?emdKeWtLM1dXVk9sL2cvWHFJRHRtRXZuUERXYmI4Y2dRTnlOOVpyMXpoMCtU?=
 =?utf-8?B?ZjJvc2xPaUlOTXlxcExyZHJqOU1DV2xhUE9WSXpSNTJGS0hLTFVUQ1MxbU84?=
 =?utf-8?B?UWNMUGxWMFFaQzRNSHorOERvVVFmdEM3aG90RDlZbGYzNUVZSlIydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57210b3-3a01-409c-f6b4-08de4a16bab5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 15:51:01.6863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+B3vbHku7JC5cQRVU0QINM0o13UMV6u03caE35a0zFTW60VQoyEcIiTQG15sV82R3GXEVDVDAbrowiL77KnHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6189
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



On 2025-12-18 05:45, suryasaimadhu wrote:
> Replace DRM_ERROR(), DRM_WARN(), and DRM_INFO() usage in
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c with the
> corresponding drm_err(), drm_warn(), and drm_info() helpers.
> 
> The drm_* logging helpers take a struct drm_device * as their first
> argument, allowing the DRM core to prefix log messages with the
> specific device name and instance. This is required to correctly
> differentiate log messages when multiple AMD GPUs are present.
> 
> This aligns amdgpu_dm with the DRM TODO item to convert legacy DRM
> logging macros to the device-scoped drm_* helpers while keeping
> debug logging unchanged.
> 
> v2:
> - Keep validation helpers DRM-agnostic
> - Move drm_* logging to AMDGPU DM callers
> - Use adev_to_drm() for drm_* logging
> 
> v3:
> - Pass struct amdgpu_device to helpers instead of struct drm_device
> - Compact drm_* logging statements
> 
> v4:
> - Drop newly added parameter validation logs
> 
> Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
> 
> diff --git a/Makefile b/Makefile
> index 2f545ec1690f..e404e4767944 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  VERSION = 6
> -PATCHLEVEL = 18
> +PATCHLEVEL = 19
>  SUBLEVEL = 0
> -EXTRAVERSION =
> +EXTRAVERSION = -rc1
>  NAME = Baby Opossum Posse
>  
>  # *DOCUMENTATION*
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index 0a2a3f233a0e..07d1d3b9d49a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -242,35 +242,29 @@ validate_irq_registration_params(struct dc_interrupt_params *int_params,
>  				 void (*ih)(void *))
>  {
>  	if (NULL == int_params || NULL == ih) {
> -		DRM_ERROR("DM_IRQ: invalid input!\n");

This isn't doing what the commit says it does.

Don't go around removing logs without good reasons.

Harry

>  		return false;
>  	}
>  
>  	if (int_params->int_context >= INTERRUPT_CONTEXT_NUMBER) {
> -		DRM_ERROR("DM_IRQ: invalid context: %d!\n",
> -				int_params->int_context);
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(int_params->irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source: %d!\n",
> -				int_params->irq_source);
>  		return false;
>  	}
>  
>  	return true;
>  }
>  
> -static bool validate_irq_unregistration_params(enum dc_irq_source irq_source,
> -					       irq_handler_idx handler_idx)
> +static bool validate_irq_unregistration_params(
> +	enum dc_irq_source irq_source,
> +	irq_handler_idx handler_idx)
>  {
>  	if (handler_idx == DAL_INVALID_IRQ_HANDLER_IDX) {
> -		DRM_ERROR("DM_IRQ: invalid handler_idx==NULL!\n");
>  		return false;
>  	}
>  
>  	if (!DAL_VALID_IRQ_SRC_NUM(irq_source)) {
> -		DRM_ERROR("DM_IRQ: invalid irq_source:%d!\n", irq_source);
>  		return false;
>  	}
>  
> @@ -315,7 +309,7 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
>  
>  	handler_data = kzalloc(sizeof(*handler_data), GFP_KERNEL);
>  	if (!handler_data) {
> -		DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +		drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
>  		return DAL_INVALID_IRQ_HANDLER_IDX;
>  	}
>  
> @@ -396,8 +390,8 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
>  		/* If we got here, it means we searched all irq contexts
>  		 * for this irq source, but the handler was not found.
>  		 */
> -		DRM_ERROR(
> -		"DM_IRQ: failed to find irq handler:%p for irq_source:%d!\n",
> +		drm_err(adev_to_drm(adev),
> +			"DM_IRQ: failed to find irq handler:%p for irq_source:%d\n",
>  			ih, irq_source);
>  	}
>  }
> @@ -596,7 +590,7 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		/*allocate a new amdgpu_dm_irq_handler_data*/
>  		handler_data_add = kzalloc(sizeof(*handler_data), GFP_ATOMIC);
>  		if (!handler_data_add) {
> -			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
> +			drm_err(adev_to_drm(adev), "DM_IRQ: failed to allocate irq handler!\n");
>  			return;
>  		}
>  
> @@ -611,11 +605,11 @@ static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
>  		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
>  
>  		if (queue_work(system_highpri_wq, &handler_data_add->work))
> -			DRM_DEBUG("Queued work for handling interrupt from "
> +			drm_dbg(adev_to_drm(adev), "Queued work for handling interrupt from "
>  				  "display for IRQ source %d\n",
>  				  irq_source);
>  		else
> -			DRM_ERROR("Failed to queue work for handling interrupt "
> +			drm_err(adev_to_drm(adev), "Failed to queue work for handling interrupt "
>  				  "from display for IRQ source %d\n",
>  				  irq_source);
>  	}
> @@ -720,10 +714,9 @@ static inline int dm_irq_state(struct amdgpu_device *adev,
>  	struct amdgpu_crtc *acrtc = adev->mode_info.crtcs[crtc_id];
>  
>  	if (!acrtc) {
> -		DRM_ERROR(
> +		drm_err(adev_to_drm(adev),
>  			"%s: crtc is NULL at id :%d\n",
> -			func,
> -			crtc_id);
> +			func, crtc_id);
>  		return 0;
>  	}
>  

