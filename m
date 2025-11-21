Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC7C79766
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB32910E875;
	Fri, 21 Nov 2025 13:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ymn2lgzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1D10E86E;
 Fri, 21 Nov 2025 13:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4kUUxQ0wJAgZCtZ5dz+/ZvSJ6z4LSWD8/AyMQCvv2PWepK/mJhtLRuhA+9PcDZiFfh5AcHHRFtKE1nwIIH1U7uHtsCjAXjAyIljc0B1RkoNMMTgDP4PNtpNDOlgIlnRM0EvuAQ6fWYDCFWP1uT5U/vB81vOu/b+Mj9/tBzHCu9QOTXX6Nz7YFbqcocRvyKG6vDptwQBYICvXtCSc388BBhw64P90XTohryeI1T4+wKaN8778DmKvgsctya1rpePNh01j7ua7wTPxslOC3ciDu0jKrfrNw2ezUcRDLaJ4QnJMc99vVUre+2iPCXKx5qSaOkfE/iBWPm7RI1el8xyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOR2mXTGWUzpqCfkpcsKFpmpD1xqFugIlGW+S0iUhQc=;
 b=cd2tSuq7DmJJK8kzZtHpdcpKKCVdyHBCTn7KyOjTcSF3xpU8GoVTjoBPqkUtAs7Jd1Bmqdf+pyxP30waDgIRe6LLanb29BosJZ7tFI9WVMGqZg/GzKMbT6V7U6dflSwZAHCOzvAksG8H5vS+XnPNrja7UgGEgFemelB04cXDg064uzLJtpLTcWaZfLJ6Fo82XwAv77ibeSDC/PtTtZSQ1+OoC5MKJ9DPx9JlrdgK2z3xpmRi+QFjOG1KTFNsXRLXVbTgKQZmc/YXmwL825AxSWzCs4p79mrYfd71tSfRGkiLAwIMD0B+AuEphQsypXZO902P1s0TzOzMZa/+Xo/Z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOR2mXTGWUzpqCfkpcsKFpmpD1xqFugIlGW+S0iUhQc=;
 b=ymn2lgzmepqMpnAmBOwVCb4BhdOrHpJ5VWBqIqpxVzJ6OhOs44xL99KbuINbBGF6+hVfKzs6RQFL487klknG34dSkhLEdKDZmpLrSbTb+TAUTdOEDSFkRdJmexP9Wz9i7kG95lXbaRV3RBHC4eJfN0Fw4H+eQ5f774N4Rb/lneM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Fri, 21 Nov
 2025 13:35:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:35:06 +0000
Message-ID: <3ce434b3-f495-49f3-87da-cb3ca4d8e186@amd.com>
Date: Fri, 21 Nov 2025 14:34:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/28] drm/amdgpu: statically assign gart windows to
 ttm entities
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-12-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-12-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0190.apcprd06.prod.outlook.com (2603:1096:4:1::22)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 2453363f-5e33-4dbb-f565-08de2902c82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alFPT1hZZnd1V0hhSHdDWlluOUQ1WlFrRmhhZmkwU2FjOEs1clB3Uzd1VVI4?=
 =?utf-8?B?eTRRM204UTNmUktqTG1XR3RIRTBLQk5PVWQ4cXdyQVNINlMrTS9jN09zam9x?=
 =?utf-8?B?UzZUdTNidmdUd1BvMTQxbjNteVpEd05IcVF5UTFXTGlNbE8vcXJnQ2t2RW5h?=
 =?utf-8?B?TDczY1A4WThBazFoVWNhREpObEFoOU0wNjI1NDR6UElGbXJRSWl0aTBRQUhE?=
 =?utf-8?B?SlUzU0ZyY3phaXFsRGh3M3pRd1lBSGFYNzU5UmhMZHNNZ0FzcXRncXBvWnRo?=
 =?utf-8?B?d3M5b2h3d1Z3V3pSQUg0cktob2RkNG1rUGd6QmhsTkwzT0M0S3JncHN6MUxB?=
 =?utf-8?B?Uk5lK2YyU3FndWFwWUwxQTYrMWpkbjN0TFFWNCtTYkF5VFlYUnNjbmN2cXZm?=
 =?utf-8?B?dUt0bTIxazNyK1RET1Zyc05oaGVNRk1HQVowdmZxWU8yOTlZSERySm5DSzRV?=
 =?utf-8?B?RXJTZThEZHJVOE5oWnU3aDhCL1h4RU5DdHNLVkJHT0VrMlU0NVZiUzJvbXE2?=
 =?utf-8?B?cllIVERFcTRZQkgwTHdwTjllOGtDKzZWTUpHUFVpdEhnemJGbC9nYzZOWTBt?=
 =?utf-8?B?SmFYV2dEUFIvcmV4dVd1VGdTR2g1bXozbHdWTVdKQWJJcW5XVW9PcE1OelV6?=
 =?utf-8?B?MDBWbWFJT2hvUDAzOG9talRTeVFhd0k0N01yLzRhaWlVTU8vWnNSVWNKbDI2?=
 =?utf-8?B?bCtldVAwRkNoR0JYcnRwRjNocWIvcWYralNDWGxCRFcwVTRXZXRhVko0WUsy?=
 =?utf-8?B?RGFGWnNVNkdCNkJsRERVNkJVbGxheXNLdE5ObkhkdngvQ1BYZ1Y1T0tHc3E0?=
 =?utf-8?B?UkpSYzdQVHhkZjlGQnlINEZwcXB2RUoxR3A4YnV5bFF0RS91VGpoRks0UnU5?=
 =?utf-8?B?TFRTekVpcGdpd242c2NZNk95dkFYUlZTY3ZUNkdFbk9EWUZXbXZqY1U2RGlL?=
 =?utf-8?B?N0hvaU9JcGtQVmNwelM3dy83U2JickpIN2lZWml1RmhQZGJhUVhlOVFDa1lx?=
 =?utf-8?B?cTYyQU5iTzNpODl2a1dPTlpEWnI5N2ZzY0xnOU5lbEplenlDSkdzNHdmMGZJ?=
 =?utf-8?B?WkFiRk1PcDRuVG9EMHpJaFpyWDd0RCtyNVBCaWNxZGlLVGhhTGNYeCtHRi9i?=
 =?utf-8?B?d05sZG8xbVQvTzFKNzF2RDJtRjhxT1ZDczJkcVo0MGlDZFh0ZFBab1FWeGFH?=
 =?utf-8?B?NDdMV2FlY05nQjZBaHIxa3F2ZFZnY04rL3N3aWltYThMUXJWR0lPcHVjeVdk?=
 =?utf-8?B?dndoN0JVRE5vdGQwNEhBOGFsMG1rbENPK0RFQ0gvbTY3d0ZkamdKNW1KU2dj?=
 =?utf-8?B?U3NEOTVKNmFCTkM3d05MbU0zUTAwSVVIMnhOVEN6ZWhuMVk3QklZNjVta2tM?=
 =?utf-8?B?YzdmbmcrMllKV085RTRLcyt1SDRucFkyc0l1MkJGaExxakJsM0JLUEhqcmZC?=
 =?utf-8?B?K2x4dFJqcDFrak5KZk1MdVJUM2R4ajE3QzNKa0h3MnZnYU1pTkxyMWl2Yitv?=
 =?utf-8?B?b2djbGw1aWlQUVNHa1ZLMDN3emZsd29QTHdsbXNjdGhXZWNxeENTUGt1aUsy?=
 =?utf-8?B?N0VTWmpKcHl2QW9YSHR3Ni93UWNlYjFnVFo2NWVFWHU4a3pHN293UmxDeTdD?=
 =?utf-8?B?dVE3a1ZNWTJyalh0MEhRQzZ3U3JSV1kwbEkrZDUveGpRVW5PT1h0ZnBxb3cy?=
 =?utf-8?B?Vk4wa3p6d2RLUUcxb1B6bUgySUhacmtaTFNHalRyNm5pWCtaVFdtaUd2MEIr?=
 =?utf-8?B?aW9xbkhxa0lKZm1zdnlSbjNLRVIwS0hYZ0F4dVpydzBlSHRnR2xGN1lSSnFG?=
 =?utf-8?B?NlpWU2oya1MyQUtjMHc1YjhjVTJkK2NtOW9MR1VsLzg1MkQ2OVhBMXlQQlBm?=
 =?utf-8?B?MzRIeTF6enpWWVVucnJLcVJjcGMrRklLY1M5Z2ovZmFRaXptRS9jZHZFZm5C?=
 =?utf-8?Q?w3ogIULThxf981rv755Qg3UYKrO+NYdJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0FzNkJKbFVjVDMxakN5UlBFeVpKdExxTDluaFNCUkhTcWtlZEdJNVY2S0RS?=
 =?utf-8?B?a3Q4cW1odWdUNzJRaXlGd0pOdEllUjI3eWlMbGtvZHp4VkwvS3FHSXVoSHB3?=
 =?utf-8?B?cVRLOUx6OVVHeUc5cnRqMkp0QlFyMFV0aTdBRHZQSVdFd1hSbE1MUllsMFd2?=
 =?utf-8?B?MlZsSEZSZEhVajhjb0g0cGVrZmROa0VrVUNzQWNJT25HWitXeGo5V3N1TTB2?=
 =?utf-8?B?dXA2MWRxWDBYb0ZwaFd0dFBBR2Z0ZnJDVHJRUjZwazk3aE5jN1N3S3JJc2ZP?=
 =?utf-8?B?VUZDNmRmZXozWTVacFNGbFdLNGtKSXdlNEhvdXltMmtDNzVqMmNEYWt4Z1lO?=
 =?utf-8?B?NDNTTHJlUGR6M1owUTdDOENpemg0bE4yMzMxV0kvWUs5cnNzelI5WkVWbFVE?=
 =?utf-8?B?RUJvdHg3QndHYVBlL0NRMjF3dFI2L3d2Z3hFTGUvU3Z4cjZ1VW4yTVRYMXJJ?=
 =?utf-8?B?UnJ6RVpLMGRaSmRaZU9PaTZBMW90ZFVLSFJjYWtnZVU4OUJnL0pmLzBEdWcr?=
 =?utf-8?B?bllhalJXWXlzOWZnbWkxSkJMNjJEcFJCMm05SlFEWk9Ia1p1SlVnWE9qdTdl?=
 =?utf-8?B?dlo3RlQ1QlBJMS9ST1QzVkJHZEtCMGNqVEViZ2Rlb1MyYzRLRHc5aEtTS0ZO?=
 =?utf-8?B?ai9pUkpOck0wZlhGLzFhY3ZIeENCdFFXZ2ZqWUQ0VElWSXBPbjl3d3VNSXhH?=
 =?utf-8?B?MmhtZmZ1SFRkeGdkYjQ5czBmbzY0Q21wKzYyVFkyVUdsczZVbnJIMUVBME1Y?=
 =?utf-8?B?Skd0dWhSOGJrdW04SGRzcWFnNk5wVU1sVlJwMEtJdG9Pa2M1MGVNaGR6K1Y5?=
 =?utf-8?B?YlNYc0djSTBNL3VBS1Fma0diRkIvVWpPWG1aRGYyODJYVXd3N1JCVlRqWTQx?=
 =?utf-8?B?T2ROSUNXZUhEVldhV09NRVlXNldqeDVuaHRjcW5VbzFZRUxZUG5pNDVZYmdL?=
 =?utf-8?B?U1RZMlVzNVkzWGVFMlhHZlovNHR4bjRaUkFldDBLQUhDbDRGbTJ5THBZZzZi?=
 =?utf-8?B?ZStkYlhBbXFXM0NrY3QzM0RpWHFpMklVZEdpY2lNK094SDN1aEVjZFZqdEgv?=
 =?utf-8?B?TWhKSnJaOTlPcUE3ZGd1Z0JCQ0xVRys4MnFtWGdDTEZ4MGZtaEhIcTN4Qm0y?=
 =?utf-8?B?NzNYa0Vkc2tONDBGcytiMHBvNVFKY0pFQXpXQXBFSUxveVZsZkNqRUFtMTRv?=
 =?utf-8?B?MHJIcEhmdnJiMUh3bm1TbTdQL2ZKWDZiTCtwY3BRMkdXRjBhM0Q1UkFCQU5E?=
 =?utf-8?B?emxUN3VHWm04QWlPdjR2T2xmOGN2WklyaERaTitVY0V6WnMvaWFFeTVxV0NZ?=
 =?utf-8?B?OTdJeFkrY1JkLzlNOUY2eTZjaDVJcElDcVI0K1hvWWE5MTlveVlrcUdJSXA1?=
 =?utf-8?B?TythKzUyVmdaKzhKaFN6ZjBOMFB0VmlMZHJMSUQrcU1QWDNTUzZ5NXBXd0M1?=
 =?utf-8?B?aEtyQkpiS2RWcWMyN2kxTEIxbE90dEkxRnZKekZ4dTc2RUliOTN4QlJIVEZj?=
 =?utf-8?B?TlFoYlI2MUJtZCtHa3NNRVNUbUNaendFdC9CNUtTWG1qdzRKczNMMGtDbXJw?=
 =?utf-8?B?WWx3ZDJGWHNKSDljbnF5bWRkQTFEZlF4TEpxSWRnY0NOQ0czUHhGeW8zU25H?=
 =?utf-8?B?NXBSQzFqakZQZGo0N0hZamNHR3l1UFh1a3o3bTRGSm5vemFxWC9Ka3dvbFRH?=
 =?utf-8?B?Nm03UDZKSU5Jd3E2UFhRR3AwaVlUaklxZWtTcWtBbm51VzVqR2s3YzhaMDha?=
 =?utf-8?B?VXBQa3FyZXdkeGlEeTVBMUVqRUxzNFEraWp1aHV3dVJacHFpcjFlSFdYR3Fi?=
 =?utf-8?B?SzFYSHJrcW9VWmo0VGtZUzUrd0dZemFJNkxwUlNuV0dKNS9ueDN6dEMxNlFP?=
 =?utf-8?B?NVBUWkQ3TE15ZjNWNTk4UTVOd0dCOTRFbXEwbE0ySmZRTm1zR1Y2cXUvUk02?=
 =?utf-8?B?dGVGb1lSNE5wSCtwUFNxWS9haWhkRmtiMWZFR00zRDA5d1A4d2NZdjlzQlZM?=
 =?utf-8?B?ZTZJbkxJSXF1Z29zb0NRV0hmUU54M1drbi9jcSs2Q2xQYUJXNXlmaVVrd2xP?=
 =?utf-8?B?UWxoS3BQemlYb0VqS1o0cHlsT1lncmc0aldJM1UxOXVwWDNzNU0xWHFmSkw5?=
 =?utf-8?Q?BF5N1rCDummPd15iDoNmcTQt7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2453363f-5e33-4dbb-f565-08de2902c82a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:35:05.9298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPRPkoihXDwSqa2enwEoxg48TUr24bW6x7wi29oM7BfM2weETZp2NgFDXIm9A5+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> If multiple entities share the same window we must make sure
> that jobs using them are executed sequentially.
> 
> This commit gives separate windows to each entity, so jobs
> from multiple entities could execute in parallel if needed.
> (for now they all use the first sdma engine, so it makes no
> difference yet).
> The entity stores the gart window offsets to centralize the
> "window id" to "window offset" in a single place.
> 
> default_entity doesn't get any windows reserved since there is
> no use for them.
> 
> ---
> v3:
> - renamed gart_window_lock -> lock (Christian)
> - added amdgpu_ttm_buffer_entity_init (Christian)
> - fixed gart_addr in svm_migrate_gart_map (Felix)
> - renamed gart_window_idX -> gart_window_offs[]
> - added amdgpu_compute_gart_address
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 56 ++++++++++++++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 14 +++++-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  9 ++--
>  4 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 94e07b9ec7b4..0d2784fe0be3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -686,7 +686,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * translation. Avoid this by doing the invalidation from the SDMA
>  	 * itself at least for GART.
>  	 */
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&adev->mman.default_entity.lock);
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> @@ -699,7 +699,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	fence = amdgpu_job_submit(job);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  
>  	dma_fence_wait(fence, false);
>  	dma_fence_put(fence);
> @@ -707,7 +707,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	return;
>  
>  error_alloc:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&adev->mman.default_entity.lock);
>  	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 57dff2df433b..1371a40d4687 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -229,9 +229,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  
>  	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
>  
> -	*addr = adev->gmc.gart_start;
> -	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> -		AMDGPU_GPU_PAGE_SIZE;
> +	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
>  	*addr += offset;
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> @@ -249,7 +247,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
>  	src_addr += job->ibs[0].gpu_addr;
>  
>  	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
> -	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
> +	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
>  	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
>  				dst_addr, num_bytes, 0);
>  
> @@ -314,7 +312,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>  	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (src_mm.remaining) {
>  		uint64_t from, to, cur_size, tiling_flags;
>  		uint32_t num_type, data_format, max_com, write_compress_disable;
> @@ -371,7 +369,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		amdgpu_res_next(&dst_mm, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  	*f = fence;
>  	return r;
>  }
> @@ -1876,6 +1874,27 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
>  	adev->rmmio_remap.bo = NULL;
>  }
>  
> +static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
> +					 int starting_gart_window,
> +					 bool needs_src_gart_window,
> +					 bool needs_dst_gart_window)
> +{
> +	mutex_init(&entity->lock);
> +	if (needs_src_gart_window) {
> +		entity->gart_window_offs[0] =
> +			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> +				AMDGPU_GPU_PAGE_SIZE;
> +		starting_gart_window++;
> +	}
> +	if (needs_dst_gart_window) {
> +		entity->gart_window_offs[1] =
> +			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
> +				AMDGPU_GPU_PAGE_SIZE;
> +		starting_gart_window++;
> +	}
> +	return starting_gart_window;
> +}
> +
>  /*
>   * amdgpu_ttm_init - Init the memory management (ttm) as well as various
>   * gtt/vram related fields.
> @@ -1890,8 +1909,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	uint64_t gtt_size;
>  	int r;
>  
> -	mutex_init(&adev->mman.gtt_window_lock);
> -
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
>  	/* No others user of address space so set it to 0 */
>  	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
> @@ -2161,6 +2178,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>  void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> +	u32 used_windows;
>  	uint64_t size;
>  	int r;
>  
> @@ -2204,6 +2222,14 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
>  			goto error_free_entity;
>  		}
> +
> +		/* Statically assign GART windows to each entity. */
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
> +							     0, false, false);
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
> +							     used_windows, true, true);
> +		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
> +							     used_windows, false, true);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2365,6 +2391,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence)
>  {
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
>  	int r = 0;
> @@ -2375,11 +2402,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  	if (!fence)
>  		return -EINVAL;
>  
> +	entity = &adev->mman.clear_entity;
>  	*fence = dma_fence_get_stub();
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (cursor.remaining) {
>  		struct dma_fence *next = NULL;
>  		u64 size;
> @@ -2392,13 +2420,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  		/* Never clear more than 256MiB at once to avoid timeouts */
>  		size = min(cursor.size, 256ULL << 20);
>  
> -		r = amdgpu_ttm_map_buffer(adev, &adev->mman.clear_entity,
> +		r = amdgpu_ttm_map_buffer(adev, entity,
>  					  &bo->tbo, bo->tbo.resource, &cursor,
>  					  1, false, &size, &addr);
>  		if (r)
>  			goto err;
>  
> -		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
> +		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
>  					&next, true,
>  					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
> @@ -2410,7 +2438,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
>  		amdgpu_res_next(&cursor, size);
>  	}
>  err:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  
>  	return r;
>  }
> @@ -2435,7 +2463,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  	while (dst.remaining) {
>  		struct dma_fence *next;
>  		uint64_t cur_size, to;
> @@ -2461,7 +2489,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
>  		amdgpu_res_next(&dst, cur_size);
>  	}
>  error:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  	if (f)
>  		*f = dma_fence_get(fence);
>  	dma_fence_put(fence);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index d0f55a7edd30..a7eed678bd3f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -29,6 +29,7 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include "amdgpu_vram_mgr.h"
>  #include "amdgpu_hmm.h"
> +#include "amdgpu_gmc.h"
>  
>  #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
>  #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
> @@ -39,7 +40,7 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
> +#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -54,6 +55,8 @@ struct amdgpu_gtt_mgr {
>  
>  struct amdgpu_ttm_buffer_entity {
>  	struct drm_sched_entity base;
> +	struct mutex		lock;
> +	u32			gart_window_offs[2];

u64 here please. The theoretical size of the GART is way larger than 4GiB.

>  };
>  
>  struct amdgpu_mman {
> @@ -69,7 +72,7 @@ struct amdgpu_mman {
>  
>  	struct mutex				gtt_window_lock;
>  
> -	struct amdgpu_ttm_buffer_entity default_entity;
> +	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */

Comments above the field, not after. Best practice would be to use kerneldoc style.

E.g. something like:

/* @default_entity: for workarounds, has no gart windows... */

>  	struct amdgpu_ttm_buffer_entity clear_entity;
>  	struct amdgpu_ttm_buffer_entity move_entity;
>  
> @@ -201,6 +204,13 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
>  }
>  #endif
>  
> +static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
> +					      struct amdgpu_ttm_buffer_entity *entity,
> +					      int index)

Kerneldoc would be nice to have for that function.

Regards,
Christian.

> +{
> +	return gmc->gart_start + entity->gart_window_offs[index];
> +}
> +
>  void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
>  int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
>  			      uint64_t *user_addr);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 9c76f1ba0e55..0cc1d2b35026 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -59,8 +59,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>  	void *cpu_addr;
>  	int r;
>  
> -	/* use gart window 0 */
> -	*gart_addr = adev->gmc.gart_start;
> +	*gart_addr = amdgpu_compute_gart_address(&adev->gmc, entity, 0);
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = npages * 8;
> @@ -116,7 +115,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
>   * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
>   * the last sdma finish fence which is returned to check copy memory is done.
>   *
> - * Context: Process context, takes and releases gtt_window_lock
> + * Context: Process context
>   *
>   * Return:
>   * 0 - OK, otherwise error code
> @@ -138,7 +137,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  
>  	entity = &adev->mman.move_entity;
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
> +	mutex_lock(&entity->lock);
>  
>  	while (npages) {
>  		size = min(GTT_MAX_PAGES, npages);
> @@ -175,7 +174,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  	}
>  
>  out_unlock:
> -	mutex_unlock(&adev->mman.gtt_window_lock);
> +	mutex_unlock(&entity->lock);
>  
>  	return r;
>  }

