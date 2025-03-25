Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B94A6EBCB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA08310E514;
	Tue, 25 Mar 2025 08:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L6jxbk8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8A010E51C;
 Tue, 25 Mar 2025 08:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vxkm+khWfpcQP+O/ebg8Z6CVHNW+Hq3op57fNnybcXHUtIg13kX6FV783CknHH2R8MwMkdHaFhaeGH7lKcjQES8M6w5Md4PSbg9z1h6YA23Ftx169NhsVib5Yo8PI9zR30O0HI0E5s7brsBpPvDcDlSknpkN2CBDBgNOTHv0eWkmanGbRwvSXhnqJgCivJimKJay4VNppHDrl2tN+iQsLtAOxYcjnCGDr98skv8UokoLdlvW7NwBtzwYvJk/DnXWJ7+2NldCsjW7X4bF32dGm6b501132XJVrMoLldK3BrnqH8JvNMwha2zo2JpxXZ6fg397iL63ckdRGFja0BWO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXCPnGlMyOy3Z/YUzao+ZzkzSP3S0oTja4rF6OVCOZo=;
 b=kiNzYErfvEyFUW/9a3e1hS70k1QKnqSe4iECsSaaZEqD4HTJU53pTCz16gZ9JXf1P4tY06yWyX80b0IOnxnBmCGRS5v6dyP+nhr+2qdFMpKHVGsk1IsxIjxdZnP9F0+C6VChCE0I9WMNzKItBpO4lzDkJGhAoKfajYrSbAF6pkrrf/PYvsYSrmBoNvHIo7Z19pMTt73cLUXvVSzDu/nY8BljfroYZ4Djc2Mnu9PWLJ7l6GGZbPb2Kc0QKxjXa03TJhumQ+hr4R3XRESN9zf9FEZlUV7YDkrFeTfg6QP2Lnw+HbPJrW943sQgssAOWKuUYl4nJG5EUX6ZjXpT+XfLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXCPnGlMyOy3Z/YUzao+ZzkzSP3S0oTja4rF6OVCOZo=;
 b=L6jxbk8l+ccvgxtlwWtea72ZpOiGMEKeKe5gta227BiWPkpirwXZcN0+6ZyM05425+7U/q+Wf2iW8EAvf4hinNuyD9U7Q8AuPR3xaQM1hokbw+IuJ4jmFBjcKI2vlJAPvzbC16a09Fu+h9NObp716xCdrdPMznqf57WGwUr9GbE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6739.namprd12.prod.outlook.com (2603:10b6:510:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:38:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 08:38:45 +0000
Message-ID: <85bda3bf-eaed-4eac-97ca-92c6301c0f9b@amd.com>
Date: Tue, 25 Mar 2025 09:38:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Replace deprecated function strcpy() with
 strscpy()
To: Andres Urian Florez <andres.emb.sys@gmail.com>,
 alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 mario.limonciello@amd.com, arnd@arndb.de, Tim.Huang@amd.com
Cc: skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250325000723.366365-1-andres.emb.sys@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250325000723.366365-1-andres.emb.sys@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: c775edc0-1d3f-4090-1a22-08dd6b7874a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVRHNHJlbytNT2g3UHY2aEdvVFgwZWo3dFltWVVyU1NXQThEK0huc0prcnlL?=
 =?utf-8?B?NzNSNTVXMzhybDZuYVdsbzY5K0ZLaUExRXBZQkVzT1JEaDJKMWRZcUJGMGdi?=
 =?utf-8?B?NTAzVUtobXRaRE9BMlFGQjBFaC9mSXBFMkJKTE1sOHFZS3lzakZSb3FvWGdV?=
 =?utf-8?B?bHpxbU9QTlFMWTk0eDViQWdwOGJTUnUzWUlKSlFzb2N4bW1iRjExcE14QUxF?=
 =?utf-8?B?MFpQMzV6Nk9yb29KbXVWQ0dlUEFuaEJwdlZEZlFzQ01mdnRKVUxPZFZSMncy?=
 =?utf-8?B?UXVOR1lHN1VCVC9XUDI3bVB0VlRwOTdZTTk1WFBlbkxqeFYyTW9jb1pyZnBK?=
 =?utf-8?B?clJMZjFEZExGYWZ2Z2dGK1FsMzhsS0twQStUc04vUnZuUndSQ0gySFQxU0ZZ?=
 =?utf-8?B?T0FiL2VkVjBBTjZuZ0IvWXF3REhIeDU5N202Z0NKbXlRYk9lQU1BNCtlWXNa?=
 =?utf-8?B?S0RyMFJ1aG5CdFM5MnRhamNBWVhLeTV1dFhYeXloQTlJRnBhekZldmRnallI?=
 =?utf-8?B?V05hVEhtNnlJQWN5T0tzQXY5NlpvdVVXOWFWSmFWWWFtcWFHb2tDdFdkTmo0?=
 =?utf-8?B?aVVUWkpVWVlSYndERUtBZWxXcy96Mnh5eU1ocnd5aUptS1kvME00SkZlcnhI?=
 =?utf-8?B?QzdxL3E4a2pTVVlpYjVnZjZBV01Eb1dZMkJ1KzhXeGJLOFRmMVdlUlluSEZw?=
 =?utf-8?B?OHc3b1BZamMyenY0UGdLcEh2UFQyUkFORElweFlvN2tjNHZEcld3QjlZTTdX?=
 =?utf-8?B?VVNXZis4bHNHc0JxSytoVkwxYzN0Q3ZlN05TanVmcGh3MXhMRUNPQWIrRzlI?=
 =?utf-8?B?RWJGRTJ5c1BZSHhrR3M4ajNuRDVpa0w2Y2NkVDRnZWxKSTVmVzBuVkdoTHph?=
 =?utf-8?B?cE9XV1JXVFNzZGhJWm5hTnlLdm5mYU1nLzUyd1J5OFk0N08zYmJYZGpWUjJy?=
 =?utf-8?B?TzBkOWZqQzFPc09CSksvaDhRM1FMams5Yk1scVpVU1FRRWlTWEMzeDRnN0tk?=
 =?utf-8?B?Q1FQTlVad2lIOW95bENSbDBOSDBEeVByWmZZUTRoS29aSGpuRERqN1RzZVRm?=
 =?utf-8?B?TlpkK2sxLzg2dE5CU1FvejlxejlrR1hBRS9ENzRtZ0ZlQzVrbDZmUFFRaFhy?=
 =?utf-8?B?WHB2TEFzQmJZMk5qQWtCb3B3UzVSZmdPRzVnN3VvVUNSb0FrMWQ0U0VrSXBw?=
 =?utf-8?B?bW02NCtzNXBFQythdlVWM3k3ZktoSmJ5d3RJMzdzeGQwd3BZaUV4NjF4eFN1?=
 =?utf-8?B?ellwTnR6TUtDTWtHeVpvM1NQZWJBQncxN3h2NEJyVEl2SVFmTzkvWGExZDhE?=
 =?utf-8?B?aHJjYUc3YU1vZ2Zjb3dadnJ5TGpFOS9DeHJUN0tmZXpqZDRvS2FEczVoN09P?=
 =?utf-8?B?Ti85dHZtdXdzMkJsNmhEM0Mvbk84VVEvWHcxU3drUzA2OVdXM1FDSS9SeUZo?=
 =?utf-8?B?N1N4UHhkSXF3dmJwUDRCZEplNktLVEhnZmoxY3NUblVLZGhrWUlrNGhFVEM2?=
 =?utf-8?B?M3V3S1RvK3l6SEVvWWhIcFVsUUtidmM1bXJ4Y21CUXJqUi9FN0dUcWlLNlRp?=
 =?utf-8?B?TmR3bUpEYUFmR24vdUNaOFhIRkhmdjBkcmowek9yNDhTSmQzWHZtaVB3eGk1?=
 =?utf-8?B?UXVzOEtCaDYzbXNLM0FHSEFOZjV6dVZ5NWl4SlNteVhUVEwrK1ovdzNXcEda?=
 =?utf-8?B?cjcwaHFnTm1rSlB0WWNlNWZCUXhEbkl6TU4vL0dpWkR1MXVMblkvTXZ6ZUNa?=
 =?utf-8?B?eXRxUklUT3lobjFHT1JwSlo1azBLa2FXSnAreEFWRzVwQXhITzBvdHc5cGd5?=
 =?utf-8?B?bmc2Zkd5MXhBSW9sb3RZdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZytHbmRTcGVCRDlLYkxCNjFKQlpNcldNdzJMaVBzZ0ZvQUE2Nkhpb050QTVm?=
 =?utf-8?B?WHhlNmRnT1puV1FEaVdHbytrR3BVdTQvcWQ0VURXVmVnVlJNZjY3U1VsV0tL?=
 =?utf-8?B?Wm9VV1AvNFFaK0ROOCttWE5zcWlySjd1L25BSFUwam40YWZrNjVnUHdoK3ln?=
 =?utf-8?B?TzByQWo4YUhIV2U5UTV1aFpMRHNXdi9MRHcyd2lGSjl4VmtEMVZGZHkzSDQ1?=
 =?utf-8?B?YWM1cDRueUxFTSt5WE1sNzZCLzhGL3YwWmR5cWdtY0Z3RXdFWHpqSG5oNHpN?=
 =?utf-8?B?T0c0M0ZiejRlZyt0aG5UTndaeTBjTjhreW9oK29Tb0xLaGgrR1c3Tng5L2RX?=
 =?utf-8?B?MXRFTFdkOFp2ZU84bTdTODVpMmdTdFQrODZkRGwvSkFWcDB2bnRPRG1KT0Jq?=
 =?utf-8?B?QU1OekY3S1VrRTdzMVBmUDl3c0JYYWliZHZxOUlEUWlOVmtYcHRBSUwvT0RR?=
 =?utf-8?B?TVh2TXZTRHFyTXZ0Vk9lZVg5aVplUzUwRzlmUXQ2MkZVSVJjak45VTk0cUFy?=
 =?utf-8?B?WGUwcGhQbGJCTXYvOVRhUGduV2YrUTVzWHBHS2F0T3YxQ3M4Qk1Qa3RDRXVJ?=
 =?utf-8?B?T3FjU1FCUW44dCt5eGtqK1E0Mlh1Wm4yN1M5OGpZREl1S05Ob0RNZitlOCtX?=
 =?utf-8?B?WUk5Nk1iMEx3RVJtV0xVT2U0TVdOd1pWNzhqdTdQRmxOaHFJdnVuVzdsYjR1?=
 =?utf-8?B?K2Rsc0tqZHFHT2lyVjlxeFhTZ1BOdFFWcUladTd5YXB2czVjczRmU05GYmcw?=
 =?utf-8?B?amtoTWM4Nmh1ZVMxdHJ3QTJGcVRjUTAwM01mRjc0Y3hJOURkeVNrSk52VkJK?=
 =?utf-8?B?dGNNVFlEYmVCbjIwQzgzd01MRFMweHRINjlvbWNLWGZnSkZCbG1oWFNQZElX?=
 =?utf-8?B?blRuOTF0V2JnQ0ZXVC9NdnhsaVBqYU5lWTlFclNZN05Pc1VQeTZaS1I5S1Rk?=
 =?utf-8?B?UWV2TW1xNkkza2kzbFVoY1lXYjlNU3d1QlJBVllEdFI4L014alhwV0JyazlQ?=
 =?utf-8?B?WDZBelFybmt1S3dhQ2h2a1ZwUkhaZGJmOTBlMnlDbEprdTVrSVYxOEpLRVo2?=
 =?utf-8?B?ZEo5cjhmZEJxbncrRk44RFFhV0RVaUg5NlpqS2s0eWI0aTRWZUc3TXA5Z1cy?=
 =?utf-8?B?RFkrVUhJNnZrbm9YelVCalJad1lENzhsRnpBWSt3d2I3eGRpclorNEdaTEVy?=
 =?utf-8?B?WXN6ckZ1QlRxQmlVOTFYU0NnVnFxMXNjYU96b0UwcnF3eTY5N3p5WTBBOEJ5?=
 =?utf-8?B?bktYbnh6c1gxUGt4amJVVCtvMFJpOHRVdkJIL1hCNzJTakRreDBUMDVPTDFX?=
 =?utf-8?B?SU0vZnFnNmZpaVRKSFdXcmFhRlNqR0dkS2ltK2psNEc1a2djdjdNTGdJd2hj?=
 =?utf-8?B?MEdKeXFGbEpPMGNUbGgveUo2TWZYSkxHTHRMY2MwS1V3ZmZPRG9sVVkvbEts?=
 =?utf-8?B?K1BqWUxkNG9uR2lyaTc2T2FjbXVxeVlGVWJCbnBrV2tWVmF5S0svNXBuRmwx?=
 =?utf-8?B?dmdsM1kzZDJkdnhKQ00yTUE4b0p2LzZHNnhDbWVpVHI5VXhleFB3enk4QTFL?=
 =?utf-8?B?QWZUVkxweUxZbmNRQUxuanpMT0tRaTRVaDY5OUF4YmJvUGplN21WRUlUVmpq?=
 =?utf-8?B?a0NGMlhDSjVYRFAyUVozVE1jUnNCZWExTHFkTFNHWU41QkY4VkNZeWJNSVBi?=
 =?utf-8?B?NjEreFhpaWV1ZVpLWjA1di85MzY1TWN5UGZONm45VFA0eWdrVUNpemJhT1Zm?=
 =?utf-8?B?RTliSURtY0I5WVgwYUthdlVuamUyZnZqN3FnOHNybG11N2UvMTZQd0M3aXFu?=
 =?utf-8?B?Q1pmZWdDaFNRVytBdy9ZMzI2bUZSWkpicXdqT0RMVlRmcy9ySmZydWoyekdB?=
 =?utf-8?B?bTgxNUM5bWhXWUZwSHBBbkxneE5JWDh0TUpaWEZGUU00K1BubGZKNWhRVitB?=
 =?utf-8?B?K0htLy9vNHVmdjFQdEhST1lQZ2xrOUlNYW41STRLbkdqam5LZGZ5RUNZajAz?=
 =?utf-8?B?eXdwVXFmMDNESnVqVGc2UUhGdnJLS0ZINkgwQzlhMy9xNzZaQm10S2JJek9J?=
 =?utf-8?B?SWlwWVRnbklTMWpnSjVyZjB2TXV5dHJPRVpuRm9wdWM4TE1BZkQxSTJLMDlZ?=
 =?utf-8?Q?/4JdR2wBVFxjIZgZRRAPc13eg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c775edc0-1d3f-4090-1a22-08dd6b7874a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:38:45.5324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfY1U15Rh9twVfmpJjYfJQrQ9YFUw1h8i5ruOzhEee2/+zkjedeDMUcC77Tei8op
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6739
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

Alex shouldn't be try to completely nuke the CGS functions?

Christian.

Am 25.03.25 um 01:07 schrieb Andres Urian Florez:
> Instead of using the strcpy() deprecated function to populate the
> fw_name, use the strscpy() function
>
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
>
> Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 68 ++++++++++++-------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> index 68bce6a6d09d..525e53c94f4f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
> @@ -253,16 +253,16 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  		if (!adev->pm.fw) {
>  			switch (adev->asic_type) {
>  			case CHIP_TAHITI:
> -				strcpy(fw_name, "radeon/tahiti_smc.bin");
> +				strscpy(fw_name, "radeon/tahiti_smc.bin");
>  				break;
>  			case CHIP_PITCAIRN:
>  				if ((adev->pdev->revision == 0x81) &&
>  				    ((adev->pdev->device == 0x6810) ||
>  				    (adev->pdev->device == 0x6811))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "radeon/pitcairn_k_smc.bin");
> +					strscpy(fw_name, "radeon/pitcairn_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "radeon/pitcairn_smc.bin");
> +					strscpy(fw_name, "radeon/pitcairn_smc.bin");
>  				}
>  				break;
>  			case CHIP_VERDE:
> @@ -276,9 +276,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  					((adev->pdev->device == 0x6823) ||
>  					(adev->pdev->device == 0x682b)))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "radeon/verde_k_smc.bin");
> +					strscpy(fw_name, "radeon/verde_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "radeon/verde_smc.bin");
> +					strscpy(fw_name, "radeon/verde_smc.bin");
>  				}
>  				break;
>  			case CHIP_OLAND:
> @@ -290,9 +290,9 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  				    ((adev->pdev->revision == 0x83) &&
>  					(adev->pdev->device == 0x6610))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "radeon/oland_k_smc.bin");
> +					strscpy(fw_name, "radeon/oland_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "radeon/oland_smc.bin");
> +					strscpy(fw_name, "radeon/oland_smc.bin");
>  				}
>  				break;
>  			case CHIP_HAINAN:
> @@ -304,13 +304,13 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  					(adev->pdev->device == 0x6665) ||
>  					 (adev->pdev->device == 0x6667)))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "radeon/hainan_k_smc.bin");
> +					strscpy(fw_name, "radeon/hainan_k_smc.bin");
>  				} else if ((adev->pdev->revision == 0xc3) &&
>  					 (adev->pdev->device == 0x6665)) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "radeon/banks_k_2_smc.bin");
> +					strscpy(fw_name, "radeon/banks_k_2_smc.bin");
>  				} else {
> -					strcpy(fw_name, "radeon/hainan_smc.bin");
> +					strscpy(fw_name, "radeon/hainan_smc.bin");
>  				}
>  				break;
>  			case CHIP_BONAIRE:
> @@ -318,17 +318,17 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  					(adev->pdev->revision == 0x81) ||
>  					(adev->pdev->device == 0x665f)) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "amdgpu/bonaire_k_smc.bin");
> +					strscpy(fw_name, "amdgpu/bonaire_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "amdgpu/bonaire_smc.bin");
> +					strscpy(fw_name, "amdgpu/bonaire_smc.bin");
>  				}
>  				break;
>  			case CHIP_HAWAII:
>  				if (adev->pdev->revision == 0x80) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "amdgpu/hawaii_k_smc.bin");
> +					strscpy(fw_name, "amdgpu/hawaii_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "amdgpu/hawaii_smc.bin");
> +					strscpy(fw_name, "amdgpu/hawaii_smc.bin");
>  				}
>  				break;
>  			case CHIP_TOPAZ:
> @@ -338,76 +338,76 @@ static int amdgpu_cgs_get_firmware_info(struct cgs_device *cgs_device,
>  				    ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD1)) ||
>  				    ((adev->pdev->device == 0x6900) && (adev->pdev->revision == 0xD3))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "amdgpu/topaz_k_smc.bin");
> +					strscpy(fw_name, "amdgpu/topaz_k_smc.bin");
>  				} else
> -					strcpy(fw_name, "amdgpu/topaz_smc.bin");
> +					strscpy(fw_name, "amdgpu/topaz_smc.bin");
>  				break;
>  			case CHIP_TONGA:
>  				if (((adev->pdev->device == 0x6939) && (adev->pdev->revision == 0xf1)) ||
>  				    ((adev->pdev->device == 0x6938) && (adev->pdev->revision == 0xf1))) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "amdgpu/tonga_k_smc.bin");
> +					strscpy(fw_name, "amdgpu/tonga_k_smc.bin");
>  				} else
> -					strcpy(fw_name, "amdgpu/tonga_smc.bin");
> +					strscpy(fw_name, "amdgpu/tonga_smc.bin");
>  				break;
>  			case CHIP_FIJI:
> -				strcpy(fw_name, "amdgpu/fiji_smc.bin");
> +				strscpy(fw_name, "amdgpu/fiji_smc.bin");
>  				break;
>  			case CHIP_POLARIS11:
>  				if (type == CGS_UCODE_ID_SMU) {
>  					if (ASICID_IS_P21(adev->pdev->device, adev->pdev->revision)) {
>  						info->is_kicker = true;
> -						strcpy(fw_name, "amdgpu/polaris11_k_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris11_k_smc.bin");
>  					} else if (ASICID_IS_P31(adev->pdev->device, adev->pdev->revision)) {
>  						info->is_kicker = true;
> -						strcpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris11_k2_smc.bin");
>  					} else {
> -						strcpy(fw_name, "amdgpu/polaris11_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris11_smc.bin");
>  					}
>  				} else if (type == CGS_UCODE_ID_SMU_SK) {
> -					strcpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
> +					strscpy(fw_name, "amdgpu/polaris11_smc_sk.bin");
>  				}
>  				break;
>  			case CHIP_POLARIS10:
>  				if (type == CGS_UCODE_ID_SMU) {
>  					if (ASICID_IS_P20(adev->pdev->device, adev->pdev->revision)) {
>  						info->is_kicker = true;
> -						strcpy(fw_name, "amdgpu/polaris10_k_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris10_k_smc.bin");
>  					} else if (ASICID_IS_P30(adev->pdev->device, adev->pdev->revision)) {
>  						info->is_kicker = true;
> -						strcpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris10_k2_smc.bin");
>  					} else {
> -						strcpy(fw_name, "amdgpu/polaris10_smc.bin");
> +						strscpy(fw_name, "amdgpu/polaris10_smc.bin");
>  					}
>  				} else if (type == CGS_UCODE_ID_SMU_SK) {
> -					strcpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
> +					strscpy(fw_name, "amdgpu/polaris10_smc_sk.bin");
>  				}
>  				break;
>  			case CHIP_POLARIS12:
>  				if (ASICID_IS_P23(adev->pdev->device, adev->pdev->revision)) {
>  					info->is_kicker = true;
> -					strcpy(fw_name, "amdgpu/polaris12_k_smc.bin");
> +					strscpy(fw_name, "amdgpu/polaris12_k_smc.bin");
>  				} else {
> -					strcpy(fw_name, "amdgpu/polaris12_smc.bin");
> +					strscpy(fw_name, "amdgpu/polaris12_smc.bin");
>  				}
>  				break;
>  			case CHIP_VEGAM:
> -				strcpy(fw_name, "amdgpu/vegam_smc.bin");
> +				strscpy(fw_name, "amdgpu/vegam_smc.bin");
>  				break;
>  			case CHIP_VEGA10:
>  				if ((adev->pdev->device == 0x687f) &&
>  					((adev->pdev->revision == 0xc0) ||
>  					(adev->pdev->revision == 0xc1) ||
>  					(adev->pdev->revision == 0xc3)))
> -					strcpy(fw_name, "amdgpu/vega10_acg_smc.bin");
> +					strscpy(fw_name, "amdgpu/vega10_acg_smc.bin");
>  				else
> -					strcpy(fw_name, "amdgpu/vega10_smc.bin");
> +					strscpy(fw_name, "amdgpu/vega10_smc.bin");
>  				break;
>  			case CHIP_VEGA12:
> -				strcpy(fw_name, "amdgpu/vega12_smc.bin");
> +				strscpy(fw_name, "amdgpu/vega12_smc.bin");
>  				break;
>  			case CHIP_VEGA20:
> -				strcpy(fw_name, "amdgpu/vega20_smc.bin");
> +				strscpy(fw_name, "amdgpu/vega20_smc.bin");
>  				break;
>  			default:
>  				DRM_ERROR("SMC firmware not supported\n");

