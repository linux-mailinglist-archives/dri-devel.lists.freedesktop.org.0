Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA0B81559
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 20:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B710E1DC;
	Wed, 17 Sep 2025 18:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3NeW4VS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581EA10E1DC;
 Wed, 17 Sep 2025 18:25:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vojSltDD3/JxV67QWyDGjFumPVyqbJzCmQId69VLoPon8MrbvV8JaYuxj3xrZQCTqAq0cs4EtgXVRjLk1jCXG1g4JFRIJJvHmscWKE5cnm0v5Mm3PrG9oOqIwOYsO5mY+IqfUV8fqiWhPDhR1dMwkn8REfvUCa0dplmX8XDSkUxZvbiWqP9+Uv23n5fAILRqDXzVVufNvnPBOI5sUV21ktdDEOEh4dJWa7+5gTELN3bhPNoRRzTRxmgzDMh6nxYH2yCNYYQGX2C3b7LbPGywlFKcUfBvCxS4G/bkTySPjaHYQOWDyeYIlQQLbgvRqaJuLKpNb0EwXiozGu5QuR4oDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIOv+0r21u22TqwglCCsGP8vWWDw9Aa7cqzmgHDR/JA=;
 b=oF6hmU2td+eZOnBkk8XWOeHqKhC5DeQtRRnekBgT7zvV7SUcvULUSgvDnU3+XiebPpfewcfJZPuB4LyBLlRgT8pteon0HiSNLgrre0oCZl4yZ8lZ6SVjimcEqlurXF3MzoLNqFnfsX/hYopNmiLMKWdtLkZwOmzpB80uuI5OYixeH4hvQfGpiHhTb4htHtwYfmDhrcWKLflP+YFC3JVBuKENwS9b6OJaOLQsFGXIgz4tWy2TiTg8fOve4nwE3wmzu2vwNoGPqNftFuCAT4ZdJnZzclraFclo5EHBUBdv3F9HhIpahVSUdvpeXY4tKeREhU0KKqb3CT2NUJhquogsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIOv+0r21u22TqwglCCsGP8vWWDw9Aa7cqzmgHDR/JA=;
 b=3NeW4VS5BzXFEEleM72/oMn/Bnz1JpUIzaXDmWDd9lNvEYoB9+GlUGUIwT1podu9IuwoF2ADTaHkzEjC2QZtAO3nv1g4HLLl83BtoS7NDGIaYQAhG3raYztF7Jw7nFljoJbMEzDEDsPZuBSZo7rpD+b8g6Qn4L6QLNTvnY4Fv6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7148.namprd12.prod.outlook.com (2603:10b6:930:5c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 17 Sep
 2025 18:25:26 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 18:25:26 +0000
Message-ID: <f782159b-ad3f-4d0c-8476-50a701bf29e6@amd.com>
Date: Wed, 17 Sep 2025 14:25:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Use kmalloc_array() instead of kmalloc()
To: Rahul Kumar <rk0006818@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20250916092949.4118999-1-rk0006818@gmail.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20250916092949.4118999-1-rk0006818@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0354.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 566da2e6-34d8-4150-ca4e-08ddf617927c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjBrek1oVE1Pa3ZxaVhWQzZzWUV1cGdneHQ0Uk5CVmxhRjhjZ3FuWVdYUUxa?=
 =?utf-8?B?QVFmN3FQRG9QMDRwR28ybTdvMmxVLzVuR0VSclhvaVJXK1RURmdqTkthME9P?=
 =?utf-8?B?VWV6akhLbTk3NlMxQUR2UEJ0Y0dWZEJ2Ty9tNW80cUZZSmNhdEszakRkaFpj?=
 =?utf-8?B?eXkvcnlxektVOWl0amt6Skx0TWk2M2pqZkVIMjFQVXJjeC9GcDV3bC94amdJ?=
 =?utf-8?B?RjJzVi95Q2xRSlgvU0tlTEVFbnFEMTIzUllyKy82VTYrS0Niek4wZEpVTFFQ?=
 =?utf-8?B?OC9KVEgrK2VnQURLOVFQY3d0V3hxU0dta082ZDZtaW5NVFJ1MFhMOHVDcWRn?=
 =?utf-8?B?SjJ6RVdSbThLMFpxbUxZVXRuUXBRSTR1Z3hwZEo2MW9MalBxSDdaSDM0VUQy?=
 =?utf-8?B?eHZmYm5rR1lhMVdsd0RFcVZCWHhjRXdmcTN0RkNBeVlnVS9pZTBGV1Q0Q29t?=
 =?utf-8?B?aENwWVN2dVNjUVR2VlpxSS92QkVUTG56OW9JbVd5a241OFRKeFN3WGtWQWF2?=
 =?utf-8?B?bjZoODF6MnpzQWlFY1pLRXByZHZVbWJGcnlBT0h6aXZnbXYzWG0xek5ocWFE?=
 =?utf-8?B?aXNWZXRLZE00TXZKQjZ6UUtLTEVabEpFb05wSDd2RmRzSnBCZ3AzN0FzWk56?=
 =?utf-8?B?c1ZVeUhuZndHYWp1MkowUjU0L2g2c2VmWXlTWFNtZkFlSzUzdFpxV0lEVllF?=
 =?utf-8?B?TzVSVkg3ekduY0E3R1IxWXo3dWdobUN1bEpqaHdsUHpVM3g4T2FnaktQKzcx?=
 =?utf-8?B?RjZlb1FBeTFxeFpuSkRkSnJmVWgxajhhYnZYVDhWdUxiL1E1RzFud0x1ZDZG?=
 =?utf-8?B?a0FBNDBaVHp5N0ovbVJNUVhUZ2YvVEI0b3ArOWxDdUxXckMxRDFoaWg3SnE1?=
 =?utf-8?B?cVlnZzB1NjV0R1Y2dENWTmltZ0xEbnRucjVPaG9ib1pDdVRGVmpqZ0ZlMGRw?=
 =?utf-8?B?cmdKWUhFMC9NQ1Q1MWkwRWRkcm1NenkrVXhXd0FQOE5tUDJVeEk4cjBQbk84?=
 =?utf-8?B?NGZVWDBRL3hnQ2VGM2ZIenI5MG9VZTJMS1M5L3JLRE96dHhzSWhwRmpsOWIx?=
 =?utf-8?B?QWJibnVXN2IxQVFJQmRhMXpKSy9ITGJJZGVWRUJvdnk1a3RZN202NmlQRnl5?=
 =?utf-8?B?dk4yclZxK3MwNEdkNmtUOTdLK1Y1VmZTQW5NT3hTdXhxSVd0NGtxcGtYbGNI?=
 =?utf-8?B?YUhjNUpkek9HSnBxeTR3aU4wSjNLanpqT2xKQTVoZXVOWlNpSkJrTkVqa0U2?=
 =?utf-8?B?NmNQS2hrZG5JVlJacDdHQTVvangrcEVsUEN4T1pSNE9LMHpMKzlsT3l5SGhj?=
 =?utf-8?B?V2FNZ0cxVWdaMS9qbGthWmI5TTZTeUdobUNJSGI0Q2VDeDh1em0vU1M4N2hr?=
 =?utf-8?B?cXYveExTbzNtR1VwbFdSeWhSOG9NSUFzZW9vR3Z3VWlNZVJ0TnUrQzFYeDBp?=
 =?utf-8?B?WlJzV3hpNnlNWUYyY21DV0Q4R0pEN3NOcXByMGlPQ0NLcy9vWWM0NVpBaFpD?=
 =?utf-8?B?anc1ZGNaczRHc1k1YkpmaHFYeG9DbFZQaDlaQjV1MkFhZDcrUU1uNGU4b0JQ?=
 =?utf-8?B?QUhnQnErTkVWRWNzT3M0UUkrV2RRdlVpMG1zeEhCK3d1NngyRnJtTHJKK05P?=
 =?utf-8?B?N1pVaGc5TXdnUmZlaHNSWnJWQStRK3V0RGw4dlJHY05VVG9QaGtJV0xobVNS?=
 =?utf-8?B?WUFzd2dWVE9tN3dyemxucXVKOXNNZDVmaWVVNHNMUXAvRHRMblVMSG9XQXZu?=
 =?utf-8?B?cU1TejlkMUpId2o0N2xvVXZOb2FjYjJZZzFUTnBLUWZmNXM5RXc4NmVrQnpD?=
 =?utf-8?B?d3FaOVVhaHM2N1JqN2tURXZURHN0ZmhlWS8xY28rYUFsRUhlWndtNFpyYkZH?=
 =?utf-8?B?Yi93UlZHeGR4aERxQ01hbHJaWTFxdThnWXpnQjVlKzF0ZUhNUDZ4MjFLcnRM?=
 =?utf-8?Q?PNm+zVlcN6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG1oWWsvRWhNRE5HVXNjZERZZkpkT3pURlFRdmdYQW1qQmJza3BjYWYxa1hN?=
 =?utf-8?B?K3p4S1k0ajl2OUFNbEhCSk9SRmFRRDdCS1hsdE4wYkE1M2Y1TnR0RTI5UTRE?=
 =?utf-8?B?SkNWL0wwYWZYY0VIM2g0WnNlL29LZEZwaHViUmRYUExwRVVEdVk3TjRHcGNt?=
 =?utf-8?B?dkxTZGNNNU9uZFpEMjhLTXhGY1V0cTB5RFVDaDcyUHNZTFJxTjZscTl0OVUz?=
 =?utf-8?B?QTlRY2NBRkVVd1prampFcEtjVVZGYWV1bURaeCtUd01LSXJkaGZTNUR5bUg0?=
 =?utf-8?B?Wm44N01RS2ZzL3NuM2R0R0hicFFPRVpDMjdQaHBOZ2FPS0x5VkJTVHg1WC9t?=
 =?utf-8?B?N2NuRUxmVmxldGR6bHFYVDBtdERKVms2MjhvNTljK1hNTnB5QjMyci9saGQy?=
 =?utf-8?B?M2cxaC9LUUs1YjVHWnBtR0RlWXhwLzFpdkFKMkI3emF1cTI4cVBCZVcvdDBt?=
 =?utf-8?B?bjVlN2prL205WG1mWlhLaWtjTFZqZDE4a3JGSWkwZGh1ZlI1aFZ5TlBOTXo3?=
 =?utf-8?B?WVRwVm9QSVduOW9mZW00eGw4eFBSSFFOQzgxeHNjRVhqU3VXZDd5aFZneEpN?=
 =?utf-8?B?Q0kzc0tLanRacUNXTmtOV3lmQi93M1l1UCtPaGRYSmdPSU00YSs0QWZhdmlZ?=
 =?utf-8?B?djd3dkQ1dnZmUVFMMi85TGc5ekM3RWhOb2hYSm5pcm4vV0ViZ21PaDQreStD?=
 =?utf-8?B?dnFxaXFDSXhvVzlySVM2c0xZTndHeXhCcFNuQlRJWHdLdFQ5NjE3Vm43dlpO?=
 =?utf-8?B?RlRyUDdUam1pQVlZaUNibjZzL1ZxREtETjhHMWlXMExvZ1FGWHJXekRTK09n?=
 =?utf-8?B?L3ZiRjJFeHQvdXcrRC9KZnRPMEpOT0ZUOTYreC9sMkI4Zm5ybzl2OCtCc1FB?=
 =?utf-8?B?aVM5WFgrVThkbllLWE1HRWhGbEZiNmNSRHJBa0Qyb21UQ1hqZjRidkdnN2ts?=
 =?utf-8?B?QTl0TW9CQ1JlV2V6TVZXL0ZjKzluQ2Q2eEY1TFdPbVUrREFzK0VEcVQrZzZx?=
 =?utf-8?B?MThXNU1Mai9PUmgzMEMxUGxSQjJlN21paFJzci9zbzF1SnJMOWVvQXNhSng4?=
 =?utf-8?B?ODZaV1ZubWJ6OUo2R0hDRmkydU5QZFNwNXRzRHZEVFB5akJWVWI3NFM3T1RZ?=
 =?utf-8?B?NTZUdUhrdFFXSEZCZjBXZExUZWc4dXlhQ0dYKzI3SGZUTUlBQlhzc2ZXaGR4?=
 =?utf-8?B?cndjYU5HRFlmK1NwVkZpTmsvZDJKcE15d0JFcm1UOGJ1L0crNnQwQTYvREJ0?=
 =?utf-8?B?L0NYOXdZNTRhZ3hjK0Fkby9oR0p5RTZDSmpETUZ0UGp5Nnd0WXdqZHE5RXRk?=
 =?utf-8?B?VVd0c1VHTzBtWTlybHh1MmN4d2NYUGV4bW1xQ1NGQzJRTThUUGJoZDlFb1A3?=
 =?utf-8?B?VmEvTnRYOWM5Y1RuenVjSm1vbkNZYkhWNFNGUDVCNUhpQjRHbU1MQ2xnclNQ?=
 =?utf-8?B?VUtsam5ZMnBPT0VJRjRZT0FraW55L0pyQzUya1o2NnpNQjQ3ZzdXTkF2dWNx?=
 =?utf-8?B?UGVZTnc2UEtKUnR3UFNscHNGZ1JUZmpvZzM0SjVjOXJ5S0psUWJnSitUa3B5?=
 =?utf-8?B?enU4QnRoVUZZbnhsM3VBdTg4NUVoa2o3NXB4dExsSDBINmUzclVrTnpocXBU?=
 =?utf-8?B?enMxcitxUGZVNE9DOXRWSXJuVWxJRHZQdDdqZW5BNGhsSlBmb0gzUUVVRzIv?=
 =?utf-8?B?TkJienhuR2EzMGV2RER5Ym50WUh1dHRWV2NES0tHNGNuRTBKUG9OM3hlS3ND?=
 =?utf-8?B?NjZTRnpGZDY2anIxYktyQkd1bE5qMVBjMmc1OFdCdU9jdlVJbFhYdTRaRjNr?=
 =?utf-8?B?dUwyOE5Fd21wLzNDRTkzTklDUEJLVTFHWnhtWW8yeitDUnY3M0tpeTN0ajdP?=
 =?utf-8?B?cnhUWm5mYk40Tk1aZzN1RWhwUVNxT1drc2RlL2JDNlFZclRQbTdkdVRKeDdy?=
 =?utf-8?B?SnIrQnh1SXA1Y2lSbzQ4d21GelNRQ2o5R005NkhmZ0NWRHcxZ0l5YSswYzRr?=
 =?utf-8?B?c01BTzBKY2xoanRZK0VBajZhYlRZS1hjTTBocERSU2daMWt2SjQ5QzlCL2x0?=
 =?utf-8?B?ZTV0emlJQ1FsRGllVXR3UXZGa0QvWWF3N21QWXY4YWZMTHVydGpGZTR4bXN4?=
 =?utf-8?Q?e6Hh7Ni+QZndV/Y7kJ2qsdJwf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566da2e6-34d8-4150-ca4e-08ddf617927c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 18:25:26.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHyjcSKDR0rplneTFwwW4FbBeptEmUIJUW8LXqA9iahn9Eyf4l2iDgWzwGfiiqfT0sSO28o0esIOHsVZyxTc2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7148
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

On 2025-09-16 05:29, Rahul Kumar wrote:
> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
>
> Replace kmalloc() with kmalloc_array() in amdgpu_amdkfd_gfx_v10.c
> to make the intended allocation size clearer and avoid potential
> overflow issues.
>
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

The patch looks good to me. Looks like this got fixed in GFX9 and older 
but that didn't make it into GFX10 and newer implementations that were 
probably on some internal branch at the time. For the sake of 
completeness and consistency the same fix should be applied to 
amdgpu_amdkfd_gfx_v10_3.c, amdgpu_amdkfd_gfx_v11.c and 
amdgpu_amdkfd_gfx_v12.c. Can you send an updated patch that includes 
them as well?

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 04ef0ca10541..0239114fb6c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -352,7 +352,7 @@ static int kgd_hqd_dump(struct amdgpu_device *adev,
>   		(*dump)[i++][1] = RREG32_SOC15_IP(GC, addr);		\
>   	} while (0)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
> @@ -449,7 +449,7 @@ static int kgd_hqd_sdma_dump(struct amdgpu_device *adev,
>   #undef HQD_N_REGS
>   #define HQD_N_REGS (19+6+7+10)
>   
> -	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
> +	*dump = kmalloc_array(HQD_N_REGS, sizeof(**dump), GFP_KERNEL);
>   	if (*dump == NULL)
>   		return -ENOMEM;
>   
