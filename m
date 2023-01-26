Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AC67C7CB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C23110E2A0;
	Thu, 26 Jan 2023 09:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D1C10E1D1;
 Thu, 26 Jan 2023 09:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKAnSkv2oFghMcpR44nC2fr5f8V+DSrZl5yEBLjp2fiACr3bBLpXjsMqOOiu19gFKBNogEm0VCYQx6qoepgUr20DTc4E2797vNOhIb0evoj6tk3SfOrkE7gpWME/U1NspYG5gzhV+dBGFfdriz+7qCawtkz7bAI4NYw5QSj2hIpReh8JkZTxypBlgz5na4/d8ruc3Aukf/lqWsRfbrnqXMelh5hXDGZU13IjsCesAKYP3Dz0nTxkrpus/YJZduc7k8yayPrz0e2DPlOxCT8u1VfAGusbamcHse7CRqBQkY2UlNI8Dp+UTPGs1eZ143oRT7gpzH1XQ48Oa1q8gTCgmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9rQZaWNxTGscy77XmY8wLVgpKvWf+JGmrE1tge0of8=;
 b=EbNBBRmHj0BYz68c+h/DRo5mb6duwyl+lwEC9WpIPeQB/m+YQiptjfStJHrFND3fF0YnWXoWFDFhCUrO3yz+2xXpXoPDmOGy57KxB3DOklEjdY5HUu7zfqMERMP5xM94vHtkvozfxXkM7/qM6YtIJNWxSQuQMnA3L3KfK5Ssnz2gfBMQgXmGcSX1G/K+jFhuSJ8XkHCZF6cAooyseZS5ldhK3LIkV75DXdlQSZ22umeg2y8DD4tLgJqK0sYPs8n6Q8UtPM5qC4Ol5yHChVuDsA5mA9FzG1p+3BXv6KGN5599G8DKbYEs8ADDJmlpQgLwlqLSy1floeEqhqc/vsGf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9rQZaWNxTGscy77XmY8wLVgpKvWf+JGmrE1tge0of8=;
 b=UDY5TkQ6c0odRhCMaHpqYKTKH5J5E5bAcSdTpJuc46TtSsQPqpmQIy4uihRqcP0B9zRm2f+rRV2+Y+PFBCSNOtDysS0q6DWA/gO1HjHPRh08R9IdHqqVaqfVOq9eMf7fwIXuB5sUVbUbjD/vviGUmfDahsa0UaUhlHDwMguvVTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB8097.namprd12.prod.outlook.com (2603:10b6:510:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 09:52:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Thu, 26 Jan 2023
 09:52:43 +0000
Message-ID: <15b56780-5d10-4d4b-9915-017650e6b22d@amd.com>
Date: Thu, 26 Jan 2023 10:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/4] drm/amdgpu: Movie the amdgpu_gtt_mgr start and
 size from pages to bytes
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
 <20230125152006.3945-3-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125152006.3945-3-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b291d0-6bcd-4a8d-9638-08daff8311c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9WWg5IhznRnFfFYckTZ7cyV+xfcxGPkF8f6wWFUflN2L56J+MSLcB+PwuyMv2BeXFDjJ+Dzvq0yZ1ron/NAsoPecTuP8ktNXMJ10rPOmclLPlt60+zSJcd5uW37omJcRNICwfW2qZIbZjKGX9UsF0hXWE8PDRNvyTDwDo13shoGLJ8t3wndMA9lHARt/ODTO/cR0PskeCwbuiu6wOKSZdkojP46AMdnBkVRPCnlmFdCHBzRP4YFLlXe9e1j2/y94tZLepr3gg739O2Ms6iHJRR36TdEiCYWLtUzQkRSnWAAVtiKaqdZ7QokBiz5fNifSH2zSBeGuZ3cyqDhke6ai5UYD2DE0LARqU/iWKYLGrSuaqjcScU+KFfxQKNeBqQ9Hrbwv1sPx0QCIBqTDEi12TWwLM67lFPb5fJOUyO2BwitD/1arEE/CfNTADO2dnBOJh1LoNhSCkqUs5EUt296KHhsCtjMy2VOkq8aRW12SI8ef8jDBsZ1JyWPP2iJz6h5OQbECfepHFRxy2uXLB/w5iZIXma+urTOKiICWUASMZcrJS8c+4XV8P2QPCVRo96szCTxOc9xfU9AmGHvi+ebYA8UhzYcFi1/60WVmvXwKmizUWAAwv5xTD9THJ5s38lkuipBJ3EV/RofMeQ7Tb8Y6tl018FBDKi/D6Aq3ucaeb6vhQho1EWXZ7Oqn6Sf3vEuRvVybEogTjk72V5OqJHZ8lLxpMzh1iy/fJynvyWGl/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199018)(6506007)(26005)(6512007)(6666004)(83380400001)(2616005)(316002)(186003)(4326008)(8676002)(478600001)(6486002)(66946007)(38100700002)(86362001)(450100002)(31696002)(5660300002)(36756003)(2906002)(66556008)(66476007)(41300700001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alowZVN5eXVlOFAxTXkvd29ZbTJGRVpzK3N2bjFsT2RIM3JRRzFiWXAzZHpi?=
 =?utf-8?B?K2VucmhBNTBlZE0zeXpPUmtFdWQ5Q3cxd0FyeUlSQTBjUUhmbG16bnRFcmQx?=
 =?utf-8?B?blpjU0JIUXROR1d4blJBaTZlelJFT05yeXdJZnB3TzRtTnI1R1JWa3pMdkl6?=
 =?utf-8?B?MWFjODZ3bDB3K0NSUk9ZcEN4OEg3ZVFUTE1JVEJQK3BzSVppYm9xWWV2ajZl?=
 =?utf-8?B?Q3NTZ0FhR0JQaVB1T1lpcFJWby9zeUJPZS9HSGNZUTZTMzNCQlVsUHB5dmJs?=
 =?utf-8?B?bmo5OGZNVGxRcGd5VUJaOUs5WmRqRzNvcXpFNGU1emloZFYrY1EydVJYNWVm?=
 =?utf-8?B?bjcrUWJiaWY5L29vK2MvQVRXNldWSzUrRFBJQXhVVEtPdWZvMERXa01CQ3dj?=
 =?utf-8?B?K3cwRWlBSzJZTm1EUU15dlRnQUFmM09QajVlaEdzc3hFWldBSkFhT1l2VEVs?=
 =?utf-8?B?Mk81SFV3NHQ0clBPM0ozWXZmNXFCY3c2b1grWVpFVk5uVmIyMUxhaVBsa2RK?=
 =?utf-8?B?TE1WSlhOLzhGaFk5b2RCWXBoSmQvRjVJVW4zT29ONDlvNmJoL2lNVER3Qkl1?=
 =?utf-8?B?c2t0ZlBDOTBZaDBudUFDNndHYm9ZMjNpOWxQRjRsb1k1dHlSZUU0cVlkWnBo?=
 =?utf-8?B?R3p1aTA4czNtZVRTYXIranIycVhNVkJGOFpkd2l4bGNQVklWNFFHSzhCWEoy?=
 =?utf-8?B?MmlseGEyQlo5LzhiRStRc3dXcG9qSlN1Yk9UMzg1S0ZYUEg5Q0owbVVOMU0x?=
 =?utf-8?B?UXdabDJmZDcyaEJPS05uc2NTazhreVdCdmE5c1hqek9iSU1HRGF0OGtVdWtX?=
 =?utf-8?B?anViNDlCMkd4cm9qMTREQXVnaHZ2dDBlL2RTWk54MStOWUVyd3pjblVKeGpj?=
 =?utf-8?B?UUNCOFBsbEhkUzEySE9TOWdOY1YwYUNCOFB4TWpQY1JLSktmRVY5Rk5pRnFl?=
 =?utf-8?B?ZUFBSC96RENpeDlLVmduWTAwdGxvSFpwbjk1bnVhclJLbjdCYXhaLzBMeVMw?=
 =?utf-8?B?YjdHaUNINUNJWjNKdmpETko1dVFmUlgxd3JiNkdkQU5zVytOcnVDNDB4VVlu?=
 =?utf-8?B?anVNUEg5U2MxWkozUjRwRVpySDdHTzc2eVIzMWg0M3VjdXJSWTlvdnpMTzcz?=
 =?utf-8?B?YVJmMVFiSTNDaFpEQnFFcWl2ckcvNlRweVB2M2xjWkp1d21tL3dFeVlxZkRM?=
 =?utf-8?B?UTdOVGRzT0dGL2xSanVXMmZHbTJrK01sZmYwanhseGJkaFFRVnk1Q0hkVmRp?=
 =?utf-8?B?VDZ0cENwMW41ZjVKME9tem91VEhlVm9VMW8zeHVoaDE2K1AwV0ZjUWlhVnBO?=
 =?utf-8?B?L3hadHNUSjhUcUwzZEVpSkh3Q2hQbkFsWEp3TStxRTdOZWpGZm96NWZiN004?=
 =?utf-8?B?NndUWkx1bndPSDM4NnF0OUZONWZPTnZmU0RKa2UyMXlEV1BNdW9QYkQ0cVdR?=
 =?utf-8?B?VzIwUUVGV2VtSDNOQldYVktNUFB2NXNrdmFBK0s3UEt4bnhYdjBJTU5HR2ty?=
 =?utf-8?B?UmMzWU01TXI4bVByc2hEWS9xVU9uMnRXSk92TFM3Q3R2NElwWjloaUprUVJL?=
 =?utf-8?B?K28vaGJ6RytSYkNZdmtJbHZtdXhUeHp3bjdsZTI0VURCSG91U2JzSkR2Wit5?=
 =?utf-8?B?L1VEa1dHclRib2pHaEpWcXRmSlJDVUk1Lzl1QnMwZ01PK0VqaVladXdhelZE?=
 =?utf-8?B?bElmdlI5eTlhbnFtbVk5enlmZGpYR2JocUdJVXNNZzdrVVJxVm9acERjVGtZ?=
 =?utf-8?B?bHhsd24wMXlrR2RYUlNDVFpuNzQyTjNtcmpnNUl4Ly9QeFJSaGY2M29vTWxs?=
 =?utf-8?B?TXhmS2xITUNrNDZOWXRzaFNLNWxQaDdwbUY4S28rMU9DZERJOUZRZVVJdUtl?=
 =?utf-8?B?ZlVpUTJraXptNkZnZ3h4SVZSeUV6MktXY243OFFzVE53L0pOSXRNbEh0MU5m?=
 =?utf-8?B?UXVIa0hUaU0zK0N2RnpHYm0wTzRZRWkwVUgvMDB4enBpYVpFcGdXaUFvRGxo?=
 =?utf-8?B?TUl0OEtmRVc0em5DdFRnR3M5Ykh2STIvZTZDRHI1cTBpbk1sckd6cFd6em1j?=
 =?utf-8?B?UDlXclkxckVSNGo1bmdtTFFDaTBNUFVGTXVUKzJOYi9VeWtad3NXNjJ0aEhy?=
 =?utf-8?Q?pcndZwlCRokEuFFFkWTah1Fz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b291d0-6bcd-4a8d-9638-08daff8311c7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 09:52:43.2937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: libqDZkF72K4cwKJ4Mo/WikfvR+ARJGtiWCg5dtUjogKPmmZ87+172SOk/my7r3z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8097
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 16:20 schrieb Somalapuram Amaranath:
> To support GTT manager amdgpu_res_first, amdgpu_res_next
> from pages to bytes and clean up PAGE_SHIFT operation.
> Change the GTT manager init and allocate from pages to bytes
> v1 -> v2: reorder patch sequence
> v3 -> v4: reorder patch sequence

That won't work like this and break the driver because you only have 
halve of the necessary changes inside this patch here.

Please *never ever* again send out incomplete patches like this.

Christian.

>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 13 +++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  8 ++++----
>   2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 44367f03316f..a1fbfc5984d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   			      struct ttm_resource **res)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -	uint32_t num_pages = PFN_UP(tbo->base.size);
>   	struct ttm_range_mgr_node *node;
>   	int r;
>   
> @@ -134,8 +133,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	if (place->lpfn) {
>   		spin_lock(&mgr->lock);
>   		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
> -						num_pages, tbo->page_alignment,
> -						0, place->fpfn, place->lpfn,
> +						tbo->base.size,
> +						tbo->page_alignment << PAGE_SHIFT, 0,
> +						place->fpfn << PAGE_SHIFT,
> +						place->lpfn << PAGE_SHIFT,
>   						DRM_MM_INSERT_BEST);
>   		spin_unlock(&mgr->lock);
>   		if (unlikely(r))
> @@ -144,7 +145,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   		node->base.start = node->mm_nodes[0].start;
>   	} else {
>   		node->mm_nodes[0].start = 0;
> -		node->mm_nodes[0].size = PFN_UP(node->base.size);
> +		node->mm_nodes[0].size = node->base.size;
>   		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>   	}
>   
> @@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   
>   	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>   
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> +	start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
> +	size = adev->gmc.gart_size - start;
>   	drm_mm_init(&mgr->mm, start, size);
>   	spin_lock_init(&mgr->lock);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..5c78f0b09351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   		while (start >= node->size << PAGE_SHIFT)
>   			start -= node++->size << PAGE_SHIFT;
>   
> -		cur->start = (node->start << PAGE_SHIFT) + start;
> -		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->start = node->start + start;
> +		cur->size = min(node->size - start, size);
>   		cur->remaining = size;
>   		cur->node = node;
>   		break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		node = cur->node;
>   
>   		cur->node = ++node;
> -		cur->start = node->start << PAGE_SHIFT;
> -		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		cur->start = node->start;
> +		cur->size = min(node->size, cur->remaining);
>   		break;
>   	default:
>   		return;

