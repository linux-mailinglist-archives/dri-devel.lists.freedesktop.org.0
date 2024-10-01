Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797098B60F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 09:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2975F10E05B;
	Tue,  1 Oct 2024 07:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dno8Rf4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136F010E05B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 07:48:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWLxI0X9PtkIQfgEfyqNVC33+uoIXqdF4QIxxeG4tCc2qzxI9UdpCH5ObWhognmzdujF47tyUR7mMUNPhgxz85apj22b0TzdZ1HURWcUPpt2w1G0wBhFdgjgVMw3ODeEjLI/RP+gzAazrXhd3aLbZ0Ry1X9dIZGpGYTkjaXoqM6foAXKGREQGmi/BkB9DbGPrHtVmdQG6ejl02W+EvLxNlY33o+qI0KSPZI6zV+9JpB3596f5mA86EzZncLrcE0zqsujxQnvOk4cxnVFfAx+f91vSCjGN0GmPOj0wjWCh7+9IIRqtdiczdDsl28AjIqCjbKnyzqe8NEwYJDXgNbsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvqVXRGtQ0cfNmkw5iZG1nuXszdt+1e0GG7qitonYjE=;
 b=wso/7b9u6/ghculifO+T1I2UVtajGhkNhzCN+q1JcyFJ55vkEIVqUo3gZvqY0EAt5pv2jOZqRxFq096YkP5cDtGP8MJ9nguhIRBvPrN2V1XrJCZaCKa3lCepEAf8M/62vOvZPyIxWPytt0VDLCGNxs/JzL38eznF/bYg+BBuC1l7dg3QrLI4QAjL2rTJHhURds+YXXbIbA1QrL2w+dJ8GS6czs379yKBP5Iq7a0vkr9vvOsiURm2/SH5sC2J5FY84Wjja1c0O+zgR8W3cXA1QWzmbgsrSnhDk8U4ocaNv85cbp5wy0mwrmYO0jfn2UIPZu+FbhXIE2ix/S0DfKjz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvqVXRGtQ0cfNmkw5iZG1nuXszdt+1e0GG7qitonYjE=;
 b=Dno8Rf4fKCmJbn3jho54G2eE+u9Bt/4zc47xkfteD7kHZ0SFAvUOkWFyk7Zq2c/hO9gnErd0VDBdCWbazOb3M7JPj9UIzGtKvT8+wvuFY5Tzk7u3kgzzyb3vAHPF3lO6K/cTFoijbJXKt5HMZASshy4Q2wldmJMGb/yjhJe4SjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 07:48:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 07:48:43 +0000
Message-ID: <8ae0deb8-37ae-41a5-8f8e-185c62048d80@amd.com>
Date: Tue, 1 Oct 2024 09:48:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Question about 'dma_resv_get_fences'
To: Zichen Xie <zichenxie0106@gmail.com>, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Zijie Zhao <zzjas98@gmail.com>,
 Chenyuan Yang <chenyuan0y@gmail.com>
References: <CANdh5G4Yz4+s342F3GHy6wNWNXXR6PTC2tRibfVjTAg=K_KMtQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CANdh5G4Yz4+s342F3GHy6wNWNXXR6PTC2tRibfVjTAg=K_KMtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bca2c0-a3c1-45e6-9b0e-08dce1ed7938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlFGYlpVRVdoTmlZT2ZEMCtWaERuNDBDMk5adzhqZy9icGp5YU5CL25XU1BZ?=
 =?utf-8?B?aDl2YUtjUHJYdnFubUx1TENRajJJRU1PcmZYWkpxeGFuUHNLVkRubnBaS3c5?=
 =?utf-8?B?THc1Y3B2QmYwSlNINzYxczZPSGFBRXRHeEtsYTRLdTl6UHZQWW9JM3F3RE42?=
 =?utf-8?B?WFFtNXZmMEI4Yy9QL3JEcUpzK1JzSzFPQjJnMHlPL3ZZSU1tcUJPS1NiS3R5?=
 =?utf-8?B?NkJZVHVxYXBVV0hZY1VGbWJNb0tkSWZIK0NLVDlUK2tQaXF2K2pZbkFsTHlS?=
 =?utf-8?B?a1h3dkNJVmEvSjMxYW5aU0hQL2I5clFYYjZTblVQNDUvZGdjcXdid1puTmtW?=
 =?utf-8?B?enFZek50Z005QWdXVkhpb252ODcyMUE0TTR5dkNqeE42ai9td1BpNyt4SGF4?=
 =?utf-8?B?Y1d1UkdjeU1PSVI3bXR4TEJtQkc4WUFPZ2ZKeU1WRERMVU0ram9iQVhFcjQv?=
 =?utf-8?B?dWZHcVRiV0dwVFhoVk1BTlpVaFpIb2xYc08ybkRYbW9BOGI3dCt4QUFTczZ3?=
 =?utf-8?B?SFV2bEpCREJ6OWxOMFBJcUVXbm0rempoZWk4L05XYUFKR0I3bXRFUHkzQlhZ?=
 =?utf-8?B?YThFTVdkcXpFeGFyVHFFdGk4dllKSE94VUYwQlAwcWNPeFpLNUowQXJzMWFV?=
 =?utf-8?B?YWw4L1IraUVFOWxma2JScVo4ZjVnY1NFcGZZWXl1dkl3Sy82UjVOVlJLLzIr?=
 =?utf-8?B?OW9ib2tPS0xxQUg2SHNBNjRacWdyVXBnL3NyQVI3SEZ2VFJtejRWSVo0Skp2?=
 =?utf-8?B?TzdJTTV1UE10WnBHR0UyK2xQaWlPRzR6RkFhTng4bHZjaEZQdE5pNGJCKzYz?=
 =?utf-8?B?MmZYcWpPc0d0Q0xEaE5pcVNPcTdyLzdIK2Z5bXhURTlGdVB1R0tzZVk0VXFx?=
 =?utf-8?B?SXFyWkwyMjlJcEs2ckVHYkJIcVhxUTNHUk96SVFNY3VwKzd1akVpOGZ2NVNQ?=
 =?utf-8?B?a0xVeE93SW9MVVJBTDBwY0hHVk56UGE3Ti85eVJ1cEpXYjY1VkFGWG9Ubi96?=
 =?utf-8?B?Ym1yN3gxVFk1VWVnME5USVJJK09HcDlGYUl5L0o3bUhYWmIvb1cxSEozZXA4?=
 =?utf-8?B?cTJVOHZ6VkZ5K2dsbXorL3BEUVlqUTYrTW9EeEF4ZkJmVnBUME52a0g1d0Ux?=
 =?utf-8?B?R1NwVERBQXRMS2g3K3MzL2pZaXg2eGhGaTNUUGlzaHNrMFJBMEFYenFnTTNQ?=
 =?utf-8?B?bXZtOEZDOU1tdG9seXJzYStRUmwySG9kRFBMZ3k1OWpiczF3TGp2SE90L0U0?=
 =?utf-8?B?MEE3Nk9FQ2l4U1Bib2ZvdVBrMk01Rk92S04yK0E2ZHBVZ2lUNmZQV1lwR0pD?=
 =?utf-8?B?UXFlVDdyL1ZIWjRPQkdqYXlvdlVCTS8zUzkvRFNWNVhCSU1SbWNXWGxIVk9K?=
 =?utf-8?B?U3VSc3cxclo4RUJnODg2SkxkVkZJMWs0L3UwY3g1SzVJRUUrSmtoNGR3K0l1?=
 =?utf-8?B?RDJEQXJqSTZFYkYxSDQyK1dHRjJaOStkZ2Z3UTM1QUhXTU1LNXFvdlFPVTdB?=
 =?utf-8?B?RUV5N0JwYXpqczMrVjlmRzgxODcydE41RmdNUUZyZFB4RS9vY254ZzBiWEt4?=
 =?utf-8?B?UlJ0M3BjSVpXOTh4NktueXRNT21hNElOTXRmL25rSDE4Ymd0MzdXS01SSnFT?=
 =?utf-8?Q?eCMLtvQQG8CZLkQGGiY3mlOIgDz0oKMxJMKEyN0/ToM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW5lRkJJM2s3WGhOQ29iOTJ5YmpMZ3c4V1FwZ2ZBOWdpZWhJVWtTOXRjUFVB?=
 =?utf-8?B?eldPT25YK0x5WlJLcHR6T0xFZVZmQTc0bDgvc2RLOEZSWnFyTitNSm80T3g1?=
 =?utf-8?B?dzJFbzZwQTJWM0d5V08zOVQ4dUlzaDFTVy8vZU56UlZGMU1qV1U3elg1R1BN?=
 =?utf-8?B?MlpBSW5PNFB1OXY5NXRFWDV0RWVXbGoxdjQ5elF2VGlzNDRiN1pra1lQNmRP?=
 =?utf-8?B?SE1YQ29YZnlWc2JudTFMNll6eGlCUndLVlRXdU1DdjJ6VUVKSGVrM05xUXJ5?=
 =?utf-8?B?Wmc5V0hJMjRYb2VlZXdlOFh4VTM2MVdQb3oySGh3VHZId1NBQUQ0WXRzaWpp?=
 =?utf-8?B?Q0hYTFplTnNNSTBRQ1h6SC9qNzZBSzN0bW5rZGVFdW5mbjg1ZitWYVVOSjBV?=
 =?utf-8?B?RWQ1SVZDQ0tSMDdZUmFGS1NJT1ZkYWhGM2FBd29xT0YrVzdRY1NUbzIvTnBD?=
 =?utf-8?B?Nys1TmNNbGZKSXBRWTZyVkhOdkpuZ0tCQzhtRm0wWWxhNlh5SDlDWkxxYUFN?=
 =?utf-8?B?SGpGcWFRK3pkdUFMSzNyOVkvakhYZU9YeWFuRnU0OXBmL1NLTWo5eTBJWkFy?=
 =?utf-8?B?NHZJZkljSlI4UGJXMzNuanI5UjFBdGQxNEpDSTh2YVJFZWpKWjk4WTF2ZXhO?=
 =?utf-8?B?cWVKV0pLNitYWTFNVTZlWWtLcWd0cE50SzJkV1hCTURackROd3FJWXJ6NHBD?=
 =?utf-8?B?eUdKTjM1MEU1a0RsY2V2Yk54Y0pDb2V3bWx4NDZpaVh6U0hZMGlpVTFYVEtY?=
 =?utf-8?B?ZGhoNE1XQlBRVWM0Yzd3R2QzN0w5WEdGOTVTazlKK1o0UjRoWkt1KzhxbVJS?=
 =?utf-8?B?eEFicHgyLzJqS2hoU0FBaDRUWDFLb25PclRaMXZvQXd0cG04UVFIckZhR3Vq?=
 =?utf-8?B?TE1wMEZPOExMNlJ5bEZVWlVWblJtTm5rZ0FlK0RuU1V3am9nNXcrRWlkSHZC?=
 =?utf-8?B?bVgvTHpKT3c0bHJRM0JjY25ucUVqTitCYTVhMzJpSjFEYWk1RE1zQW1wVy9z?=
 =?utf-8?B?V01ORHVVNGl4N0FOTzNBS1N4aEl2Q0kzVlVwUmttSHhWMWxDSjlRN1B1RnBF?=
 =?utf-8?B?SVJkL1M2Q21ybVdEblBOT2RaL3ozTDdJSXUxSGZtWTlnK2hSeDdQczVwZU9a?=
 =?utf-8?B?dklYWjY3K2VQa2x6L2N1VFJqcWxGTUJHUCs4ZG5NbWVpZWZYeHNpVGdDQjB2?=
 =?utf-8?B?b2dvYnBqbnE3YmxpQVBFd0JyaVJUWlpZVUNuT2JpN05NSW5MR2ZnRUdaZjVx?=
 =?utf-8?B?ZjVZaXhyMFYwUzZFT1A4WmRlUFBQOWRlenBDUEttVDhYWXdnc0tnRzBsNHVh?=
 =?utf-8?B?dUZyMEVZMHZjclQvcTd1UzcxNldUd0VtMVRpTEpGVmFyNVM0T2dQSWFjcmh5?=
 =?utf-8?B?OWxPQ3FOR0dTbHBRR1lFN0dHY3oxakovRWtpVG9WSFNwaHJySTQwV29aUllh?=
 =?utf-8?B?b1RHVEoxOWJ0cDhaYjhJeVAvM1B3Y1I2Y2dhNlM1ckJtWW9vZ083RmhMV29p?=
 =?utf-8?B?MmxYblJaL2JrYzdHTW44aTJFcGRMVG1Nb0lIREcvcHcyMWgrbnBTdnMxOGVP?=
 =?utf-8?B?ZFAzaXkzZ3ZBQTRrWUM0QjF0MWt1ako0cDU5YzBjdFQwTmlaYW1XWDdRUWpw?=
 =?utf-8?B?TUpTSDlFQllXQ3hBaWIwMDBURUJLTzZ6VnhLMGpLZVdxNFlYeDVkeWlmSDRi?=
 =?utf-8?B?U2RwN1JSKzJzZGlPNElKakRlaDB0UllTV3NSeGJZcXozamdFMDhxdWQ2VnZh?=
 =?utf-8?B?RnNvTVFrYmpSNks5S2FiRFBYdjMwNWw2S3FjY0J4dkFycmFSUXd4MnI5Y0h0?=
 =?utf-8?B?ZW00WUE2YWV4V0IzRE5PYVRlaEVOWkJYeGtNaFN5UVNXYmttdVRGUWI2VGRK?=
 =?utf-8?B?dXdyWkRmMVhpbHBKNE9yRlVaSFN4S1ZJQnpvOHNNRllsYll5SmsrY3dDQ0pN?=
 =?utf-8?B?MEZxdHhNWm9Sb2ZrNWI0d0xKejFxaEtwdG04UUNhM3Bjb0VTeGU3OVJVd2pk?=
 =?utf-8?B?a2Y1MW1lWVliSWw0SG00elJGcVJDMGZPMG45bHpMZlN0NjFYVmxweHlrOXJy?=
 =?utf-8?B?b3dZTUpQVGd4QVhWYzJwZnZYVnBRaVVJOTF3K05lcGhTUHA2aWRpRTdmWmRY?=
 =?utf-8?Q?TUwGmwFO5dNj6lcXRB1t3vCzu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bca2c0-a3c1-45e6-9b0e-08dce1ed7938
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 07:48:43.9161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 283fyl0Lkuikv8DLdESao/2vAXim2fZtbFxu2AsDH9WhiwDOxKJN1ivb8wfHRa7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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

Hi,

Am 30.09.24 um 21:38 schrieb Zichen Xie:
> Dear Linux Developers for DMA BUFFER SHARING FRAMEWORK,
>
> We are curious about the function 'dma_resv_get_fences' here:
> https://elixir.bootlin.com/linux/v6.11/source/drivers/dma-buf/dma-resv.c#L568,
> and the logic below:
> ```
> dma_resv_for_each_fence_unlocked(&cursor, fence) {
>
> if (dma_resv_iter_is_restarted(&cursor)) {
> struct dma_fence **new_fences;
> unsigned int count;
>
> while (*num_fences)
> dma_fence_put((*fences)[--(*num_fences)]);
>
> count = cursor.num_fences + 1;
>
> /* Eventually re-allocate the array */
> new_fences = krealloc_array(*fences, count,
>      sizeof(void *),
>      GFP_KERNEL);
> if (count && !new_fences) {
> kfree(*fences);
> *fences = NULL;
> *num_fences = 0;
> dma_resv_iter_end(&cursor);
> return -ENOMEM;
> }
> *fences = new_fences;
> }
>
> (*fences)[(*num_fences)++] = dma_fence_get(fence);
> }
> ```
> The existing check 'if (count && !new_fences)' may fail if count==0,
> and 'krealloc_array' with count==0 is an undefined behavior. The
> realloc may fail and return a NULL pointer, leading to a NULL Pointer
> Dereference in '(*fences)[(*num_fences)++] = dma_fence_get(fence);'

You already answered the question yourself "count = cursor.num_fences + 
1;". So count can never be 0.

What could theoretically be possible is that num_fences overflows, but 
this value isn't userspace controllable and we would run into memory 
allocation failures long before that happened.

But we could potentially remove this whole handling since if there are 
no fences in the dma_resv object we don't enter the loop in the first place.

Regards,
Christian.

>
> Please correct us if we miss some key prerequisites for this function!
> Thank you very much!

