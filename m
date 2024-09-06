Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD396F9BF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 19:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0586C10EA72;
	Fri,  6 Sep 2024 17:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TAWiJFKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3937C10EA72;
 Fri,  6 Sep 2024 17:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtIQVkISFK8GO44jFVH/PsUjYlx5jN6STO96/nHhGzTa+A6uls6UH/pREkt9S1jJojUEQwgvd1s6Z40gYP/VuEMZLJTQZk7nCgVRjcV0Vh6uv4+fn+tO1qkCSUhMS3j9r2Y5mrjSc8cdIcdGvzX4ElU2N+YMGKj7gGufbbmo0DYfdeRVDdUQdOCLWq3qTYDNVW/n9hl+swNTvEy0uJ4jmZzuU+lwUcS9Ar++cLE7J22ZM1gmew/Y8/x0cBDo8a77SynKIePu6jup4DIy9X3JnD4P2HZ2AGgrKQJeoIotBf9RWqwVNVgVwMKbznwVs/cmfI9sQkZiuwYYajI9lYUS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbtVM3scmF/LJN0M2PcArSjm1bbAM0G4SoXbdOs5dVU=;
 b=HyA7LxWP9yn3AxXtq7mFa5LKhWZofbb9AS/FjSG6bn/tzxsblZ42HoM4EPKYBt60t4Q6lRStzrROvNGvIkGJjF4WOnQaH1bHKHLrXWhINm/4RNlG1PlvTiVf80dwtwu5MCU3rVuTctCg6pv+XqKUd+xKZU6GEc90mIM/JzYrojYeZH/jFlNihA4GHH5yh0kNb6UVzlT02ze8iDhqYK5Fzf2txOUxKDPaNbY6AGGreWbrMp/F6UWak7CIEt7JpzMS5IL5f6eYNg+Af2xtXiHfYSrMBsOlgzITZDRDrdlotvP+k8eZXmQa34Z8aB5oKiRxb2V7pqvtD/7zyrKb8ayu8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbtVM3scmF/LJN0M2PcArSjm1bbAM0G4SoXbdOs5dVU=;
 b=TAWiJFKF5ZO5W9KQxEo8VHzjwilTkGISMHxYB61c7sduvz1OoI/9z8WafEOpj+LSloQgoG/eRYZoQY81nbroRv0lofG5tM3P42dHWKXuJVuC0fuUfV2tg2WTGet+RErZhAKMjTqORSzKutXkbA+Uf1oTUHa738RhYsoXrqBphXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 6 Sep
 2024 17:08:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 17:08:31 +0000
Message-ID: <2047bf56-bd96-43e6-a0c2-2933a40b0369@amd.com>
Date: Fri, 6 Sep 2024 13:08:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/44] drm/vkms: add 3x4 matrix in color pipeline
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-20-harry.wentland@amd.com>
 <Zs4RvhVXTg4MFMop@louis-chauvet-laptop>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Zs4RvhVXTg4MFMop@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1420dd00-3af9-4664-cc44-08dcce96888d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnNHN1ZZR3NGQWx1OTVkR2NUN1luVVZqazc5aFowMTJ0d1lFUG9uVkt4d3dI?=
 =?utf-8?B?RUQrZUpRbXdQR1BGSFMvRUk3MytMZlBtN01GVlJOV1N3VWpGRTN4S0ZWY3d4?=
 =?utf-8?B?NlRlbVpyUzh1MlZmeE1mM3cvQjdjbXJuQjc4Q1Jlb01JQmxiZEg2a3B1dDhY?=
 =?utf-8?B?UzdkN09UelpPOERua1l3MVUveGdicTYvTkRIa2hERHQ0QUV1Q1hjSHFWYjBZ?=
 =?utf-8?B?cUEzZXc5L1d5VXF2UStrYXJBZFJMYkQxTUJtSVAzd3BLK3ZKd2tmS0lrQXox?=
 =?utf-8?B?SDZzYTlPSUk1aS81NDJNbHd0UUk5TE5CVXg0aDBJZXg0MkpmeGhxNGNlNmdX?=
 =?utf-8?B?MkdvU09sbURiRTVqczZ0VzQ0RTNRZEo3WktlUVU5MnBqTE44MkN4ZFVab3Z3?=
 =?utf-8?B?SVZvbjQwNFlTS2YyWmFreVdsV29mRUZDekxEM3d5MTczWkFVYWdYUEoyNWNP?=
 =?utf-8?B?Q3VoR1hmSHFEb0JhT04rdDkwSEMrUXlWbGorejRqMDgyV3JpNkd2cUgxaEl4?=
 =?utf-8?B?RUdXUjZyRG9FbW9NTUVFNUNUcUlaKzBtYjkwUVNuZ0liVmFoTktmOHlhVmFR?=
 =?utf-8?B?OU9UWjAvejBMOXhnUUUzUEZPVmV3cXpUdURhRFlzN0hnaTBmb0dZSHhPaW8r?=
 =?utf-8?B?cTR1cWZZU1c5YzZUTWRPbHhXOGRNNTk1Si96SU5QcXU3VHNXY1M3UFpONkJi?=
 =?utf-8?B?RTcvaUNpY1hIcmwzU0M4UVZCVTVTK1BYUGRGT3NLN09TdnJuVlNDNVNqTGYy?=
 =?utf-8?B?cDJ6bWJnTkF4ZVlTQUVNWEVaeUdySU1pNjI0TnRaY1JiZG1vNkVpc0JjMi8z?=
 =?utf-8?B?TTJaNFNrUnlIMG01YWhsdFRzTjBrbStsVXkvQm9PSDc4cUFCRGFzcnBmZ1lM?=
 =?utf-8?B?Nk5XSnBkcjcyaEE3WlBxNmsydVNROHozNEtVRHI1ZnkrWUpna1VsLzU4R3dw?=
 =?utf-8?B?eGxPYjI5NXVuV0h0YlRBb2JiQWJMSlNCYTBFdzhHNWlnZkljV0gxTVFwSi93?=
 =?utf-8?B?Yi9FMmhyRUd0enpaWlVqZzNZd09WdmNlU1VxZnc0NksrVHY1dlIrLzhqMXBZ?=
 =?utf-8?B?b0cwR0N6STdScHl6SkhxVHgrQXM0SGw4MmlNWGxGOS9JbW91Unk3YWxQODNx?=
 =?utf-8?B?QWJyMXZOKytsRitJbVdkVk8vS1ptVnZlak53QzF6QkI2Q2hlcVAxSmJaS2ov?=
 =?utf-8?B?dll1T2x3dGN1dUJGcFd0NW9oL3ZiZW5PSXZMZjhGT0pMNkxBd0xtcEpJUThz?=
 =?utf-8?B?ZW5CNExWT3pHdmRjbUk0ZzVSWFdHRVV0TklkL2phcHNhZGh0ZnlyQnZ2cENi?=
 =?utf-8?B?TGdNcU02RnM0VTQrUnBjNURkYnhyRWl5S2lBNDVhQjRDWXBFSldZbGpVa25R?=
 =?utf-8?B?NUxicVlZNTFCaHBxbnBiUEM4SzI0NENIQVhUNDZtTm1nV1d6M2hWOGtHVWR5?=
 =?utf-8?B?clBEanNQbHMrV1VaaU16cW1ocE9tMXkxdFRCVW5xTTNDV216clFuTXdFSm1v?=
 =?utf-8?B?ZHA1MVphb21qMUYya3RkQ1I1RnFaRSs2QVZhb0Y4SlRoUUhsS3lIWTJBU0h6?=
 =?utf-8?B?TzI5UW9ieWNVcFp4Q0xBc3hhblNCWWtkVC9BamNUZStvNHp6VXgrcjMxblpB?=
 =?utf-8?B?SXc0dDJCbWZIaUpma1RjMGc4b0RPT0ZYZmF6TFVSenFzeDh5TWhTNHcrS3ZN?=
 =?utf-8?B?eXVJU1N1RXpoSktLNTZRYzB5bUR2UWo1eXhmanRVTjlIV2pFLzFrQUZYdVBB?=
 =?utf-8?B?Rzc4YVQrRjY3WXNNU0hnaFdjSjNXZG12RmxYc0VUc3FCR2R1RXkyN3dibDUv?=
 =?utf-8?B?LzRER0lNaGdRRHpFRzZTZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWh5cEJYQndjdFc5ckJITzRwRWVFdndIR253c1RxencvT3V5eUEyT2lCTENv?=
 =?utf-8?B?a0Z6M3JsbllkbDBIeHdtZ2RkZXE2amtmbUVhdE1IOVdwemVqNnlSbHdCQW5V?=
 =?utf-8?B?NDVHRk94bTZSMlg1UFBOYmpYZVNtNWtiMk5VUVA5WlhDZHVKSHNiSmV5NjFP?=
 =?utf-8?B?YnhDZXp1dXJBM3VkN2JMcTBEQUVkRmlPbTRYbjVyZ3VBMEZYdCtiNDFYSEli?=
 =?utf-8?B?OFJiMGRmVXpQOWNTNWtiLytHRTJ0T3YxbFR4dmQzbkRXc0t1RFRUK0VvTmEy?=
 =?utf-8?B?MFFkTjQ3QWI1S01ZbkFjcFpXZ0RrMTY4VGJmUW9pWTRpMW1oSEFWUlFKdHdp?=
 =?utf-8?B?S0RidW1lbUtFQ09Scmhxa1NiZVBlVFM0Lzk1RXVDVm14cEE0NDRPOE1RemRm?=
 =?utf-8?B?eUZRZkZWdWFDNUsyenpnekErYnEwaVBwR2d5dldqT250TlZRVUZVbUNvVlYz?=
 =?utf-8?B?VVZLOU4zRE9oNHczdUhCa0p5TkV5bVRwYmlzbWVESFZpQll6b05FaFJMYUpS?=
 =?utf-8?B?azV2Rjhkck9SbWRnTE8yYjUxZUNsckRKc1FWQ1lmOFNWSDJ3OHRKNTJpMC9E?=
 =?utf-8?B?cWRseFZDUlJQaFZHaWU4Q0hxdWh2aHI2TkRpNE9YK2pKSVNxOHd4UXE5NDI5?=
 =?utf-8?B?bmsrYjBMb0t2S291eE9TRFFMdFB2ZC82UnhuUENnL04vbVNvV1FwRFhNMzZ6?=
 =?utf-8?B?eFlKanczTmlUcnYrV0pDZG02c0MwL1ltdFI3RFlsbHRFT0grTHZ2SFBJMFBM?=
 =?utf-8?B?SkFKei9GL0ZFckl1ZHNXTStkM05TdmZOeWsrM2FuRDBSL0d5ajM0QlBHM1kw?=
 =?utf-8?B?UVdvR21EVjVZa21ON1M4b2RVOFgxQlNjRVVON2JRWkljSFMya3NXc2Fxdnov?=
 =?utf-8?B?dkVWZ1QvNk95UDV5cnpxUjBvckQ4YUUxL3dXQUFmZmVPcEl2a3hham9vajhj?=
 =?utf-8?B?dnhvSnFZUzgvbW1LMjNpWDNDUndqZ0RFOTRHUXJET1lPZEFiZWgxVlhVUlIy?=
 =?utf-8?B?TExCWEJmZ3FDNFFwT0VLaUZrbWt1cW9saEpHZUVSb1lzMDIwYnFDOFp1WUpJ?=
 =?utf-8?B?ZE9XZGhTeGRxbW9uSFhZSE1MZEtMRnZqY1Q1dU43THFzYzFDNjdISG1sTzJI?=
 =?utf-8?B?NVU0MzRtL1o2SzdKUEUva2E2T1RrVFZGL0pPSGZFTnFmTkR4cElqdTVwU2ZH?=
 =?utf-8?B?NjB4TnJkRE0xUlZsMDFJMmc3ZTJXUDA4L2xGdUprZytJWnFMZmVKeThXalR0?=
 =?utf-8?B?dGlSS3RkR1VSaEJjd3VoUkpaMmJBR25McllYbi9Ba2sxZDJ3ckRFMDU1d1Y1?=
 =?utf-8?B?ejBDdC9ZMFhqemVJMVBIeUZHSEdrdE04LytrRitlUXF1YThqYWVVSTZBK0ly?=
 =?utf-8?B?VWVjOTFKcFVnYS9iTnpKbmdSY0NsMWROcUYrVFBraS9hdU9PbVBOT0FZU2k2?=
 =?utf-8?B?OXZ1bWYrTVpsWFJISlpmYXQ2SHR0UDVNL1ZTMU9ZcTV0UEcvWW5pN1VlYVF3?=
 =?utf-8?B?cGlRSGxJR3FVRTRBMENiVHQrUmNIbitYSjQ2S3Y2YVV6OGZlMkVqbUV2UXRm?=
 =?utf-8?B?RmRVNHRnSHhiV1c3NHJ5Qng3WHpUN04zV0JKcjU5b3YxblNvSFNVa3N1Rjdx?=
 =?utf-8?B?TEVnNEJsM1NPcUcxeE01bldUYnZFcjQwai92WEZmTmc1R21JRm84amloR3o1?=
 =?utf-8?B?VUxIVUx4QlpkWVhvdk13a1pwTGNTK0FwOEhucG1nYmNtRVEzNGd5SXpFMDMw?=
 =?utf-8?B?cnExOVhHZFR4MzVYdGNtby8xcC9yMVhpV1g2djU5YUFTb21YalpObWE5ak83?=
 =?utf-8?B?bVYrWEtuclhPaW5MbytFSXRjVGQxZWpvTTVja3E1emd2ZG1RSTgyTHgwVkFH?=
 =?utf-8?B?OHg1VmM3T3QrQ1JsOVViNUJwbDk1dVFERzY2MDY4Q0U5T1hUQ1JxaWo1bUVO?=
 =?utf-8?B?U0xkNmFSYnVjSGptVVlyWGhpbGxRU3FKMU1vK3lRek93TjJXYUxiVDRMUTBH?=
 =?utf-8?B?VGJHYVozM1BLcWVXQzZoQ3ZzdFI0dVphSk9IcVkwODE1OGk3K2tWS3hVeSsw?=
 =?utf-8?B?WmNTQkw2SDBjVWpUZDF2RWRuaVZaaEcrSzAzVjVHWjVIY0lVWUlxWHQrTGla?=
 =?utf-8?Q?xyI4vdNvbCHIqpdqFmCdNMLZR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1420dd00-3af9-4664-cc44-08dcce96888d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 17:08:31.6077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUN8TnMFmVOg7xls4c/ts4Rev/TvRMmLXv6bLWlohUS9uJhadpWD7ZE1bKfDqzV/svOMFFFZ8GGwv+EHy2YlvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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



On 2024-08-27 13:49, Louis Chauvet wrote:
> Le 19/08/24 - 16:56, Harry Wentland a écrit :
>> We add two 3x4 matrices into the VKMS color pipeline. The reason
>> we're adding matrices is so that we can test that application
>> of a matrix and its inverse yields an output equal to the input
>> image.
>>
>> One complication with the matrix implementation has to do with
>> the fact that the matrix entries are in signed-magnitude fixed
>> point, whereas the drm_fixed.h implementation uses 2s-complement.
>> The latter one is the one that we want for easy addition and
>> subtraction, so we convert all entries to 2s-complement.
> 
> Is there a reason to use signed-magnitude and not 2s-complement here? I 
> did not read the whole amd driver, but it seems that the matrix is always 
> converted to fixed point notation (amdgpu_dm_fixpt_from_s3132 in 
> amdgpu_dm_color.c). It may reduce the complexity here and in the amd 
> driver too.
> 

It's so as to keep the 3x4 matrix the same as the 3x3 one
(drm_color_ctm_3x4 and drm_color_ctm) and the original
3x3 one was defined to use S31.32 sign-magnitude. I'd
prefer 2s-complement myself but that ship has sailed.

>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
>>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
>> index f61dfde47156..adcb08153a09 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -37,7 +37,37 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>>  
>>  	prev_op = op;
>>  
>> -	/* 2nd op: 1d curve */
>> +	/* 2nd op: 3x4 matrix */
>> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +	if (!op) {
>> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +		return -ENOMEM;
>> +	}
> 
> Same as before, don't we leak memory/properties here?
> 

Thanks. Fix for this will be in v6 (for both vkms and amdgpu).

>> +	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_colorop_set_next_property(prev_op, op);
>> +
>> +	prev_op = op;
>> +
>> +	/* 3rd op: 3x4 matrix */
>> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>> +	if (!op) {
>> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_colorop_set_next_property(prev_op, op);
>> +
>> +	prev_op = op;
>> +
>> +	/* 4th op: 1d curve */
>>  	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>>  	if (!op) {
>>  		DRM_ERROR("KMS: Failed to allocate colorop\n");
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 6e939d3a6d5c..bd1df06ced85 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -164,6 +164,30 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>>  	}
>>  }
>>  
>> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
>> +{
>> +	s64 rf, gf, bf;
>> +
>> +	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel->r)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b)) +
>> +	     drm_sm2fixp(matrix->matrix[3]);
>> +
>> +	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel->r)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b)) +
>> +	     drm_sm2fixp(matrix->matrix[7]);
>> +
>> +	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel->r)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g)) +
>> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->b)) +
>> +	     drm_sm2fixp(matrix->matrix[11]);
>> +
>> +	pixel->r = drm_fixp2int(rf);
>> +	pixel->g = drm_fixp2int(gf);
>> +	pixel->b = drm_fixp2int(bf);
> 
> There is no need to round here, like done in [1]?
> 

Good call. This makes the CTM test in IGT pass with a [0, 0] bracket,
i.e., it means the CTM is applied with zero error. :)

> I don't know if the performance improvment is huge, bug maybe you can 
> precompute drm_int2fixp(pixel->r/g/b)?
> 

Good call. Doesn't hurt to precompute.

Harry

> [1]: https://lore.kernel.org/all/20240802-yuv-v9-12-08a706669e16@bootlin.com/
> 
>> +}
>> +
>>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>>  {
>>  	struct drm_colorop_state *colorop_state = colorop->state;
>> @@ -184,6 +208,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
>>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
>>  				break;
>>  		}
>> +	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
>> +		if (colorop_state->data)
>> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
>>  	}
>>  
>>  }
>> -- 
>> 2.46.0
>>

