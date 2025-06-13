Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3DAD94C3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC210EA33;
	Fri, 13 Jun 2025 18:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VOiwh0Cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4C910EA2A;
 Fri, 13 Jun 2025 18:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRFDoIdW9BJ2mlKeAYeIFRUaVk1yWDkYvFugRykRoTaCQpTDrvqj+dTjBJlEHK5mAJWlMzcM2/pfX+Q21x5ISaME3iAW1ECsdOJnPugiKdHiZgoGXXskkuy2FMrryz959cOk03hYxhJBAEdwlk+BsdwA7RQgLe0BLESCeR77/1eZ74JnxGDgo9hxpqO6ji8PEv2mMbClvHycwSHCk5mJTjx4gnDPvYyAMA5lPTbnpQ18KCG561EKuaKr8p/LeBaBvQ5QFjCVPNbo/i6gYJ54LROVnqEyJbL36EFDC03zwm4bUjtfMKlKYhcAs6C8XcLZDVWLbki4A7jpwebRaT9+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aypje2J7NhJ+omdQdCg8MH6sMgJU7wTkSN5Cw8Bd4s=;
 b=cvY/o7fCQBD14fvKrBvPaArpbtQ9jtuS8wG2+STwBfuV3JNPcaXsCGtNgzgQj0w8ADHJou9qjo9bEkiTNO4xsRGj8JOdTwCggk4fi3qap44zMfsYe+j10xO1T6xvez6m2uCVgkKp4Vm9L77v2kqX/J/4SC/K4iEEVeQ8V2sJnCIULGpHttQA5PUeJOKit18PTcSXoMU57jlfW8u+xvGKfQjFqzlAa5Qik+COEeb/sL19hVrryTCGE9bIM+r+j7xhApkqhdhz/OxdzUaolTaiCRHEKltO2dJdZuVKnJ+NKwcX7VelyZ5MG+mGZJRP5pyNGL5qNjnyjsctPgJfGGHyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aypje2J7NhJ+omdQdCg8MH6sMgJU7wTkSN5Cw8Bd4s=;
 b=VOiwh0Cq2YmlbBNsoHy6Roh9x/Grp16yWPhmTtqfH2F4YW7DgLkmvJPnw5HLKYES06KY/v8GTT8dRYWN9oLMNvaXR8oN6Tq2yrAcwKo+hvFm2+Cz8lmDFlnKBAdIGzlwdLtWdieKRnE/kPwwWarP623ZEVqs5/SbsUBEnkpXyKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 18:50:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:50:11 +0000
Message-ID: <df5d9e45-cdbd-4571-832b-79e2d8d5d769@amd.com>
Date: Fri, 13 Jun 2025 13:50:07 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] drm/amd/display: get SADB from drm_eld when
 parsing EDID caps
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250613150015.245917-1-mwen@igalia.com>
 <20250613150015.245917-8-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250613150015.245917-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:930:8c::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d4cb4e-f1f4-40ec-29b2-08ddaaab204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnI1Y3VjYXZZQWN1N1YzWTkwQ1YzVDA5UWE5aHo0UW9zT0ZhU3RLTTNpcGZC?=
 =?utf-8?B?aWdNbi9NaEpSZFdVb0s1eGVURlpzbmY3ZTRnd2lacUUxSzg2MFNJNGUwQVpQ?=
 =?utf-8?B?blVLVnM2QVRXdWFXb0FLL2J2dDB3UGVEQkFyZFNiSlNnTDJYcGdZT3NWckxt?=
 =?utf-8?B?NjA4ZU5CU3JvbUNiL0lrWnlwbWVObUNJVzNYcWFHT1Y4TGM4Zm5FbXM2ZS9O?=
 =?utf-8?B?TU83ZERCNkJzN3orQ1QrK0tJOFhOb2NOQlBHRUlSTHA0Y3hWRjdHNkhRaFlC?=
 =?utf-8?B?dXlxaWxWQVlLUy9PTFhDWmZMcGFNVkJodFFVenB6bUwzNFpTRlREcUVhcCtz?=
 =?utf-8?B?dG9LanBwd1phRmJiLzh0a1VVMEdseTNxckNqeTFsbUwzYUdxb2p0NnJXQ3Jm?=
 =?utf-8?B?WE90eHU0R0JtUHBLL1BtVk1aQ2NSWHNJamM0MXQ2YitsVDVXMWUvemF2K0ly?=
 =?utf-8?B?VTZxbCtKWHp5UFBKYXU2YmFhTFNTdk8wTjMwM1A4RktVTWtYTjBKMC93cFdZ?=
 =?utf-8?B?WFJrYXBoV3dMN0VJRjR4R0xSc1dnMm94Z1pBNnd1MWF5cFFkL01GeVZQY1JB?=
 =?utf-8?B?QTRhWTNaUVlCT1NPUTd5WE1zQW85ZEtUVzZIV0hrZnVSbUR3cWRYZUJHWTR1?=
 =?utf-8?B?ODl0SVRUV0VkTm9vSzRRMjJ2NUN1NktWOFB4RVcwMUtqK1pocFMrTldBT3Y2?=
 =?utf-8?B?Lzl4d2dsWEZrOFkyOFhZY09WSTRmUGdhVHE2UzVIVGQyWUtXdnd2c2VrY1hq?=
 =?utf-8?B?UUpmZjNYUXR1czI2MkJhRVdkaE1wV05xVnJBYno1Y2tKM2JVZkZwUDl2bEtT?=
 =?utf-8?B?YWI4VE9kOExpYjNlaEFhTWJ2dlY2ZENFT1BQOExrNGFZZ1ZXdlJqSVRkOGZU?=
 =?utf-8?B?cHUrTVQxeEVjUEt2aHVCQnZBZkRuU0U2U1JHL0plZnIxbWFKM2Qxb08xVGxi?=
 =?utf-8?B?VjdUL3hhOTY3eFMrNmRvYVhwMEo1NkZKd3NwMHowNGR0ODM1WkljL3pxWGdV?=
 =?utf-8?B?YnNMSElqUFRHRXB3VXdOQkVyNlI1RlQybXd0d2RrcVF6RWhhRmI1TXRPRHY2?=
 =?utf-8?B?WXZoY3l5ZUo0S0l3VlFBNjkrWXhINXlnd1VJc1lZTkFnc2NvTEVMQ25OdU8x?=
 =?utf-8?B?T05ObVhLZ1hZczY3STJRTld6aEVzc3dRd0Radlhwb3k0c2ZqVW9IQ2lxYnZB?=
 =?utf-8?B?T1FkV3o3ZytPUXdZUzIraE4zSnhLSmVoaEx0R3M1b256ak9LclJRWG4rWFhT?=
 =?utf-8?B?OTlBVHhTdnpsbTdzUkxBb20yS09qOXR0Z0ZkVFBBRlJ3U1REQmtQMm1FOEM4?=
 =?utf-8?B?Ymt4MkRkenZMaG9ob3BLb0FXNTR2cURxYW05cEwwdHlpSXRRSkwwL3gyQUln?=
 =?utf-8?B?bnZMVUY4VzV4TG8zbjRUWGRvUDI2TVBQeTZyZmJXSExlelNHK0RNWWZkKzhn?=
 =?utf-8?B?amFDK05hTWpqTzloeGtUVFByVHlzNG5TR29pWDRUNS9VRzEzQUZESUdkZGRr?=
 =?utf-8?B?aVJaL1ZrVWJHYWQxNDBPQVFIdFRUNGRTKzBmTVhyVTUvaFowVGU5VkFCa2Zl?=
 =?utf-8?B?N01LcytDZmNzTlFyRkl4VCtBQklpaE1xMVM2bkJTUzdkQ3F1SmJZeitieXZY?=
 =?utf-8?B?MGFtS2N2djV2VGRiSFhoQXc3eEhYeVFrUzR0YWpEVFlaSjNvWUNlQU8xRnZG?=
 =?utf-8?B?TDJCRjJzNTh6REkzeTNJZUxiVmc5NE1yaytISkttTGpkcWRzYWkrbmkxL1lO?=
 =?utf-8?B?dnJndGk4eTNld1JjNTlLdzJ0RE1BSWZvdlRRWCttMGtKcTRSNG52cU1Zdk1v?=
 =?utf-8?B?clA3b2pxNmFkVXlwSEQ4aUJwUXNVT3RtSHRLT2IyT1V0VG5CVnY1WFpnSExz?=
 =?utf-8?B?YnNIbFRhT2M1Umh2S0lvS0Q3THV4aWxJVWwvQWhZS0QxaDd1YUhFazdpWC9R?=
 =?utf-8?Q?B+Vu2wu88vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUhBRTh3OFU0cGFzZ0FHRTI0amI3NWtGZWlseHU5SjRBMmRiTzNHVURydnBP?=
 =?utf-8?B?VUo2S0tZdnFrZUc5NW03ZHBraS9lVFh5OTN6QW5QVUkrdVlxTjNrTmFESlVD?=
 =?utf-8?B?U1pwQjVETmQwemY5b1FjYWxQVnpaWUpTUUxualZOTHFFSW9JUGNJaXBycHAx?=
 =?utf-8?B?VTNjMjdxcFA2aWFhMkV0ODRtTkRTZjVZNFV1a2JyN2dxWEI0WEhkaVBCK1Nq?=
 =?utf-8?B?bkdwSXNkK3loWW91aEQ3U2hwMm1wM0tDMHgvWnNDdk9QTXY1L3lNbGI3QVR1?=
 =?utf-8?B?amp1eUN5NVZ5b0R5MmoxcllCKzdRa3lzNmhEaklzSzZmSVpnMmwxeWdzK3Iz?=
 =?utf-8?B?SWJmdnN3ZHZzWHZWeVgxb2pUbnhIbEc2cFo2SFptUjQrd3pjdmJRVFRPVWND?=
 =?utf-8?B?VTZEdnlNTVordnRwaVNpNHdrRHFxb3A4dTlGOXRNM0FjVWlNUnBPK05LM3Bl?=
 =?utf-8?B?ZVl2KzRVR0pWS3U3bG8xTGx1K2FBc3B4UFBKdEU3bjI0R0Fhdm42T2NPM3hh?=
 =?utf-8?B?cG9SMDQ5UjdZU1JRdVJrQW9kdndBRjNZQ0JCWFNxNVFWQ0lscGR4amxtdkF2?=
 =?utf-8?B?eGFTa2NGOU9wS2pucHdlSEQrWnhoMTVMZ2hadk9OV2owcVppWnFHVzR3Y0FN?=
 =?utf-8?B?VkJzUlJtMFZpdkFHNndTQW9WcTVOR0hYc09HVzJHbnRvbGxua2t4a2twTGRH?=
 =?utf-8?B?bHdzdDkwOTdxVmRmTkhHYjYrTUY0UXdBMTJncnptbXEzNE8zSklqck5YNmd0?=
 =?utf-8?B?VDJxQ2gyY1o2RTBSd1VEK2RnekJJVm5ud0RFK2prRUlPT01FR2s2NkgxclJ2?=
 =?utf-8?B?NmRLazROa050OFE1KzhuZnNwS2svaUY2Q210N3BJclhpNmZOS3ZQT3BHVWZi?=
 =?utf-8?B?aExGRGZMZUhheDF0MVliTDFaZDJ1cWFQY2RrYnUveUViemxndkZpbFVyQ1R5?=
 =?utf-8?B?QnpWSFdMQzRyaTZzQll3L0J5L3kxWm0xSTBvV2R5Z200ajdwSFVTamFRZ2N6?=
 =?utf-8?B?UUM5dVV0RXN0cEkyazdmcFdNYSs1eDRtdWdQUGxjVjByL1E4YmtkbnhMTzFG?=
 =?utf-8?B?Q3FLVjRwUFp6SWxMT2tWSXIzR250RVVSbnd0Q2pYa3FIdFAyS3ZDNkpSZnBl?=
 =?utf-8?B?TTB0cUF3YXNqMWZ1emwrcDZSRlgwczZUS3FGOWFFTVpaN1FYbnFoRGM5M3RZ?=
 =?utf-8?B?NnBUYTlZdFVBRmVoTkZKVUh0U3RaOFJ0S1ROaFo1dlVoLzhMMEZML3hmSXJ5?=
 =?utf-8?B?SUtmM2dYRjQ4N2xZd21GUm1JNTd6UGNPL0RaR2lNdEhWVUw3ZFdSa0o4TXVz?=
 =?utf-8?B?YjBzWDQrOE5DbUtBQmZtc3RJL25TcnppWjVHRUFrNENYcFdVVnNyajJWcGdH?=
 =?utf-8?B?a2tvL3lMS2FMNllaRE1WQk0rK3JBOXlJcHpmWURhZC80S200aGY5TUMvNENo?=
 =?utf-8?B?K1NBcW1JMVd4MmFrTlgyNFNFRWdnS0lRWU0zS3Azc2Z3WEZiRWRZOFVGS2hv?=
 =?utf-8?B?bXpkVW95d0VFaS82VG5ZcnQ3WlJabjUxOEJtWHpkNWlXOXBVOElLbGJSSld1?=
 =?utf-8?B?d0lsT09jK0hLS1ZtaUQrSUVJQU9ERUNncU1lN3hQbmVlVnV1QkVycmFIbjhk?=
 =?utf-8?B?VkR3MzIzTTg0QnVBY0d1YjlaR0dLM1Z2bFMvaTJrUW1HV1p0bHpvZjFNbzhu?=
 =?utf-8?B?Q2Vhd2xNdXhFMC9KN0YyMUhIOG03ZFRaM25VRnhwczU1bkFlQXhhUkpxa0ov?=
 =?utf-8?B?NHZYQjZ2R2ZwOHNNbkwvTnJRWWF2NytIK1pvZnBQY0RPSFJZOTdma1dqRmFq?=
 =?utf-8?B?OUJML25jZk9qb1hmKzNOeFBtYkN1dlN6d2VjbHdneXlKMGFKaVdhQkphQTJL?=
 =?utf-8?B?djRrUmYxNHlSNk5RNzBzTW50RmllbU5mT05yWmFhcUtzZ1pBTkNyS1lFdVBE?=
 =?utf-8?B?Sk1COUIxV2g0VmNnc2lrcHprQXZlWHliNEhtKzhMb2xrSGVpTWxEMkhzYUUv?=
 =?utf-8?B?U3RYNzlBUGJJQ21Rb0w4eElhN1VFT2RpM3MySnBjaXphMCs4cjduYk14M2ZG?=
 =?utf-8?B?aDBBRlAvZmJVZ1FMVGI5d2I4UFIxc0tZdktGWWxDb1dXd3ZwQUNhcmRtQUQ5?=
 =?utf-8?Q?Plexi/I8htMzz4WtQ4ndFpcus?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d4cb4e-f1f4-40ec-29b2-08ddaaab204e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:50:11.6259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ix0aNQ+t70/setbKPlZ54G8OPvgNF3hVBGUmWlkvIudUcKk/naMz5/gHOR/HfALz84ljzkTdhK4ctElmsBUJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
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

On 6/13/2025 9:58 AM, Melissa Wen wrote:
> drm_edid_connector_update() updates display info, filling ELD with
> speaker allocation data in the last step of update_dislay_info(). Our
> goal is stopping using raw edid, so we can extract SADB from drm_eld
> instead of access raw edid to get audio caps.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 10af9db47c39..e7cfbee6c67f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -106,9 +106,8 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	const struct drm_edid *drm_edid;
>   	struct drm_edid_product_id product_id;
> -	int sad_count, sadb_count;
> +	int sad_count;
>   	int i = 0;
> -	uint8_t *sadb = NULL;
>   	enum dc_edid_status result = EDID_OK;
>   
>   
> @@ -156,19 +155,11 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   		edid_caps->audio_modes[i].sample_size = sad.byte2;
>   	}
>   
> -	sadb_count = drm_edid_to_speaker_allocation((struct edid *) edid->raw_edid, &sadb);
> -
> -	if (sadb_count < 0) {
> -		DRM_ERROR("Couldn't read Speaker Allocation Data Block: %d\n", sadb_count);
> -		sadb_count = 0;
> -	}
> -
> -	if (sadb_count)
> -		edid_caps->speaker_flags = sadb[0];
> +	if (connector->eld[DRM_ELD_SPEAKER])
> +		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
>   	else
>   		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
>   
> -	kfree(sadb);
>   	drm_edid_free(drm_edid);
>   
>   	return result;

