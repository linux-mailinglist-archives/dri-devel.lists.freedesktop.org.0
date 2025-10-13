Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5ACBD3291
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 15:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6CE10E3B5;
	Mon, 13 Oct 2025 13:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qCEHFtC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3D310E0F2;
 Mon, 13 Oct 2025 13:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4eABccInr4puQI/OiCP3xStkSIn8JJpsKdgDyh01pNiCyUkopAIc0bYSsBgqIRVoPQ4BaO2MryA85k+3cwap/2P7wPxWgNUkcoSeoyP/Nci42OQoCkc+jq+AFmFpqKovWmaJcAi6dZrhIGa0tB8nEtDH1izlJ5ej2l41gPf2l+EsgTQAIeS2xavvEG+TjJE76/7tv0ZsTdzpE1CWGHh57f3wVyJ/mLm4feKql6EHVSd6a7+NNm0hufJImIunitn2dTSmotlfdqtlDLGONhA9+A0wg7lxSIjoLv1Uestz11wK7ZJqJ9f99SGN+khnAzxEyC6o8pwUSQusD5TiAjd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loDDiJdZRwzOe5UCL2cPSbNr2uZLVzq1RbifHA/9DA8=;
 b=eJAGPdf84eqs8LRSbmt65/jLOF4Bp2n1q/XoYUWuNxdNFe6w3LFWg4y29KcIZEb1HoxWt7iFhIlPF9hFWFw702mB8ggYQkieNSq7t/CotDbp7n8+54jL+Ie0zWYe9zJgK1/oeJgHivh76lNMsrCn6e3XpQC3wSZI2Eqns1xnYTxWXMaDcynoM6Popl3DCf/zPejg8PaNbY7iqP1uQI3l2E/xTbTeEWU/fyz+dokPmCCNrYfiBKbwR1kICWFK2JwUFsasVxV87qa9nUFSqG/EfwJjTRwtEIWihGLlnhRvBwL6NPN5/kZ7F+L2wpkkYxOD3xDTqu9ox7uNOBMD/5unwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loDDiJdZRwzOe5UCL2cPSbNr2uZLVzq1RbifHA/9DA8=;
 b=qCEHFtC+CYXdx6TmOZ1/GuPS1R0pQpNYp8Th19Wy2oK/f4/OrExum5OvO6EUhxhBxVpoIdMDG3OUIujGfVNVOzWCbg3sJOozdNj+bMSMZ8C3qlkTNZw8wq7M6fCPyaMtAlXD+ykywUNtMJDWbIncCCZUA58RtAENlpqXjGhMob0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 13:18:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 13:18:11 +0000
Message-ID: <8ec09842-563e-4879-b505-bd82ea87bae6@amd.com>
Date: Mon, 13 Oct 2025 15:18:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ttm: Add safety check for NULL man->bdev in
 ttm_resource_manager_usage
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, Lijo Lazar <lijo.lazar@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20251013085849.1735612-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251013085849.1735612-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:408:e1::25) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 808d2a53-2154-4814-38ad-08de0a5af521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUxJMXc5OGthcC9DT1FPUG9ENXVPdVFRdXZGVFhBZllvVWl1QVR3d2NDdVV4?=
 =?utf-8?B?VTFXR2NqbDc4Tyt5KzdJNWpnNkFjelhPWk8rWEdOeFBXdjJjcWZDdldadjkw?=
 =?utf-8?B?c1VNMFJ3bU9ReTFXVnRLUmUvaGlNTmQ0Tk8zUmZzM3d4S2VPeGtDODJhcndp?=
 =?utf-8?B?Ym1MWlBmY2V5V3A2KzVTYzJUZHJZdUJhTHNIY0JxMEJXcHcwWEJUQ3E5bHFM?=
 =?utf-8?B?U1hHQUpKcUl1dlhyZVc3dHk5Q0dxb3BaZXhhZDZJc1BwcjBVd2VlRklRRGZq?=
 =?utf-8?B?c3lzZkdkR2pRdm05ekxGZDM0eWZHK2VJZTdSOG93bFgvNnFCdzRsa3h0aFo5?=
 =?utf-8?B?VlpFbThUMmdGWVU2UzBIeGZleFh2YUVya2VWUGx6QnRLSWR3UkVsZUJWUUR4?=
 =?utf-8?B?UE1DY2RjNFlFR1lyVlAwYXpaMzhiS2o3ZE9Ob3RKQU92RFpwTTg1OTJ5OTM2?=
 =?utf-8?B?VjBVREFCL3BxK2o4aEd6ZUh3aHZHY210TVpHT0g5VmFFdDN5YStQbGY2d0pD?=
 =?utf-8?B?NWZwNFVCZEVISkZnRG94c25KcmYvN3pZVmVacHE1L0x2MnN4UjNrZTMxSHFY?=
 =?utf-8?B?eTQxRFRlaVJTT2NISk1SbUxtL0IyZjM3ZUJ4K1pUNG9iMTJ6L0c4a2UwL0Vk?=
 =?utf-8?B?U1RMZTU1SXpFMklmUytyL2lkYlM3UzN6UVA3KzZZLzBUNUFRMlVXR3VHRzNj?=
 =?utf-8?B?ZGkyWVpSMXZUZ3BJT2FsRTF5WjY1aHJxMzFuU0NJVVRzRjV4UXdqTHJkNFA2?=
 =?utf-8?B?M1Y3VGM0L3VvRU9JSXlVbWgwbjB2VGdFL1dzalNiWVAwRTAyVCtrYWdIQUtj?=
 =?utf-8?B?OW1mUEZ3cEs0NzFhUFdDUTM1NWgzcUlXWEJyenZKeXJpcC9QVkJqb2VidEVG?=
 =?utf-8?B?MWR5enBSSTc1VWlCakloaXBuVmRIWUFxVjNNSnc1MDRGdEo0bDh6eTNIdDZm?=
 =?utf-8?B?WUd5SDVndmNqNFlUVW1rcE5KVFJqV1ArRTJnZ0pzeTJveHRZMTdJMU5iQ20v?=
 =?utf-8?B?Sklzb2luOTJJdlFXTHMrWVRFV040SXk5M1lCOG5oZlFNMW1yVjd5TjE5QmZy?=
 =?utf-8?B?akl4MFQwdmxvMzVKajBYOXg0WjdTcFE0YU82QmN2U1o0dFhjdXNjR2VWczlw?=
 =?utf-8?B?ZE1zbFY2eENES1Z2alJFK21ka050d2IvUmdBbmpYS3FVV1RObExtWW9URnBQ?=
 =?utf-8?B?Z0EvWGdjQ2k0YnVIa3R6SU1teDUxUTVLaE1RakpCL2FSZkMzWVQrVHkydXVp?=
 =?utf-8?B?UjVZWWtwVHlrdG5FbDJadnAzZnBLYW8xVzZYTnFTSTNDZUxITUJvWnNVREx4?=
 =?utf-8?B?dmhlM1pRNlRFd0JQNFpYc20vbGtFRGZIS2JqckVycG55OWJIaFFpTnRMU2Rv?=
 =?utf-8?B?YmtGVVd3QitLbTBpOExCQ2hTQ0c5blFyeklFOGxjQ2JlS1cyNHVuMlRpRDdl?=
 =?utf-8?B?ZGhWWUN4R0lhQlR0NmZjeGlhV1A2cFMzL1FBN0FTUlNORHZ5a04xMk5FVlIw?=
 =?utf-8?B?dldLV1NoSnIvLzh0OWNpNzBRNXlqc21qT0piUHI0S2tUK3FKSnB5d2FVYmxJ?=
 =?utf-8?B?L3JKQlZ0V3dFZWpEMFVuUkNic3daaUMzUzVPSTJmSnY5RnNUYW10S2ZJbW9p?=
 =?utf-8?B?dVJQWDFKMlUydFdvUTVIL1FiWmtWbzdCTXd2M2NPUUdvdTJ1SkwxLzhDVzk2?=
 =?utf-8?B?bVN4Y2RVSXdlbXVNb1FaMkUzUTlQMHNQRmoraWdteml5YkdDdS85U3NsY0Ju?=
 =?utf-8?B?NlROY2w2VUx3NnQ2anZDK0kwdGkxM0I2WTlNeFVManFRMHhibDFYMlhNZktG?=
 =?utf-8?B?d0ZkYzRhTW8yU1I1K3ZMSHdRTVI4OVd3RDVKcStrN3dSc1laVE1SaVdXWllX?=
 =?utf-8?B?bm1hdlZMZWlBY0ZYcWtGZmppcGVXaHExenhJRGkvNGhSYTA4QVg5U3lCbGxB?=
 =?utf-8?Q?DkZkuBJHu0qNmR3GT2deVcDS1U00QNI8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1NSQzJ5b2hMU0QrakZyWitYekcvNXhSTWw3NEsyUnNjeGVOby95Skk3N1lF?=
 =?utf-8?B?L3F6WWkwMzExYWpseWdYWlIxVUQ4bHhaRTU5a25xR3lXYjJzSGdkSmVvRGZi?=
 =?utf-8?B?U3VZaHVoMHdzZDFFWFQvUjhJcStTeldScXpIUi9PMFdWbEo3TnhDSkdRK1B1?=
 =?utf-8?B?dWhpbk9rT2NHd2F3RmdEZHMrT0J1U1lWdm93N2x5WWtDTWtVNUR4blFqZFhE?=
 =?utf-8?B?RUhsayt3RDBISTJpZHNtNk1GTi95bUFyMWRRMG1FWjIvT2hhRmFyVkhDdG42?=
 =?utf-8?B?M2YzL09KUGUyeUtoMUNvRDhRNm93cmFpTGpzaHFkMHo3aWRGd1laNUtKWFVr?=
 =?utf-8?B?NEZ3N2pCVENzUjhwNnBHMVNONWw4KytCMTQ5aU9QSlBaa1E0SDNUOG1pRjhj?=
 =?utf-8?B?NUxlUHEwbms0YnFKVFF3UG82VjhCZVR2b242SnhLR0R5Y2hoUmdmRWtZUk1U?=
 =?utf-8?B?dlNpbW8wUVIrM1d4Z01hYmZwdDZaZ2hVeU9CVEYyaTFoSEszdENSZ0hhSTB0?=
 =?utf-8?B?czJJZVhLNm5pcFdzN2RpbENEUGFBUStndjlTU2JwaTlOOC9oTUFPK2k2clE2?=
 =?utf-8?B?dmxwMTBBWjhpQXFBWmFXV1M3SCtGRGNDU0ZYOFFFMnVvTk11RnI1MXN0SGlm?=
 =?utf-8?B?SFYzS2VxcG9MaWtjek0rQnVscCtkajR1TytYcVNlT0VzZW9odmdBWFFZS1FM?=
 =?utf-8?B?RG02TFYvcktqZkNYaE5PREJORW9VWFVXUjhPNEJZdzE5VjJ0RkFHVHlZZllw?=
 =?utf-8?B?NTd2NkVOYjhUSzFGaFh1MGJnbGpwUk1FMDV0WTkvdkdpMVhtVmhablRrU25Z?=
 =?utf-8?B?b3dvSFdBZVR3RU9zYjRzWHowbFVPWnlsRWFQQVFaSVpENlBhWFo1dWRpeVFs?=
 =?utf-8?B?dzd6cnZReW1CQVdBL1hGT2xVdVo5S2loVWI2TzJIRi9iM2c3OEZKSW5WQzlE?=
 =?utf-8?B?NUhEMjdtelI0YmpoaHAzaGR2b1RnaVk1MzNSMmp6Snk2b0N6NHZKLzg5YWVm?=
 =?utf-8?B?Z0xDTlVTeENYcUIwa0NZSXRONjNqMkJDVHVocktxWG83TmpQMFRLZFpqSTRt?=
 =?utf-8?B?WXg0b05PMzZqcVZyRzh2cHl2Q29XSy9HQVdwT0p4RFpyWXFacFcreURoNVND?=
 =?utf-8?B?WW05Tkg2a1Z3ZzBwTDE2Znh4a2o0R0pOQWNLNlU0ZEFORUpIR3dJVlh2NFZD?=
 =?utf-8?B?Y1BuQkUwV3pBRG9VOHdIU3QrUnlFVjRWV1dRbGkwQk5SYWlMUkN6cGtLYTJk?=
 =?utf-8?B?QWs3dnZTQUk5ZmtzZDlSYVF5UG9FY1ZiZ2FaRjYwcDN2dlVzWjVMNjhXRzdD?=
 =?utf-8?B?N3ZCUjVxRjMyYlovWmVsMk1ZRm1FaWFwUkVlUHFpVDBVYkcxWUtwLytMR3Y3?=
 =?utf-8?B?K2VpdGp3K09mS01OenlDTkk2Q1BzSi80bjZWYnp3YnI1WUZsRnd0ZG5mRGJY?=
 =?utf-8?B?OGk3cWNxTE02OTBXYkgyeCttbWluOERYMTRqVXVSaktMTU1LTW4wa0gvL01h?=
 =?utf-8?B?TmxMYVhhYnUzcGFGZjk5aWc2ZEE2b0NiY1lVQXZmKzhiQ1JWeXlvRUhZQkk0?=
 =?utf-8?B?RlIyN2dRbDlxaS9VZHE4RUdaZUVYU1BZT0t0UE5ISlRjMjFzeUxLMXl6MWtI?=
 =?utf-8?B?N2ljTDFDRUV6OU11RjJvYk41SytLS1dqSlh1Nzg3MU1KZEg5OFNlUnAyNm9m?=
 =?utf-8?B?STk5S01vNkU5MURNVytxMXA4Q3liZkUyRVhwS252UG53TjJlR1F2VnNvV2ZU?=
 =?utf-8?B?VU9tMlpuL0hiMG93eFlad3lFM0lJV3VlTk1GbWhSdEU3VGdrOGhpNlk4SW1V?=
 =?utf-8?B?Q3VuSHQ2K2xTZlZlc1ZDUG1YSlRReGkrN0E0d2YxL3VzWkFtZ0RuRTNwVzE1?=
 =?utf-8?B?L3JkaU5rUWVnaS9RdlB1dXRLTlVUbVU4RlpabFBBL3pzSWxLVWVvNVZaa1pZ?=
 =?utf-8?B?WVY4MU9SZnVmZFFkOXZNeFRQQVM0NGozR0hsZlJwZzZ4UjNLZ095NkxBdzVN?=
 =?utf-8?B?dTB0TDhNalhtZTE1VHFDaXFGSTc0Y2UvVE9nbjl4R29GNWVzRENONG1MaTJ1?=
 =?utf-8?B?UUhUVjRxUkR1K1AwUzZHcUkxVzIvcUNPdjBiUitCMUs5M1l0YUlHR1loVDFv?=
 =?utf-8?Q?9IgaYJllNnM4nDxXeLMBuWqtn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808d2a53-2154-4814-38ad-08de0a5af521
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 13:18:11.0764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YnT4OuLB2X9LtqtB6f2SQBr7M2JBAYnDelZPVq/v2GKmATKPFGEbjihHMOB0xK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
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

On 13.10.25 10:58, Jesse.Zhang wrote:
> The `ttm_resource_manager_usage()` function currently assumes `man->bdev` is non-NULL when accessing `man->bdev->lru_lock`.
> However, in scenarios where the resource manager is not fully initialized (e.g., APU platforms that lack dedicated VRAM, or incomplete manager setup),
>  `man->bdev` may remain NULL. This leads to a NULL pointer dereference when attempting to acquire the `lru_lock`, triggering kernel OOPS.
> 
> Fix this by adding an explicit safety check for `man->bdev` before accessing its members:
> - Use `WARN_ON_ONCE(!man->bdev)` to emit a one-time warning (a soft assertion) when `man->bdev` is NULL. This helps catch invalid usage patterns during debugging without breaking production workflows.
> - Return 0 immediately if `man->bdev` is NULL, as a non-initialized manager cannot have valid resource usage to report.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Suggested-by: Lijo Lazar <lijo.lazar@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

@Arun could you push this one to drm-misc-next if nobody objects?

Thanks in advance,
Christian

> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb4..d93d1bef6768 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -587,6 +587,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
>  {
>  	uint64_t usage;
>  
> +	if (WARN_ON_ONCE(!man->bdev))
> +		return 0;
> +
>  	spin_lock(&man->bdev->lru_lock);
>  	usage = man->usage;
>  	spin_unlock(&man->bdev->lru_lock);

