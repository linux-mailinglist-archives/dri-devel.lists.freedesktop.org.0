Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFFAACC163
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16A110E1F7;
	Tue,  3 Jun 2025 07:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s1ha37n4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9F810E041
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9NvBKbncm+XfVQZTQX2NE81DILUA46u6ZMrUp8faJ7/o4hP4I2X4AcbKClECAbGRM48CAU5qDF0W0j8bXA4B00Vo9aeEBYlTe7VmKvw9zywbeR5ttgeKiUzkkXw2n6Vh2gF6c4XqphQT5yTIWvXcUbe03Kfr7HZxuCnTRHYiDq0nDFGrVJ+t68yBgkYqdwNRqh3Ph9tX0YuDLSFfXWMRk82GriWp3mAllT1G+TQsfHfWvnOaRrzBn41hHsCGEpguoC8jIJ1s+VIHx1PtkC10KFlY7QylA6RcvUHmCsEEtZYhNf1SaoLoy23oPPB6pn3sNqPV7a3Dy4Z13yeTBrsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ww4H8haN6+8+CkF1GsjObvnS1+Shgjj48iCMZx7R9k=;
 b=N/0KWTORr6VeXKCogsD1V6g0DqpLYCj5HPlVNTxjnC3IRXGe6NQOTDD+PzMe/ckLaq+vWiciaXV+Fyft+av0NTDBFIrzLHH8wL4XkavJaeaSObJOvDq5pMoJHdfgoEAZe2VmV8CgvBG5guWsjMkU9JJReg2OFtHK4AmqQeHgY3OrUwR4s8GK0s2eH5UQ6ImNzhtKQhd1EiOHIClhKMpu3udRAn/WJOubYVPgAd3QN3PpeH+e+asDqHGeueFxPOM72BhJtjNwh6O7jD04pkNeiM93dGUhrDzASvqPeozsCfbgm9XgpKv3u776H923Ep181aNbcxDCfP4mKMdyIMIvhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ww4H8haN6+8+CkF1GsjObvnS1+Shgjj48iCMZx7R9k=;
 b=s1ha37n4QVF7zpnAikMJfAd7lsZgNVihX2xIU9TqVn3f5wX+kNpmk6ZIMTlbPRacc/zTwwdRy50r1HJH5XMQRMO75RMAMrI9RT/yG/IIhAJON8hH2rPXQvqrsWXpHLOjdrDNTgigEuHobSCfvAjWNUv0wDrpYMYhK53JfEkVhvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7927.namprd12.prod.outlook.com (2603:10b6:8:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 07:47:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 07:47:03 +0000
Message-ID: <92e31f45-1f8c-4081-8865-a2aee7a2935e@amd.com>
Date: Tue, 3 Jun 2025 09:47:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ttm/pool: allow debugfs dumps for numa pools.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20250602204013.1104258-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250602204013.1104258-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR01CA0004.prod.exchangelabs.com (2603:10b6:208:71::17)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab6ca89-90f6-4ebc-381d-08dda272d48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk1wR2ZLMVh3R2xBWFpWYzR1WjVPQW4zZUlNSU0wTGk4UzgzVGNlZUhEOHlC?=
 =?utf-8?B?TTZ6VFFxVU1sdEx2WFR1MWwyQTlScTRtaDVKM2gzeHBudC9QZ3pSN3VjN2xi?=
 =?utf-8?B?UC9LQUIrOWZhT3J6Z2FOL01iUkk3akl2NTludEwrdWxTdDhJKzNYUEZaMzZq?=
 =?utf-8?B?WW5kWjNwWFovVm9DV3NCUEFYM0Fta1ZEeTl2M2NuTHM3VlRrQXBNdHo2SjlB?=
 =?utf-8?B?TXY2SUgreXN5K3J5M1llblIwRmp0SGRGOGM0L1hkK2FETWhlenVMalZUcEV3?=
 =?utf-8?B?OGRrbmlGT054Mlk2aHpuaGZpaU12RkhLbG1YWU9ldjR5RkNoOG5vMStZY0Uv?=
 =?utf-8?B?THlnbDI2RkhLUzdlWkdtV2gzZnlYNjVQeUtqSlVXa1JYWjNjQi8rWjljb1VN?=
 =?utf-8?B?RUFCcVdnVVNteVZxWGFaSHBOazExNk9NaHYraVdISVM2bld0SkRGZElhT1ha?=
 =?utf-8?B?QlhVYU44MEJ4VnhpOEZuTTMwVG9sbTN5VGhmYkEwZWhXdFozbExZaFE1NVVh?=
 =?utf-8?B?NVdzT21mQXcrTDNiN25sQ0VYTmFyM1RBSEFFcUZYK250VFQ0bWVTb3lzMHd4?=
 =?utf-8?B?OWdMT01DUVVidE94WTlJb3ArVTkrOVFYclYvNUFrQ3ZLUnBaQndKWjFKRDRV?=
 =?utf-8?B?aHVtbXdKZWVlaDB3VTg0K3dwcWJna1JrWFppVElLS3d1Rk10cXdqS1BGajl4?=
 =?utf-8?B?dUtvb3JDK1Njc05RVkYvam0vQ0gwY21qY1c0QmF4VmxDYjNhemV4T1B2ZXUv?=
 =?utf-8?B?WUdKMm9LcThiNVkyNk1lZ2ROUFNLVG5jOHAzdTd0MTlzVGdvQ3JRNkdqcXQ3?=
 =?utf-8?B?UVBTYnlnMTlVZXBqY2hvUzBzQ1BRdHg0Ny9xaUE3MDViZlJJbllOakR2YXMx?=
 =?utf-8?B?VVB4aUpCN1NZNWpnOHJtdllVMlBKQWNSKzUxeFI3T3hZNUg4NzZJaHlFTUxM?=
 =?utf-8?B?dFE2bzVhZTEwZCtZT01wZzBBVXplNnVxZXUxQlpXVVdnUFoybFk5MUQ3UVZR?=
 =?utf-8?B?aGx6NmdRTEpJd1BrRERFSzNQTERMb2JRWGt2blRRWFZxalpzSnNlWUo1Yytr?=
 =?utf-8?B?N3RpeWl1SGxuYk1PMnJLSGczZVU2RWx3UDM0OHM1ckg0VXpub1VOSVVwMzlS?=
 =?utf-8?B?S2prakF4QTMzVmNqQkR1aXpIODlVUU03eFdSSk45UWI2L2ZGRFpQUDhudWtQ?=
 =?utf-8?B?ZEZKQlBpczFUaFNNNFQrUGVxbGNFMHVrZWQ5ak4vZTVmNEgxRWZWUW53RC9H?=
 =?utf-8?B?VTlyUFRNb3hzMG5hcGExMGtUUG1wY2d5TUNQN1dBUHpadGU3NnorY0t3cmJ1?=
 =?utf-8?B?UE00RGs4M3NTQklQZ1FMNU9EcEFUQXVHTm5ySEJJNUJJamxNSXgxOVFwWldm?=
 =?utf-8?B?UHJDOStOVVZRQkpCanR0OVlmR0JLMU5QbWNocm50bW0zZ1VGWXJMeUFVbk9T?=
 =?utf-8?B?VXRmb1Fla2dSSFF1NjFQbzROSnhUaTdFSmVPbGp2aWRKc0VaK2dWN3FNM1FJ?=
 =?utf-8?B?NTlRbXRwQnZPZDBjVVBDMzVuVnZCVnkxc1FUUVlNZ3F1cVJzRHZnZDI5TXZj?=
 =?utf-8?B?c1lGTzcrMmxsZlFoNFE3ZW55djc0R3liZGdvRElEMjdOb3BTL1o5ZkE0UEo2?=
 =?utf-8?B?dllDNEtKMjVaOTAyUitlMkVVVWFPSTZzUTR6T01NWmxCN3ZDN2I4dlRKWmJD?=
 =?utf-8?B?dHF4Ylp3MzRPcHUxUmJpTlhBQTZtTWYxT2FNMVAyTkwxRHd5Y2FHdW1ZM0dU?=
 =?utf-8?B?VTd4aEZ3UXN0a090dzNyenN4VDZxZlJkbWs3Nmx4MTZOU3RHUzN1YzIzZGZV?=
 =?utf-8?B?ZVNIMXBtYlV2U1AzK2JHT2hyZDJOY3VhbnhDeWl3RUludmxsL3B2UVdYOGw1?=
 =?utf-8?B?NnhTRUo5WmlnZWFIaDB0TjlkeUc2dFZFU1ErMFlVWnFCL3g0aEhzMUc4bFZ4?=
 =?utf-8?Q?4VM2ISrw+Ic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZscWp3WlNwU0dXTTdHNzJKT040clFHR2dHOGFoaHBZL1RPS3NRNWtUMVBt?=
 =?utf-8?B?YVBBd2prQXQxQm1yYk9ZSHlXRHowK0RiUUZQU0ovRVpyQm13ZWlCZG5uVmdy?=
 =?utf-8?B?Qysvb2pMRjNWV1p4UW1RUFJXM2k1OWZFL3Bla2gzQ2xMVjdDVkRkcTBkTjBM?=
 =?utf-8?B?SDRreWJsYmxyM1NXQWh0SFhMalFZaDQxd3FEL0M5NDN4SlVWVUc1bS9hT3Nq?=
 =?utf-8?B?TDJTcTc1LzZ3a2F3RkZRT0JwMjc1TUdzUXl4elFNN2hoMlNnbGcvNmlEMlhv?=
 =?utf-8?B?cmdCM1VYUm1scS9vOUsveUJFLzBtdVFCK2RCTUJhTXJiVHZMSm9SeVpsbENp?=
 =?utf-8?B?bTB3MUttd0JMZ0trWVc4WVVPYnBWMmV4TXovRmZNWlducUx4TXdaeXpjVFNn?=
 =?utf-8?B?L0MrTGVYTmx1TUU4R0ErcGtNMXJSc1FhWFcxWW5id3A1SU9waGZGdTMzNS9i?=
 =?utf-8?B?Mm8zWnA1OVJWZE42Q0EweDZ4L1FrZlJlajYwMkEvTzRmWnhnVDZKSjQ1SGQy?=
 =?utf-8?B?NHJjTlhKQ0xDRlIwNGJ0cnZFdWdjOGZNbUdKcHdIYUwyUFY5VHpPd0piemx1?=
 =?utf-8?B?RksweXEzam1SaTJDVHJhdEJkY2lBR1V6dXZCSy9BNTVvendsUzFUOEpRUllE?=
 =?utf-8?B?Rld3czZXYjNGMXFxWTVnbjRjcThTNEkzT1pFZmRoaHpIeUE1TkxFMGhsWFNv?=
 =?utf-8?B?VFpjSFlLZGx5WSt2aHdMZlhuejZKcGhEdHVwMUluTjFQWE94Mk0zMnJMRi9t?=
 =?utf-8?B?MVB0dWNGTGVmaVBPb0VDajZiVkF6RUxJZmx6d1hkeWZJT1lxb2NIa2laaURX?=
 =?utf-8?B?WHE4NjZuNnhXQ3hTTUlmRTBYSnNhcGdXRTdhRDl0Z1RXMlF5cGxIMGwrR042?=
 =?utf-8?B?cHU5ZzdUV1Q2Z1FJQ1JvS1ErLzBrbjZuenRVcWZvT0wzNTJuMENnSWZwTHpT?=
 =?utf-8?B?U2pIaDBxVDdQblpkeFBRc0FIR1pYL2pxeEtUeExBaUVtVjZZT0pxUHZucHBs?=
 =?utf-8?B?Wno2TndOK21QVlFiV3N2ZWlMd2NlM0dIYWo3VTR6QTR6NE9KWVRUak94MEY5?=
 =?utf-8?B?WGtlR2o0S2NZN053c243Y016VkxSUk91Ti9yWDZUWHhpVkpudkl1UGt4MXV0?=
 =?utf-8?B?VnlMQTVLa1d2R015ZW42OUpSSnN0SnlGMFo3RVJmcHIvZGZoTUxGZkhaYlRh?=
 =?utf-8?B?YmdnWHZnNmZKY0I2eU9Md2ErbndqTnY3S2tWUFVCVjgxVCt2SmNoRmxkalUw?=
 =?utf-8?B?ckVEdHBOVTExemhmSzIxdzhrRlh4YW5nWGg2a21YWVhHa0FoMVZOdkhaMkFO?=
 =?utf-8?B?MjZaMzQyZnNycHBxVG1yUnVURGpZbGtXQmlYb1lyZDFCd1N2dnlndFVuUVRQ?=
 =?utf-8?B?WHByK1NkdWtoOCtlbWpQck9ZRXJIZUFxeW56ZFNtUmNqVEp6bmxqb2NwTUhq?=
 =?utf-8?B?WTlQeHdrWEVJb0J3T2RWYzdGVWFSejZ3YjJGb01lOHl4NlFSRE1jTUNzd2ZV?=
 =?utf-8?B?SWRIYytkSmVDejRXMFZyMWh6Z1ozVGFwVGpHdjRmRFpTNW01dmtWVERkV1ov?=
 =?utf-8?B?RkVIbFoxSHlXUXR4V0ErNDJuS0lHcUZCeC9WaktqTWliTlp1VnVseE1kRW12?=
 =?utf-8?B?WlQvWUpmSFl5R3RTdStIZjQ3aHJCdFFxQ0dpSVdVTWR1NVNwczBDQndXZ3lu?=
 =?utf-8?B?TE5uL1Q0WExKYW8vemZCUmh6anJ4THpmVlJOOVE5b1ZCOVJMRjBaT0Z6YmE0?=
 =?utf-8?B?dW5WWmRZWmxrRGVBdWhUT3NvSk9TTkgxRmd4QVpDYlBZZC9RZWFSVHRNRWZy?=
 =?utf-8?B?VThSUnhJWm5SQXNEUkRKbkZlWXNTR2EvUXVaNnJMalpCdmh0YmdkeVZaQmhH?=
 =?utf-8?B?VHBOa1V0M3FYWmdUQXpkek9lSTZRRDMyanJOUGE3dEZScmZVMzJMUFVQZkNT?=
 =?utf-8?B?U0hwU0ZERUUyWkRlVUlRSjFlcXRybmlTMVMwaWJtN2Y1UVpXZlQ5OVZ5OFhD?=
 =?utf-8?B?MUVVMWtzZ1FicW9MYzFybTFodXZsSlVYQkFjMFQwN0xqZDkxUU1HcnU0WTVw?=
 =?utf-8?B?UWV6emhaK1RBbkV1SWYyRFNCeW1KUW94WWs5aDJCdDBCaHJLU3lLSEh5eUha?=
 =?utf-8?Q?kL98cTLQivY05kKCpHYckCjXp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab6ca89-90f6-4ebc-381d-08dda272d48d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:47:03.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCyaF0NuzXabpoeKyhz8v5VmwZ6KPg1zjPmnHACe3ujQVsOb1B24CDSkTpnzNVtp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7927
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

On 6/2/25 22:40, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Currently you can't see per-device numa aware pools properly.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Any follow up patch to wire this up in amdgpu?

Regards,
Christian.

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index ccc3b9a13e9e..43b69d061dff 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1253,7 +1253,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  {
>  	unsigned int i;
>  
> -	if (!pool->use_dma_alloc) {
> +	if (!pool->use_dma_alloc && pool->nid == NUMA_NO_NODE) {
>  		seq_puts(m, "unused\n");
>  		return 0;
>  	}
> @@ -1262,7 +1262,12 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>  
>  	spin_lock(&shrinker_lock);
>  	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> -		seq_puts(m, "DMA ");
> +		if (!ttm_pool_select_type(pool, i, 0))
> +			continue;
> +		if (pool->use_dma_alloc)
> +			seq_puts(m, "DMA ");
> +		else
> +			seq_printf(m, "N%d ", pool->nid);
>  		switch (i) {
>  		case ttm_cached:
>  			seq_puts(m, "\t:");

