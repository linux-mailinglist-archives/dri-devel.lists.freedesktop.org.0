Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128539F0594
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 08:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD12110EF0D;
	Fri, 13 Dec 2024 07:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ef9p/08D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091B10E430;
 Fri, 13 Dec 2024 07:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU1a1pnyXyDRM0HrYhHIghntZ+9sfddyreZH/8/PLEZBZnlVSe1EX7cgwHPsVpoANX5yCXbUMSqIx3ixyW27RHOcU+zXGP32Utn5pO/cxt08MGnW3LyEfquoz23xZeprtTyTyqfUbLgwzvYpYFo6jaFL6D6nibttJfwiI0WWxvgBCMTePW4y4P617Pz6JnjIo1aeFllCsbAjANEidabnF+G2F6gb9wfHLmuLK5r6yp3Vn9ITTjP/Ehi/zMHPkF32gohdvGCiHGUGLPN+PPndxiob6o+czKEJZy2ut9ErfnQ9DJWIEfWGZKcIVMUXmtv+owlklRLJVsplV0zwH2XlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAua9IytjDfcuu3Fv1+Ne0umCKUZxqwYYkhbvqLmyew=;
 b=eAihYOPrjxYtsAZS4bzR2gpvcqshg1BSvdutscJRbr2dqxKoOF7+TrU/LfNIJDLRRVJTKKVJ5SBTUErDiP4vGHVFvPMXsYvhmF5K5JO6rxl4ag62a+jcjOWnEtyYLB0adnjl9vrR5pyWDdonGYdguAjwSXxvZ2hACuwVithnxYY7prAFLjo+rPPz3XVyXiAwZcD+7YBMnwuCBjEj/9ooPQf65Lyl5UmoGcd3lifomXWxaaTaj1FLsoYbCHI5AW9JVE4NJjyGArqbWrSUS8i32NMwSLRglbQM9eYTIf6olWDEWQPLnzupUcLZXwYrK5guroRO+mlVANsmIeWI2c09lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAua9IytjDfcuu3Fv1+Ne0umCKUZxqwYYkhbvqLmyew=;
 b=ef9p/08DYvmTmCQedWBr6IArUY8Wth/8l41L6CvpcL9NyC+A41DNm35uEi9i1ufkaziVB8JVQ98+/EAgsJdlfUsZ3lMgPp/c7N60d+0l/XkrNpi7hgdwBII5dqz78d+bcsyWs89KvzCOPgmOayErCTcIcUgpGGeY9BtyLt6wwmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 07:34:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 07:34:27 +0000
Message-ID: <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
Date: Fri, 13 Dec 2024 08:34:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241212190909.28559-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 6811002b-8ee1-437f-289c-08dd1b489299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmp0YjNTMzFKMTNOemVFWUJSK1BPVllxNUxRcFNQZ1NKQzVaSFVxSnJsNnNI?=
 =?utf-8?B?c2JzTHRkajVldXNpVTZpK1pSMkRpaEtzZkxxL2RmeWRpOFcwK3dpUG1VTmY4?=
 =?utf-8?B?a0cvTXJhU3FvY0xlZ1pBazlXeldRc0NHRHFNQmtDZDhtbkpXNjVIbzFIQUNY?=
 =?utf-8?B?T3BlSWF3S0JDVUI5cjdIZG16YzBoRUxsZFUyWTM5OTRGMnVRa1NNNCtUaFRO?=
 =?utf-8?B?bHplWVBRTlZJaTVrNi9vRE1QTDBtMk94MEM0ZHdaOVplek9pWnJHOWRSVyt5?=
 =?utf-8?B?OGs0SHZpaldTN2xLN2NOcnhPUUdpblY5TDRPMlRzQk9GU1VvclB3ZkJ2NHlV?=
 =?utf-8?B?SnRVb25LSnk5Rk1IaXF2cG9hYUFyL3VRc2M3ZERncU9YWUNYUnAvZ0dkeDVq?=
 =?utf-8?B?ZGxhRjdnL1VJYkQ4U2QrRjVNaERQSElqUEdvUXhFWE5Wd1BDWEo3YldMWU5r?=
 =?utf-8?B?UGs1aUJ2RURXNFptQ1duWEJQanhxZnpyL2tORnBNQVlHSUtha25PdVdtTTM4?=
 =?utf-8?B?dFI5TzhkMXVXaGVxYmJXQ3ptMFFIeHN5WVpTMEUvMWRZRGUyalFPTnJEaUtO?=
 =?utf-8?B?RVNkQW9JbVMzMGxyTjZQVVlUNDJOaUpPazhhMkREWlRnMWcza2U2WFlXOXlG?=
 =?utf-8?B?bkVTMzk2QXJ5aXJudy9WanVWSlR0alA5OHpsdHBzdlVMT1E5SjVaZkh0KzZy?=
 =?utf-8?B?OFlPbWVOWGZkZlhVTGUxclJDeWZOc256VmRCRk5LZktTYldscnoyckI1ckxH?=
 =?utf-8?B?R1Z5WUpjTlZEMzhFbTVNeUt4ZnRGZ1ZOdXFyRFpLZks3cFZwNXZyaUc0K0Jz?=
 =?utf-8?B?MW9VNnJ3RFBVemNHaW56aGtvd21MYTdzUmRRckllbVIxS2Nwb2V3UldPa1Zi?=
 =?utf-8?B?ZVZlaVZFN2RDVzBUM1JXZjhVbFZJYXlNMDVDNDlvUjIrcWdLMmkzdzRWYWRv?=
 =?utf-8?B?b0lwMGRsbjFTR3YvNUE0dm1vN2d6UDZjb0YzZDIyRFlTNmpiM0d0QnBzdFlS?=
 =?utf-8?B?SnhNejJtZDZOdjNnanUwUThDdDgxaGgxN1NyZDVXclJVVEFia0hzVFZTeVVR?=
 =?utf-8?B?K0lnSHg4eUxGOEhYMTRFU1RNRXZ5djl1TU1Md3NxY2Q1Wnh6NGdNQnBuWVly?=
 =?utf-8?B?S2lYOUFpM1Y3Wi9tTlltZHNrMkNjcHQ2T3hoVVI5VDg4ODhUWkRxa0tCZXRm?=
 =?utf-8?B?ZDhheE9oK1JZQzFaWDRHY2RiQUgvSHQrOUxRejM1VUJqdGt0NzRGNHh6Q2hH?=
 =?utf-8?B?NUZYOXFNYzBqUGw4Nnd0M0dlcG9vZklnSFpRMmFVRC9zTEFkR0g2M2N6ejIw?=
 =?utf-8?B?b2hPSHJnUVJsNm96VTNZQXpneEhBMlltbERPVzZxWDQ5NFdrNjZnUTBBM2Ix?=
 =?utf-8?B?YXo4bmdZS0doc3E5RnljZFhmVlo3dmRyZ0tZNXQyNmRzSk4zMktSSHdnZTZh?=
 =?utf-8?B?bVZsK1ZCMlhpcUdhMVh0d0ZFN0x6Rnl3ZXNGVG84KytqanNLNGQwRi9mOXoz?=
 =?utf-8?B?Zkx3MGREYlZwcUFuSXpKcVk3TzZ3V2REaENhbFI5dG96dXR2c1RURnlhVURN?=
 =?utf-8?B?VGxSNk9nKzdWblNPYmtjZktTV1o5SFBOTk9GVkVpYXliNUhsN3lyelBURGFR?=
 =?utf-8?B?dm5zM3FXQlZGdXBRY0c5R0l2aFFwS3dXTkg1U1pISEQweE51S1R3MkJieHlT?=
 =?utf-8?B?dXVsdzdKRVMyaHE2ZTNyUkJYVnJZd2dNRFIzMThGOThpbGJkYzVxNnZWSFdR?=
 =?utf-8?B?UGNpSGJPdjM5Z3d3aUlWOGtZaEdsQ1UyMmcvWHF6MmlzZVUreUlubTJ2ckQ2?=
 =?utf-8?B?VGhMSzU5SUhYWFlvN0YzL2QxN1RWMkFrTmdkUm9TRS9FdUQ5MHdwb1RFS0NU?=
 =?utf-8?Q?wY5CpyJvjUPCC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWw1SEVSbHg1b3Y5SVpFOE5wenNkUWJreTMxZ0wxYzBGSTBXRkVNU3FGdGJN?=
 =?utf-8?B?YjU0QnNxNTNKT09UV25QdUhRRGJXLzk5Q29kUUYzKzcvWVh4ZVJERzQ0OUQx?=
 =?utf-8?B?anZ5cDFZSVcySkE2UGd4dmhveG92RWxpVTlBclJnQXpTRHAzU0xDNlc5SHBx?=
 =?utf-8?B?NzZsOC9kdUU3dnhnancyVjZZMUNNZ1VsRHBPd3VrVFpsS3B0cmRLNUJmWFEy?=
 =?utf-8?B?ajkycVRWb05hTnBOVUJEbUZNZHlIZkhGTUx3RFRXRzNadmtKMEJEb2t3SWRL?=
 =?utf-8?B?V1RFY05ZU1Rhc1kwVnlFNXEzdndZM1ZVU0pKVmlFcU5MdjZndytUS21wMG50?=
 =?utf-8?B?bnMvczFqMEIyUHNFMk9haFJXSW1OdWZLQXFPTDN6ZHkrekFLbEpKcGY5Mk5h?=
 =?utf-8?B?NGc0NzgvcysxdVJ3a3BlWW8wQTBUM0NzQko4c05BN0RON1VDZXdwUEdVRDEx?=
 =?utf-8?B?a1lvQ3g0TVNsd2ROWE9jK25HYVJPQitKS0ZGdlowL3d4RFBkeVlJMkhpTmRT?=
 =?utf-8?B?QXd5cktYQ3dOMWVCTGorT2t6QkQvYXdJZGJ4ZGFGaElwWkVoTTZ3Nm1tSWox?=
 =?utf-8?B?TEdUZ25lNm9PMHFXMjREdU16WVZ5anljaTJXS2Q0ZHVtekZGRENrTnNlV2Fy?=
 =?utf-8?B?b3daSzk3NTNaQWwrQ3NlbzlPNnJhUytzR0NraE1sR3dWQnBNR2tHSXFpYTZX?=
 =?utf-8?B?K1VyNFJPWVE5aW5xZjI4YU9sYW9IbHFlUG4xNWJjd3dsN0ZJc1hEQXBhUFBP?=
 =?utf-8?B?YWlJUFZRSWJOVERwQitLb0wrZndPd2EyeWk5ZEJLOEx3MFZqV2pRdWZFZ0dH?=
 =?utf-8?B?bi9NNGtsWEh1UDRrNzA5MElIam5vbk1rbGVtSFpLdUpPV2VQUGRkUGs5ZnFn?=
 =?utf-8?B?Zm96SVFEbXVNVnk3SjhOdFNoSVliejdLRzJzN1VqNDU4MEpBcUtDb3FrMVNX?=
 =?utf-8?B?SExUM2FmUk5ZU2xvWHFUUmR1ZVY4NEtkeUVZdVpESFlXODhBOURreTl6TW4x?=
 =?utf-8?B?dHNxWFJLL3BDSW9PMDhXWFNBbVdEVVMyQ05jY0ZOc1YzaHRuWXFpZFJnOWdr?=
 =?utf-8?B?dW8zbVBrc1ladXozYnB0c0YxaHZnY1BWTE8rY3dzTi9NV1N6TTk5ZDN4VEVO?=
 =?utf-8?B?OFRUVU0rOUZoaU50K3BSTlptdmZDblg1dkxlR1dPZDVWRjRNT1ZWeGd5YlZu?=
 =?utf-8?B?dDI1TmJHeWpOQThZRHNMamUvVnpWbVJqMTBrR2phZGZ1QTY0eXFLS3prMEZK?=
 =?utf-8?B?UWkxekM5L0JMeis5RzM1NHVqSnZYaFFRaXh2a08zaGN1YzVBZzBKMUYxTUNY?=
 =?utf-8?B?Ni90R0VqWkhZd0MrdzkrL0pua2ZqdlpKWEM4RVlWUUhpbWszMmY3dGE2eGNa?=
 =?utf-8?B?ZEY3dDdxcy90NjV6dmtxT0lzQ1E3aVdqRmZQc09vd0h1VEhUOWVuZHc3Mjlj?=
 =?utf-8?B?c0hMcndlSkFPelFNOEN2UkQ4NjhSNDRYeVIyeC9ieWFVbGJjSkh4Nkx4SHNF?=
 =?utf-8?B?alRQeWdUMisrRGIxZVErTkdLN1NPQ05KVGFBVyt1RWZXQ3pFRFo2N0J0V00r?=
 =?utf-8?B?VDRrZnU4Mk9TOHc1VDM5TlBBcXZsSkJkL2tQSTh4SzBZcU9WZUdnWld2aE1P?=
 =?utf-8?B?TWdJbEpJWEIyNkVYemRWUERRMWFRdDZkUE9Pa0hORmdkNFRTYUEzWTRpQ2t0?=
 =?utf-8?B?ZHZrU0pSenJXQktwMFM0UlIzMEN1ME5iZ095dUFYNEdpZGNZbERJUDVRTytP?=
 =?utf-8?B?NlJYUHdNWVZ5VEVwa05WbVVkanRqODNQbmV0T2dQQ0RSRzk4S0JKKzUyUGZU?=
 =?utf-8?B?dTY4RzFMa3FnOUR0ZExmRS9ESUg1dVJZS3VLTEpuNXdaczVtbFhmQ1ltSmFw?=
 =?utf-8?B?ZDlaeXpKY0tuK3Z1QnJPSnl1TWMzYklLQmdJWEdkelNHYW8zV3IwSHNjQnNS?=
 =?utf-8?B?M1llZkRlOE9PdVRNYWVGWjBaSUJsRThJdUhkSERPaWdtbVM2YzlrSWhINGxv?=
 =?utf-8?B?bWx1TTNQR25oSlplZ0lDWHRVNG9LSkpZTktET1Z3d1g5UkNaYWlqdldiK09p?=
 =?utf-8?B?cXNiY0hwNitDQThTNnc4d1dabkprb0dWV1dub05CZ3d3VWJyT09JV1dDQksr?=
 =?utf-8?Q?hRpM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6811002b-8ee1-437f-289c-08dd1b489299
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 07:34:27.0638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtGGtn0ZYOBqp+OakjVWy6nhfod31kmrsnvwOFaaDlzLaYs86VeXtgmbn3wTTtkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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

Am 12.12.24 um 20:09 schrieb André Almeida:
> Use DRM's device wedged event to notify userspace that a reset had
> happened. For now, only use `none` method meant for telemetry
> capture.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 96316111300a..19e1a5493778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>   
>   	atomic_set(&adev->reset_domain->reset_res, r);
> +
> +	drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);

That looks really good in general. I would just make the 
DRM_WEDGE_RECOVERY_NONE depend on the value of "r".

@Shashank any objections? IIRC you have worked on the AMD specific event 
we never upstreamed.

Regards,
Christian.

> +
>   	return r;
>   }
>   

