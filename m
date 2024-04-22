Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925118ACFDE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7F10F673;
	Mon, 22 Apr 2024 14:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EmU2IE11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0918010F673;
 Mon, 22 Apr 2024 14:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtF6WOX9fcfvpLO62WgFlfNa4Es3nKcRIBov5N3mlZ41pDwPbJI5hXV2x3CgE+om4ZxBG2XJ7FtV/Qx9anG+McfPjISEPvUKAgJwAYV3UFG7kkY/0lA8iTW4bvrmK194baQR6ElrJyoB7fn4jh1eApS5MuCd5XeHbUWO2/7PkjTcMoYIKTEuDuuBQqXLeY5NTpCzl+X/gBDtfmFTlyymagViNAgVgp9tJEgYFORAAbmApNwhWr5wSYFpC2w9SYPPRkJywT0hKvuFEa04KiFQNJTfir/jvkoSLyKb6lJovPuVwhjzQspGedXfiYq2CVFye5NDMlez614X7//COVoOXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zrzmz1EIVLPWs8tzLs6uTH4t8nqT6MPTTStUQzxSZiM=;
 b=fYNPq2qyRE/n6/qul7nvc3CjPxIGNmNW6+Vcm5DHp0vDkT0+4I8QRkQoq0BGXjUrVZ6NEl1Vh/s/1+3U7wABxYjeZeMiOT2hwOQGVZZwFYFuVS7s6eAib1nsyrYN5koQWgNdDQ2bSA04eZIVtnG+AC8jxZUPqDpA940Cllh+Vw4F7wrHVJerG4NvzM7Yqr2aCmhQ2/0FwgFi+SEXLJOqbHZ69VlcBmp/9DuIVBucl+2qc/dL4fMQWX9ZYJDK8LsHtsNTtOS2vhHXnSD9Rh0sGwl0bWiDz2YK9H7q+gGYkuL+XtrxDZrGc5yQ96A3LO/x7CimEcOUHI7Z+ck9QNgByw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zrzmz1EIVLPWs8tzLs6uTH4t8nqT6MPTTStUQzxSZiM=;
 b=EmU2IE11wFQ8EEorqtIlmQaclerA308Q6rRXNBG8OegZpI1GX+QLdqwRwMD3v6LRRU3g+a0RgPMt5njmfcNNVtMYNmjvB+yG90P/gi9vsZJ5zHkYXECrvJLOtQ+xc4MlV2FGHIpqQwFwtZo5Gp1PeCTB/urM3rfQHTy3QOpnNCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7269.namprd12.prod.outlook.com (2603:10b6:806:2be::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.42; Mon, 22 Apr
 2024 14:47:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 14:47:46 +0000
Message-ID: <f2e1b969-ce9c-450c-9882-99813b7334a0@amd.com>
Date: Mon, 22 Apr 2024 16:47:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Fixup bad vram size on gmc v6 and v7
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Qiang Ma <maqianga@uniontech.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 srinivasan.shanmugam@amd.com, Arunpravin.PaneerSelvam@amd.com,
 le.ma@amd.com, Felix.Kuehling@amd.com, mukul.joshi@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240422052608.5297-1-maqianga@uniontech.com>
 <68f02c5c-5591-4d6f-9926-b0fc6f9f6287@amd.com>
 <D94775003178862D+20240422203329.49844e71@john-PC>
 <bde48eef-4d8a-4cfa-b824-6de88c0f87fd@amd.com>
 <CADnq5_PQ67J9ytb89-DqOgDw5V-s98TOyVjT5BGfkWMYv5sMQg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_PQ67J9ytb89-DqOgDw5V-s98TOyVjT5BGfkWMYv5sMQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f0f2fd-2aea-47a4-f1ba-08dc62db2c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmJKNTl4T1o5YW5scUErOTlTczVnMmNOOGZ2K1k1ejJiem9pRmVTYVppR0hp?=
 =?utf-8?B?Tjd6UmlJTGxIL2k1dHM4bkhLejZNcjV3N1IrVWRod3VMSmo4Z3EvM3ZvUTFQ?=
 =?utf-8?B?Y2RVa3lQV05GeG83RzhndmJ4elZqbXZSVDh1b3BVVXphb0trcTBRNXVYK05a?=
 =?utf-8?B?N0FlYnhnUkJ5WWlETFJMZEVFejNsMDljRE8zcXA3UXdwR3VBaEVWMEEvckh0?=
 =?utf-8?B?MEoreHZ6eXZrMGZWQjVud1BXRXhUNld5NnFrWW1wYkNQdUxRTGlTT2NSdU04?=
 =?utf-8?B?d1R2UVIyM2U5bXpEU1NoL3pTcWdJbnNRVi9NanEyNHk2V09KUC95SmxFcER3?=
 =?utf-8?B?U0JGOGRpUEV4dEE0bng2YUJvN1hoSlpZWWNueGxQNGJUR2RCaFpoS3ZzY3dq?=
 =?utf-8?B?aU5oNlZuQnFKK0lNYmRhZEc4dlpXc2lBR3ptNjArenYyNWpWNGkyYklnbzZ6?=
 =?utf-8?B?R1l6bnZNdCtUOGxFWGhFY0tDcGJvU2I2TzhKclpIdGR0ekVTNnpBb1M1RzNU?=
 =?utf-8?B?OFRmamZTNUxCNzUxSGNZdDEraUt6TW1BQ05VcEp3NWRZTzZsMllXQ1c5cmgv?=
 =?utf-8?B?amUxNkxlSElrK0NCbC9LN0o0THJNc1QwaXFaamtwTktXbHZpYWQwUy9OM3pl?=
 =?utf-8?B?UjJLaXFxSWhlUVZPN05JQmlMRGNldWJxU2UwbFlDdDlDMndNOU1iaG1MM2lF?=
 =?utf-8?B?b0tJWTNZMllLbEFnWmw4SGZQbG4ySEt5SXJFcWdrQWJGRmdGWit1N2hZR0h1?=
 =?utf-8?B?M0JWT25RODQ1TTRCM3VNQmtqRktnYVpPdWVITmU0Z0hRaHdRaGY2ZmtpSGl0?=
 =?utf-8?B?czFQcnk2c3A2Z0FBTVgvS29nQUpqRlc5WXVDRzZDMWhqMFhEOTlJMU9Sb0NO?=
 =?utf-8?B?K3BiVEhuakRoWkFTcFdLdHE4ZjNPeVI0WXVpOTdtWE1FTG1oOE1yazVhTThs?=
 =?utf-8?B?ekp5U0MweityQjBTay8yU2lwYjIvYk1VeStuR09GRk1xaDVUcGY0U1ZRU2dn?=
 =?utf-8?B?dCtWL1NOS1BOemFKd051SkpDWXpNZnlwcG1KcDc2bnJYTm1LaURndlYvMWtV?=
 =?utf-8?B?Z0tEQlFlc09EbVlWMGtUdmVKNFpjWEU1VzMySHMvKzJsYk5OaEhYbjNOTzRK?=
 =?utf-8?B?VlhFK3ppYTM1QnhCV1NKOEVxYmovcHRHdnRHVjhBSExjdnBndHh1aTVOL1NM?=
 =?utf-8?B?T3ByMUpWay9OUlhseGxqdTdUQzVDMUhITUZQWXhYdlhEMDF6c3YreXpVd09k?=
 =?utf-8?B?cVZJVE5SbzhkanMwaXVoSkF2OUp2T3VLc05lK1JFOU1XOHdPTXZ5eFRHTEsy?=
 =?utf-8?B?R1RXNjR3bGR3WE4wZC9ZVkJRVTNXQmxRbXAyVEltVjlvelJvaXE1dU5mV0Ft?=
 =?utf-8?B?TDVUZEdtN1JvYXppTzBGdk5sMkdqK2p1cVFxMS9IaFNhcjBlTFdWMllubTVv?=
 =?utf-8?B?NlZmSE9KM3p4LzZMdTJDcm52Qk43c0JmZ0c0TjI1Wm5RYlF4aGpwK0dhVUdN?=
 =?utf-8?B?MDRRUFJSRCsrckxVdjlYS2pQNXVKenZSdnk0eWRjWHRzUDVwQzBWUnpmRGZr?=
 =?utf-8?B?d2tFdkhwL1BaQjR6ODNnUXBXSzJHdXg0T09tZGtTRkRLZzdIYUxFNElSbGZv?=
 =?utf-8?B?bUJrVWxEYlJiYXFEN0lDU1ZvTUpQTmVmb0k3UktoVnlkMG1ZVWsvY0FTZDFu?=
 =?utf-8?B?MTUrOWlOOEVnaFBlUE9vSUdTVHFaVUpMK1JXeUxBbFIzTzlIeDhGdUZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVyZE5iN2ZRTHFobnV1dmM4c3hEK1ZTNVkzUktBOEhwRFVGM3Jxc1ZPdTgr?=
 =?utf-8?B?MmZ3aGxFMmZWckRFemZya08xM3FNdjdwYWQzWnI2Wmh6aFd3VEFXUW1UVjBQ?=
 =?utf-8?B?R09SL1FDOTVaWUVSMUdkQ0sxUGZsZDYxaXg1NnRYQ2E1RWRuUHp5VWJWc3BQ?=
 =?utf-8?B?ZWpLVVR6ZEhmRTJ5aVJNc2UzUlpiKzdJU01mMUNLazVwZWZrQ1RWL1BJa2Rw?=
 =?utf-8?B?RDJHVUttZTI2azhTRVBtT01sdkdEbG1YMjRUbkU1Qi9velZiYVhIb0NWd1Jy?=
 =?utf-8?B?aVBxRmI3RklCNS8xakJIRzY1dXNpRDhydC90QnI0WlczWXlqWFVqRStTeFNK?=
 =?utf-8?B?U2FGeU9qY1Y0c3M3bHUxbTh1M3VCS0dRR0xOZDl5QllmMWJFTXVKR2o1RHdh?=
 =?utf-8?B?K0N0TTJ4VlZrSGxVRTNLYmdmMTZuTlJiWjVKUWhJLzFhWE8zcW9Ybjl2YXhF?=
 =?utf-8?B?UGthY2Y2VUN5TWhBdStQV0EybHQ2YUs4a3YvVXpycmM5eEk3TTBhamZBWEov?=
 =?utf-8?B?eTgwb3JNVzE4cVJ1WU5UNms4SU5oSGVsanFyS04vTm1TWkJzaGxxMXBmNDdR?=
 =?utf-8?B?aGRFR21SbHlzVjFGMXlzYlVKeWpjRHZtcE1ra1NrVTVQR1VXektXclhwMGlr?=
 =?utf-8?B?T0ZjL2Y2c2ZzTXU4RndtM08xWHZCaWdBenB6aWNOVnZrV3NzeUtLM3pycXBs?=
 =?utf-8?B?SnFMSmd0enFCbTF5QVJDWHVYcGF4akM5QVB2WnFXZ20xKzZCZ0l3R0thNjQ4?=
 =?utf-8?B?WTFzUWZMUnZrTGd5dFlBLzZVOERxVHN5WmtQVzNRYjBGd2RlVFBzVi9CQjB1?=
 =?utf-8?B?bjF2TldxOFpFekYwOUVVOWw2OG5ZMzVUYWgxK2dUYUZjZTlpblQySDhJSXhJ?=
 =?utf-8?B?aGNhSEt5MElmSm56Y1ZhNGdzRXBldnBzZmJPTTJpaDhJRzdSR0l6R2ExYmFp?=
 =?utf-8?B?MGcwdFI5OXdPb2RLOEVHUTdsRGlZSDFSUUxxcGorZENOcUQvTXlMb2JDRTJU?=
 =?utf-8?B?eDRiR0Jpc3Q4c2gydVJWTmRKZHNObk5IeE1HMkd6MUtsL29kRnhKRytqYXlw?=
 =?utf-8?B?RG9BdThQRDZlbktmQm96dmZSbEpVQ0VQUE1PNFdFc1lRb3lOdWJNZ0lqN1JJ?=
 =?utf-8?B?MDY2TkRBUFNVdmZldUM2Tk11MEdpZWVJQVBZVFQwc1BDSGJqSE9zd0RQYXlL?=
 =?utf-8?B?ZzdvOHluekJuZXlWSE04djM4bUVTV0JqYUdDdHRLSHdpbkkyUzNsQjlkdVpY?=
 =?utf-8?B?WGRDajBXWEd2VnpUQnNaSmh1OXdpMFAxVGpwQXBNdGc0VU5JK0k3cllPZDBO?=
 =?utf-8?B?VTYwN3BFK1U1YnN5cnlrczlHbWhBT011aHNFcXdqOUtXZ3FQSXg2SHZXUDhT?=
 =?utf-8?B?VDk4U0VxNXdNbmMyUFdXcTd3dFkvL1FNYThZN1p2ZjFtOGVReC90YnlVY0x5?=
 =?utf-8?B?bWZXS0ZqQjRYYTNISXNmemlnaVRWZERPRHh6K0VmaFp2ZHRHSHAxSGlNRG42?=
 =?utf-8?B?RVVGdmdvckxZWTREQkc4S3loWU4zTnpmUVVmZFFaaElob0FtUkJWaFZ2WXIy?=
 =?utf-8?B?amxCaHF4MDR0V0lHZ005R0EyblF5d3h4SVZadUp0MHo3NldYRk5SVUxLM25Z?=
 =?utf-8?B?Vks5Yng4NFlxR05FYXV4UkVKMExPRWgzSFFtU0d1c2N6RWM2b1dUeXNDWFl5?=
 =?utf-8?B?NkV4ME5xQnp1VHJsSHF5SDRsV3NmUEx6WE83UjhUUmwrdFZBRGRVbDBTa0VW?=
 =?utf-8?B?L0hQZnhxVWJYdjNveTlWWm1ISk5ZZ1MwZWt1MTV0Qm80UzNuYzZsZnBrOE1P?=
 =?utf-8?B?WmpvWGRGVm1oWmtIKzVTM1V5WE5HTVBDVy9BSWFaejhVYVJIUXlGNEFqQWk4?=
 =?utf-8?B?V0l6cGUvdzY3enNoUjZKcnNnK2ZtZkJZR1BiRExudDJkczlxVnI4NW5SVHdi?=
 =?utf-8?B?VkRNMEswYys2RXNFdUJMV2xEbXUrcGJxeFBOam9MMTM4SHdTazFxQlZWb2s0?=
 =?utf-8?B?bi93QTgxQ1FTeFFYMGJLNElrWEMva1o1bDlXaCtlU1dsaTZTVzZVd3pqdnRh?=
 =?utf-8?B?RUpGTUpvWUNud2MyaHl6TVQ2UkQySGlHNzFsR2tJbTRiTHpDZXMzWFFwQ1lX?=
 =?utf-8?Q?0SAaHHp+GLyJayjWXYjz0vgew?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f0f2fd-2aea-47a4-f1ba-08dc62db2c34
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 14:47:46.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cH9dNdeiMAq2Ndyg1Im77U1/ZEvkI4XeK8i1w7nlvw9DONrl2832QrrYe/npoMqf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7269
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

Am 22.04.24 um 16:40 schrieb Alex Deucher:
> On Mon, Apr 22, 2024 at 9:00 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 22.04.24 um 14:33 schrieb Qiang Ma:
>>> On Mon, 22 Apr 2024 11:40:26 +0200
>>> Christian König <christian.koenig@amd.com> wrote:
>>>
>>>> Am 22.04.24 um 07:26 schrieb Qiang Ma:
>>>>> Some boards(like Oland PRO: 0x1002:0x6613) seem to have
>>>>> garbage in the upper 16 bits of the vram size register,
>>>>> kern log as follows:
>>>>>
>>>>> [    6.000000] [drm] Detected VRAM RAM=2256537600M, BAR=256M
>>>>> [    6.007812] [drm] RAM width 64bits GDDR5
>>>>> [    6.031250] [drm] amdgpu: 2256537600M of VRAM memory ready
>>>>>
>>>>> This is obviously not true, check for this and clamp the size
>>>>> properly. Fixes boards reporting bogus amounts of vram,
>>>>> kern log as follows:
>>>>>
>>>>> [    2.789062] [drm] Probable bad vram size: 0x86800800
>>>>> [    2.789062] [drm] Detected VRAM RAM=2048M, BAR=256M
>>>>> [    2.789062] [drm] RAM width 64bits GDDR5
>>>>> [    2.789062] [drm] amdgpu: 2048M of VRAM memory ready
>>>> Well we had patches like this one here before and so far we always
>>>> rejected them.
>>>>
>>>> When the mmCONFIG_MEMSIZE register isn't properly initialized then
>>>> there is something wrong with your hardware.
>>>>
>>>> Working around that in the software driver is not going to fly.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>> Hi Christian:
>>> I see that two patches for this issue have been merged, and the
>>> patches are as follows:
>>>
>>> 11544d77e397 drm/amdgpu: fixup bad vram size on gmc v8
>>> 0ca223b029a2 drm/radeon: fixup bad vram size on SI
>> Mhm, I remember that we discussed reverting those but it looks like that
>> never happened. I need to ask around internally.
>>
>> Question is do you see any other problems with the board? E.g. incorrect
>> connector or harvesting configuration?
> I'll need to dig up the past discussion again, but IIRC, the issue was
> only seen on some non-x86 platforms.  Maybe something specific to MMIO
> on those?

I honestly doesn't remember it either, but in general it's the job of 
the VBIOS to init this register.

So if we see the upper bits mangled the VBIOS hasn't done that correctly 
and it's quite likely that this is only the tip of the iceberg of problems.

Christian.

>
> Alex
>
>
>> Regards,
>> Christian.
>>
>>> Qiang Ma
>>>
>>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 11 +++++++++--
>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 13 ++++++++++---
>>>>>     2 files changed, 19 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c index
>>>>> 23b478639921..3703695f7789 100644 ---
>>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c +++
>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c @@ -309,8 +309,15 @@ static
>>>>> int gmc_v6_0_mc_init(struct amdgpu_device *adev) }
>>>>>      adev->gmc.vram_width = numchan * chansize;
>>>>>      /* size in MB on si */
>>>>> -   adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>>>> 1024ULL * 1024ULL;
>>>>> -   adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>>>> 1024ULL * 1024ULL;
>>>>> +   tmp = RREG32(mmCONFIG_MEMSIZE);
>>>>> +   /* some boards may have garbage in the upper 16 bits */
>>>>> +   if (tmp & 0xffff0000) {
>>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
>>>>> +           if (tmp & 0xffff)
>>>>> +                   tmp &= 0xffff;
>>>>> +   }
>>>>> +   adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
>>>>> +   adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>>>>>
>>>>>      if (!(adev->flags & AMD_IS_APU)) {
>>>>>              r = amdgpu_device_resize_fb_bar(adev);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c index
>>>>> 3da7b6a2b00d..1df1fc578ff6 100644 ---
>>>>> a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c +++
>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c @@ -316,10 +316,10 @@
>>>>> static void gmc_v7_0_mc_program(struct amdgpu_device *adev) static
>>>>> int gmc_v7_0_mc_init(struct amdgpu_device *adev) {
>>>>>      int r;
>>>>> +   u32 tmp;
>>>>>
>>>>>      adev->gmc.vram_width =
>>>>> amdgpu_atombios_get_vram_width(adev); if (!adev->gmc.vram_width) {
>>>>> -           u32 tmp;
>>>>>              int chansize, numchan;
>>>>>
>>>>>              /* Get VRAM informations */
>>>>> @@ -363,8 +363,15 @@ static int gmc_v7_0_mc_init(struct
>>>>> amdgpu_device *adev) adev->gmc.vram_width = numchan * chansize;
>>>>>      }
>>>>>      /* size in MB on si */
>>>>> -   adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>>>> 1024ULL * 1024ULL;
>>>>> -   adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) *
>>>>> 1024ULL * 1024ULL;
>>>>> +   tmp = RREG32(mmCONFIG_MEMSIZE);
>>>>> +   /* some boards may have garbage in the upper 16 bits */
>>>>> +   if (tmp & 0xffff0000) {
>>>>> +           DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
>>>>> +           if (tmp & 0xffff)
>>>>> +                   tmp &= 0xffff;
>>>>> +   }
>>>>> +   adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
>>>>> +   adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
>>>>>
>>>>>      if (!(adev->flags & AMD_IS_APU)) {
>>>>>              r = amdgpu_device_resize_fb_bar(adev);

