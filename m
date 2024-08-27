Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D29961D5D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 06:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D510E2DE;
	Wed, 28 Aug 2024 04:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjGa+T0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69E610E2DE;
 Wed, 28 Aug 2024 04:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoTuoSbobRP9PKiVK9E8Z4CnYBT65cDr1cI3KhY2eYHn4jLa7QNEfWPWD9gYWrK24awX/Dd8wOFJKqYGoxP8Cj5qOIX+cIp1QVtXbV90rijgzPnSBoGzwHENkInAoI3ecSJguTPUd8ZxFFHcRvk3KKpQHlnLCblHevcE2JhFqJL009ci2aEWaPkWj+PZQ2n214WpEfH0lNuz7MgCgcCDHkTz8Jlt5j4LaAZ1oKVo1KY7E+HdK1ThzGlJdFNNHDe5u9mrggTtyavvpNAtY0pNfX+U/qkXUPmBrDVsWo4iDB6CUARGpB5UOQQ1WrsTRndraIPkxIBehTuiwXd31vXWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Cd6T4uYhJMH4Wbw7gTVnPNbV8eQdmd43tnn0ea1YQ=;
 b=fqm9ZmaI9OtzRy5M5n4pXQS4ZVfEiKsp6LFIBo2LWlAvmiHowtMTSlEVnAU7RTHHAHbCeKTmY3vU5Xc9jjKtWjrf4LK3F1b+kJgFbCL9lx1hf9PzO1SCacTUIiV2QFqp2Y2vi7P4cZGrheGZNRGAF/Y9+vpjgWTtT2SqJTjcGcXatg9zeGNMKiQ94vDfyajvv6rR+ma9tQlMpc80uNSYuqrg8WMaGHYqZOUtdEp/qcEShb3t4yiOEJVpWlr5nzQVwpIWEqGudNzZi/DVrDZ8HgVMX6XVFiOLfMrcYw0XwTOtM+S0Q08cp7fnPxDEA9z8pgwZyjfYwNYQcPO//lXibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8Cd6T4uYhJMH4Wbw7gTVnPNbV8eQdmd43tnn0ea1YQ=;
 b=tjGa+T0KC7sICwbWv1IG05yMPrpyM87CI4aWE7Om7QPz2AreAz3eWuS1XLcXtgX6d+tOjHiC5j51052Z/Eq5hedjE99axdQ7J8VUL0cjAR4Ivir+BEIM3MjumsWLx7xVQUV60nXJz3xNNkxjIEjpUQALkKa8UE3S64a8wyprLBTXtc9LSvU1PAJlTzkxqcRryYzNuQPcwo0cChM3bi9RAAcmVwIkSozfdfeFXgYz2vea+Fcyq4I85TFr1uD4MfKhW+eVRuRU6HNtjIL9MebAb4ugQG4HzoSGC82PgSskeHrcE9Z0BMcKtKb2KOfuoXhV4J0LCRgZsxCQTpkw04vNKg==
Received: from CH2PR18CA0022.namprd18.prod.outlook.com (2603:10b6:610:4f::32)
 by SA1PR12MB5640.namprd12.prod.outlook.com (2603:10b6:806:23e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 04:09:05 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::58) by CH2PR18CA0022.outlook.office365.com
 (2603:10b6:610:4f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Wed, 28 Aug 2024 04:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 04:09:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 27 Aug
 2024 21:08:55 -0700
Received: from [172.25.152.239] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 27 Aug
 2024 21:08:53 -0700
Message-ID: <50165dfe-6358-444f-a327-a8dae3f6774f@nvidia.com>
Date: Tue, 27 Aug 2024 10:43:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fix the fwsec sb verification register.
To: Dave Airlie <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>
CC: <nouveau@lists.freedesktop.org>, <dakr@redhat.com>
References: <20240828023720.1596602-1-airlied@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240828023720.1596602-1-airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|SA1PR12MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: 579388a3-1fb1-4872-766a-08dcc7172855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWNqeDdkNW9yZlFpS20zT2l0dXFJNFFXbnZwd0ExK0RZcWt2cTBuRHY1M1lM?=
 =?utf-8?B?YjNnSXBYQ2MzQVZXOERhd3VDYVBKWnByNnAyVGFFTVpGbERRaUZ0S0dlWk41?=
 =?utf-8?B?Qm14YXpLd2hWWktEUzM4Q2dPZ0ViMDNmN3lYUnVRZ2hzWTliQUE3RmtxVzFW?=
 =?utf-8?B?WEdNQUk3UnhGbVdVTGwxa3IxSjIxYmxmdmczamxuQkNvQjJRSHE1UlY4aC84?=
 =?utf-8?B?aFQ0OS9UamRuQVpIaHRZNGVYTWlJdnB0UXpCWEZJREdVSUNwMmR3cmkzaDJp?=
 =?utf-8?B?TzdUcjdma0M2dEZXbHdvcnBCQ2xYNkxIMXdHSG5zRUlsNWxFOG5VYlRkZHMv?=
 =?utf-8?B?bVA5UXc1cmpic2xmZjdKSWRMNDR3LzRFRXVmTDRGai9QREVDa1BNRUVZOGp4?=
 =?utf-8?B?d0kySDB3ZjBaeEp3Q0Jremt3WjJWc2lOaTVPbU9wWE9NM3ZvS0p2Qm1DRmxO?=
 =?utf-8?B?aTNXbWFzM240NTROYmRoVWlad0RLR3loWG4ra3g0MHllZ0xEUTFKMWg5V3FQ?=
 =?utf-8?B?WXlQNGxhU01XTjEwL1hudlZnRUJHbDd1TkV5bkNpTE1kTzNQVjczS24rcTFy?=
 =?utf-8?B?UTdQS05XVy9sYWQrcFJwSmhvMEpjcXl2VG9VM3dyNVRhNGpkZStQQUxyb0s1?=
 =?utf-8?B?cXJsaWZPd3BoNDJyU01sYURyWWJaYjlCMVltaUVlN2pGajZTeldZbEdrZlJV?=
 =?utf-8?B?OFFlVnVVemd3VlJsOGNzam5YNGJ3cEJMdU9EYUtkOHZ3YktyNCs1RnJHQ1lR?=
 =?utf-8?B?UTVEQnl0WTZSUEtnS1A5bFJ5UExiMXV6YnRCSTQraU5mZVh4NXRRdGo1SEhl?=
 =?utf-8?B?VE1rZlhxbVZFRHdaeU9uRmpqeEdkaUdIeTVxTDAydGFreThmSTFCdVFlMmhp?=
 =?utf-8?B?V2YzWXRxdjZJTHZFZnFaa2FCQnl4dlRTQ1hkNERaTG1HRkUwZkc4SEgzZ3pk?=
 =?utf-8?B?OW1RcVNHMTd5dzNOd3QwcVVFTytWazBscElwOWtVSCtxTXIrSFFWbEplQUl3?=
 =?utf-8?B?cmJKRVZ3ZEdjS1MzV1JIRWlXVjVmaEUzS3h5UEk2QS9DS29MWTdnRW5LUG4v?=
 =?utf-8?B?aENEL1ZFdWZCK1VnN1Z3SHkxOVdvNE0xV2FOVHJhdk9DN3FPTDB5WXV5VHRl?=
 =?utf-8?B?MXdkNnhqTitWQzJycVVHaEFQcGdwNlVTaG12L0d4OHdGbC8zOW9WRE9lNE54?=
 =?utf-8?B?NTlvT2FiRXQ4UHRjNjRGUHkrZnJWeE1aRzd6SGJWdWZvWTVpOXI3aWxTYlJP?=
 =?utf-8?B?L0VENU9YTFBtN09EL3ErV0o2bGErMm5lMWdSWlhrZDdjTjluWjR2enVhNmlK?=
 =?utf-8?B?QjRjQTY5UjF5UmRuR1YxSDRFNmh5azlNRUtmenJKWFcxc2Roc05ramthS2ZB?=
 =?utf-8?B?RGViZVgrN2E2SzdRZDBTcnFCblFRNWk4WVp1SjlGR3lsTnlNY3NFL1dMcUlH?=
 =?utf-8?B?eFIxSm0xTTEvOUVXd3IybVZOQnVVMmdHVTBjaGEwNVI0UXd0bFhxUWhubkRu?=
 =?utf-8?B?Rmhrck5FV2xuNHIxMWFkbUlPRnA3OUxYcVQ4cjAyY0tya1kyblZyVndUUVZ0?=
 =?utf-8?B?NDRxdTQ5SnN1ajY1dlJhc016anE5V2xxRy9kSzZQcUhtcElVMkFTSjBjS0dx?=
 =?utf-8?B?WW8wTS8xN1RGQmFhTWNDZWhCTDcwRUdoM0tRZWx3SlFyVWM0L1F6cW4xWS85?=
 =?utf-8?B?bVFlcFp2QmpjbTNqVDNSM1lsZ1YzS1hxMVJqazA5cjNORHRIWVlrd3RLVlV3?=
 =?utf-8?B?ZzZRRFVseU5mYzFjMmdzeCtSYXN3VkE2UUZJL2lNRnhMVUhtNjY2eTlObTV5?=
 =?utf-8?B?VXhpaW8rREJpdFhldzNLU1IzdFJLbElFUXZjbnZ0VENFTTFTdEhqTEZoV2Nt?=
 =?utf-8?B?ekhyWTJJQWlHT2NiOUZwMjRJRHBGUkc4VU1uazZKWVBIZ1U3cGxybERsZU1S?=
 =?utf-8?Q?xxcmDVQZvlQCxcnJBW8XWEj0Drl12vO4?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 04:09:05.2913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 579388a3-1fb1-4872-766a-08dcc7172855
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5640
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

On 28/8/24 12:37, Dave Airlie wrote:

> From: Dave Airlie <airlied@redhat.com>
>
> This aligns with what open gpu does, the 0x15 hex is just to trick you.
>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> index 330d72b1a4af..52412965fac1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> @@ -324,7 +324,7 @@ nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
>   		return ret;
>   
>   	/* Verify. */
> -	err = nvkm_rd32(device, 0x001400 + (0xf * 4)) & 0x0000ffff;
> +	err = nvkm_rd32(device, 0x001400 + (0x15 * 4)) & 0x0000ffff;
>   	if (err) {
>   		nvkm_error(subdev, "fwsec-sb: 0x%04x\n", err);
>   		return -EIO;
