Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC32716E95
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267D510E41F;
	Tue, 30 May 2023 20:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8A110E41B;
 Tue, 30 May 2023 20:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ehelh62hUCXD89PB/FqJY09Yag/uVH4XzGQhx+AJmEAxEHewpQOssk1mpl8skvgbnneK9SRU8FKrfMynqmZ8gQQy96zQO6Dt8UgMtz80dcFpdhUIOL7zAF3RJyBVEA875O7Vy6PYRA4X3n9rfpyCne9yfuhll40M+UjjZmKZOrwbQrM5ea4w+fObO0OoP5XiH32YlaeLh6+LhYk3l39s5Q0KZCXpe0ekx1Y2rD0vK/76YuPKqshz7wza0MUhzze6XQYOC7LH5gf7YiZA/BWEHwKWfVfn7hG4plvYG2QrX9o5dNoqqpOlxdgpCXxGX1f0imQYgkii97x00hoOSmqE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsbIMB6rMewvhyEDqbf2dxXEdhhvIShgRv4NhSIjobA=;
 b=oFCnTPnm2/Hy/8GawPzVZzux7CpxlKqv5HBE0AWs2n1Q7n9j+aCeG4+3FSEX6VZ9/qmIJqMkhsWZ/56SiAj9D/1spHIVaAAQC2Na0hmKlC90elxmfsSK96fWsdOwXxKRei5aGRusM1xgm4MPfDsh0fnrubj5gl2dtnYcb7HWj5mc2rDc1KP/Nvf0ialqFzNm3prSSqShYW56cynnG8rpkPNGlhsV2fEHZBTaloJc3mjtwZIHlwhFfJ18lrFhmLkf86vKbBd9kI0iGfkygeat+Nua5Zj+2ZOPYVadFdly3MELYxMGMq/QmSl3QjPZiWg5c68h3B9gGWf8VetEKuGzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsbIMB6rMewvhyEDqbf2dxXEdhhvIShgRv4NhSIjobA=;
 b=eq7jrDraQLKGaNlIJ4FMKwIYVbz7Pt+AZiDlhqkT//HqvJrUVrET+eujcVTqC9xjF1hQFzkmfBzNbSZbYe9L28EsEHX096VPg1+Ppgjy64iXwWooOb5w3vv5xjhCSpiKwMIl0yOszdPcLuImsJdnAuxYFytxjei6ySwtWT0Qw94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 20:22:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:22:32 +0000
Message-ID: <218324b0-4625-c637-283b-bd19e8bce8b6@amd.com>
Date: Tue, 30 May 2023 16:22:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 25/33] drm/amdkfd: add debug wave launch mode operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-25-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-25-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0092.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ab21d3-840a-409e-492f-08db614b9914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iK3WcDOr/dstl6J3EaZ0e9mxz6cAj8wrigBQAkHGP8hxaJHkckD7oLlH4bMHavkc30YVTxs/AayNkGHOOhF1n4s1cIQQJcIAcLo44mn2cBRN1UdIGDVwqrrso+4TI7loLZnx7o2nzKFD1VOeRDXdIYm/yHaZmZZP2CY/FyMouwFAgC9s1BvDtHFNAc6BiWTj2oUbWYvxvYPKxslu8ZkqROznPqz59SXt9jF7EyArOyO0rRnbohFI5bmA7BHKIID5KTJa8hdHXMsEiKAIslJFKPT/hL4B7u1IM4BMbY17NT7BmhEuZk7Lf6QnelhazjKuNZ7QWyZ0f8XHcX4asFEaWx9kH0IaPLSo+WVpLGrIOtX52WstDMuCLGMaYaJ1kjANp9/qZBVgKuQG1+cxZnu1iUFipOJ7jFmDZwy5J3UVY2aaG0KbBpmmXyP9hicGog6l3872p5LpK9SHCV0mk2IqSZ/xxh7n8mY45T2Tbn0gPnWQWmDiBKqIPFX9UpjZpIacV8cD5e86UCoCC+KkvNEu+kmf7r87y/X3V65iEizYwm2MA2Nrbjo6xuavg+SQFIoMV3t5QrbsmAJTMc2N8KQOyOgRs5j6jm1IgU5R/uQ12nYtH6EVkhScbxBkpu+WpNDVHsP6W3AKY5+RIkEI5swgLXftpmprjSQTuvqoAgnIiuQsqXv9J5JcDm7AUyyg3Y2g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(26005)(38100700002)(41300700001)(6486002)(186003)(83380400001)(6506007)(31686004)(6512007)(2616005)(478600001)(66556008)(4326008)(66946007)(316002)(450100002)(5660300002)(66476007)(8676002)(8936002)(44832011)(86362001)(31696002)(2906002)(30864003)(36756003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aS9GSnNyNk5NNUQ4RGpFckFETm83ckZMZTBaQTYveFkvS1Z6TDRUMG5vUnhS?=
 =?utf-8?B?ZFllZTJZZmtRREV5eUxCRFoya3RtZ0pNMW44L2daUENoUkV0dUVTaUFuTDF2?=
 =?utf-8?B?OHhFNmtYSVNiMHlYSHY0cDRIZFV3VEpHeExmM2JEUHhCKzNYSU40Vi80REdW?=
 =?utf-8?B?UFdlQ0p3bTkralM4SU5SUlRhdFMrMTAvK1ZrbngyQjZhVDlvWncwSkllYkpC?=
 =?utf-8?B?Uy9iZ3NKeExodHJvZUVYL0t0NDQ4S0cwYnhlMWdDSEV1Y1ZlY1psS2pLTTdo?=
 =?utf-8?B?RlhPaU9NTlAya2szV1VLVGRkNWJUeGRYYVQ4TXlqTld2amQvT3lxTng0clpM?=
 =?utf-8?B?dWhHU005TEd1TGdjUlY1VlVpQ0hNVGpQMG1sWFpoSmp6Z2wrM3dIVW9yeFdD?=
 =?utf-8?B?R0w5M1ZJZ0h2b2pvTUxMMDh5Z3RVWkg0MFVLcDVxQklucnNhZmRNV3Evc2FL?=
 =?utf-8?B?SXhYWjl1eHZWaXpybm92TXFoaEZaQ1RhYWsvdmxJNlB3YXJ6TURaM05Mamdn?=
 =?utf-8?B?MmZnR3BNM0ZzSXRWSlNNMWJkZnBCakZmcUF3RWNRL04vMWlBYjRUOUw1aCs2?=
 =?utf-8?B?elEwV3duWDRWcitzRHZiTkRXQ1VaTEVjZldrQTYrWkxKbmlVcXZnODlNdFhS?=
 =?utf-8?B?MitpNW4rZ3dDMENVbnNMREVtaGdkMnUwRFVWT0NWcHdWYzFJSVcwSk84YVNm?=
 =?utf-8?B?akJKVVVHMExwZzNqZXd3aHBwVVpwd3k4RGkrUTFxV0NWc0JsNitWekZqQndX?=
 =?utf-8?B?YUdzQjVYTU9iWGk3bjdSTzVUZzZjU3pWNDVTbTQrS0RBcTQ4SGRWU2ZGeFlW?=
 =?utf-8?B?V2wxNlJUWWJ0RzJvS0tBcmdoWTJWNnJlWEUyU3pwSEpXR05LYkcwRVNNeS9H?=
 =?utf-8?B?R0Z0ZlZkZU91WHNUekNrQnAvRWNhRU94VHpwQU8zcEUyMmNrYm1NUnYzejZH?=
 =?utf-8?B?MG9BM2hDZmF5eHdtUzBBWHl3QlJGblcvdGxMTHBDdHlVbUx4SC9yOGxERFJj?=
 =?utf-8?B?TzNKZ2dqSDR0TTRYdHZkRjR4eGczZmxYYk1WSWpSOVJHeWhzMmZmWHJraktu?=
 =?utf-8?B?dSt6cWpxYWw1TnhYNWkwZmx3eXVSOVdGY1JjUWYrZmhDYTdzRm5INVBnRFlV?=
 =?utf-8?B?SGNBR2FadmozUHgwSUJTZ0lIeUhja2hxMGtadFJUWXVRbUc0YmdLY2VBTEky?=
 =?utf-8?B?aytkQkNEZTNqY2VTNFpOdTR2WVRHNkRtZVYzR0VTbVlTaTdGY3dBWDN2UTlI?=
 =?utf-8?B?UnJKRUJzQkE3bDVMNW9OS1ZycGFGTmlXOWJkVU9hOWR5VFhOLzRBUTltRUs3?=
 =?utf-8?B?NUpvK3Y4a0NsY1RHNXcyb3A0Y0xzMHRaSmszelRpVHJMNFFMMzJKYW50Y0FV?=
 =?utf-8?B?cXA0ZEl0RGFtOU1tZGNwRVEyUEdIQ052Rkx3ZEVsSVFYaWlZQkgzZ2p0dzd6?=
 =?utf-8?B?VkFxN3l4MGk3L3hFNnJYMFJNc2FaY0FJMVFMZjFNTmFDR1FQVnkxYndrRzhJ?=
 =?utf-8?B?QWlxM2hJdE9jaGdRWS9uN0c1WVhZSUdFcEkvT1VpVDk4RERtN3RjSE5IZVY1?=
 =?utf-8?B?Y3VjZHlob3lQei9LUDlIbFdJQjFZZTNOVG0wM1N3SXp6em5uYk12SlNXNWJI?=
 =?utf-8?B?TytqcGQySWEyK1VaRjg2WGdDcDlaZWxpTldYNXNuemw2eTlvTzR6aEE3Mklz?=
 =?utf-8?B?R3ZLSEtsNkJRSDFPOXBVbmRCbHVWamx3NkQxSlUwTklFZWo2THNrc09zaVA4?=
 =?utf-8?B?enBmNnNpOW5XY0I2anUrQWZEV2MxOUpXUkwyZ2JtekxhdWJXNFhYR01BVU5O?=
 =?utf-8?B?K2xSdXJQbVZyUC81WlhnTTljTUtSNWNQWm5kZW1FQVNISnBBb2gxbU1vOFdQ?=
 =?utf-8?B?c2Jid3N2bFdDMnErUHAwZkxiWDg0N3huRWpvdEpNQkJzNmVvR3ovOTRuNkd6?=
 =?utf-8?B?N3UvUGVBNysraXFncEQ1cmtxdEJaZXFwaFloR3IvYlZTM0VxajFDMnBtaWl2?=
 =?utf-8?B?bmIzUU9JcFNINmxySHRlTmRDa2UxYnFUUzQ0TDFhZGt2NlhSa1IrSllVTENJ?=
 =?utf-8?B?K1BadDM5cWxuMUNoWkhSVXpiby9rMG0veVFHQm9jZjhOK3d2YlQrcmptT0pj?=
 =?utf-8?Q?clUe5TAD40Y9JzXeKsihDYTeF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ab21d3-840a-409e-492f-08db614b9914
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:22:32.3446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b39S3mkR+3mptOK5MIWkHDqvPsfCX5C455EsyCsz1ixJaCWPE0mwnakQcphC9AOWbhBAzLvtRR+Ku5bYOUNfiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Allow the debugger to set wave behaviour on to either normally operate,
> halt at launch, trap on every instruction, terminate immediately or
> stall on allocation.
>
> v2: fixup with new kfd_node struct reference for mes check
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  | 12 +++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  1 +
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 25 +++++++++++++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  3 ++
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  3 +-
>   .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 14 +++++++-
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 25 +++++++++++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  3 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  3 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 36 ++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  2 ++
>   11 files changed, 124 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index d7881bbd828d..774ecfc3451a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -107,6 +107,17 @@ static uint32_t kgd_aldebaran_set_wave_launch_trap_override(struct amdgpu_device
>   	return data;
>   }
>   
> +static uint32_t kgd_aldebaran_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
>   	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
> @@ -129,6 +140,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd = {
>   	.disable_debug_trap = kgd_aldebaran_disable_debug_trap,
>   	.validate_trap_override_request = kgd_aldebaran_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_aldebaran_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_aldebaran_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index ec2587664001..fbdc1b7b1e42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -412,6 +412,7 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
>   	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 7ea0362dcab3..a7a6edda557f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -856,6 +856,30 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +	bool is_mode_set = !!wave_launch_mode;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +			VMID_MASK, is_mode_set ? 1 << vmid : 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +			MODE, is_mode_set ? wave_launch_mode : 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
> +
> +	kgd_gfx_v10_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -944,6 +968,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v10_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v10_build_grace_period_packet_info,
>   	.program_trap_handler_settings = program_trap_handler_settings,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 57339fa12807..3a6aca2b0eaa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -36,6 +36,9 @@ uint32_t kgd_gfx_v10_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t trap_mask_request,
>   					     uint32_t *trap_mask_prev,
>   					     uint32_t kfd_dbg_trap_cntl_prev);
> +uint32_t kgd_gfx_v10_set_wave_launch_mode(struct amdgpu_device *adev,
> +					 uint8_t wave_launch_mode,
> +					 uint32_t vmid);
>   void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t *wait_times);
>   void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device *adev,
>   					       uint32_t wait_times,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index 7120927fed15..ed36b433a48b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -677,6 +677,7 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
>   	.enable_debug_trap = kgd_gfx_v10_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v10_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v10_validate_trap_override_request,
> -	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override
> +	.set_wave_launch_trap_override = kgd_gfx_v10_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v10_set_wave_launch_mode
>   
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> index ae0c4707919f..9711d5128d09 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
> @@ -726,6 +726,17 @@ static uint32_t kgd_gfx_v11_set_wave_launch_trap_override(struct amdgpu_device *
>   	return data;
>   }
>   
> +static uint32_t kgd_gfx_v11_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, LAUNCH_MODE, wave_launch_mode);
> +
> +	return data;
> +}
> +
>   const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.program_sh_mem_settings = program_sh_mem_settings_v11,
>   	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
> @@ -745,5 +756,6 @@ const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
>   	.enable_debug_trap = kgd_gfx_v11_enable_debug_trap,
>   	.disable_debug_trap = kgd_gfx_v11_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v11_validate_trap_override_request,
> -	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override
> +	.set_wave_launch_trap_override = kgd_gfx_v11_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v11_set_wave_launch_mode
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index 705669c26a1a..060331652573 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -792,6 +792,30 @@ uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   	return 0;
>   }
>   
> +uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid)
> +{
> +	uint32_t data = 0;
> +	bool is_mode_set = !!wave_launch_mode;
> +
> +	mutex_lock(&adev->grbm_idx_mutex);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
> +
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +		VMID_MASK, is_mode_set ? 1 << vmid : 0);
> +	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
> +		MODE, is_mode_set ? wave_launch_mode : 0);
> +	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
> +
> +	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
> +
> +	mutex_unlock(&adev->grbm_idx_mutex);
> +
> +	return 0;
> +}
> +
>   /* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
>    * The values read are:
>    *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
> @@ -1063,6 +1087,7 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
>   	.disable_debug_trap = kgd_gfx_v9_disable_debug_trap,
>   	.validate_trap_override_request = kgd_gfx_v9_validate_trap_override_request,
>   	.set_wave_launch_trap_override = kgd_gfx_v9_set_wave_launch_trap_override,
> +	.set_wave_launch_mode = kgd_gfx_v9_set_wave_launch_mode,
>   	.get_iq_wait_times = kgd_gfx_v9_get_iq_wait_times,
>   	.build_grace_period_packet_info = kgd_gfx_v9_build_grace_period_packet_info,
>   	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index 76812ddd35b1..18f4970ac8e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -74,6 +74,9 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>   int kgd_gfx_v9_validate_trap_override_request(struct amdgpu_device *adev,
>   					     uint32_t trap_override,
>   					     uint32_t *trap_mask_supported);
> +uint32_t kgd_gfx_v9_set_wave_launch_mode(struct amdgpu_device *adev,
> +					uint8_t wave_launch_mode,
> +					uint32_t vmid);
>   uint32_t kgd_gfx_v9_set_wave_launch_trap_override(struct amdgpu_device *adev,
>   					     uint32_t vmid,
>   					     uint32_t trap_override,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index e78103097162..4b45d4539d48 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2992,6 +2992,9 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				&args->launch_override.support_request_mask);
>   		break;
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_MODE:
> +		r = kfd_dbg_trap_set_wave_launch_mode(target,
> +				args->launch_mode.launch_mode);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SUSPEND_QUEUES:
>   	case KFD_IOC_DBG_TRAP_RESUME_QUEUES:
>   	case KFD_IOC_DBG_TRAP_SET_NODE_ADDRESS_WATCH:
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 733390fb2459..53c3418562d4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -301,8 +301,10 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   {
>   	int i;
>   
> -	if (!unwind)
> +	if (!unwind) {
>   		cancel_work_sync(&target->debug_event_workarea);
> +		kfd_dbg_trap_set_wave_launch_mode(target, 0);
> +	}
>   
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
> @@ -591,6 +593,38 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   	return r;
>   }
>   
> +int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
> +					uint8_t wave_launch_mode)
> +{
> +	int r = 0, i;
> +
> +	if (wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_NORMAL &&
> +			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_HALT &&
> +			wave_launch_mode != KFD_DBG_TRAP_WAVE_LAUNCH_MODE_DEBUG)
> +		return -EINVAL;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +		pdd->spi_dbg_launch_mode = pdd->dev->kfd2kgd->set_wave_launch_mode(
> +				pdd->dev->adev,
> +				wave_launch_mode,
> +				pdd->dev->vm_info.last_vmid_kfd);
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +		if (!pdd->dev->kfd->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r)
> +			break;
> +	}
> +
> +	return r;
> +}
> +
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index c9245221aa76..cb17869437c5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -48,6 +48,8 @@ int kfd_dbg_trap_set_wave_launch_override(struct kfd_process *target,
>   					uint32_t trap_mask_request,
>   					uint32_t *trap_mask_prev,
>   					uint32_t *trap_mask_supported);
> +int kfd_dbg_trap_set_wave_launch_mode(struct kfd_process *target,
> +					uint8_t wave_launch_mode);
>   
>   int kfd_dbg_send_exception_to_runtime(struct kfd_process *p,
>   					unsigned int dev_id,
