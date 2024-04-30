Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95DE8B7FF7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 20:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F4D112117;
	Tue, 30 Apr 2024 18:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kT+FdEVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B96112117;
 Tue, 30 Apr 2024 18:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfI1wHeNteZQRfhT7x6ZpDBoqcpeL0+A+bgY/ukOyWkd74aXoekl7A1kt5rJ3jlGfcsYybqhj3a6lupQL9Ic0mRVWFpjHG+y4hScBSYzDYp/QPzB2Fay6h9ub/87EFEQdfxLyyYmDz34aZp6fr2vIgwvTmcEeRZ4ehY/IKaLPa/osUygtejWw6LAJ0FE+fq00QCwBIBI2q0tyQDfPgxq64/5Fmii7C9Syng/wdum8VNuE7Ytg4xbtUPyzDpcm6m4L5AOvTkwNIOSIR5Rcsg83R/MzIdeX/UDVtiy2McLZlRhPIgsYR55Wg5w/bYGYjiRfMV4AUoDTjpFYf8csXENYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0Bbxpg11H5Fl0E3flqja0q+RY1QdBHWr6HbAxj3I6Y=;
 b=XaPxUmxoFs84zRTA85HDWYRcEvIejqmrZ+XIYw4NTUN3EsXYKx9OG2GGJNdTVvwXDZVcVTGWbgp73gaYC9OiC8Q5cu6gQkz+ZjvxKHnzyKS3SwUk7BjlMpTmgcgaJDCghBXAeSeBmpGSExpx9fgsd50KJ75N+jmU48wphtfl7dwcMoU8YPfMNUK2t9QKLA2ddQf3sK1ErPrJE+YEf3D2LmvXHSim5NKxk91srqV+DPvVAGTJFEAZv5S36SRF3bth15Kd5zI4VEfHMsOnF9lQ82SX6PsrSwfbqWAulbOwM855haYbuW4IiLJ/Z1QGETBa0N6hAIOiZDiryOQQRQU3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0Bbxpg11H5Fl0E3flqja0q+RY1QdBHWr6HbAxj3I6Y=;
 b=kT+FdEVrlPQiuDqX/A9RIu2JU5odukOxXECbU29flBZ1Pa2H+kvYafO+2o7luGay/XIoIMlFyJyuvdg7xkNdM69DGHTfvP5A8rEndJLW1OPUH+lYq91kL/M+I5Mp8qjeRSoNCx+flJJeCORKPvV3GhfPn3CSWwiAfy08zrNt9XI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 18:43:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7519.035; Tue, 30 Apr 2024
 18:43:36 +0000
Message-ID: <cc497033-c2b2-4388-9ac2-1d2013edda16@amd.com>
Date: Tue, 30 Apr 2024 14:43:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Avoid -Wenum-float-conversion in
 add_margin_and_round_to_dfs_grainularity()
To: Nathan Chancellor <nathan@kernel.org>, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 arnd@arndb.de, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20240424-amdgpu-display-dcn401-enum-float-conversion-v1-1-43a2b132ef44@kernel.org>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240424-amdgpu-display-dcn401-enum-float-conversion-v1-1-43a2b132ef44@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::44) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: da90dd51-8d78-4970-7598-08dc6945719e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTZyb0dZTjlGa2kyRVVUN3NaSDhqRnA0UEJLZ1JTNU1Ub2NWL1M1UXFhNEdK?=
 =?utf-8?B?dDNBSmR3Q3hTSXJWZnpvNFBWSGdYeHdrUW1ESjltem9ObjlrZTRadmtXaHQw?=
 =?utf-8?B?TXBicHFIS0preHBmTUpXNlEzbGRkRW1LZUYxL1FQd01tM25nWHlrcCtWUTUz?=
 =?utf-8?B?eEVtVHVqQ09LbkphOFJSREUzQllSemVDUDlwVGpJQis5cDZ5TUZsYWliek5Z?=
 =?utf-8?B?Y0JEMXNBRyt0Vks4ckYyNmM3ZFJrelhuNlpSUUpNTmkrVVpOc3Fwdk0zeENy?=
 =?utf-8?B?bXNjZnd5eHkrVi9JVEU5T096cHdaWlpLMlcxYUNqMkY4Y3o5VGhzWVZrODVs?=
 =?utf-8?B?YnowdVdjWWFhS253Q3huS3dLdFhxM1Z1MitJMkk2Q1RoQzJKbnNBOXorMUhu?=
 =?utf-8?B?Y1ZUYVBZQ1RQdmllT3RIUnhKalVrR3piTlFLVVJWQWtIWFhxenZWK01wZERX?=
 =?utf-8?B?T01YOTllME8vQWVOLzU1ekRhYURFakRMTFR4U1hXcWI3dVZCYkgwd3pHV1hu?=
 =?utf-8?B?b3pPcVQ3R3R4K29udGJXSmJnV1BDSFFienJUZFBjTFlra0JHQjhYZWVrK0Y5?=
 =?utf-8?B?cGhlSmthUWNta2w3VmpsM3dHS09LUUlWQVlzVWx4TzlYcUQ1NVgrcDYrb09m?=
 =?utf-8?B?M3ZublNSbEREVHVhdG52RGlEeHlnZUV5TDVvaVlwYlJvZVBPb3F1RkxoSGpw?=
 =?utf-8?B?MlVCWmFSTVdsTGZiM1dQZExWcEw2ZFFhNUxtNGJidlkwaExNRFJ4Ym5FMHhL?=
 =?utf-8?B?bDRoNkpmN2FXVDhxclA0TkJ5SXJJdHlnaEtwTjBqNjU3aGRkS3NRK3c3bzhj?=
 =?utf-8?B?R1pWd2hYUUJPbnpLYUI3UzhlRnljRzVYWXFiWHltSjFnMEVkQXRPSm4wUkZ6?=
 =?utf-8?B?dTVkRHQyNkFHMEd2aUt1RmV2SXRWd0ZVRHlFN0trQlFpR2ZtaTF3azNQTGpO?=
 =?utf-8?B?M2kyYkRPSHBjaU5vT1lCQkZ2S01UZG5DVyt4NjRwbW5zT3dPQmozbEswazZK?=
 =?utf-8?B?TCtwRURDZlZSZG5DYU51NjJ6ZWVYNG14cVkrUnVDMzdia0dKNE14eFBSaERT?=
 =?utf-8?B?MkNpNm1LYkNMNStiNDJlVS9iM2JYWjNvYks2bHFnZE8wcEUzakUrKy9iVjZk?=
 =?utf-8?B?bDFPMnFFMlY4b3hrTjJaLytXSWxxU2Y0ZWNGcUg3TWptVXhBOEI0OFA1NkRP?=
 =?utf-8?B?bndEMlhob1JQZFdWU1pOZzBvTzdhTVZaSG4waUpBMWN2UTNZN1dVb3dQeDho?=
 =?utf-8?B?bm85NENFeHk1MGh4aFlEaVRIZWYyUHlWaTNFSkhmbE5mOHppeU9xSTNiY0dl?=
 =?utf-8?B?SjhQZVQ3SWFhNGVRckVkRC82MkFJSTJkamQ2S2tPc0ZwT1lsUElGa1dxK2U3?=
 =?utf-8?B?bjBnc0d2L0xSdnBrbXl0aC8yRFptM3RJVytMdURGRlI1ZEJpcU1Ec2NEV3Na?=
 =?utf-8?B?Vlo4a0pOYnNzSGg3N01ucDFnNElhSms2Zlp4NS9jS0xLcmRCcVFCZ3lmMVYz?=
 =?utf-8?B?VDVaampOTm04V0dTSGpnbWpjNGhTM0lRZW4rQ1NuRUsvWEdxdzQyWnRwWkk2?=
 =?utf-8?B?Y3FickF6alA5WXBHenFCYVc0cDYvaHRzV1pybGxSTW8zQWZzT3RtM2dOMW1S?=
 =?utf-8?B?eUdqaFkvVG9oU043M0RZeVhOc1BSN2JMUmN6S3QxaFBRRU1qMFdLNUJVOFEv?=
 =?utf-8?B?cjA0ajNta0NjZ1ZiakZjem8zM2hPbDlLWHJ3dlVkZmFVNnluUGFJbTd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXhkT3JzcUk0N1pqTmgyRGgwRUxsNndUSVp6UnZ6ekIwVWJRWmNOOTczaHh5?=
 =?utf-8?B?ZHpIT21yMy92T3BEVHVFWEt3ZWpvbzFRaW1SMi9yT3hQWi9ERFdMeSt4dnJi?=
 =?utf-8?B?dG1weCtFaURvclJMNUF0cVpOc1d6UnZhOWdJTzVQMmtyU3lvZE11OGZxbWcw?=
 =?utf-8?B?V0Viczg2ZytieDI5cVAwb2VFazdUMk9iWnVkd2ZaNC9lbmNvWXpnRnlkNWV6?=
 =?utf-8?B?M1ZtM05LYUhPeXoxWDk3RlNFRk1Td051S25ldFpzRm5pZncxRlhzT1ZDTUFw?=
 =?utf-8?B?K1c4d0ZvR0xKZEkzcU5KMERndUE5cHl4VWFyVGRkWSt5aGZwc09qSnZza1cx?=
 =?utf-8?B?akNOcmU5djhjWDJ4WFVWZ3J0Y2tKNDVvMFJPMkpSOVRFU1JMZUMrTEpYM1oy?=
 =?utf-8?B?bEQ3VmhsVmtjNkJyVTV2K1o2L2pFNi9kU3hjQWhidmUvUHI5K2lGUXdLdUFG?=
 =?utf-8?B?SjdlVlE2M0daM3NlNVBxOVQ1TURYTTJIZUg4N1h4WElDYWh5bHVvT0VkMnI4?=
 =?utf-8?B?ckRVNjFjdytISnRocmNqcEZOWldsWGNBWnAydmhHbGtuempNazgxVnNzbjUw?=
 =?utf-8?B?ZHpsZlJhOElQUGgvOFUxVWI4dXdsTHF0N2pzZmhhdjJnN2ZyRlAxQ0wrOHdv?=
 =?utf-8?B?TTNOVG1kRG14N3cxUy9DeU1UbWRwNFZJbjdvYWlGb3YyRXRINkI5clg2M0VT?=
 =?utf-8?B?WkdMc0N5cVg0RmJFVDNJMFlYMWJzVjVIb2o3RzI0S1dYb2NBM2RuR1hZeUgz?=
 =?utf-8?B?Ylllb2x1WmwvdmF0KzRPdXUwV3dUWWdYdTJ4bVA2QjQ1djIzU08vcUF0RkRs?=
 =?utf-8?B?aHZJMWYxNWFOdVhUUW44clg3a0xxaWpkZDMrM0dnYTRCSENMSEpubWJLQ0tR?=
 =?utf-8?B?OEszR0QvZUkyUU9HcDdmRjlhRzFmckxMUmxFdDdvdmNkM0tndkJwMGpyVU5i?=
 =?utf-8?B?OERiNkM1OURaU1Y2cnVtb3orNEFLNmFDU1JTYnl6MXdwMk1tU2pjUHh0Q05I?=
 =?utf-8?B?Q1c2NEllYjVoUGg2S0tkc1YyVmp5emtsMExneFN5aTdUVnJqdjNtY3pObzZJ?=
 =?utf-8?B?RmFYU25KaFpXWkhIalQxeW5hNlpqUzFrSXg4enpZTXhqemVDUDZSVFdHNUxL?=
 =?utf-8?B?bDRjazc0b2thdXpLV0RKcDd3bGIwR3R2M0RiSW9pbXN1MGtKd042enVQUFhY?=
 =?utf-8?B?eEdVanZLRm5wMURZb21EcUxPYzRFYTlxcGhqR2VHUi9IS2xUK3djQjhqS3E4?=
 =?utf-8?B?azhXWXBjUlFmRTVwMG9Kd3FURys5c1dDZDVWbElmNHRvQVpPSUM4c3RqVjg2?=
 =?utf-8?B?SEovbVpsY1dPSEpaRHAxK1ZNcmtHMlNKbzVVZWZDVWpnN3ZTdHhMMlk1MzR2?=
 =?utf-8?B?K1dUMWMvRGIreTdvUE1FQ3ZOWGZGa2Z6OHB3ejkrNzdGOWtxRitidU1XNi9E?=
 =?utf-8?B?QzNjUXJadUdEY1AyTUR6V1UrSkRicXpiai82NWZ2MjlmRGVLUVcxV2k0dHha?=
 =?utf-8?B?Y2Eva24xSTBEem9JTGlNWU1ERjFla3ZLMHBRa1ZIVkZWKytJZkwzMzMvVVF6?=
 =?utf-8?B?U1Zyd3AyM2g3b3NRSXU3SnU5Yk5NbG5jSUwrMUZlOGE5bVpXLzRKWEMybEly?=
 =?utf-8?B?QzFBbkM2M3dCUVoyc0xHVDRFUU9MUXE4cmtLZVhwWDQ1MWw3anpXNHJMRC8v?=
 =?utf-8?B?L2xmZ3N5eWw0MkxMWElLcHIydVNDS2d3V1JFc2tuMVZuU0drYSt1bE5hM1NK?=
 =?utf-8?B?akRWTzhjOHJmVjhkYXZVdlhZNnRKRE51c2pmZkxzS1labENUWDRZdnBrLzdL?=
 =?utf-8?B?VEpaUXJ4NG9pS2pOTDFBUFl0YzBHay9VSXdYQ2VxdFdueUwrM2ptK1JNZ2xo?=
 =?utf-8?B?WVAwNjBFRnpTb2RaM0xGU2dkajAxTWNUS09DOU9sdExTaU5IQTJZVDFKOGFr?=
 =?utf-8?B?eUlNd0tSdGFkVkRZMHFWL3RWcUp0Q0RSR3V2bFB1WFluckJWV0lJdVI4azZS?=
 =?utf-8?B?ajlPRnJvVXdrZlZUZUxVUkgrNjFIZmQrT0kreExYV1c3MGQvaW9UZDJrbTN1?=
 =?utf-8?B?cHhmbENwd0VsNDA3OHA5SGE5WXlSb0t6VWd2RDVUMTR4MEhJQ0lBYklXcHhC?=
 =?utf-8?Q?/JdI0r+c6vwuvX9gT7eXm/zYk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da90dd51-8d78-4970-7598-08dc6945719e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 18:43:36.0896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTq1yMaTh5DRkPG5+j7m0I58OZvaqKthjf5lN6HyrcIM45obie4ArAV7vBfAsG3r/fgYEV+XhL8YB9FaeKCiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865
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



On 2024-04-24 12:14, Nathan Chancellor wrote:
> When building with clang 19 or newer (which strengthened some of the
> enum conversion warnings for C), there is a warning (or error with
> CONFIG_WERROR=y) around doing arithmetic with an enumerated type and a
> floating point expression.
> 
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:181:58: error: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-conversion]
>     181 |         divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> This conversion is expected due to the nature of the enumerated value
> and definition, so silence the warning by casting the enumeration to an
> integer explicitly to make it clear to the compiler.
> 
> Fixes: 3df48ddedee4 ("drm/amd/display: Add new DCN401 sources")

Thanks.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

In the process of merging it into amd-staging-drm-next.

Harry

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Alternatively, perhaps the potential truncation could happen before the
> multiplication?
> 
>   divider = DFS_DIVIDER_RANGE_SCALE_FACTOR * (unsigned int)(vco_freq_khz / clock_khz);
> 
> I suspect the result of the division is probably not very large
> (certainly not within UINT_MAX / 4), so I would not expect the
> multiplication to overflow, but I was not sure so I decided to take the
> safer, NFC change. I am happy to respin as necessary.
> ---
>  .../gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
> index e6698ee65843..65eb0187e965 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
> @@ -178,7 +178,7 @@ static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double ma
>  
>  	clock_khz *= 1.0 + margin;
>  
> -	divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
> +	divider = (unsigned int)((int)DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
>  
>  	/* we want to floor here to get higher clock than required rather than lower */
>  	if (divider < DFS_DIVIDER_RANGE_2_START) {
> 
> ---
> base-commit: d60dc4dd72412d5d9566fdf391e4202b05f88912
> change-id: 20240424-amdgpu-display-dcn401-enum-float-conversion-c09cc1826ea2
> 
> Best regards,

