Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC36B2AD02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E24510E48B;
	Mon, 18 Aug 2025 15:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4OLnLZ1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F4410E488;
 Mon, 18 Aug 2025 15:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogR7VVF3PWLN0iK0SxYxBB4pYk2BonYpGiIstyEu78oTVmIedRG9LasPJZQEIh44/AXUe8sagamOwiO9ucg+xtceU33X+0SukvovSW/nNCvT0D13lEXzu8CbDlO4oCkONCJbkJIFq19kWhVF14xOY9+4FWR/puzwn+mcI5Doj+2Zfo22wRedx8P1EZ6pIxX4b3WMIl/h0CMz/66MFZK4HasMzt5Y2M3s5RdVAin/e8RBzlNFBFq3PJFzNCQ372reqKlDge1TJ1P3fRQjYgRWiUh9lPeLxs/Ng8TehWfwkYyBSIAnm0/V5xE6JtVT+HOp0jWv26AqSF//4pGcCFCYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG/dCZ54MUYhEKd4/WOpD4onsaBHG329usUpaRg66jM=;
 b=ClFb2oa717DZ05hHdWi0LHhmLjw0aarpVXaq/tDFlc/QVB5Ax9PLrEKuvddNJwx5wKV6pA14JZvSZGb83aWJ/oqXcfGkgiMPbrVOZnmU/p4xDMp6+K5i/hA5aQ5YLitnnibkPkzkDcN+7BvoniWN8nUbCpL+VKXyExQGCMGcV7Jzmi5hkfhRYVJXVMJVTOx5BZzAykaNtLtbZvcmMAJkoXfiHWLRdOsx1a1ZTMExOlfSGNlpjykBZQ5JGuMYTSR3rwFeCx1FFjCug+Q23rKX+WVcf39Hik2ghBJys2ODN8rR87WC5va88FzEEfdF9mNZDgOwzjcsORKk9xL/cX+Jkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG/dCZ54MUYhEKd4/WOpD4onsaBHG329usUpaRg66jM=;
 b=4OLnLZ1GaLP9MV5E4zu9wtwCsKL8gP4bR11a+14geLtvP6sWexeR7YG8I0LkN0WIGmAXGkC+MQ2k3UA51fNwRFvc0iFu8I+e6TaPK3z/TP08mwXi6v3QeJi5iMksYhQb6ggGBqI4cjakOluTFPfaRdOBtRhgH5o//HS29E3pxQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6328.namprd12.prod.outlook.com (2603:10b6:8:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 18 Aug
 2025 15:43:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 15:43:05 +0000
Message-ID: <f31550b1-b89c-47d6-b012-99479ba12aeb@amd.com>
Date: Mon, 18 Aug 2025 17:43:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Pin buffers while vmap'ing exported
 dma-buf objects
To: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250818151710.284982-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250818151710.284982-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ab80a1-c43f-46dd-da36-08ddde6dec36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGhEdFlCQi90QUp4a0doTFFpck8wU1RHU0hKeUlvWkhmK2o0aXl6bmZPQzVz?=
 =?utf-8?B?SHJ0OW1GdEgxVXRnYytIb21xRml3MVlNS0tINkdGM2tFdnlBbGVKUFU4eUxJ?=
 =?utf-8?B?Mk1NKzc0dGxuVUI5dlVJL1NXQUZ5SVFTa3RjdmpZcFpXZnlxcVNEZnVZVVBJ?=
 =?utf-8?B?dExBMDBuQlJiN0R3UEN3aTNISndOS0lYMjdGOXo0OW1yTThlZ1hzVzhVUVFK?=
 =?utf-8?B?NnZNLzBtbS9VUWlWR1ZLejAvY2NtWURDOWlVVWN1T040cnpERnJxNTFKMkJC?=
 =?utf-8?B?a0hxakozeGMrOUdZSjZpRnVFSDN3VEkrRVRuT0piYXdXcmVJcVJDU21RVmc0?=
 =?utf-8?B?Q1krVE1pbzNnYUo4ZUF5TlhPcmtNY0pjYmVQbUpsS3FvNmxleWJSY21YTngx?=
 =?utf-8?B?MDF3Wlp3V01BOWovQmZlc3c1NExOMzdNK1JHTFhUVkoyMDBteFF0anR3R2Jh?=
 =?utf-8?B?OGo3Y2FiZC9QUHZnVkJNQ1hVQ3RrWmZmeWZ5Q09ycUtHZXI3VDdmRVVSQXlR?=
 =?utf-8?B?Vk1NRnczd1ljYThSZjJmVFFrQmNUTjBWK2NOTzdTSnBIWm5DODdWTUhnWVkz?=
 =?utf-8?B?RGRUNllmQUZiRFA1WHpXMTNaMGVTc1VIc01Ha0xnSmpaYzJFekg3UG9YNlRQ?=
 =?utf-8?B?WklLZkNrZGtnZDdncFpTODBkS3RvdCtHTG5MSWhxWUlQZzBIT1oyRmpEQlRj?=
 =?utf-8?B?alpWbnNNL0lXU1VmcDZJa2tDM0ZOdk00TnZSRlh3bW51Vk1IWllTcjNJdE9w?=
 =?utf-8?B?KytXQXlETFBTTkxCY0N3UmZYV3pRY0hhQWdNSjRVeTdxL005S3JGYTB6aXZM?=
 =?utf-8?B?SjdURTRMdFp0TjMvQU5lQUF5dGkvdGxKNTNMUzdUZm0zYzI4WE1hVWN3T0Rn?=
 =?utf-8?B?T2ZqUkYyK0VsQ0czVzBlcHdIckxrcmxGL3ZLcDlvV0drcWYwb0pCQWhpYkpq?=
 =?utf-8?B?Q3dhR3ZaSk44d0hVOG1HT3YzRFg4KzJSZTUzWUxoeWJrelNIQVRTTzYwYjJF?=
 =?utf-8?B?RUlNMU5QWTlpaDVVOFdBVjdibjRjbHI0M1dvQVRjTHhqNzM4TUppS0hZeGt2?=
 =?utf-8?B?WFc4S0RrcXdlTUZsbXpLYlBBSllNZFlYSmJUTFdzNFM1bi90dEV6aWl3clFj?=
 =?utf-8?B?clVFdzZIaHRMM3gzUC9xQ1hKNGJCa0VjT3k2Slh5UmVqMDhnYlJNNHFhT1Ny?=
 =?utf-8?B?Y2FQbHk3azhDQXV0Q3lWcmJTYmFKaStzMGFhVDBXRzlFaTR4MmFsOHFXSWxH?=
 =?utf-8?B?dEZjT1E2OXliK2RWdkNXbzR5QXRpZGJFV2JkNWhPaTE0ZDVCck9McGZ4MmdR?=
 =?utf-8?B?OUhKWnMrQU9lbnNuakFGc0o0SmI2V1JXMVN5aUROcjhFNGVxTzhkTkloNjlj?=
 =?utf-8?B?dm5rbytNa3ZMbkRDdGZOUWtLM1NNVjdmeXZDci8rVHpjSHVocDJITDJDc1BO?=
 =?utf-8?B?K0NsY1ZsekFqbGpUMGdSaDYyVUpYM3E3d294M2hRYXpKdHJ0MUkwNUhnRkg1?=
 =?utf-8?B?ZmliMWUyU1ZxUVo2bmZHWVd2UEVveHNFa0FLOWJGUE5GQzNQcmdIb2JaN2ZO?=
 =?utf-8?B?QzR6ekFIWUd6eXpsdmZUTmVYWVhNaFdpM0ZkV3dRZlQxdHlFbXIwT0VsWWFI?=
 =?utf-8?B?cGQ2QVU1eW1Icys5SUpkL1E0Y3NUWkppOTNhWk1XWFFaMnZHcTBOdnExOWZ5?=
 =?utf-8?B?YldtZi91ZUQxN1RFQ0g5bkxFR3Q3OFlWNFJWNU9zMU1pK0p0QysvYWRrd3VU?=
 =?utf-8?B?cU5FN1BmbEZMQ1U3c2pVYmZQbHhXdE5USE9wRndsM1hMbzVTbGRNQVZXd1Rk?=
 =?utf-8?B?d2hIRnY0WU9ldTFPeXBEOWZQL3JDQktMdDlWbnp6L3FUalg5eHJqRVd0aGZv?=
 =?utf-8?Q?6ANwi9j+EpRRy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlBXVU9jKzNPdjZkMndMT2w5bzhkT2xNZldIbFBnbGQrdkllbW9kMkhDYStx?=
 =?utf-8?B?ZTR1bVBzUTh0SEUvUUhRMStrMlV1K2E4a0J5NUJrd3FxRVBwdWRVWWozRmFB?=
 =?utf-8?B?MEdmZ2FxNWpLNGFmN3dxU05ETGlpcEI1UkEvQzV5UG5NOW8wcDFDcG5NcVVj?=
 =?utf-8?B?clNJdDRCNVUrQlZiZEdUSFlGS0tSRk5oYUg1clMzdXFnQkRoVEpiTWhPSDRJ?=
 =?utf-8?B?OVlocjQ2QjFBSzMwZ1h1a0FPRW52OXlEdUVPVHRRYy9MMWFxdVlOTUlLdU9t?=
 =?utf-8?B?WUt1bjJ5c2tOZ1QvaFJVZEgzWVEzenFJMGMrOHYyRklxUGNKeEI3YXZpYXRB?=
 =?utf-8?B?d2FGRHlOcGtpVmU4N1FFaDN6K3B1Y1ZiaUxONGlORXNRRGs1OHZoYkhLeDRX?=
 =?utf-8?B?YWdlbkxVKysraHV6QnoyS3hrdCs3YlBVcjlPZGNBRHdNNm1NZlM5VEdRN2gz?=
 =?utf-8?B?dlNnbCtHMTlCM1l5RUZDTnVUaXVFLzI0aTBFN1EwZ1VHdnpaMDVzRS9kVXVK?=
 =?utf-8?B?L1QySHJHQ1JUbEVGckh3aWxLZHErVVBjVHdBOTM2OFpYdFF6UlhkUHQyMjRo?=
 =?utf-8?B?VTYzalh3RWtFS3E3UWdJekk5S0RhSk9IMFVjTmJMV1N1QVBHTm81THp6RDlX?=
 =?utf-8?B?T09BSU55Zi9zZTBxcWFmM1d3VFhyWUlzTlk5K3p6RGVwMjhmNXdNNjQvWEtN?=
 =?utf-8?B?WkJqOWlUY1Z4QndTdUtWMWlabzIzbysyNGxaOFZ6b2plMDE3NDV6WStoenIz?=
 =?utf-8?B?MklqK3Uyd3Z6WlBjM2hNYVY4dlJ0OWNqWVRmano5L0UvSUY2ZFNKSmFQdEVX?=
 =?utf-8?B?TktMYXRnSzY4aklOM0l0VWlGQ0dhMjVuY21wTW5RQStCajlOaEFkeHZDSWdi?=
 =?utf-8?B?a3czNElubDdSTGpFNnU5OTErMG8vYWZwbjloMEx3blIzN25zTE54aHlRbUxl?=
 =?utf-8?B?VFp1eis2SFRrZDJkQVNXQUs1dXVKeXJOTytMM2FlOUVmcjNRdEcweVNrTU50?=
 =?utf-8?B?ZEdpUzczMGFTYmZxell6S1pEbTBCS1BOZkVXUG5HNG9sS01pekJYUnczSCtl?=
 =?utf-8?B?aE1pNDFqMytZbjRieWtWK2dQcW00VjlxUlJ6YURhcXRWZXpRQzlibVh3aVBQ?=
 =?utf-8?B?THMzR21NS3NkeWtYazU1cDZqOTdpOTdoSHI3V3JSWkJlc2VpbC9leCtFdFFU?=
 =?utf-8?B?c0RJMDJ2YUhFdklUV2Npd2V4YTRITTZsNDZ6RTVrcTQweUMxWGd1bndlS21F?=
 =?utf-8?B?RlJndDFFcVNlTit4aVhPRnRrRWdud2FMNkx4MThjbFZFVXFmNTdXTXRkb3NF?=
 =?utf-8?B?aWRMYjUvV242RzNOTGthT2VJd3lvQkFpVjhFQitKOHZQNVZ3MHk5YjZEQzNO?=
 =?utf-8?B?M25LWlZQcmx2aVBxQWt0WDFRejJ5dUhNbHBibE1TTnlVdkZHWUxKdlBNVDVn?=
 =?utf-8?B?dGozSXREM2tuakJMZGprbk1UUHJ5a1lBSWkreklkRTlFd3FjdzdDc3hrZ3NK?=
 =?utf-8?B?VnRHejZsVVBDTm80TS9mUGp3VnVEWmFybktVSGdEaEtUc3N0Vld1SGh0VjRP?=
 =?utf-8?B?SmtPa0Naalpma3kwVHBIT3hoclErWmhPN1V3VmhkSWhCZ1l2WTVWMGNKdmJn?=
 =?utf-8?B?TFlEeFpyMmlSYnBpYUNXK3RGSjdLYjZDUXo4a1FQVTZtR21HVVRhR1QwTy9W?=
 =?utf-8?B?WHhoSXFEM2s1OUJIM3VPMFdPNE40TkpNWERucFN0OVpkU004YXd1S0hCK1gv?=
 =?utf-8?B?dXh0WnVWUUF3b1RLbktpVDZKRzRaa2Q4TklETnlMeWZkMSt1bzBNbkZibWFv?=
 =?utf-8?B?Y01yRDJlZVZ1Rk9pTG8vMElROXlVeVhDQ3NtY2dHbUxyWlVVTTAwQ2NXKzlL?=
 =?utf-8?B?cnVzUk9ZejhvbW5sbmJMdFRkNVp4NmVaTEZSYnVwSjNWYjZVcno2b1BuN1FM?=
 =?utf-8?B?T1pXcVBUUFRwZXFMMHVvR25URi9KMHg2RWZYVG9tUGNNMnN5bEdVR2RTNmxu?=
 =?utf-8?B?ZEQyRTdaNGFkaG5XRG5HY3k0TGV3WllsYXJjYzliV0laZGhTV0NPTkgvQ0N4?=
 =?utf-8?B?RVpQaHkvQ2JVN09oRkp4TUNyNnpOdUdOLytYWXprQ0Z5OWxkR3kvOXFDOXB2?=
 =?utf-8?Q?/5KG1vWvXP4ZdNEkg1HPzsRxZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ab80a1-c43f-46dd-da36-08ddde6dec36
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:43:05.4474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Znyht2nrhWYP2fChyhX0iXyptAxXznqP4nB26aQ+onVnYmfG6ZL2KuPAMv2tZBpc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6328
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

On 18.08.25 17:17, Thomas Zimmermann wrote:
> Current dma-buf vmap semantics require that the mapped buffer remains
> in place until the corresponding vunmap has completed.
> 
> For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
> an S/G table in import. GEM-SHMEN can now import dma-buf objects without
> creating the S/G table, so the pin is missing. Leads to page-fault errors,
> such as the one shown below.
> 
> [  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
> [...]
> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> [...]
> [  102.243250] Call Trace:
> [  102.245695]  <TASK>
> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> [  102.251805]  ? __lock_acquire+0x568/0xae0
> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> [  102.265379]  ? local_clock_noinstr+0xb/0x100
> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> [  102.274246]  ? mark_held_locks+0x40/0x70
> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> [  102.333622]  commit_tail+0x204/0x330
> [...]
> [  102.529946] ---[ end trace 0000000000000000 ]---
> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> 
> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
> mapping.
> 
> Provide a custom dma-buf vmap method in amdgpu that pins the object before
> mapping it's buffer's pages into kernel address space. Do the opposite in
> vunmap.
> 
> Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
> While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
> instead of its GEM code.
> 
> A discussion of various approaches to solving the problem is available
> at [1].
> 
> v2:
> - only use mapable domains (Christian)
> - try pinning to domains in prefered order
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 41 ++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 5743ebb2f1b7..471b41bd3e29 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -285,6 +285,43 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return ret;
>  }
>  
> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	int ret;
> +
> +	/*
> +	 * Pin to keep buffer in place while it's vmap'ed. The actual
> +	 * domain is not that important as long as it's mapable. Using
> +	 * GTT should be compatible with most use cases. VRAM and CPU
> +	 * are the fallbacks if the buffer has already been pinned there.
> +	 */
> +	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
> +	if (ret) {
> +		ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_VRAM);

That makes even less sense :)

The values are a mask, try this:

ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMAIN_VRAM);

Otherwise the pin code will try to move the buffer around to satisfy the contrain you given.

And don't use the CPU domain here, this will otherwise potentially block submission later on.

Regards,
Christian.

> +		if (ret) {
> +			ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_CPU);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +	ret = drm_gem_dmabuf_vmap(dma_buf, map);
> +	if (ret)
> +		amdgpu_bo_unpin(bo);
> +
> +	return ret;
> +}
> +
> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +
> +	drm_gem_dmabuf_vunmap(dma_buf, map);
> +	amdgpu_bo_unpin(bo);
> +}
> +
>  const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.attach = amdgpu_dma_buf_attach,
>  	.pin = amdgpu_dma_buf_pin,
> @@ -294,8 +331,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.release = drm_gem_dmabuf_release,
>  	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
> -	.vmap = drm_gem_dmabuf_vmap,
> -	.vunmap = drm_gem_dmabuf_vunmap,
> +	.vmap = amdgpu_dma_buf_vmap,
> +	.vunmap = amdgpu_dma_buf_vunmap,
>  };
>  
>  /**

