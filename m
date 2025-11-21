Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F98C7B9BD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 21:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35CA10E8FD;
	Fri, 21 Nov 2025 20:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R2Ku3bGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D1F10E11C;
 Fri, 21 Nov 2025 20:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyWZMGiSluignhHfa14yp5q0peLzbjRtR9mzQfbCy/rs1rmQ2CFdsJAo/W6jgoBozSiifFJ6RWaasIaeav5cSKgcj7d6N0G6uY+onim+GhSRj1xzxEGOuaLy//X/dtz8ZLzYdqUAqNxtvYCzFdch+x3eFCxWCdSYHRLIjdxnd5ZxqETzljBCvcKdVHGk83MH72IXbuGILaLoOWRe8cGc5Sp9p6rQHSgar4Baxz7xLP7U8sADZ4lgrENCeAdoI7bLPohmmdLOCWYPcVChkjr11A9n1pj25jixGhywhiAn8WwBn51k/7IZ+90dQXJjsQkAthoDaFqdKEA0ea2U3rkCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCuUnsTgbeuSvDkyyo4fh97gMdrgcxB+cEfq/M/7VE8=;
 b=SwTYDhrh+WebpveFxfBbDGxobQmgJ+tet9+OR77XGDSf/qLcb95OqfkRWwINk/k/BMsuzdNLm1pl93z6FfNOKvoDRquPSc1RC/5KdeJyvezgH+HHVsV74wEQwhEzid7LRvucKlkXUHOPMudfK0yj7dkBkskj0aZNRcQDvjmd5m/TUvWAgWLZsfnu72p+nwIoHKw0HZVRcOKcQqwyx/snIez8blfNzntuVJ5VX85MEva4XCb8PC8wK5+oQdB6ZFl/3YR+qGju3JhrS04hWEfJRqG577vfSi1VYZAJzIHpmsGglTuQcGlgi58m5+uJK4lvFd6SYOZdR/7tFn45bF4ItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCuUnsTgbeuSvDkyyo4fh97gMdrgcxB+cEfq/M/7VE8=;
 b=R2Ku3bGjf/+vxQc0AzWNBl8PTaBW9keayahvkXEP16PL2Mc0e3Vh6WosbPsR2MCYWnF0RF8o7qMXjpgEWADcofszyI455m7RoTQNu+jMlMO9ApiH8gzKMS+NmHMwzU5PtaxgNiIPdQF3TemSN8uwjadaezb9x7wFxa4Yc7R++lU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.11; Fri, 21 Nov 2025 20:02:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 20:02:19 +0000
Message-ID: <cd4d3127-f166-44d5-b745-d6b229c61773@amd.com>
Date: Fri, 21 Nov 2025 15:02:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/28] drm/amdgpu: give each kernel job a unique id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251121101315.3585-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0317.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d630b2d-bb24-4e3e-ffb6-08de2938e013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3dERnI4OGRTbmExRjM3WWN6NmlLaFRObVh6UXBZVzAzSVBkQ2FHMUtubDdJ?=
 =?utf-8?B?N3dkNVo1TCsvL2JiTmpueDZ2dkNQRDZ6TUR4OHlmQXpWUU1IdnNSTklBbGRh?=
 =?utf-8?B?OHh6NjVNSStzS3FJeXlBd3BWMHlyNWt0U2VFMHpreTNrK2RPS2ExOXYxTmFR?=
 =?utf-8?B?OWw5SFlBTU5Ca3J2QnhpTTNXYnBDR0VIcHN1ZzlQMVoyakZDV3Y1NGtYZ0ZY?=
 =?utf-8?B?UDNETEhLT1NJWUJqVkZPUFIrYVNZR3hQWUNibTdpSjlCYmVtcDY5bWdTL0Yx?=
 =?utf-8?B?enhjREhEcGg2R1pNVndwUnZSamVENzk2NWNSVTB6ZVpKejdpc3Q3YVh6bWly?=
 =?utf-8?B?YVhseWFJMm1TTFJNbnA5M0plN1FpemNCZTlpSzZmWVhOM0FOdVhtNyt2TjdC?=
 =?utf-8?B?RW9XWmJRb0dKa0o5TmJnOTdoODBBM2ExNE54ZTVCS3krTTZ0c2VjU05CdWI0?=
 =?utf-8?B?d29xTkZaVVV2MC9ER1luUE83TU84ODNFM2VPNXVSelA3eitMUTlNaFBlU3Bh?=
 =?utf-8?B?TitlNEhPRCtMbkJ2K0k0T2Izd29RYkZFS0dkVHU0aFdXMVl4UVZ1MmYwNi93?=
 =?utf-8?B?OEtWSFpkU2djb3ZaRUkrQTJwNHlld0ZSZ2dJQU1FOTJqbytJTjdjcXJYdk16?=
 =?utf-8?B?eGY4QmJvK0VMZk1nZW4wVExYSjU0TEhYZk9pYk1SQXo2M0RlNUxXL2hUQ3hK?=
 =?utf-8?B?NnA0ckRPRm90ME9CQ3NTR1Y3ZE50TnVwcVNCL2didjcvbGpHS1FMaDFRdytj?=
 =?utf-8?B?cXlIL215bE5sVWNmWmZ6Y0daT3haQ3FKbk02VUtVNVR6ZFY5QnBMeExPTzFF?=
 =?utf-8?B?TzBuU0R0dTV0NklxelM1U3RQd3ZON2xWLzhiczU5eVFIUVZsTW1VUGFPOFFE?=
 =?utf-8?B?djE3QnZBOWZvZ2FyaC94eVdaN1lOSkFZbTNyVE83NW05UjhGM05Jb1kveU9I?=
 =?utf-8?B?UWIrSk1qNU1RUVNnNXJqU1Fjb1BUTGpnZHBOS1NBQloxa0VHZUhHb2Vyc0dB?=
 =?utf-8?B?NSs3bmF3UzFrYi9KMjR1Y1pKR1BZTDZ2ZW1GVmlDQ1hjYXdmMHJORXREek5r?=
 =?utf-8?B?ak91RTJWVGZuOHdQcEJKSGM4QTlySGRmeGcwV1lBSmcwM0VZRXVYemJYNXFT?=
 =?utf-8?B?TmhtU25oVTJxZ3hFcWY1LzZ1dnlQRkJuWFJ3dy9JVWpRam1kM1Bhd0hPZEFV?=
 =?utf-8?B?NW1xMElHZTRpRXJueGphSktTK1pMdjFSZTVRR240cktxYitiMVM4L0d5TlF6?=
 =?utf-8?B?UVhsTm1wdWdzNCtOSEo3S0crVnk3UGlFUVNFbHgvZ2h3Q1NnanNVMVY3MFMv?=
 =?utf-8?B?VDEreU9zeEVobkVWZGJydkZnWjNPWnN3akh4NVdjZzRUS3RBZWxNRldxV2Rz?=
 =?utf-8?B?dVQ0Yjc2aFRCM1V0RU5XUkhYekdsZTBwN0FnNXh2d0pQa0JXeEIrRGF6dzhp?=
 =?utf-8?B?ZVFpTm0xZ0MxTHRuaGNkV2NHUEh2ZkVlOUNQWFJ4WVh6bldrWW5DakJvMDd2?=
 =?utf-8?B?eXBZdThMbFpuV1ZWWHVoYW9NWjJYbndEUnVzKzQ1b2t3RnFGaWRyM1J4MTdV?=
 =?utf-8?B?dGVuMGpMWld0dk9oS0FrV3Q5L3Nnb252K2xkMU1wc2t0KzZ1UDZIQTV2VFVv?=
 =?utf-8?B?UTUyZGVLSkxRcnRWK09Id1BqbFJyc3VPQ2h4SlJvYjBCakxRbUNKUmRMM0xU?=
 =?utf-8?B?ZXRCY2loWUxNUTJoYnNmTHd5TnFOZCtQeWdLY0ZRV0ZZbHRHc25VSFJHeEU0?=
 =?utf-8?B?elluQjB6a1pMaFdwZDM4ZjNRWG9PMHNoakZMVTNrN1p0WHdWaDVLTXZQT2Ft?=
 =?utf-8?B?a0lHSEk1eHJzRlVVY2lnUDY3Nzl1MERIdG5iNHNxWEVteWpvWjZqdVduVU5Q?=
 =?utf-8?B?RkE3S0EzYzF4RnZmVVNoa05rYzR0eW9DWHRvanpqSkt0UVByL3pEanVhYllS?=
 =?utf-8?B?L3NUZW5NaVMxNFk4OXJ6U2VhSWh1Y2VjNW5wbkhIZDZSaGwzZmhHQkRqUWI0?=
 =?utf-8?B?UDc1UGJqbFZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFxUld1NzlYaUVKZjBCTk4wOXdzMlhiQ2JucVV0dS9vdVFmZDdsVG1vWUJP?=
 =?utf-8?B?aVZrdUgzNi84aTViaStEMS9jRGZqMFdmbEluZHlDaHVNanZSd2VGZFlXdWNW?=
 =?utf-8?B?TUZmd0g0UDA2ckw0eGdSRFNzUktwUmFFekFWYmczQUNXbi9WZFFDZ2c1OUp2?=
 =?utf-8?B?ODlUTGFFdWFpdUxPbGFjZDBtZjM5WkJSYW5nTFNjQ3ExU3h0SEx1eVVjWmgv?=
 =?utf-8?B?UUd1Q2src1ZkZnAzV1ZCcmk4WnlaTFdFR0Y3YjdQeHdTNi80VWJuZVg2RUN2?=
 =?utf-8?B?Z0ZwWUg2NGpzYXVqNDM3dnlJbjRMY2Y3b3hYKzNZNmhLaTYzaVdFYnFBWGRi?=
 =?utf-8?B?K080UDV6dk1pNXk5bWhBVkRJajhZdnR1REJ5MnNhN21pN01iK3R6b0xSVnNz?=
 =?utf-8?B?VW1jaGRPVmRaaHRJYTNyVDdheERoZS9QZWhNVWZhaEhXaSs5TlE5WUZTOER5?=
 =?utf-8?B?czMvYmdkNG5LeCs0UzljZzNseEcrQmpMWDQ1VDVTT0Y3RzdJK2JtMUVJaUNn?=
 =?utf-8?B?cWRQODE5d2NoOXdkdmY3elM3UDBCTWFjeUpzbzVqTUxua08yNVJqMDQvNUNW?=
 =?utf-8?B?Q2l5N1k1aXJvL3pSb3RJQ0RhQzRNNnVvRzAyK1grcUVRS0ZaNEJsYUFhVlNC?=
 =?utf-8?B?V3pvY0tjaWdMOTQxcVprT3NmM0NQckFsL2NudG05dk1QUVB5Y2ViM3BLa2dH?=
 =?utf-8?B?VW5IWUdsRG1mWFhNNDZkRTRZQThGcUF6N3Ezb0NqdWJmR0N2aFhOZ1pkUlNN?=
 =?utf-8?B?bmRSQ1NtNGlYSkNKaGRnaU9MeVYyVGd3MkdEQ2trTVdtWW5ONE56MXRrT3Zj?=
 =?utf-8?B?Szl5NS9HUXpRNVY2R2FHUEJ5WFhvVU1MRlRWcFZxaUlLc2pTSlZaNFVCUDRl?=
 =?utf-8?B?cGE0T0RLck5KdFdnNURGYS9URWwxOGdTak1xRWJrSC9KUUhMT1AyTllTVHdT?=
 =?utf-8?B?U1Q0dHpwNzdKdCtYS2M4OC9seDdtUSt2di9iVUlIQ0VwZ0ZWOHphWVhtVTBk?=
 =?utf-8?B?L2pGREVxMEFRVy85SkF5bHlWckExdjFURXB1UHIrQ0lIQ0UzczV6Si9GMnZ4?=
 =?utf-8?B?cXU1N0cvZUpySlZvY2lWdC91WEVGcndMMDdPYVQzSVpyM0JJU1Exa3lrNU5m?=
 =?utf-8?B?OGUrdkJNVmU2SHZqcUV5dFBaZVppT0phNTl1M2lVQWQ1dnhMclVJRU5FVFd5?=
 =?utf-8?B?WnpCQXM0eUFRNkFlVU5ubVFBMDBwNHZQR01mdXdGVmZKT0hMTno0N0J6WXp1?=
 =?utf-8?B?eGg2R3NuTjdCQkx4Qi9pUit1ZExKMHBPT0FUV3h5cVdvS0srUTdoSTNETzJB?=
 =?utf-8?B?QTExbzZEQlM0WmNHTWFaYWxiL2hDSVpIcTVha1JxcmVEdEY5Y3EvVXBNaGVm?=
 =?utf-8?B?NHZvUGlKcFdtQ29memhQTiszdlNKZkQ3NlhZS2w4RGNuQzdWVGc5UTYxQkRh?=
 =?utf-8?B?WUZ6ZGIzZVNYeGpGT3p4UDU2U0RHa3QxYlZxbFd1RnpZMU5lYjF4YmZSYTRG?=
 =?utf-8?B?Q1JmRGpXcTNHT2JCU3dXZ3p5YWtKaFQ3eUs2c1FPS0VDNnltSlRkdWU2RkJu?=
 =?utf-8?B?UDA4VzcvUjg5S2Ftd05GUUlyRlJjOWtMNmErVWpSNWtrTklRUjE5VmJlY1Q1?=
 =?utf-8?B?QTdvS3Q2LzEvSHNUMitGeE9QakRaYUdlOWgxcmh4WW9QYytaa1BBRTVScDhP?=
 =?utf-8?B?dU1Cd0RDSVVjUHFTeU1qdTVvMmNjMytxSm9FYlpXRjc4UUZ1YXcxNlRjeVM1?=
 =?utf-8?B?aUVXSmdVcXBnZVR2eWxJK0JLUFZZM3pjTitIc3BoZmlXMmFqd2tjRTlEOUJV?=
 =?utf-8?B?dVpuc1BWTThpZTd6Y3BEMndycjd5aDdYREswSCtnYUZqdTZ1NGNteG5TRlBw?=
 =?utf-8?B?MkluRWV1UUwyY2JCVXZ6V0F6bHhBbTd2MGJJSE1DYlFJYTB6Unh0WG55NUVq?=
 =?utf-8?B?cjZVQnh2bzVKQWREMnNIZjkxZWcyYkxUVFhzbGNWZnZiY1dlS2FDbW5qMTBX?=
 =?utf-8?B?NlMrbFJQbC9EY1BmWGhJalBTbmpJUGUvaXJza1FheTgwMXp0Q3lTSEc2TDRh?=
 =?utf-8?B?L05YR1J1eGs2Z0NBbDRkUzNuUlcybFhLUWUxN1pjd1ZHM1crS3JkRStDakdG?=
 =?utf-8?Q?hlJmfnqDTOOydg5Y5G6gwzjFy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d630b2d-bb24-4e3e-ffb6-08de2938e013
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 20:02:18.9920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRkoi6dQNiS1tTGMYdgxMGZ4lDUtjlUS9Y72WyntpWU1cCPcQbJtlr0AO6mWisDiPx686FrZ+ySbY03Cd+X2wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
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

Patches 1, 3, 4, 5, 9, 11, 21, 23, 25 (the ones with KFD changes) are

Acked-by: Felix Kuehling <felix.kuehling@amd.com>



On 2025-11-21 05:12, Pierre-Eric Pelloux-Prayer wrote:
> Userspace jobs have drm_file.client_id as a unique identifier
> as job's owners. For kernel jobs, we can allocate arbitrary
> values - the risk of overlap with userspace ids is small (given
> that it's a u64 value).
> In the unlikely case the overlap happens, it'll only impact
> trace events.
>
> Since this ID is traced in the gpu_scheduler trace events, this
> allows to determine the source of each job sent to the hardware.
>
> To make grepping easier, the IDs are defined as they will appear
> in the trace output.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>   19 files changed, 84 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 5a1904b0b064..1ffbd416a8ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -1551,7 +1551,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>   	owner = (void *)(unsigned long)atomic_inc_return(&counter);
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
> -				     64, 0, &job);
> +				     64, 0, &job,
> +				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>   	if (r)
>   		goto err;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 0017bd10d452..ea8ec160b98a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>   	if (r)
>   		goto error_alloc;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index efa3281145f6..b284bd8021df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -232,11 +232,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>   			     struct drm_sched_entity *entity, void *owner,
>   			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job)
> +			     struct amdgpu_job **job, u64 k_job_id)
>   {
>   	int r;
>   
> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
> +			     k_job_id);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index d25f1fcf0242..7abf069d17d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -44,6 +44,22 @@
>   struct amdgpu_fence;
>   enum amdgpu_ib_pool_type;
>   
> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> +
>   struct amdgpu_job {
>   	struct drm_sched_job    base;
>   	struct amdgpu_vm	*vm;
> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>   			     struct drm_sched_entity *entity, void *owner,
>   			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job);
> +			     struct amdgpu_job **job,
> +			     u64 k_job_id);
>   void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>   			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>   void amdgpu_job_free_resources(struct amdgpu_job *job);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 91678621f1ff..63ee6ba6a931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>   	int i, r;
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 24ebba43a469..926a3f09a776 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	if (r)
>   		goto out;
>   
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> +			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>   	if (WARN_ON(r))
>   		goto out;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 04a79ef05f90..6a1434391fb8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -226,7 +226,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     num_dw * 4 + num_bytes,
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>   	if (r)
>   		return r;
>   
> @@ -398,7 +399,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   		struct dma_fence *wipe_fence = NULL;
>   
>   		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false);
> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>   		if (r) {
>   			goto error;
>   		} else if (wipe_fence) {
> @@ -1480,7 +1481,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>   	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>   	if (r)
>   		goto out;
>   
> @@ -2204,7 +2206,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>   				  struct dma_resv *resv,
>   				  bool vm_needs_flush,
>   				  struct amdgpu_job **job,
> -				  bool delayed)
> +				  bool delayed, u64 k_job_id)
>   {
>   	enum amdgpu_ib_pool_type pool = direct_submit ?
>   		AMDGPU_IB_POOL_DIRECT :
> @@ -2214,7 +2216,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>   						    &adev->mman.high_pr;
>   	r = amdgpu_job_alloc_with_ib(adev, entity,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
> -				     num_dw * 4, pool, job);
> +				     num_dw * 4, pool, job, k_job_id);
>   	if (r)
>   		return r;
>   
> @@ -2254,7 +2256,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>   	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> -				   resv, vm_needs_flush, &job, false);
> +				   resv, vm_needs_flush, &job, false,
> +				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>   	if (r)
>   		return r;
>   
> @@ -2289,7 +2292,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   			       uint64_t dst_addr, uint32_t byte_count,
>   			       struct dma_resv *resv,
>   			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed)
> +			       bool vm_needs_flush, bool delayed,
> +			       u64 k_job_id)
>   {
>   	struct amdgpu_device *adev = ring->adev;
>   	unsigned int num_loops, num_dw;
> @@ -2302,7 +2306,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>   	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> -				   &job, delayed);
> +				   &job, delayed, k_job_id);
>   	if (r)
>   		return r;
>   
> @@ -2372,7 +2376,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   			goto err;
>   
>   		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true);
> +					&next, true, true,
> +					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>   		if (r)
>   			goto err;
>   
> @@ -2391,7 +2396,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
>   			struct dma_fence **f,
> -			bool delayed)
> +			bool delayed,
> +			u64 k_job_id)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2421,7 +2427,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			goto error;
>   
>   		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed);
> +					&next, true, delayed, k_job_id);
>   		if (r)
>   			goto error;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 054d48823d5f..577ee04ce0bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			uint32_t src_data,
>   			struct dma_resv *resv,
>   			struct dma_fence **fence,
> -			bool delayed);
> +			bool delayed,
> +			u64 k_job_id);
>   
>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 74758b5ffc6c..5c38f0d30c87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     64, direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 709ca369cb52..a7d8f1ce6ac2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -491,7 +491,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>   	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> @@ -582,7 +582,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     ib_size_dw * 4,
>   				     direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 5ae7cc0d5f57..5e0786ea911b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>   				     64, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		goto err;
>   
> @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		goto err;
>   
> @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>   				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e2587eea6c4a..193de267984e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -989,7 +989,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>   	params.vm = vm;
>   	params.immediate = immediate;
>   
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>   	if (r)
>   		goto error;
>   
> @@ -1158,7 +1159,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		dma_fence_put(tmp);
>   	}
>   
> -	r = vm->update_funcs->prepare(&params, sync);
> +	r = vm->update_funcs->prepare(&params, sync,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>   	if (r)
>   		goto error_free;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 330e4bdea387..139642eacdd0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -310,7 +310,7 @@ struct amdgpu_vm_update_params {
>   struct amdgpu_vm_update_funcs {
>   	int (*map_table)(struct amdgpu_bo_vm *bo);
>   	int (*prepare)(struct amdgpu_vm_update_params *p,
> -		       struct amdgpu_sync *sync);
> +		       struct amdgpu_sync *sync, u64 k_job_id);
>   	int (*update)(struct amdgpu_vm_update_params *p,
>   		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>   		      unsigned count, uint32_t incr, uint64_t flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index 0c1ef5850a5e..22e2e5b47341 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>    *
>    * @p: see amdgpu_vm_update_params definition
>    * @sync: sync obj with fences to wait on
> + * @k_job_id: the id for tracing/debug purposes
>    *
>    * Returns:
>    * Negativ errno, 0 for success.
>    */
>   static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
> -				 struct amdgpu_sync *sync)
> +				 struct amdgpu_sync *sync,
> +				 u64 k_job_id)
>   {
>   	if (!sync)
>   		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index f6ffc207ec2a..c7a7d51080a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -26,6 +26,7 @@
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_vm.h"
> +#include "amdgpu_job.h"
>   
>   /*
>    * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
> @@ -396,7 +397,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	params.vm = vm;
>   	params.immediate = immediate;
>   
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>   	if (r)
>   		goto exit;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 46d9fb433ab2..36805dcfa159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>   
>   /* Allocate a new job for @count PTE updates */
>   static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
> -				    unsigned int count)
> +				    unsigned int count, u64 k_job_id)
>   {
>   	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>   		: AMDGPU_IB_POOL_DELAYED;
> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>   	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>   
>   	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
> -				     ndw * 4, pool, &p->job);
> +				     ndw * 4, pool, &p->job, k_job_id);
>   	if (r)
>   		return r;
>   
> @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>    *
>    * @p: see amdgpu_vm_update_params definition
>    * @sync: amdgpu_sync object with fences to wait for
> + * @k_job_id: identifier of the job, for tracing purpose
>    *
>    * Returns:
>    * Negativ errno, 0 for success.
>    */
>   static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
> -				  struct amdgpu_sync *sync)
> +				  struct amdgpu_sync *sync, u64 k_job_id)
>   {
>   	int r;
>   
> -	r = amdgpu_vm_sdma_alloc_job(p, 0);
> +	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>   	if (r)
>   		return r;
>   
> @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>   			if (r)
>   				return r;
>   
> -			r = amdgpu_vm_sdma_alloc_job(p, count);
> +			r = amdgpu_vm_sdma_alloc_job(p, count,
> +						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>   			if (r)
>   				return r;
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 1c07b701d0e4..ceb94bbb03a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>   	int i, r;
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>   	int i, r;
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 9d237b5937fb..1f8866f3f63c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>   	int i, r;
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>   	int i, r;
>   
>   	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 3653c563ee9a..46c84fc60af1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     num_dw * 4 + num_bytes,
>   				     AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>   	if (r)
>   		return r;
>   
