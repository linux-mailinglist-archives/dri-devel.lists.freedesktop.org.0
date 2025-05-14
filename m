Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34CAB6CC7
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0E210E126;
	Wed, 14 May 2025 13:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GBB5ONMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1597810E126
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Op9Ju/YwKn0QIScS8gCYdwI/qv3MMzGzkvGQstUXuEY2mAPEnqq5FJ7tqDmVYQ7Wd6NCGVTjvOPmf1etPJUqnLhA475unWCP1fABzPpaz8Jkbw/Xg3CJnoYLpxxdxiWLjVWYSQWskdFx7oezEc7TMnq7dT41vakOcWkObEpncztNOb63zswYHYO94HXeKTosMzY/LKP1KRCHkZOQ1aJKh44x/iZtIjMdORUnCgk9C/ecCcuWy7EbKojeAgRJwtXf6CzRbWTO6K7+2qk1Cfys9Nv85sSbhaY4K2fubN5+LMKZo7bQOhhccJK0d6Non6mScrQt/T2jHpgCO8o2olkSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/lY0p3PGG+BXQ3OLcJe6x6N+szXTnfc9vNzwNhgv8E=;
 b=QEhbTvoQCfUk4JGkDX1U/gG3R/M3O5r4LSwfpqG0o2BBeMcz2rDBAG0D2aCHEksbDoywURrQblPVNTxEE2hxTqmtyM2br2AUQgFN5mE3Hvqhq+Hsqc8cvH5yqlDaDlJsYZPWGlMge+ZQaMayLuDK0AmFp7IhICGhEQ/bCJ59qt4Q3mO9cZblhCuMdjgWTQ7jH1cDe/JH5v3L9zRcakkwKweZiyC7xrOO/mkuW7lm5QbS74X2xFYT42ARHkUdhNppDxPVV/XJ4gTkl4x/u0TKgEx9xEy7ftndbf+TeDA1uzFoJ4Y04B13kb0hz7zfQHDF6P4JulDkxSZOh1H1ckZ1vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/lY0p3PGG+BXQ3OLcJe6x6N+szXTnfc9vNzwNhgv8E=;
 b=GBB5ONMz9PBudG/AYR76J6YFtT/uEq/WNxqUCA7ueuRs5/zDZGq7wiJJlmxuidO7AORs6ohZJevY0POTyAc7RnlKFfxryJpLI+qSVN5ZbT+w9IpICgqT1XO5qccsHvtddSpl39rkMjxWaVe0K+HMBwiJT5OLFOr+A/ZLkB65ki0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6362.namprd12.prod.outlook.com (2603:10b6:a03:454::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 13:33:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:33:15 +0000
Message-ID: <9652f863-5e60-4c5a-acd1-f897c1148105@amd.com>
Date: Wed, 14 May 2025 15:33:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: insert memory barrier before updating num_fences
To: Hyejeong Choi <hjeong.choi@samsung.com>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <CGME20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c@epcas2p1.samsung.com>
 <20250513020638.GA2329653@au1-maretx-p37.eng.sarc.samsung.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250513020638.GA2329653@au1-maretx-p37.eng.sarc.samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0066.namprd16.prod.outlook.com
 (2603:10b6:208:234::35) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ab0257-27c1-4ad0-8804-08dd92ebe199
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlJ4R3pQVUNVMnloS3Exb3hKY3QxM1ZobWFkOVVQUGpuN0RhODhZTVZBekx1?=
 =?utf-8?B?TFFsUnljNVJsNUFTTzU0R2ZOQURDdm52WTltUXJIWVZ0SHorcWhoYzZiQUNT?=
 =?utf-8?B?dmRtWEZVUERpeWtLVEIya0V2dnN6TGw1cHA3VnNhd3lTazlVTldiTUZ6bUUz?=
 =?utf-8?B?Z1FHMTJtSjJvYVRsaXB4K1VtZlZ0ZFI2VWRjNEdCUC9RU1VqOGpKSXFFOFFj?=
 =?utf-8?B?N0RMWFRHTVE2SzJPMmVCYW1VZ0pJZUlVOXRtVUZpZmlsZnBSTVhKVEFWdnNE?=
 =?utf-8?B?NDJEWVc0M3VTWFIwQ1RidDZKUEJySnpXRWwvbWZ1eDgzY05EakJvNlB2M3Fa?=
 =?utf-8?B?a3NHM09hZ1NDbzg4QXV0alcwSVBRKzNoVklNU1Y1SVNPTW44cS80aDMyV3gr?=
 =?utf-8?B?NmhlVjZQbGtQZnVmVVhIZ3N5cGgvRDlzaFhIWFFtSVRCMUplbXQ4T3I0K2pk?=
 =?utf-8?B?dkRGamlzYVAwU0ZyZ05hVzdJeGFKM2I3WFBKWHd5R1Bnbnd6Q0tZZFFRZXR4?=
 =?utf-8?B?Wk91MGhUSkhObFR1R3JmRE1Xdy8xNm5ydjQxNUpBKzNyM0ZKYTFwRXQ4Snh3?=
 =?utf-8?B?Y09Jd3RYaHJtQWlqWm5SYSszQUZOei9xdzFRUVZ5ZGdiM2hBN2QyRTI2Vktz?=
 =?utf-8?B?U2h3UVZwTGZwTjJmWTlWK0FmUS9FY0M4SDR3WUxLM1pSRXppZFd0bkhzWHVs?=
 =?utf-8?B?Ym9Udzl3RzFTdFVESkpPQW4zMjVGVVZnU0c4Ykt2RXg5VnNqanpjcXJEaExS?=
 =?utf-8?B?dnpCWC9CY29CYUswWTNYZ2hpeGpVZjJ4NytFVkhzNlczSEdGK0pHLzlCTEZ1?=
 =?utf-8?B?eWg3YmZLZ3ptUmpWNVBrL1RBTW80bmRweHRFejMzc2wyTUtmbWJIL0xwS1ZM?=
 =?utf-8?B?aVVMaXAvZ1luMVNEaEhmek9tWStqVW1oS1RYbzBYaE9PdmVqWER2Z0ZCcVZl?=
 =?utf-8?B?TDl2d0tDY241WUMxeWFEVi9Tb2owcjAvK1ZkSzV2MFRubld6bmdJVXl4bWhz?=
 =?utf-8?B?cTR1SGtqMkhScUpMbHlVUzkzSWRsWUtJdzhaTmFMeS9CTHlBUENuWlhrVHps?=
 =?utf-8?B?YmJqbmRYUmY5ZjdYOG9sNGpIR0lTVHBxakJCVkp3ZkYyVitpRDJYek1JYjBI?=
 =?utf-8?B?UThsOUJhQnFWWlN0VVdsRUtqbDBqSjlBQ3J1eE5QdmxpS1hrYzVpNEhvd28y?=
 =?utf-8?B?ajJYanpycEsyRkRiM2VuMnpvOWRod2ZuUDhocFF2M0F0NjBvNloza213Qmxz?=
 =?utf-8?B?aThpaUtUSFNYOW5TZ25hZ2hTelFnTjh1N21mbmVMVFlDTU4zaUV6d01tM2VZ?=
 =?utf-8?B?ZUloT0FjLzllRFlpZGRTVm1KMHNqSTNoanBxWUEwaTA1K2NQOWI3YmFrWTY5?=
 =?utf-8?B?U2hvUXYydXVRTnhLU3pLbzR4RTE2Mm5pbnZpYlJkMmlwRFJLajBLaHhIc0E1?=
 =?utf-8?B?bVRzZDdoOXEzY2lDZjUwanFTemhaMUVieWg1MFptcDNaYm9MRmQ2b3BJM0o2?=
 =?utf-8?B?K0FiVEVFS0szN0o2TDFEUG1oQjhxRWlLMCtzL053R3JYMGdHcVl4MFBpZCti?=
 =?utf-8?B?UXJ3SDFMMmJLdXgyZ1RHNk1MKys4ODBZWk5sOVVGcEJ0NXV5T0UxSWNuOFBL?=
 =?utf-8?B?S21pYnhvZ29Bb3hpdDZZQTVuUXJmOEt3VUpxNjUxTjA5Z1ZFU2Z0MWZ0a2xP?=
 =?utf-8?B?YzZkUzNJV2FMbnVyWUNBdkluTE80SWc5cGNjNUVFNTJhZTFIS0VjVG9lY2lB?=
 =?utf-8?B?NE95VjJ5amx6Q1NnSXB3enlYSC9vOGpiLzVKa2JsMFd3SXZZWEJJWW9MaHcx?=
 =?utf-8?B?ZDFHbkE1eU5FU21ZQkRqOUlVbE92MytzMnByQytwNm9KOUkvcFFqWElWY0l1?=
 =?utf-8?B?bUlYbDJxK0hXVnRzRmdBMzkzYVo2aGpBZmdwVkFQRzRuSzlvbTkyYVNBUFdU?=
 =?utf-8?Q?lpqGSii50ZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VGU1FBZmdlcitjbHNISE5TZVZTTmxsMVovSnFEY211TDJSYW5ueTFjMDk2?=
 =?utf-8?B?cTN4K2dOVkZ1WWU4Z2RPMWpoQjdCc3c1eGFmTXd1K1ZUaW9IK2lHUWFUbHZI?=
 =?utf-8?B?Z0UwSGp1dDVvRng4eWorTk91MzBORjZldXFmMXNNd01TOGVNajliS2F1MXVh?=
 =?utf-8?B?dXhmMzEzSytLcExqL0FYRjlGY21LMnpvSVcwMmQ0bzJuTUJpZk9IS2tuY3Rk?=
 =?utf-8?B?eVNaUStRR2wrNnZVY3lEc01SU2xiclNvOEk5WVhyL0JoTXhzRXQxUXh2TUxY?=
 =?utf-8?B?MElmUVhUZTk1QW9iZGk1REwwRGZJdW9rcy90WE45b3J5aTZERms4NzlwdjVM?=
 =?utf-8?B?dG9RNUlNY1pCM3R0SWU4SVl4TTdiUk40SDRDanBmWFNWT0d1Ukh5YnBvcnhy?=
 =?utf-8?B?cGR0SXArbDA2Y1hBYmVGVmNzUjg0UVdJdHJNY0RLUWZYY2VpQTFMMDlrZVRo?=
 =?utf-8?B?ZWJsdXR6c2ZvV2NoRytGK0ZMRWo0R2NNYlhIR1pwRmM4V2xNbHRYVUcrbXBD?=
 =?utf-8?B?TEYxcTY3RUdGakl3OXZsNmd0aHM5WmNVdmJuVWtHNlRrSEpSN2JOeDY2UlFJ?=
 =?utf-8?B?cXNPbEpSWUF0TE1iY0hrTnRVTjJpdmVZVFJUQTBiOEV0YVlMQkRpMzMzU09x?=
 =?utf-8?B?SE9zZDllL1hXZ0FBakhOT3ZuWWs1SWo2aTdBdlR5cXJBS1NSbUh1eHN5bHJs?=
 =?utf-8?B?ajlXTncwaTN4V05NaVZML2dCcW1oaEppTUZ0aFdDdHJiMVNLamFYeUg0ZlBw?=
 =?utf-8?B?TFlVRmJJVXkwMUlKTGhQQnRyLy8vbjhtRjkxOUxRZ28welQ2NUhFczJUN0ta?=
 =?utf-8?B?YlVKY3ZYRDJlMXlXQTNyZFliWVpiL0w0L3N1UGg3Zzk2QTFoYjcyZWRSL2FT?=
 =?utf-8?B?ekZsWXp5TG4wWHVyMEdLTWxSKzJYWFFkQTIwZ0VmR1hYZzdtZVl3TDArbC9B?=
 =?utf-8?B?eWNDZ1ZSRk8vM01wYTNDYkt5M0h1emkySkhFRGpNcjY1RDJOSzlLWldLS2I3?=
 =?utf-8?B?b3ZxZ0ZoS1J6Rk5rWm5VSTFGUzU0aU43aVVTVEpqWi9hY25TeTk0RjFJS0dr?=
 =?utf-8?B?ZktvcWlnMzR2dWJKM082RmlBMGlnNk5jVnZFWmNBZFZoeHdmbzlWSUlJZ09W?=
 =?utf-8?B?U09JcFlUeTZRQzdmeXhOT1BzcTFnYnh0WXptOGNnc1QyNkFjcGtHRW82MVQz?=
 =?utf-8?B?RG5oNGVWMWlDVlAxZ052bHNkWU9IbXFya3lORzVHVS9RRlpQOWdRKzhUWXRR?=
 =?utf-8?B?cHRyanFvUE1xc3RiZzJ2UUNDNEY1QloxRXgzOERmdFlLUHh1dzdlOGd6WWZy?=
 =?utf-8?B?ZDlKalAvSzYya3BlUkxzZmNjNVBadzVvVDJ3UjlHOFBaQXR2enVMQWFpWFNF?=
 =?utf-8?B?RDFxeHJLOFIyS1ZpT0tLWS8wMHR1R2hmaUx0WStMRjlBR0htSUpQWDE3dUM2?=
 =?utf-8?B?NzY3NTZvZ3RUK0JjUThGbEtiM2puVnAxTXErRGtXeEhneWtVUFVmeDFCekVr?=
 =?utf-8?B?YnJiSG1FS0R6N1ErZEV5bXFMM0RmOUN1MU9QS3JhUUsvMVBxZ0tQUnptcGQ3?=
 =?utf-8?B?VysvRFk2Yyt0Qm5jTTVhNHRxYnpKVm1PUXAxdG5URC8zSHRZc3hqZjRPL0lG?=
 =?utf-8?B?RFJYL1ZCR2RXRHlvZFBhTHl1ZE80WVkwUzZ2ZGlKV1o0OFRQa0Z3cHhxS0JD?=
 =?utf-8?B?ZWY1VlZ6UE5Pd2J6OG5SSmxiWGx3WXFTb3ZpOWhzU2lxNHFNcWdoQzJMTjFv?=
 =?utf-8?B?TTJjMkxpbnU3a0xTLzMramcwbWVmckZ4a0JleUFRZ1FZMW4xblAvc0dyaUt3?=
 =?utf-8?B?K01JSlZ2dTVtWDdGQjNvWEYzNDBPS2lLYm5RdjFPWEk0eUVQMlhrcDRGVWVT?=
 =?utf-8?B?bzFFaDB2Wm11U2Y4NXZWNHRTd1hpUlNJQmFiSGFBQmx5bHdxTW5ZSEVEeEIz?=
 =?utf-8?B?VTRmS25WRnBHTWZMVlhPbFNoSDdXcVpSVjl6MmpEY0llWVFDYjEweTF0SW9s?=
 =?utf-8?B?cS9HL3BvejhmdjhnWjlCUTA4VlN0aVFWcTNNSGE5S1BjdXlia1piNjhQYkhV?=
 =?utf-8?B?SjcxZElvZ0M1Q3JnbExKVk9XUUx1OU94TVRRenorTWtlcWZOY1pHaGhlWWxC?=
 =?utf-8?Q?TFoI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ab0257-27c1-4ad0-8804-08dd92ebe199
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:33:15.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pJEAFwM5B6/wYNdFbpNjyYJLGvaFT64Cpi3YePNfU9kb2gRG4nVvkeGs1ZMWdGK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6362
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

On 5/13/25 04:06, Hyejeong Choi wrote:
> smp_store_mb() inserts memory barrier after storing operation.
> It is different with what the comment is originally aiming so Null
> pointer dereference can be happened if memory update is reordered.
> 
> Signed-off-by: Hyejeong Choi <hjeong.choi@samsung.com>

I've reviewed, add CC stable and Fixes tags and pushed it to drm-misc-fixes.

Thanks,
Christian.

> ---
>  drivers/dma-buf/dma-resv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5f8d010516f0..b1ef4546346d 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>  	count++;
>  
>  	dma_resv_list_set(fobj, i, fence, usage);
> -	/* pointer update must be visible before we extend the num_fences */
> -	smp_store_mb(fobj->num_fences, count);
> +	/* fence update must be visible before we extend the num_fences */
> +	smp_wmb();
> +	fobj->num_fences = count;
>  }
>  EXPORT_SYMBOL(dma_resv_add_fence);
>  
> 
> 

