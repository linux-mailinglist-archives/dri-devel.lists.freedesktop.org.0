Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29FAB3105
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C442810E2FC;
	Mon, 12 May 2025 08:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e73D0FuL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415B010E305;
 Mon, 12 May 2025 08:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7J+XCJrWhDxVk/TBrJ7q6iVmFBVz1nloSr7lpd1vlK0iAfvjHm2fhl0FdYHQT20c7rw5WX+WzahlbOS5tXChXofOTD7CBowNuEqog0Xu5Wib+DI3T37ewtvsVDYkP8+rk5BDNgMeSObnzedPqyKWlkE7vkZjuVi/nnmSHLleGA0fHIfevQVeSvxLaDF5ZMLhf7xh0+M1w8pDMUhlh0KS3AGY8FTLGtf1AvGCLAS7rKbPSL1jtuB/f3NFwnmGcFLXLi/q1SGA5U+QST71IUrsf0K/v3d+IJvPerwl4uo80d7tEJ1o60ozu7P1ryonzdgkp+Kb4iZ4LVo5T3LBnA19w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2fqvb3nJGzkeP1Wv+aKLXfX2HAYxwJhJ6tDRCCc7FA=;
 b=Yfb1atG2ZDWl9qoKTY4pM9W/Y2lXoaEPgd3xZhFcCL16IQRWR8MHRTkyKg6ET7FF8i29aXajZxzOg25Y+asThIDlvVle+DkEcs2bcSGTEaRolBp4svOLJnEKscUQRPLn7ptBnbrxEXhntKhaJhAeGYQ9MXukPo4cbNMiyHWV3Fwf1BoXey+8/EGv2gN9jESktcDaKpbGidP7DH9zCGuHVZqr9yz2qk+jZsaNnYJ7qGx7/UsbbscOdcahZbwJI0xOq7tdr21RcaWjORc55lDAp5mNcJ55asw52lhggZRUdcau38FuRJYErijuPiDeNpxH0fB0mw8vr94eM4tCVM47jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2fqvb3nJGzkeP1Wv+aKLXfX2HAYxwJhJ6tDRCCc7FA=;
 b=e73D0FuLoHDl2bV5YvORqVjGM5l63bjFU8r61FvzPECG1sguEU+ZM1rk8IwXFvdOVvwdG7Htg+iAmPV5Gdp8XL1IxcYJUa6RKm3A8DfPeIAJXZMwFfvy/YsovNhxB5B0n47Dixg48LZ35aKgv5eKuQEA0AuvkEC+sNz3nkN+gLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 08:05:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:05:12 +0000
Message-ID: <b99eff49-cac4-4728-b66e-48bdffb94883@amd.com>
Date: Mon, 12 May 2025 10:05:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 01/13] drm/i915: Use provided dma_fence_is_chain
To: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-2-tvrtko.ursulin@igalia.com>
 <aB4jgtwqqNUs11py@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aB4jgtwqqNUs11py@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: 153898e0-1260-4b39-4378-08dd912bb898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjE1blRBWG9lclQrMFMrQkJtREZQUFBmRFp4TXBmcmpMTFRYYTZuRThRUVRO?=
 =?utf-8?B?UFdvMVU5SlloL09udUNGRmR4QnJiL2Y2Q2FDQWx1RVU0UDVYOFNlK29TVU1o?=
 =?utf-8?B?ZU9GU0RZcm0zeEovZGxjYXQrRTExempVRDRnS1lEVkZ0bGd1OVhvOWkzRkY0?=
 =?utf-8?B?Q2s1cnJQdVpueWJMVUpZRG94bkRla2pTY3pZQ3VUQmZiR2VJRlRuWGxsQVRL?=
 =?utf-8?B?Y3UvVGNyTllPOFlkckFLWHNXeUQvbm4vWGY3Mjd6d1V3SDFNc04yMGNPOS8z?=
 =?utf-8?B?dmd5U2RTWFRTN2k4Si9QVDVhSzhVNkZvL3dkdzVYNWRwd0tPSDRqVnJYa3dI?=
 =?utf-8?B?WHpsY3pCbW9Pa3doMHpEVGFtaW5JWWdON2pvTHVwZS9yck4wN0FlUXcySzMx?=
 =?utf-8?B?b3dsQnRRYU5qSXlRelhWNnlVNzB0cUZTTVJlS3p2WVA3VExBSzVWdUFqTG9X?=
 =?utf-8?B?ZjRNMG02a3NLTEY5ekk2WFdJM0JhQ2lkbFhyK0oyYW1DcHl2NnY5aW0xcFZV?=
 =?utf-8?B?YjVaZkVjMVJUWGROR0R0aWFlU3NxbXBMVWVDMHlrZFZtcWFtMFJYdEk3Ukwy?=
 =?utf-8?B?QXBZbklxRitlQzZOVmFMMkdpOXhhL1Vyck5jWlRHOTd1V0g5WFFOYXIxT1FJ?=
 =?utf-8?B?NzVUT2ZTZk1vbi9EMVNXekpqOHJQK1RNaExNRVlxeE9BdnQyV1JTdmhkRzc0?=
 =?utf-8?B?YU5UeEZGL0pMajJTNVl0bGFvMzhJaEtxMFNRaUFKbjV5SWF0a0tMODFZR2FZ?=
 =?utf-8?B?TmRXWUlKcnA2cm0zaFk1UzExQmpQSUJkRG5VcUJ1NjFITHp0czIxWFNJZEJ2?=
 =?utf-8?B?MFE0bzZ6SUsxbE9CaDdHUUQ5N1RQMDJodXBVdlJQQjcxdGFDSFU0aFVnS1Fu?=
 =?utf-8?B?NDh3SGh5UUwweFBFYzQ2RGE1emxiUUdMa2tRMFRVTHlQS2ZXblFWQ0Q4bDJt?=
 =?utf-8?B?cE5WMWdwem5vbU9JcFYvOWV3UjJCQnlEQmlmd1FrdGc2aFBzM1Q1VDFkblhh?=
 =?utf-8?B?Q2MrYVR0a01rNHVEMkZkYXFuMFpmc1ZKV2pGOERvd1g5NWdGVUliRlFwZTNz?=
 =?utf-8?B?dFd5ajdHanR4cURvcUFiR3UwMjFMVm00TVRKUkhRbXBHTFdJS3ZicGpmNmJS?=
 =?utf-8?B?ZjlkN2NJUWI3cUR5dFE2bnRIaXhJcXF5K29vT3BUM21FUFFwVFVxdlFXU3JZ?=
 =?utf-8?B?UzhFdlVqNWJ3bTZ0S1Jsd2cwZ1ZYVTJBV2wyUXJSblJleE54djdFc09vSkRO?=
 =?utf-8?B?NXNWM05nbE0ydkhWc3BZVU1VOGZ1OXREbnZlZ0N4SHg1cXVMK0JqZ0Z3T1d2?=
 =?utf-8?B?V1NYQURrSmhIdS9FRWF2aW9LTHNPMzV2NWRIVXpta0V4bUJmeDV3S0ZSSUZR?=
 =?utf-8?B?c0ZYRnhISVRmMWYwMFd6TmQrWENiVGhrUmVRdGFSVFViZjBwN0Nmd09HOVd0?=
 =?utf-8?B?eGNaOXZhdTFSQkpkc0p1SytXTmgvbjJURjBzWEtlN1ZuUW5lMmpaR0s4ZHRn?=
 =?utf-8?B?bzlqSm55dW9nR0ZxMzMvWkRGaVRoNkNSTFl1b0krSmxDWnFESGdqb3cxeEQw?=
 =?utf-8?B?bTBFUnJ5aVBZSmRRNm43YXkrV09hZXlIVUlzemlpaDAxVjVkeUdYWDNuYUpU?=
 =?utf-8?B?M3ZKQmR6UnZwVy9RRFVRNmIwQlJUM3RlMnI1c2M5cjgxdFZtNVh2TUVVdEtI?=
 =?utf-8?B?c0FJWElndXJKeU45bUVPMHZtRlZwMWFsYlRIN0x3YXRiT3lRRHh2S25HOWFJ?=
 =?utf-8?B?UXVSSWdxdnpwSkpkMURVdlFPNkdUZkVabXByTUdUR0tXY1h2MEE3SUllWlhu?=
 =?utf-8?B?VWNVMHJZVFAwbjcxdTU0KzZYYlVoamdkUXJVUnVaTkFwNjZhdkw5ZHRyZEUw?=
 =?utf-8?B?UkxVWktuQUJTb0NqL2lya1RNUFdQd3FabFZiMjl6STgxM0IzMEFSOTNKczlp?=
 =?utf-8?Q?dNPFW/XfJAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktaWDVWbnd1RUdySW11ZkZHTlIwL1BQdC9OQmVTRzBzQ3BGNjc0VU5jY1Mw?=
 =?utf-8?B?MG96TGdWQVRMcnVVNGNOWWhERlBSdFgzcklWUmduM0d1dWJJRFovWHBrU3dS?=
 =?utf-8?B?WFZZUUdoMW9IZ2ZXVDZZWVN3LzdMQk1QbThUWXJPNitqZ0IwTzhmY0lUNlZN?=
 =?utf-8?B?Uk03VUttcUxUMWRCdWkwWEgxWjB1VHhReWdwYy8zRGZDZWkzVWxzUEZ0V2hO?=
 =?utf-8?B?M2k3bDNDOXRzV0s3eXA1WlZObk5jRkRYcVp3N2gxaUZyYXJzOWp2L3B3cFdI?=
 =?utf-8?B?d2haTTJnc3FzM3N4QzBFc090SVBHTVhOajM3S0JmSE5DK2VYWWdab1NDV0lI?=
 =?utf-8?B?ZCs5WEdKRDBEWFJSWEVYLzMrN3V4N2dScWE4MWpidlBEWnVCZEpybXYvc241?=
 =?utf-8?B?NnY0ZTd4czhWeE04WVlzd0R5bXRUc1J3eW9kVElhdUltMDdUTnpFZ0VyRWJ2?=
 =?utf-8?B?KzhKL3g2by90a3YvdkhONU40RW5SN3psSjJzV2VYa1J4VHRWZW1zQk5Nbnl6?=
 =?utf-8?B?ZlJPMU1NZ2M2U2RXOWFxUDdyeHYyUUxwZjE5dEx5MlJRZ0liYXhzSjVxZy9n?=
 =?utf-8?B?c2JpSWtuTDZVYnV6QWE1czVsaWo0SkE2NVg2V1VldEJYdGNwNnp2Yk5PdUt1?=
 =?utf-8?B?bm4vK2dzb1YrSDcyR0t2ZzhYUENpQlRpL0NJbUtUa293L0I3cURpVnRVSHo0?=
 =?utf-8?B?cDZoaHM5aDA0ZFZ2dXllWnZMRDVwem5ZR0pJRzdwMmtKZjFoeExCR2diSk81?=
 =?utf-8?B?T0YvUHVGb3RGc3BZVG1tSFNyZzFjUi9WMVdLOTNwQjhRZzI4aWM2cVZXdGs3?=
 =?utf-8?B?QTNpWDIvNVlMZ0k3WGNmV0tkS0Z2SllYNVNWZ1M5QlpmdU1KcVVLT3paa1dK?=
 =?utf-8?B?aUhCaXNuYTIwcUtTazR3ODNVZ2JIN3luT09xZ0dZcFU5cU5SOEFPL1VnTy9L?=
 =?utf-8?B?dlN4WWpMZS9JVmF0cElqdDgwT1p1Tk9yUTNtcHdJaVBsb3NOb2dTK3JFTjJr?=
 =?utf-8?B?cW1iMmV3THdZUkZWOWxSUnc5ZDE1NTZJLys2SnJnLzVuRTdCb3FxTUJzSjMv?=
 =?utf-8?B?MUZYb1lRMDhwc2F5amlROG13MG5KRDdISnEzNHlkZzhyek51RFQyMitoRVE2?=
 =?utf-8?B?YnlCZ0xqQit0NmlndTVaZW40M3JuZFRWVFpKOVFRc3pPWi9DTDE2dkhBVlBu?=
 =?utf-8?B?NXVZRUNZMFpNQTl1Rzh0Qm5kVVUzWFU3SWRxMVMxcno5T0xSRlZTeEYxaXlu?=
 =?utf-8?B?bXFidGRyazg2NjZCS3M1czdVczgzV1JzTzlldGFaa1hIUkdzVDJHQlRnMnRD?=
 =?utf-8?B?Vm81ZVMwc01Lb0FtejJsM015SmJQTHVTVmJkTUJ5N1FrVURpVFdYeXBML25X?=
 =?utf-8?B?akY0V01vL3RxTVczNFQxTHdQajVySHIwdEIvdXhSK01rNUZuOVExY2RsSWpY?=
 =?utf-8?B?UWswYzhFY3NIUmVIRXNKU0g2M2JSQk9pb3JwWGxZTEFscGxMa091MlpIN0VQ?=
 =?utf-8?B?a09CSFROeXVOdFYyd1NNcmYxYzZFd0RITC9yK2FNektQc05pYjBwbEk3dGpE?=
 =?utf-8?B?Q1lUM21HWnd1eFY3eVU2UUhScm82aGIvMzIzTVZDUU5mUVBCcitVRldHbE5C?=
 =?utf-8?B?SWx0ODdzcXYvY3hOQUtzY0ZwZ3luV3BoczEzd29Qd2NkWitCRnpJYjZ1a1Q2?=
 =?utf-8?B?bHVTSUYwYUdFS3RvWWx3SGxxTHcxeDlqQ0lDNHhTckRIOHpzVU9jUEhuOHNm?=
 =?utf-8?B?d2Y0WGgxTVh3SkRMU2hVQ1JuUGlNMlFSbUQ5SGdtNnJlaDlBNEw4ckVEQmdT?=
 =?utf-8?B?VmJsZlRObnI4WFdETkcvbHJRUkRjbXhqaEZmV3BkMmJ2VktobGZlZHUzSFBX?=
 =?utf-8?B?eTB6QzRibXdIY1hiWWdPb2xkNVRZa3B1NkpIaWVmOTlCdWUyK1l1cFVjcDVk?=
 =?utf-8?B?bzlPWi82aXAyL2p5YWE4eTF1dVRycXliakdUaFh1NU9RMTZhUmlrUW1Fc1E1?=
 =?utf-8?B?UmlYYzdxcVRFZkhyM1pGelZCVmVJUjIxYlBoS25GRThRNUJUVUVYRXhNNnQ2?=
 =?utf-8?B?dDFLMzYwQXBCRTZEcXVJTXgxM3BGRXRmLzZreEVJLzJrUlVFckFPMTVBRmxR?=
 =?utf-8?Q?cK7M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153898e0-1260-4b39-4378-08dd912bb898
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:05:12.6322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5gIfPZBvBkTec4hIulHW8ucLk5ZLfuAddjTxydUeQKXzLkt3ZChhI6sJ6Oqf2w4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979
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

On 5/9/25 17:47, Matthew Brost wrote:
> On Fri, May 09, 2025 at 04:33:40PM +0100, Tvrtko Ursulin wrote:
>> Replace open-coded helper with the subsystem one.
>>
> 
> You probably can just send this one by itself as it good cleanup and
> independent.
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Any objections that I start to push those patches to drm-misc-next or do you want to take this one through the i915 branch?

Regards,
Christian.

> 
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> index 7127e90c1a8f..991666fd9f85 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> @@ -106,11 +106,6 @@ static void fence_set_priority(struct dma_fence *fence,
>>  	rcu_read_unlock();
>>  }
>>  
>> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
>> -{
>> -	return fence->ops == &dma_fence_chain_ops;
>> -}
>> -
>>  void i915_gem_fence_wait_priority(struct dma_fence *fence,
>>  				  const struct i915_sched_attr *attr)
>>  {
>> @@ -126,7 +121,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>>  
>>  		for (i = 0; i < array->num_fences; i++)
>>  			fence_set_priority(array->fences[i], attr);
>> -	} else if (__dma_fence_is_chain(fence)) {
>> +	} else if (dma_fence_is_chain(fence)) {
>>  		struct dma_fence *iter;
>>  
>>  		/* The chain is ordered; if we boost the last, we boost all */
>> -- 
>> 2.48.0
>>

