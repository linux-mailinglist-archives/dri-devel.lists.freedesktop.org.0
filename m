Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116CFC3480B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C8E10E6D0;
	Wed,  5 Nov 2025 08:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pA8Z6A3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013022.outbound.protection.outlook.com
 [40.93.196.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9F10E6CF;
 Wed,  5 Nov 2025 08:36:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khGGi3fngHL/K4xhl0RyHoPKb43gN1yOdMCEoVuBFrwS32e45wN4K2mDIXjW0Jvg2QdpKCPY6pSBTuRhJ2LMjfOZNH4ZPEbfU0/JwlYT3IePMNc6oqv4F9yG2MP//IgEqiLZOpFvOk8KotsIjCPVhPo3d6BfCsvIoZ48esg0/fvIozwe7AyKQV5CUGy+ROqOpeWEK/0m2/bXP+gPVyJmsjsZxrActpS6FszKcRZuZoi2YPkRfnJNF0wWevNhZI3t8gI7BcQEImgJn1Hsrx/0faku33yDLp6Zm5wXkCplJQmvAfILt/G+1+/DJ5DFnv8SBKpJ8g65ag3w498yxGnVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SDGveDoW7rRemaKWQAjLLOWGQ+DzZjAA1mApE6Pva4=;
 b=JbzPSs+IicCsZfhuDbXo+cAvTh83jL96AKNfADsLM2kPH5d1RWv5cGd2WnFyjDMzM4oijqCKawsPZ+YF/KmGoYky5pT/tRlhdPb4QdpDe3kmE/Mtb5ftIODgRhzi3Y8YxDbBsJaUA4xZRcsKi9EaYMhwjpG16CeAe83fX6CrEkKbjZeRS4ZgAmAofRXb5X09+idddzL7IsPB8A7HftwlsSVCx1ZncYD5LMvHYuVQygCy3PxGvF6xUopiaC06bNiHsRdqVmf/60qPI+KSJmYYZDPkE9zypEz7XFyRqttj+oNYKkhe1lyyc2eNnewSMv8RZnEWDSqa4uE5rtvim0YeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SDGveDoW7rRemaKWQAjLLOWGQ+DzZjAA1mApE6Pva4=;
 b=pA8Z6A3cc3wO3XNQADBHm1ct9n71YGOsccSjciUe9go6x3ykGHQsBHBc2CtrGc3emqLdB+bScusbJpdCNH9XalAXFubQOuB/FhNXZ1XCMMe8BTylYRQKgDFbe2cKldDNJxBRxPDiHmxkzsgwdz3A6yKROijIf1PzrvtK/7+z1Do=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:36:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:36:45 +0000
Message-ID: <23715885-c050-4f19-a964-30cd0e511d8a@amd.com>
Date: Wed, 5 Nov 2025 09:36:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/20] drm/amdgpu: use TTM_FENCES_MAX_SLOT_COUNT
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-13-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-13-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 79de6ca2-5527-4f97-d43f-08de1c467425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXRQYzg3SFlBcGx5WS95d2VwbXVnRE5CeTY5TlB6K2Z3SlNzTTYzWjZ2TDRZ?=
 =?utf-8?B?dnl4eEp5K3pkbDZkOXhDd3hRN1NMT0c3QmpxdlUwWldoZXJCajNFWjRCbVBR?=
 =?utf-8?B?WHdLcjUyQWFqK0ZybDNPN0RTRWp2aDE4U2NON2FZd1pRSXF2bEFoay9rTkFC?=
 =?utf-8?B?LzhlOGZNblEzeEgyaVh3cERQb0JUNm1BY2FHV2FlM1E2eEdxVkVzNnRia01B?=
 =?utf-8?B?R3d2R1lLRjBEU0dtQkt5S2hGL1ZIbm5wMUVOL281NGRqTXdocW8yOFptTnY4?=
 =?utf-8?B?bHVPUWVWZXc5d3dNYlRGbCs1QXJhVFQvNFZPV3VZVEx5NUVtbGlrdjA0RFpM?=
 =?utf-8?B?Z090UUQ0Q01XSndxTmdybldpaFV5dnRRNlRaTzFVb2lPNE9ieTcrM3JPR2hk?=
 =?utf-8?B?eWVLWWJHb2NQdzIxNWVDSDNiRGs5d3k1blBueXdDWUhIb0JyM3Jpei9zSmt1?=
 =?utf-8?B?eFhtQ2d0MS9SbmhFNDlTL1pXOUZNdWo3aDFqWEw2YjhiMklqRzl5ZWd1NHV4?=
 =?utf-8?B?SkhuNnNrQWtNcHBKYXdadS9OdlJKcCt0bTJwQ3d1b3l1d3I4NmNTZmpkU3lC?=
 =?utf-8?B?aW96Z0t3b0Rrb1p6VlhrQVVEeTF2WlJrbGlLL0dHS1ZZVFp5Nlg5TS9QMGo0?=
 =?utf-8?B?TCt1UnhrTDBxQkF5ZVdCRzBXZHZIMHFobk0wTVZjdm5UT1BlS1lKcHNPZnNs?=
 =?utf-8?B?TmI0SkpHYkM2czdmajRqazJWOFFJVTBTajVqcXVjL0hOMnlCYThOM2hmbWF0?=
 =?utf-8?B?blJZaTRLSlZkckEybE1YNHBBdlFWOEtIc3RndEZPbG15TElnNURVTFIyMzdl?=
 =?utf-8?B?amM4TGthYXRhTkRmNHdMSityYW83dEtHc2IzVDRiRFdxc21oN3htWlZFWS9t?=
 =?utf-8?B?QmV1cHlFanJSRjZUbzEwNXFnZDFacVAxNUQyMEpTQm9HU2JpY1lCUDNUbU5r?=
 =?utf-8?B?Y2JwbzRkalNuWUpjYVlPdTJFRm5QNFFhbTRndzlBaEFwNTBHOC9Yb3JKbGFD?=
 =?utf-8?B?SzQ0NHdMNm11dDBKb2lzc1A5c3d5MXR2RjdUbUNzcjl1cEszdGQzQTVlT25D?=
 =?utf-8?B?dWFjYnRQc3JSZkYvcnNRcjZjcUNrOU01ZUpyaTRybDZFazJVbS8ySEFOcGZ2?=
 =?utf-8?B?Q3ZjSWk5SUMzUUxiQjVzd055NlJOQTY2S3ZqbTQ1T2ZsWVdtaHdlNjlXMnhH?=
 =?utf-8?B?aVRxZ2YvT1YwQnlIUGZtUU44VFo3b0RhaUkxTDNqbStOdDM5NE05UEhwMGdK?=
 =?utf-8?B?elcyRWhRVmVRYjR1WUNsdVJObThRanhkZnR1a0dBS0cxN2h1bG9QV3N1Sy9h?=
 =?utf-8?B?ZGFKTExhcHk1T1Z5cUc5bnNKYlpJV1I0blNCcXV2OVpncW93QS8xdklCMlZO?=
 =?utf-8?B?bVc2SXNXdTYrcnRxcDlUWUQyMWMzdnhhS3RoQ2ZISDZHYUtZWUhBOVVBZGxQ?=
 =?utf-8?B?Z2IrSjNYdTBOMWxXL3NWSER5T0JXYnJIUjlwbUpoQUVGUlZRL2Jzb2xpL0JM?=
 =?utf-8?B?UHppMXd0RjJEZXprVElReVVUMDVFOEswcldOdUJDbkJvMmRzYTFnL3ZaU3Jx?=
 =?utf-8?B?Z2F4YzBLNDl3RzJST2t4VVZNWHh3YXRFZ0VRckxVVGpiYm1lK0wxUmlxaWlr?=
 =?utf-8?B?OG9PQVpPcGtRWG1uSXYwWVZ5VEg0S1BnZXZNMEl5OXZaMlZPbERFTGtTY0J2?=
 =?utf-8?B?SVdvd2pRUVVoWUZLWVVzVTZ3ZW1GTXJjZ2YxMSs4SXBhcmhQcW5ERHczYk5l?=
 =?utf-8?B?Q0hUR0V0MUVKUW0rN1M2MkxTNmVaOEs1NGE5MXRReEVwNWdjelo1T0NqQ3BR?=
 =?utf-8?B?cUNvZjVGZ05Uekd6b0pPNW1rWFJtZFlYRXExQllxaTBjRE56Q1NTMjI4UmVZ?=
 =?utf-8?B?WFlJZExndGl0aHZMTFZIeTNVbDRodGEwV0ZTZXZacGhzbDlSMVAvU3czd1lp?=
 =?utf-8?Q?UpYq9Ia29MTOCV9mg2lnJTmFjoK1UYjP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWp6UCt2bko5T0YvOUtSOHcwMTF3QWFNamo4YmpEVDkxUHJ0dnMxQllJMTVR?=
 =?utf-8?B?Z1U1SGY1bVR4QldOOE1GSlh3dGoySjNDclB3ZlF2RnRtbmorVC9tdWF2b0Fw?=
 =?utf-8?B?d2VFWEVCSC9ZclpSOHFmZGxjR08xNDVnd1RleTFVS1pQcjg4ZFFmL0VLamNk?=
 =?utf-8?B?cVVQTW5mSVVZVXc0bkN0L05CNU9nR1Mya050M0xxTXhXR1BZRDhJMUEyR3ND?=
 =?utf-8?B?Nm5xRVFMbEhRR0JhZG9QaTdHY04yTTJ0WEE4UnVsaUwwdGl6NzhXMHFDcmEr?=
 =?utf-8?B?TFJOZHpHU0FEdThlVDZ1MVc4bDl0YmI1YjM2L1J6WFpUT2tSZ0NTS1N4MHZH?=
 =?utf-8?B?bHJweFRQT2hMaUhXdkRDQjI4ZXdqa1RpQ3A1cmQ4dUdSWWZ3ZWYxRVVhTnhF?=
 =?utf-8?B?V2Y2YU95SXdudm9ralIrV05vSnVBUTJmNlROdDZvZjdMbEZVWUJFM0ZtQW5a?=
 =?utf-8?B?aSs4S09JNm1LaG03dmRxNXZMdllCZldwK2s3VW4ydTBpTzFhc1JkbXFzMFZo?=
 =?utf-8?B?cHJ1TTErL0dBMVYzK1kzSlgxR25iR0JRK2c1QzhobWtOM1kzK0hUU2FuSTlB?=
 =?utf-8?B?NjBxK2kvS2cwYWlhcXRibmpkWWJWSk1VYitBZHUrOWU0NTBGK1FKbmw2NkRy?=
 =?utf-8?B?L3JrY2xHdXdybytSZDhQMmZLZlNLM21DWjZQWGh2RTE1L3lqMmVjdWZ5VVhr?=
 =?utf-8?B?RHRrUmhQYjdQWnZsMFRpU2QzNU4zeEl2SFNHMFFaem14eW1RZ0ZUMjJmZ0pM?=
 =?utf-8?B?UlVtTFo5MjlHbjNzQ0x0R0tNYW82Ym44b1hCK3ExL2llMlhsZ2dqMkJMblBs?=
 =?utf-8?B?K1RxeElGSDJnN00vQ2htMklDTmpoRE85UkJvc2ZYbFdhcnNJU0dReGFDR2JG?=
 =?utf-8?B?QzUwaWUwVU5xWHBIc2daQndjL1N0emNTUGxaY0RzWkM1ZEZxK2VHdWdkNHpo?=
 =?utf-8?B?NG8xVXlhMTRnZWRKR3d1RktESFU5UTZ1UXZQcWhmRFg1SWpWZG9RSHhRU2VZ?=
 =?utf-8?B?NTVpeTg4MWNDcEk0cGp1dmFhdkY3NUw4MyswZU9DTTV1SENRVEpaWVc5eVpa?=
 =?utf-8?B?dUFwTUJhTG41elRYSzExWlBPTmhwUTJwKzc3T2dING0yUEVMdys1Q0NYRTIw?=
 =?utf-8?B?MEhVQW1VT2tMM1Nub3ZUd3NsaXp3bmpoSTFZSFZrS2FGOXRFekk2ckloQUhX?=
 =?utf-8?B?am1BNmlpWEVxMmhXZ0EzdzZxUzJqMG5MbzAzRWI2cVpCTktUV3NZbklLSFFw?=
 =?utf-8?B?SEhQdUZpQ01HQWhURGdKL2p1ZHRmN3ZaZm1FYnhaMU1KNzFhTEhDM1k1emRM?=
 =?utf-8?B?bFl6am50VG9xNkdVa01ITy9uSC8vZUE0bk1VRjVEWDd0eENCNWJ4bUNtRmxM?=
 =?utf-8?B?RGtnQTNQMVF4bUJGRXJkTmRVbUdYWkI4Wjc4bjNoQ1lMMFE1MnpndERKYmto?=
 =?utf-8?B?SVN1d0JkdXUyRlZHOUhveFJwWmh3c1N5eUt1VENPVWFERHBjT3YvMkYzRWJD?=
 =?utf-8?B?ckY3SkJwVHZ4dFFHVGh6eG51ZHg5VC9QK3NEaHZuR2k4SDBsM01mb3VDQnp1?=
 =?utf-8?B?elVqeDM0dGx5bW1FYzJKU2NnL2crWlI4R2d2cVlRdzVzd2lHK1BiY1pRN2sw?=
 =?utf-8?B?TFBTSlV2dTBxSmw0SXBUSk85Y2tXblB4c21HNDdYSXE3MXNxdnhubHV4SHBu?=
 =?utf-8?B?ak1OTHY0WmJoZ3huVDB3VU85QzVSMWUzMjk0aGxtbkJ5OWdTNTRBc2lOWnFv?=
 =?utf-8?B?ZzllSzJHOTdQTjZ3c3hZSTZocXR1bnUwZmFETUFmdGdaT1lodzVuQlhUUFc4?=
 =?utf-8?B?TmZzZllnNmN5VnUxZE9TNkVLRGttQ1JZOTZuQTVZY3VUV21CZytKNEZWM2Zv?=
 =?utf-8?B?dk43SXZZbGcrSE1PUmxiQWZSWHBoWk1tMmlqeEkrdi81bU9maU12dWN1YTJ0?=
 =?utf-8?B?VlBBTFY0MEI1MVU2WDh0a1JBSFdLRzhOZUJoa2NqOWVYYUZ0VmtPMkdiY1dP?=
 =?utf-8?B?eXBtNDFSYzVaODJzUzVUMnJwTlFvMDF5N0FVR1JsRi92enNad0M5NkMyOTR5?=
 =?utf-8?B?d0c5Mm11UWVtMEtRZ08ya1F6NHV6amhWWEpWb2d0cmV4L0FWZGh4cTRaTWh0?=
 =?utf-8?Q?emHNjwMD7vwM065z+kKQarmc3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79de6ca2-5527-4f97-d43f-08de1c467425
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:36:45.7449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbfPAJd+bJhxRxZVEib4C2Njp1DYS4TifvWfL1CkUZ4+N/VVKHE6kiWSQw/Obzxj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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
> Use TTM_FENCES_MAX_SLOT_COUNT as an upperbound of how many fences
> ttm might need to deal with moves/evictions.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index ecdfe6cb36cc..b232ed28872b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  			goto out_free_user_pages;
>  
>  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			/* One fence for TTM and one for each CS job */
>  			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_FENCES_MAX_SLOT_COUNT + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> @@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  
>  		if (p->uf_bo) {
>  			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_FENCES_MAX_SLOT_COUNT + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index ce073e894584..f773b06dd135 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -353,7 +353,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>  
>  	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
> +		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_FENCES_MAX_SLOT_COUNT);
>  		drm_exec_retry_on_contention(&exec);
>  		if (unlikely(r))
>  			goto out_unlock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 79bad9cbe2ab..d9bb16186e1f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -326,7 +326,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (r) {
>  		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);

While at it please also drop this error message. It is absolutely not helpful at all.

>  		goto error_unlock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 2f8e83f840a8..bc11e212f08c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2630,7 +2630,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	}
>  
>  	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
> -	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
> +				    TTM_FENCES_MAX_SLOT_COUNT);
>  	if (r)
>  		goto error_free_root;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index ffb7b36e577c..ea8dd17e2852 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -627,7 +627,7 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
>  		}
>  	}
>  
> -	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (r) {
>  		pr_debug("failed %d to reserve bo\n", r);

Same here.

>  		amdgpu_bo_unreserve(bo);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..1f2a5dcfa3e5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -952,7 +952,7 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (r) {
>  		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);

And here.

>  		goto error_unlock;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index d9527c05fc87..60b57d213bdd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -106,7 +106,7 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_FENCES_MAX_SLOT_COUNT);
>  	if (r) {
>  		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);

And here.

Regards,
Christian.

>  		goto error_unlock;

