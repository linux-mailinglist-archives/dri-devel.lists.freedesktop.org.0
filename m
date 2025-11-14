Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97EC5F4D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8E10EB29;
	Fri, 14 Nov 2025 20:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ktYo40aO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416310EB25;
 Fri, 14 Nov 2025 20:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaEeebHvotkXOKIWkszRWhs6osuzVHUo3NmxkblzYReScMQfAh7oGkTa8c0o1PO1UnUqMSvrQOhVC3hhukMLlurRsPgXCBzT/cP0y/DvQFuYTQFDd5m0u+cwkOCfD7pqr5rgMte9AqCfU4WFd5kS+jeNUFT/6pWVXsKkQROY387JI548HAKG6CNnkw8Ix0EcuCdGXbPMszJdIup3FNsxCsxxVRf+WfEQFpXsDGmF3amsytFxr80j5HegKkzYePI6rJMqd/R7fe4zo8hS1gs869gOcUN5dLOJyL0u1u3A90//o4YzzFk2BCoEG3EByxUy/8KG5Sp43lO4TpLRqYLPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNz7buGAX438Dmyxin1S1mh/EHLgaPha7ntSuXo/deo=;
 b=BXef9VdhrwD+sAdPyGZuV0LvkmDDHR83V3K7BfpRkhAm5FhExA3VEP90xtKaQ+1btZw0hDdc0cersVgvMcpuoI8Uzwh7f4DtF6aplaX5Z1qwdnMLk26jGcrdXuA6abKHzyFuDn+dPN7arRJkisoiw2wXasSPN06ebl1ct1+QO0ShO9NDY0MIu43Z+1rinHppuW8pf+FjW7IepMs+oVRZTi/Hkal5ymEcgTc0bWbbPN+8j9t9xIey+s8EL+Wa88iFWzKxbJwi+iDI1wgc0IcT8/uwtsYhI1xeZtX2HiP04mn5qpSlKsKvB/jGqNjr+o3UNTUheyQUgEqA2Yru0W3f3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNz7buGAX438Dmyxin1S1mh/EHLgaPha7ntSuXo/deo=;
 b=ktYo40aOPkUqiOXb+pCqT0cxgRaD4yiOvPcAEjlKQ4LPJfh9G7Znq4CL7wtNAoXwNx2x7Jk5MYwKQcFQ10rXVUE4ARCgEzpnNykSIzpP10gdgao0cLZWe0YMaRdEmX2GECp87XN52PJJDwah/uUE63EzBYQ1dEEyje4AiWfgk3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB7613.namprd12.prod.outlook.com (2603:10b6:208:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 20:57:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 20:57:56 +0000
Message-ID: <fd48d626-39db-4e83-b2ed-5b9c3f765646@amd.com>
Date: Fri, 14 Nov 2025 15:57:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/20] drm/amdgpu: use TTM_NUM_MOVE_FENCES when
 reserving fences
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-13-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251113160632.5889-13-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 9538eeff-83c9-4164-efee-08de23c07c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHNhRlB1WUdzYTFOTUl2OHlwRzlaODJML3FoQzZXUG1lQ1pERFpBRUp2QlZZ?=
 =?utf-8?B?QlQvdlZVUTdHWDlhc3ZTVjRhRWVpc2NnaVBjZExxU0lKRVRudEI0SHlJbTA2?=
 =?utf-8?B?c28vVzRWWi96UkNUUHQ2bCtZSThMSGwyWkJ0eEVSOWhKVG5yb1d0NTJXVVl5?=
 =?utf-8?B?eTJrbzFGbk9IUVkvanhoQXFNaHRNTFNCSXJHTDhYMXZ5aWt6RHZwMkNnZnBL?=
 =?utf-8?B?c0ZNeHlFVVNOWGNFcUo4RzBoVFVuZzZTTnF4eWE5RUNaSXk0UDFRTFBhYnQ3?=
 =?utf-8?B?cmhHUXczRTVSdlVvbUZ1WlQzeWYxY3UybFlhbkJRMCt5QjB5bjRiOWJiZ3Zt?=
 =?utf-8?B?RUdETDhNMUxUNlVrd1lRUnVZTVJMZW5mR0dzN1haem5UeGsxb0FGMVpGanUz?=
 =?utf-8?B?WkRKbmt4alU0V2pZSVNPMDhkYmROQ3MremVuTzlEeSthdS9nbGYvUHJKYVZ6?=
 =?utf-8?B?VUJUanBsSm9zUWdUZzh4WUpYMnoydEtoUVJFdTdBOVdIZDNWUW1aK2ZGUVZk?=
 =?utf-8?B?eWV2UEdLMHVCalpwMjlWazlVb1pLdWdZYkVGRmtpcnVabVpwVjRTRmw2SE5V?=
 =?utf-8?B?MjdtSnpIbHJWa2FCdTRYdEJKRlF3Q21TMUlMNktDVlNIOThNbG1Ba3NQbjZv?=
 =?utf-8?B?UGhBNGxmL2wvUHcwY3lOeUFwbTlTc0RBV1MzTnM2cStrWTNUZ3dIMWdxSUhR?=
 =?utf-8?B?R1A0TUUydUVNT2NLbytpeG9IRGpGaEg2d1R0SHdVNDZ0eG1TU0ZrdGhsNG1D?=
 =?utf-8?B?b3p1QlJkQVk3aVRKa3Y5YVNjSDZ3OGhsTXBDU2kxOWl3TUUzSS9hQlR3MVgy?=
 =?utf-8?B?RUliVWoxZ25DVXpmR21ENDgyQ3JhTGVsSGg0b1RlUlNpbVJtTnU2ek1JVjBL?=
 =?utf-8?B?TVdVVHg4Q2F6S3JHanoxWTFaZm5LcG45cUN1WUt1MVZBUVhsTWNXZ2NSNWNY?=
 =?utf-8?B?dithWFBydUpzM0FrT3VpemtKUWZwc2s2OFB3eFMxWDcveVR6amRLa1B4aWdz?=
 =?utf-8?B?YjRERERqdkg0QkxGdFdyVTlvREJJbjlYRTdwN0wvNGVCS05PcWQ3QzlOMjlR?=
 =?utf-8?B?anY2bVlXS29Qd2poQ1RIdnVoKzJLUjBWTUVDWjFUMGp1WEYzdGFKT3FpUUw2?=
 =?utf-8?B?SnNnNkdmemE2VUxhMER5ZVM2RFo4SDVuTU9TSm1sLzdVK3BkbzNob0d3UFMy?=
 =?utf-8?B?c2tiQ0hDOWwzcjE1WXBuY1NlbGhXazVoc0RsUEcydzZIUC9oMVk1ZUJaWTN6?=
 =?utf-8?B?cDdVWGM2R0V0aTRLMm13STErZ3RocG1ZREc3dUt4M2FEcHZhQTRCYXM5L3or?=
 =?utf-8?B?blk3VU16dXhDWkVma3J6Rmxld2l5bHRxVHhYa3RlWHVIdGVBQWV6dU5KdTdk?=
 =?utf-8?B?VXVtSzJBeEV3UlNYZ3Jqdzc4cmg2QXFUZ1RURWowblJmdng1akFjL3UvNi9K?=
 =?utf-8?B?OWZaS1dMTG9QaW1sbGRtYVY4QlVGRnNlQ2FrYlBMZ2NEMGw0N0p3K3ZERnc2?=
 =?utf-8?B?WEd6OGpDc3dYMThxWVlzam5Sc1VpQ055ODVaamIyVlNkcjBXT2ZuZDRJQkk5?=
 =?utf-8?B?OWFNdG1kOGc3Z3Vzbis5Z25nRENjNTlLZER3cGcrbzY0S1BKbk5SNUdKMUdH?=
 =?utf-8?B?d0p0QU9peXBnbXpkdUJMbjd3NFl1S1dnb2d0alBiaEEreW0zUHp3TlZXS3Az?=
 =?utf-8?B?ZXNYYnZZYThBVlNvdUFyenZjeXpKcjlJQ09ldmMzQ21SRVJhUW44a0huTmRD?=
 =?utf-8?B?WXNNL2gwTUo3aCswY0NJeXlyVFhpWllEcW8vSUkzeFpXM1dRUDBFT2MxR1Fu?=
 =?utf-8?B?RG5FanA4TytSR3p1VFUvNUlubkZNOVhWUXl0amFtZXM2SWdhZ0FScWJIMUEv?=
 =?utf-8?B?OFkwSG9WQkw3NnpkNmRjK2pEdXFsbGUxM1c2b3FGNTdDQ3JxQW1FTmVpdDAy?=
 =?utf-8?Q?akuNM14pLq07vjWklW6yy2F1aru2GZJG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJ1eE1sUjBxNStnZXRBT0NMKzlTRkVtZXZUZnNtelBCWERtUi9Qa3FHZ25z?=
 =?utf-8?B?eVJSR1YvQmhESFA5Y0VHbGhHOFZZUTJaT3VQcW5VUUQ0eUxOMnhBRCtnbE4w?=
 =?utf-8?B?ZTU4T1NnMmZpWm1KdDFMaThYL0ZWdWtQQmxnWmFaVCtEVFRLMTBZQzh1dzhP?=
 =?utf-8?B?WFh2M1dMUFV5Q0JZdUdLRnJwZlJOellleStydXpBSFZ1SFc3Um5ZLzhIbjFl?=
 =?utf-8?B?S3Fmbk1iMnRncFJzZXE5M1V5b1VpYmRXQVRhK1ZFRzAzZFFnd1FwNTUwVFND?=
 =?utf-8?B?U2tQWTBtTHhRQmdDdGt0YndxNkNtK0NSM3k4bkFiQ1ptckhZOU5QWjNzeDUr?=
 =?utf-8?B?OFc4aWp3RDFOYi9NZTVPRm4wdFg1azgybEptaC81UlJVa0tmTi9uZlQvYmJ3?=
 =?utf-8?B?WUU3RWhQWGpCcDFaOERJYklLQ2diYnlRblRoeVhXK3pkTHdzTi9RRjhVVk9V?=
 =?utf-8?B?cmxjaHJLL080dzFqUExSaCt6MWt5bHF1MnVpYU0zR3pUTjMxcHBlR2FzbW9x?=
 =?utf-8?B?N2xsRzdKN1g3YTRkZ0JMQWRQMXZ6c1RnWFJMZzlvdjlZZVV6WW5RMmV1N0Zl?=
 =?utf-8?B?V0VKNEwwQzZOZllDWHJHTG9DcEVYVTFpQUJUbSt0WUpEYmY1N0RseEJJajlj?=
 =?utf-8?B?b2wwQnlsTlR3NjBjU09EcW8walFpQnZkNVV6OU92bUdhMjVIdXMwbTFNNlQ3?=
 =?utf-8?B?MnJDZlpHZm1QWU5KTTZxaStJWUs0bWpBVEZJK1J1b21QMEp3Mk1mQk9jVVpw?=
 =?utf-8?B?OHJFWmNBd1J2cEFKMWUwY0h3Wk9xK1BQOFd5bW5teG44RVplTUx1V0trNlVB?=
 =?utf-8?B?NVdZYXQya3Q4TzU3KzR4bDdQenAyOUtKODJlc1dDWnhTQmFmWGNKUkdPMGNy?=
 =?utf-8?B?b0Exb3FuZnJuT2dPcldIQitzS2ZZRDV1M3VHWDloTkhtaHlRSkFvQmFPeG1S?=
 =?utf-8?B?SENIK1JWa3VXdy91Snd6UW9NQTlxcDZ2ZXZBeEJ1VUh2RG1ueFZ3Z09JS2l6?=
 =?utf-8?B?YlBTMXhndGRTRkZlRDIzTFFzdDVGeW9meWw3T1BmVWp6bUFGanpNNE5VQVl6?=
 =?utf-8?B?RVhpMmRseTQyaHdkMUlmSTZ1ME5EOW12eEt5UmNkRU4vR29jWXdHL09Td1BO?=
 =?utf-8?B?Q1J4c2s0Kzhtd0NyQ3FRK3Q1djlwbkFHaXM1OXN6VC9HNXcwMXZzWFo2UEJo?=
 =?utf-8?B?cUpsWXkxTmd1Y0NLY3FDQ040aHpMMmhzaERLR1JyRVZxUmtDb2V2SzVEek51?=
 =?utf-8?B?ODZCUmV1WUttemtGOE4zQmZ2bjZzeUVlMnF0bmZCL056L2lOZk51TTljNVN4?=
 =?utf-8?B?MG42S21RRkZmbjNJcVA5SzlqZm92ejF4RldlMHVUb3lCc1NzRCs1QS9veEx2?=
 =?utf-8?B?L1pJK0MrTThNbzdvOFVlcmZVVGFrcFRQZFRQalNPaE52Mjd4YmkzM29XVGJZ?=
 =?utf-8?B?NzZHZjRwZDhEYWRpc29TRDlWblhoUHNMY0t1N0liNS8xVnlYR25odTFSd0Fp?=
 =?utf-8?B?ZkRmbGpzKytudTdQcmVRN0dyQVkrOXNxTXRBTXFZWEJCT3QzRkZxWGFJSXE5?=
 =?utf-8?B?ZDBPSkliNVNnbDkydlFKR3B4Qm5rNmhIWXh0cUJSaXJkc1BoUFZSK3BmYVlR?=
 =?utf-8?B?d2w2bWF5U3BNZG56SVNabmgwM2VCMEtadFhNd2c0NnVuekJ3ZnUyN1ZOeTJG?=
 =?utf-8?B?OGdVTXVWNTh1SnlyN2U4NE9OOFN1WnVWWTVQclpwbEwrUGRwN0xXK05Pdk9Y?=
 =?utf-8?B?UjFkcEpHNi82WXI1V09YQjlTTVdSL0taSytjQm9RR2huZEhKRGFvQWZPcEFj?=
 =?utf-8?B?RGhoT2l2U2hJYm5LQ054dHBkR1pxQk90RlRETzRTQ1FHUTBRYUJObUsrUkdZ?=
 =?utf-8?B?Z0xCN2djSkZObEhqT2tPcDhiZVdISTBZZ05sQ3MvcUdnaUx4aWVIV05LMm9O?=
 =?utf-8?B?MUxUTlpROXZ2Rkh3NFpBSE1taFRtVnRDcmpxNkdta3N4NCtVakltaGFXM1hh?=
 =?utf-8?B?YlZyUU85NnJyczdpbE5COGIyTjJPRzY2TGlHNGwxY1o5N3RPUTZvMUYzbGJn?=
 =?utf-8?B?c2hjYWlUZTRraFNoblJMVURCeVNxbmJaY3V1QVNBN3ZXYjZ0SmpSRVgyZ2lI?=
 =?utf-8?Q?XsgAu2hP/YGXUcD+6euCtg2IC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9538eeff-83c9-4164-efee-08de23c07c65
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:57:56.2863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLe+Y12NVbEMGO00RTokPFjQIueyT83yd2oFc50Cp/ELn48c2BOaBbqgy7MmiLxOKwxzyfPv+nRcIAxJ+zmZBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7613
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

On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
> Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
> ttm might need to deal with moves/evictions.
>
> ---
> v2: removed drm_err calls
> ---
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
>   7 files changed, 12 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index ecdfe6cb36cc..0338522761bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   			goto out_free_user_pages;
>   
>   		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			/* One fence for TTM and one for each CS job */
>   			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>   			drm_exec_retry_on_contention(&p->exec);
>   			if (unlikely(r))
>   				goto out_free_user_pages;
> @@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   
>   		if (p->uf_bo) {
>   			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>   			drm_exec_retry_on_contention(&p->exec);
>   			if (unlikely(r))
>   				goto out_free_user_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index ce073e894584..2fe6899f6344 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -353,7 +353,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   
>   	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>   	drm_exec_until_all_locked(&exec) {
> -		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
> +		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_NUM_MOVE_FENCES);
>   		drm_exec_retry_on_contention(&exec);
>   		if (unlikely(r))
>   			goto out_unlock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 79bad9cbe2ab..b92561eea3da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -326,11 +326,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>   		return r;
>   	}
>   
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>   		goto error_unlock;
> -	}
>   
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>   		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 2f8e83f840a8..aaa44199e9f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2630,7 +2630,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	}
>   
>   	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
> -	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
> +				    TTM_NUM_MOVE_FENCES);
>   	if (r)
>   		goto error_free_root;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index ffb7b36e577c..968cef1cbea6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -627,9 +627,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
>   		}
>   	}
>   
> -	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
>   	if (r) {
> -		pr_debug("failed %d to reserve bo\n", r);
>   		amdgpu_bo_unreserve(bo);
>   		goto reserve_bo_failed;
>   	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..ceb55dd183ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
>   		return r;
>   	}
>   
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>   		goto error_unlock;
> -	}
>   
>   	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>   		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index d9527c05fc87..110f0173eee6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
>   		return r;
>   	}
>   
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>   		goto error_unlock;
> -	}
>   
>   	domain = amdgpu_display_supported_domains(adev, rbo->flags);
>   
