Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFDA6EBFE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 09:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0607210E17E;
	Tue, 25 Mar 2025 08:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fgFfVcwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9335210E17E;
 Tue, 25 Mar 2025 08:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOwTGFOnCF5XexSRWBT0/B9P13GRZDXsXe9lqMUVQCY2Nsq3JfGTbhAOqYjASjv5MhDuDhjJPbyJJhfLH3aJLjc2oWAM67/mc8zw0Tu5xFWbFpBpm5gkJOEAPKkq1HdtWtlnPTlQ4DgHZtscakv4Omf2QP0g9mT1zd1dxH/8de19H5W4MMeG5Xtk68ru9AnxNLImbI7wv1j4R872I/qOJUWkK8q7ekNO8layuROrapkx1qM4lvjoJzdKTgSg9eXYhWYBC+CSQzHCX3bAESMFb2rVk3qZdqVpxUrm33aqFWkXLptq5tVcyjSU9Hvye3y2owzlDWiymR6zPIlQgSPIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUGw6GZxIj8eEFaA02epcSL+rNaxHaRV22ZTv/Secho=;
 b=qmzFx/8xSKNuFHm9Mo6IJJsjtRUYUl27kh3DjRb1HRZF7qnCEK6itq/cGDq4Ty/sdNaaINpz2r1NGhLd9H0vIlOAeOyVvRwYXJp1TaylIAx4e4eyAhZWBuiksj8JpZbFhZa6YzXxC0jsoPCCYH9np+55wFGA5rAWy2cLNbcDiBIMC/9G0u4DhUyjJXQka/5qRipq7EfAbGnNue+nX6PH+Gmvr/aR9DoXLBBEJGbiGPPU0TknC1YKylJxzJr5BOkPnNRjQcKexSXYJkXAkLb3d7EXG+ttPDWn6Q90O9a9nLJ4o4uUDcIcdJTlRr6Qyxpz1V5A9TiCEurVsHNdW8NQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUGw6GZxIj8eEFaA02epcSL+rNaxHaRV22ZTv/Secho=;
 b=fgFfVcwfkuRI1LcBhAhfIFP3sRymD48nZyIzwe8xni73eCQIZcFtHMBZrTzyZNfbrEbnDXFPmvbnKP7q99UAiiU2cD6Ay9Me0Ze8BMhxDYfQhOdQSxpX0C4yFq8PhuUFeXQlob2lKt79R+QqeXxeUNkReBIU/dAm9cJ0m9JQfcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 08:55:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Tue, 25 Mar 2025
 08:55:48 +0000
Message-ID: <e8ad8349-84b1-482e-a947-03a78a7c6df0@amd.com>
Date: Tue, 25 Mar 2025 09:55:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: reserve the move fence space first
To: Prike Liang <Prike.Liang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com
References: <20250325064622.1627619-1-Prike.Liang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250325064622.1627619-1-Prike.Liang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0338.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7010a5-e1f2-47d6-9ee5-08dd6b7ad646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDZnaSt6VUNuNk1iMDFmQ3Q2aUo5Um10cExOMmY1OGpGMDFUbEpsSko3Z0Vw?=
 =?utf-8?B?cjUxRm1GUG9GYnlub0tWOUR0TXRkSzY3RXhibFRxYVhUbXlJemtVSWRQTnFR?=
 =?utf-8?B?TGljMnhsTTkyNXA3cGpkWFNkS3YxU3ZKYlZpRmNicUlEWkNhVnNRVmtqZnFh?=
 =?utf-8?B?ZUsxbDJ1UDJTbVNwdXNaQUxtK1VKdlBNT1VDZ0NtdUU4LzF3ZzhiRXNQV1g2?=
 =?utf-8?B?Vm05TzlXbENBTUkrbnFDRFdMbFp2eTVQZGpsZFZudWlQVTdTSm10dkFVd0xa?=
 =?utf-8?B?dDdqTGtLbXVDa2ZHdUw0Q1pLQlhBeXkrTXNFQkJIMy8zc3BCeEZ2Q1YweVNY?=
 =?utf-8?B?QW04aFVkTGlGL0FySlZSRENoR1hZNUdPNURRcWx1b1ErTC82Y1RIQTk5OExU?=
 =?utf-8?B?VVAyLzdEaEh3MnV0QTNvek0veWgvam5GUHUrRjNnc1ZFUDZnY1R0SWhhZTVB?=
 =?utf-8?B?R01PeEN6R0dwN1R0VUhZanBINDFGYSthTVduR0F0Ris2VnJWN0xwZ0RKdzBL?=
 =?utf-8?B?MzErY2dVa3NGTzFOb1Y3VkNGSGJyeVNxT0l0YVlIaVoxV2JVV0VmaGNsMTZm?=
 =?utf-8?B?TUU5Q2l6NDVCanpvT1F4cVdPK0Rlb0c4MDNIU3l1RkJWTTZmVTZ3ekVhY0VK?=
 =?utf-8?B?bkpkK3VXTG1mMm5RRXJ6RkxqeW1GL0RtY0hJTGluRDZBeVZGc0F5NzJ0aDJV?=
 =?utf-8?B?Ums3aFp4ZlVkb2hUclJuemZmQmhhdW1kUTZsenNaL0lHQ2ZoRnU4bUtweW9C?=
 =?utf-8?B?WGV1ZGFWRlBZRTZoTE05eEFwVlNweDZOcFBWeWYrQ1NBc1UzaWpQbUMveVlj?=
 =?utf-8?B?NUlEUC9ucVJ3VWVxTDdGbnZuNW9hTDN4cmNjU1d1L1dFN29aa2puTGMra0ow?=
 =?utf-8?B?Ry9YbHZFRFhlNHdwNFNBQTMyY3NRbXVjazlON1BEd291TlQ0N2lDcnZYeWN1?=
 =?utf-8?B?THlOSGV6dE96V0h4RHhheUdVVHFLWXhlSXR0UllCbnJjL1I1b1RyaHMyckZB?=
 =?utf-8?B?WnJIUnVqakRZVlVYbCtLT2hXcHlaVit0dzhERXd6N0NZZThjMUhkeFF6REdG?=
 =?utf-8?B?aUE0bDBENWE0RlFRNlRHRks2L1Ara0IxOUpDK0VpZThMNWFXVmZTUTBpUVE0?=
 =?utf-8?B?elNhK3FWcVd4ZHc0MzJwcHN6SW96TTNubWFNUUtmL3hTaXBiRTY4Wnl3SlZh?=
 =?utf-8?B?M0Z0emRheGpRVGJkanUyakRFMUgvSHVSSWFCUWI4UFVMZlpac0VPLzBVZ25O?=
 =?utf-8?B?L0JCbU41dXhwaTI3R1RPWW8zWEw0UTNqdlFyZGFwU0xmWEpIVURlN2dyVUlV?=
 =?utf-8?B?S0d5ZlR5NjZwUWRNVTMxYW1BSEdHaldCWTR4SlJQYWtyeEEzc3JEcXo3UTdW?=
 =?utf-8?B?cmFGQ1J5Q0tNMlNNcHRaU2lCMUI5T0RrYlJXZ2o1aVVpT3pBWlRaUTlBU1dR?=
 =?utf-8?B?Vi9ITjh0cVpWMjMzRkhBbEVKenEzZkg1dXpEOHFaNGw5Z1Z0b0srVDdlMnNi?=
 =?utf-8?B?SnVkN1lqS1E3YmJ0Z09qeW82aU4zQmJIWkhJUElINFhQYzZIL3dKbDJDLzc5?=
 =?utf-8?B?cXdRdXRvLzRjWm1OSUF3UDROY3JkSVNzVFRQRmRxM2xEc0J4RlpBM1RNeDVz?=
 =?utf-8?B?SHRXS08yVGMxbWdSdUJpVllOWHZvbGdNRDhwdng1cE93UGYrT2xYbTVxcFZz?=
 =?utf-8?B?aHBZWUJyeHVjbHFhaUR6QkxJdExkM3MvYTUwajNMNWdYM2pidG1DS1NmUjFU?=
 =?utf-8?B?VHdQSlhFN2xyWWsyL3I5YzkzZ0dDWXZ3NE1WMmFpOU5IMEMxZVFJN2ErVU0y?=
 =?utf-8?B?aEFVSUtFMmJXdFp2KzNQbFlWeldxQ0VHSUllbjJlVzcxR1JxK2NmeXVyQzJW?=
 =?utf-8?Q?5xaQ40mweQjlx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a08rdjh2cmNPbGJBazNaMmoxeGZyTU5EdVMyejBEUmJQdWJ3RVY1YStHM0xk?=
 =?utf-8?B?M2hUSlR6b0pLbTh2c0tyUC9CT0xEdUxRNG9uTlpxcnU3bFk5cVFRcFFYTS8r?=
 =?utf-8?B?Vm91QlZGRHN3MWFSU05pdk9ad2RuQ0FFOGdWMGVDeG9TOVd1dndNemZzcVEz?=
 =?utf-8?B?RTB1ODlxWFlzV0dIUmtPWWtpQnorYUhjZ2lSMkFKSmRNY1dqei9aVXFyVDRk?=
 =?utf-8?B?K2JFN0E2Vzh3ejJRb3RGd01tTG1WN2xCOEVBOTFSYy9YdytES1hnbHltNVc2?=
 =?utf-8?B?M21mRUhSdC95UWlUbFFkbEZsSXRvdUQ0MUhOeHd1dXBqRXpJbkJMQWxwQzdr?=
 =?utf-8?B?YXBrK1NHUWUzaE1MUFUvVERWa2tjUnA1a1RqQTVONXpZbnRWNXdXcHQvT0hN?=
 =?utf-8?B?ckJWTU43RDdOYXEyYjFSZFExbkx2dE1qRlBpRUFTTjhFUUNkVU5tV1h6OTM2?=
 =?utf-8?B?Z0tXaENHdnFXMmloeVd5aWRzNzQ3MWhSc1BsbTlydDR6YlllK3p2dnR4NDVU?=
 =?utf-8?B?RE00SXZ6Q1JMMCtHd1BWTEIvSmpkaEpFbHJOVzBIcUkwK3RpUVQ3WmFneG1O?=
 =?utf-8?B?eTUvM1JqSWFVY3hVVnExdnh6YjZ4ZVIrbHBuUVVlRWMzVlc3Rk9zVFljYm9K?=
 =?utf-8?B?SWdCdVZhRWFHbXZ4T0FFNEtObDhkRE53am43TXdydjZzWlNuSExWMjh2UytC?=
 =?utf-8?B?MWxsYmp6eUcxMFVyOUxhL0RxdVgxaEtuamw0V2xwR1ZDN1E4cWNXTnBmUW1t?=
 =?utf-8?B?WjU1ZWd5bXJvMzd6ZjJWNnNRYWIzeXhoL25OTFFybWhDRDQwa2F3WEJLSTNI?=
 =?utf-8?B?amViMFRDNnRaZkNxQ29VNm5ESkIyTUdUUEx4WUVPeC8zSTFUV1NIOVF1cTc4?=
 =?utf-8?B?RDdycVBXUy92NDA4d1labENub1UzUDVCTzNQWVpNV09XU2VjVldVd081U3FW?=
 =?utf-8?B?NnJrS3RwQkc0UGFVOGMxdmwwMVBPa2Fzdk9McmRkK01RY3hCWjZLWExKQlhZ?=
 =?utf-8?B?VU41bzE1K3FDbXdSNTBXU0tMZjliZXhBbHpDUW5TUWdmUSt6Y2ZlRXZERGds?=
 =?utf-8?B?UldhVjRYZ2ROR3FWOUxGVFU5RGlvL2xGM3h5YlZsNzVQS1UwWmtaTzNlMGpG?=
 =?utf-8?B?bUtpczR2T3JSNm1SY3RDT3RCVGRDL2g1L2ZLQTlySGZzQVhobWFoMDZsNEhN?=
 =?utf-8?B?OG4zSVJjWUpteVFZZHZCMGxyM2FkY0tuQ2plbUR3SGJWSWRsTElNOFhIK3Jo?=
 =?utf-8?B?UXhieE9meGg5SmNIV3JHWEh2SEVHQnZyOHdlbU1lNHlLVTlwK21jMTVPY25S?=
 =?utf-8?B?b0ExaTVBUUN4elhWdnRkbTlZVGpaZG92cDJNendMMzdoK2VwMkY2YXJmSHBE?=
 =?utf-8?B?QXhXSmFQRUlzcmd2bk9QWm9nTEVkN1lSQ3cyM1VDSHdsaGVnV0FhdzNzVExo?=
 =?utf-8?B?cmpacUl3K2xOVE1oQ3lJQTdTYkhJTDZqQ2hhRmVSMWZ6Nmw2MzRjZVZnTFVs?=
 =?utf-8?B?MmpMRmFIK1NhYlpRSEpJbFBHbnpwVGV0b2dXcWhXeHJnQ0U2ZDl1KzJSNXU0?=
 =?utf-8?B?OTFHUFFzamRQZTJxSGFTNXNDc0xzZHZYTWVwWDFCSmcvRkNwNVBiZ0EwM0FF?=
 =?utf-8?B?UkFEd3pjZ3loNE1RRVRINkMySTk0ZWRQdWRTU2ViZTIxclJaTm9oWXhjUXlY?=
 =?utf-8?B?YVJiLzN4RVhVejRweEQ2MWNvVUpzUEVwS0lNREsvNjlQRXdjb1psazRmOHd6?=
 =?utf-8?B?dUtJTXlTc1c1VWtGS0dJNDAvSGNsUEpyOVpuTXhOcUEza0dXc0lmRXRiTmxk?=
 =?utf-8?B?c3ZDL1IxQmJDY3FZVk1ya0hkeGU3T2JIelB5TzFWSUFBUG92SEgydXVaR0lz?=
 =?utf-8?B?cjloSitKY2doU2lpcEtvTG1FY21Eak1MeTl3aUdjS2VRQi9DbmpwNlZNS202?=
 =?utf-8?B?dDE3b3Vhck9BVnV4N3g5WWp0QkZ0MUp0dzlJaEcrYUdBTWlHZ1hkUWV2aXFJ?=
 =?utf-8?B?V1N3b1BsLzdZSXRFeXY2UGpneFVYbnBOWUJKMHJzMzh6TDVoSUhZeDBqU0VC?=
 =?utf-8?B?TVNwTHNLWkNBTm02R254ZUhUaHpsZW5NKzg5WTlxNmV4eFF4b25rbW9PeEl0?=
 =?utf-8?Q?YdQJtW7HJQzIo4+eNScjW7u5w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7010a5-e1f2-47d6-9ee5-08dd6b7ad646
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:55:48.4300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IsXK8EoB2POq55xT2k7hZHiQ3nSJM7jrP77cPeNEtDD87OYtx4ei3DM7wSOngNT9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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

Am 25.03.25 um 07:46 schrieb Prike Liang:
> Reserve the move fence space before adding the fence
> to reserve objection.

NAK, the caller is doing this. We are just reserving a new slot for the next move here.

Aborting without noting the fence is illegal and would lead to memory corruption.

Regards,
Christian.

>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f9a84d07dcbc..d5eab0078360 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -646,9 +646,15 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>  		return ret;
>  	}
>  
> +	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +	if (ret) {
> +		pr_err("Resv shared move fence space failed\n");
> +		goto err_resv;
> +	}
> +
>  	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
>  
> -	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> +err_resv:
>  	dma_fence_put(fence);
>  	return ret;
>  }

