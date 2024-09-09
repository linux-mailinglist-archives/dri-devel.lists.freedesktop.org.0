Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA77971940
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 14:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B759610E517;
	Mon,  9 Sep 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vXiOXKr2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17DF10E516;
 Mon,  9 Sep 2024 12:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec8nlcg4r5lLfWzfYPp+egBDxK5xvWyVZqbgshGpsQijpQy2kobzSUlDx/mLPeHrDwvKpgj91ICVUVnvOa6sNvq5GalMwMUSIZLTodx4TfHHVO8VOzZGapLsR7qeXqA0V3j8HixdOpVJUdPG5cUJNqV0V+k4vMy4HqMrwxUJbre/YGGeaIgZKnxOXofqKiLcB+Gnf7XsltZVNgL4JgmiiN/CipNitWrihGUUCo0kY6ftDczyscbi/VjRkAvEH2vnOWKcoT6i11cjaZVhouszV9T+ztgXCHbwiPVPk7nA5G+4l6OTuJ4TouUS7GMOP+xHM36EIRDsY0yb+mDUgRpZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNKwYJcLvaJpShwxIj25W6TjfipQT3ZbF83MK4YylRE=;
 b=wi3nwv1dsuvq6gY/E4RUFUWAKDSZppKmsLOkDcP3pFwW8Ab7tzMlmLNLItPXrPgbK7AD6RuiYpwdxdGcHNPILRbJr/5r/8basqALkyzUOoYLHLxKerLnXI2ikgFF0J4nOwGuQaTtvDV4/6QZucZ/Hiyy6FJuUTUly0cdHIvt1iYNTEFjAX4ub6F39YVmHXETz4J7B/DTcfGSvAVMLKTRZFDgwANMXq3+sRJ3QcFXC1vgICnYwiwAT/5DtohClWmZUhv92JlEt34bzAyyMvicYmPgK8UiWDWRlt2FuhWY1+Lp5XUweZ1BZ1ZN//O/1FHyHe9yoFkTfH/Tl1dEVZQ+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNKwYJcLvaJpShwxIj25W6TjfipQT3ZbF83MK4YylRE=;
 b=vXiOXKr2FF4WVeRxXAiiVRnXgkJjWrWMuayxGiwibnZ6dGHx92WNf9OfTf8ugRF3hxTo8YiltzJsaB65ZqtwKAWyiBOqseiUKr+/P40yCE7CalFHXboA86yQ5PUyZgsfYTK4NiwJynwFjubut/Oj4C3RPHfZHDIjMEaXTx7UGsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Mon, 9 Sep
 2024 12:23:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 12:23:20 +0000
Message-ID: <7f2a3c3d-b6c6-43f5-bd39-28203df28750@amd.com>
Date: Mon, 9 Sep 2024 14:23:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/2] drm/amdgpu: Remove dynamic DRM scheduling priority
 override
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Liu, Leo" <Leo.Liu@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20240906180639.12218-1-tursulin@igalia.com>
 <20240906180639.12218-2-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240906180639.12218-2-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: bd883a49-510c-45f1-55c1-08dcd0ca30eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzdhZG9leGJEZmhPL0EzQmxMdytMK0hKZmQ1SG1TNThQQUNzT2k3NjNQYkxN?=
 =?utf-8?B?Y202YnJEbTJmMDBjTWlJOXpwcGV0d0NGNXJTSC9EYkJYckJmc25mT1FYMzVl?=
 =?utf-8?B?Y2lySy82eU1DSVg0d0gxeEpxbm9MRUd0RlBzVCtFdU1IMm9mNVRGTDVvUkpt?=
 =?utf-8?B?ZE9Uclo3QlBOOGtJd0QvaTIycnZQM0VlQnd6bVA1U1Y2VFR4OFZWdVJ1QmFw?=
 =?utf-8?B?SnV2U3dqT3lHNmlEMlhzSzdvT3hEcXRCUzkvWFlCamRHanBLYkxaMFpxck5E?=
 =?utf-8?B?MXd6RURteFVyUERRY08xM1p0R3VJNnp1dnJMdHJaNEhHOEVRNjZiU1RHT3NC?=
 =?utf-8?B?SUVuL3dlL2RRdmljNWIrb0FuQ2premc5RldDUVlXU1ltd0x2RGdSWnFKMnQx?=
 =?utf-8?B?WXY2eDZObnFxR1VhclFXanR0MHpxUG9HVFNOdU41UitpOEJScmxpblNaWU96?=
 =?utf-8?B?YVAyVUl1UVJLVWE4WkF3eEE5d2hSbVdPUEwxYlBTRW5xVDkvQ0ZCME5Ja1Jr?=
 =?utf-8?B?cmMzU01jTVg3WE9nNzJrUkhRZ2g5L1dMWlU4SnY2SUVGdWRLMmUzbE9HMWcr?=
 =?utf-8?B?OUhvRFY2VDlBTUFlWXl2R0xwTmRFR2VlRnZXN1lOd1JtQUlnUjBEOGFKemcr?=
 =?utf-8?B?UlV4Z2p2Zkl5TGlPeFkrWmttTElnRXZtTHIrd2g5V2U4VGtBeE9seWRyRmVm?=
 =?utf-8?B?NzhlNzZwT0NlZEVDWDkxMzhSYlFISENRcVROQ1VFUnN0d2QwR0o5a3BTVkJs?=
 =?utf-8?B?dEl0S1R0TFMvZDBvUkF2WmRhQ2F5QzVuWnpHdko0Sm5jQXZQRDlvOVMvRXoz?=
 =?utf-8?B?WllOTUxEQWNTbVVwNEJ0TUVvVFZoenU5NGh4QXZYZmpDSURUUCt3NGdpZGR0?=
 =?utf-8?B?d2hhUU52dmJkOHpKN2lrWUpqV2ZYdGtmNVdnWmsyd01MeEoxRTJtQXVYdEFN?=
 =?utf-8?B?QVJVb3dpdU5WZ1dzSXZsYWlwbjVOWDRPWEoxRWkrc1pXQ3BnMkRUYkE5cjNT?=
 =?utf-8?B?TXBZRXc1SXlrUjZMT3BZZmNMM2hZbXp4eUxXalh5aWNkNDBiSko5QXdzMXFa?=
 =?utf-8?B?UzYzbGhJRnAzU29YMEU0bFVmMUxBQzJZUW5tMWNZemY1cTZMb05majhBYVB3?=
 =?utf-8?B?N0NpaWpYbW95ZkVrRXM1cmJaRkZvOG0zVzVya1ZiWmlOdExrSzZBbGFRK2t1?=
 =?utf-8?B?Sll0NWU0ZW8rOXVtU0VuREovdkpSZ0RBYlpvNnpqYW83S2ZuN2pCcGR6cW13?=
 =?utf-8?B?NTZjZ1R0WlVQNi9sY1NjdjdWUE85RFFGdXp2S2VzVjFRTWJnOTN5UlJwUDU5?=
 =?utf-8?B?VkVjcG56eVRkUjkvODMwdVZOWnk3OGlYejVudDF3dGljbzhIZU50QXVieVgz?=
 =?utf-8?B?VGRDeENickpuMlZBTjFlYkZ4OXljRmRpcDBkWGpIR0pyT295djJNc0kwSXpL?=
 =?utf-8?B?VW1oelNzQmdWWHVxOXNPQW1yb25xTXhUUzNXZml5VEdRZnY2NnN0OVF0QUlE?=
 =?utf-8?B?SitHanVIa0JhUE4yalI0N0xRd0N6NXpVcDBsWUhPSFplZ1lCbzhDekNtVDFy?=
 =?utf-8?B?clhEQzlPRmxVVjZXc1krcHlCTnpiYzNXd0R3VmJyTEZiZXZMenlHNm5WdDln?=
 =?utf-8?B?czlFYnhqemNMZFd6ZTV4c0NzaVNWMXFwS1VEMjVjS3VCMjQ5cEE3aHRrZ0Qr?=
 =?utf-8?B?NEZrMWcrSVJZZENkNHNaTmFNaWt3SjFURGpFTXVSSjBGM3A3eW0xQWlHTVJB?=
 =?utf-8?B?aTdUZGF6cmE2SW5HQmt6OWNyNFZDaU9qNUdDK1BlM1JLRDFOdjM5cE92S28y?=
 =?utf-8?B?cVpuVXNjUE13SFA1Z0UzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FPb0VaK0tJNDVpVlZmZnNWZ1owUU11L0h0clVsUzFhSzREbVRuRjJqOWJQ?=
 =?utf-8?B?cmZyYkxlWE9kK1QvSGI4UTlsUE56WjlMaGJPSWpWd2o0Njd6cDZqQ1pyNnlh?=
 =?utf-8?B?VXp6U1BHMUpTeXZRbTFoazZMcXQyM2pSWTBUblhFQWtsQVJBR0ZEOWlybnl1?=
 =?utf-8?B?ZEpqM2ttU3VVMGRvNmFoWWs5UlV2c0lMenl1eG94dWEwMEtOZnE3cDZxOTcv?=
 =?utf-8?B?ZVRWWkU0aEgvTHpTM2hVcGpOc0xaYWd4dDNxTlo5Z1Nob25zYVN6TU9lU1RF?=
 =?utf-8?B?Rk9RclREMkFvamFmeFovbVRvandiOUJUVUdBaEZ2R3N5cDExbmNyaHdYbk14?=
 =?utf-8?B?UDhPak9xUFpKMmVGQ0ZHa3pseklCNXVQdW9MdlY1TVB1KzRyc1gwaU1kTVF5?=
 =?utf-8?B?dEJONnl0QUxhOWU1aTJKTjg0QXRkOEE2MGxaRDhvWmo1UHNWdk5jbHRGTFhD?=
 =?utf-8?B?dGFIZEIvUkNVMXdFblp1QkVpZ3prVG1WV2wrOFp6WnR2SWt1SlUrQVlvRmJI?=
 =?utf-8?B?TmNsb3lBQkJpeXdNMzhiN3o0QUN4SnFSSGM5MXB2L1lRVGtOSFIyQU1tUDhK?=
 =?utf-8?B?UzFDSGFQWlNzbnMrZDhPRjROY1RTUUhrdjkyblo1MzIvdFMvWEF2aXgwdXE0?=
 =?utf-8?B?TGl4TUt6ZnJMNjdPWEdYV05BSmFCQXFKTmFONE9nZ2g3TU1VbHl2SUVwUk11?=
 =?utf-8?B?UnlwdDAySFdueFMySm5MKzdtY3B5enRUMzhBMFZseXVnYlg1Y1BRTFMzQ2VV?=
 =?utf-8?B?SnJpZ3J4QzJManJjR2ozZ3VLQWVJaDNWL0ZnVno2VlVSYVlSM05FL25sNTVT?=
 =?utf-8?B?RDZFVWlmcFZzUkI2UmsvaFljT1ozU0hjK0VYUGI5OGRFMDFCTFIxYllKOXNL?=
 =?utf-8?B?QS9RUzVPODFWMFF1b0h1RzJ0YTh6dysxN0JsOHRDeTBXYThGT08vYUc3Lzk1?=
 =?utf-8?B?NVA5dmFWZ0JobFllLyswOC9zSU15L1NGK3V1MDg4YklDeTc2UzEwamlZbVVy?=
 =?utf-8?B?UStPcHR2TnJuNTQwazE4Q3lpQ1NlWXE1V0tyajFsVUtYRVk0WGhxN210cEor?=
 =?utf-8?B?QTg0WHM1QlFadXlGdXpzQThkRm1SVnVJaThMeGVRU1pSNHNlbW0rVGJDYmZZ?=
 =?utf-8?B?OE5sSEI2OC8xK2JNdUlFbUNVYXRDT0xLZnlOWGUvUWZxWThTVGtESlJodWNQ?=
 =?utf-8?B?V1haM0t6RVg5Z3RFNWlWakw4YWVsTlFEa0gzUVdVd2VFQVpCckhCS1pTYU8r?=
 =?utf-8?B?dFZ5TTBiWmtNb1d3RjJIZFk4TE9hc2hKOGZOczFNQzJNSW1HNFBMWDJYRisy?=
 =?utf-8?B?eTN0NnpSSFI4TDhqczNTK2Z5ZnlqUll1aThaMzFTUmZFdkdscHZtci9FTVNr?=
 =?utf-8?B?YlJuT29iRkJmZ2FXNWU2QWhpd2VlWjk1MmIxY2dNTjdOVXhCZUttQk9EOEVZ?=
 =?utf-8?B?eUlWN1lueWo5M0lMRXVtVllzNDRpL3JzNGlyamluQUF2bjRJcExUWjRjVnMv?=
 =?utf-8?B?Sjkya3lYKzdyV3hyZDB2TmRkaUdHa3NuSFg5bTQ1eFhjMXp1VURibjlzc29a?=
 =?utf-8?B?WUZ0YWtScUpyWFJRV3RpMkVhR1dCNE1TMFQrOFZnUjN0Y0VLYnVHRitxUnUz?=
 =?utf-8?B?UzBuYWY4Q1FoSzBLRHpPcmg0bG1FVkRjOElMV2F6Z0JsdEthNnFJL09BaFRx?=
 =?utf-8?B?aG8yNml2T0NxMkowTnNjbUI3RERxclRpOGI2azhyNnRGWU1Nc1BwZ0VBakp6?=
 =?utf-8?B?L3JQb0dpZG1pdU5Qd1VJb2V0V3hsQ1daNU8wbkFoMkxqRnNGc1VHT3JFQ2ls?=
 =?utf-8?B?MEhTVXhyVnlxM1BXL3RaREs3cDk3YkdhSWVyNjV1L0wwK3FzQjV1cForYVRN?=
 =?utf-8?B?K2kzbWZ4OVVheUJrdjVnRDBNN29SdC9rZi9BVjdYNlBQMkFLUzVZL1VMMFpB?=
 =?utf-8?B?QVowREJnU0hRYklKdDFxWFFzSkpuenJEdENrVVVnWk5XRnhtdGswRmUxYUFp?=
 =?utf-8?B?TVc3NVIwYXllbmJHemF0UTdLZFdtZmwvK05nUVFGZDZDaGluMThOcFdlT2VW?=
 =?utf-8?B?bUtxeFZFbyszSWJVTXgxc0UxUTMrU09nZzdTbkdBN0tWQlZaL3BieExnOUhW?=
 =?utf-8?Q?vHGM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd883a49-510c-45f1-55c1-08dcd0ca30eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 12:23:20.5213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbQLszKQZSY5xOkx3IlX1OoROIdi1EmyT62xBM6eSjb//aojY6VCCEUGB/YygRuj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238
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

Adding Leo as well.

Am 06.09.24 um 20:06 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> According to Christian the dynamic DRM priority override was only
> interesting before the hardware priority (dona via
> drm_sched_entity_modify_sched()) existed. Furthermore, both
> overrides also only work somewhat on paper while in reality they are only
> effective if the entity is idle, which is something userspace is unaware
> of when using the AMDGPU_SCHED_OP_*_PRIORITY_OVERRIDE uapi.
>
> Therefore follow Christian's advice and remove this call completely.

The only potential use case I can come up with would be for multimedia 
engines since we never implemented the hardware priority handling for them.

@Leo do we have any use case relying on that? As far as I know it 
doesn't work for UVD/VCE anyway because those engines can't switch loads 
and for VCN we should probably just implement different hw priorities.

Christian.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index c43d1b6e5d66..2480b3227dad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -820,10 +820,6 @@ static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
>   	struct drm_gpu_scheduler **scheds = NULL;
>   	unsigned num_scheds;
>   
> -	/* set sw priority */
> -	drm_sched_entity_set_priority(&aentity->entity,
> -				      amdgpu_ctx_to_drm_sched_prio(priority));
> -
>   	/* set hw priority */
>   	if (hw_ip == AMDGPU_HW_IP_COMPUTE || hw_ip == AMDGPU_HW_IP_GFX) {
>   		hw_prio = amdgpu_ctx_get_hw_prio(ctx, hw_ip);

