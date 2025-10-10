Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA6FBCCE3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 14:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3B710EBD4;
	Fri, 10 Oct 2025 12:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HOTC0rJ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C910EBC6;
 Fri, 10 Oct 2025 12:28:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmrCtlYzlV6Ncw48kHxgJ+9gwPj3nXbGIGwLR9nz+Rc7L2Ptmhy9PaIRv0XuAxYkElajow+85in+T9zsuJ751HShvskmKOnAZnJk7pu0ccpm8DM5pXMGjJUinn26smF+a+LxzmeYVfN1zqIrAxq51vHKpEc6EXiJ2RPCHq7Zkq7w2Z0cM70HPTDhQe+TWi4ci5WNaTausfmjTn3OWxk0MK9+K23m8JIJgG2sSy3mNQEQHBoik6pLwoamrFnwZzieXo9OYbEsJHjajnBdF2OF8iCg3rlatr4yoONRsxQ6Iyjq3OzijkmgGJ/6b/e9Fek4XALISpDPIDmBN8Nx+fbB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kp1UNJNakX+dMorEgtu5kRkYHwvRld7qJk3rxiimnfE=;
 b=l+I400Cm+KI0j+zfxxnVG2eXrLyXoy9Mni5SlO2uzIB++JvIQdAZr4B/bzmlUNk75+yib6MlPk3t4BWliXW1SnZLrATd68n2tJ5ju4vv26zkwwyvcIrYx62VeFI+fbMh5jQ1C4TosctTW6l7XsQR6TOLcO2/gBgFhDe6QFQpJx2iXNqHPBqQbK4OLXDXbVZxBjvG8BZl0JFGwtCM/1Y16yibNZ+IMHXaZo9oFB+cgq7v7VDRZQaoNJgVwZeRs3MiWtwIwqNE7F2kAbcjMwJczfSbKl2akoZ6zmZdsuWHbVuMgMBWK7ZIouxIBeIeCTWERUcPQ/3MOwFijy+IswHCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp1UNJNakX+dMorEgtu5kRkYHwvRld7qJk3rxiimnfE=;
 b=HOTC0rJ1mkfiNXS3zcL94xavjAAftCBFBH9UQQ9pptwKBwIJJiZFMTBvKikE/auwsac0/CozPzoeUXH4DXVkPw0hyzC3zOuy2/RLgw1nQuqFi98IHb2M99+91AYDtDlxEg09qw9qY5J6OkFx15U7aipIpeGBA9ZQYbY6ajeOuhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8097.namprd12.prod.outlook.com (2603:10b6:510:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 12:28:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 12:28:17 +0000
Message-ID: <4cc2b216-e778-4b4e-bd13-01af0ded5427@amd.com>
Date: Fri, 10 Oct 2025 14:28:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Avoid killing entity last used by parent on
 child SIGKILL
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: David Rosca <david.rosca@amd.com>, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20251002150524.7552-3-david.rosca@amd.com>
 <d67cbd3a-5cd8-43b8-badf-3f264885429d@amd.com>
 <14de5473-534c-4294-bb1d-41d1a43fb46d@amd.com>
Content-Language: en-US
In-Reply-To: <14de5473-534c-4294-bb1d-41d1a43fb46d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:408:e9::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6be4d5-ded6-4e36-f1e8-08de07f87d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkI1YVQycUIvZzBRVUZWQXRCOVJEMzk5NjVVWERwMDh5TVU1S0R5RWtSWm1C?=
 =?utf-8?B?MjZTQyt4NHZtbVhOcFhzQ0Zwb3ZvN29ScytyYkhpakdNRkphQml4clBZODh5?=
 =?utf-8?B?Q1Rvcmg5UktZWDRZOWRoOHoxRjNnU09jbnVDSEZBcmVGVzJIV0l5UkRoL2Ni?=
 =?utf-8?B?emlYR3B5cE1mR1lUVGNraVdWSHFaQU9RZERNOStoaEw3Q2J5RXpTNlFHZEhJ?=
 =?utf-8?B?d09MT0Y4WDNWcm5MTmM1WDhlNkVpUEdqcjZyZ2JXMEhTMUJGVWRnbUZ1ZHM5?=
 =?utf-8?B?R0pvMU5JelFBTks5RmhkYTlzOUJTek5TOEFudmxuZjJQK3EyYjJ0b2tKYzd6?=
 =?utf-8?B?MWVlWHJ0anh5NVZ2d1V6RHdONnEyYm5xbzVrNTZZWS9KK3c0b29pZkJ3Q2x5?=
 =?utf-8?B?ei9EMlRSVzB4ZGZYWE94a1ZKaVpzMFo0dGc3YVJtK2FoU21wcFNibnZUU2J0?=
 =?utf-8?B?bW1NVjI0QjJqM1ZGVmhDaWNFdmZQanBhWWMvUGorS2FJdnVEbXVNbG80a0Nm?=
 =?utf-8?B?SHEzRkNzdUp3OFJyNHRqaVZXVlk2QkdWakpWTHZ5RFpuMTVUWG1NRkhKSmRy?=
 =?utf-8?B?RkgvWmdXeHd1NEIwbDNJM1Y1RVdyYmhZNHhMdGJNT2Rtenl5SFZYbWJsZTBT?=
 =?utf-8?B?WUNJVHV5M2pRZ3dlQ1VFUHE1NVlFOGRWLzFNbmNYTDdvSXcrUTFib2IyZzZN?=
 =?utf-8?B?ZjV4d29jem1Vc0ZxVnVGNHFzeGlJbHg4NTQ4RDBDWG5FbGxWTGswcUtiK2J1?=
 =?utf-8?B?d2NDVVFLVW1zNFhZRmNxMGxZNlRodkc3ZDE3dDM4dVVNSXczeTczWGJiMjhu?=
 =?utf-8?B?Nm1NV1VVYXF2YWliYVQ1bWpLb0tSdkZMSDg5aFZiL2ZXTzA0ZHBCUmVnZ3hh?=
 =?utf-8?B?SU96TFZQTkNreVBDalZSY3B0QmdtRFUrZys4Y1N3enNVNk9SbjcwUElBN0c4?=
 =?utf-8?B?WHdITEZXZnU2UE1FMXI1TDdoVmxvUUF3RTVabmQ2cFJlVFFmTnJMM0NBait1?=
 =?utf-8?B?UGdGbHZ3QkxRQTdaV0Z6Z0JydlNCZ1k4aE92RnB6RFNTbXpEdnRYU2I0ZFgz?=
 =?utf-8?B?cUF3SjRsUTVEMmROajE0bmRqUHFvazR4YzgwU3psZG9ldXh2bEhZblhFSmZX?=
 =?utf-8?B?ajV3NUZDRW4xM0J6RGVYSnVXWlladTlxbGtOOTd0Qnp6RWtzaUZEUUlxNkRC?=
 =?utf-8?B?bWFITURRejJya05HUFVMdTFjd1BOTmxlQi9pQ1Z4N1pWYVdqTTRDZmQ0d1g3?=
 =?utf-8?B?cDgxR2hLakd3azJmdTFWVERCTG1EdFB0MHE2c1FqTEp2N01pU1kvNCtvUklw?=
 =?utf-8?B?emc2ZkpObWVsZjBFeTFxbkZoNGVBOWFlNmhMK0ZaRFdhOW1qZHhpOEJKaldO?=
 =?utf-8?B?Snc5bGwvc2U1VUw2bllDL1hiSjZlQ2ZOZGN0TWVyS1pwWm82allZVTVSdzAx?=
 =?utf-8?B?eWNnSk5tTllSU0RSL0o0SFdYc3ovTGQxa3RRWTlNK2lFRVJ0OFN5Qm9FTDlF?=
 =?utf-8?B?bmpzQnJCTTY2Sm5VUGt6dUdhOHZkODlNNnYxYUI5MkhpNlhhQ3hPeDFTSmZK?=
 =?utf-8?B?c1cwY29pU1krVElQaEVwSmZEZTFCbFgrRTlzRHlvZW4wc0Jtdys4NyttR3Fv?=
 =?utf-8?B?a25xY2I4eCtOSTVtTUtXc0YzZnc0Z2E2b2VMcDdiOXd4Y20wRTNPNGFWZUJK?=
 =?utf-8?B?czVuN3ZoTXhrTXpqYVZES3B3YXZCTitHRjJYeGh5NmhOQW1zeFFGclRGcVVv?=
 =?utf-8?B?ZTJwUFZHcGxNSXVranRtTWV4b2dDOWxualRlTkFBSVorS05pRmVkRFg1TTls?=
 =?utf-8?B?cjJkZFFhbXNhS3A4TUhqRzJPVFZlT3FHSm5lUy9qcVZxa0hXQytGeGFTVmha?=
 =?utf-8?B?cFBYenJWdEczVm13ZUhnNzNtTzI5Qlh1Q2JVRm9jZXZLS1c0R085d2ZVbGFO?=
 =?utf-8?Q?CHXTgmvvVnXYDOyHJiu0eQdcaM6KfdsU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFEWVRQaHVpYVd5UmlGSTV2bVJ1VFgyZldYaCtxZTFKWFZSblpaMlVTaXlE?=
 =?utf-8?B?Q0liR1duYjV4RUZOTXRIaVdFS20vM0dBWU9pL2hndDRDeFhCODYyKzl4T1pB?=
 =?utf-8?B?TG1KcWpnTlJKbXoreDZqNGtLQ2lISTg1TTNHL2pwdis4UWhiK2loaCtCWXo5?=
 =?utf-8?B?dmRoZmdTK2VMbEhib0V5MXFIU2tnNWVkNnNrYy8vMWVtb3pqTFlVUHY3Slc2?=
 =?utf-8?B?bDlzZjVPUjZ0S2xaazlUL3d3SG00bi96dWI4UFVSNE9kdTd2b2oreE9vckVF?=
 =?utf-8?B?ZkVKTnlZM0drbkorNnNITElyTkxxMHBweXZQdktNNCt4TVJPYTUwaUVadHFY?=
 =?utf-8?B?aWNoaDE1SmkxYnNvMTNKSndmUmtuQ2l2cGZMQTRpN2JuUmRGckJsQVJIdkRk?=
 =?utf-8?B?UVNzbEgzK1NmcGFDMGxuSkcrY05FNE5DSkpkU2hRSzRqNWJ5bFk0T3kxMlFS?=
 =?utf-8?B?c0VqakNiK3VTVXl4eDMvT1A5TGRsOFJlcE9YSmlvUTB3QTNEbFhnaStWZ2l4?=
 =?utf-8?B?d0ZNYVBONmxINjBKSnlJazZibm9vRXNFNW5wamJGSkFCeHhnWmlhdkJlV001?=
 =?utf-8?B?NCtRVnliVTZSRnRKRUVSaEhuTEExdnNuMTNZUFFMR1VRbkZRYlpuYjNDaWRu?=
 =?utf-8?B?cEFZOTh6ZTJpWG1JRHh3OG9xZjV4OE1JZExoQmJlVHN1RHZyUUZNZ3VvVk0w?=
 =?utf-8?B?SWl1NWNNaTRnd1VYYXNrZm9NMUs5QjdBOTZlUkVrYWRyaDFVdm9EQ3c4SlV4?=
 =?utf-8?B?U3UwaGxFSEdaSHFqcnkvVUhTOXFYT1daSysyV2o2cG5BNTBqNFpCWlkvaFMx?=
 =?utf-8?B?anI4ajF4UFFubU95VWl4RFY2NVBqZnBtelZpS1JVVjB4Q0czQjhWKzZxMkRK?=
 =?utf-8?B?OXJoODRsYzhhdzN6LzhzcDRuVGk0QU0yWG5DbFpJQWtKcGRXREJvWGdyNHV6?=
 =?utf-8?B?LzUxUC9CNUE0c0lndGF1NGNHUHp4cEhHUlQ2cDFLNGhMamlBNVlLN2t5eWpD?=
 =?utf-8?B?TWhEbUcxWFFoWnFIRUtYSGdveTVFUWtZRUVSelBEWlBUOXI5bWFiQnUrSzYw?=
 =?utf-8?B?U1BOYWlSLzk3Y3NCMGVrcnNTeE85ZldhME1UZUU0TzQwV1Y2Q2ExWmVmUGYz?=
 =?utf-8?B?K25SWEFzVkRaZWJyelI5bFRFT09oaDQ4aTBXak5ZdHhFRHE0V3hYQXI4VUNQ?=
 =?utf-8?B?cTFKZVZXeHVRdmQvOHNYYkRHMlFad0JjUkl2eXJTQXczYnNPSldJWFh0VVcz?=
 =?utf-8?B?L1A5UllFRGpQRUpwZFRmN3JHMEJjQUFKOTFmSWxNY0puUjVZQU9DVmNaaGh5?=
 =?utf-8?B?Y0dKUkJWalp0cGRXOW9yeVQ4NW5xeVRPNk5kbkJZZ0Nncm5tNXM5QVFOLzRR?=
 =?utf-8?B?ZTlhUzlpWUtvSGQ5NjZtNWdKclRlM0k4c3owYmFnNWRYS1c5Y3g1R0V2U0pI?=
 =?utf-8?B?cVViWE9aNklQUFRibHBRaWlLaTRiRVpmOUhOeHBXelgzeGFJRGh4dXlwZitX?=
 =?utf-8?B?dmNxb0RjbkdMdXZVQ0ZoOXJVZ2ZROEd3cmdQMW03QUppUFg4NDhHOTV0d2Zh?=
 =?utf-8?B?R2hxTjRJT0JwWUI1UWh3cWxNQlA2RTdhbHU1bi9hc3ljc0g1T3o0dkNXTmlm?=
 =?utf-8?B?NVpIZTdRY3EwK0haN0x1bzAzYW5NYmhGb1RGRmViczc2ZDZoR3JhZnJuN3B2?=
 =?utf-8?B?RkZGb29NZjJ6U1BCaUplazBhTVVSUW9rVVVmR295WmVjVWZXQVBIL0VwN0c2?=
 =?utf-8?B?Y1RUYStnMDRqelRvOFZ6VEFPWGR5VzF3YXNqSE5UbjlndVJWU2FVNW9aQ1Nk?=
 =?utf-8?B?eW1pWlIrMVVhVldrSzFreWJLL2xiTjV1V3JKSnFJTjErdVVXS2Yyb0RlK1RG?=
 =?utf-8?B?THNGb0VsWHNDeGZZVnQrV2ZVUGpocGlyNUMzOG13a1FWNmt4WUQ0ck12d2Fr?=
 =?utf-8?B?M2tsU0dLbWZjMGFXSXRlV1Z3KzlTY0JGa0E2NGdPSkJJY0VNTjRhcUtvb1dP?=
 =?utf-8?B?NnBFdHM1amRhTkFpZ0RpZUlOTW9jZEF1eDNVY0RBcUkvQUR3UWxTb3VXQ3Bk?=
 =?utf-8?B?UkYrNFZLb1BWNE1wdVB4U2s0UXQvY3JDb0l6dmVHSWNZVzJoK3B5QTlsVUZq?=
 =?utf-8?Q?c9LxNQT9SVSKRqkI4zsME/tZ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6be4d5-ded6-4e36-f1e8-08de07f87d6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:28:17.3310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtIMmXMol6bKk59UUHmhfwlkk3k55GvkQFEfNC9Jx31QsIfWeSHEm7rCqRrvbuR2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8097
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

David any objections that I take this patch and make the necessary modifications?

People are pinging me about the problem.

Regards,
Christian.

On 09.10.25 17:04, Christian König wrote:
> FYI
> 
> On 09.10.25 09:01, Christian König wrote:
>> On 02.10.25 17:05, David Rosca wrote:
>>> drm_sched_entity_flush should only kill the entity if the current
>>> process is the last user of the entity. The last_user is only set
>>> when adding new job, so entities that had no jobs submitted to them
>>> have NULL last_user and would always be killed.
>>> Another issue is setting last_user to NULL from drm_sched_entity_flush,
>>> which causes subsequent calls to kill the entity.
>>>
>>> Signed-off-by: David Rosca <david.rosca@amd.com>
>>> Fixes: 51564e9f06f0 ("drm/amdgpu: Avoid extra evict-restore process.")
>>
>> Good catch, but in general please CC the relevant maintainers and mailing lists for scheduler patches.
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 5 ++---
>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 8867b95ab089..a325e4a59990 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -70,6 +70,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>  	entity->guilty = guilty;
>>>  	entity->num_sched_list = num_sched_list;
>>>  	entity->priority = priority;
>>> +	entity->last_user = current->group_leader;
>>>  	/*
>>>  	 * It's perfectly valid to initialize an entity without having a valid
>>>  	 * scheduler attached. It's just not valid to use the scheduler before it
>>> @@ -278,7 +279,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>  {
>>>  	struct drm_gpu_scheduler *sched;
>>> -	struct task_struct *last_user;
>>>  	long ret = timeout;
>>>  
>>>  	if (!entity->rq)
>>> @@ -301,8 +301,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>>  	}
>>>  
>>>  	/* For killed process disable any more IBs enqueue right now */
>>> -	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>>> -	if ((!last_user || last_user == current->group_leader) &&
>>> +	if (entity->last_user == current->group_leader &&
>>
>> You still need the cmpxchg() here or otherwise drm_sched_entity_kill() would run multiple times.
>>
>> Regards,
>> Christian.
>>
>>>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
>>>  		drm_sched_entity_kill(entity);
>>>  
>>
> 

