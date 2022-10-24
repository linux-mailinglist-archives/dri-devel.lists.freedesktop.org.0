Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C80609A14
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 07:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625F10E253;
	Mon, 24 Oct 2022 05:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700F10E250;
 Mon, 24 Oct 2022 05:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guTaibjFbyq5c43hPCTrwS4ZlhptGyV7fQukYy9I/8U4wL2JiiEPk/Q7JAgCKoqUFiXEp1sGfDSpJAjw/op9YjyfAFdkxR7bsa0hB3WWfb5g5Vzfj/BfQAQaj0PL6P6YgLBr/2q9Hsr8oxqqlmWxnyfDtGV918D6LfDY89fLW+9cUME5VlfstygcoaYx2kPEhC/b4bUf57hQN4S8Khrh+ygAxY3jimTGbHaYLGWIyuRezeGmLUZLNpVdYDFmCaAnHhACzhJpHS+No/hZkdVp/nmxVuRmh7LDMP3SVH7xBWJpd0rZg5538aHM4NhjewoP+zprYDZ6BRCZ7dUTjw/FsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tVxykmIcqVgovvu8WNvnoTV2xaXKZjWJShMDltaXLM=;
 b=TTKTVcxb/hMiFAxq0djSygoqDZm2fpEtBlxtzxi4arnRbMJag+nm/xpQZ6hcV3biOnaUf5bWF2bLY2DzfyFmC32H2/CZ6mAVT47JCCHKkpossgR3ldiG7BDOP0gTOhDaaEEzi/cZ0s9fDweosXYxRzhfJkJafoJ30dbpf9yHakkkHx6xJ3bxFn0KxePIaYrJABAs7vvDGllZeH/nBkni4oDAiHgPQeV1gJmSl2yt37A/8UU+aMDcVo1UksaBpGY1lJr6me7p+cZjbWassv6s73EHnUxKmMMVSyVfGSncgMwRCJULX9kpE2nYnGGbpBqu0BpcDTK3SUC5Cxcy7EH/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tVxykmIcqVgovvu8WNvnoTV2xaXKZjWJShMDltaXLM=;
 b=nScNW/fkTVB0J16yrumBu9TSYa87zKHr4FxcCN2Yi6KC2IIaLu0SfhR3FXhryqG3fz1hco5PNxqeYJncOoZGmyY6MhRFvfxeqEQPByvCfwtXEO9PjgVUtVSr6ZpY0FZNlCU9xN9JzlN1GlKi4hsrJXoqzRFtBAmtw+UFWyqccx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 05:53:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 05:53:41 +0000
Message-ID: <dc92cab9-67db-4dae-8a94-150ab1a4cf24@amd.com>
Date: Mon, 24 Oct 2022 01:53:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 09/13] drm/amdgpu: use scheduler depenencies for UVD msgs
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-10-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-10-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::14) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 011f262c-12a8-465b-9ea7-08dab5841aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNWeEbT7XkDSzidz9mAK7brrdRv/LcR+d7ZyvwGcg/ao4z73cqIkkTxldOM18N3qBTJIBfcSBovGpZVsytQ9YuAIsM/jgSBRo/KVd6rvEWrw882CSgrzk3IekPmzlccWRyNQMOeA9PjE6MyjvEg+QSeRrUAw2q1G6L8CAL0k7Y1aOsHYs31fYS2Lv1coQRgaT47zeUtQC50uXFY22ri7d7r8775iLyRZJFUbHEKX3BN9r3XYJK4dQr80x5PKafs1NKLkWUUJ7cYEyS39nXZY1Trk/i3yJZczFtzF9k31OWv0L4oSiSBX+dhthKTd6zV7+Li2j6+5ITq/MVUTtFhZesyTFPu/LfOakSyKDkcaiNIbks0iv+GhHrsiWvr2Ea+O2a3b/UbI1eTG5NQPIAXjMQGCcIk3om7suGH7sVCY5onyn8sS6AKE7bWH7ZwJhswygZpUKjZ9RmC2x4B+xq0/JbHZ6rHxEsbddyltzwm7iRAulp1NvT+j+XCP3Pw2ESMrgt6462BU4F/TMinzmcBphCEAWNXpbrrOwDEcZ1I5LejYeTaWc41s9XsYLyMMlIb7woAsM8T6zRe077rDdE7Pm3TU8m1bbTX8RSouPDXmbtfaA7oe9gF5GE4+WqN6oXfqpOG9KdUCLYYv3nHlLvFh2ARR4ATOFymQ0JbpiyoPm1YEwUm0EUF8VBySRqibIPDb1qvMJ0/tI9rBnOqo2Q8ElSqnxAPf/lsoNlKVGEF/H7BUp0PenLze/4Kdw5LSd5ap8inehwSdbNUxaDLeIyJ+21aS8j+sTqZ5dUrm4ASkQ7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(5660300002)(4001150100001)(2616005)(86362001)(83380400001)(41300700001)(38100700002)(66946007)(53546011)(31696002)(66476007)(66556008)(44832011)(4326008)(8676002)(4744005)(6512007)(186003)(8936002)(6486002)(316002)(6506007)(2906002)(26005)(478600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZJazdNa0NLNzNCbjFnMnJIQXFjUlRLRUNBNjMyaUI0Uzl1SGtLOUJpWEZh?=
 =?utf-8?B?SDJxTEoyczNzaGRnaFh5L0JpL3BiUVozaWRvWk11WjBxNE1Ud21meTJtcVla?=
 =?utf-8?B?dWZETllnZ2JVMG4ySGFTNjRzS2I2aHZtMlpxNFNtYnp1M3hiT3BOZkF0enYv?=
 =?utf-8?B?Vll2MElpU1JwNzE3WFBiSWoraFZmWXg0ZmlKSjhxdCtqVWFoeS9VbXRXRHNQ?=
 =?utf-8?B?V1NHelY5ZUZ4cnVxR1VYeEk1U2ZaTHBwQU5NdmpoUFVDQ2dmWlJ5OHp0UzRy?=
 =?utf-8?B?bWl1SzdJMFJlOFBncUZPdVhBdW8wdFV6VkZEYStMV2wvaVYrWUlTc0d6RVgw?=
 =?utf-8?B?Yk5NSHVER1NxQ0dPRGdoWGZSclpRRDNQejhTMWZ3Umc3MjZsWWw5NDMyNTJY?=
 =?utf-8?B?cEpQa0p4bkxreFAxakxuaGdiRkMrWjBrY0EySU5Td1lWeURLTWlWS2YzWm1r?=
 =?utf-8?B?ZHhPdmtweTk0c1dQSTc0Yi9Sdmw2Y0hkcmdNUlMzL1BVTEJ0YmR2Wk5oUmtX?=
 =?utf-8?B?UHBrSzkyKzJpdmg3TkhuNnFsRTM5S2VFN1Z1aWlMYUNGSHZiRGtsUFdpU3pL?=
 =?utf-8?B?bTlWNHU5SnFtTHhUaG9lbkFEZE53Y0ZqKysxZk9XT1psRjdUclhWZHZXRU5w?=
 =?utf-8?B?MmxaK2ZScUZzWHp5Y1FwczRFclk4b0QwNUE5TmJpMGQvS01Ed2owQWttcS9E?=
 =?utf-8?B?NGZUR3pLQjJYZG1qbFFIbU44TmdDQTZLVWZxVWU4Um1CdnZ1dnFVTXl5QWJX?=
 =?utf-8?B?dmRycTVQUE0yYlRMdEcyYUtHUzVmUDhaZDZsdnZ5Nkh4SVdSbjBUNDA1Z1NW?=
 =?utf-8?B?eVZrQXl4SWlza1BCdDBydjk5WDJ5dG8yYlR0WW1mU2IvR3E3eFR6TnZzR0xD?=
 =?utf-8?B?VWVoYVN5OXh1RUdlOHNSV2JPRnJpOFVWOFlrUnNtSUM4MzBVcWZqVHJqZTZt?=
 =?utf-8?B?ditxTzhLY01XR3hPWXBzU2JPdkdDVzE4cEpLaGFPTmpXc0NpNFJGZFBMWm9U?=
 =?utf-8?B?d1U1OTFFbkFqNnRxZkhGWWZCWTdha1k0aUtKdE5rQ2Q0bFhpQVpTcWJaNW9H?=
 =?utf-8?B?MTYxamVQeFA0YkJETkFPdmRFbWczcTB0b0ZrYTRld0s1Z2ZQWFdOajVOTklJ?=
 =?utf-8?B?c1lrdDlISFd2V0F1bFo4Z0QrNnhlY08xZzZVVzFTNnNRNFk3VXNSdHF1M1Zo?=
 =?utf-8?B?ZS9wRnVlMnZTekg2WDZWaUJIYWdqZ2RIdlMwSzhBZVJtSXBROGpKY3M3d1Vv?=
 =?utf-8?B?ZEswR1hSMkR3eVdkb3ZaT0ZOSjdmeUw1L1lIQ0IzdVBON3JscnNOcitEaUY3?=
 =?utf-8?B?YjZUdklkSXoydXZYNjh1UkNIWFg3SzhaRUhndFdZMGU2M1ZGQWMzM25HRzNS?=
 =?utf-8?B?OW1NaTdJV01jeldBZy9JRFNXR2xzRDdLMWx2Y1JhRmU0SDNxcmlic2o0NGF0?=
 =?utf-8?B?OFBlWnVNM1Iwd0ZKeHp1bEtYUTVVblRvTTlkMDI5ZnF0bkh1dGo2RTZ0K3BG?=
 =?utf-8?B?UkpXdERaVFYrVjVoR2pQaUNMSHRJWFVCUVhCNXVqT2V5bGdPdFdwYUMxQ2g4?=
 =?utf-8?B?ak54OERoNHVGZW1IRkl6dzZYMWlkd1RXY3V3MGVrRG1NYlRmcnErOG10T0Ri?=
 =?utf-8?B?NzB3MjNDbVB0ZW1yVVM1eVdSQTM5bE9pWi96RHF4UEZBVHROK2FxaGhoN0Ew?=
 =?utf-8?B?R1c3Y0dZSGxVUmRpMEdrTUVyRXZiSXoyWWJFTWN4aG1mTHAvTjNKUEU3QVFz?=
 =?utf-8?B?ZnV6WWQ2S1Z3SHdDWVlzNy8rT2p2QnV1S2VoWDQ3Qy81TjVKKy9aZWpEOTNn?=
 =?utf-8?B?L0REYURUaWlubW5yWDdBQXpId09rYmw1ZFhFQTdVQm9VSkpITVgraG13V1N3?=
 =?utf-8?B?YzRTRlVabUxzNnpXZ3VhaGFDelpJQXdYYXlRT2xsRUpDbzlGZHlIVTBuYVR2?=
 =?utf-8?B?V21ZVkxRZzZKalk5Tmp3L0p5b1I2dWtWenNsN0J5cTNwSmsrcXJnaEdXaUty?=
 =?utf-8?B?eHExKyt4WXhrZ1doUG02bWZUbENXaUtYZDJnWUgxZXcyYTdxLzlpenJXRVg4?=
 =?utf-8?B?RXMyVW1iTUhBVURwNnJsNGNzOGFzb1A1VmpzQ2ZMcXRmNVV0T3loak1WMWZK?=
 =?utf-8?Q?mIK/EPDGoxBVSIZ/xmpBjcSKr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011f262c-12a8-465b-9ea7-08dab5841aab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 05:53:41.5361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKMDwdvdURiawGyQbAyzrsZyXC3Vps+WGPkYyXoZUVokB04e/1QzKm5M7m4yrsJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Title: "dependencies".

Regards,
Luben

On 2022-10-14 04:46, Christian König wrote:
> Instead of putting that into the job sync object.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 8baddf79635b..e00bb654e24b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1177,9 +1177,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  		if (r)
>  			goto err_free;
>  	} else {
> -		r = amdgpu_sync_resv(adev, &job->sync, bo->tbo.base.resv,
> -				     AMDGPU_SYNC_ALWAYS,
> -				     AMDGPU_FENCE_OWNER_UNDEFINED);
> +		r = drm_sched_job_add_resv_dependencies(&job->base,
> +							bo->tbo.base.resv,
> +							DMA_RESV_USAGE_KERNEL);
>  		if (r)
>  			goto err_free;
>  

