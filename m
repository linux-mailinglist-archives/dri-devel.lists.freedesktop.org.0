Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D965D3A82E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7B610E294;
	Mon, 19 Jan 2026 12:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s+uVo0uk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4235D10E07A;
 Mon, 19 Jan 2026 12:13:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K448iUGpZvKk51QY/s+FKgY7kVIXNlM8Cc+hL6HN+pzjrNSeHYH2sveLhiYjJlx29eUOkRGYCZZgVfQptpTTVeAF1JyTcjTAxm/NYsKnnXKl6wrvxRVqp/Gb738Dj+0wrflDVbE4q6kNHA2PaKjyDOD9hdfi0s87I3CFEcJfGUsHtLqzA/rr6n0iVDqdTuouLOhuwCDRbNNUsDtnU0cEFo2wYhTHleigniH9PSCjqocSr3y3j9wAat0kEyrK3m0DHxkHBFm8hNcFOfiPivxFX+cykOP4pVEd+8FiZyaPT3mwJ6LW4howjvywBD2gPKdvf4Hv5zF8KM94+gkie0gubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gveICgaLhhrgKIccpuD5uQr7+CNwWh4xOTG0NbNZA4=;
 b=V3Oykn+459+vVna5oc+gF3eBuBu2rLrhAngCuxZFtlDSPzs2PSsHMKwwVo5A8ijDqdIDH/d+HYqXcf96WpgWgpanMXYNN60ZNUjD8Wy5zyx3f/E4wo1AtI/soHTJMorpYr3zW+n7A10zWxT5bEY2YY2gCQS2Pi7CCL7Dwcr1ycu09K1Sr4mYvG8/n5r/xAoFA6P93sM47WWEAyK3gJOakwzl1cAPRvf+QvBtbA1Oa28b9FfE/vA1zA54ydJqp8BRd6Pth7haJDtBeWGV+2HeLlK7U9r3eYt1p3r9sESJVOw66GxjFDn3F7T4KscW/vpkg9lBS59HEtPO8PIz+5LiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gveICgaLhhrgKIccpuD5uQr7+CNwWh4xOTG0NbNZA4=;
 b=s+uVo0ukJEIYB5uWBMrGRrrjRykSMR2P4vvoovhODyyw+D2uKZTWwWpzGoIiptpK/YTnMc+EmFnaqHGubKFtihRzmvibC+0/F9T3NtnB4vJVKbYnY+Zzq2WNJfyKEB4qsISXzNkxEzsEnLG1C8f3eWw96ATNUkZl35zCOaEAim8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Mon, 19 Jan
 2026 12:13:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:12:59 +0000
Message-ID: <bd37adf0-afd0-49c4-b608-7f9aa5994f7b@amd.com>
Date: Mon, 19 Jan 2026 13:12:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] vfio: Add pinned interface to perform revoke
 semantics
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-4-a03bb27c0875@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: 96055d42-6e3a-4487-7d5f-08de57541640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2ZSbC9NSm9aLzJpWklGUXlheC9laGlGcGJSMWFVWU5aZnpRcGF4UmJ6OXBG?=
 =?utf-8?B?MzMvTktNTjU4QzgxQVBPYmZmc3ZHT0dReVcreEZVVVhiSlNQR0psYWt2NlQy?=
 =?utf-8?B?NGtPSjFSS0hUYk85SGpCa0VacGpPTlZuTjNZZm1VdjU1UHVhSXRsQ3pLQzRN?=
 =?utf-8?B?b2p5YlB5TThPMGg3WkdiRXZ4TnM3eGZXcEdVbTd6TkxyM3Z4cmllR2lESGVU?=
 =?utf-8?B?cXo5ZEZKdUw4MHBnL3l6QkE4S1RkY1pJSVUraGY1ZEJVYXVESTdIU09wME5x?=
 =?utf-8?B?UmlzN00zUHIwTGRXa0lrdm9QRWJaTXdkMCtUMEx2V3FKSVU2emZxY1czcUtW?=
 =?utf-8?B?VEI5L3RwWm03aTRxRW9RS2tlTE9PekRGOEkrK3NTZ1NyYXowdWlRcFNSbjJv?=
 =?utf-8?B?eWZmVjdTVzB5MEU1ek1lS0hVaUlFcnBKOGNSUWhzL3B5QWVKck1icThpQUth?=
 =?utf-8?B?VGhhYllIZldWRGp5WlEzb24rTU9HQXdsY0QzY25ycVZrdkdmVjFMWFFtL2lz?=
 =?utf-8?B?cXROT1RyLzRWMzEvakpuRjNyRm9KdWNnQkN3d0RGMHlTVVJhM283MXVCbWxK?=
 =?utf-8?B?Nnp2T0tmdFB6UjVMd1VMclZ6TG56QUhKcW9jenZNSUsyNEJDdVd2Z0VTUmRM?=
 =?utf-8?B?ZVRUMUhNU0VXRlBiQ3AwbGlOOXlMM0dRNmtaUjVhQkI3b0FYN3MzeDA1Sk91?=
 =?utf-8?B?SzVuUDBab0YxMTU5UFhhamZISlRnOG4wSC9rcllyZ1JZWVNGUGNZMzREbzMr?=
 =?utf-8?B?R1BDR0x1NExGZ21ReHhqb3poM2M3MnBUd0RhdWhQOEV6Ync0aGpXY2ZnQ2lB?=
 =?utf-8?B?U3gyVStDeU1RcWJKOGI0MFlTeVBVbFBDbDlNVVR3Qy9CZCtKdzM2UEJHK3ZY?=
 =?utf-8?B?OFlhYkttRDhJOXF1RnlEWEZ0aC9MV2xyMktOWUE3VGxHazRxbDBLZ3pXMWJr?=
 =?utf-8?B?OE5jeXZOY2lGTXBCblZjSUpDTDI3anRXYzVxNmtkOUpvazNzTVFrbTlNY0tR?=
 =?utf-8?B?ZkJBNGZmN21QMW5LMlpuenlENzNudEMrdFJxZzNsTGhSakRlMGlJZmMxdDB5?=
 =?utf-8?B?dnFNUDV2UkRVVUlYQnF2amdtUkg2Z2tRdTQrd3pSaVNoZUhEZDEyaFVoZEN4?=
 =?utf-8?B?ZFlwZ05XMEQrdzZIZ1p5aWN2aU5KTElJK2p6cUFjUmhWOFBWd1JXRndISDVS?=
 =?utf-8?B?bDRUODRGM1gxV29pU1FQVjl4YmZyM0VqWmJaS2dUeVQ2ekRMS2R2VENiWkNt?=
 =?utf-8?B?dkw5MlNpMGtvQkovWHZJMkcxbXhNMDM1T3p5RGsvTmVzSkhhaUpsSFJpUUVO?=
 =?utf-8?B?MndMNzZRMy9IMG5tekx4akFBZ0dLUDNyNWZPODlzNkp6Mk5VVUVqeDFwRU4w?=
 =?utf-8?B?YkVHTE05cWhBQTA2NHZTaTZyTGZ6YTVxbTNINjcycTZKaGdMRHFWbmRPZWRw?=
 =?utf-8?B?blIzUWdLanZzU3F6Vm1XOUFpakp1VFVQN0xFM1R6dU5MNmJXeHVQYXhYbmY0?=
 =?utf-8?B?WmFVTnhGbDBGNTVpd3VXeGMxUzRtTk13Wlc3ZG1CRWdaeHRkWkpwbXFoc04v?=
 =?utf-8?B?Rk9pbEp0bi9tSzNnNFl1NXpNK2hReDAwQmUwcFhZLy9CTm5HbVpHazFiWlJa?=
 =?utf-8?B?cEhNRUh3Y21CRkhLVTRYS0JDamZFNU1yS1hPTG9iR3MxcGRhNytnUE5hZGVP?=
 =?utf-8?B?RmJWcldMSlowSTdPb1NPcVZGbTRGNGwwczJYays3aWo1RW9yMWxvTUt5Wno1?=
 =?utf-8?B?VnhIMHNkY1FvaWRBMlpSSUFOR2V4MTA3czFUa3hYdWZvQUgrcE9vZnNuWUlL?=
 =?utf-8?B?VVF6UkdadHZnTU9qOWdLanVRUXI3dHhWc1FuaGk4N2ZrT21MRk1seGVVSG13?=
 =?utf-8?B?ZVhvL3VRQk1Yck5oRy9RdVN0VGhxcWwvdWtvWm0rM1YwdHQ1RzRrTTRudU9h?=
 =?utf-8?B?d0R0TDVlM29MbFdMSDhiNWppN1J5bGVmUEZ3THdyUUdxa0l0UVo1eFdBa21p?=
 =?utf-8?B?MWpVTzIycnM4TUxHdUpxb2xBbXlNTkFQcXJuNGJTdnBxN1BsNlVOZ0xWRy9n?=
 =?utf-8?B?Y0ZQc2poQk9mdEd4bVMrcEJvTWRDVnk2VHBKdlFzSUg4SjJ2YThhdm9sZFZ0?=
 =?utf-8?B?UENiRzdQVzRra3hZY3NadzhpVGU1V3Rtc3E2Nm5FTGhuZXgrZnVlM3k2YUE0?=
 =?utf-8?B?eUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhvbDFZd3NnTW0vZGN3V2diTDV6Z1ZrUVNZYlpUVk5YZWZoTWlQMCtNRDNW?=
 =?utf-8?B?TmgzZ2ZtN0RvZ3JnVjdGM1U5bUVTZUJxRVIzMmxJVVovWUhXOGlrNzZaMXY3?=
 =?utf-8?B?TDVKYUZmVkN1KzVuMkZkUElSaDR1WERxcFRvUitiUVp3MnM1dFdGdnJTa05Q?=
 =?utf-8?B?THlsQU9EbjlGbEZERGtXekdha1Z6eWk0cUc4eUdyWUNrZ3ZrUkQ3WHgyNnhq?=
 =?utf-8?B?b2hSV1BhTVUrUmtBbVltU0JPZit2V2F1dDljYlNhR0RhNlZrR0tpb0l2K1FJ?=
 =?utf-8?B?V3JKSFlDZVFlUTl2emVLTjFHVG9JQysxY3hzcmsvK3RMcFk0c0ZqMGpJbTlF?=
 =?utf-8?B?M2VDQ1JPUHNxTW51NWdJRGJ3bktZZ3BEME16dXRMQ0U4QjI2czBJSzlPaG4r?=
 =?utf-8?B?czlENHMzdlFtaHN3Zm8rV1hhRFZsQng5WTd0eDRObll1Tm9OekZWaGcyUHVC?=
 =?utf-8?B?eWxTLzJucTVobG5KQ1hwU0J2cUZOSmxoc0ttRHpmNFJoTFlOSFloNG9NUWh3?=
 =?utf-8?B?QjREczYwSVlMaEdpRUpVZ0RuQmtiN1ljSXZWelpGM3Z5Q042M0lSM2Z2bTVt?=
 =?utf-8?B?QWNDZ1lNelZkZVF5ZEZVd1hYMUhqYlpMWmVueHNCdTVKNFpqaVFSTHJGcVBB?=
 =?utf-8?B?MHJGK2p6UzdLNVB2TldGa01XNUFKM0xXL3kweTAweVU0Z0RsU25hQmNPaDA2?=
 =?utf-8?B?VlI3UEpFQnJ1azdjdEVnSHQrdloyRUlzY3NxRHR2YUc2bUJ5Qzk4T3M3a3Jw?=
 =?utf-8?B?UkVhRjJxcHd4WnFla1Z4d2JuYzFkZWpXaUU2VE00bTJZSFUzMDJPZzVEZUpT?=
 =?utf-8?B?U2NaT3ZzUG9VNk42a0p3cjZCRVlzMVBXTmtiNjBrYVJqVU4zczNxd3pzYlMr?=
 =?utf-8?B?dG5yU2dPc1dRMThWZzBSLzdReUg3N1VRaUZGWlBvbFp1KzFqcGMrYURtZ3VK?=
 =?utf-8?B?cER6c2x6N2g4MkZkd0NmWDU0V3kvRXZhdmNoMVlXQVNuU1NRdTJRVU9pSUZE?=
 =?utf-8?B?VEhvQ2JocjU1WTlrNE12a01EenB0V1padnlmY0M5eDZPU1UvcEtDMWNaOUpk?=
 =?utf-8?B?TkliWE83MExnL2ZLYnNrVUtHMnluQWhUd1FPK2N6aWJIUlJyVkM2a205aDJI?=
 =?utf-8?B?L2tkdUxaQVhjbVlnc2Evbzg5ZVhTenlvOXNpY1BtNVFIcUhuY2ROaE5yWnpB?=
 =?utf-8?B?REUzanZDNXJYUThIY2cveG03UUJLNmJ3aHMwM0JmT25Sb1Bhb1lGRVhQeGRX?=
 =?utf-8?B?dkxTOXZ0ZEtXVGVCQ3EzaDJVaU1TZVFYK2xJTXAyVDZ0MkZmeEsyam16eFNF?=
 =?utf-8?B?VzIrSHFuLysrVzRoS203MWp2ZDZsSEpPUGVFU0RBdmYra3ZLd1h5eXp0RzBZ?=
 =?utf-8?B?M3VBUC91dmR1VENpTWl4cENUMVRUc2xOcTVPK3lBWFZGbHc4clBCYURxSU8x?=
 =?utf-8?B?OHg2WkI5UEdFUmxZWmt0clZIQnpweFFNUWdQMS9zMG9KdEN0amYzdlNJdngz?=
 =?utf-8?B?emovdmJiV1I3QVBIKy9hcmFSMzU0a2hpaDlteFBLYVJmblphNzNEWXdWeURu?=
 =?utf-8?B?VWgzQWNoMFpUUC90Y1ZIKzdMb3Bsd2xkelZQWlZrMFBUMTVSWXZHU2hHMnl3?=
 =?utf-8?B?K3F3RXAyemo2bEhtaG0ybGUza1NkSUNPenMrN2RvOVVnUmE1V0JuMWJtdC8w?=
 =?utf-8?B?TEdublk5V3ErNkg3YTVHVzNWeHMxNlJVQXVKSHprOGcwdjZwNTlRekM4K1ZR?=
 =?utf-8?B?L0puVXdLQnpSeWJxQUZ2SGI4SzV4L3dPcEVZMjhsWTFCaFc4cHlPU1lQbTgr?=
 =?utf-8?B?b0hMTXB4S1hUcnl4VE51aExSWDBzeUptVVgrQmQ3S2hZS01UWE9LOEtnUFlR?=
 =?utf-8?B?L2R6MWV5QjZ3bGEwQ2FHNFNiVFpTdEdyWDNpMm5JbFN1eTlobFVQM0VMOHlQ?=
 =?utf-8?B?ZVV3d0VDcmowVnJVWjZ4czVLZjJFMUxwdkhxeDY4R01OVDVjVjJOSmRJcUlk?=
 =?utf-8?B?VUgwY1RqQjV6cCtJb3grcnZGSnY1ZTgyQ3FhbHpUcCtxb3VHUWJ2WUtaK25v?=
 =?utf-8?B?TjFkWGRQbUdKZ3F2K3VlWk5EcDV5aUg3STBwaTFpYmRZWEV5dExBL0I4Nng3?=
 =?utf-8?B?SzdCY1VwZGFhQWthYmtwVWhJd0EwT2ZsWWdnaWNMQUVJK2JoeC9TNWl6WUZ2?=
 =?utf-8?B?KzhndjRSQllvZmhLUlIwbzBpVzFoWGF2UTlweVZDWFZBNnhMSXhERENzSklB?=
 =?utf-8?B?bTA4cTU0UDYyYU9raFpoeGVFaXI4QWxuVTk3NUhsbDNwd0NvMTZCV0NyYTF1?=
 =?utf-8?Q?lOmbP6c7lsf3LUEr15?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96055d42-6e3a-4487-7d5f-08de57541640
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:12:59.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ITxMD1iCXc2/x342+lqPVseLP2ExWGq0ZRLyKgSN0fmkOKc2+Un4spRTjguo/hD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
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

On 1/18/26 13:08, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> DMABUF ->pin() interface is called when the DMABUF importer perform
> its DMA mapping, so let's use this opportunity to check if DMABUF
> exporter revoked its buffer or not.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index d4d0f7d08c53..af9c315ddf71 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -20,6 +20,20 @@ struct vfio_pci_dma_buf {
>  	u8 revoked : 1;
>  };
>  
> +static int vfio_pci_dma_buf_pin(struct dma_buf_attachment *attachment)
> +{
> +	struct vfio_pci_dma_buf *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	return dma_buf_attachment_is_revoke(attachment) ? 0 : -EOPNOTSUPP;

It's probably better to do that check in vfio_pci_dma_buf_attach.

And BTW the function vfio_pci_dma_buf_move() seems to be broken:

void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
{
        struct vfio_pci_dma_buf *priv;
        struct vfio_pci_dma_buf *tmp;

        lockdep_assert_held_write(&vdev->memory_lock);

        list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
                if (!get_file_active(&priv->dmabuf->file))
                        continue;

                if (priv->revoked != revoked) {
                        dma_resv_lock(priv->dmabuf->resv, NULL);
                        priv->revoked = revoked;
                        dma_buf_move_notify(priv->dmabuf);

A dma_buf_move_notify() just triggers asynchronous invalidation of the mapping!

You need to use dma_resv_wait() to wait for that to finish.

                        dma_resv_unlock(priv->dmabuf->resv);
                }
                fput(priv->dmabuf->file);
        }
}

Regards,
Christian.


> +}
> +
> +static void vfio_pci_dma_buf_unpin(struct dma_buf_attachment *attachment)
> +{
> +	/* Do nothing */
> +}
> +
>  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  				   struct dma_buf_attachment *attachment)
>  {
> @@ -76,6 +90,8 @@ static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
>  }
>  
>  static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> +	.pin = vfio_pci_dma_buf_pin,
> +	.unpin = vfio_pci_dma_buf_unpin,
>  	.attach = vfio_pci_dma_buf_attach,
>  	.map_dma_buf = vfio_pci_dma_buf_map,
>  	.unmap_dma_buf = vfio_pci_dma_buf_unmap,
> 

