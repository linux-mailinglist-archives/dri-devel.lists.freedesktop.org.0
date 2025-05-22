Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD6AC0C4D
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9715C10E905;
	Thu, 22 May 2025 13:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xDLqeSHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A74110E2AB;
 Thu, 22 May 2025 13:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVUb4w3kAzofIuzHjGTbiF3qC2kVvGZN5iON8pqOU41Na/2mK7BG6F2wB6Lj/AVmPdOXoEGz1GFd8my6JiOZCwvxneqDimf/DhN7XzFUsSvgZmK6gkYH/lOvlvkElsa6Wdqu+5gF3/CMG/Rrs1Um+NCvZAvTx+n7ZdX6Yy2W7bCWU3LtJnrXQbyL42VZjYzVCrPavdWW8OEXFcdJYVXsWm+d+rVWpUHeOeYDJS6lC9mOry40tCOHEePynvHErYdy+WHVG2Inclixncz4RcUpxsXrSzdDuGBID4JqW0jH2E2lgOt0uBtevwkmHFRRl6oHh0j5XccuPzEJl6B+LXmuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MYzRybTptYaZMOUDQtlgQyY5V5axZWI2TscVvL0ye4=;
 b=TgMNfrZTMqLeZMpdNEQzCYwzPhrs7NAKHeHVHSC5UbGxjdCJZ70Suusf1Vdt2KeK1eDSz1Vcr4qxmtiwsiW56+5jkBtXM3Q7BFmshwCg233nCNIoFLxAl7dV3IB8fTW+ZTkjO44kaHn/okAqVnhFdHDG+Cx0km6NhMWX63jCuXxgN340pRjxfvsWH876BN9u+N3ixr9ev1GcHlaYC5wNmufa8+PKSaAoa8Rk10vVKK0IOIzcGWSZHFSLg5mlTseOYM+A0eZE//Y99f+ME+WjV0j3xmEmS3j4Oti875+oY//f0DUpWw+DrNYLYr1wY3jiv2R2G5+K2UaTDStjxGQbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MYzRybTptYaZMOUDQtlgQyY5V5axZWI2TscVvL0ye4=;
 b=xDLqeSHUgciX2Ko59cZYoHT3wVCmyGRyXIf3vQ4DJCjTjw/tNStujLFx333ToQokfsw1IbLo9sXPofvoP1korANY8eve8d13PTMJpVJ07VrNLA/rSKAjhy74bSZ9tgjek/PFyzvug02Wq0p/uV0aBPcRd9K4frsGAsk38jVhptQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7832.namprd12.prod.outlook.com (2603:10b6:806:31f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 13:09:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 13:09:55 +0000
Message-ID: <ebedece4-9758-47e9-b621-37b40e3f0fc3@amd.com>
Date: Thu, 22 May 2025 15:09:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com> <aC8fpEXYWZ9Oy41J@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aC8fpEXYWZ9Oy41J@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0245.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7832:EE_
X-MS-Office365-Filtering-Correlation-Id: 493a14e0-4ae9-4c60-e64b-08dd9931f208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk41K3g5U1ZaOXBMc1RNUGV0Ynp5d29OTmJaU1l3VmdsandaQ1FtNklMdnR2?=
 =?utf-8?B?Nk1LQVVNL096WEdWaDlXQjBQaEtETmpoMWMzd1U0TXYrOEtGakFqa3hOUDgx?=
 =?utf-8?B?NmJmQ01Qc3JIM0VreFd2emIvRERCdW5JakZvMGFlQTZtZFBXQ2FVU0tFMWNE?=
 =?utf-8?B?c3V2VDV6ZDVHelU1WU5VbHpLb1IrVHNxbnZiZ2QvL3lxRmdhYk5xWmFnSzY0?=
 =?utf-8?B?Q3JLVVNPZzJZWGR3WGVBOTdha0dWbHFhRWZMak5xNTdZQkJ2NVNlRGc3cEVG?=
 =?utf-8?B?NGc2bnBlR250WFY2TE1lUlA1azFWQXJZVjQrSkIzM2tMTUx6Tm9kQjhtamcv?=
 =?utf-8?B?WlE3Q1ZKWGhYQU1wQ0ZqNGtINGFNL0RGTGY0NERPNUk4ak4wTVNSRDhDdXVD?=
 =?utf-8?B?NTJobU84c04xWWZVUjhnajRSQ2ZUblROdzNlMkxvL0ovZ251ZTVYZjRnZFhQ?=
 =?utf-8?B?SWZoNGdrMlU5RXh6M0Uybmkvb2JHYndUeitZOWkxTDZBMHNkZGMwTDVRMGVG?=
 =?utf-8?B?NStrUS9FM29xclppOUtkZXB2WnJjT3hZdkFCY01sNHUvVGNsQzdCNVdaMEF1?=
 =?utf-8?B?dExrUVdWUW5BZ2QzOGt0ai9KOU1WdXhSU21lZ3hBWnc4dmQ5QWRva2R6MXc1?=
 =?utf-8?B?T1hka1RmVW1zVWthYUcrNnhFbDM4U2tFOGEveGoxdk5jdHMrKzA2bjU4SUsz?=
 =?utf-8?B?aTg4QnRUOTRsSXFZWDRwcjJ1YTRLRGpkMzRSK3ZsOEs2RlZqY1Qxc2xxaTNy?=
 =?utf-8?B?Q3kxc25mK2F4UmNLeDFRT0ZZdm9aczg2RVBPdmpmdEIwcEFVYnVuVUI1MitF?=
 =?utf-8?B?dkRsTkNoamJubHJubHA5YkpGY0EvbEwxM2s2SEMyTFFLbzVmYXJwWmp2cUhM?=
 =?utf-8?B?cEhCcHZBaVFXSnVZSzVWbFFVMTVYd2REK3A2OGR0bTgrS0Zrb0U3MUdrUFF1?=
 =?utf-8?B?eEdRUmIvMVVZL2NTNHNCcE9HQzVoNDRYR1ZXbCtYSFlMS1JwdFE5Rzc1Nkhh?=
 =?utf-8?B?Wm9GaTRKK3Fmb1hMTTNVQVhTVXNHMElVMklqNWt3N1FJRGM5ZTkyOFZ6UHdu?=
 =?utf-8?B?SzB6Y2NGcFRkdHBGYkdFSVJmazc4YmtXOGE5SUQ3U2VZc2lST0hUdWdqenFL?=
 =?utf-8?B?SWQ4TmFJa0UwOVZOYXdhUjNDQXZIRXJDRkM5QnhPQmFzRUp1MEhEVUVGVzdR?=
 =?utf-8?B?bCt4ZjZVYSsrK1RCd1kyZlQ3TU50UGhGdFdqNHF6c0RDa09kT084VXZ5S2Zi?=
 =?utf-8?B?SWtqS2Vrak56M1hSWm9IbXc3MXRJWVVkd2Fvc3JYVWw3WEdzZUpXWXRTWFpv?=
 =?utf-8?B?amhEZHhrdjhJN3Nvcmk3Z09vbDlEUTk0Ym9OeVluVTFWNkZ0R2xWdXMwVXpD?=
 =?utf-8?B?UnZsTnhsREU1eExYR1hsaHRLUGc2OUxPcHhsc1NKTGFneldrajBSNkpsenpu?=
 =?utf-8?B?cUJ6ZUNQQVZ6UmZ0WnhCZU1ZNXFGdGdRMG9GU0VGcXVTUXNnK1RLQ3c0alRj?=
 =?utf-8?B?N0RRdk9ka1p4RXA5Zk85dVIvR0V6SXJMcyszUjZZaEo3amcwR0kyMmNVa2pj?=
 =?utf-8?B?MFlpSU1IRnJCQTQyY05DdkJhMy93SWw3dlk0WitCODd2RUVvemN2Q3o4OERI?=
 =?utf-8?B?V3NuUlNPR2czN1d5dWJ5aktVdjg2dkVKd2hHSXZvR1VTWStIMmwxZTRObDhv?=
 =?utf-8?B?TzFvdzQ0ZVRQTzJFMTFwRWhKaFdTWlcwUlltOTBmOTJxdWwveVFKZ1ZBZ0sw?=
 =?utf-8?B?UFZKelcvSzZTemJqRjM3RjBkTzFIMm9vdWd5eTNLV3k4U1NtdkRmY3JNQW9M?=
 =?utf-8?B?dWNMZjNXQzJPRVNHRjdTVmdyRXNPc0dNTnJBZ01iQXFCS2dpdDlBY0lUWnhO?=
 =?utf-8?B?OGFsKzlBWTNuV1VXM3hQV3J1MlRSOVlpQTUvcXdXcW5STm90dWhsNHJiNUxs?=
 =?utf-8?Q?PMLDAKdB+jQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VwT3paOHFnTTdZeHVqN2dlKzUySENjd01tMjU0a3k3eUVNTWpubGlZSHlX?=
 =?utf-8?B?QlNJbWRZNFNyTVBTbGFpd2M2OWQrUkNQWFRzaUwvcDRlNjFJUjBRandPYkFt?=
 =?utf-8?B?LzI2OVRMWFg0RHU1QlREWDBiSzVGQ0UvNStVSGYxUXNSQ3FZRmJ0L0JwdXhL?=
 =?utf-8?B?U1lhUUZ2WEV2eDVjMHl1TkdzcjZFMTNNYmg0SWF2OUU2ZzhpdVZMcHRIeGph?=
 =?utf-8?B?Q1hmN280TXpRMThzZ3hWRkZ4aXRySVpPU0VCQUZHcCsyaHQyRTJVL01ITjUr?=
 =?utf-8?B?L3l1YlJwbUgxdXZjU09oRTVJNmRHMjlMNmk2NnZmL05kUVJxUU1Vd3Vwb1dB?=
 =?utf-8?B?SzZxeDZBMC9KaWh2M1pDaW1yWHA0c1pZU2ZIakpXdm1HUTVHOTM0RDBteG5a?=
 =?utf-8?B?YkNhSWZ3ZFEwQXA2TXFjK2dNbEF6dWR1RWZaZVNMdWZZeG5aL1Y0KzNoaXVN?=
 =?utf-8?B?TjBwQWZOM21kRTgzaVl4OVpkV3piWlQyRmFwN3FSWDkybmtmV09iQytqNDZK?=
 =?utf-8?B?dHVVL3ovTFN0Yk5Zblg1d0ZwZ0RsQ3BwRzRoSk8yV0E5VkZpK1Q4bHIwN1BV?=
 =?utf-8?B?eWM1UGhYQldXaGk3UTBPQXNrb3c4OXVuamxGdHArMkdpWk9BMG1uQ0JoSkZu?=
 =?utf-8?B?UXBCL0dOK0grWmtEMzgxckVNSFdzVTRpM3RrYTEva014SEI2N2M1ekhSZzU0?=
 =?utf-8?B?WE5iZmZZZk5zalFrUDhabGRRZGhlZElvVDZKYzhGVS8zS09iTU0zVWFTVEZC?=
 =?utf-8?B?TVJMU1IrSEh3WmpWTEUwUjdBemVGZUUzT25JYXlsbEVxUnFnMjBlN1RsRGtT?=
 =?utf-8?B?anF0RHZsLyt5R3d1UjRrTUZMYW5GcFlGbXZkeWFPaWExNkpmUkFaQnJNWmVt?=
 =?utf-8?B?dnkvbEFVNXJEb0xHQXFGWWdzT2l1MEpvUGhWZEdhb0p0S2puQUJXNlI4QzRz?=
 =?utf-8?B?Q2sybHlxUEVpUUQvV21GeGhrb3Y5TGxtck1vTUplWmdjS1Evb2NZbTNYZnUy?=
 =?utf-8?B?cjFJdUxvOGN4VVFyMHdrckdIT0U0SlNnckhlWC9VeHQyYlhQWFV5TVg3eis3?=
 =?utf-8?B?cEdlV245djQ4VDBybDY1L0syYThTdmZGSjYwK2ZoMmQzU0dFVmJmQWFyVVp2?=
 =?utf-8?B?d3ZQVXFNNlZpWW9aUXFEM1JJMEFQVGQvc0I2Q2VsSVBhREZqUEcybmJrYzRB?=
 =?utf-8?B?UWVZby9tL01VUkNJWjljYzZYODVBV2s2ZGNQZjlxUG1vV1RoUFpGVWVmZVd0?=
 =?utf-8?B?QTVPT2Q5OFBPRW5sbGZER0d0WEI1Uy9CMWUwMElFUGpwU0tIWElNRHMwK2xw?=
 =?utf-8?B?RlJSOUQvWDZlaWxFdDlJUGZTRW53c2J6Nm9IR1lHT3hMRmRDOU1OOE1qV3VP?=
 =?utf-8?B?S3lCTU1xTzJGWVJ6aVpXbWR6aTUrM0Y2ZERVc3kzTGhIZnpNUnRXTnV2dm1w?=
 =?utf-8?B?dExtYW9qSTRTSHNrUDhjaVRLeFFxZEM5dVppTXJkd0NVOEtwaVRqUlFkRXEz?=
 =?utf-8?B?eHRkem5RVlVZb21CSVR1bkJqWk5EK1dFK3dGSGQ3OWF0ZWJxWWIzOXhQZGFa?=
 =?utf-8?B?cFpEbHpqeXRNdi9PdDY3TlJLdmgxY3g0WTJYZmhvT2U1RTNUcGREd2hCMWdG?=
 =?utf-8?B?bm10YlowYnB6a2NJQ295c1NDMkN2V1dhMHE0QzRFdzVoWnlWTzdNYXM2YW5x?=
 =?utf-8?B?bElrUFE0NThWb2NFUHVTelVLUHBZYXo5WjVROGVUT3ZUdjVCbEV0bC9lVWoz?=
 =?utf-8?B?dE1Fb1h6TCs3TEJESnBEbWw3cHlIeFZtY2Vtc1hmMGkzOENaZWh5UkFoVm11?=
 =?utf-8?B?NlpreElkRHd5VDRCM2ZSbWNJZks5ejcyd0lPbFU4MnFLMW95Ym1MWnpwOGpj?=
 =?utf-8?B?VmxXRG9GVXFFdFRDVG1uMVZtUHBWTyt3NHdpcHFoeXRiZTdnbG92OE1ZNVk3?=
 =?utf-8?B?SU8rbVY5Wjc2dk90a1E1eHVpV1diUHI5TVk5L1VmbERjdU56MTBPdllWL0FZ?=
 =?utf-8?B?ZEhqQUJNSVZZSUpFQ2YxNFFYeTFJVHAzYklEOVJRTmpqU3B3ODU0ZHFEV2Rz?=
 =?utf-8?B?RmY1alMyazNrOXRWOTFTaGw3aGpJK0JQTXFCRit6aWtMMjQ0ZmQ1VjZSdzhV?=
 =?utf-8?Q?fLSSprOz9e6PCp+qimc4r0Aur?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493a14e0-4ae9-4c60-e64b-08dd9931f208
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:09:55.0969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg/9C8SvVYNahRxcFLnOD0N6u/7/WLe/iDlQYB0epGwnQU8dNke6BnPndGSK08H3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7832
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

On 5/22/25 14:59, Danilo Krummrich wrote:
> On Thu, May 22, 2025 at 02:34:33PM +0200, Christian König wrote:
>> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> 
> As you write below, in certain cases it is valid to call this from drivers, so
> it's not unreasonable to have it as part of the public API.

The question is from which drivers?

>> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
>>
>> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.
> 
> In general, I like the  __dma_fence_is_signaled() helper, because this way we
> can document in which cases it is allowed to be used, i.e. the ones you descibe
> above.
> 
> test_bit() can be called by anyone and there is no documentation comment
> explaining that it is only allowed under certain conditions.

That's a rather good argument.

> Having the __dma_fence_is_signaled() helper properly documented could get you
> rid of having to explain in which case the test_bit() dance is allowed to do
> over and over again. :-)

That's an even better argument. 

> I also think the name is good, since the '__' prefix already implies that there
> are some restrictions on the use of this helper.

I'm still hesitating. Adding something to the API always made it usable by everybody.

Now suddenly saying we add that to the include/linux/dma-fence.h header but only certainly code can use it still sounds questionable to me.

Regards,
Christian.
