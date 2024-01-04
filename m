Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992268245EB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 17:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C310E4E9;
	Thu,  4 Jan 2024 16:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B3810E4E9;
 Thu,  4 Jan 2024 16:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyr+6tAVzBTlfVK92l/auRhAOtORfPni6/hn9VkiRcLJdShogwHyUHKhmDeuoF9D5pU66lIK3dozzFFoT7u4/t76o9cGNazuR0pRMnaY3sT67E13nbOvsegKs+8liHYreFwhi9EWIWShH5JKb1GIHE/ZzAwplQ7Dyb+bBmlXEOWxjRzURKW/JQR9afzHepc0eLCFO6a1t+A6W8dwIka2nJ5ih644W9Jno7jtv2LYaKsyPjNXgMM0kFKD4bKGKYl128CKzGU/hp1AwNsrZ24v70qibxldIbZ9A3sbhmZDdhSpRvn1fmgnNl8FBQIpJHeF4NI1PbzdTRU7IWTPhPTVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjXc4yFlHvJ1zicNkH1aEiEIxz1Wv4L93K9HCT3ZOcE=;
 b=YPNvVURwh8UJ9NiOLg/kiuBLgsrTBGKwmbEpZ9aGY+bHZmch8PdYpjAJUjf4bpuOc+nOI2/Y89qOYc3P6GVEN9Tg7VEldaOmajMhKTyHcrAbvVpn3ajaDXkcC3uoqP0OI8rpQGWbBc/DsUKf1HDFC7xvfSu+5AAVrDOEk+gmP++XKfaPUlZA5wl9JNsUxw9InARYUvtHBswgMjAwk/Ekdv4MMImlnGGVgkdeJ34CsKMeklgXCzqu4sAjrxGXKIP6ua50JAu3U2qj3bIQuBSCQvejIW1L60XsxerQthCE+zY9rwRnlHyZLU1HxKnxGOP5mTSLczr5/eHpabj+3QxsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjXc4yFlHvJ1zicNkH1aEiEIxz1Wv4L93K9HCT3ZOcE=;
 b=X9bMBICHTTnKsknLfYq3bIlWIjKf4d4dDz1zoQ0meUjSNG55K7Y4Sf8cgUCNDYHm3UPFSXDnPtELXmM24YrEbKBl55bdyedqmQBomkWNqsWh1uoO63yXuFkCycXqFmw1Imp/xm47SAYeHZlALPcnRYaioOtfZPLMRw6rkWGwLRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB8524.namprd12.prod.outlook.com (2603:10b6:8:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 16:12:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7159.015; Thu, 4 Jan 2024
 16:12:33 +0000
Message-ID: <242009a3-6e7d-4158-83b4-25be6425a7f6@amd.com>
Date: Thu, 4 Jan 2024 11:12:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 21/23] drm/vkms: add 3x4 matrix in color pipeline
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-22-harry.wentland@amd.com>
 <20231208151142.67beed2a@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231208151142.67beed2a@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0219.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab69aef-28d2-4167-1a9c-08dc0d3ff571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09QQWWdbvo32iZ0+123FlyIr4cG6Xm6sQRS08NKelpSOb+jLNy4FvPRTl8K3wvVGj0Yznyt0rA5COfDrbhlTtUMBa0940eSflfWsqvKNNXQn8u7NdFq/0nwJ526jNDVMc/VtNA+dNN6YfBf67ibJKpPGICQEuSSxK15D9HL6OSbcmUNLcK03gJQimu/GvFaZefOZg4XT04qpy9g7ncy3fH9fdwN2CAzCr8705UYd7X2pYDuOP+8jmTdeB6nLiOJP6bI9SupZT8NKzX2NnSkZFrexkzAqrnb0G33wZ8XFEJLdA4fkcR/0H+azRUdeh89bWn9l9b2wUaHJBn7yRDBUyZuv9Z8GdA7TU5HVhoxQY4OD2h5Tlyfuz3yUOq3U23C9XC6DtDy2FGQ93z+tgxHKlKWGo/W9Hr9CghsMZa7cXa6hMgdKCxBv98srGJITiYIRm3MfjVa/auYvymOsrYrHNJU609FF0juK+4U6AmYqsG4xXbw6VUbsEZLDvqHYCirlypE7GOzgBTk9MeW0YpKxH3L3yPskfzroTcZ0iJCrcb4jwRvDmju6FI5kw+wsLRdyz+t3H1psCj2am1Il+gyrZnVyQofnlgB68aoZKnOPr483JBPaZY9OdWk9qyFCBdw2qcRMI2Rh5uMi9nCHcV3tEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6506007)(2616005)(478600001)(31696002)(6916009)(66946007)(86362001)(66556008)(316002)(66476007)(53546011)(6486002)(6512007)(36756003)(41300700001)(31686004)(38100700002)(83380400001)(4326008)(8676002)(8936002)(2906002)(44832011)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q003YnVKY0NqVXNaY2dwYVRmem9XTHdtaDBpSUxkbmZzRjdyWVJSTktyckdV?=
 =?utf-8?B?cXdHUUdkVkFJd3cySzREUTdSQ3luaG9LeWJnWFRYSzlZd21uRXpUeUJTcVBj?=
 =?utf-8?B?U3ZEdWIxVWxnWEpReU5PYTVYdVpGQWQ2RTZHc0N0NERWeHJqL2JFOW9LNEtl?=
 =?utf-8?B?ZE9xRjdsQkJFNkRuWmQrNENMNXEzelZKb2J6ZFZUVGpFYm13QWJTWlh3S3dk?=
 =?utf-8?B?SW4rMStmcjhDVDFJTUpWeXRWV0Rrc2w0Qno5Yy9RRjJnbzdHTlpVTTRJRUoy?=
 =?utf-8?B?YWRIbFljbCtiRGV3OGt2dDhGaDlMMXNHYWdmY2orTWlmdVNaV2wxbnJIQUsx?=
 =?utf-8?B?UGY2algzZURLaWtwOEd0Sk4yQnkwQS9KQTZ4ZHBZMUYxTzZWK2RsNFhhUGl0?=
 =?utf-8?B?cXZwNzR6STI2enBORFJnM0h1WFdDSW53NDBzTWExUmtTTDQ1MFFkT1JZTXZt?=
 =?utf-8?B?bDRNd2xuYWpBOGhiZ0NNb0pKWHR3SE5BVWZKRTRlamNrdnBJMFhJWmhpaGdH?=
 =?utf-8?B?Vm5OaStENmVNUmgxTXlKS0NKL1kzYWpQRzl5Y0l2dkZSNG9tdUF4MzNWMmFN?=
 =?utf-8?B?M0FHOVNWd3hLbXRPa3BLT1FUdDZWVjE1dE9idzBGWE1NdW5zQVBDOE1jVnZz?=
 =?utf-8?B?MVJ0Ym5nRWcwd0ZmM2Qxc1NBcllhWWtWOTZEOC9PQnFkbXFIZVlvUFp3OCt6?=
 =?utf-8?B?UHM3RUsxNzdQNCszTXcwVkI5T3FEYTg4R1Nnb1NlYTR5a2JtZkp1ZElsbDNK?=
 =?utf-8?B?SzhLc1YwMThHM0Jnd2pXNjZQNTNKMjJCR3gxbEdEN0QzVXpqOHdDeFpmY0RB?=
 =?utf-8?B?djNaWGg2WnFtQ2dTcW85MWJFRWJMMnRyR2JFbUVYYVZTbTRpOWRBZURGeDhC?=
 =?utf-8?B?czlQNWlUMVU4bEg5TExUR1R6MXJTejFzQmx0Ui9BOTBPcmt2akNPZjNiUUdS?=
 =?utf-8?B?bWVTRDR2Z0dHT3JGcG5CcmVxcERqVTd4MlAwOTVkNnhOY2x3OU9SbC9mZUJE?=
 =?utf-8?B?N2RweG9Gb1J1NFFqK3BjWlEyYldaLzZPOGJtbStGQ1B6d21FbW5jVlE5dGY3?=
 =?utf-8?B?aTVKUi85blU2RWpwaTR6RUNMdEI2Z3FBeSsvY0NnamgwZTkzZVJIdFM1Nnkv?=
 =?utf-8?B?c0ZvcTJRaUg0WmZVRWtUVTVYcXJjWndZQ0dsOEcvRkttS0F1ZjlnZmlkRUwz?=
 =?utf-8?B?RDNGcURKeGM0SjdlaGdabFJSVE5sWEdnZTlZbWpKLzhrVmN3bjN5NDhGUDNx?=
 =?utf-8?B?Q0s0TmQyTFRQbmhVaWliaDhnSzRDZG1lQW5EdU0yT3FoZHA5eGgyclNtcDdx?=
 =?utf-8?B?bWFVYzFtQm8xTVRlZ01Pb1RKZFpRell4OHljNmo1SWlqS0Z6NEdqWGY2d0JE?=
 =?utf-8?B?V2M0TEdVZ1ZIbmcwOTMvVjVQYi9TbTFReWxxMW91SDYxTDhVS1cwb2hRUFFw?=
 =?utf-8?B?UGR5WkZFdEZ0MEE5Zkh1b3ZjODBaVUFPUDBRWmpxWTBWbEdMN3JqZDdOT0pP?=
 =?utf-8?B?NHhIR0FLMml0M1NOZ0Y3Zmo1aURadHJvOTNVUlV5bThmUDVRVjBEdko4eVNV?=
 =?utf-8?B?RnhTOTlGWTN5bkpqQjdERFlrK2dVdDRXNlRRSy9veVBLeHpBbzhVdHdyWjZy?=
 =?utf-8?B?ckQrbzFiYXVEb1pTblFtMXREMTRtK0crRUs1RGlCTFlTTThNeE5neFBySUZV?=
 =?utf-8?B?c0p5SkpYTGJrQzlnVXEwT3lTNy9ZSVF6T3ZST3JjbW5iamREdUNUNXlkUkdh?=
 =?utf-8?B?UllqQzVtakViNjVBVjVWaDA4N2kraG1jcm1tL2IvQTZlNXIyRWIycFFwQko5?=
 =?utf-8?B?UXdMeS9ONTlSUmlYQnVuZWhOS1VCRENGOFNmOGJzYnJDS3NROUZsSEhRZndx?=
 =?utf-8?B?UXdCZ0RJZi9sejUrZlJuVzZnQWt3cXl4MGMxZThqc2xRakhZK1NjamEveGlX?=
 =?utf-8?B?cWpaK1NoMDluUVl2a2ZNNHJkSnEwK1pRd0o0U1dZaEhQaDlBTGY1UEY0VjVa?=
 =?utf-8?B?c0lHZXNGdnltR2Rxc3JEZGFZNUhkZFdlcUJ4dEZjd2pkd2syZzcxVnVVS3JG?=
 =?utf-8?B?Y1RaK2I2YkZJUm9QZWpuUllHS1hpQ3I2RzBRN0Y1WGlIaU9QcDZrNCtBQmxT?=
 =?utf-8?Q?M59mb1UXN1BFAT1ygD3R5XWuP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab69aef-28d2-4167-1a9c-08dc0d3ff571
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 16:12:33.3431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6hv9cafaOrr/jQB1vPCln+Ch+FU89wG2RdhjqkEQwa9/K1eUW1iPZBGBiwO00VW3VvjhWrcunSee0RuJkgrvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8524
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
Cc: dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-12-08 08:11, Pekka Paalanen wrote:
> On Wed, 8 Nov 2023 11:36:40 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> We add two 3x4 matrices into the VKMS color pipeline. The reason
>> we're adding matrices is so that we can test that application
>> of a matrix and its inverse yields an output equal to the input
>> image.
> 
> Would it not be better to mimic what a hardware driver might likely
> have? Or maybe that will be just a few more pipelines?
> 
> People testing their compositors would likely expect a more usual
> pipeline arrangement.
> 

True, but my focus with VKMS was to get the interface and core
code off the ground and make sure it's all (mostly) sane. For
more realistic testing we're currently focussing on creating the
AMD color pipeline in amdgpu.

There's definitely value in mimicing real HW with VKMS but it's
also a non-trivial task and somewhat lower in priority for me.
I think at this point there is higher value in getting a real HW
implementation off the ground.

Harry

>> One complication with the matrix implementation has to do with
>> the fact that the matrix entries are in signed-magnitude fixed
>> point, whereas the drm_fixed.h implementation uses 2s-complement.
>> The latter one is the one that we want for easy addition and
>> subtraction, so we convert all entries to 2s-complement.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> ---
>>  drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
>>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
>>  2 files changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
>> index 9a26b9fdc4a2..4e37e805c443 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -31,7 +31,37 @@ const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_e
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
>> +
>> +	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
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
>> +	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
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
>> index d04a235b9fcd..c278fb223188 100644
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
> 
> Again, if you went for performance, you'd make a copy of the matrix in
> fixp format in advance, to avoid having to convert the same thing for
> every processed pixel.
> 
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
> 
> Likewise the repetition of int2fixp three times for the same value is
> probably hurting unless the compiler knows to eliminate the redundant
> calls.
> 
>> +
>> +	pixel->r = drm_fixp2int(rf);
>> +	pixel->g = drm_fixp2int(gf);
>> +	pixel->b = drm_fixp2int(bf);
> 
> Btw. why pick s32 and not fixp for your intermediate type?
> 
> Using both you get the limitations of both in range and precision.
> 
> 
> Thanks,
> pq
> 
>> +}
>> +
>>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>>  {
>>  	/* TODO is this right? */
>> @@ -185,6 +209,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
>>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
>>  				break;
>>  		}
>> +	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
>> +		if (colorop_state->data)
>> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
>>  	}
>>  
>>  }
> 

