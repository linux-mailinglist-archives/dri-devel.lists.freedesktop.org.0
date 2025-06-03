Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DAAACC89B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 16:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70D10E62C;
	Tue,  3 Jun 2025 14:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tba1RTyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600710E20B;
 Tue,  3 Jun 2025 14:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o60cI6FZ17/lrskzl+WOT/UD5Dt17iqTDUT1HEZaV+LoZhyqebQiTvkMzR4NxQl9ucqap8CxKzY4INqcvVUxUUkRmRTbxQhLPDdgkbIdzzzev8T/HZE83cHqWQlxI4JwzAcryrRA1tT7t3eLr7SjWGtLIDla1sdO7WzzsZsd7FHL/Jfp+x1bx3SAkxnR38TKtrw0xl3pfNq3BIT6EzNbIDoEGfQRYjbBwG3awYtZ8wvrnpMxU/7+9wajndHYFqgeAEfRtevfi0gpoPACEQXd+8FujB7yXasA7Kx5ZYVs7ogJmeWsFpHcY19t+EhroXksxDQ7+1gg8FoDdXZZLDotHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIp9/2S88QeOFvI1ayGg1v0yiduhQ+wee95DOK+6Z5c=;
 b=wl58RNc0b5miN13pWkEwyrb0MUwQASAQaUhnkZCL14Eqk8dZ8v5h59KwTzUoDy9RqMiL+Yj0q5St+ByP+708tjyCRcFZKYZW9QfKeMbEMbFkwAwu8JCrAK543diwT3iLqy2xXG9B1SeevYCLoO8HovDPDLzWCgMPrph3VYJ1yjQDRKcgZlc8tGuOg36HtjnOpQPBzJHKcKp2f9K05zj5WgInkg8xgihSA5gUvcXcN2P1XCcUN7BYOaD/BuPBgD/LOY9qODzPzuhwPYyyloil/cHBc5EHyEgG93ZarxYoRaMSZd72zVg/U/Cnu6jOBzeQRfncMvxEYNtdoVEtM79kCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIp9/2S88QeOFvI1ayGg1v0yiduhQ+wee95DOK+6Z5c=;
 b=tba1RTyjAqitCsdu/lwYKJ4GHP/uOZQqVcQ1RfM/x32HW0G0y+yKCmmsDaIh32ArH+Of6irP5sAZomR9PcFEB2rOxrbt86AN07Jyhckq13KP/6RMvgb+gAoDG5gSzKZXgacgPbLCeFTo+TflAf64UpDnzyQNRjTxu2kDyz4H0wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6073.namprd12.prod.outlook.com (2603:10b6:a03:488::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 14:00:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 14:00:33 +0000
Message-ID: <da0db1bb-64fa-4a42-b14a-694e98c6f057@amd.com>
Date: Tue, 3 Jun 2025 16:00:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <d483076a-b12f-4ade-b699-ee488df298ba@igalia.com>
 <2ffc513c-2d11-4b76-b9c9-c7cb7841e386@amd.com>
 <7598fd9c-7169-4a01-a24a-b9e666e9a915@igalia.com>
 <3b614b74-4e6a-4e8a-9390-6f65ce788d02@amd.com>
 <055d9c65-b338-406f-a0e1-1e1b80b89566@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <055d9c65-b338-406f-a0e1-1e1b80b89566@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR18CA0001.namprd18.prod.outlook.com
 (2603:10b6:208:23c::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 765f2317-e498-4090-2cb5-08dda2a70205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2FUdlNGL1NpQkxHQ3NxODZUeEpKVlBWckRCNWk2Rk9peUg4UXVhZmM0UjRj?=
 =?utf-8?B?bmUyZDRMOFRwWVJpaGNtNkpMMWFPZU4yZkxSemZoMllHZ2tMajJKTGxUeUl6?=
 =?utf-8?B?TkRHa2lGbHp0YzZVSlNENDcrNkR5Qk5yQzRTMnFVL2hUTyt2ZGRvMlpZejVU?=
 =?utf-8?B?UmFCWlkzVjBmWGh3WmJ1aUgzbWgxdUpTQk5CRWJ1OURwZkdrZDd3QnY5bSs1?=
 =?utf-8?B?czhoV2pzSFRodHhoOWxtakh1NGpPUlRoMnQ5NWNoUW1xK3IzT2R1aW56enRr?=
 =?utf-8?B?QWRkQm0wRlpHcGtBN2pRRFlkQVl5eEdRV3NCOWdBSm9EUm9FWGF2Ym81am1R?=
 =?utf-8?B?MklNY21wWmZTRmhpVWFOLzBnV0tKZlFWRkd3U0Frc1ZZSjgrK01xdkROM3pp?=
 =?utf-8?B?ZEFhM3prWjM0Y3IwWlFmZFBRb1Z3WTBKVExmL1ErTDhoMEtXdFlPeWtEdzU4?=
 =?utf-8?B?L3FRcWJXQlRVUWZoanF0ekRaQytiQ25QUFNUQ3dhaTk3ZWFvVGI0V2llOE5o?=
 =?utf-8?B?YldUTUwxdXNGMERkaDNNS0JpZiszM0Jzc3B2WXo4VGhJbFl2K3RjWlhtamJq?=
 =?utf-8?B?REhpdUd5c3paWFhrbGM1czFvQ1FyRTJ2MkdWTnlGTnZMMFg1Y0kyYVNMbHd2?=
 =?utf-8?B?SG1HMkRHZUZQUVk4c2NJUWhBY2RFQzIxd1Vkd2ZuVW03V2sycjdMSG1wTEVk?=
 =?utf-8?B?WWNnS3RYTUZ2QlZmWjYzc1pXaVJ1NnYvTHVucm9kanRjeHowTEtsNnV6L0xs?=
 =?utf-8?B?VzMxVWIvb1hpQW9TRlJ2SU5ic0RGRVZSb3ZGbU85SDBjUTRPOEZ3N1VOd2Zo?=
 =?utf-8?B?RGl5Sml5cUpYVGMrcjh1bFQweHprVG1NY0hsakxOdXFjaDJMTmVDQTVhUU1N?=
 =?utf-8?B?RmFKUzA0dkc2aUtjNWYxWTB6L21SdHRiQ0pndkgrbGlna2ZnMHp2MGlDR25G?=
 =?utf-8?B?bXJRTVVHWThZdzBuSU1yWXVJZFdwMG5NQjQ5QmNqaVVyMEc1c2xCVUtnZS8z?=
 =?utf-8?B?eEN5MlNHc2t1Y2pXNlUySUJwZlJIemZQVm4rVWMrM0d4THgxZGlDZVJEVHRs?=
 =?utf-8?B?aDcyYlBvc1d3U1RFNWpBbkJXUzQ2R1pFTUpFMHFkcGVtTVpzcXU1WXhLalJO?=
 =?utf-8?B?VVlkNkxKRS9rWWlmK0M4aGNGR3VGOTk1Rnp4RnhWUWdvcjFWdjMvZFQ4WVdH?=
 =?utf-8?B?dkc5RkU1VzIwTjNROTZHdk5Mbkd0OHliMVNYeXpld3hEYXlXRzV0YkxhWis0?=
 =?utf-8?B?bWV0QWtWQXVUNlgwbGd1c3RiNHZmeUtmUCtWcGR2cWc3UDV3SnFJS2dGR2dS?=
 =?utf-8?B?Qk5INko2OWFXdDZuNDJ0R0pacGsweGFCazg2ZEFkdXJ5VFM3dVNrcXQ3OG5j?=
 =?utf-8?B?YXJtem1OcVZibDhvdTZvQTJDN3pVSXg5SmZrN3JqNi9IS05Ib0tnZHJ0TEh2?=
 =?utf-8?B?VS8zUklUdWtWYXdycGpMa0lqUmJTaklHMVFvcDdjTVp5Mm91ZldtMSs5Z0ZQ?=
 =?utf-8?B?QVRHWnlQcjM4VXpKRzU5alFSWnVNbVBic0VZaUcrOWxsYkpSS1Z0T3F4RDdE?=
 =?utf-8?B?YmJjVmhFa0x5OGtoQ0ZQQzNMeFdZbzhZUkdaRXBqamlaWlVaYi9MZEhaK2RH?=
 =?utf-8?B?ckhuYkJlOVZpMWo4TmJ2akJZZlY5RmVTOHovbUxoTUdYbU1yM2lDR0hmMGF3?=
 =?utf-8?B?cFNRN29neHdpMndhblhqcmFpZHB6U2Z2bHVQRkExSSthNkFhWHhMd0FPMzJB?=
 =?utf-8?B?Y1lJUXVObWJSZWpUQzlYTXpLbDJNT2pweVJMbDdpSnViQy90N1hXM05RQXh2?=
 =?utf-8?B?L0xMMTlaWTVHQ3ROZ2d1UEJEVEVrWjJqTENSbjNzNXZjdFU2dk5Hckk3QVJN?=
 =?utf-8?B?aVE2VWRVSXI1cSs1Y0hjMk55ZlNNS0VGU1VrWlNSRzlrQXQwdDVidmNyZW9h?=
 =?utf-8?Q?cggnkrwNk40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmVKNEpZSEVQaGtpWWplc0JhcksxWVU3eGdFZzdQbm1TRGlWbW1QNUN5eUNH?=
 =?utf-8?B?Z2VpSTI3dEZoamFlZnplbTNMK3FNUDhvRTJJQWMrU3o3OEsvVThWRjFxQ0hu?=
 =?utf-8?B?cFZCWVRYMUVQOXFPbnRVL0FPTXhZQTJIRmcwblU2dVU1T3I3Yko2c3kyS3Zx?=
 =?utf-8?B?VExIckNwZGt5cy8zN3FoRTZYUXdLVFpqOG1TNlo3S3dXbTZPSVZnbnFuVlht?=
 =?utf-8?B?aGo3V1ZWcU41ckJJRXk1ZVlTQWZGRlJDVWFXK1cxQ2J0ZEZGUEdBS1dpaEFz?=
 =?utf-8?B?MEFBcUxZZjhCM3ZiTVgxMUFyL0lzaklNSFdrOXlGSmdGQS9Fd0E5MThDL29I?=
 =?utf-8?B?alkxMnp5dU81dmg5ZWtES0lpVTV6c1ZwZ1B1MFJuVWt3YXFraHdzRGI4TTJq?=
 =?utf-8?B?S21BcDdvQXFSTUpDMTY2ajBYTzQ2OTZTVi85V3N2bkVSMzdHUEJtYWh2aFNk?=
 =?utf-8?B?QVJOdHNra2lFUkFHWnlxTmZ0YkJkUVR6Sm5XSzcxNks4K2J2cEtDTTZGS3Jx?=
 =?utf-8?B?SFgzWXZsdjIrd0tPaW9OY3kwSUVWY3hVU1A4Sm1TNGZOVWtVN1ZySVdoZ25S?=
 =?utf-8?B?TllyVGFVSHNuazFRVVhzTFFZY2M5dWRhSkkvY2FRREFkSkdsbktIMTJwbHFp?=
 =?utf-8?B?K1QzZkIyeWsrVEE3dkFuUjIzcjhSa281T0NDUGkzcEtCZE1sYm5EQlNHV3Z5?=
 =?utf-8?B?UXZLUWxyWndBTFRUanlWcndWUVo2dDVOSThYNnc3S09Tc1NMbnpBdktWVEpG?=
 =?utf-8?B?U0ZXcW5TN0p4VVIzemhDanlxdElhVTAzWmN1QUtKTGZnKzI3RndCYmpPdWh2?=
 =?utf-8?B?b0Mxb25RQUExRlk5MHNzTHhNcTNJbHlhQktxYk9PaEpZcVVWTEtBYmxSR0tw?=
 =?utf-8?B?ZTdkRStEekNBTHhJajgzVFkxUnl5ckpvZGtndGx5V0xYdzFjQm1uUWVWbHdG?=
 =?utf-8?B?TkRoREsxdkViZHdmTDhFVnNSQ0ZuQTNpb3pMT3YxeGpaY3ZhV2daWGxHd0sv?=
 =?utf-8?B?YmhkMUtvalVyZ0wzUDRuN2gwY1E1Uk1vSDdzZTFlYlJVK2RGVjRLSjRoQVRq?=
 =?utf-8?B?SG5iQmRoemZpTElJUWJuRmtScVdrOXlISDlYZGdTSlhFeXlRS2VtZnVld0Qx?=
 =?utf-8?B?dnBTMVIwRkhUTXdVSGRYSXZMR3k4c3BqcG9qdUFTQk14VzVKdFlUNnphbTJw?=
 =?utf-8?B?a2VFcmFIbjVVdy81MTZvZnZnYnEwZy8zc05YWnVJUlkzNTg3MmNLK0JrZE1R?=
 =?utf-8?B?aDhMV3pBSnUrY0ZzZkxsV3NwaU1ENlk0Snl0TEJqWjhuNTlBckdOOWhPZjRQ?=
 =?utf-8?B?aVZ0UGZ3NlQrZVg1L09FQzFBaGR6QzFvK0Nxd2p1NkxuUzVqdDlkVnJ4VEx0?=
 =?utf-8?B?V1FBRWZSMzN2Tml4cGhTeTcwMTBmQ3E5Zks3YWNZRUV4dlNRS1hCRHhEOGlP?=
 =?utf-8?B?R0FDN3NzcmNLRjlrbG5iZVlqR2pGQnhGWmMwMmh1QzA2ZlpHeC9KSEdHd0lo?=
 =?utf-8?B?T0hGbHpWeGd6c29WeHk2U3NpMHROL3RnRXdLam9nSFcvaWFTNnZZTGhseC9J?=
 =?utf-8?B?bXRGbXRqdVJUMDZObkt1UHhJM0taZk1sZmlOVjlzTmR1dHZ6OFd4MXlRSGlN?=
 =?utf-8?B?RERJbXA5dG8vTkwxNm1ySTBJME9qQ1dNN1pnUnZNWklKNXljWVBMRUVzdGQ0?=
 =?utf-8?B?UWdHVEs4OGxCTDZjVENsQWZPcWI3SHNSZEVEZVVubDFRVnlTb2VLbXQ3WkVJ?=
 =?utf-8?B?Q0plZDZNSzc0MzArZExQd0JsM0ZjUW1oeU14RTJHcHQ4NmZSTkE1WlNDSGE2?=
 =?utf-8?B?bkZ0eml1R0hWeHRVL09TdVcrN0VFNGhxMXYzSFBiQ3pSTU43WjJZU3FHTHBo?=
 =?utf-8?B?Y0V1My9EdFJpM20wN005VjBYYWhjd2N0QWcwVVBjWnlKSzlINzd4NHNFd3Rl?=
 =?utf-8?B?Ym1Nb05iUzBRVTd5MDlIMmZpUENYMG9abFVYcFdjOXZ4VFBKSUFQOHgza1ZV?=
 =?utf-8?B?VTEyNjVGQlFFeGJxZmNOcG9CaWVzVmlzVUdHMkFUOUxHTW90UkdBaWoyNmIv?=
 =?utf-8?B?bUN2Qnpoblo1dlVUVmtFekF5RGgxTVN1bjZGSjBhSXJhb1dDU0I4dDhpdms5?=
 =?utf-8?Q?WV8U1cSSDw8/3LP4SqVQa4j7Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765f2317-e498-4090-2cb5-08dda2a70205
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:00:33.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nog53k5gceN9xV+dh5cEwvMqSHljf9I1BAdIWR2PDoabEOGOcRBe3tnHI6ywcrSP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6073
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

On 6/3/25 14:48, Tvrtko Ursulin wrote:
> 
> On 03/06/2025 13:40, Christian König wrote:
>> On 6/3/25 13:30, Tvrtko Ursulin wrote:
>>>
>>> On 02/06/2025 19:00, Christian König wrote:
>>>> On 6/2/25 17:25, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 02/06/2025 15:42, Christian König wrote:
>>>>>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 15/05/2025 14:15, Christian König wrote:
>>>>>>>> Hey drm-misc maintainers,
>>>>>>>>
>>>>>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>>>>>
>>>>>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>>>>>
>>>>>>> Looks like the backmerge is still pending?
>>>>>>
>>>>>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>>>>>
>>>>>>> In the meantime, Christian, any chance you will have some bandwith to think about the tail end of the series? Specifically patch 6 and how that is used onward.
>>>>>>
>>>>>> Well the RCU grace period is quite a nifty hack. I wanted to go over it again after merging the first patches from this series.
>>>>>>
>>>>>> In general looks like a good idea to me, I just don't like that we explicitely need to expose dma_fence_access_begin() and dma_fence_access_end().
>>>>>>
>>>>>> Especially we can't do that while calling fence->ops->release.
>>>>>
>>>>> Hm why not? You think something will take offence of the rcu_read_lock()?
>>>>
>>>> Yes, especially it is perfectly legitimate to call synchronize_rcu() or lock semaphores/mutexes from that callback.
>>>>
>>>> Either keep the RCU critical section only for the trace or even better come up with some different approach, e.g. copying the string under the RCU lock or something like that.
>>>
>>> Hmm but the kerneldoc explicity says callback can be called from irq context:
>>>
>>>      /**
>>>       * @release:
>>>       *
>>>       * Called on destruction of fence to release additional resources.
>>>       * Can be called from irq context.  This callback is optional. If it is
>>>       * NULL, then dma_fence_free() is instead called as the default
>>>       * implementation.
>>>       */
>>>      void (*release)(struct dma_fence *fence);
>>
>> Ah, right. I mixed that up with the dma-buf object.
>>
>> Yeah in that case that is probably harmless. We delegate the final free to a work item if necessary anyway.
>>
>> But I would still like to avoid having the RCU cover the release as well. Or why is there any reason why we would explicitely want to do this?
> 
> I can't remember there was a particular reason. Obviously the driver/timeline name vfunc access I needed a dma_fence_access_begin/end() block so maybe I was just sloppy and put the end at the end of the function instead of at the end of the block which can dereference them.

Yeah that's the next topic I would rather like to improve. We are kind of hiding that the returned strings are using RCU protection.

In other words it would be nicer if we could add an __rcu tag to the get_driver_name/get_timeline_name callbacks and let the automated tools complain if somebody isn't doing the proper RCU handling.

The problem is that as far as I know that is not supported by the automated tools (would be cool if somebody could double check that).

+We would need to convert the get_timeline/get_timeline_name function to something like func(struct dma_fence *fence, const char __rcu **out) to make that work.

Regards,
Christian.

> 
> I will pull it earlier for the next respin, assuming no gotchas get discovered in the process.
> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>>> On 5/15/25 11:49, Tvrtko Ursulin wrote:
>>>>>>>>> With the goal of reducing the need for drivers to touch (and dereference)
>>>>>>>>> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
>>>>>>>>> the fence->flags.
>>>>>>>>>
>>>>>>>>> Drivers which were setting this flag are changed to use new
>>>>>>>>> dma_fence_init64() instead of dma_fence_init().
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>      * Streamlined init and added kerneldoc.
>>>>>>>>>      * Rebase for amdgpu userq which landed since.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>>>>>>>>> ---
>>>>>>>>>      drivers/dma-buf/dma-fence-chain.c             |  5 +-
>>>>>>>>>      drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>>>>>>>>>      .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>>>>>>>>>      .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>>>>>>>>>      include/linux/dma-fence.h                     | 14 ++--
>>>>>>>>>      6 files changed, 64 insertions(+), 41 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>>>>>> index 90424f23fd73..a8a90acf4f34 100644
>>>>>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>>>>>> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>>>>>>>>      }
>>>>>>>>>        const struct dma_fence_ops dma_fence_chain_ops = {
>>>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>>>          .get_driver_name = dma_fence_chain_get_driver_name,
>>>>>>>>>          .get_timeline_name = dma_fence_chain_get_timeline_name,
>>>>>>>>>          .enable_signaling = dma_fence_chain_enable_signaling,
>>>>>>>>> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>>>>>>>>                  seqno = max(prev->seqno, seqno);
>>>>>>>>>          }
>>>>>>>>>      -    dma_fence_init(&chain->base, &dma_fence_chain_ops,
>>>>>>>>> -               &chain->lock, context, seqno);
>>>>>>>>> +    dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>>>>>>>> +             context, seqno);
>>>>>>>>>            /*
>>>>>>>>>           * Chaining dma_fence_chain container together is only allowed through
>>>>>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>>>>>> index f0cdd3e99d36..705b59787731 100644
>>>>>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>>>>>> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>>>>>>>>      }
>>>>>>>>>      EXPORT_SYMBOL(dma_fence_describe);
>>>>>>>>>      -/**
>>>>>>>>> - * dma_fence_init - Initialize a custom fence.
>>>>>>>>> - * @fence: the fence to initialize
>>>>>>>>> - * @ops: the dma_fence_ops for operations on this fence
>>>>>>>>> - * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>>>> - * @context: the execution context this fence is run on
>>>>>>>>> - * @seqno: a linear increasing sequence number for this context
>>>>>>>>> - *
>>>>>>>>> - * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>>>> - * refcount after committing with this fence, but it will need to hold a
>>>>>>>>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>>>> - *
>>>>>>>>> - * context and seqno are used for easy comparison between fences, allowing
>>>>>>>>> - * to check which fence is later by simply using dma_fence_later().
>>>>>>>>> - */
>>>>>>>>> -void
>>>>>>>>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>> -           spinlock_t *lock, u64 context, u64 seqno)
>>>>>>>>> +static void
>>>>>>>>> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>> +             spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>>>>>>>>>      {
>>>>>>>>>          BUG_ON(!lock);
>>>>>>>>>          BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>>>>>>>> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>>          fence->lock = lock;
>>>>>>>>>          fence->context = context;
>>>>>>>>>          fence->seqno = seqno;
>>>>>>>>> -    fence->flags = 0UL;
>>>>>>>>> +    fence->flags = flags;
>>>>>>>>>          fence->error = 0;
>>>>>>>>>            trace_dma_fence_init(fence);
>>>>>>>>>      }
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * dma_fence_init - Initialize a custom fence.
>>>>>>>>> + * @fence: the fence to initialize
>>>>>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>>>> + * @context: the execution context this fence is run on
>>>>>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>>>>>> + *
>>>>>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>>>> + *
>>>>>>>>> + * context and seqno are used for easy comparison between fences, allowing
>>>>>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>>>>>> + */
>>>>>>>>> +void
>>>>>>>>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>> +           spinlock_t *lock, u64 context, u64 seqno)
>>>>>>>>> +{
>>>>>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno, 0UL);
>>>>>>>>> +}
>>>>>>>>>      EXPORT_SYMBOL(dma_fence_init);
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>>>>>>>>> + * @fence: the fence to initialize
>>>>>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>>>>>> + * @context: the execution context this fence is run on
>>>>>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>>>>>> + *
>>>>>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>>>>>> + *
>>>>>>>>> + * Context and seqno are used for easy comparison between fences, allowing
>>>>>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>>>>>> + */
>>>>>>>>> +void
>>>>>>>>> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>> +         spinlock_t *lock, u64 context, u64 seqno)
>>>>>>>>> +{
>>>>>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno,
>>>>>>>>> +             BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>>>>>>>>> +}
>>>>>>>>> +EXPORT_SYMBOL(dma_fence_init64);
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>>>> index 1a7469543db5..79713421bffe 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>>>>>> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>>>>>>>>>      }
>>>>>>>>>        static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
>>>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>>>          .get_driver_name = amdgpu_eviction_fence_get_driver_name,
>>>>>>>>>          .get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>>>>>>>>>          .enable_signaling = amdgpu_eviction_fence_enable_signaling,
>>>>>>>>> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>>>>>>>>>          ev_fence->evf_mgr = evf_mgr;
>>>>>>>>>          get_task_comm(ev_fence->timeline_name, current);
>>>>>>>>>          spin_lock_init(&ev_fence->lock);
>>>>>>>>> -    dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>>>>>> -               &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>>>>>> -               atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>>>>>> +    dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>>>>>> +             &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>>>>>> +             atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>>>>>>          return ev_fence;
>>>>>>>>>      }
>>>>>>>>>      diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>>>> index 029cb24c28b3..5e92d00a591f 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>>>>>> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>>>>>>>>          fence = &userq_fence->base;
>>>>>>>>>          userq_fence->fence_drv = fence_drv;
>>>>>>>>>      -    dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>>>>>> -               fence_drv->context, seq);
>>>>>>>>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>>>>>> +             fence_drv->context, seq);
>>>>>>>>>            amdgpu_userq_fence_driver_get(fence_drv);
>>>>>>>>>          dma_fence_get(fence);
>>>>>>>>> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>>>>>>>>>      }
>>>>>>>>>        static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>>>          .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>>>>>>>>          .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>>>>>>>>          .signaled = amdgpu_userq_fence_signaled,
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>>>> index 51cddfa3f1e8..5d26797356a3 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>>>>>> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>>>>>>>>>      }
>>>>>>>>>        static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
>>>>>>>>> -    .use_64bit_seqno = true,
>>>>>>>>>          .get_driver_name = amdgpu_tlb_fence_get_driver_name,
>>>>>>>>>          .get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>>>>>>>>>      };
>>>>>>>>> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>>>>>>>>>          INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>>>>>>>>>          spin_lock_init(&f->lock);
>>>>>>>>>      -    dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>>>>>> -               vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>>>>>> +    dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>>>>>> +             vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>>>>>>            /* TODO: We probably need a separate wq here */
>>>>>>>>>          dma_fence_get(&f->base);
>>>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>>>> index 48b5202c531d..a34a0dcdc446 100644
>>>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>>>> @@ -97,6 +97,7 @@ struct dma_fence {
>>>>>>>>>      };
>>>>>>>>>        enum dma_fence_flag_bits {
>>>>>>>>> +    DMA_FENCE_FLAG_SEQNO64_BIT,
>>>>>>>>>          DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>>>>>          DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>>>>>>          DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>>>>>>> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>>>>>>>>>       *
>>>>>>>>>       */
>>>>>>>>>      struct dma_fence_ops {
>>>>>>>>> -    /**
>>>>>>>>> -     * @use_64bit_seqno:
>>>>>>>>> -     *
>>>>>>>>> -     * True if this dma_fence implementation uses 64bit seqno, false
>>>>>>>>> -     * otherwise.
>>>>>>>>> -     */
>>>>>>>>> -    bool use_64bit_seqno;
>>>>>>>>> -
>>>>>>>>>          /**
>>>>>>>>>           * @get_driver_name:
>>>>>>>>>           *
>>>>>>>>> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>>>>>>>>>      void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>>                  spinlock_t *lock, u64 context, u64 seqno);
>>>>>>>>>      +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>>>>> +              spinlock_t *lock, u64 context, u64 seqno);
>>>>>>>>> +
>>>>>>>>>      void dma_fence_release(struct kref *kref);
>>>>>>>>>      void dma_fence_free(struct dma_fence *fence);
>>>>>>>>>      void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>>>>>>>> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>>>>>>>>           * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>>>>>>>>           * do so.
>>>>>>>>>           */
>>>>>>>>> -    if (fence->ops->use_64bit_seqno)
>>>>>>>>> +    if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>>>>>>>>              return f1 > f2;
>>>>>>>>>            return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

