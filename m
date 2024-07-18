Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6639370A9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 00:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6A10E1FF;
	Thu, 18 Jul 2024 22:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZjvJV8mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21D910E1FF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 22:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYoa5aBI+rrLVPt9T9Y36UXq4AnG9D8g7Ft/F6KLZ5k9VSWEi1s1acQW7aV5FNKWtc2LXgQ5OdUjw3ZtlvWmw5zxijgTyRpGL2ICDPj+Uf1e7GZsaG7wcK0fbyHK0gtLK265ZD6BHDsqiRJUJ3WtRikm/jJZa7pBvGYmf0/CcdFu8JhmtC3yuqTj+hOqF2oc7i4XWDgUi0vxwNWZQA1xd90ZsqiKTqUcZxDVZJ/fiGZCNi4bowaPPU5XoSz1nwJ4/Vv++ci/koWNRDKrLPowFQL1UEMCqFDZw5AuP0SZxYQRDvmfne8xsXV1tEZJZnaEMIGv063GfxHnmZPZQjtHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB+3yUyy6Vd7aXQq4qBcdEgTPT1bUneD0tNs2bao9vM=;
 b=Q/RPNNkATb9XfdMR73WIy+wOTmB4Tk2Uoyyr+o8oAZ+07v/jrRYQ3Mn3t+PCZCP1meymE8xGJbz3DVxuaQl4bH+yoISUeDcWoYHXf8x2zR5wstRz/LKFJ6mqbtI0kzF3ybjm2Tbnlsdp5K8nA/nZ2k5Fguq1gW/fyu2EoHEQbtIrriPFVcMNp8sPyH3Kr29SPXjsL2ROCxOAilua6no232W5U8zdoZlC54Nq08jaXfx7u1fBS7PxJsZRF9XpdCrlzh4mKyO6HV+DFDuJOu27+G9M4rPsULHZAWbb/np+Px7yLQEVMQJtKohvIk5PwYt55NUo4HmLObyZGQ6MiF33bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB+3yUyy6Vd7aXQq4qBcdEgTPT1bUneD0tNs2bao9vM=;
 b=ZjvJV8mxTYLVm56cwd08qEEqbxOYOIrBOveWZ0bRdhBvKtqG7/Xvp5aJdHXC5r41BORMV9HDkkAokHccFiEK0B5yzae002gVFnzK79U1px7Hy8gc3JWLzYk4ACoZ5MFyjhultVeR9pXSGQ8IIQEaRmMrK7ef3FwHLlRcoD3zrq2wCbznZr2WnyXUgldyWhL0zl8E/aNeNOGwHUQyd1u84JfXmNKqryVqmrhYFKO8HHE/Ju+WnDNAbYORAkMO/LkQjsUrtj8SWpciNa/3w83HhugUNlfDSSF4vV3AS6B/yB3UvpAhaNBqDfWjWUworbzVhlMs4l0WTnTbN5kD9cHVNA==
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.17; Thu, 18 Jul 2024 22:32:40 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::1) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 18 Jul 2024 22:32:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.5 via Frontend Transport; Thu, 18 Jul 2024 22:32:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 15:32:28 -0700
Received: from [172.28.173.68] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 18 Jul
 2024 15:32:28 -0700
Message-ID: <eeceb079-2397-447a-9217-64ba01e21b0f@nvidia.com>
Date: Thu, 18 Jul 2024 15:53:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Nouveau fixes for TTM refcount rework
To: <dri-devel@lists.freedesktop.org>
References: <20240718165959.3983-1-dakr@kernel.org>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240718165959.3983-1-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: e6053bce-f9a7-4e30-8a9f-08dca7798870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VndPNjMwUEQ3MzZoOTM3Q2lLUnl1QjNwRkZGNkU5RklNcEtxb2ttdHJKRnNU?=
 =?utf-8?B?K2d1dkVrcEczVlh2bStSOEorTXJ3VWREdUcxR0NRWTlEbXdPZ01tbHF6MWlr?=
 =?utf-8?B?V2R5WDZGWmRhZm13Y3k1N0QyYnRscWJha1dGZ3JxMTZ1M2ZpTDB2a1Fnbndx?=
 =?utf-8?B?aXgxS0FHaHZ2ZFVJaS9NV3JQMFNUSGR4Q0MycnFaYThKVlRpSFpqbWFqYWZ3?=
 =?utf-8?B?bStzaUVxYWtqVXJCY2ZWQlNld24xTWplbnNQWEVtR1dKV2xXMTlKWGlta0Rl?=
 =?utf-8?B?UmlESW1qVERYWEZ2NE9DbjUvRGU5ZWhhckEzYVdJTDk4YnBWT2RoY1dGaDJh?=
 =?utf-8?B?OU4wa2s5NHowaU9OQXkwTjhhN1pNUmZQZExDMllaemQ3dUNteXdnZ0dCTVRL?=
 =?utf-8?B?TVJsOVVYQnd0L1RGSjF1UVRnb2hSTTI3Y1hyTVhpV3ZCTXhHVDVUcWRIUXhT?=
 =?utf-8?B?S2lPWFpNUUJoS291WXNGcWVhd0RjdkdzdlkzZHlVZGk5SDZtVmtkZjNlUTFz?=
 =?utf-8?B?d0FHYUhMZzhoM3pTRVoxaDE4WmZZdXR2RytsUklvaXdlSzdQaldzaVBSTTdM?=
 =?utf-8?B?TnNHNU4wcnlkVzNLR3lYcWZ4bUp0alY5WkJYbXFEaEx6SGtZUXhBRnArbmEz?=
 =?utf-8?B?NWxkSnY4VW9QSXdPbGdQR1FLNG1uRm1kMG1hUGF3VE5ndmlINEZjNjVzSFl6?=
 =?utf-8?B?MEhIQnIxMGJPZ0FhUHNqd01HcWdhT2Q0Z2hCUllLd2RScFZic2pybUVaT1hD?=
 =?utf-8?B?UmozNXNzd0F1L1RlRzhVQ0dLMWRGSFFENUtTanE3Q2hxemc3TTNJenQybVBS?=
 =?utf-8?B?dTNFVllJTitTK2tKWFFscFVWOUJpODBxa2RtV0lhTkNjU1c4cy83L1NFMUN0?=
 =?utf-8?B?aWVBM0RJckRqQ2xmdlAxWGFuK3dTbWRBeWJxMmsxdHE4RVc0YVdlbCtqZy9j?=
 =?utf-8?B?UWlkeHFZb2h6T1pWZlhMalVzak5JSFZsUWpWa3FoNXI5aUhtZ2VoLzB2K3Rr?=
 =?utf-8?B?NHY0QkhYcTFZZk51TVJ6SzY0VjRwZVdLWTBlVGF3NExPaTNVUUFENkc4SnZS?=
 =?utf-8?B?VFdMRjZtcGg1LzZHN01BQWYzQ09oNHM3bXhFZm0rU0RtUm9SWWx2Q2ZpZm9L?=
 =?utf-8?B?QXRHMHkyQ3lweHZjcVlTR0RvenZPeWhQU2FoZ2tCWGNOSWtaRkh0VGlNVUhm?=
 =?utf-8?B?NDBiOHdXL0NGYW9BRUtCdWxpeVJJeVdWZFFjMnV1VjhUcy9BdTRrTGpNUDZy?=
 =?utf-8?B?a3lVamU4Y0E0WTZKendlUlRhVFdiOTRjWWQ0cmlOVldFb0pHN0NoNHBtSEhQ?=
 =?utf-8?B?TnhOMnpNb09la3Z2WnBuMFFxS0E4NjZQMW1NTXdJWTZYSWc2cHZuYjR0amc4?=
 =?utf-8?B?TDBOemUxK2JGSDJ4WlIwcTQwMEsyVGRxS3ArRDZCVW1ROERZUmFHWStOaUZL?=
 =?utf-8?B?MjhTTWVxbUV2RG9QM1pwQ0gwN1grUmxmYzJ6M212K1FuME9qQnV5bWZOeVRr?=
 =?utf-8?B?QzRaOThzT0lId0xtNzBPMklFa3pBN1h2bExGSnpTTW9uTmdYL0tLNU5hU1dr?=
 =?utf-8?B?dmZ4dExweGExMzdIZFRSd1o4NE13YTdkWnpUVXpKSWQ1aDNzMmYrajR3VGxJ?=
 =?utf-8?B?aEJwOXF5QWp0Qm5yaVFmN3hYY2JmSGoxUXBMR1pHdTMwbnY0ZXRkZ2hQV29w?=
 =?utf-8?B?ZWlGWFhxZitQTEtHZVgvc2IxNU5LbWFEczdRM082MUpYNmdSZ2J3OEgzbTBU?=
 =?utf-8?B?Um02bWNhYnBtY1JGMFM0eXAyaHpJNFZiUHBBQStadERuNGdJblpCZU9LRWVR?=
 =?utf-8?B?WW54NCtoRDRXS0t0WkRtZTRQdWJJcExmeFhsZGRKUHpkMGpPc1Y5WnNORmxE?=
 =?utf-8?B?WS9kamJkeHFPc2JyaSs0WUhETVZocU5rVlRXOUt3L3hVSjdNZVMyY0l1SkRM?=
 =?utf-8?Q?Vjv4A/m1tM4LDMYmb0maFOJBnqIPcGKJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 22:32:40.1413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6053bce-f9a7-4e30-8a9f-08dca7798870
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435
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

On 19/7/24 02:58, Danilo Krummrich wrote:

> Hi Christian,
>
> Those three patches should unblock your series to use GEM references instead of
> TTM ones.
>
> @Lyude, Dave: Can you please double check?

Hi Danilo,

These look fine to me, and appear to resolve the issues I see with just 
the refcount series applied.

Ben.


Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>

>
> - Danilo
>
> Danilo Krummrich (3):
>    drm/nouveau: prime: fix refcount underflow
>    drm/nouveau: bo: remove unused functions
>    drm/nouveau: use GEM references instead of TTMs
>
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c | 43 +++++++++++++++------
>   drivers/gpu/drm/nouveau/dispnv50/disp.c |  4 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.h    | 50 ++-----------------------
>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  4 +-
>   drivers/gpu/drm/nouveau/nouveau_prime.c |  3 +-
>   drivers/gpu/drm/nouveau/nv10_fence.c    |  2 +-
>   drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
>   drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
>   drivers/gpu/drm/nouveau/nv84_fence.c    |  4 +-
>   10 files changed, 46 insertions(+), 70 deletions(-)
>
>
> base-commit: 99e0fb8b087120b5a7019f1cff6c5c2b5b925ae5
