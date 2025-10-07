Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E14BC1F0E
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6234010E6DD;
	Tue,  7 Oct 2025 15:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VrehuM5h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF66210E1B8;
 Tue,  7 Oct 2025 15:36:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYQCdyJ283IZZ6YJPHM1obJjH/R8om5X4UwRDlqJJDw89seEcRzXBd7Vt0D7zrb+uMo4LoXMv2fHXLLzGwBD+Vtr4uw5Cm0IP+k58lfZugTQeLrfyF9bCRncMuHGxkRJJpk4ySfQBnB5a3M44dyfQXX9sXKo2y2tg+TxRDB/JeZE7rnhA+42BtkDa3iSKwYAc4r3IQbyOUA7gkOUQI2nVQzXQ+TgJGuPM/WnTuMRKWvWYfWGdWtN8zj9UVarLgW7CYskhfjQBgsXBgTKcNry6UkSGSRVdq4noGKAEn0SFq/40PHOA6WPoyQRFyid4nrgoToAr3i6+qK/p197x/jN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUka36Lk/hhxRJtDPjZXtdF8v76OPtzoItQp2uPVXCQ=;
 b=MAYTvlBYLnr/D3xZahWiM76v69CAXmDSJdcpZ5PhGIufSkQSBYD19PYMnAuXXH8rCciQtrJOdi1fe1HZmYmtj0L+LTw4oSdFKgtpuiTWjfece4zHeNsKgQ8h2+WXDKnmb/rwNXI+IE/jRRR62+uCpQL0igiWfxGjtET2kY4BjvmWXBSdh5urXWx8Avsa9O+JQrVu9wqY4TEg+nwvHWXrg7n1mW4MsMvk5ATcmRY8fHfXCpIK0MWTHNnpCTKcK3d4cG3j8G+ZpvSvg2DrrYs1L+yT6uxXnXmimWuw9gqLUOXCq4DzHesHrBmO1i6yfcjUVAhlD2Crrn8Gvn80PTmhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUka36Lk/hhxRJtDPjZXtdF8v76OPtzoItQp2uPVXCQ=;
 b=VrehuM5hjxOp2s0DKNQCMxSkrOCTMqeT3d9ixDjQSEm/8OVQdJGcFO/ti2Gof2x61qEB8a6QQA+38yFoIm0b6Eiu0uTqdFBYoKhoKWE4pdSxsKZ/tF3lsxgK1mIzcx527DNOpol9PJ6Ftbcs3xgkEUr/UEL8ShNayGxufvSmRy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7100.namprd12.prod.outlook.com (2603:10b6:930:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:36:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:36:21 +0000
Message-ID: <4f2e1bef-28c1-4af2-b088-ca4f907fa152@amd.com>
Date: Tue, 7 Oct 2025 17:36:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/5] drm/ttm: Allow drivers to specify maximum beneficial
 TTM pool size
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20251003135836.41116-1-tvrtko.ursulin@igalia.com>
 <20251003135836.41116-5-tvrtko.ursulin@igalia.com>
 <dddd1c34-94ba-487f-ba0b-14e10410dd12@amd.com>
 <cfb8ec02-4870-469a-9d23-51e3c0f1778c@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <cfb8ec02-4870-469a-9d23-51e3c0f1778c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fb0f69-076b-4eab-5e9e-08de05b74404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1UrVUM4SDJLOTZKVEI0UDF3L21zdERnWlhZYWM2QTd3ZVVjcVYrY1JnVDdz?=
 =?utf-8?B?ZTV0Zzd2enhRN3k4QklJclhnWXNsaUV4Yll6blAwNitnTC8xQ1JhRDI0RkpT?=
 =?utf-8?B?MGlidzRRUk1CdmhxSXc0cXc3VUxxNXU1QlAxT093czFDTFdScTR2Q2swQk9p?=
 =?utf-8?B?RXJrWTVNWTZNM0Ewa2Nzd0dhbTZtUDFmcTAyRWFTWXBRbW5USnJZUC9BVlMr?=
 =?utf-8?B?ZC9ad0s2enNQYTU3V2xEYTRKeHZpMVB1WXJGNFR4Qkw1U1dBNUt2Y3AyUEFR?=
 =?utf-8?B?US9DbXQwdlM3a2RaaEpmV3dwaXdRY0xvL25abHY3czdwUUZGRjE2Zk93Z0lX?=
 =?utf-8?B?Sk8vLy8vY29RTURSMmFHbkZoR0JmY0hFcEp6OGV5ZmRvdlJBYU1ZaTVPWXho?=
 =?utf-8?B?WS8rWGVGaVhtOWpROTlQNGczeGdFajlWRGtlRVpXVm5VbGZoQlpva04rS0RD?=
 =?utf-8?B?c1NrY1EwM2VIMm1HOGRISGVlUjdtaGVVTXZCcWgveU9FQVdMaVVHUWhCZHda?=
 =?utf-8?B?b3Z1d1Bvanl4TXVjUmdZdG0xNGZCUlhUSm5DRGltT3JsTTg5WG0vckNYUDhE?=
 =?utf-8?B?a0hjWkZhNTJFdkxhNmxON1Jlb0dsK3FTQ1JPYU15YVcxUVlYTGZrU0JBY3gv?=
 =?utf-8?B?Mmw0bVlXVThvUDRZWllOMi9CUEszUnhlbVUzdy81TTRWZnhUZGIyK0F3YWt6?=
 =?utf-8?B?b0VrQWNRU2wxUm45ODZqK0hscmI1c29mV1ZVRmwrS0NCbU1CK3pWVGZrZXdz?=
 =?utf-8?B?YXpsUWlhdXNCTDY3RXhJR3IyM2RiVnlSTWxCMkRLUDczVkJyVXV1dVZlUkxs?=
 =?utf-8?B?SUFEYnBFL1BBbnRZUlBoU0dxdlJ0eSt4N00rUTB6d3RJTFFFMkl1RUtnb1hZ?=
 =?utf-8?B?MmtUVjhXcFVJNitWajhVdy9MTUhsYm5uNHBOUkRWdEdSeThaWTBxdnJxY1hP?=
 =?utf-8?B?TmZkcU1XcjBXVDVZaTA5UVVQZWFla1I4d1dmUDdYRjc1UldOcjVhRGhydE8x?=
 =?utf-8?B?b3VmRS9SdmhnUmFwMzd2bGkvNnp6RFJBQk4reHNhNERveHNnQlJidC82ZG55?=
 =?utf-8?B?U2tRZDJYSXIrN3RCZXRvRlhMUzkwVU5FN25RWTVwbi90WWtCeHBHcjFpZTA2?=
 =?utf-8?B?WTRPd20zaS8wSE9jY2pTMmphY0VLbGFyVS9wdDVRazBSNXVKR0UvbEcydEZF?=
 =?utf-8?B?M1pvZGpwWHFzU3BOZU5nM1haSzFBSVYvenhBVFJPMkhIVmdUVVNjU2wzMSsy?=
 =?utf-8?B?c2tXRmlNVFBKYUtFc29uYXFsYi9zbjlOWFN0eE5VTVk4ZXQ1THprQ1J4MUhO?=
 =?utf-8?B?S0JqZVF4K0ErdGs5UGVZb3RzU2hMelBoazd0SWxqSjluUE43emdwTWhLMU9i?=
 =?utf-8?B?NW9YUlRNTyswa2V0Rm85elkvYjI5ZXhXeVRMRnpqRXVIdGd3T1dlcElIZ1BK?=
 =?utf-8?B?aGhLcERFVjF0T1pmenRwSFhyWVprSDBVdmxHTVRvOGJQRUp4WjNIVW9abkR5?=
 =?utf-8?B?YmVyMGRQR091eTFnNGlrR1ZPampUWkpVK2pPQ0hFb0RUR2FmcTB5YmZ5Q2FU?=
 =?utf-8?B?VHkwaXQyZVZEdUkycDN2WDNvV29WSFpzWW8zWGI2MjJlL2xuNEZoWmtlZmtr?=
 =?utf-8?B?eGh6Vm1pM0t6VUlacXVJRkN0SjEyNHFtRjFWMys3c1djUDk0WmpMOWN6MFQ2?=
 =?utf-8?B?bTh5MmczbnBXd05qb29HWm4vT0lqOFhpMEs5Zm1ta056MlFVUE8vSjZ6TmJE?=
 =?utf-8?B?U3JURDc4aG9ibmhWK2poOTRrREhxZW8rb0M5OCs0SGxsOHZqaFlycEJjdHUx?=
 =?utf-8?B?VXo2TjdWdFpBMnBZSHM5aHhWMG40bHFEYnU2SEQrclV2WnFEOEdvUS9HcG1S?=
 =?utf-8?B?WlhLTDBSWTJhWFJoUkY1WnIrcEZJMy90a0lNVS82TDc1L2NyTjI1Z3RIeTho?=
 =?utf-8?Q?Lo4yr1DlaL8gjaabafaetzS55iygiLHO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emhTd1MramhGT04vc1o4T2hESkliVTFDSFVRWjVDRzZ6TlhxR2g5NzhnY3d0?=
 =?utf-8?B?b1hkWDBYRnZCMXJ1SlU1anNscGxwc0dweTNJeStPbk1SYk50OGsxdDFqK3ds?=
 =?utf-8?B?OU9pWm0yVDFEVmxzUml2MDVBaE94U3FsUFBHKzJ1UGNpaGVKdVRObHdTaUYv?=
 =?utf-8?B?UVhtVkw1Q2Q1d3Q0T3N3QVpQQmhoa0xxMnNLeWtCOHBPRy80Z3hSZHh5VG9Q?=
 =?utf-8?B?ck1kK25DWVo0d3RBTTJtbUI0c2pNNkdrcWFIYTYwMnlGZEMza2xwSUkrRFpT?=
 =?utf-8?B?N2wrR2h2amJjN0JMQTYvT2FFNmQzYUZhNUkwWFRDNXc1aTNkMDJ5V3hQWnNq?=
 =?utf-8?B?S2lIQmhaS3BiaFc4NHlmd3hjcm1iVGIxSE5iSXJGMUhVemFIZXJNUVJrMUVY?=
 =?utf-8?B?TzhsTEcyMGI2a2ROSFlGdm9PaHY3VE9QSndvTElZUGw2T1lLNVZHc3RscHlz?=
 =?utf-8?B?VjRJVjdWV1N1MndaTDBpME9nR1RpWTlIU3FXa3JMc3A4MVc5ZXhjcDZVbWp5?=
 =?utf-8?B?ak5nd0RsKzhuM1ZEVnJaWGRsZHNDc0xNZVUvVldONmpjWjFZNlVrUlN2bDFn?=
 =?utf-8?B?K3NEZWttUk1nVk8vK21iVkI4MEh3L2xidmZTNlVkYk8rZU1DOEtOaC85SUUy?=
 =?utf-8?B?ejVFaCtIYnhOOWhWRmdnZjRFcVJkeGlSVy9BUFdObXRqRnVicUZTeUNsUEo1?=
 =?utf-8?B?TEZwWTBRSGpoYXdqcWRzZER4a2ZKdjQ4ZnBOUVZ3UE5oTUlCc3VSeXBJcGd3?=
 =?utf-8?B?N3RyaHowZ3F5R1lXYjNmZ0dJeXlXd3hjb0VTSER0cnlMekp6ZHAweDg1WVZx?=
 =?utf-8?B?WnVRTWVYc2xVenFnczBZdzNCd3ZVMHdBRXhFMkt4RS9lM1c3L0dVSUlaelBL?=
 =?utf-8?B?ek1yOVdPN2RCYTIrMjRyZmFDN2RhWWFVaDFZS1lqNzlhRkdYOUYwZTNHZ3Jv?=
 =?utf-8?B?REthSks3enlYSmk5VFdVb3NjMjNPUTlVZEV6ay9xMEVQS1VzcFdIZW4yUzVM?=
 =?utf-8?B?ay9NQU9hamZQOUFMRTNDcnJZeG05L2FQb3RGU3NSK0NRbmc3djNWWm5lMFVz?=
 =?utf-8?B?eW1TTjhKRFVxejlBOEdXS1NSSHViV05sblh2V0xPN3VVeW5tbFk4SEJ5UFBJ?=
 =?utf-8?B?V1JKK2RSVWNzdkdIL2lnZDNoaVZqZDhHdlFZWGFuQVlwempxUFdNaE9lUkdo?=
 =?utf-8?B?Mit6dm9yQStEbHlmUGphSlBXWEw3dE9TclVPOHpoUU1heE5EZnBWenl4RTht?=
 =?utf-8?B?YjRjQXZKWTVaVElWWUNncEFmYzdSTzE5U1lGYnZLVEo3SllwRTZMVXZoNHZV?=
 =?utf-8?B?MnBrTFBEZS9KODRtdlE0MWRxQ04zMlZHT3RDdFkyUFoyeW9uV2w3RnIrL0J4?=
 =?utf-8?B?WHAzalhCcWtVL3c1eXAvbTlrZlYwcnBWM004ci9CQ1RvQTJrTXE2YVY1Z1FR?=
 =?utf-8?B?Kzg3a2VTZkpWeDRRVGVNMHpZdkc4TU5uUTdGbFJaY2dxV2JiVzJrM2gvVVhm?=
 =?utf-8?B?SU1oZXNwek5PYmZMYkFPWklhQURaMHRnR0tTWk9pWVlnSmhNa1hIbFd4dStY?=
 =?utf-8?B?djZ0WFhML0I0N1FhNm9ISHdUTmZBRFE5aVJoMGZmRG1XWXV0ZmQ0cWNwcDFQ?=
 =?utf-8?B?S3lQeGF0cGxxQjB4TzFSbWtwdGlZR1kxRDhlb0Y2Y29UeXpKajlBUllncWlC?=
 =?utf-8?B?V2hqU1V0aUwxMVQ1d0E5b3pldDZGV1RHczQyK3pKZjJ0OTczVDdFTGNha0gz?=
 =?utf-8?B?Vjhod2x3aTd1NlRiaWczemZDWVU4T2pyRk4xaXV0b3RKMERrNGQ3SmE5R3Bh?=
 =?utf-8?B?VDFvK2dNbmgvWC9OZCtpT2NNdmgzK2JpNG9Bbi9jNVJ4a0Y2dW8vYTVyS3hZ?=
 =?utf-8?B?QXd3Um0xKzRWTWhlZytFSGszcWpwd2RVSC8zcTNkVGk1aHhjVHhsWUh3U0M2?=
 =?utf-8?B?eXJaMjB1RDl1MXBSbkR0c0tZcHNNU1orQlpIWmF0NjNqSnNmeEE2VFg4bVVi?=
 =?utf-8?B?U3R1MUdrQnAwWVIvQk5GUlRHa0taUnh3KzQrSkxSVEg0N3gzQ0IxWitTQjYx?=
 =?utf-8?B?VXVZWHFDMWluU1ZSNGNPMlZNbFVnNHFVanRFWWcxMHVOc1d1WkdEd3gwVjJT?=
 =?utf-8?Q?SInyG9f/vS+1hAAhvGxK3Qip6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fb0f69-076b-4eab-5e9e-08de05b74404
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:36:21.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2L7x48kTrmPF3//s/mHQ6PqjpPzioVwezSe22M0ELbqQyJe2ouNWC/do4I/mjWe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100
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

On 07.10.25 15:57, Tvrtko Ursulin wrote:
>>>   -#define TTM_POOL_USE_DMA_ALLOC     BIT(0) /* Use coherent DMA allocations. */
>>> -#define TTM_POOL_USE_DMA32    BIT(1) /* Use GFP_DMA32 allocations. */
>>> +#define TTM_POOL_BENEFICIAL_ORDER(n)    ((n) & 0xff) /* Max order which caller can benefit from */
>>
>> Looks good in general, but I'm not 100% convinced that we want to mix this value into the flags.
>>
>> On the one hand it makes your live easier because you don't need to change all drivers using it, on the other hand changing all drivers using it would potentially be cleaner and document the value better.
> 
> I was not 100% convinced either but it looked a reasonable compromise.
> 
> My thinking was to not simply add an int after the existing two booleans but to try and clean it up at the same time. Once I replaced them with flags then the option were to either add a new int argument or add some flags like TTM_POOL_BENEFICIAL_SIZE_2M, TTM_POOL_BENEFICIAL_SIZE_64K, with the thinking there probably isn't a full range of page sizes. But then I thought why not just put the order in some bits. Advantages being it adds names to anonymous booleans and is extensible with no further churn.
> 
> But I don't know, I am happy to change it to something else if you are sure this isn't the way.
> 
> If we add a new int then it has to have some "stick with default" semantics. Like -1 or whatnot. With is also meh. I wouldn't do a zero because it feels conflated.

Ideally drivers would use MAX_PAGE_ORDER, but yeah that is quite some work to do.

Feel free to go ahead with the flags approach, it should solve the problem and is not much work for now.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>> +#define TTM_POOL_USE_DMA_ALLOC         BIT(8) /* Use coherent DMA allocations. */
>>> +#define TTM_POOL_USE_DMA32        BIT(9) /* Use GFP_DMA32 allocations. */
>>>     /**
>>>    * struct ttm_pool - Pool for all caching and orders
>>> @@ -111,4 +112,9 @@ static inline bool ttm_pool_uses_dma32(struct ttm_pool *pool)
>>>       return pool->flags & TTM_POOL_USE_DMA32;
>>>   }
>>>   +static inline bool ttm_pool_beneficial_order(struct ttm_pool *pool)
>>> +{
>>> +    return pool->flags & 0xff;
>>> +}
>>> +
>>>   #endif
>>
> 

