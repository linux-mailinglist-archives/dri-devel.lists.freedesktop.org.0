Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305CC3EB4D7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 13:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454876E7D3;
	Fri, 13 Aug 2021 11:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F446E7D3;
 Fri, 13 Aug 2021 11:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQrLRoPDh20J3qgh9y8X86cT7AtwBeMnkynCLlwayli2CK3LUC/8g49bnpp8IoZ9xqWPAXVfU1JrLZZX9FYrrQltusPCgumuFq3j6PdzPYo21aBh3DIFSu2vmoVLDVbXqp0fkcV3itbPYfrFo1l6yJYIfKWDvyUHFPPMiU9JBZlWJnA39UM4k0zzLd+fJoKl+hKy/nmdGR3fL8L4bjEzwPYm+nYdZ4/t8deU+zee+L3OiN0QgRKfJg+EgXkwEv4mmhrhhj81zy80z3K374/JwS8waXcGobrS3n6m2Mi2Yypa54JUc092RBGpKmU5vBM4Qk4R/QDddcADTZOYQaB/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoNs+Luvm5ezyyxHDtrxDDFVbEHhC9h/bcsWY3w0vaM=;
 b=FTbMcgIFaChgI5xCirTVzSIRITOYorH8pYb9FXJSTpgzJ1j31XxrWLFLkPQDeNc5yT8G9TjDSYsunA7xa1bJW+wh/Q4x709r7qDM/F7eqlzfJ3gkgE4voHzfo/dB6nxAKDN++ENRod2Mr7FmPsFVmRAMoPOidfaoVzf2XZZtcxuYoPAaTxOYmwkJWn8BxkMTZioSW1M6erwSisPsnjfF4iS2umfqXb0rBc4XrWzJfvGOAx5kQpNw27z4MLCJsmC09x1Fi6hGn/rd1SVJSmsDPP9pOlU6q/EWvgG+NWkKQrDgwdwMtqbmGapkw9gno+S5A+PBnh0yu7PsjImJOsd2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoNs+Luvm5ezyyxHDtrxDDFVbEHhC9h/bcsWY3w0vaM=;
 b=AbO0aXzFFZoNeNXX0Pob8CYa5IY4qjZ8zupTnwHhSafWnbLpMm21gHBuhWckWNmlo5vwBCEVe1agYpDZfMh6G7QWafxzsWTCXAyrEY2KFY6rmwckSAQEGwOXuQplD1KZC/EC+BleVJUqRrnTzzn4uqUAOFbS4xFQHv0FnOzsXNE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5301.namprd12.prod.outlook.com (2603:10b6:208:31f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 11:50:18 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.018; Fri, 13 Aug 2021
 11:50:18 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
Date: Fri, 13 Aug 2021 17:20:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210813102920.3458-1-michel@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::23) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR0101CA0013.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Fri, 13 Aug 2021 11:50:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7cb88fb-a898-419f-79f4-08d95e508588
X-MS-TrafficTypeDiagnostic: BL1PR12MB5301:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53012BF0375B2CBE1950672E97FA9@BL1PR12MB5301.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9a3PA6dNMHZigB0niQZNnPgNJ3QxTzfUUtTeOoVrqq2rq8hZlKw/1uxMCxoNunUxQqmomsRTEVXhgxVdLyogIGY/THi0xaCD5Ji9yvtd4HsHGeqHC3jeCsZ5mr/MOCoUeaqFE72zlQXPJxWeCZMMft7sz8pD5Jlt+k+HL+xsyH1BAMWi8USMHOouO9JbW15C0sPI8jjNjA9UhT9Un+H20zgYV/eD7hNaXxyhYra1pxT5E+NqG7dwcy+/SqmahYnZGnY0C60k/QTOQPwchyuyewGcWKD3f+NLqmXaxQ+krXZjdPh57AI5hcTk4n1TMN/D2xnmRLmzI+3lwXiAUm3W9PPBKdPKrqC+Q5Q69StQYFZTTwLCvWCD7uU/wSmyofq06Vi6MA7pJ9h3IwT8ZEnColl23lV79T+5dh3ZPfCKT6+th5MZMd8WbFpz/wEdh+FOPHprt14z/DKL6O+hEZ6fIhbgSDA0kcsZTMPoDfCQmvMmZkV7i+QRPDRRf7bJMOL/w8FHp0SZkugFy8Co+ksOXU/z1nc7f3rgaPSezx7ZIxeCCQwpN+wuAQTUrJTteP5w4oLfD7aH0lnvrrHynopRTq4hXZQ/6dUVO71xZ2aouedXEuraW7XdFV2ShKx7lHi1PRDC0l0drHz7aLtur0rFXO6lQod9ihZLhXbd45fqerckn3Mvj3p0lbu++Ygg92esUOVx9vD7li2DYh9ogiquLLewaaTgxliVoHVkoaFefHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(36756003)(4326008)(5660300002)(6666004)(83380400001)(2906002)(6636002)(66574015)(186003)(956004)(66556008)(8676002)(26005)(31696002)(66946007)(31686004)(6486002)(53546011)(2616005)(8936002)(478600001)(16576012)(110136005)(316002)(54906003)(38100700002)(86362001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUtobzY4OTBHbUdTUWJPZTYrKzBrK0ZHb2FOdUU3bXovaWxQcGIrM21oSjUr?=
 =?utf-8?B?MEd0T0Z3RGorc1FVdjZVV2x5OHNENmp1SHBzSHVQa1BpQ3R4UFlianBOTW5u?=
 =?utf-8?B?VVdWdGJmbHAvMzIzbkE5V2Q4VzRaOHVyaEFjV2ZRc2RBcUJTbko3ckN4UlNO?=
 =?utf-8?B?aXowZUduYktDYm1PV1cvbGlkK0Vwck1JdGhlRGgzcEJmakk2eWpmZkRiUDI2?=
 =?utf-8?B?L1gyaUxBRWJ5YnM3WHpkWnc5Rk1NRGQ3WkFjL1dpWTM4ME5SVGRLeUdiNHpp?=
 =?utf-8?B?bmE4Sm5XV2I1aFA3Ti9qSFFnVG15REcwR1I4RTBDMDRpbCtXQmhhcTdDQTZP?=
 =?utf-8?B?eWUrNEppV21OU1FoYWVGMVVpMXNJcXdMWkV1dHM3aHpORFRDcGQzTSthQ1d2?=
 =?utf-8?B?SzRpUnFuckVoUUV0NDRwZlVRbWJsWHAvdXNwbVpOUWFSYituQVZjZ28rR2Vs?=
 =?utf-8?B?cFNvNE41eHJPMEE0RGw2MkRrTjJ3TlI3c1BPRXgvWnIxYmg3YjVKWWMrMEtT?=
 =?utf-8?B?a3NncWhwN2dCSFM5NU8vclFIdkNTUVFyRDJ1Z0pCT0FaV2RhaVZTNmFoOElJ?=
 =?utf-8?B?ZXF3UldJMDI3YmJyekJCQkZJcFJRakRPWGhnV1hjWGwvclRWcXQ0a2FyQWlt?=
 =?utf-8?B?Z2NvVFZBaU04c2g2eXFGeVJpUjVaTzhxbkVVK2pKU2YrdGFvb3VnUmxBSlIr?=
 =?utf-8?B?WGdVNHJiOFQ5Nzg0L09LS2hTeklIaHJUMHphMGlXOFBKU0Jsb1RiOEpUd0tG?=
 =?utf-8?B?NitpMkVYaUhSYUcxMm5PMnBWRzBMeDBuNXRRNVRicnViZ2E3cFBZOWphcEdW?=
 =?utf-8?B?b3BZY2x3dmVHSXFJaU9DZGxxVk5ISGUwbUNGVjJ6clovcEVsU3Q2OVVDb1o3?=
 =?utf-8?B?ME1XMk1JY2xXMXpNcGI3MlNVaXZrUHo1dU5OS3lYRldlTUpDSWh6amlJc3A1?=
 =?utf-8?B?TFJRYUlqQk5VbGkwMmMzVDB6cHJuZ2tGWHBaMU03YURRRjZGbXk4aVA5dFhF?=
 =?utf-8?B?NlRUL2xDb0RiaW95MVZBY043Q0IxUHVBVVFieW1qOHh1WnRPaVlUUGJRNXBH?=
 =?utf-8?B?MExXczZWWC9mYkFLV2J5eCt6TERaVThRWW4rUHk4c0hMS2JCcGV0NzgrcXRk?=
 =?utf-8?B?MURTYUppSHA4WXQ5UUN2Z2RQUkUySXdmL2ZFY0syV1lkbmZCcGU1K0dvNVFl?=
 =?utf-8?B?QzdoYWFuSVZNYm50VkRub25uMHI0Ui9qaXB1N3NKci9yUGZoazJ1RjM3OGsv?=
 =?utf-8?B?blJLaWlOSXZPbVJrc3paYlRTcDJ0WGdpY2JxRHJmdTkxWXlxWVhaNndLdDEx?=
 =?utf-8?B?b2RqSTV6eG42ZHYrdy9UMUwrS01jTTVBdlo2RzgxUkZTN2Z5TjdITTRCcEZv?=
 =?utf-8?B?NHZSZmZEcXJvSWpHYzg2NHFTWWdlaFFBUjVJK21ZOHFCWXBMNEJsR2g3N3lX?=
 =?utf-8?B?YXBQSnFBa2Zucm5zVVRUVWY1RTlabkZGOXc5ZUZFUHc5dm1hVEhUcVZVaE85?=
 =?utf-8?B?VTRWQ29nZVNXcUVWRTVBZ3hyOE1RQ2hpMklZRkRmTmF6ZHV0Zkd1MTR3cmVi?=
 =?utf-8?B?ZWxOS25NQzlTU3NxQTVRUlh3eGFGZ3Mya1JRUzZzVm1IQUI1RWJPY2xwdnFl?=
 =?utf-8?B?eTRaNGlCbFNVaC9HelNhRXlYQkNNUjZ4dzFvL1pYa25CNGJsc1pKY1I2OVFZ?=
 =?utf-8?B?aGNLTGh6UzhEUGQ0WjVRT2lpb0NhTllaeURVS1c0RndHOHRtakhkRjZYbEE4?=
 =?utf-8?Q?KaAN/A/ziCw0IrqUUuR3Uma9qjpZHYdXC4ig4q6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cb88fb-a898-419f-79f4-08d95e508588
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 11:50:18.4635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I668EbE4Vp/hdlUj7KSl7KL+8XnjQTzeBSIjky95TFHlUu7V0ev3FCTUHHrfUzF1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5301
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



On 8/13/2021 3:59 PM, Michel Dänzer wrote:
> From: Michel Dänzer <mdaenzer@redhat.com>
> 
> schedule_delayed_work does not push back the work if it was already
> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
> was disabled and re-enabled again during those 100 ms.
> 
> This resulted in frame drops / stutter with the upcoming mutter 41
> release on Navi 14, due to constantly enabling GFXOFF in the HW and
> disabling it again (for getting the GPU clock counter).
> 
> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
> enabled to disabled. This makes sure the delayed work will be scheduled
> as intended in the reverse case.
> 
> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
> to use mutex_trylock instead of mutex_lock.
> 
> v2:
> * Use cancel_delayed_work_sync & mutex_trylock instead of
>    mod_delayed_work.
> 
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>   3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f3fd5ec710b6..8b025f70706c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>   	struct amdgpu_device *adev =
>   		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>   
> -	mutex_lock(&adev->gfx.gfx_off_mutex);
> +	/* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
> +	if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
> +		/* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
> +		 * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
> +		 * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
> +		 */
> +		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
> +		return;

This is not needed and is just creating another thread to contend for 
mutex. The checks below take care of enabling gfxoff correctly. If it's 
already in gfx_off state, it doesn't do anything. So I don't see why 
this change is needed.

The other problem is amdgpu_get_gfx_off_status() also uses the same 
mutex. So it won't be knowing which thread it would be contending 
against and blindly creates more work items.

> +	}
> +
>   	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>   		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
>   			adev->gfx.gfx_off_state = true;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index a0be0772c8b3..da4c46db3093 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -28,9 +28,6 @@
>   #include "amdgpu_rlc.h"
>   #include "amdgpu_ras.h"
>   
> -/* delay 0.1 second to enable gfx off feature */
> -#define GFX_OFF_DELAY_ENABLE         msecs_to_jiffies(100)
> -
>   /*
>    * GPU GFX IP block helpers function.
>    */
> @@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>   		adev->gfx.gfx_off_req_count--;
>   
>   	if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
> -		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> -	} else if (!enable && adev->gfx.gfx_off_state) {
> -		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
> +		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
> +	} else if (!enable) {
> +		if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
> +			cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);

This has the deadlock problem as discussed in the other thread.

Thanks,
Lijo

> +		if (adev->gfx.gfx_off_state &&
> +		    !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>   			adev->gfx.gfx_off_state = false;
>   
>   			if (adev->gfx.funcs->init_spm_golden) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> index d43fe2ed8116..dcdb505bb7f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -32,6 +32,9 @@
>   #include "amdgpu_rlc.h"
>   #include "soc15.h"
>   
> +/* delay 0.1 second to enable gfx off feature */
> +#define AMDGPU_GFX_OFF_DELAY_ENABLE msecs_to_jiffies(100)
> +
>   /* GFX current status */
>   #define AMDGPU_GFX_NORMAL_MODE			0x00000000L
>   #define AMDGPU_GFX_SAFE_MODE			0x00000001L
> 
