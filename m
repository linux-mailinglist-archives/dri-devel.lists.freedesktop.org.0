Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07794C31C66
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DA210E61A;
	Tue,  4 Nov 2025 15:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DjuDhDLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6BC10E61A;
 Tue,  4 Nov 2025 15:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWXjeBJCK+KpiSWjdMbA6z35z1t/8VHr1XFpgStAtK/ZjwPwFpAl9F76zBaHp4AnC7536RZYtFB4441TMD49+dmws+XGxkF7zGuxSYkwQO+tm/EidRpi4cohuGeiX+vCZTWMDST2lTmF+t2/zGphu0Nzgrbr2vinh1yxIaNCareHxUTu6/+z1QDqCbC9R94HjCo96YJZS5m7TkaMqtSbwuDQ0IVFPoR0vRmMdbP4Wo0h8YlyoihW+kVDwfYHc75LGaz2fblkwdaVa04FvdYVURK66NI4fblktNrTnpRWHwP396209Uq6IPEBqZqb15tooazEO4bIlTEADH4g6cWaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8NXKi1U9T6agnnVJVrNp8oOKphZFLnQKI2ddp7c39c=;
 b=HQ+WbZ3fGLqZNyJyw5D36j1nyYlftW+5t5VLL9FY++kNi7kKBbtclSyqp+SieGefcWn3LOUZHiQ9Bs91fPKUqSyefuid3dIkl2YYE4Hr+r9zG9qQE2u7QQfvYcHIesvRRI70uLOKuLynzuMmVw28BSTGZo25BtlGQ/5TXUSUtcbqvKjNPgtC3dZTXCUlwH6qJTZsY2VyOs8fusE1QTKy4ltk9h8Nozp94VsLP6icH3ya7az4qZI2jo8zVMPlMlrWdvuEmFBb7Zukr0H1zwVM4uP/+mONDJ3N69ROb89XL8+RVpVwWAoIEPx5DJBLowA1hjS7O5bxh2GL1FlItv8n6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8NXKi1U9T6agnnVJVrNp8oOKphZFLnQKI2ddp7c39c=;
 b=DjuDhDLlXliTaN3qOSK/woLLf0LaMPMzoQbk6B56bXQxNzAOgOfQXhogTXEx7+9fwy6ZFH/AXBA4PABCXBD7yRVBm5ghyI9FYbycwIEmWywa+3LQIWvWzbNaGbeZtUuWZcSzwx3uuKChvvzlRvviCgE5IrdOnh5j8OCloGhqijo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 15:13:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 15:13:52 +0000
Message-ID: <930c474f-f242-4773-8b17-c1092650b092@amd.com>
Date: Tue, 4 Nov 2025 16:13:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/20] drm/amdgpu: introduce amdgpu_ttm_entity
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:408:f9::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: b22d5459-b24f-4c48-5818-08de1bb4c3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vlh3SG1FTHlOUzhLa0pOaVVUMkEzRnJwN2dKYUFROWhoQU9yb1pDRUNXSWhy?=
 =?utf-8?B?OFNFaGxjU1RaSm1JdEwwUTQ5L0srUHhMMEowQVhGR3VCMEdtSU1WYXJJN2tk?=
 =?utf-8?B?aTdFeVlPd2FjOEZuZjlPT2tJOFR1ckhlMDlrWGhzMnJYSXRIZnR4N25DMFhp?=
 =?utf-8?B?NkZzQWZlK0IvUE1SNmxEbjJ2c1JHeTJGM09BSVhQRVFVOHkvSlZDMEg1MGZB?=
 =?utf-8?B?MkMzcjkwUEpJK2dybG9EOHgra2hFcWdDNnZZcm1FRENIdHNvWVZkTE9Na3NJ?=
 =?utf-8?B?L3p6MnFUQjk3dHBKTWlBd0MvamVhR3Bpbnh5dEVXT3ZIeHZpcXY2Tjc0T0Rz?=
 =?utf-8?B?clg0ZDI5cmVKWjBuc0FBaG1mbmFlTE5kZG56UVluOUFSaVo0WWdiSDYwSmt6?=
 =?utf-8?B?SlRuWFJ2Zmk0TDArUFZkck5uaWt0WkoxK2ptaXhJYWJ0SWNaS1JDWjdsLzIz?=
 =?utf-8?B?UHFkMy9IbW0yejZmcFVOTEtNaHlXQTk2L3JRSGFWRmpMOUUzTWN1c3lRc2I5?=
 =?utf-8?B?VHNQdTIvUzR0aHY5cmFZVTI2dmpYQUFrWFpRWmZhRmMrb1Nvc1FDZmJza29q?=
 =?utf-8?B?d1NVcnBJS1FjNW5nWmxFR1EwL0lxUVNyRGNYM01RamZGSVdkMzRTSm1PMWlO?=
 =?utf-8?B?TXpDU3FBbGlRWXo5L3QxdHBoc1ZTTEhTVzNCT2hqMTU1ZGo0QWdUM2Vlc2pQ?=
 =?utf-8?B?amtTYjVlNkt4UGx0UEVhWlNJNmN1S2lpcEpCY0NGU0c1ZTUyRlBCZTRJRmtj?=
 =?utf-8?B?TmhCeW1rN2JTN2dvTHByU0RISU5xbzM4RU1qdlNlRGcxOG4yVlhNS0ozeG1B?=
 =?utf-8?B?dVhlSXFZcEVuTVhOc2cwTXVtNVMyckE5SG9wdmtBbVQrUWxwTHo1V2YwYUpU?=
 =?utf-8?B?M2x2WjJ3NS9tSGZPeFlNd2NyZk1TcFd0NE5NWVN1VjdVUkR2VTZBZGNGUlZN?=
 =?utf-8?B?ZzRjK3drZjYrZnVNcDRGWmZtZ0ZoWEFhc3JRdEpSWjVYMmwzUnVrYlZ5bFh3?=
 =?utf-8?B?QWxuVk5mNVVOVUcrNytidG40bzJWMXB3dkNoamdDbUo2RUIvamZuR0JBR2t6?=
 =?utf-8?B?SnBBRnhVWVpCenlFa1ZEQzd1ZVpaL1o3Z1AwWE56OTNKalFFZHpkRHdrYVc2?=
 =?utf-8?B?VklkcEsvQm52YXBXUGtjS3g0bExyVkNOaXY2bjN5bzE1N2xaaXR0Tm9BT0pk?=
 =?utf-8?B?bHZnYW05SVN0aFExcEpGQlhJMzJKaS9UY0R4U2x3dThFREJMQ2oxSkdaSnd6?=
 =?utf-8?B?bTEzQzZiMzFTbTVneHdDN1A5Z0c3SCt0S1o0K3lLVjhGVkErSDVHL1FuNDFG?=
 =?utf-8?B?VDI3Ymo0L09kUi9qNWJyUnVtMVlSZkFBSVI2c0NIWjRDNG44dVhIZE9URkZH?=
 =?utf-8?B?dnJkbW9YcEo2TnBXdlVsa21HNDZyQmp1Tk9ZUlpUM2pWZTBTWGhuWGUrMUZ4?=
 =?utf-8?B?NFNSMVdmaFJCYUlqeXR0MDNVNWE1eUlOSFkyd0h1NGorK2luVDh0YUwwVHMv?=
 =?utf-8?B?QW9yVmQxUjhjeDFScFI3czR3QUcvdDJXMXVNZmo2Q09KTUtnKzh5WjJnVWZ0?=
 =?utf-8?B?Snl4cXlHVjRNZUgzeU9QUVRERkMvak1vZ0REVFdSK1BmSWZJcURBdktEZDEr?=
 =?utf-8?B?anlITFFOSTNxYUNQYXZFZFkwKzB3Y2FFUVhWMGl1L25sK2V2OEgvcmFiYjR3?=
 =?utf-8?B?c1pDeStKQUE3L2tGUU9tejhxeGx0VkV5ZVkyMEZWZkFZL2wyc052QUdBZXIw?=
 =?utf-8?B?QU44SDVLZVo2UU5QNTVOQ28vdllvUTJWOTdpRDVhMm9Wa0twZ1NoZHpab3Q1?=
 =?utf-8?B?VjkraDBNZ1k2cFNhaGY5Nkp2aFJ4S3hGSm0xR2tnMTZ3ejRZTXMzSjNDcmty?=
 =?utf-8?B?TExGMEN1STNPaVlWMTdSSkk1dXVjekZoSkw5ZjdLOXBWSjF5WUNXNXZia0or?=
 =?utf-8?Q?NCsZIZNNed1V9phVD+DpWyRlmnBzPc02?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c25lSzE2MWRyK2h6ZytxYU5kdDdkc0tJcVBGbmdpSm92Qm5JQ1I0QUxXVzhQ?=
 =?utf-8?B?YnVaWjNnaXJzSkxhL1R2dHpSczFRR2haclJHUVQzSmJ3VkpVc2xVeExtVG1u?=
 =?utf-8?B?VTZ4Y1UrZGNWMHhGZGdsQ1BrVFh5ZzFBZ0w5MzFNMEh2Zko2OGtDZHBEY1VI?=
 =?utf-8?B?TzZJd25SMzNXQlNtS3dlUFBRSVVYUVIzaHFNOHpuVW1WeUFBTFZZc09nZGc4?=
 =?utf-8?B?ZXJhWUszeTZJMlJPa1RmODZKZ2RDVDU1SWNEemQ5VkRjZDRuRmt1RHA4RWRy?=
 =?utf-8?B?THZyUWpSaFgvYnpwRzFyeUtLeGVFaEw4a3FVaklmaDJnbU93TTZJQjRoa1I3?=
 =?utf-8?B?OEowNStJVTFtT05BaVZsRDVXbkg4N3pzRENtTmZKMmNFUVExbVRoVUhBc2JL?=
 =?utf-8?B?aU5IdEZzOWJkYkhPOC9jTEZ3SUdkRVFueGFnUUp3SmhONjlYdUIxZFBxN2JW?=
 =?utf-8?B?NmdkRVNjK01hTTJPSTFqTUg1MlYvTkZsdDQ0RDZlWkRXUlI3c0ZwMjN3R2ZZ?=
 =?utf-8?B?SG5kTlM3T1padkwxcVFNdXdEQllXZ3VmMlVaUzVMYVJzRHRvUkprcUxJbERP?=
 =?utf-8?B?enNyck5IUVRXV3pXaExTYnl5QllCUlZuWUpHczArTE1Ea0tvOUFxeTdheVVC?=
 =?utf-8?B?VVB6ZFo1WTNOZmk1WkFpTjBKNGJDa1BrMzY2VllTdVA2WVl5UFRHSkZzSWpn?=
 =?utf-8?B?ODI1SFZXUU5ieERzZ1ROTnVFOGdhUzNEei9OZU42djJYRm4rNDZScHFXQWNQ?=
 =?utf-8?B?WVp4QnBLclNLbGV5UWdUbWVrRUFBb01Pd1ZUQTF3WStlN1BDNU4yWVA0RHUv?=
 =?utf-8?B?ejdjTlRqYlZqemsySzlEb3JJK3Mwc2lETVB3MjE2Zmw0U25HMkRsVzl3WE9K?=
 =?utf-8?B?T2J3SmkwaVNkYTJ2YVV2NXYyUERXRjQ2c3ZaU2g1Z0JVTm9xNVF1aEs0aldq?=
 =?utf-8?B?V3hFcU9wWS9Wa3dkNHFGN1VDT2ZNYTB2ODF2Z2pwVHg4b25iNDhjTTAzamVL?=
 =?utf-8?B?R2diZHpUajJ6Qm9zUEVUKzJRVGZwRktnOUwyRndzTHFyM2ROeFRZWTVhdGE5?=
 =?utf-8?B?L09BeVVFQTBYR0pCZW80MG05b2g4ek1GTVd4b09MRjRZVFhKcU5PeVppb0tW?=
 =?utf-8?B?cFJyOUNXV0hRam9lb2N2Wmpad1BVMFVmTEZQOEV6WDFzcFpSVHZHWGUvWEtQ?=
 =?utf-8?B?N2x1a1A1dGhTc1FpdUtLbUszbjVreUYwREliT3JlR29BTEl3ODRsT3VpdXc4?=
 =?utf-8?B?YUlFZHZEMk1qcVA5MVlTR1ZsVURkQnNETnkrRmdyZHQrajF2MWlKRmJqaWFM?=
 =?utf-8?B?WG92MzBuRDkzZkFyMVplWTU3NnMvOCtxQlpvaHM0dUpDZElOdEdXak9FczFj?=
 =?utf-8?B?VkVVRHhFMlAzRkY4VVNWMGkzT2xjMysySm9udWVtZEJHcm9ST1Ryd1lBZDlN?=
 =?utf-8?B?enVZY1VNbEdBVURLZXduOHRmSVZlaVBwYXZrWXVZZ0F0UTdhWHB0YmtmRU54?=
 =?utf-8?B?YTdVcFoyYlJ4NHZ6WXFKYmg5RVovK1IrK3BLWUNWaWZrNXlOellaL2RrVE1R?=
 =?utf-8?B?VW96Q0lFUHE5U2lVK0laSjZBbCtlaCtEaThYK3BQKzRua3AwRVlUVFpOUWc0?=
 =?utf-8?B?YW8zOXJTSlBUYjkvV3NvTjI5ZUI3TTVIWkFkQ3ZsYXlwVkIwdTdZY2g2Y1F2?=
 =?utf-8?B?NStlNUxYT3NaVGljZFgwMlRkOEowTndKaHYwUHN4M05odC85TWtMQUhBRGxq?=
 =?utf-8?B?eldSRTJINkw3UUs0dEdpa2lqVTY2M2pzdFJJdmZXbmw3L3EzbDZrblowKzN5?=
 =?utf-8?B?OWw1emw4OUh3bTA2b1h2NVQyQ1prd2loaEpocXpTcGxYdkloNzl5elBuNlgr?=
 =?utf-8?B?S21UZ01lRndieTFQbTREbzhOMEt1NE5ZTnFnTXpGRXFFZnAxOUVrbHZOM0hM?=
 =?utf-8?B?MDhFbmxMdW80YVJKTHU0dFFYaUdKenRwQ0p4Y0QrMXNwbk9YZzRnaVlhdDVk?=
 =?utf-8?B?TjQzbFpCRFpYc0hVNmZ0YUZSYlB0UTNMaEpDYTkzNHJ6OCsxbTNLN1pCUXgr?=
 =?utf-8?B?N2sxNTRIV2c3NklHTXBoVEp3RTdCYldBRFByVXFDWXJoeERtZW5jdi9DdHQ4?=
 =?utf-8?Q?p8tluWGkXfB5nrpFsuXcny6rA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22d5459-b24f-4c48-5818-08de1bb4c3a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:13:52.5089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjrcOcziVgjdR9d1JzFevnnctadW4TAaRkrz8raSJLctx66QQN/a96k2wY5sPoyy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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

On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> No functional change for now, but this struct will have more
> fields added in the next commit.
> 
> Technically the change introduces synchronisation issue, because
> dependencies between successive jobs are not taken care of
> properly. For instance, amdgpu_ttm_clear_buffer uses
> amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which use
> different entities (default_entity then move/clear entity).
> But it's all working as expected, because all entities use the
> same sdma instance for now and default_entity has a higher prio
> so its job always gets scheduler first.
> 
> The next commits will deal with these dependencies correctly.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 30 +++++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 12 ++++++----
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 13 ++++++----
>  4 files changed, 39 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 9dcf51991b5b..8e2d41c9c271 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -687,7 +687,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * itself at least for GART.
>  	 */
>  	mutex_lock(&adev->mman.gtt_window_lock);
> -	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>  				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index fce22712396b..94e909905c64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -224,7 +224,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED, &job,
> @@ -1486,7 +1486,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  		memcpy(adev->mman.sdma_access_ptr, buf, len);
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
>  				     &job,
> @@ -2168,7 +2168,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		ring = adev->mman.buffer_funcs_ring;
>  		sched = &ring->sched;
> -		r = drm_sched_entity_init(&adev->mman.high_pr,
> +		r = drm_sched_entity_init(&adev->mman.default_entity.base,
>  					  DRM_SCHED_PRIORITY_KERNEL, &sched,
>  					  1, NULL);
>  		if (r) {
> @@ -2178,18 +2178,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			return;
>  		}
>  
> -		r = drm_sched_entity_init(&adev->mman.low_pr,
> +		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> +					  DRM_SCHED_PRIORITY_NORMAL, &sched,
> +					  1, NULL);
> +		if (r) {
> +			dev_err(adev->dev,
> +				"Failed setting up TTM BO clear entity (%d)\n",
> +				r);
> +			goto error_free_entity;
> +		}
> +
> +		r = drm_sched_entity_init(&adev->mman.move_entity.base,
>  					  DRM_SCHED_PRIORITY_NORMAL, &sched,
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> +			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
>  	} else {
> -		drm_sched_entity_destroy(&adev->mman.high_pr);
> -		drm_sched_entity_destroy(&adev->mman.low_pr);
> +		drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> +		drm_sched_entity_destroy(&adev->mman.move_entity.base);
>  		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
>  			dma_fence_put(man->pipelined_eviction.fences[i]);
>  			man->pipelined_eviction.fences[i] = NULL;
> @@ -2207,7 +2219,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	return;
>  
>  error_free_entity:
> -	drm_sched_entity_destroy(&adev->mman.high_pr);
> +	drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> @@ -2219,8 +2231,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  {
>  	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
> -	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
> -						    &adev->mman.high_pr;
> +	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
> +						    &adev->mman.move_entity.base;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, pool, job, k_job_id);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 50e40380fe95..f83313bc0afb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
>  	spinlock_t lock;
>  };
>  
> +struct amdgpu_ttm_entity {

Mhm, I think this needs a better name.

Maybe amdgpu_ttm_buffer_entity or something like that.

Apart from that looks good to me.

Christian.

> +	struct drm_sched_entity base;
> +};
> +
>  struct amdgpu_mman {
>  	struct ttm_device		bdev;
>  	struct ttm_pool			*ttm_pools;
> @@ -64,10 +68,10 @@ struct amdgpu_mman {
>  	bool					buffer_funcs_enabled;
>  
>  	struct mutex				gtt_window_lock;
> -	/* High priority scheduler entity for buffer moves */
> -	struct drm_sched_entity			high_pr;
> -	/* Low priority scheduler entity for VRAM clearing */
> -	struct drm_sched_entity			low_pr;
> +
> +	struct amdgpu_ttm_entity default_entity;
> +	struct amdgpu_ttm_entity clear_entity;
> +	struct amdgpu_ttm_entity move_entity;
>  
>  	struct amdgpu_vram_mgr vram_mgr;
>  	struct amdgpu_gtt_mgr gtt_mgr;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 378af0b2aaa9..1d35a89999f7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
>  }
>  
>  static int
> -svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
> +svm_migrate_gart_map(struct amdgpu_ring *ring,
> +		     struct amdgpu_ttm_entity *entity,
> +		     u64 npages,
>  		     dma_addr_t *addr, u64 *gart_addr, u64 flags)
>  {
>  	struct amdgpu_device *adev = ring->adev;
> @@ -63,7 +65,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = npages * 8;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
> +	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED,
> @@ -128,11 +130,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  {
>  	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct amdgpu_ttm_entity *entity;
>  	u64 gart_s, gart_d;
>  	struct dma_fence *next;
>  	u64 size;
>  	int r;
>  
> +	entity = &adev->mman.move_entity;
> +
>  	mutex_lock(&adev->mman.gtt_window_lock);
>  
>  	while (npages) {
> @@ -140,10 +145,10 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  
>  		if (direction == FROM_VRAM_TO_RAM) {
>  			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
> -			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_d, 0);
>  
>  		} else if (direction == FROM_RAM_TO_VRAM) {
> -			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
> +			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_s,
>  						 KFD_IOCTL_SVM_FLAG_GPU_RO);
>  			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
>  		}

