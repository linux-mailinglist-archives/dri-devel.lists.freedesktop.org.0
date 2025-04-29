Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51E6AA1007
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC09B10E4B8;
	Tue, 29 Apr 2025 15:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lmIBLT2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D6810E4B8;
 Tue, 29 Apr 2025 15:07:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLdkWShXbv37H0Ogxnu9/ttzpAczFtiFiysleQlUVIXqyqy7A0pPSauZksrTEZXtnR55ThEqFQbRcLE/PmnYPJ5Q0faxPHKPCgGXARe1NiEwuhCjjRRY+4pKpImEuRdjXwpimkPKIsR87JhVjDpxGK1+PSgq4ipgqOGGuoL5yZTK9Ci0/hVv9LPzz6dUACTGALvTOZrSriJ43o65UDdT211zP3GhoC5my+jhHxJ9bt73+CoVt6+PavKljLGFPtRrLkjz+5K70pCpus6+69/3OkgYlp0tRVrbwMrFoHqqtZwkSPQ8pmbnOdliGHGXnCIBNwjllJATxH146jUcnnpeIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHyDJQB6VKoiPdfYG4G0UYl6bnJBJeRmRYs8z9tD8To=;
 b=rZGwlXDqZw2KluoNLirOVNbM+VlCtLkvbM9dgIReT4wDrnfQx8fW3Tib7rte9I0wbQ7mmvWEmpjH35eBZiihmZ8HKIHghEZqWWKA3GwrocTgeKACPVPYoHopOn5rhnGiwT+XfH0Jkowwzgk/TULDEULqZ4jDDgqPc0uKDhTkKpSmgidso666eRlMSxQCyOxfiVJXqAz9NTmfzfb22wtgvtT/GDNgD3jimkgXS4ID1JOtlcVpL+wdKTHuZ6GNLtj684t2UFs98uCjD7TiBXCt79sQ1RMGMKI6Md/fy1MH3vbnr/5IfVqXLODSPiRZ3mIBMwhMJ/ZddO7aZaCqXS9IQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHyDJQB6VKoiPdfYG4G0UYl6bnJBJeRmRYs8z9tD8To=;
 b=lmIBLT2WHulqdHH+NrHF2mmVrCwO62+sYu3ismTY2hndoQOSJjKAg9NjyRq3F+yb+uZn0lXIz99hmZFs1tWh78z5Wy5sWmjT1zjKt4Afa59KbQD3I0eLZWRVKNO/YNDUEE7piLrYVbxlvHrP0JUHi7m+QrZHtls3+f0GFPP4e2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6186.namprd12.prod.outlook.com (2603:10b6:208:3e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 15:07:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 15:07:38 +0000
Message-ID: <47eded5b-2efd-4e8e-8cbf-c7e4cacd3059@amd.com>
Date: Tue, 29 Apr 2025 17:07:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 02/16] drm/sched: Add some more scheduling quality unit
 tests
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250425102034.85133-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0403.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: fe42e8d7-2cd5-4e70-a325-08dd872f94a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVlBUEplOWRyWmpBc2U5allWbE1oM05QUUF6YXNGZ3J0dWtVcHMzb3hrN2U0?=
 =?utf-8?B?QnYwVWFjaktvTEUwVlZIa3JMdUFWNjRyczZsZDdlaUY0OTZRVkhzK0l0b2o3?=
 =?utf-8?B?eFFMVnYwSzdVSEtSeGRad2xvVld3SVNoZVVpMEl2K1JPWWsrOTdSK01pNzNX?=
 =?utf-8?B?Z1NRNkpvOWhndnJNeEU0V05kUU5iakpGeDNzRERpSnBqWHRSSklvNTg4WDRW?=
 =?utf-8?B?QnBsbmxlS05yNnZzSU50ZmV1VGpyS1lYM29WbE1JNlpCMmEzdjFjZXN0OFND?=
 =?utf-8?B?dXpKNGpoTFQ0MTRvMTNrUEp5VkJnTFhpNVlzNWxUZmZlakQwMlErbXdJZDIy?=
 =?utf-8?B?WGlkdWdrSDEzMG1MS2doaW0weUI2MC9KQWJvSnJJSTAzZnppSHRtSTY2Y2ox?=
 =?utf-8?B?eXRpWmNFVW45RE84djRRZ0pqYm1CUW9idjRKTXJ0bWJ1SmVlSnF4Nmk1d2Rz?=
 =?utf-8?B?R0JabHJ1dHRSeWN6OXYvRGpRNWhUc1B3cnJnNER0LzlHcS9LMDJUTU9lN1dk?=
 =?utf-8?B?V3RiOWMxVllXUzNsTmowUk9teDJMQnhlQ21tU3Bnb3orSWsyemlHOGJIMFVx?=
 =?utf-8?B?R3Z1STBxMG82KzBEaEZkOUVrUVRNK2J4d2g4dUx1UUJUZVB6VUo0cnhqVWpp?=
 =?utf-8?B?NFFrTStkUEcwYUd3ZjFScElxQVl0WlJjS3FDMWg1ckpPdFppSkZVajZYM0NU?=
 =?utf-8?B?RUJENGlycU9IWnBxa3BhVjlzNnQwVkI1c2FiMUFacUxvcnlQSXA5a0xkdk1R?=
 =?utf-8?B?WGZza25lRmVjUUtKNUdtQlZLTk9VeitMWDd5OHVFSGZxQUFPTjZsV0p5VUNs?=
 =?utf-8?B?YjBEUDNNUE9XUU03K295YWhxMUJSLzBETXZmWUp4ODJnREpMMFRGQUUzZkxm?=
 =?utf-8?B?UHU2WDR6YmgvQ3pnZmlEb3FSNEh4aENCYUlSUWl6eEJYVHJOd2VYeTYreXBz?=
 =?utf-8?B?Y1NBdjJyVlhvL3VPeEdiRktCNzJiejFlQ3dJZGFydFZlck9vT3FJTWxtVlVr?=
 =?utf-8?B?aXZMUUwzK1h4ZHVONzByR0dvREpXaTNSTDdwU2tRQTQrNXV4TE1LMklPSG02?=
 =?utf-8?B?Q1A4cmhkM3NvM29ZWmZCNmlDQW0ybElYMENWK1c3V1k5ZDB2ZXcyRDZSdTUx?=
 =?utf-8?B?VHJCSC9LVDRKeFZTUUVjUllSdXRTVGZtU3U4MjFxUnF1Wk12YzBTcThqck9l?=
 =?utf-8?B?UzR0dnpqR3hvR01MWmw3bW5qbUR6Rk9hdGovZVdOaFpBZisxdDBMT0RHdmt1?=
 =?utf-8?B?SURtcjdvY1NKT0NnK2Q5U1pjZ2lqTXJTQUlWcXphaERCMDhuQ1lDWTJBSU12?=
 =?utf-8?B?c0JWZFpmZUlHOThUTU1JQnM1aXJZZEUxY1JQWGhNUlpVWTJNbVZWYVhrRVF2?=
 =?utf-8?B?KzhMVEUweXYwVk9YNmsyUWNGLzF5YXFFaFcvbUhBL200aEEraUorZUFaampk?=
 =?utf-8?B?dnYxQjIvcjFmWEtmMFBsUStQTlkrVVpnWW5Xb0dBSWhqaFFEUUwyYjlzZGtE?=
 =?utf-8?B?bDByOUdiam91VjhibTZMVHBSY1dYdDgzSzVpSjVvOWhyN0Q3NHc4cFJFWUVt?=
 =?utf-8?B?aGZXMVlkbjJtM2JuRHR5dmhBNVdSZkhkbmlkMXU1c0lRRzVTbnRNcmVrZDFq?=
 =?utf-8?B?eDdTVTY3clFWdUsrSUFxdkdUcm5tMm9RdHF6VHlrSzVXVGFORHE1SHFrQ0NM?=
 =?utf-8?B?S2FWRHhlNmZiVHJRWWRLUmlPZ2MwV0pIdnprR2RDMTdjZk1lcGZIUndQWHZE?=
 =?utf-8?B?TDVYTUtzNms2dWlmV3dPOENWMVB1cmdtWWxrOW12aklHVElvSStLenc1bzdT?=
 =?utf-8?B?RDZOd1VyT1VtK09Vb1BBQlp0NFBHTGJFS1J2aVNhWCtXZ1d3OTBocU1Ecllj?=
 =?utf-8?B?cGdtK1ZHWnQ3a1pTV3RpMWlTRVJ4bnNSSncwT2ZZcUFJajNPYldESVVwTnZj?=
 =?utf-8?Q?+N6VBXrCdCk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJUeWprQlo1L1pGM2dTNVVNUHRIcGdJdDB0bzZvNlFjV0Y3RXduZ0FhUkhM?=
 =?utf-8?B?QzBEd29aOVZLVGFrbjZRaWNTWTNvYTdkakgvcFBEM05FRFNCWjhLam5MVHFW?=
 =?utf-8?B?bVVtLzJWNlVaU3Y1RE1VS0Fqd0dIcnNVdFVRSE9GTVVPcnBrajhxYllDY0lu?=
 =?utf-8?B?M1FTQ0tnODRneXp1azRscGVoSkhKMWgvT24xZ2J4VGRMQUtGVXFmVXlsVFNU?=
 =?utf-8?B?d2xHN3ZsZG9LRzFBRkN2RDhzVGxYNXJldXZjd3dMcitDOHREUm9UN0pHZmxY?=
 =?utf-8?B?ZXNDTjQzK2l4Uk15cmJUUTJMMUl2c2RFRUNUakVIOVI2d0VsOTBad0UyV1lY?=
 =?utf-8?B?RXZ6eTFIekppV01HNzF0dE0vL1Fzd2xwZ1NyQmVDN0doMDRQSm5hL1dCSS9i?=
 =?utf-8?B?bkxqUk9FSFI5NklpSGdQZDVjeGVuOTdNaFNrZjRjZGJrT1VDZ0dkWm1PcU81?=
 =?utf-8?B?OVlyVng4OGFURlRVMDBvYTI4Q1M3aWdwTy9HSi9sbkM4SWdlZVpHZ0JsOTBs?=
 =?utf-8?B?VmhJa0RWcmZjSExaa1Bsa3hhamdVSU1scVFTZHJ3VjdJOHZYdlQvRFYyUEwz?=
 =?utf-8?B?THYzaWZQVG9uZ2pRQmQvMFZESmd2ZmhzdjFpQ3paM0hPWldOdkxWWEdOYjgv?=
 =?utf-8?B?QWRHeEwreENvMmJmMW1qSm1aOEQ3MFRia3ByRGZ3ZzRNUlVkMjFHR25LMFBl?=
 =?utf-8?B?TFE4MTNsTlZKWUVGMmdBSDJ3SEtxRTRiWTNrbFdFNllDMUo1cmZWNUdOV1FR?=
 =?utf-8?B?TXlnTzUyNkJ5UDF5RnNZSW1IQ3YwV01ySXRiUkZCWkpTQzIyVUJPMGEyU2Ru?=
 =?utf-8?B?L09ZVW1wcytZRDU0YnlnbC80UzRSMzdMUG1qbDh6U254UWJGeFA2Vmg3RWxa?=
 =?utf-8?B?bG1FMVVuQnh5WkI0VmRDNng2bVJuZUtRVm5oRGhwTktyZ2k2UnRIQWJCQmdF?=
 =?utf-8?B?Ym1NbHN1WENZMzdlN3orWmRtUHFRV1g4ZWhFUjROSmVpaDVGV25CdU9JdzNV?=
 =?utf-8?B?M2U1dGNLTzhsL1pCTHlwLzJUZ0MwdFAwWTdQdXU4RlhDWXZvOGlRVWJiaWRl?=
 =?utf-8?B?UTlGbnR2UHhOYlhZTURkYVQvbjJMMG9zY1g0VDlYMEFEc2dIMEhWNGNPUkRh?=
 =?utf-8?B?NUMwZlF2OVBVWUk5KytXeUpYVDVyRXU2T0gzaHhaU1E0WDhaclUvS2NkdTdm?=
 =?utf-8?B?RkRvYzc3bGRISGtscEJzVlRXYW9hVWNla0dXcldqMmhCNnZJMnBUMFJLOGRW?=
 =?utf-8?B?aVJtdDRuTzA2ZmVYbmR3MEVLQkloQ3ZBUXdveUpYUUlLUnkrVGNjL3p4ZmND?=
 =?utf-8?B?ZWhPNTZRRzBmSDYydkN4Q29FcExyVEJxb01OWEhjSFd2ZGlMb3VFdDVEVEhW?=
 =?utf-8?B?ajBtNFdScW9mbXE0MkluOFphdkdvSHZyd0tENlJhZnFaUXB6dFY3T0NJZnk0?=
 =?utf-8?B?dE9WN3pDaUFYQXVicWZEL05HOEJ4OGFFcFR1RVQ1cGprYjlUTkUrZWsyTWdz?=
 =?utf-8?B?Zzg4RzB2cXZKRDdYRHovT1VkejlsdHFJRVBrK1Bjbi9zUHBaVmQyVFd0SGM5?=
 =?utf-8?B?NVRLZ0tLU1BZTXNjZERYbWVMTUJ0N3VmNU9aT042aXAwY1htd1Qrc0dxdU9N?=
 =?utf-8?B?Z2w1TFUzbDMxU2l5NzVJWitLRXVFR244a0pjK2NrcTJaNE8vV0V6QlUxcVBW?=
 =?utf-8?B?VEx5K1BhRjRwZ2ZQTFozeXl0bGVBMnBxdmtxaEFqQ0FRT1JtVXJncFpkQWZT?=
 =?utf-8?B?UTVvSzBiOUJVakFoUDRpbHdDcWZERjl6UjZNbTNjd0oyQSt2cGQ5RHZkTytJ?=
 =?utf-8?B?L0NxYnFZaXVuY29tYVcvd0wvNGVJWW5tRUlyVTRKOWJwYmxqNUZsallZZldw?=
 =?utf-8?B?bmhkWFo5b2lDSnpyTmNFclJXZ2k4aVJZSEVZYkVpVGhPaTdWSmo5WDFsWmFi?=
 =?utf-8?B?dTdEMjZzclpsVGRhODlnbUlmNThxczRnMkV2OTFZVXFaektTTG1TbGE4UFlq?=
 =?utf-8?B?WWg2aUoxU3pwVkRyN0ZBa29LTFJXMW9ndVpSeFMwSGkxSDA3eFV0UTZua3Vi?=
 =?utf-8?B?RGhySDFEN2NkRjhtVlNJQU9Wa0NYZ25yejJMcGdXTWxUR2ZEZVVLTmsvMXNS?=
 =?utf-8?Q?ssDAsODSU/mLphpxgKutlhJDb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe42e8d7-2cd5-4e70-a325-08dd872f94a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 15:07:38.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpZzbDD/dX3GLeb9bYTCYUkatxVD9apR09zIaSmnGY9PYkFOI/AFci2v+Y3y1kVc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186
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

On 4/25/25 12:20, Tvrtko Ursulin wrote:
> This time round we explore the rate of submitted job queue processing
> with multiple identical parallel clients.
> 
> Example test output:
> 
> 3 clients:
>         t               cycle:     min  avg max : ...
>         +     0ms                   0    0    0 :   0   0   0
>         +   102ms                   2    2    2 :   2   2   2
>         +   208ms                   5    6    6 :   6   5   5
>         +   310ms                   8    9    9 :   9   9   8
> ...
>         +  2616ms                  82   83   83 :  83  83  82
>         +  2717ms                  83   83   83 :  83  83  83
>     avg_max_min_delta(x100)=60
> 
> Every 100ms for the duration of the test test logs how many jobs each
> client had completed, prefixed by minimum, average and maximum numbers.
> When finished overall average delta between max and min is output as a
> rough indicator to scheduling fairness.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  .../gpu/drm/scheduler/tests/tests_scheduler.c | 186 +++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> index b66321ef7abe..d70b47d7bf7a 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_scheduler.c
> @@ -181,6 +181,7 @@ struct drm_sched_client_params {
>  
>  struct drm_sched_test_params {
>  	const char *description;
> +	unsigned int num_clients;
>  	struct drm_sched_client_params client[2];
>  };
>  
> @@ -626,6 +627,189 @@ static struct kunit_suite drm_sched_scheduler_two_clients2 = {
>  	.test_cases = drm_sched_scheduler_two_clients_tests,
>  };
>  
> +
> +static const struct drm_sched_test_params drm_sched_many_cases[] = {
> +	{
> +		.description = "2 clients",
> +		.num_clients = 2,
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 4,
> +			.job_us = 1000,
> +			.wait_us = 0,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "3 clients",
> +		.num_clients = 3,
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 4,
> +			.job_us = 1000,
> +			.wait_us = 0,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "7 clients",
> +		.num_clients = 7,
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 4,
> +			.job_us = 1000,
> +			.wait_us = 0,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "13 clients",
> +		.num_clients = 13,
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 4,
> +			.job_us = 1000,
> +			.wait_us = 0,
> +			.sync = true,
> +		},
> +	},
> +	{
> +		.description = "31 clients",
> +		.num_clients = 31,
> +		.client[0] = {
> +			.priority = DRM_SCHED_PRIORITY_NORMAL,
> +			.job_cnt = 2,
> +			.job_us = 1000,
> +			.wait_us = 0,
> +			.sync = true,
> +		},
> +	},
> +};
> +
> +KUNIT_ARRAY_PARAM(drm_sched_scheduler_many_clients,
> +		  drm_sched_many_cases,
> +		  drm_sched_desc);
> +
> +static void drm_sched_scheduler_many_clients_test(struct kunit *test)
> +{
> +	const struct drm_sched_test_params *params = test->param_value;
> +	struct drm_mock_scheduler *sched = test->priv;
> +	const unsigned int clients = params->num_clients;
> +	unsigned int i, j, delta_total = 0, loops = 0;
> +	struct test_client *client;
> +	unsigned int *prev_cycle;
> +	ktime_t start;
> +	char *buf;
> +
> +	/*
> +	 * Many clients with deep-ish async queues.
> +	 */
> +
> +	buf = kunit_kmalloc(test, PAGE_SIZE, GFP_KERNEL);
> +	client = kunit_kcalloc(test, clients, sizeof(*client), GFP_KERNEL);
> +	prev_cycle = kunit_kcalloc(test, clients, sizeof(*prev_cycle),
> +				   GFP_KERNEL);
> +
> +	for (i = 0; i < clients; i++)
> +		client[i].entity =
> +			drm_mock_sched_entity_new(test,
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  sched);
> +
> +	for (i = 0; i < clients; i++) {
> +		client[i].test = test;
> +		client[i].id = i;
> +		client[i].params = params->client[0];
> +		client[i].duration = ms_to_ktime(1000 / clients);
> +		client[i].cycle_time.min_us = ~0UL;
> +		client[i].latency_time.min_us = ~0UL;
> +		client[i].worker =
> +			kthread_create_worker(0, "%s-%u", __func__, i);
> +		if (IS_ERR(client[i].worker)) {
> +			for (j = 0; j < i; j++)
> +				kthread_destroy_worker(client[j].worker);
> +			KUNIT_FAIL(test, "Failed to create worker!\n");
> +		}
> +
> +		kthread_init_work(&client[i].work, drm_sched_client_work);
> +	}
> +
> +	for (i = 0; i < clients; i++)
> +		kthread_queue_work(client[i].worker, &client[i].work);
> +
> +	start = ktime_get();
> +	pr_info("%u clients:\n\tt\t\tcycle:\t  min    avg    max : ...\n", clients);
> +	for (;;) {
> +		unsigned int min = ~0;
> +		unsigned int max = 0;
> +		unsigned int total = 0;
> +		bool done = true;
> +		char pbuf[16];
> +
> +		memset(buf, 0, PAGE_SIZE);
> +		for (i = 0; i < clients; i++) {
> +			unsigned int cycle, cycles;
> +
> +			cycle = READ_ONCE(client[i].cycle);
> +			cycles = READ_ONCE(client[i].cycles);
> +
> +			snprintf(pbuf, sizeof(pbuf), " %3d", cycle);
> +			strncat(buf, pbuf, PAGE_SIZE);
> +
> +			total += cycle;
> +			if (cycle < min)
> +				min = cycle;
> +			if (cycle > max)
> +				max = cycle;
> +
> +			if (!min || (cycle + 1) < cycles)
> +				done = false;
> +		}
> +
> +		loops++;
> +		delta_total += max - min;
> +
> +		pr_info("\t+%6lldms\t\t  %3u  %3u  %3u :%s\n",
> +			ktime_to_ms(ktime_sub(ktime_get(), start)),
> +			min, DIV_ROUND_UP(total, clients), max, buf);
> +
> +		if (done)
> +			break;
> +
> +		msleep(100);
> +	}
> +
> +	pr_info("    avg_max_min_delta(x100)=%u\n",
> +		loops ? DIV_ROUND_UP(delta_total * 100, loops) : 0);
> +
> +	for (i = 0; i < clients; i++) {
> +		kthread_flush_work(&client[i].work);
> +		kthread_destroy_worker(client[i].worker);
> +	}
> +
> +	for (i = 0; i < clients; i++)
> +		drm_mock_sched_entity_free(client[i].entity);
> +}
> +
> +static const struct kunit_attributes drm_sched_scheduler_many_clients_attr = {
> +	.speed = KUNIT_SPEED_SLOW,
> +};
> +
> +static struct kunit_case drm_sched_scheduler_many_clients_tests[] = {
> +	KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_many_clients_test,
> +			      drm_sched_scheduler_many_clients_gen_params,
> +			      drm_sched_scheduler_many_clients_attr),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_scheduler_many_clients = {
> +	.name = "drm_sched_scheduler_many_clients_tests",
> +	.init = drm_sched_scheduler_init2,
> +	.exit = drm_sched_scheduler_exit,
> +	.test_cases = drm_sched_scheduler_many_clients_tests,
> +};
> +
>  kunit_test_suites(&drm_sched_scheduler_overhead,
>  		  &drm_sched_scheduler_two_clients1,
> -		  &drm_sched_scheduler_two_clients2);
> +		  &drm_sched_scheduler_two_clients2,
> +		  &drm_sched_scheduler_many_clients);

