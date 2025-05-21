Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2FABF80A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 16:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2C811ADE0;
	Wed, 21 May 2025 14:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tdX5ZaCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0B811AE00
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 14:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqVeSwwwS55EG7kTZfa/6udxfb7SdUDt2wlLUuSQVmCH+viH4IbP2VDykQqbStyyX+j77lo27vTn+YZo7VkAUSFh0am0W7blLQT7pQohbntaQGaG+x3USiYksZbO32j/gzEPpbu7rfFpAjgEECF/mRzYu8pKcrVdwau9ernKY6bxhuWwFJwQUuexHtLWzhYwCfE79P6NafRa/KJnSPqfuxx0iB8ZfWYX4fvuP451EMAC+oFPOG8jeTcg42RM1DsVT/nHhwqaagGStSn9T3+USqBg5AB11Q4jFVZO7oD95O69YFN5IcxkYRjEtrwligo9Qe5uIgkO3ZKs+0Oqek9y3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a2j+3XxsZ291q3g2mKBvBc8Zubo3K5AwzYaHpJgKQ4=;
 b=nJjYxUSW/qP6EvUgFM87HF9TPemhuScDTq05WCq3A1Sp5Ga6XsL93tyI2GIx7ISLAZ4VltP/ejqRHW+e9Vbk9w5tt/cTUCZf6L5xz7SexLpxMOn9TuaedQLetvLErv0jljOaW0H2JoGI3mt5i/7BpC/AgbJKjcTQtyRpuCn+rlQfv0F1cQhUO4be4BjhqN8WqPlI1W5lfO/cgoT/QhyNVx12PwIgDOL50xfvaI1xH7ORtQU4PVvybd2R5hyMFMB6cmZ+li32rfuWytdvnAorHDgjjZd5KJTEK7BP8qjT+92iNmqy6llSHlr43ZW7+YWyGGeuBS7299jKEPC9kzQMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a2j+3XxsZ291q3g2mKBvBc8Zubo3K5AwzYaHpJgKQ4=;
 b=tdX5ZaCIzuF8uFaJ+iKro8weLOJ2XKxKo6fO8xjAX0GLIpeqHfk/IVaRA/tPgDBBRpkDF9PR5XlfKqcfJO8tITP13g5HhFKMwC1Up+dF5O5DBC4b+8aCKv6l6MsygsHqigeOoe+fWFxpw0D6jjt5BSZfmDbaCe2oVwuWS3MXPMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 14:42:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 14:42:22 +0000
Message-ID: <28c20e51-208d-4b22-b697-3b24ab4b3f47@amd.com>
Date: Wed, 21 May 2025 16:42:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Add DRM prime interfaces to reassign GEM handle
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org
Cc: tvrtko.ursulin@igalia.com, Felix.Kuehling@amd.com, David.YatSin@amd.com,
 Chris.Freehill@amd.com, dcostantino@meta.com, sruffell@meta.com,
 simona@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de
References: <20250521140649.4058526-1-David.Francis@amd.com>
 <20250521140649.4058526-2-David.Francis@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250521140649.4058526-2-David.Francis@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: b621caa5-397a-4d37-a524-08dd9875b1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2gzWlE1UHA4N0t5WDh2SFBVdVRrdzNHa0dxRGJTUys0OElJdXpUUmc1a2pT?=
 =?utf-8?B?OFZ6NHZTbmEzRVgraFpVZlZ0dDhnckRscld1clA0T1gxK3didEpmOGdPQ2dH?=
 =?utf-8?B?S2ZUdnJRTHhsMmVBTyt3Y3RGZ2NuWlFoUk5pekhDOWsrTlhrMGJpa0RCZUZW?=
 =?utf-8?B?K3k2eHprUWNYR1lJMFI5V3JZeTRqalAwUGpETWFaMFZqR2R1Tm5GTm5SZHJW?=
 =?utf-8?B?L3pXWExPeXRiWlpGemJlTkwrV2RCVmhyekhDVjhoZ0VBTTVIcmkyTTVjVzJC?=
 =?utf-8?B?d1lOQWFEa3d0VXBhemVzRU1FQWVpT0hpY3pPV0JKQzlNZXFnQ21ETmdORlVu?=
 =?utf-8?B?dnJNTVp4Z1NSK0VPTVB2anZWdWlnWkd4YU5OQVlrU2QxdXdSZ2xIeGxuOWZt?=
 =?utf-8?B?WEw1dzYrTVV5MXBGSXZONWVwdDY1b0IyN0lxSGV2TTlKWkJiQ0tPRW5MdnN4?=
 =?utf-8?B?bkdNeHR6eUVlaVc2RkNKYVh4RUYvNEpXZjJUaWlnd0V0OXF3aWNRSXM2VXV4?=
 =?utf-8?B?YkZrd3R3eVNwWUlNVzQrdExscHdrem56WVhSMllzTzdpUUI2NTlTbVIyVmxP?=
 =?utf-8?B?anNNVDR6UVZkRjdFTU05NHVrTWdpTU1pYlV5ZlN3TWhQaDBEWmR6T1FUTEJU?=
 =?utf-8?B?NUJrdk5EMUtmTWNiS2VWSzdtZThiaU9OMlpoNUViekNBWXFoK0lHS0lxWCsr?=
 =?utf-8?B?WmRtYWd1KzJpQTMvQTVCN3Y1TVdpOU5iaUJ2am5rY2t0Z3NiL3hxNE1FdnNV?=
 =?utf-8?B?Ulh0OFdXUHJEVXRVakZ2dWR1eDJrU210ZDVxNmVrZWpIQVUzcmcyQkNIY28r?=
 =?utf-8?B?UExEcEdZaGdJWDU5WC8xeHZwbnhBN1l5VXA0eUI2b3N6aERVZmNoZ0Nhd3VC?=
 =?utf-8?B?T0pma0lmYzhYYTgraStIOGt3M1ZnNEdUb21sS245M2x2Yk1qWmp4V2xuU3Rq?=
 =?utf-8?B?TlcrNHMva1A5OUJiN3E2OTBZVUFIZDVzTWFyakpPcHZJeExLM3p1YlJlbTdU?=
 =?utf-8?B?VnZNU0NZNjdYNXdJNmhiWWVzM2FRRHp0Y3MzRnlJd3ovL0xtZW5FL3NzWWh4?=
 =?utf-8?B?cWVXd0JkdjJUQjJGVWFIektIb1JWSm1DdDEybVJLUGtIa0NoOVNNQ09XK056?=
 =?utf-8?B?QW1uejRiUUxYaFRZckUzTWZic1pnQmsrYnl4Y0syV0R2THp1YkhiMG1COTJB?=
 =?utf-8?B?R3VudHA1OSt2clhNQWdUSFdVM3YwRnRNTE4vb243aGpRMFIzTWtMYVFUeG1l?=
 =?utf-8?B?TzRDNytid3BOaHNnaEJHQTg0SEFTV1hyaWFEbDhLcmlHR3ZSZHVXMVZZTnpT?=
 =?utf-8?B?eXJtYzBsOFQwR0tQM2RDeTFsMjFHVTRQRnJkY3Y5NU8ycmExUW4vRjZmM2pS?=
 =?utf-8?B?cllBaWh5bUZGTE9ENlg0VVRnRWNaQmw3T3FLRGVoYlhnL3ZxSkdPU3NUSTVH?=
 =?utf-8?B?N0hVaDEvZlRXd1VRMlFManZWUFErbHdnR2RCT1lFQ3hIR0ljaFdNU3djNGpi?=
 =?utf-8?B?MmhKZGQvSVZIYTh2anNiMnpERmxZQmVvbEl4Q1ByamZUQUROTEVCbHR2UHM0?=
 =?utf-8?B?UVFWS0dJU201WFU1WmMwdzRvVjhRTW1iODBPdUFqRmNyb2d3bTdQN2UrRWN4?=
 =?utf-8?B?ZENDdGdManUxTm1Bck9FWEVOeE5DdUFaR2UyY3lJbkExajFCdU5iSjNseVdn?=
 =?utf-8?B?b1FBMkVoekthWWxpcllsN3NJVmRWMTFZL3FNWDFCUmh0VE51WW8xVERsWktQ?=
 =?utf-8?B?TDdLajVINS9rNVJiQ0tDczNSUWJoeDdTdjlxRVJQTVg3aUJESkdRcGlXT3hR?=
 =?utf-8?B?UlZ2WllSc2lWSFZyRk5LaCsxeUdNNjdobmVQb1lHVUt3TWthRnVndkU0L2xS?=
 =?utf-8?B?MFJ2RGVmVmNYVFpiMktXTC9RR3ZMRnp6cUpKamQxRXlpYUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdCdjlpTjBoM3lLc0ZteU56NGpkSE9yN3lFM2tEbWpMUUJvcmFiQklPWkdy?=
 =?utf-8?B?Mm5ZaVUydUtub29ybFQzMENETUkyQlhPdVd2WDhvVWQ0YitaMDZMYWw5eDgx?=
 =?utf-8?B?d3ZXZThxTlZmSkRRYzJmbXhIUWV5RnkyVGVFcUtiS3RIWDJFWTB3alhuRFQ5?=
 =?utf-8?B?bjdOV29iZ3RGR2NQU25OZitGMjBIWk5aRDZDTnFoczdhWGwwTXVCcEZya1hp?=
 =?utf-8?B?L1ovbFg5OCtWTWRmTGdickVLbXBjdjNFU2hFYkJBWkRnSSsxN3JsdURKVW8x?=
 =?utf-8?B?ZXlLT0JOSngzVCt1VWk1Tlh4SUlBdXQvaEh5OFYzT3FVclZ4MElVNmNJL2sr?=
 =?utf-8?B?MVZxM3VnL3Riby9VTm8xcHY0U0FMTXFENDhEU3dWUnpwN2xYSEE5ZDB1eXor?=
 =?utf-8?B?SFNsdlVQU2FtcWRJVzl2b3BXY1lRUzhvU0VFTUk5YjdoSU84bi9USkFWNUVo?=
 =?utf-8?B?Mk1veXcrQTNnb0VWSnhUY0sxM3NocGtMU05UK3g5Yi84aDBaU0dseVZIZmpC?=
 =?utf-8?B?SFJqTFUxTkpYaUV1VU92ZkhNdk5zcUxuSUdFZGhiSllMOVd2Wllha25Tc1pm?=
 =?utf-8?B?cTc5WlFqVzZ6eUlqY0tWaWo4ZGhWK3AxSHNzU3U5SHlMd0hKd1Qxem9UaW9r?=
 =?utf-8?B?YWJKQ0VpdTFQaERveTJjZWx0MFNKUCtMNzRQTWZuOVdhSWxmQjgrcXVaTVVU?=
 =?utf-8?B?ZHZtVmJvTWVHRzZFNWNyNzQ4b3FJdUc5azUvbE5wVHZZOU1FWjNXOTJXY1lv?=
 =?utf-8?B?K1lUVzg2L0ZlcUdHYW56dXhXVlF0S1p0VDJtblNhWVlBVE02Q0c2cmZiS3lw?=
 =?utf-8?B?OGl3YUtvZjR6bFo5blJDcmxtaTFUdFZRSy9nem83bENseEdrTWR2V3JEL2Nu?=
 =?utf-8?B?eGtvTnpQZXJSRy9yYUM2c3llQTNBeHRWYm51Y1V0d1kvWGdSWTlPZXp4MkZx?=
 =?utf-8?B?eEtMam1URmxlVHIyMWEwNUhEQVBORVdIOERSSkY0Y2ZCZjN0eHBKM0t6Mm5X?=
 =?utf-8?B?T2RMQmVSK212MkRTaVpLY21RUjAzVmNYUHBxLytnby93V3QvWlBoZ3Nwa0Ru?=
 =?utf-8?B?b0RoV1EzY2k0bGk2REpuK0R3L0lyOWxSOFVNalRLYW94S3c4R1JjaFRNeFlq?=
 =?utf-8?B?eld4VC84WDIrYXl3bmRnQTBpbmFabTI4VDZpV1gwU0l4WnlRWEpKWTJwZmVz?=
 =?utf-8?B?eXBkQlJoU0tmUC81OFdyRjRjd3BXOThHUEErbUQ4bkZqeWM3LzZaY3FHZVNq?=
 =?utf-8?B?QjVySjFzaDB5d28yQWJac0c1VEZid1hiVDlJSk9aL2lraGJqQXNRbXhIcWNS?=
 =?utf-8?B?dmordW9xanhQTUQwZ2t4Rjk2eWVLQXFCME01K1p5WXE3dzdZcmdyV2ZoVDQx?=
 =?utf-8?B?Sy9kNnhWMVVSOTB4dlorSW5JcS9hbkRDc3dWRE83RTl6Wld5WDFpNnpCU3ZK?=
 =?utf-8?B?SEM5MUdkUzZqK3JzS05UZm8vZm9KdXh6U0xEYzRNbXpEbkNiTTFBOUUvQTNZ?=
 =?utf-8?B?MWIwN0FBVjRzMmdDd2ozdDY3ZVZxdy9xaXRIQ3pneVcyc0NxdlZmWkJVVzN6?=
 =?utf-8?B?RzVQUHBZZ215UXA1MW9MSU12dFVMRG1wcFc3czV6K2NNWlVTcHdPWDMxNUVC?=
 =?utf-8?B?eEJvRE1Kb3hkMXdGenBjVWJqMjZmdnN1d3FuWnYwTEY5VHJiVndyS3VTS1ZP?=
 =?utf-8?B?dWwrKzI3dkZxcTdlZ0Zna2NZQzRuTTVQTXhhRU1vdGFCb202ZGZTUkJvOURR?=
 =?utf-8?B?Smp4TmlzMUplc0U1YzJWQk5USDFLSUxtbFpjZERzS3g3R1c5VnlhbnBZS084?=
 =?utf-8?B?RVZpT1hqRkxiWml0Z25ubHR1eTRIYWQyQzM1R3hyYyt1Ym9RVjh1aTc3RWRE?=
 =?utf-8?B?K2FaMW5Ja21rL2I1bnJqdUNxbGRPWG1SbHZ2K2dyd1gxQnI2T1RDMjl0VnZl?=
 =?utf-8?B?KzQvNUtZRjRLV3d1NCtHcWRwTlVLR2RkVEN3Mko2UHc4dUYvQTNGUGU1b1oz?=
 =?utf-8?B?S2xlTGhtcjlIWlBRRW9CWE9JdjFrcGszMTViMzZBUS9XT0w5SkUvYW1aQlhT?=
 =?utf-8?B?MzBDa2VZbVBJNmxOL1E5OFY1L1BMa2JDVnVwa3R0UjlZdzJadFpuTFNJVVlU?=
 =?utf-8?Q?rTjHFZgksF09jRy71yYbo8gLJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b621caa5-397a-4d37-a524-08dd9875b1cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:42:22.1268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Q29AMrV3CoO2H4mw6Qc49Zg3MC0WOgiV80h+K0jWBz4dlkEF9IgV1POen5jm4w/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590
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

On 5/21/25 16:06, David Francis wrote:
> CRIU restore of drm buffer objects requires the ability to create
> or import a buffer object with a specific gem handle.
> 
> Add new drm ioctl DRM_IOCTL_GEM_CHANGE_HANDLE, which takes
> the gem handle of an object and moves that object to a
> specified new gem handle.
> 
> This ioctl needs to call drm_prime_remove_buf_handle,
> but that function acquires the prime lock, which the ioctl
> needs to hold for other purposes.
> 
> Make drm_prime_remove_buf_handle not acquire the prime lock,
> and change its other caller to reflect this.
> 
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/drm_gem.c      | 52 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h |  4 +++
>  drivers/gpu/drm/drm_ioctl.c    |  1 +
>  drivers/gpu/drm/drm_prime.c    |  6 +---
>  include/uapi/drm/drm.h         | 17 +++++++++++
>  5 files changed, 75 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..d388bbb7a9de 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,12 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> +	mutex_lock(&file_priv->prime.lock);
> +
>  	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +
> +	mutex_unlock(&file_priv->prime.lock);
> +
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> @@ -888,6 +893,53 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +/**
> + * drm_gem_open_ioctl - implementation of the GEM_CHANGE_HANDLE ioctl
> + * @dev: drm_device
> + * @data: ioctl data
> + * @file_priv: drm file-private structure
> + *
> + * find the object at the specified gem handle. Remove it from that handle, and assign it
> + * the specified new handle.
> + */
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv)
> +{
> +	struct drm_gem_change_handle *args = data;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	obj = drm_gem_object_lookup(file_priv, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	if (args->handle == args->new_handle)
> +		return 0;
> +
> +	get_dma_buf(obj->dma_buf);

That is unecessary now that the new handle is made valid before the old one is removed.

> +	mutex_lock(&file_priv->prime.lock);
> +	spin_lock(&file_priv->table_lock);
> +
> +	ret = idr_alloc(&file_priv->object_idr, obj, args->new_handle, args->new_handle + 1, GFP_NOWAIT);
> +	if (ret < 0)
> +		goto out_unlock;
> +

> +	ret = drm_prime_add_buf_handle(&file_priv->prime, obj->dma_buf, args->new_handle);

That function allocates memory and so can't easily be called in atomic context. In other words you need to drop the file_priv->table_lock spinlock before calling it.

> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	drm_prime_remove_buf_handle(&file_priv->prime, args->handle);
> +

> +	idr_remove(&file_priv->object_idr, args->handle);

Then re-acquire the spinlock before calling this here.

Regards,
Christian.

> +
> +out_unlock:
> +	spin_unlock(&file_priv->table_lock);
> +	mutex_unlock(&file_priv->prime.lock);
> +	dma_buf_put(obj->dma_buf);
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_gem_open_ioctl - implementation of the GEM_OPEN ioctl
>   * @dev: drm_device
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e9d5cdf7e033 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -85,6 +85,8 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +			     struct dma_buf *dma_buf, uint32_t handle);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				 uint32_t handle);
>  
> @@ -168,6 +170,8 @@ int drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
>  int drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv);
> +int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
> +				struct drm_file *file_priv);
>  int drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_priv);
>  void drm_gem_open(struct drm_device *dev, struct drm_file *file_private);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index f593dc569d31..d8a24875a7ba 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -653,6 +653,7 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CLOSE, drm_gem_close_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_FLINK, drm_gem_flink_ioctl, DRM_AUTH),
>  	DRM_IOCTL_DEF(DRM_IOCTL_GEM_OPEN, drm_gem_open_ioctl, DRM_AUTH),
> +	DRM_IOCTL_DEF(DRM_IOCTL_GEM_CHANGE_HANDLE, drm_gem_change_handle_ioctl, DRM_RENDER_ALLOW),
>  
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GETRESOURCES, drm_mode_getresources, 0),
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..1f2e858e5000 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -93,7 +93,7 @@ struct drm_prime_member {
>  	struct rb_node handle_rb;
>  };
>  
> -static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				    struct dma_buf *dma_buf, uint32_t handle)
>  {
>  	struct drm_prime_member *member;
> @@ -190,8 +190,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  {
>  	struct rb_node *rb;
>  
> -	mutex_lock(&prime_fpriv->lock);
> -
>  	rb = prime_fpriv->handles.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
> @@ -210,8 +208,6 @@ void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  			rb = rb->rb_left;
>  		}
>  	}
> -
> -	mutex_unlock(&prime_fpriv->lock);
>  }
>  
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv)
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 7fba37b94401..84c819c171d2 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -625,6 +625,15 @@ struct drm_gem_open {
>  	__u64 size;
>  };
>  
> +/* DRM_IOCTL_GEM_CHANGE_HANDLE ioctl argument type */
> +struct drm_gem_change_handle {
> +	/** Current handle of object */
> +	__u32 handle;
> +
> +	/** Handle to change that object to */
> +	__u32 new_handle;
> +};
> +
>  /**
>   * DRM_CAP_DUMB_BUFFER
>   *
> @@ -1305,6 +1314,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
>  
> +/**
> + * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
> + *
> + * Some applications (notably CRIU) need objects to have specific gem handles.
> + * This ioctl changes the object at one gem handle to use a new gem handle.
> + */
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.

