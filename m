Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A8AB3188
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2BB10E320;
	Mon, 12 May 2025 08:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MtyMLdfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E2B10E306;
 Mon, 12 May 2025 08:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6ylB8j2cOG02tGD7Yo4CQ7KmR7tus6j7O9HvrrEuObJ11GkenRcqi5LYXMerPqBtM8R34plLjA3oG3cioL8DEk6tfcaKZf4zFvbhAh4q5aA56FxWDMtHpbFrUKyDqJi4q/j+2NWEZT9Apx6GfH04L2j/ZJEprSjny+LjNonwVvI304hwgrGmX/3cT31++qNCUq8z9ATyBKPLJMNvBN2YY7r3iZbj3zpSme6CiktojNfoNTruoJN+4DQJ7RFRjar8cAEG26cEGRq957n72rXswuf37u481Gue4+UYhh3cspMC/CdxJ39ugD8lm/3KUZ4wclgHIksjCKK8S3KIHBVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beWa3whwpyv6wDEwxxub6xVGaJgXTuSqaIOC7HUizo0=;
 b=oa/OssqNa+SS0uarmm5qVViuxA9Lya0BjEoE5LqStS+6SbslefnIpLeBGL7iS+wZlvHft64VjXwOAzXF2/CipKpBtHC++LU8hHAgv65YbLYUN8Hwz4UsWZXm97SvCiuD7sZiS9IOh27rJUg9OdfmAZDnYH74XKES24TctjfmMYcTPvg4gORdweuEZcRv9bqOtJwhWG5mF6xqBRdWVkeJIfJ8weon8Bw1t4AETbhEOxXdlLopGKkky9/UG0p7Ly3gTCOGCFJMylahKyF/GYNtPzQpMu2eNRbiZkThym2B6re9mrxyAItDJAcdMxd+AOpsU0CDAo1J0jeoDirEIpJ3cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beWa3whwpyv6wDEwxxub6xVGaJgXTuSqaIOC7HUizo0=;
 b=MtyMLdfYUG8zYhPGNxSXThwlRaxHvm5dB4C1BPfxjPf0da+wymQ5D9JnkKZykzplZE4l4Rf98UKVGgHd9pGa/tc4V87b6iD3Kh5X3D2fBVwkE26xfL334l3zHCHuCZegsjaC5a7Sh5o2ygkjUXuwHY3gMEfwpt8PYBX2xZkYgc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:25:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:25:25 +0000
Message-ID: <d6504cf0-ad86-40e8-ac93-9e0cb2d3eb68@amd.com>
Date: Mon, 12 May 2025 10:25:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 07/13] sync_file: Use dma-fence driver and timeline name
 helpers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-8-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0323.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: fff92900-0a2d-4f9f-fbe3-08dd912e8b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qndvd1J0TTFnSHlNOHVZcEMza1haV1dQYlVSbVJPdHcyeFRQby8zOWVMVkRJ?=
 =?utf-8?B?ZFFsOW1SUjdSNFRraXhMZDBucG5GUU1IZHZWcUt3Y0xpSEhPTUxVVFBhZUVF?=
 =?utf-8?B?STJCMnNMU3lLeVFMZFFWY2xHVGtTcUJIS2R6ZUJ3T0I2ZE9TcnIxMk9yRWk3?=
 =?utf-8?B?ejQrNjFVZHdkV05pYjRnMm9rOFdjbExtOEd5aTk3VzZQTWJha1Qza1A1ZDZE?=
 =?utf-8?B?L2VIdnZvckJmdWd5aUZVTXdFMzBQYU5mNXRyY25Qb2srYVFWeTJGL1dENHhZ?=
 =?utf-8?B?R1V0RlIxaklBenQwTVMvTHVSbmg0Y1NtckZ0WFd5cEcxUmJEN0s3U3BSUFRw?=
 =?utf-8?B?b3daZzBaYnVOaDd5Sm95NDZuQkd2TnNLc09iYzl1Yk5ydDhodXc5bVJldFRz?=
 =?utf-8?B?TlRsRWJMTjNKdXYwY28xWnpKb0E0bWU0MXlzdjZqakVUNlY0NVFWbEF4RW5r?=
 =?utf-8?B?c2dqMlJTWkFHMUdIMjNnTzlzenF0Qk9NdjduUTI4S0FhRjNoQ0VNa0RZLzRI?=
 =?utf-8?B?ZlhzbVptc3F4T0VyWGpqSU9TRUZETjUrcm4vZVFheHoyL0F0cTYwL24yazVH?=
 =?utf-8?B?bHIrYWVFQzhnd3NCTUhJWGhxQ3RXTm1qSEpIdU1jMWtZTkVKYmRyRjBLMkxO?=
 =?utf-8?B?SFRzQTErR3JXUTBNUW01ODlNMDg0bHdQRGJNSFJXR3lHWk8zNjdVclVBMVc2?=
 =?utf-8?B?ZzZ5NUhiUnVwT2NOeldyWENRdVhmdTcvMlFacFE5anJmOFlvL3dwaGNyQWIx?=
 =?utf-8?B?U2IrWDRTVW5sdVJDRWV3UTJmUUVDR1MyNGpqK1pLYk9ERFZQYlpYTGxMa3l3?=
 =?utf-8?B?OGFySUJROW1mRjJ5UFBQbmVDMHRDcDExdmdjWmpTR0t0LzBNbHROL2xwWjA0?=
 =?utf-8?B?b0oyNFYvTmM0UWdVaC91OTFPdGtLK1grWGRCOVVEYStHMjlTL0JiUEhQelBu?=
 =?utf-8?B?Wnl2WGpuSVM4UlFmMzJ1Uk9XV2NRdHVhMk42TGl0RlE1TmRZbCtDRklBa011?=
 =?utf-8?B?RlZyWDhoVW1BRVd5MklYZVB6VHpOY0p2UXlLUk81eUc0a1RJNjV5NUNTMjd6?=
 =?utf-8?B?Yk0vV0NmZWpWOW5BVjRZb09VTFpzWm5WUThrZ240M1VrSFVSVkxRRGFORS9z?=
 =?utf-8?B?V2lnY1ArcGVZa2NqQTRnZDljRWViVkU3Y2puTUg4N0ZkTVFhS0gwV2l1U1hv?=
 =?utf-8?B?eXhZRlhqUUNPd25peW5qTysrVWNlbkJTTFRIaFp2OTFkK1Q4UmYrN0ErZ3VJ?=
 =?utf-8?B?SFNwOWRoYVVIK1poMVliRWVlRmNNWWZoaGRuQlpkWGdKM3UvbmpuT09PbWta?=
 =?utf-8?B?NWRpSHFZRnFlZS9rQnNvYWVXSU8rVzZ5TFgyeXZ1eXR3cUgrZzZNOXg4QTcw?=
 =?utf-8?B?Z1hDM04raFd6ZkEyM1pocEYwZFQyU3NZZXMyTVovM1NTN0dqZ3J0RTNuaUxt?=
 =?utf-8?B?WVlGc3lMVDlGYUlMaDQyeUVnK2dSdXRBMTQrOExkbk5FWlpDZGVqWGJYWTBs?=
 =?utf-8?B?VjRHUHpoaXFaNG1oRjlzS0xraXdoS0swYXZzZWlYMmJqWHJlcWNUY0h4WmZU?=
 =?utf-8?B?MGI3Tmh1UzJ4R2dPTWpDTHN4dnpGdVpkYWNUM3RiOVAzbUsxdzlna0NVZUUw?=
 =?utf-8?B?ditrSHFQelM4bk9sY0NLMW9xY3BnUEd2NEpTZG1VKy8wS0JzR1oyWXVyV2xI?=
 =?utf-8?B?OGVFS2xQQXNLL0tkTmYvdzVLYU4xeUtUd0QyT2xCOHlNYWtleVJFRnkzSU5O?=
 =?utf-8?B?eGYwYXd2WmMxa1FnZXdHaEE4L3NDSnRFWk8zaGhXVFZZM25NZ3kyYitZdmhy?=
 =?utf-8?B?dkFLTGQrSG5ubkpab0FPdzBiTnRvQStIcEU0aDlabTY5ZlR2cGpOejF1QUJw?=
 =?utf-8?B?bWVUcmNYMktWclo1VDN6b0dWZ2xYY1dXY0FCY0E1bVNJQkVuWWNsUWRJRldT?=
 =?utf-8?Q?36rRuIFgPVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVGZzEvWDk4T05jaDI1clhuNDRGS1BNSFFLeElmZlBvWHNZYXFjMDlTbkZZ?=
 =?utf-8?B?aXJXQTRibVVOWnVWZWN0L2I1V09TSnZqWmxmZFA5ZlJjdlFBb1dyOEQrMVV0?=
 =?utf-8?B?UStFR1RmQmVFblpIYUc4dGNTcE45bXg0TzZHSUlUb0g0M2R2a25VUkJZWGtu?=
 =?utf-8?B?dmdpUFNqVnlKQXJSWVlGZ01QVlkvVlJxZGo1TytNeDNtNGxBemoyZHhNWHlj?=
 =?utf-8?B?QTZWRUV2VzQ5T1VjaE5UZEdPcnQ1SzJ3MkNubWkvalpHOC9wRzFhc1ZiQW5r?=
 =?utf-8?B?dEE0UUk0WS9FLzVHMm5IMU1pM2psVWQwdW85T04zZjNUcktpTCtHQ29yb2hY?=
 =?utf-8?B?RHkxYUlSTXd2S05ic01ibEp0N1J2NDYzbHdVZ0FSRTAyV3ZCWGl1Nk9xVHBV?=
 =?utf-8?B?ejhxajNhYzg3ZTJrcWJFNHNZQzFQcmg2QTkzV3p4SGJUMlBhdkpjN3QvZUFl?=
 =?utf-8?B?bW5ZYlpOMXNpTW1LeTRtYUVxNm1TYTZ2L0N2dWIyT1IrR3E1T2NPeDNTcHVV?=
 =?utf-8?B?VW92YkVNTW1ERlpFb3lDSVZNcGFPTVViUWFSOHV0ZisrcllydXRoa3RHMlQ2?=
 =?utf-8?B?V3JkWm5SMUc0R0JoeEUySUhSQlNGKzhCUk1SdFN4SWYvd0hMdmhDeHRpanFY?=
 =?utf-8?B?UU1QWDJRcVUxZVhUaGd6TTA2YUwzcC9rNEJ5SEFhSmpvZTM4eXVvQ3dmc2N3?=
 =?utf-8?B?RXNsSW5TOENGckxzNkIza3FaS1FuUGVEOXljT0JSa3R6M3hOZko0eXhscFJM?=
 =?utf-8?B?a3l0MCt4ZXk2SnNhd3NSN2w2UmpwTUppSlpjYU4vdDNwRHVzY1I1UjVLQ3Vs?=
 =?utf-8?B?Rk1TcUZrd0IxS2V0WEZudVA4YzNZZENiYkRmZS9DWnhZWlo3WFRMQkxVUlVx?=
 =?utf-8?B?WnRoUVdLWVBzT0txZEU5WnNLQnpBNGlZWjduckxlRUNYRkZCVVROV1Rkemph?=
 =?utf-8?B?aXdnaGlmOWNrZ2l4RzUyL3hsamdLbUFFaE5EK2p0TXc3OFBSNjNibXo4Tjd6?=
 =?utf-8?B?U3lxdFlYWExKNGNOZlZSL3NzV3A0VW9PZ0lrYy9sVWhYWjV4UGszQUlKUnly?=
 =?utf-8?B?T2k4VmQ3M3RTVUhxb1RpV1BjZDl1UEVtdlJsa21uOUJpdFo0SklPdjhzb1Vx?=
 =?utf-8?B?S3hHdWpzR1B3bEFUV1JUSWNRRlNrNlZNRVQ0OUpuV21JZWR6bmNOR3lON1Ru?=
 =?utf-8?B?L0pUOE5RelVvTkJwTkh3ZHFrOXo5VFl5czd5M2t5MllqcE04M0lTcHlJbkZM?=
 =?utf-8?B?ZEJ4enB3cHl0ZGNVNnFqcnhUMlQrczhCZEFnMXZoL1ZFZkpmZHVZMHZoZWZj?=
 =?utf-8?B?K2lzOEV4emZhaVI3OVdvUlpiMWxrTFE1aExrR3JKVWdNaGViWjRCOVoxZExu?=
 =?utf-8?B?TmlFa3c4cWNBNkR1SUlibWg3NWV5WTFZZ3VacXRUdFRpNUoxZlJlaFNFSm1k?=
 =?utf-8?B?SXFteGNSTmFpRExlZVRRU3BtYUpEcTN6V3BHRWcxUWxjQXQ4TUl2VlRZMEV6?=
 =?utf-8?B?SEdGQ1JrMGlCWnNSa1d4bW5jVVJkbjdVNWUxUW51S1lheHdqK1RxSmpvRStO?=
 =?utf-8?B?WE5SUUJpZ0Zodnh4WUFlSzZkaUNTU1lhL3BLbXg3d3BrNHpmZEFTTUFpNk1V?=
 =?utf-8?B?NWU5ZEtkYy9PMUJaZkF5bjhuRTNXWUFaU1E4S0Ftc1Fwa0pKWWZjOWhzZHl3?=
 =?utf-8?B?T2RPSFkrUm9TUG5XNHphdndnRFpvTncrVEE4MkJLcXVUL3gycFVVYmw4Ni9B?=
 =?utf-8?B?NnZSQzFIS0VlYU5CU1A1bzVNSDZ6Mjg0ZGMyQnYxTzFkSnZnZHBvY05ab2Qv?=
 =?utf-8?B?WTZjN2xSbkZoNUhUOERSNTVGTG5IRENJUldSMFhaaUNVM1RhZ0I2eXBUMEI0?=
 =?utf-8?B?bnVUUkVTQXhxRjlRdWJqb1hqNm0yTDFaOTIrN1h1N0p5RDgzWjBWYjdhdHEy?=
 =?utf-8?B?eDdWN2RXWW96OVczeVFSSCt0VXgzN3V2TnNKMUhBVGcrYUFBMkNsTzlJRWdX?=
 =?utf-8?B?dkxTMEtKdVNyd3dBOVR3bEJma0FBU1VCdVd1ZTJKQmJzM1RtZ21FTXAvVzdO?=
 =?utf-8?B?QjhsUGIvQmI5a1hOYzZnRE8rSVlsc2p6TWRaNjUyeGI4V1pZQlJkZWFYZS9E?=
 =?utf-8?Q?Q8As=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff92900-0a2d-4f9f-fbe3-08dd912e8b65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:25:25.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXrxWbRbnOw7+cF4xd65ejZlwkdUs4DI+6I7Vb0emOxKk0I7rOcOzdHTehqAWAAW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/sync_file.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index d9b1c1b2a72b..212df4b849fe 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -137,8 +137,8 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  		struct dma_fence *fence = sync_file->fence;
>  
>  		snprintf(buf, len, "%s-%s%llu-%lld",
> -			 fence->ops->get_driver_name(fence),
> -			 fence->ops->get_timeline_name(fence),
> +			 dma_fence_driver_name(fence),
> +			 dma_fence_timeline_name(fence),
>  			 fence->context,
>  			 fence->seqno);
>  	}
> @@ -262,9 +262,9 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strscpy(info->obj_name, fence->ops->get_timeline_name(fence),
> +	strscpy(info->obj_name, dma_fence_timeline_name(fence),
>  		sizeof(info->obj_name));
> -	strscpy(info->driver_name, fence->ops->get_driver_name(fence),
> +	strscpy(info->driver_name, dma_fence_driver_name(fence),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);

