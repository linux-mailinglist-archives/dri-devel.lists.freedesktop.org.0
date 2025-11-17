Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442EAC62F0F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 09:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEC110E2FB;
	Mon, 17 Nov 2025 08:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="12ScVym4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013067.outbound.protection.outlook.com
 [40.93.196.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CE510E2FE;
 Mon, 17 Nov 2025 08:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=km9GnuJPdkDQhFntSc3k6xO6xzscCi6pmtaWZ5+ug+sj//54Z6F88k7rL3FD8t4Wqz6Q/+kYXwQFturZTWuoGyaTmz7WTVHfEYeZR8NOdd/0QLbpANVLByh61EYev/vzMajYoSfn+ar3cDKyJA99P/8/WimjgOGQcO5H1hzgih9RZ1zz8ofLBMEPsho5+n/HfPvRE+WxuIN4SjpYjzpEieFR4mDjuLQRnBnA4vCi/XbEV3FT49aqLjQj08ck0y7bY4qMYgYhGXeB8wSwATsOZ5p1A8nSxCB41HEbGufQwFwyGshgxhIJiAKO5Zbnylxb6zePD5F4xCv7y8Tn3GeyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8vAdFMkSbizKcus0PBw9EQA2+fv7EPC0CsMsDB2mzI=;
 b=I5PDvZZAr6yNzdEpq6RV2Jry5gO4a69oLlPPrvRxmFHpZ6h0VQ3D2oN503NjESFXI9DT9EE+DHM+QczfP31Xx/fgV9lmHpqd+FXLFbF+Uf5/WRtbBZz2JwdRm7BjWgWeesUq05R8HN2LEURW9VJ8p5bgGBLxYsjzt3ebq23qpA7bqllqRRAHk4QsMVUVXcaOWVioyWYHw5mmF9zGYCXIXMSPfZQnf+9mFfEQrMWbpG5aIbMzU5OJuMRHTwDogt/XysZKUj9d6DfzPD1T/0DNlRvXDzVtNwFOjAW3wSe4dq9VNBWue0cjj18xHYfZ0chzNr+8ij/gnJtKAWPv5i9OcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8vAdFMkSbizKcus0PBw9EQA2+fv7EPC0CsMsDB2mzI=;
 b=12ScVym4xjmaH7UhrrJpQFS3OnZVuMw1h1yG1jQENv9QiNg4a1831/vPL7cUkribq+UcOFAzg+sou+9XWtXHN0d3s7CNIqsGoCc3y2YqUcwOJZxVQWwgEWiL69e2ShirNv1ssDvjhE7t+C4zbe/PP88AZ+ZGaBBxIdOW/siCHso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 08:44:36 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 08:44:36 +0000
Message-ID: <ebb52a9a-9454-471b-8262-098231b58777@amd.com>
Date: Mon, 17 Nov 2025 09:44:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] drm/admgpu: handle resv dependencies in
 amdgpu_ttm_map_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-11-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-11-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0576.namprd03.prod.outlook.com
 (2603:10b6:408:10d::11) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: bfce6a71-4f1c-42fd-96f7-08de25b58987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnhnV3BxMXJ6VU1FdWppc0Rmd3Bmbm9oYm5HSlYwaThwVjlYOVcva053elZu?=
 =?utf-8?B?T3FqY0Y3clhqT1dmNC9jSjNITkhKdThyNENJUTVvb1F3VlF1ZkFhaldhWmNI?=
 =?utf-8?B?MHE2MVRQM0JvS3h6d1VZMDByOENQL1NSS0RHZUdaUitSOGNIbmNSSkkxMmJO?=
 =?utf-8?B?M0VhU294VHlsMWpTWFZQSUdQd3g4bkdUT0JlUTIzTEhzSUEySGVUVysvdng0?=
 =?utf-8?B?R0gxbjMycWtobDJTSVFteUwxSEs1SUpxcmwxdGtVTTlqRUY1ZFg1cG9sUllF?=
 =?utf-8?B?c1dTMnVZTXNTbkR1R1JKZTdMNFVhcHhlelRsOVh2aSs1MmZtYWlNRTM2VFA2?=
 =?utf-8?B?MHRCYUd5UkNZSHB3Q3VYSnhYTUdudVlmN1dodldweTRBRlFVSHZUOGQxL3kr?=
 =?utf-8?B?eE9RY3QwTzEzZW15WENVV1dDdjdtU1ZTU0hhdU5LcHgvSzA0RFV4cnpDVXN6?=
 =?utf-8?B?RUo4UG1LUW1kb3dLUGptenYrU3NOWllJeDRRNGZhMi9kakZSU2tSdFluNFhj?=
 =?utf-8?B?VkRUSHhtcFVBOGRQT3dJa1Riclh2c3RjRkxlMFlrbVpKUEJYYnphNGdxVDdP?=
 =?utf-8?B?bExrcnE2TTZ5UVJERUtwUlRMdi9jSkVGZUt1Q0xrT3VnUzJBdjVUdk41c2Vu?=
 =?utf-8?B?SGVqOTFzMEkyYndRcUVYUDYra2ZFa1N6Q2dzblkxYzlkcml5Qnp6U0Nqc1k2?=
 =?utf-8?B?akZYeElGOUZrT0ROWXoyWXBtSWNIbEwvbjhIWWNXZFBEN0xGYjVYR1lmTm1u?=
 =?utf-8?B?U2hHL2k1L1lhbGJ1YWVKYjFacG9sNFV3WGtGT2xHZktvYkxJY0hnRk9RUXM0?=
 =?utf-8?B?OE55emxINXBJdkN3RUJ2UVNvQTIrSUQ2L0dpNmNVaG1scGZuNWlaS2RSVElr?=
 =?utf-8?B?Y2lWVlNkRmxDM01ObmxsWm1HSzhjSDV5Q0puTjlIa2dZaVVXdWI3VXM0Z2dK?=
 =?utf-8?B?NmtzUGZzb0JWYXFPMjhPa1FyMjNJbnVYSTJ5MERXaXh0V090aFEzTUZYUFha?=
 =?utf-8?B?UkhPZlZEVmo2Q2ZwNzVjWlhWaGo2bkRoenczQ2U4bWJ6dnhOYUJnT0htNTZG?=
 =?utf-8?B?N2ZPVDYyeVExWHN0ZlA4RzRiVzBwVFFGRmxsWFJkY29LN0FxTTVsd0ZWdndJ?=
 =?utf-8?B?azBYQ3BIR2JxNG9pZXprU3h4d05STzJsa2xvUGZCZHlZTGlLampPdVBXbkdS?=
 =?utf-8?B?WFp2REE3OFdFclBQZDhNQ1JDaytXanVHdjZTdnBWUk5yL2xhWTdXVVpvbXpp?=
 =?utf-8?B?bzVHLzcwcmVQQytnVk5ZMTdFaFBXN1dOVVgza2xCc3JaWWsvRWNVb0ljN0NS?=
 =?utf-8?B?MVpyZXBRblJHdzJod2YxS0VzZkNjN252c3lyOWtiNEs2cCswUVhEbmdpWVBl?=
 =?utf-8?B?WmhzY0pTLzYyRXhQcmNvcWl5RFNjOGpnMXpueldIUWFEa0R6dzRGWXBORVBs?=
 =?utf-8?B?MFZDL3ZHMjdaLzN6cHV0TlNZc0ptMCt5clM3Znhzc1N4QTJIU3lOTXpWZlBy?=
 =?utf-8?B?NWsyWlVMSWdUNjJ0b3BBN3JnYTlFaVFLakJwcExYeDk0R1hDVWpUeDMvK2sz?=
 =?utf-8?B?VEk0aFoxdk9FcFBFbE5rSFpJNFBOTFN1QTRBdFFhcXR0d0dhV0NoS05Lb0VG?=
 =?utf-8?B?TXNZL1R1cnN0OWpUcWhmRDFzVE9JOXhqMnRPMDkwRmFXWjQwODdXU0Rnc2NI?=
 =?utf-8?B?WVM5MFlkUFdTZ3hYQ0xEeGtxaDhlRllzbGh5cGZvRmFsRGlCdUx2U0F1c2E5?=
 =?utf-8?B?emtObSszMFFlSGhRWjQrbGV1eHlWdEs3UzFJNmRZSnd6bnFjZWt4S0dKYXRj?=
 =?utf-8?B?ZXRWMGtQaVEwZjViSlZQY25BMjVnU2xBc3BvOWw1UUZ5ZWRPVnRGS29zcmYx?=
 =?utf-8?B?UlA4L1Y1TGZkeldaN2w0bjA1OUhhdU5ubVlxWmZWR3JKdkwyQzlQa212RTBY?=
 =?utf-8?Q?xrnc6KjCpRb5mxXsMuEXsiNSJTJuaQLu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzB1bExLM25vaFZjMTVkTlRZOHdGZlM5QndzTSs4SjhubUxSM1dWSHcrdG4r?=
 =?utf-8?B?cmFHUVF2S2lFdzViYVRXZTMrZGdhU29JV202QVhoNE9aWUZVSHJ1SndEQlBF?=
 =?utf-8?B?T3FuUUxnMHRVeGFreW5PSWJrU0VoTGlvS3dDSnozU0VHTDlla251ek1RZVFV?=
 =?utf-8?B?dllHRTRDdUp3Z1dEUzRnVHpSbEtoTE9wZHlzN0plclBNUlRWbytYMHc0UUdn?=
 =?utf-8?B?c1NsMVNlL21Xc0dhNFBuSjk5SXJSeDJNNXJtNmtVUm9zVEJIR1dmejRmQVdB?=
 =?utf-8?B?WTJRbEg2anZXSUVzb2pzZDNZdW1PVkVlUmZYbjhCN1NSU1RKOWpmQUluWHlQ?=
 =?utf-8?B?UnRuVUlVWkU3L1p1dVg1MFgrMFFGT0FQK3p5NDY4V2hhVkliUHJSSDlLWW5z?=
 =?utf-8?B?U2dDNW5XV2xQK2FMWHY5RDVZVnYxeXdaZnhLeEhOV2RRZ01xZnBWa0QrL0J2?=
 =?utf-8?B?NFVZTmpISm53Z3lENzkycDlZUnlQT3hOdlErMkxTSkQrVyt3NWV4b2Uxc2hv?=
 =?utf-8?B?RkFaTUIydkUvaUNpNmJhWXA5RHRPdnVSeXVVeWpuTlQvSG9Sallpb25ZOW5y?=
 =?utf-8?B?RUI4RGkyUlNWQ3dhK2hhMlYvYlFoeDV4SnVrRWhMTWplM281dkNzandXV093?=
 =?utf-8?B?M0ZORE9wWkdYNHlFUGF0NVRQQUNlMmN2V1VsVHR0OTFvU2o2SGcreXo4TlRp?=
 =?utf-8?B?azFhUjNtWWNKa3lyNW80aGJCRE0xVlYvUHpacENHRGlrcFcxUW11RG5ZWVdM?=
 =?utf-8?B?SWw5K3BMaC9oSVRNdDZyS0ViNEtKUXIvVUd2L3JFKzNLYXdNd3NTeG1zSE1B?=
 =?utf-8?B?WlIwZEp2WE1nNE50SitRajZzU3ZYejRlTXYyaXlaNmhoOGxJRTZVWVpXVDR2?=
 =?utf-8?B?NkR1UXRhYWVscmpoZEs0ZlJxWUhCMi9iUEFLWnFmeURjNmZVdndONWM4cXkw?=
 =?utf-8?B?d1dFNGNUbTdjQ3Q4NExOU0o4Zk5MQm1Sb3VPeldEVU90eERZbEdBS281eC9q?=
 =?utf-8?B?ZkhsR0l1ZWxvelJUTWNqb1A0SS85ZytySGR1Ti8vTFdZQTg4Rk5DenZEYTJR?=
 =?utf-8?B?Z1p5aTU3TkpyVHhCNStUd2l2SStzc0pJYTdZaFM2TFIxdEpqeDROQWNFV05K?=
 =?utf-8?B?aFI3UWVwNFc4MXFEQm9rTER1MkY4UFZ1WjZKZUp3c0NsQ3BJbVMxY3g3TFFx?=
 =?utf-8?B?YzNNcXZ6Y3U1SEJHM0FIeGlSOC9zL0NjeTVOZ2U4bmxTaTdBMUM5dFd6NHpB?=
 =?utf-8?B?Ri9BUWpaWXNEcWk1T3hKUHBzdkpPcEluQVE4MVRoVGYyZW1BdW5JVW5DTk5o?=
 =?utf-8?B?MTE5ZEhsOEdBcTNQNDRCVDZWbVZ1MllJaUpVeEZCMWhIWE5EMk50RU9va1hV?=
 =?utf-8?B?cUNucFhpdTd5NjNPc2dveWRkSVMzaUdzRDlsdlBWY3BKU1NMWVl6aXFZWTZV?=
 =?utf-8?B?T01qZnR5bHZycHlZM2pnWkRHWitZeEkycnFnSWQzNnY0WnYxU1VFUmJ3WXhK?=
 =?utf-8?B?YzNxT2dFWUZOa1hpeUYxT0VOUUVsc2c0eisyQ3QxQXRlb2QwSlZrVDBVay9k?=
 =?utf-8?B?c24zQVRIOWZvekRsN2RkUE5EbktNZThZZnNkT3BKOGxCOVpyODUwK3dDbkJ4?=
 =?utf-8?B?K1NPUm40Q0xUYk1oMnE3blZyYnI1U3lseWdkVzdrTStmWDhDcnZtSjkwZ1A0?=
 =?utf-8?B?SkZmYmxtWUE1SUJWRzJlK2RXcnpMaUJPMFZCYStBdElWOXUrbnFJSmJ2ZkUx?=
 =?utf-8?B?OFd6OGs5QlpXTHBUTjRtMzRmTjJRbmJLSkhsaGE4UU5Fc2wvODdaM3d5UUtp?=
 =?utf-8?B?NGk5ZGQraXlvSjhGa3BXM2JtdGJndlFvZi83a1g1Ujd0TG5TRFNhZFBXVFlr?=
 =?utf-8?B?Y2RWUk1lVko5dHlpdWwvRGVXNjNRZlVHRks2cUc1V0VkNmtMRXFwN045d2ta?=
 =?utf-8?B?WFVzdjY0UFUwQ2FrdUhwQm9tOGZiTEtnNW1LRTZ0bjhhQmE4VzVmRnhmSnBY?=
 =?utf-8?B?QTBCdVpta3NtM1kyV0Z1ejRLd3JRVzlBODBPVDByVjg5U09BRUx0YlhVaTdi?=
 =?utf-8?B?NWhzTFZnSU9UaG9aY0ppZTZoamwxQUoycXVodjNJMFJzZE50MW1reHJmSE5k?=
 =?utf-8?Q?/I27u3+aWjhW/P8Jyhs69OtEV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfce6a71-4f1c-42fd-96f7-08de25b58987
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:44:36.3727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REEc0vRC9DX43SBmpTvXtungMneCEhewt0sPCr/H9Ie+wQ8BXs9mjnYvXR7z7JiT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> If a resv object is passed, its fences are treated as a dependency
> for the amdgpu_ttm_map_buffer operation.
> 
> This will be used by amdgpu_bo_release_notify through
> amdgpu_fill_buffer.

Why should updating the GART window depend on fences in a resv object?

Regards,
Christian.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index b13f0993dbf1..411997db70eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -184,7 +184,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>  				 struct amdgpu_res_cursor *mm_cur,
>  				 unsigned int window, struct amdgpu_ring *ring,
>  				 bool tmz, uint64_t *size, uint64_t *addr,
> -				 struct dma_fence *dep)
> +				 struct dma_fence *dep,
> +				 struct dma_resv *resv)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned int offset, num_pages, num_dw, num_bytes;
> @@ -239,6 +240,10 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>  	if (dep)
>  		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
>  
> +	if (resv)
> +		drm_sched_job_add_resv_dependencies(&job->base, resv,
> +						    DMA_RESV_USAGE_BOOKKEEP);
> +
>  	src_addr = num_dw * 4;
>  	src_addr += job->ibs[0].gpu_addr;
>  
> @@ -332,14 +337,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  src->bo, src->mem, &src_mm,
>  					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
> -					  NULL);
> +					  NULL, NULL);
>  		if (r)
>  			goto error;
>  
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  dst->bo, dst->mem, &dst_mm,
>  					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
> -					  NULL);
> +					  NULL, NULL);
>  		if (r)
>  			goto error;
>  
> @@ -2451,7 +2456,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &cursor,
>  					  entity->gart_window_id1, ring, false, &size, &addr,
> -					  NULL);
> +					  NULL, NULL);
>  		if (r)
>  			goto err;
>  
> @@ -2506,7 +2511,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  					  &bo->tbo, bo->tbo.resource, &dst,
>  					  entity->gart_window_id1, ring, false,
>  					  &cur_size, &to,
> -					  dependency);
> +					  dependency,
> +					  resv);
>  		if (r)
>  			goto error;
>  

