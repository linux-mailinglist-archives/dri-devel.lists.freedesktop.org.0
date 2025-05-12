Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B7AB3140
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E63410E30E;
	Mon, 12 May 2025 08:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="loVgosQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D2D10E2F7;
 Mon, 12 May 2025 08:13:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD+NQf4ab2YG+dDDvr8g+3lgnedRPJN4A450or2VvXFA4NOL/xPix9mNNc1xPDT51jdnQ4yPev8E1Fy5IVcvMyBPm03PaZ/PvKL22npS4yfchz6ceqVB+NZ+mkJGdPTf4YIutVFtT9YDY5pB4i0Q+VgPP7dvDp+i1leIU7MPrjQCMi/uQN9CSCDynxpXUuxKjeFBYo3XBoQTTQqs7JO2go7br7y2DPknBQGeAMe0bGfxZdl2nSK2qD0OZZDNGSIB4PYJ5KKSnoKe5em1i5sDz1xGeZq4ALfRXfruZnXotth6tmIQpynPoMDwBEcvDZ4hTK3cS9H/RnyGyzhUgg5KEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+pNousaax3awZyPn8Ax5SR+mtjh0RPluEtq/PmtG2s=;
 b=fPxfFyW5Bo4ZZHOoMB2hnJhSGOEBBIgP0edIsGfiEfrV1yhv+xYsif35H47AMWJABuKH167FR0N+aW+d7QHYDbzZTu8G85Djvt+QcnseJ651fR0aTA5YO94cCiehTiFKAuqML5LpmUx2f9Uj5rUEwRpWdhHI8DVgi1xPbq/Rwf/sMKTf6CgyCwgKhoyBR1gcbUZ4NVeQ4omJhr/mESr1nK5RqU9A4r1dyjxi+j3Zkm5pBo4lyUuUumFusppiuIuy7EtJAPkgR72yjf23RZuf4S+til6ZxuHhnVSGzGEfIIlN+pUMkU32tmQ+F6l9zpOyp9XKAFaI+0uoEornTma1qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+pNousaax3awZyPn8Ax5SR+mtjh0RPluEtq/PmtG2s=;
 b=loVgosQD38vCUm2ZJZJDnfWpWs9mLb/GbLAttt8C16+OVQM3/qLW6gM5esREi+SsEXDj1WkX/rMEo/sSwDdO0TkrjpN/NesThAwoM2NJCZ3lMsB+/BzwmJqRMuPAesNsodhwd+IS4oAdxdiU3/MbcyUACCQKJ5LbZiws8D8cNkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH1PPF5EBD457EF.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::610) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Mon, 12 May
 2025 08:13:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:13:29 +0000
Message-ID: <efb5b660-00b2-4505-a6b6-88903bb3fd67@amd.com>
Date: Mon, 12 May 2025 10:13:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 02/13] dma-fence: Change signature of __dma_fence_is_later
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: f2dfd7d1-bef7-4995-d699-08dd912ce06e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXZpSHc0S3pzc3V0MFZWZjRRREFrQWM2U1dVNEZUbmhvMXhocXdaa2VYL3ZY?=
 =?utf-8?B?aFV3ZDZscmhxZkhoTGtYbzZvdjJnYmNRNHl0bGtHKzE5TmF1dEdrcWdQTzh5?=
 =?utf-8?B?UkVrMG9XYTRFOVJUb01qUzFaazZqT2R0Q21RdnZvb25xMXNSbmlCSVptK0Rk?=
 =?utf-8?B?b1kwb1NJMjJMYXZmS0ZQM1F2SVhYcGxNNnUycVJJeitGQmljU29RZ09OalAy?=
 =?utf-8?B?TlZ3d1ZKTCt4NGNKcXJZVFZIOXoxUXk4MkFydnhXMFg0ZEE1SFg0aWRWeW9K?=
 =?utf-8?B?L0xBWjN6RlRXRS9PRjZTcThqK1VmVk5EazR1d2NPRUdiTnl0d2l6Mmd2Z2dq?=
 =?utf-8?B?NXhFbTdmdXh3VkcwS0NpeWluaEgyUkxsZkQyaGtOVWJjTlZSYUVrdmJyVmZo?=
 =?utf-8?B?bU1PTVMySWJGK0tIWjdNb2dENWFFTkNnaUR0N3VZMHFjRkY1ZUQrU3ZBbGUw?=
 =?utf-8?B?eWJUOVcxUGh4SS9CS2d4WGdnLzBzbW1oSVhMbksxTjVvRnhPMFp5MndLczlW?=
 =?utf-8?B?a1ZiZ1N5ZENOSW5uaytQcVc5cHo1RFZBRTVmbERiZmNHbWtQU3ZDeFVYNVFD?=
 =?utf-8?B?eHl2OEFac3RnbEJVa29Ua09uWW9TeHlyQm41SXB6Vkt4S3E3d2hhZ2JYMUVG?=
 =?utf-8?B?WHFXRFdtMlJ6YlMvcGZibUNaaU5tUGY2SEpyVkNQNSsxTlBJUTNiRHpCQ3h3?=
 =?utf-8?B?TlNZOGI0eFk0OGVPcFZtQjYrVmk3c2VFZm9wU3d6ckNnek9SdjlqQmFpbW1G?=
 =?utf-8?B?L0VVdEF5Rm9PMVBWWW5MUWpJekdvUklKdGN3bWovQm9SdWpJTUtEbjNUa3Vl?=
 =?utf-8?B?ZEo2UWgrcG43VFVGT0k4bWR3WHJqT0pLU2s2SnJlbmljKzRxWnVoMng4QjhI?=
 =?utf-8?B?ZGJ6S2thZ2xsME9zYTJDVFFwWER5b09RSmU5RDA3T2pOUWZHQWN0eG1EUUFM?=
 =?utf-8?B?SVRtazBmSzdab3gwWGl0K0F1ckZseVErVkhYaXZuT1ZLaEt3dWF6c1RBTHV2?=
 =?utf-8?B?K3psSU5BZWNNUVQ2RjAvYlR1K3JYVHFXUHdLVHpWOWVIL3hKK1FnOWlKNUND?=
 =?utf-8?B?bnBYWFhLTEZVY2kzcDBNQ2FjOCsvSEhDWnlMdWE5SDJVQUNmWGJ0RmFpTlNn?=
 =?utf-8?B?SGcvTzA1UXhJZXJqNkdQSjlybThRQlAwcXdad25uRXZHbWFGdHJLQ3lUelp3?=
 =?utf-8?B?K09VSUlrOTN5ZzU4akU5STIxdVRseXdiOUVzdXo0bndvVlowcTB4ZW1sZW80?=
 =?utf-8?B?RnFUYi8vYVNEMjg5ZUFOYmF2ZmFDRk1PekJxQVB3NTRHemJmMDBueGlTdWxC?=
 =?utf-8?B?QXlET2N0RHlScitQN0cxRk5sWGx4MWhNTzJ4QUdlN3Bubnp5djFZV0tDcnc4?=
 =?utf-8?B?eWpwNFUxeklDMzVJMUREUWlOM2g0M2ZINE0wbnJGSUhueXJZWmJ2NGRvcEZV?=
 =?utf-8?B?aFFmdVg0djNuazdlWlVFV1lIdUZhdVQ3YU9FeVVhaFdscEl6VFpnWGl6eFhj?=
 =?utf-8?B?b20rRG9xTXdLY0JkbzczdE9ZcGhGTzcyQzdCNlQ5R0Z1WlcrQldjWGVUcXdM?=
 =?utf-8?B?ZjZXSVh5YnBxS205bUwzc0p3b2taMzhjaks1TFZIQTlWRlNYbWVkdWJzZUJG?=
 =?utf-8?B?bko4dnp4OE9QZERsakl1K1VKMjVsT3VWTko0T3VadDVoN2FqSjlkRGxGTDFy?=
 =?utf-8?B?SFVmTDZLc3lYTE50RU5VYUkzTlNtaEViV25OM3B3SGEraDFVU0JmYnoxYytw?=
 =?utf-8?B?YkM5YjdHNE54Zm00LzZNak1vamc1TWdhL1FNTmtoRUk3L0hVNlBHYW1BQktp?=
 =?utf-8?B?bXk4UnEwZVV3c0lKOUxiSS91dUxhUWd0QlpMVGJXcXhwMGJ4ZngzUVp6dTBG?=
 =?utf-8?B?dHBMa1NVM2JKdUdZVWd3SEhHV2ZZWDlDcWdTTTh0a1dia21lZDllRmNmZ1do?=
 =?utf-8?Q?rdWOOAnJqhg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0piZm4rV0tuWTdEZEpUMkJuZXpZNG10WlgwUFN1WlNLZ1lLM1YydjFDMFdD?=
 =?utf-8?B?eGRueUVOZk5WbTUxL1YxK2ZWdGlYVmJjM0hYMGRJcm41TkdNUk5odFFSZ0FR?=
 =?utf-8?B?TXFUdGhQMXlaRm1LNGY3L3NYZCtEYU4vckhzUGI2MGN2Mk5LUEU2MVhyN2xy?=
 =?utf-8?B?aDlGaUp1Z1J0ckJwRDNaYjRIRllWVnY1VlpBQkM0dWZaUFByWmMzZnd6VEtT?=
 =?utf-8?B?ZmRlRC93dm5nK20wVllqUVpCZVRuZjVIK096eVNnNHNUVDJQSG43U1hyRWRB?=
 =?utf-8?B?TG83TlBpV2hSaVU4czBubHgzT1RSUDdhcWdGdStBSG5qT3hnZDRMVFNFMHVi?=
 =?utf-8?B?R1c5VGRXczRhSEplQnZSNjJCQzhtVjhEUzNoS2dsOHdhd25aTGNrOFBVZzJx?=
 =?utf-8?B?UjVMdnNxd0E3d3c1cGRUSlBXZ0NDcktmRzBKL2N5d0tRcHhMUld4MHhxeTZW?=
 =?utf-8?B?Y0RyeHF5ZElhUkR3bndvVlluRmNMUi9Yd0NSV3NGL3E0Mk5Wb2NOa0psM0Fy?=
 =?utf-8?B?Q2JneTdKeUNMcnJlbGdIcS9ZanQrV2x1Sjk1K2dIdHRZcEZnajJEeUxzT3dT?=
 =?utf-8?B?aE4vcG9JV2EveUtXMzNPcmNkbmtJUjdZUzZCODJvY3ZMTGRJcWw2QzRYR3Z0?=
 =?utf-8?B?MXVYd2hwQU9IM2E3RDV3YnhjNkJLK2lxZjQ3OWVTcTNGaURyUFZUcGExcWZE?=
 =?utf-8?B?K3NDeUsyY3ZueTMxekN0aDBuaGMwb3k0Sjg3QXBlcTF3c3hoeXl6MGhTYXQ4?=
 =?utf-8?B?UUdleEZmTTRyRFd2N0FYTGRVVytnUkdScnpTVDZ2STd1NzYzNUpjR2kzNkZy?=
 =?utf-8?B?ZUgxdlJJZytYN3E5dEx2aUQ4QTJvTER1VTNBVHdJZ3NINTVpN0g5OXROZFQ5?=
 =?utf-8?B?WlV6Zno3eEd6eXhxaDYxeGVtdlRXV0ZVUEJza0NCSGtudFpnNEJIWUpLUXkw?=
 =?utf-8?B?byt6OXBOaFNUQnI5TWZBYlNITk1GR2pyalRhaXNOYlNYRXBwMHFHYXhnZ2to?=
 =?utf-8?B?QnN6cDF2ZkU5R0lpdW5McHcwbWZSa1BVUlZhMjFMeWtKL2JHOTZ2emZONmND?=
 =?utf-8?B?d0U4SVF4M2dCbW1jZ3c1N01MQmY0T1Urc1Q4RGQxODlDQUIwZ3A5ZVNOMkl0?=
 =?utf-8?B?MmliRFR5QjNBRHkrbmg5NXdPWmJrS0hSckh5MHpFQW9SRG0wdTRZYVltSTZM?=
 =?utf-8?B?OFBGT3d2MGN3aDhjOUl1MTByRStFdExXYmY0WGhPd3ByZmFRWHc3Ui9yQThX?=
 =?utf-8?B?djZjYUdPZHF3a0ZxSDhKak55ZkhBUjZOeU0xZjgwUGFIajJxR1c3RHo3MklS?=
 =?utf-8?B?K2d5YzlvclZUU3JyMkcvNzJOSXdHdkZrOE1tWWZBZ2hESlo1cndlNzRybFhO?=
 =?utf-8?B?UmdFcGMrbHIyY0JsTUdkazZlRWtqcU1iVzZkVnFSOE16RHlMQUduVTV6VXZo?=
 =?utf-8?B?YXByRk9wNWl3cDY3ZmRHeWNrZnp5K1Bnc2FGTjFvSVRWUUZ2TjlFSG83RW1k?=
 =?utf-8?B?dzJsejNBWm1WRnJpRjRvWWRhRFhzNExmSlpxalJsMVJaTjhEVm5qMVNFSTVM?=
 =?utf-8?B?TElucDBiTFZXMitLNzFzM0Z5Znhab1BKM0ovSVk3RDExYzgzektzY2Z4ajlZ?=
 =?utf-8?B?dHR5N1Bhd2t1aEZUcGV6cnBqU2tDUWVHRjE5b1RtL0NDV2U4RVlkV1grUHhE?=
 =?utf-8?B?MXlvazJaT1BEQkI0VW1GcmJrdXB1bktmM2JKMDduOTl3c2R5c1F2Qldpb0Jk?=
 =?utf-8?B?ZGNxRndDYVJmZjI4cThLdTRzT3ppeFE3V1UvbXpteVlWei9OTEJvaVJuaXQw?=
 =?utf-8?B?Z05jaHd3aDd3RnBPZ1BZd2Q3WUc5WDh4WUVxK3pDZlc3TllOaVFIOGZPWkdt?=
 =?utf-8?B?Y2hHT2JHN0hLUlgrLzhkK3BUaFJjaTRjcUZrQUpRUWpzUnNoUEFSQ1NGSjZ1?=
 =?utf-8?B?czJxcWdhbndtcE1yTFNPUlZjcSttKzMzSDVGVG1hU2s4ZmZtR2x5S2VSNHBH?=
 =?utf-8?B?bzFSaWp0S0w2M0htUGt2TFRRVElBak5JakplUFJPSUVjc0lBWVZsOXd3NTc5?=
 =?utf-8?B?OHlndzMySjJwNE1tcVVORWpzREhTS3M3MnpaUTB4ZVM3UDBMK1ovOWt4UUQ0?=
 =?utf-8?Q?mFA/rsAKw+/EkKGkcWAGHhb8V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dfd7d1-bef7-4995-d699-08dd912ce06e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:13:28.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx1+04Aok7pXRXDVeHBclWs/K1vlHaGoT6MqBi0LEkyZXOydZ1N/sOhxKimB8mPB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch (and dereference)
> fence->ops, we change the prototype of __dma_fence_is_later() to take
> fence instead of fence->ops.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence-chain.c |  2 +-
>  drivers/dma-buf/sw_sync.c         |  2 +-
>  drivers/gpu/drm/xe/xe_hw_fence.c  |  2 +-
>  drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++------
>  include/linux/dma-fence.h         |  9 ++++-----
>  5 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 9663ba1bb6ac..90424f23fd73 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -252,7 +252,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  	chain->prev_seqno = 0;
>  
>  	/* Try to reuse the context of the previous chain node. */
> -	if (prev_chain && __dma_fence_is_later(seqno, prev->seqno, prev->ops)) {
> +	if (prev_chain && __dma_fence_is_later(prev, seqno, prev->seqno)) {
>  		context = prev->context;
>  		chain->prev_seqno = prev->seqno;
>  	} else {
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 4f27ee93a00c..3c20f1d31cf5 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -170,7 +170,7 @@ static bool timeline_fence_signaled(struct dma_fence *fence)
>  {
>  	struct sync_timeline *parent = dma_fence_parent(fence);
>  
> -	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
> +	return !__dma_fence_is_later(fence, fence->seqno, parent->value);
>  }
>  
>  static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index 0b4f12be3692..03eb8c6d1616 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -165,7 +165,7 @@ static bool xe_hw_fence_signaled(struct dma_fence *dma_fence)
>  	u32 seqno = xe_map_rd(xe, &fence->seqno_map, 0, u32);
>  
>  	return dma_fence->error ||
> -		!__dma_fence_is_later(dma_fence->seqno, seqno, dma_fence->ops);
> +		!__dma_fence_is_later(dma_fence, dma_fence->seqno, seqno);
>  }
>  
>  static bool xe_hw_fence_enable_signaling(struct dma_fence *dma_fence)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 1905ca590965..f0a6ce610948 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -216,15 +216,17 @@ void xe_sched_job_set_error(struct xe_sched_job *job, int error)
>  
>  bool xe_sched_job_started(struct xe_sched_job *job)
>  {
> +	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
>  	struct xe_lrc *lrc = job->q->lrc[0];
>  
> -	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> -				     xe_lrc_start_seqno(lrc),
> -				     dma_fence_chain_contained(job->fence)->ops);
> +	return !__dma_fence_is_later(fence,
> +				     xe_sched_job_lrc_seqno(job),
> +				     xe_lrc_start_seqno(lrc));
>  }
>  
>  bool xe_sched_job_completed(struct xe_sched_job *job)
>  {
> +	struct dma_fence *fence = dma_fence_chain_contained(job->fence);
>  	struct xe_lrc *lrc = job->q->lrc[0];
>  
>  	/*
> @@ -232,9 +234,9 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
>  	 * parallel handshake is done.
>  	 */
>  
> -	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> -				     xe_lrc_seqno(lrc),
> -				     dma_fence_chain_contained(job->fence)->ops);
> +	return !__dma_fence_is_later(fence,
> +				     xe_sched_job_lrc_seqno(job),
> +				     xe_lrc_seqno(lrc));
>  }
>  
>  void xe_sched_job_arm(struct xe_sched_job *job)
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index b12776883d14..48b5202c531d 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -441,21 +441,20 @@ dma_fence_is_signaled(struct dma_fence *fence)
>  
>  /**
>   * __dma_fence_is_later - return if f1 is chronologically later than f2
> + * @fence: fence in whose context to do the comparison
>   * @f1: the first fence's seqno
>   * @f2: the second fence's seqno from the same context
> - * @ops: dma_fence_ops associated with the seqno
>   *
>   * Returns true if f1 is chronologically later than f2. Both fences must be
>   * from the same context, since a seqno is not common across contexts.
>   */
> -static inline bool __dma_fence_is_later(u64 f1, u64 f2,
> -					const struct dma_fence_ops *ops)
> +static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>  {
>  	/* This is for backward compatibility with drivers which can only handle
>  	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>  	 * do so.
>  	 */
> -	if (ops->use_64bit_seqno)
> +	if (fence->ops->use_64bit_seqno)
>  		return f1 > f2;
>  
>  	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
> @@ -475,7 +474,7 @@ static inline bool dma_fence_is_later(struct dma_fence *f1,
>  	if (WARN_ON(f1->context != f2->context))
>  		return false;
>  
> -	return __dma_fence_is_later(f1->seqno, f2->seqno, f1->ops);
> +	return __dma_fence_is_later(f1, f1->seqno, f2->seqno);
>  }
>  
>  /**

