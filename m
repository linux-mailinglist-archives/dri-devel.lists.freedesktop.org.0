Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C6B16125
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278B10E362;
	Wed, 30 Jul 2025 13:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WhQoj4aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794B10E207;
 Wed, 30 Jul 2025 13:14:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MybZicvmz8kT2wLUe8Lx71VghjMuodmwTLRBn6fGek6VmtlRf27mLFLiLj6RGlofp9RLpyXNHEv6cJPfMGGynHdgHHaYHGExbN/1PvpB6NqdfU0ke83D/7YNznPtq44RNBDSzU4H+Ann8rtekxgLyhs4dTs/pcpfpwvFvxY0FVrYfy04B5BIqckRCLviESTLjxKOriMa4G5wFHxALdisNfRMPzAfRPA5A9bLlAa37HDzfHVZJy0UnixtYNI8NJAD1k9JVY4K1CIBURDE6Iyuij4gFZ5AdLpR2u0SXED/TZ0PUgkXe5zzUyxQ/rxVowfXy6IJyaR9JP/KDPmwZjUJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0y2tvWpptG79GnJ1NVLcMDVXNUKRrqWnJc1sGYsS51o=;
 b=vNyb5iMMip4Rhb2Zo3FthgjuqVWT5xsnIutl1ynuJecZLiqYnQI0iWOyatlJ7K4tfJVgfrOo1w1c0A8pacjS1lpUiKLE4drMvZynO4lJCyt1kSEb2zsBi+jlF4wUt80F05sD6OlN0Lqz+NBYQKTVSDzat5QMyJ3XtikxR0KQiA83pB4HkUNuCFz8VytMKySPVIZqrH+/LtY9Q4l0ZkIYTalNF7mQxEHLsuOVQTvbBe8Ru5JRZ2SWlnsRwxfEZfqz3jKEAvI0CXWsR3uRe+z2zUpJFHhLc1vF9IPKVlD4CgMBkihaKsJFIbFukhxwpeQKdhe5UAkeHHcOTyHNTL62pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0y2tvWpptG79GnJ1NVLcMDVXNUKRrqWnJc1sGYsS51o=;
 b=WhQoj4aCJBB+afs/LBu7D7BUjeObMm0c+k/UGJLCOMjh/SOi8nfdFB70XwZbcgrxqtI7KBBOCS51tYYyGzqAOr4TNi836N56ReQF8G55SejgQQdvzhb7exQV8N/rwer8YkTklX65/9811+1KkYwYF7sHHPAUdOOAKFDnGIE8P4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 13:14:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 13:14:16 +0000
Message-ID: <d3362052-cb4c-423e-8598-d1f0d3618882@amd.com>
Date: Wed, 30 Jul 2025 09:14:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com,
 xaver.hugl@kde.org, uma.shankar@intel.com
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-3-cc02ce0263dd@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250730-atomic-v2-3-cc02ce0263dd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 4199596e-7ca0-4bcb-bce8-08ddcf6afc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTNSMHdYTnVLdFNmUTJmclNjYnhBR0dZWHlzbnZHeFliVTU1dkNJUG5NUngz?=
 =?utf-8?B?NGdRWHJGOHZ4bGxwb3dVL3Zka0pJU29KU2pzdTdBNE9GNllqc0RhcVpsL3BW?=
 =?utf-8?B?WlYweUd2MU05U3BUSlNLd3d0dkp0cmpNV292QWdDVFRZMkZmbXlLVGt5elRN?=
 =?utf-8?B?cktaVkVjU3FYSmJ6Uk5USkZaMHMwa3RYTUVVdDQ1d1hobjdNSjYvR0VTTGNL?=
 =?utf-8?B?VGtCUVRXbXEybnFBTnQvNkEzeXRZQ01yS1AyT2lpcDRYV3FNK0tWc0kyQ0JR?=
 =?utf-8?B?UXhJSGlRSHhWeHpMOGhSTFJKTlg2c2hteDdBT3pVU0c1ZFdHWHFoQkE1R04z?=
 =?utf-8?B?OHVQQ09iQVZHb0E0TjZBdmg1V0lTLzVGZ1pNa1RyN05iUXA4bVZZa254cXpR?=
 =?utf-8?B?d1A2TGtHSXNIUGJYQ1dwOHhtMnhrTFF2c1Q0UUNPMzZjd1ZTSEU5cC9wdjd0?=
 =?utf-8?B?QzA4dzkyd0tmN0VoNGR4dXJHbWUvazA1aWplaG1FSmNPQW5kUkhMU0VHYUo1?=
 =?utf-8?B?NDNaK1FWR1IzbkQ1SnpiZ0oxYlpGRHp4bU4xRWNkZnRnTlpqKzBFdFRYaGNv?=
 =?utf-8?B?dGlUd3lJbjh3cDBGQXlZRVhlZDBENHN0OThrNGxlS0VqekM1Q0lxalBkeVBM?=
 =?utf-8?B?YUozb2g4M1FGbUc3ZkRET3ZsUlZGcFB3YUpSNXFtTlZiU201WExTVWNONEFV?=
 =?utf-8?B?WFQxRXRScDFCL3d2dHRyc3hkT3BQWCtEQVJ0ZXM3VDVtTjFjQjdoNCtreUNo?=
 =?utf-8?B?N1NFL2xSYy9BY3ZKcUhOYjkrSHYyVEpTM0RmblliOS80SE0yc21rcVY0MmQ0?=
 =?utf-8?B?NkEyYThRalgvbmVxR053S2cvcjZVRnpkemFVZTJITnVUWTFoMm1uSkFUK2RD?=
 =?utf-8?B?d3dQYWEwN25HZGZaOVA5R1lDUVFxV0liRThvUXJ1WWhvQUV0SnluS3BJUjAw?=
 =?utf-8?B?WG5mQ2Z3M2lJdy9oQnpYMGhjYWpyMjhvbkxlZWp4aW1TZWdUWUMvTGttNHAx?=
 =?utf-8?B?cWlUeHB2eTZ3aTFUUmV3ZjRKSjV5UU9EN0NZL242bWg4cUNaeUFtNXFLRks4?=
 =?utf-8?B?TGY0SktZRnNNcjVYbW5rekw0dzU0OHUrZWg4MjlYMHhmdWhSRkt1QTI5K3hS?=
 =?utf-8?B?ckpZYmxqMzFIazVTK0V5YXpsa1NKeWRBRDkzOWxqUzdFRU5LdCtzL2RUYjgy?=
 =?utf-8?B?V3BOeW9PbDdiRzRWaEhHaWVUc29OdHZ1dzNxNGp2Zko1YVk5em9sSU5TNDRY?=
 =?utf-8?B?NHphSktBREFBZlpDZDlyNzlub0Vad0VSN1pwUnBzbHFZN1NtNTlob1JxY2pi?=
 =?utf-8?B?TU1UU0tkdDVScy9GSTlqTnNHNmJaZ3pmUXlNMWRrTm5wQkVrWFNPTThmK1No?=
 =?utf-8?B?OE5XVWdOTE9odjBxYUNmWVpNc0F3dWRQaEppeUlyeXd5dTVpZjYxYkwzUnVl?=
 =?utf-8?B?dForOVhYeW1IRVVHYjJpRmJaUTlpM3hTd2Zhak5hTmdBa29NdG9iV1VESlI5?=
 =?utf-8?B?UktjaWMxdEVmYjRtaTdTTDI1bjBEMHJQZW5paUNIdUp6VERubG5COUk4d0Fh?=
 =?utf-8?B?Z0ozVkNCU3NnM0dIUHVxNWk0T0gyc3hvTnU0STFYUGpwMXc3bE5scVZWMnll?=
 =?utf-8?B?bnM2U2JxN3ZtUVFQbW9LbzdQL2pxQ295V1VJTHdtM3E4cUltaGFHRWc3TFE5?=
 =?utf-8?B?RzdOTDkwQWM3eHo1aXY1dThBd2RxcG10eDJPSmlNK0FuSndMbTdnWTdzOGJ2?=
 =?utf-8?B?eWIvclpBSTRqd0hIaGhxamxWeUFsK0hnY3NoVEptdXpJckNBYnhsazFJTW9m?=
 =?utf-8?Q?UtvkbjDuJBaw9GTUkTgbsEtCsQDybttEcjKFY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFY4QjFwVHdZZG0xVjRPRFM0NW1qNUVEWjh6WkdBYk5zb2JlajhzNmJCQ3pX?=
 =?utf-8?B?N1p1MFEzYWEvYUNBK1IyY0g2SWZpOWZKTzkwY3hMSHJRblZLbVVqZGhwMy9R?=
 =?utf-8?B?WkQ0TkRRUUpQWi9DL1diY2JtcWkzTE5OYkpkWTFrTnU0Zk1DUUZYUkgyZmtT?=
 =?utf-8?B?d0kzWVdNOW16c2JCaW5FY0NZRFpuQWhWcnZRYnd0dk84QWtxWjhTUmQ5Qzl0?=
 =?utf-8?B?enR3MVpJOXhrSTRjMHNWRmg5MGh4RFZXOUlaNjNwOFl2TjNJOUh3Z2pqZHJw?=
 =?utf-8?B?S1dlUXBBVkEwbzBlNUhkMFZHVTdNY2RVdlAvcHJqVzVPVkhrS1NNb2hvNElG?=
 =?utf-8?B?Q2MyRXY4ZWZ4RzYyaE1OTWVvV0NwMjBTNHVDc1Zod0xhREhqNWZyVzhmQkFB?=
 =?utf-8?B?eFpXbkt4VHFOUEpXeXNOb2N5NlBacmhBdG4zOG80bE1RUnkxNmxQbUUybE1T?=
 =?utf-8?B?WTF6NDVSd3l3eXZpVjlLY01vdWhvcUkxaFY3L1IzMEZidmNYMDlzQlZiVFQ4?=
 =?utf-8?B?dHpJRjFWaEJ1c1VFQitqVzNMSHU4bVRxNnNmRkI3RVhxN1RnTlBsSjI2ek1I?=
 =?utf-8?B?YVlTZGUxanZSaGZzODFpWHpIMVI1Szg1QXRQOTNEYUticm8zQjJNamFiKzRk?=
 =?utf-8?B?U2FYY0JldjlMQ1FEYmtVT3cwTVE0d01SbGFwNEFJSGVFVUFGTTBPbXNqazhv?=
 =?utf-8?B?TCtYWjZQdWRLRUd0MVJxWWZ6QjZpVGN3RGxOeU9URTFvRjBRdjFqeHpsUEFj?=
 =?utf-8?B?K0JWeDJUTTc5WnAyNlNGTWhjSFo0UGdtbWQzVThaOU1aM0FqNndybGlNL05O?=
 =?utf-8?B?WGlhMHdZeVN1dStCMkYwdXhITnFrdGNtckhLd1Rvd0hONnJTaVkzeWJQSXAy?=
 =?utf-8?B?OHFpREIrNXduYkxGSnQzUmJST1dGUXdoZGFMcDdHcWVFQlVBUUp4ZER0WHNa?=
 =?utf-8?B?b1lJQzBDS2dIdzNxSHBiNHpUWjVOMDIvZktwc1NNQjF6eFU2MVRUR2FoZzNJ?=
 =?utf-8?B?ZmtkTGkvdlpEL0J2TkhDQjR1V08wQ0pNaXJJam5qR2FsdjhnUGxCUjE1Nkhz?=
 =?utf-8?B?ZVM1ODh0OEVoNGV3QjdRK0dWaUFLU05USXhrU25BaXhaVTFENExHV0ZyRWdz?=
 =?utf-8?B?UXlycDIvTGxuOUwwMXk3K1NGRlBqNmRkRUxQamRwYUZUVEZmdUJJMm80d3l3?=
 =?utf-8?B?LzdRS3JscXpVY1JST0RtUmpqV2J5bGxtZGYrQU03d21NQkZmeStaa2NBeEor?=
 =?utf-8?B?YUhyNG44ZDY2Tm1JTWVSSWgyZVA1c0dRcWJyZ3g0Z1JCcVdXdmZ1b0dIdWJP?=
 =?utf-8?B?NDVWZlZTYXBtTXFpalpndHg0K0VUdEcxaHFsOERFNUVmMFFIODZGRk56TDR3?=
 =?utf-8?B?Sjk5OHRLRjZ2eWtVbWJHR1M4S2dvVWxoUzFqV3FDdUNOdXFCVWtKUjIrNTVV?=
 =?utf-8?B?cVRFYW9JN0ZwWHFvYVZGOVpsUHpEcmFVeFZ6bFM5ckFoWE83c0x2bUQ3eXk0?=
 =?utf-8?B?SHR0aUZzMHg3VzdxcnRJWm1lNE4rSGdHb1FZeVlKSUU2ajBabmVhVklUeXJD?=
 =?utf-8?B?TGpNTnBaYjkwQ2dpNVI0VlpxN1IrWDRiSkZsZU44SU45Wks4R0tpbXNaZkhG?=
 =?utf-8?B?bDFBVytGd1ZoSHlsN0V3NTAyQmJVaXpFaHJ3Vmx3L3k4M2Q4WFF4VDk4MXBk?=
 =?utf-8?B?T01iZ1hwQTFTaWphak1EVm04dERhcjg1bC92dzVyS2FSQVNZeGx3cG5TRDhU?=
 =?utf-8?B?bitHWVFYMDF0SHhsY0Z0T1dxM1BPR0FEaDNRc2pOSVBZMThZQXpOT096bTBs?=
 =?utf-8?B?N3pROVo4Q25xSlZVMTg2cDB0Rm1oWm9QOUVtQjlwUDdSeGhyV29QblF2d3Y1?=
 =?utf-8?B?UWcxdTBWeVZSVk8xai9pQkJWL1AxaEVlUmNTMU56bnhieGZaY3RIdnhUcW5s?=
 =?utf-8?B?V29CTmJRTW0zOXNMaWlNUkZVTytpTmRobGdybFdNSXNYejFPWm8yaVdPR2pY?=
 =?utf-8?B?aGVtNUsrWE14ZjcyMEs5c3BGOXBHQ3ZrUDhwYlVXLzdnY3FxVHZOMjhJL1ZI?=
 =?utf-8?B?VmQrbmk0NE5JQkNkY2pxTFFOVmhoZnJJU1BLTyttOTUzeGtuVE55RFpMYmJZ?=
 =?utf-8?Q?l0kbze+VEAAJ2F0cEtp9t0vmj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4199596e-7ca0-4bcb-bce8-08ddcf6afc80
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:14:16.7845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPx+mqU06OdpEDds8kqjExtZBmy+QH40slfTMY/b1aBhOarzm3jaz50GBzjAJPPDzdcaamHJHOPdUjP/ri4eDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920
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



On 2025-07-30 06:16, Arun R Murthy wrote:
> Add user readable error codes for failure cases in drm_atomic_ioctl() so
> that user can decode the error code and take corrective measurements.
> 

Thanks for doing this work.


> @@ -1541,6 +1548,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  		ret = drm_atomic_commit(state);
>  	}
>  
> +	/* update the error code if any error to allow user handling it */
> +	arg->reserved = state->error_code;

Once we do this we paint ourselves into a corner.

It's nice that we have this reserved field since it allows us to
extend the atomic ioctl without the need to define a new one.

When we discussed this at the Display Next Hackfest [1] we came
to the conclusion that we would want:

- an enum to show what is the issue
- a string that can be logged to display verbose information
  about the failure
- an optional array of KMS object IDs participating in the failure

We could define these in a new struct

struct drm_mode_atomic2 {
	__u64 failure_reason;
	__u64 failure_string;
	__u32 drm_object_ids[MAX_FAILURE_OBJECT_IDS]
	__u64 reserved;
}

that we link to via the drm_mode_atomic->reserved field.

Your approach of flags, as opposed to an enum, would allow reporting
of multiple failures. Do we think drivers would ever make use of it?
Normally check short-circuits when a failure/limitation is hit.

Harry

[1] https://hackmd.io/f3bDn3kyRUalLn4LbMfCVQ#Commit-Failure-Feedback

