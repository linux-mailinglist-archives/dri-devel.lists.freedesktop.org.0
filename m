Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B09605057
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D92310EE5C;
	Wed, 19 Oct 2022 19:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDEF10ECD7;
 Wed, 19 Oct 2022 19:24:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWRTcRF9x+Fx+6kMBja3m5GNI4BDz+wDOaPFqm5Eso2rn+yGvvxfVSg2Ece8BCZuoJ67ITOYD+qXqtCukno28/s7LtA33wjhZDuhv4avXV0S3TrL/wyp0BVmtbMoRg5wkJRweMZY3BYUnQ1gV1+BR9w0Q90M20u/k1VWDW+jt6gpAplaUcaegNkfLF4826qMdMMaxP6otiIdNYA1OILH/hz8XID8t56ZO1vpZyGtwmu+ocBFuNzzTOBWoSBl84eArj84GuFThRf9g1rhU9EeaixELb5YuJvo+e8IwJShqyTTTmZOto8YPMvcRyBW1N7sqdmZmXSjEmaqqUKKa0PQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5toH39p+9RgaB0rWbCWovzYi5+kkCZBSR6ns0jns+U=;
 b=aC/+6pY8k6L/imGjiMb2eu+LqeqK3oBiuX8bf2vNORHueXe5uaGZmTIsQ59c0Vc1EDgA6f7IMOMI6QdMWKPp+2cQtlJjSZDTVL7xXGssX9LvPGfwcCPJH2M4+q2eSTm2VQcmzaQalpDYLDPZb0vjhI/MBE6OjgnENfyg9SpqJlXsZu9FfEDwRN3u9nyvFFaMwIS0EhbSmkEkC98Ao+vMetFSBZCYyZTyVGn83Txu0jC/fgZcix/VMhhLV4VTmp3h60wnjfGstkO2vQ60QqrR8j9fJyG3xG+wgUL6e1FIYp8UxFG6pYjxaGTDZeDUaVof9f1umkihix9TczLTRGk6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5toH39p+9RgaB0rWbCWovzYi5+kkCZBSR6ns0jns+U=;
 b=Mfhjrl4Sv+Tj/824yjDX97gZ5Xp0zk+2rC2kfEKpt0nunIr+nM1KCk1M7ii0KjGGHw+5O37QaiNkbhIIG+AybrLvn/9Kha2HnZqL8oEg4c7klYgzLE+NfvIFi2Yeif+vHilIg7bY/9VZqKcC7cO9MCIRQzn+aIR1OijdZHWi1Uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 19:24:24 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f9a4:8620:8238:20e8%6]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 19:24:24 +0000
Message-ID: <ad11c2f2-abe9-5483-addd-15b0c1328fab@amd.com>
Date: Wed, 19 Oct 2022 15:24:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amdkfd: Fix memory leak in kfd_mem_dmamap_userptr()
To: Rafael Mendonca <rafaelmendsr@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>
References: <20221018012751.887460-1-rafaelmendsr@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20221018012751.887460-1-rafaelmendsr@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:610:77::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: e1acd7ef-3320-41b0-7bde-08dab2078807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwr7BqeF8WcnIOcGRDjJcPjoaN+BU/Z+AZ3qy5y5hSTSdj5oFhs6GScgSGQVDhHjtE8lecjJX61EsHZ79GtSkwmBQEiE6RKXH3yrCfT9OopCp5nMQ55TYrQjTBTXxqQlqe1b0ZPLcmjFp/UxcvhJMgItfeYUEja/PhF0AUMxJt0Xnh43Vb/VZRp42FkpMvUiRws9yy4pBwGPLFqhtQrASKOnWJJ/1Tm3tjHduSx0A/ixVt9f7P6gHQA/X86/N7f3Nx3B8i0V6WCSgImBO7oTjAKLWj0cBfgvWYngjkDV6FWpzLm0z29eQNgHegIuDmHtE0fPhhYimpglUshJ3EQj5RJGoNdoZ5FwP2J1lBFETKLgRGzPLvdzGXYfcDA/hLgw5Bcu7HFgZMhDdqGfbSV5haxpKl1EG9PpC7c8RAq48hkrhlWV4uCyWVE3mxDpiMMJE+E7PhS5NKGM3pUPSqiqDSAMC+u4lrmlhnYHYMIQT81cLIJmM5eG7HxZ/rl6kje9nt6OZmM9J9knnU4EUSi7KeIjJYDezA+GZJT2Ru+Fin/K4B4R7esLGWxnK5/giK+DH9/dZfFhPRi7ChMdtQFs61MaIqdrP+A7UhnH1gULwQDdf/15c08xgoJLf4HH8bNv1iP9dpIiJ2inF4kpJYs1yF7xCjtwbI8sdDw3y0ZE72Fon+OtYEEdhNkSLxavVBwaLp6SlLEUgxyIPT7RW5TYAdY/u/XMMHSY7pyihpL1ClyN1psfUdiiVd8cwis/cZr3E1M9FkrVZKVag2TO3We9p5CJLL/U/i/He5Arq7xTShU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(53546011)(31686004)(6512007)(8676002)(86362001)(66946007)(66556008)(316002)(6636002)(110136005)(4326008)(66476007)(38100700002)(36756003)(31696002)(186003)(6666004)(44832011)(26005)(6506007)(478600001)(6486002)(41300700001)(4001150100001)(2906002)(5660300002)(8936002)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNXU3ZacVp3dVhnVjYyaUZJcSt4MTJrNXRmVDlZcTFTbFhBOVEwbzVOaFhB?=
 =?utf-8?B?a2VhTDN0YXl6cHB2T3R3azFqK011NXhnZndQSmx3eFJ0Nk1VRmVSNWlDQy9I?=
 =?utf-8?B?KzkxTFkrMlRqdk5uMHNNTnBQbjExakVKVGVxeGVvRmZEWWlrM3NpdHhsbXV4?=
 =?utf-8?B?Vk1jbnM1bHV3NnhMc2RySkNwUTIvWFEwUUFEUkJkWHVRdDU1M3RnOHJxaWFR?=
 =?utf-8?B?d3ljSUp0M2l0emlrMUR0a0Q0d2JNWWxQV0VIZ2FIa29tODdMWlhKZ0drUUli?=
 =?utf-8?B?NStKTHVieVJhTlJjdjVNQ0M5NC9FdklaRjB1cTg4MWxpeVhhK1VIRFhTRUlz?=
 =?utf-8?B?Q2Fvekx2YUMycHBVb3lVSHNnVnVKQ3BTcEtpM05HS1RmWElLZTdCMkxnSGpQ?=
 =?utf-8?B?YnhTUWcrRDU1NDhDY01wNjBUNVUyTThaeHJiZWpLelEvQ2xkQTFXSEIyY25z?=
 =?utf-8?B?UUJ2QmV5VFJ2MkVOZ2lzbEdCUUg5R1pabGxkdktsbGJUUFAxb0Q2MGIxcW85?=
 =?utf-8?B?aU1zQkRGY2FrTUJvczJiTi9yaUFuOWN1dWNIdzYzazFadUc2azQ1ekYwRkVY?=
 =?utf-8?B?Q0IrQnN3TjE3cjkrTEl3SXhwNHM3WEp1dHNya0g1OWgwRldBdDlCVlc3dXlB?=
 =?utf-8?B?VXlGRFByYllzMGh3NXlpYzJ0R21LZ2VNMUdqQjRTK3crQTZ6TXZyeC9kUTd6?=
 =?utf-8?B?K0NHRFNpRXNuSDFLN2lPaEJsNXF3b2xSNEg1NlZSRHpyMEdLbUpEa3RtU3NE?=
 =?utf-8?B?NU56V0ZOc3p0NmorVmhvZlFPa1BLdkZmdVNWeTlVNmRXL2ovK2dVTVRTZzBN?=
 =?utf-8?B?OGJVQ3U5c0p2RjIzSkhSWTIyZHFUV1BBVkUvcldOdVV2R3NocDdmOC9KTE5Q?=
 =?utf-8?B?NEdWdEllSjA2U2xQQ0lhUVQ2K0YwMWt3VDBpeGM5NFJQWHYrZFB3UTAxR2po?=
 =?utf-8?B?eWphcHd2ckxid3FDczNRckpTM0dTRkg3MGtLL2dtRkRXMmcyMGVFNG9ERWVL?=
 =?utf-8?B?RGV3Q3FEUUI5ZW9IbzU0aGhpU21sZ0pwOUt3SndlUzI1K09Za3pzSUF1REZC?=
 =?utf-8?B?cnBkWk1vUWxuNi92TWk3M1A4bm1VYlcyVlVYU2EzNlZNTkhoYkh2S3RuVG1O?=
 =?utf-8?B?eVoyMDF5WXdRd2FJK0k0cG9QSG8zZzcvTU96K0dFVW9QbW1zY01ZL3JKSkJ1?=
 =?utf-8?B?OWd2Vzc1S29YNkY5WDFJSHYyUDdIT3c1Tjk5bi96RFliYzVSR3FXalhrdVVP?=
 =?utf-8?B?N2gyVW1BS2N6aTFISGlJc2h4L1Q5ak51UlIrS1Q5R1hQalc1QjZiNVFSb3hn?=
 =?utf-8?B?czdJT21aSGFsU2NaYXdnNmpRSzE4dGZ0VzdIOWhaa3plaEpZMmJOOGFHTDNK?=
 =?utf-8?B?bGZWK3o2L3VlTjlnblhQUzd5Rlp3djhqZFRxOVVveXlWN25aVlpxaG1ZUlpW?=
 =?utf-8?B?dTdLM0ZBeWM0Znd6aHFubEZIc3FQQmJ5bWYwUHpubnM2K2xBRlFweVpNMitN?=
 =?utf-8?B?Q1NadGVkdDI2dWpsb0FVaXd5RndNdkpyVlNUNWNIOUJ5aklNamdkbjRObW9W?=
 =?utf-8?B?ZFdBeHhyVGN3V003YXlJT0JjR1FDbzJROGp6Qnh1MzF3Qy9LdG9iM3NZZzc5?=
 =?utf-8?B?Mk1BOFBxSnBOZHVQUk9ScGEvcmhKUjVYSllJZWxIUVBlZGZka2JJM1BmV2ds?=
 =?utf-8?B?UVdTVE4vL1ZjVEQ3YWwvWGRZTmx2YTB1ZXhnTEtaM0pSQm03ZitUVjllSlAx?=
 =?utf-8?B?cDNlcTFNYVg3bkE1bjkwV3hnaWVJdHpicXhZeHJ5bmE0ZHBkVnFUVnFSL2Yz?=
 =?utf-8?B?clRSYWFoWVFsRHVWY3dWdzQ5dDhJajlhRGJkbzI1MmgwUiswQUl1SXFUeFhW?=
 =?utf-8?B?cnZTN2Zzb3hLOU1SeHpsbW5oRXhEQjRvL013a2VDd2w3bDkwNHd2Z01BSko3?=
 =?utf-8?B?MGtJUHNuQVhiSXB4RW4za2ZtdVgvWGpsTWh4ZU4rZ1c4clRzQkxaaUdSSTlt?=
 =?utf-8?B?U2dNU1RIRDRBYmg1REJENG44Nit5QkRrUEpTNGtHWDFKdHpYSExnYTBRU3FF?=
 =?utf-8?B?VUhFSEszNUNjUUk3Um9DaFFvdUV0TzUxZXVDeWREZ1FoQWVkV2Z5eUlNOHJD?=
 =?utf-8?Q?d0eRgLJnit9yG+PeZp+NRuhb4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1acd7ef-3320-41b0-7bde-08dab2078807
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 19:24:24.4615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgaEH0gZn9VQiIGnOscGHV3AM7quCKdUmLVZpJ2zIU+u5BD7eMXLTtBp2371ZL9uoUwtkAw/VNjR1VKpOs5Ohw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-17 21:27, Rafael Mendonca wrote:
> If the number of pages from the userptr BO differs from the SG BO then the
> allocated memory for the SG table doesn't get freed before returning
> -EINVAL, which may lead to a memory leak in some error paths. Fix this by
> checking the number of pages before allocating memory for the SG table.
>
> Fixes: 264fb4d332f5 ("drm/amdgpu: Add multi-GPU DMA mapping helpers")
> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>

Thank you for catching this. The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I submitted it to our amd-staging-drm-next branch.

Regards,
   Felix


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 978d3970b5cc..84f44f7e4111 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -510,13 +510,13 @@ kfd_mem_dmamap_userptr(struct kgd_mem *mem,
>   	struct ttm_tt *ttm = bo->tbo.ttm;
>   	int ret;
>   
> +	if (WARN_ON(ttm->num_pages != src_ttm->num_pages))
> +		return -EINVAL;
> +
>   	ttm->sg = kmalloc(sizeof(*ttm->sg), GFP_KERNEL);
>   	if (unlikely(!ttm->sg))
>   		return -ENOMEM;
>   
> -	if (WARN_ON(ttm->num_pages != src_ttm->num_pages))
> -		return -EINVAL;
> -
>   	/* Same sequence as in amdgpu_ttm_tt_pin_userptr */
>   	ret = sg_alloc_table_from_pages(ttm->sg, src_ttm->pages,
>   					ttm->num_pages, 0,
