Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2394843BE2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD8710E9F8;
	Wed, 31 Jan 2024 10:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FE910E9F8;
 Wed, 31 Jan 2024 10:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+rwMFejQQKdB7mzMk6/BOneWiEvA8mkFKY6tT0lRD/nVDc7VOFIVxcCc2Swak5+uXqqhwQHFy/uCvNct0rqeHoZZK5mKd/8uwYZDX41NIWpDlFqImsBwHASBpAIu+NBMV1ZRJ8UQ6hDKW2tbAwJ0+uXBe7g+ERmP572U90WO6v1poP648+qvf3EzyM2ayYnFzKrwF7vLFOM02lMeGnPgMDvqYCuDWgrCBcUXR85rx704x48PVTIP2hOFy9K2oO7yqi/YPidSFkUljQImGwpF/b5KtapWkAuclxfGGd3K82ug3hCLpGWQFXyDO2v8f4eeQzVcHPA7CFjGzyIpuVPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxZAeKyar4lj664e5KVjs76LkhDUhulhWOJciKOLE5Y=;
 b=kT0PS8BGMsYelOay4MBqVvPo4EYUsTEHuU/JyTvjbQW6DkjQB3nnhmctjciUaI3AopqfhOpe39gbTFaZN0DaXnAjS6DjRTJwySNOUcamMC0kFQot4598b+wVLXbbYZUkDXVMdNSmnqzdYk7z5iHLyFORSwqHKoKVw+rwuEV+7k3wxtOG4FOeaJduxu0+75MDE58NNUZekrhobBBN2sQzG0o86NdX1HYHwRQuZ4v6LSGRxpqSwmOK6f50qsISdOZIWFT+1czK6+pIo1pq9oOfkXRjk6wxE4cLjKk7GPX9DGsvXpmpIASLzSrvKlKrDmE+0tc8jss+MY9ZFquBzHtU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxZAeKyar4lj664e5KVjs76LkhDUhulhWOJciKOLE5Y=;
 b=OdS+TdbtakTcpJAscY2fEdSsJ2mBnACEBDu1hfyP0fZMCpQh1Ri18C1zwCPKQs0i9bVsPy5OxChYfmW9I5Mycks95iaRojYL8VRQE8hIobIfqr+BSYXJQObPuNwzpMDL7W7IhsFQQtM4ikrsd48reMdWfAOygmJHed8/RLHgrvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 10:08:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 10:08:04 +0000
Message-ID: <223ce1a9-d0ca-4922-b0a5-030be084afa3@amd.com>
Date: Wed, 31 Jan 2024 11:07:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gem: Fix double resv lock aquire
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20240130223533.25713-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240130223533.25713-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P189CA0066.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 1079b6dd-e8d2-41ee-08b9-08dc2244838d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 675DqIxtWuEcadQbXFho/D6o/yr5r1+/U8S1kHCml9q8mmymW8Tic+fBUC5RpkhhIzOJ6xqEaD9jAdcE4364dmM1yyGeWCuYctEn8pHScosbN62NmYiZGfABW0k5t91PAhjPxuwAKOprEu1cSY7J1XJR4jdr2qox3QOYCBb3K1iIb572TcCa1f5x3+qV/cN3xX90raWeH5DHmg5rd8GeVEYLW98uBpLlUhv3m+JuySPojjNKGyLGcOEjjJxiDYRDZLENYk+Jz85lM94NUH+6G0yWkS4kkGcbqa0q7sfAJjDcqM7htd7Mt2Xh7qZ7tf8qvVUdMD8s5LcDNuNx7OTNFbWwO4+MEtIxRcKzAYBYhciWXEJNR2tY4Hjyxe7orZX3e1x/GvkQMzBv4HeD6tjKvDggS/DWPJf/BHum/eSGf08l42U1JNoy7jkczbipv4m5uHWMhg6tGJ0eUXxStSlV9PgoJmxCv8qEf1bYDYzQMUuhl7X0Ztihb2cwbDUM7BT5wDuFnXtxyklcJPpvqnfzRIW14P+F9vScSzNM40LajryuHdw/SsVqsJC5WbX7tvhkx9Uiir+08gWmJrZO/nxeOhj0Stf7d4MEdehjeyV8PHtFaWSM1eSahpqq0RZf5el6E/oCkkmuT3n0xGMprNpC/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(316002)(6486002)(66946007)(66556008)(66476007)(54906003)(478600001)(6666004)(8936002)(6506007)(6512007)(8676002)(4326008)(5660300002)(26005)(2616005)(7416002)(66574015)(2906002)(83380400001)(31696002)(86362001)(38100700002)(41300700001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHVKVGFZaGFRWlA3WDhCN3dnak96Mjdqc1B2QTM1YnJueVZVcnNzcjlmZTZH?=
 =?utf-8?B?UkJQcVQxRUUweVN5MmNmSktjMGRMeUl5MnY5TWZmNGU1dEJ4ejdPeGc2WDNh?=
 =?utf-8?B?MnQ1QklPbVVwNWtiaHRoQVhzQkJFZG13OEtNU2JoOVBRTjJTMHZSYnI0M2Rw?=
 =?utf-8?B?dnhBcEhQc1B4bFZKRmdQVnkxcmJyVS9wRHQzR2N5eVN0YWhSVHM2eXM2NnE0?=
 =?utf-8?B?YVRHL2hrckVKWVFXdVkvV0tyOTNpaEdQYnhlbEVHM2RIYzIwbUNJcEZIN3hO?=
 =?utf-8?B?Z2xqc2ZIUkg3MkhTNFh3bEFBMktPT1REdTgrRnRRM0cyczhoYitwOW13RDVi?=
 =?utf-8?B?UEtERzFsWW1ITFBNZmVIMXYxc1Y1cUNMdFczaW1SUGVCTUUzbnI1ZytsUjVE?=
 =?utf-8?B?Z1dZUzBoaFhPbzJlRG8vQnVZL3hWb0JVQ1RrTE9JUEdZb29OdVBJT2dJYmRm?=
 =?utf-8?B?ZFcrUEptdWRHT3RVc0cvRHQwYkpucGJsbUc0NVF4UjBsWWxqYU5rVHNyMXNC?=
 =?utf-8?B?NVdpckdpclpPc2RCZTVxMTFmdlFwVUwyNnZ3aXhCRkxvZzIySGNrR2ovdFhi?=
 =?utf-8?B?Ums1V28vRmpHUUNiZ1hFUkM3VG1uRkZkNFZPZXpVdmdkKzZRYUQ1eDR5NnlZ?=
 =?utf-8?B?c3czM042UFk1RWI5STZlb1pPR1Y4RFpsZFpMSm80Z2dIZDEvQUNqZU1nQ0xv?=
 =?utf-8?B?UGRmMkVrTXcyUi9NcW1GaThvRzJPK0NDQzlkUjNGWEhWcU82NkQ1N2luT2pD?=
 =?utf-8?B?RHliWkJZTE1NdkQvVWRhUVRWa3h0NzBzWFN1K0NHL3I5bkhibmFsZGJsNEEx?=
 =?utf-8?B?VXF4SXE2Wm5HWm1POXhjNHA2ekRTTWViNGpWTjhjMFVrblZrVkdjalUvNk55?=
 =?utf-8?B?eC85OW5FWENLMmUzL2MrRm9seXd6UXlpTWU4MStDMzArZlhBall4YW9JeDBP?=
 =?utf-8?B?aHFmRTNKQ0ZlUkNzREFmZFhVbktqMUJ1RVZxdDlQLzdIM0FLaWZDR2V1UFVZ?=
 =?utf-8?B?K1dLVWFuQVVKakVqZUxIS2ZnVHhqK0NwaVIzWk0wMkhlNjF1cHBtSTIrNzdI?=
 =?utf-8?B?U0hQQ2RpUXRhbmdGeFQ1bENUempCQ0l4VlBZZUFxdldGQ1BHelFON1hVSHFW?=
 =?utf-8?B?TlMySE1WTGZkYlhGZVltbWVWcVJSQTFNcUYxenllVUMwVG55S0Z3TzcrM2s1?=
 =?utf-8?B?RHdnSmFpdjQyYW9LdVpyTUgrTGxGWnkyWXlNdzkxMUwrUmZJdW9lZyt0azJD?=
 =?utf-8?B?a0poUDVpUjdNZ1JRQlJGMUQ4K1RHZlJ4T2s3N3U5T0VLZzFDcXhkUFVRaEgz?=
 =?utf-8?B?TUMvZGFiMzFLRGdUNzNqdERScVlCMzk4SElvQ3dFTkRHS1ZhbGJZeU9GejQ0?=
 =?utf-8?B?RHU0M3IrWUpzcWMwdWxURmo1YUJ6OWdMa0VOdHlHWmRvelJ0bUgxQkFrMEQy?=
 =?utf-8?B?Q0VzN2Jqb3cyemh5cWdLdUF3TWVBQURod1VIc0VJS3g2eXpuRDUwYldTdEN1?=
 =?utf-8?B?clRHZ213QXdwOW5BWXBKd0tBNnA1NGplamgxeGRwVHI2WkhJL0tSbkpWYTZs?=
 =?utf-8?B?Vm1CSFZ2RDB0UVFJdjdwM2wvalJOSmxrbVJRZEpSRmxPd09id1d0b3NkdzBC?=
 =?utf-8?B?dmFrUjVjNnJ6RFl2VExDWlVudzRiNHJZN2IwNzRGVjA2Z2NUQlBJaUErQlFN?=
 =?utf-8?B?VVdEb1hRYWpGSDhDMVFYTFlLK1A2ZmV5ODBabk93UVFtOW55RkhYYlJxOWYv?=
 =?utf-8?B?ZGVuM3dRemF2NWJac0FHWFVMbGw4Y0VGd0lJaVFVekZtencrWDQ2a2xKSjda?=
 =?utf-8?B?RWZjVUFld2dQL3U0NXMvRjJlVkFIMW9sK29TNjZlVlYvU1RBM2Z1c3pBZmJo?=
 =?utf-8?B?aDM2WE41V01HLzJ1ajdqeGdGYlF6d25TT0JCT2hTekhSLzYvUEhFTVNPRmMw?=
 =?utf-8?B?cUZDaVJNNkxNbC9YUWRlQkprdkVWSnM5bmhjZ3NTTmlDZDZnY1VzMFhDbDNU?=
 =?utf-8?B?dTVRakV2NDRaTVZwczk5RlNyRzdVUWh6dGFoZTVlNy9QY0J2b0xlVHBpRmw2?=
 =?utf-8?B?YU9iOXF5T0l0Uk02dURVdXYxOHVMRHhmU08yUTVEMnFVUjNsM1V2Z3hCZnlI?=
 =?utf-8?Q?rUec=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1079b6dd-e8d2-41ee-08b9-08dc2244838d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 10:08:04.2585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ydXLyJOfzdp6WV3sm+bF7CI/4ZhjkNMJDbFYDbDDxD8UQNS5PwiiMPwnElK0YKi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4575
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.01.24 um 23:35 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Since commit 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping
> functions"), the resv lock is already held in the prime vmap path, so
> don't try to grab it again.
>
> Fixes: 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping functions")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 5f68e31a3e4e..8a27b57a5bea 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -26,7 +26,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
>   	void *vaddr;
>   
> -	vaddr = msm_gem_get_vaddr(obj);
> +	vaddr = msm_gem_get_vaddr_locked(obj);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   	iosys_map_set_vaddr(map, vaddr);

