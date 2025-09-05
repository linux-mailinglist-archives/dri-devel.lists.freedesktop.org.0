Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6421B45A9C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 16:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2C510EBB8;
	Fri,  5 Sep 2025 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KJqh0daF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1678410EBB8;
 Fri,  5 Sep 2025 14:33:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEek+LiBUMK20EfqONYr5dUyHCxqDb8vmJ1hOk7jS2ZZIxGT/Eyfr+HwBYRw8r5kLRYEJ2sB0U19Cnh66xSCJhbULsL+pHUJu3VYtETobaJaqFrwAvu+g7aOrric9Xam8F34iIyYx4L7AFvBea1ebJ2oniOlfuy+Eib77cxjh7VIE1jDnmYL5drQCjZOpO2MK7UEPNayJbOIkSx/32zfSk2BtZFK5UABfg48rpJTD7l+SBuAkG5KqPk/dRVCrQB4Gc2tYoZ3Ym1bsM2Syfs9wOx9Cqaj4z4OGnNuAoQOd8E0pEwtPIshp1xGjktRplMrEZdbp+xARTs+VmW8hwAIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfMDyo1yNTTZqpOBavu11ew/+crkzJxC49a4ZSmMyCA=;
 b=PNOQf/z3RKx+j6G5q2V+Ucz/9NAHjDZFiI0CNfmScYPDLqbBRZL0iX/UqeBzzn145wmn3PYhF9CYPa8cFRwF0nxpHZ4ZuyTPYP2fJ169yI3A5JRy69Y1HxpCYWWJY74gioI9d5V/Lj8IqEOFJBlnD1DMExXuaV7Ty+L5l/TyNpProBVjXTiZDdBUxKOTNih9Qlbhju1HciPPKFhsptea9TGqxwOcz7hBgx/geLyFwUnVrHa/vDrYGvwWcSOTheWVvqKpa1Ow+vaXBK2AjoJp82RrtzTywtozIIcGgfXp9R6SPHpmhrM4fShe+z8YE1sQ1DAHum+/qCyVDHTx+624XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfMDyo1yNTTZqpOBavu11ew/+crkzJxC49a4ZSmMyCA=;
 b=KJqh0daF0qKY2mvFXDv5sTjRPX6qciBTpHpYwlIOIkWsxTdzixMoq2oH/evlgC1aER0xIMaebfX15A9bss1tx1CtLi9BU7tyBWNKe4QZj0rh3i5mjpY1B2VRCktQLlxlIVnZzjDrhnj0c3rfwzddaJPH4bxWQ4PCpRlVCIta6yA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 14:33:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 14:33:41 +0000
Message-ID: <29d65aec-e709-4606-9513-8bbe9f05a40e@amd.com>
Date: Fri, 5 Sep 2025 16:33:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: increment share sched score on entity
 selection
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:c0::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: ae263e97-01c4-414e-d0ef-08ddec8935b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0F4dEJ4UzRuT1dIcmRjRDAvSnJTMC9aL3lKNnhMR0JHZTkvSkt1MlI5M3FB?=
 =?utf-8?B?bTRmb2Z5NlU4RXRwalVuU3JtVks1Y2gxY3hxZjQrdzdmR2RZU0hzd25KQVFO?=
 =?utf-8?B?d2NlbmQ4ZUhxS2JzZWVjcElwQkcySG9MUkFkUXIvMTFJTFhHV2NncWpRR2hV?=
 =?utf-8?B?ZVV4OEtFMTNpQmlYNnlGMm9UbG8xUDFFNEJ0WTA4RkhrV3dHVE1CdUd4NDFr?=
 =?utf-8?B?K1VOUnAvbTVSRUFkT2pMeGJEN09aUVd1SldWTTYrU3dodzI3SGNjd0NRTEk1?=
 =?utf-8?B?eXJvZEUxYW9jeDVlK05HdFBDREZuVEgwdmZkOXBhWkM2MkpmSit1Z3k1RW0w?=
 =?utf-8?B?ajNKRGpDcVUxR243Y0VNckFaTElJZE02Rm5FcHZkUnYyOS84bHJzUXVVL0R2?=
 =?utf-8?B?b043NWFET2p3WWVWbzJkcUhuOTYrQnhIZW8za2NjZU1abjdHTUN0eW5MdHFU?=
 =?utf-8?B?YjBNa1JsN3BGWWFsMnlBTk9KWXN5NXR5TVFXU2JXMmdVdGRpK1F5SUNDeDkw?=
 =?utf-8?B?SWMwMm1mbzIxTnNDZE96aWlYbE1qcDc3bGQ1YXJrRHRGMnYxVTRFb1FKa0Z4?=
 =?utf-8?B?NG82eFBZT29kOWRzMncyQ1VRQlRVK3ZMVXgwbzYyZlVramF6ZUgyKzJuQkh2?=
 =?utf-8?B?SjdOL0Nha0J2dzYzNUFqMXVUQTFtRldqcU50QU9vcWFhKytRbkpPcnd5S0Rj?=
 =?utf-8?B?SjJFNnZIMlhpS3VucFJKMEREbHRFbHhCaTA1L2YwekxXd1RsUW0weGFTb21l?=
 =?utf-8?B?a1B5Q3BSek9nWUhCRnNBRW5SbDRZeG11TFVubmFwdWw3N2ZBTStlajJvU0tx?=
 =?utf-8?B?aGJEYm80amNBNDl2WW4wZkVjUDIva3JJSC9xNGoxRzBibW9nYm8zY0N0OWtm?=
 =?utf-8?B?ZGRHM1VTMVJlakI2aGh0a3VHVWEzZm03dkIybXFPekxDamFzUk1zLzlwS1hK?=
 =?utf-8?B?QW9McnQ2WVVMaWlPSmhJR2FROWNrYnl4Q2RNTGR4d1lGOVU5NDIrZWdPYUo0?=
 =?utf-8?B?d2JwRGtQZy80L3haZnBIeDFFODRTc3RaeWVFN2p6NXpWRHpaTFRzTnI1U2Q0?=
 =?utf-8?B?ZUFpby9xQTBWYmIvendtMXVjVENOWHRTSURmY0N2a2g2bFdReHAweGowRk5l?=
 =?utf-8?B?R1IzVzBWRHZiRHBnQW1jSFgyejA1ZTU4NEI0cWJGR2FIYWhtaURYb1EwQ3Fn?=
 =?utf-8?B?TEpMT1FhV1IyL2k4a0cyRXowRDhhalpha1l0Ti9qdENDNFlDRFpScHNhZzRB?=
 =?utf-8?B?a0pXVTFjOC9CRTYzR1hmUlozM0FJZGlaSkZjQ2ZOemFHT2d1cjdQdU5EVmpl?=
 =?utf-8?B?OWtJRXAxa1crNUNVRUlvR3ZYY0syYVZrd0JBWWx5ZWU1LzMzS3VqbXVtUFQ1?=
 =?utf-8?B?K1I1MlZuYm9QS2xyQUh4cW9razB4UHR2bnI1bTExaXdMSkRtNTdFUHEzeVhC?=
 =?utf-8?B?aitSYnVCL3BFbmpiRFB4K0RqM2VQZzlrWGQ1cFczSnZkVU9va2IrZnAwVklk?=
 =?utf-8?B?UHcxMFR6L2FqVUZoeXJNdWNxdGtoT3hjbnEramZsSlNrMzVMcFZFSW1jajVv?=
 =?utf-8?B?OTlUdHlpTmpSVXZyM3BxVytuT3l1SC81SXRGTnJ1Tk1WcnprR0kvd2lCdERB?=
 =?utf-8?B?OVBMUkpUMU41MmluUk9mTkpOckpqY0NuNlBGamFxNnN2QjF4WWc2WGdSSzRK?=
 =?utf-8?B?bUZwL3JrYlc3eTE3bkhtK2lLVmp3SlAvWlFmd3VPWktNVlZzRURPTlVKT3Y2?=
 =?utf-8?B?MzFZOHk2dWpPNzZhblJEWm5SNjhTa3JkSHFQWjB6dnlSamc5UHFJbjVwTGJP?=
 =?utf-8?B?WTFZUHJSSTZyaXZ1eUk1UGgwckovd04yeFJvUFZrNUhJdEpLVVlaVzNvUFJ0?=
 =?utf-8?B?LzVSL3lzb3hxdzJzaG1hQmlhUUNUMGh3VXVRdXBtb0hzWGhDOGNkNkRlZ29s?=
 =?utf-8?Q?xvJUprl6pGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVwWXhSNGdlOWIvaHhPTFFhNzNoV29lQzJ1Wms1SlBCZnZBM1BlVmNEZGVu?=
 =?utf-8?B?bzlMOHU0RHgrS0xUL0kwK2tINnNDSXZFYzk5Nm01c1A1STZUNE1TL1M5bnlR?=
 =?utf-8?B?L3VHK00xWmgzZG1OeXlaaGZQNkJlQUtiSjRsMVU2bUQrRkhyWS9iMVI3aHZH?=
 =?utf-8?B?cUFlQnh6WlRUNFBXM1NKemxUV2o3Qy9JemFiQ2ZmUGlSYS82L0dsRS9qNHJX?=
 =?utf-8?B?MmhKN08zWXcxUWl2Ym96a3FhdWlXVjRkUDRueERTdlpsSFdWZHZhbDROZWFM?=
 =?utf-8?B?UlN0YmNGeDk2NkdlNU4zV0FNdDBpQ2YxcXpjUjVBWU1EZ0pKWnYxMHhyaVd5?=
 =?utf-8?B?ZU1RYVg2WnEzMTRrUmVIRWlwZFViZW9MOFV6bTBNcDVwWWJ2TVZoaXdwZWZj?=
 =?utf-8?B?aEVFVXQvTFVHYk9ESUl2TVlGejl6Tjc3RjhFd2pmQ2xIazFhQU1rSWh1MEVm?=
 =?utf-8?B?Mko4NGhGTmhJMWl6QzZJUXN1V1hhNFZPcGlPcElnNEpYWnh2eEx4MDRYOWk5?=
 =?utf-8?B?OWw3MUNuY2taMVYwNkd6MWRTck5WMHVqS0E0QytVZGpxZURUWFMydERvSlNR?=
 =?utf-8?B?OXlDcFpiQ2pXRjZFeFJtb25EWWI3a1oySUhLcDJUK2lyMzg3b0xwdjdITHdt?=
 =?utf-8?B?TEZ2UUFscUN0YTVLODFzU3RXaVNTMHVNb2oxRndOWDd3TFVHaEp0ZktsOGNV?=
 =?utf-8?B?L2hKWlgxY1RHeUdrQnYrSG5nOUlDbGxuanh1TFNQRDZDMkNOdkNWWStRQkto?=
 =?utf-8?B?azlYNmMrU0gvQzhiNEY5c202Sk0xajhJQUZzRXhwYVc2OFk0S05TTmlzcUpX?=
 =?utf-8?B?eDUyaTdodXRSZFA5WFd5bXI3S2hYUWk3VnA2K1ZXUnpBVlhVQ3dHQTJvQTl5?=
 =?utf-8?B?K0dtT05GOGdESmFQbGhtMGlWemJzaG5mRXdlOFEwNCswMDFkMkViM1FqUGtH?=
 =?utf-8?B?a25ISjdKamFQTHQzVWgzcVczQldMQXV6V3B4NkZqa05DWUJCMnNlUzUrazBl?=
 =?utf-8?B?Q1JvQ0x1cFNsZUUxUDJRTzAraXh4L05uOVBlTjJGMTBKUm05OGRkNVczWE1i?=
 =?utf-8?B?dlJMN3Z5YTRISER5MzRaYVVCK09MY1pUcDExL0dUWkpiYzA5L2VqUWt1Yldk?=
 =?utf-8?B?alIwclZEL1VSczl2eC9RVHhWRGhjRkMvUFZoZmpuSnRiL0diNzBrbFNmZktG?=
 =?utf-8?B?U3NQaTRwT2phNFduZWt6S2k3S0tOMGthNzNnWHRGTDF2VkFGV21vV3pPWjFG?=
 =?utf-8?B?Ri9ZZFdvTzBiTk5JVFJPZjM2cEh6WEdHM20xTWhqSlZlQ1IycVI5NXJHMVpO?=
 =?utf-8?B?SlFFR21kTFJ4MkUrbzdxZXJ5YTlBL0dhTW9qV2xWclVVeFZpWmRxTFBCQVdn?=
 =?utf-8?B?eWpBWEQxN1BoUU11T2VoMENGbEhrSHFYZXZOMGx6N2Z5eG9lVmhRdS8yYVRQ?=
 =?utf-8?B?VitKalNaL1hvWjhKTWhiazJaYXl1WUlVQW9pRlpYSVQvNytnVFVzNkJUWEpH?=
 =?utf-8?B?aEJYb1MzVFh2YTZOVzZSWUh6VzQrMVpzenpqN0UyV1Z3K0VTSGRyTUtEVXND?=
 =?utf-8?B?UnlUc3hmaGVHSjZNVVhSQTlPdnZRZm55SXdibTd6eUhqZzZZUDAvWWdpODkz?=
 =?utf-8?B?OEJvSnJQYUhvdzdQK3dqVWIxUFFDMnZMNUhIZDJXRzVlZDIweHQvNnhMTmtE?=
 =?utf-8?B?VFJGblA1V2FpUWR6VGxtbmRvekR4WW10UGtPWG9FVndhK0hIanZ2QS82K21M?=
 =?utf-8?B?MWlmL3lnekUwOWlHdnVJTU9xaG9pZU41cWVaT0Rod1NUd3lnQ0lLR3NmVnQ1?=
 =?utf-8?B?c3g5dkFMWTJITEtwMDU0MlFPM0JodW45UVd4KzZiQ08vNkErYXg5TWRWbVFT?=
 =?utf-8?B?dTZXYzRzcVY0QVFZTSswbnYwSlJWeDhGdjRVMzNFTGtBbGg0L1p0VG5DUnAy?=
 =?utf-8?B?dXpOc2NjWDlRRWIrRXRSUFZWY3pBcjc2U0x5M1hQbEtsUEpnWHBLQ1Jub2o5?=
 =?utf-8?B?akpGd3g1S1QrR00rcmdpbHd4UnFWOTBDdDFlL0NhanpGT0llaUN2cnF4b3Fl?=
 =?utf-8?B?clJtUW4wMmZ3ckJ5cnVsMkc1dmpRa2xZWEpYb01PY3J1aWNZOFg3dDVuSS96?=
 =?utf-8?Q?JsvFBaB4meXsurOkjvZQbMYhZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae263e97-01c4-414e-d0ef-08ddec8935b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:33:41.5969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWd+gYZ/fVdLQa7S1UyiztHiGR2qBQ7cQAY8ez0l6dNw6FshJfRCPIRQcolMrjRo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
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

On 22.08.25 15:43, Pierre-Eric Pelloux-Prayer wrote:
> For hw engines that can't load balance jobs, entities are
> "statically" load balanced: on their first submit, they select
> the best scheduler based on its score.
> The score is made up of 2 parts:
> * the job queue depth (how much jobs are executing/waiting)
> * the number of entities assigned
> 
> The second part is only relevant for the static load balance:
> it's a way to consider how many entities are attached to this
> scheduler, knowing that if they ever submit jobs they will go
> to this one.
> 
> For rings that can load balance jobs freely, idle entities
> aren't a concern and shouldn't impact the scheduler's decisions.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 23 ++++++++++++++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index f5d5c45ddc0d..4a078d2d98c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -206,9 +206,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  {
>  	struct drm_gpu_scheduler **scheds = NULL, *sched = NULL;
>  	struct amdgpu_device *adev = ctx->mgr->adev;
> +	bool static_load_balancing = false;
>  	struct amdgpu_ctx_entity *entity;
>  	enum drm_sched_priority drm_prio;
>  	unsigned int hw_prio, num_scheds;
> +	struct amdgpu_ring *aring;
>  	int32_t ctx_prio;
>  	int r;
>  
> @@ -236,17 +238,22 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  		r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
>  						&num_scheds, &scheds);
>  		if (r)
> -			goto cleanup_entity;
> +			goto error_free_entity;
>  	}
>  
>  	/* disable load balance if the hw engine retains context among dependent jobs */
> -	if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> -	    hw_ip == AMDGPU_HW_IP_UVD) {
> +	static_load_balancing = hw_ip == AMDGPU_HW_IP_VCN_ENC ||
> +				hw_ip == AMDGPU_HW_IP_VCN_DEC ||
> +				hw_ip == AMDGPU_HW_IP_UVD_ENC ||
> +				hw_ip == AMDGPU_HW_IP_UVD;

Please make that a property of the, e.g. a bool in struct amdgpu_ring_funcs.

Making it depend on the HW IP type was a bad idea in the first place since this all depends on the HW/FW version and not the general IP type.

Apart from that looks good to me.

Regards,
Christian.

> +
> +	if (static_load_balancing) {
>  		sched = drm_sched_pick_best(scheds, num_scheds);
>  		scheds = &sched;
>  		num_scheds = 1;
> +		aring = container_of(sched, struct amdgpu_ring, sched);
> +		entity->sched_ring_score = aring->sched_score;
> +		atomic_inc(entity->sched_ring_score);
>  	}
>  
>  	r = drm_sched_entity_init(&entity->entity, drm_prio, scheds, num_scheds,
> @@ -264,6 +271,9 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  	drm_sched_entity_fini(&entity->entity);
>  
>  error_free_entity:
> +	if (static_load_balancing)
> +		atomic_dec(entity->sched_ring_score);
> +
>  	kfree(entity);
>  
>  	return r;
> @@ -514,6 +524,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>  			if (!ctx->entities[i][j])
>  				continue;
>  
> +			if (ctx->entities[i][j]->sched_ring_score)
> +				atomic_dec(ctx->entities[i][j]->sched_ring_score);
> +
>  			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>  		}
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> index 090dfe86f75b..076a0e165ce0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>  	uint32_t		hw_ip;
>  	uint64_t		sequence;
>  	struct drm_sched_entity	entity;
> +	atomic_t		*sched_ring_score;
>  	struct dma_fence	*fences[];
>  };
>  

