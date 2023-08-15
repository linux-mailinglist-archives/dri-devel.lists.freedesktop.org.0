Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2E77D1F0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 20:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B19410E199;
	Tue, 15 Aug 2023 18:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1801010E199;
 Tue, 15 Aug 2023 18:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7izHaKPQXxwJ4D/wuJFHrxvZvIVVtKVnyKZGr80fnGxuELVbe7c1X57jhPW/ztxjM3kzhdyJJFYkI4i+mb2mT+ryVwnV9SPi4k63KWpX2UcR1ZinwCJ+spjFFezuc0xvCdWI437iaf9T2CEJGRZnq0GKwoTuDX+pn7slxGyE2IUVgMKwtaYvMwDySv9FRh0gLQN9M+53sdWukQSaYWx+jtab1wCBMCOQPs4Gi/MpBvI++TieBnQOBUs4wqpDwneAMpKjne68Wgi+2zsxX62Bc5la2sW1tLguDlebzaBRxavdBGsQ5C5Fzb+vr1Lp8hAbGjFb/i1KPAfQY2hY2eQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQa+rJbVNIeopDc2qqPkmuUpAx6pLNaUBew7+bL7Nj4=;
 b=d0n4x30xG2miFPBagdfOVuKcb9J5LWPl26b3S0z1E3130xBHRpHeIcErx49jlEGJ1TeGrRr7yY+n5Eh2EPcpCIoCVYThdVUEqZGOAEt+nQ+Xa0hC7rvt+gZLoGaB5H+MGk70dLVdYLxnY7ukw+nRY19qsEOqzNVaBhaXfa47RqPfy/HY9Fgcc/bI4f9WJM4UYRtMnNKYC7wkc6PICjr2eRS3yK3uzSFX/4Wmk2+/GkHJItn000MADys5JvYkFxX7R4I/e4edMOT+EsbbzDbCwYUC47YM1rhmZkfzDlA89gwo/zw/M81zVp/vDQtpCDF43Gxy11+dov6F8tSBuXjFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQa+rJbVNIeopDc2qqPkmuUpAx6pLNaUBew7+bL7Nj4=;
 b=p0Bka6LD4pq7rQrtUgat4QvvqPZNy9/Z7D4S8eGUeP0oads2F7NRlOKpixxiTsRd9Ck6SIu1Fg5AvJ3Pl6yIJM3GAqA/s8z5M1Z7Iqtl0P6NzEzSUlgafmvLxCHeh2VgnOS0uAz9swLsUo+zo5hZyRgjG6TlVwcAlN/wLmqnVoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:36:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::36f9:ffa7:c770:d146%7]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 18:36:55 +0000
Message-ID: <3caa31c0-39bd-42e5-8e59-7ac7f197dcb7@amd.com>
Date: Tue, 15 Aug 2023 13:36:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230815172700.255596-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0103.namprd05.prod.outlook.com
 (2603:10b6:803:42::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f31212-39bb-45bc-1c83-08db9dbe99e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdpK13SsvmUZC6m9nbOIa0Qn5Z77RdU71oLXjdI/OZzMmrj98gXMjMGHh5mpXMzOmKFYJadMkLbdH9VWROXqjF6eWY5e36zx32gUxH22rdIxegdkqDFTkRBo6TN0xa22gFoLPmd2W2B414szJI8xYvb7dUq8LHze24IeWDboEC4LQLglk7cJTjG8u3x2zdnfjlHOCRYOHYs1QGcpJc3WxKAG91GU3OZt88uT9AjngJ5j/sbRomomCxOl0Jw2q1KffVnVeTdSaYQaNlk6CBE5Vo9p1aB5r74MmqmJAFH1VZstVj2L+aG5lY71ZkgtnqHwpC5Op268JyAYGIrELheMSDC7GsZxLNoztctTjRnQDakjiHI6NAq8karUVxD5VzXQ7dgj/R7XaqP6XOEvaVASRITa4+ZWhQza1HVrTFlQHFFJ0q3mxgrGIQiUHMZLm2ya9mga5xyWbCRQ+BM+XsJiMVQexC/dA8ULr4OXppLFjUUrbUKt7GSf18GQ0ak3vPxCpAUqukvIepJLe0IHPEdLsJEMP2C3H7HitLFAOOyTHWmKsT8XK328Okfmj1EXPScH8IjUNtu+ZsbMkwAP2NKqbl9NqMRdknYY3oWbOHD3pyAM+dgPC+otoxrNz0VDpdKmNGyJsMGSP6Lvu9uoovrAcK2vy1ji6hVteHcRjbjZCu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199024)(1800799009)(186009)(26005)(6486002)(31686004)(38100700002)(53546011)(6506007)(54906003)(31696002)(86362001)(316002)(66946007)(36756003)(5660300002)(44832011)(478600001)(8936002)(8676002)(4326008)(83380400001)(41300700001)(66476007)(66556008)(2906002)(6512007)(966005)(2616005)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJLK1hqeW9IUXM4RkZ0YjA3Q2o4cjViSVY3TDJtUXVXTUVmaUFUMHJQWUFN?=
 =?utf-8?B?MkhVN0lTMlUzS05jNWNVQ3NOMGtvTXRpa3pqWVFUa2syVmxjWWJSdXdaanF5?=
 =?utf-8?B?Yk0rcldCaWdXMmI2eG5aSW4rZlk4SngxS3Y2U3JScHpDK1lrNkhNbmR4ZUk0?=
 =?utf-8?B?UWFUeXBTT1B0S090MUhXQklwSGpYejZvS3Rzc1JoS2ptMElzRUhFQ2o3RmZx?=
 =?utf-8?B?S2ZTSk1aMGozRzhtWkNzK21kNERRd0JVM2RlWUg0ZlVkV0JHakl0MEVWVTdZ?=
 =?utf-8?B?Q2JNRG9SUEV0SGMzNW9UZ2ZOSm5tZGJrQmVTN3dGdlVaM05rcXRtQVUvRVBU?=
 =?utf-8?B?Z2ZXcGp3dHM1VVV1QkdYNUtyUmdvMlFRZVF2NmZyR1diZFlsOFA5TVNlQTJr?=
 =?utf-8?B?ckNneTNSblJpendNTzhXcC9RdWRIanFqYVUydTNsaVgrbDVtVTMySmpMZjRG?=
 =?utf-8?B?YkpBY2N3NEJPRjZVb1RiYUoybXh6UlhxNHBJYVEzdkFOZnZIMGlvNkc5Sm5I?=
 =?utf-8?B?VjA3VzJmbVgybWVsT3EwNUsvbFJvMlI0VlNUajNLU2cxUFppSDhXbzdFRXBq?=
 =?utf-8?B?cERJSzFjaUZzdjFFeTlzdzFMZ2xmMFdMM2xSdjd6WTB6QkdmSy9XTkdxbjFx?=
 =?utf-8?B?eVBBaHdxM1J6MzdYd1dVSkRsUy9pMDFwQXl4NVNqU040aWdVOEluR1B0bmda?=
 =?utf-8?B?cHRsUkZYVnZuVEl0TWhPSGNvNFhMQlJEVDhHSFFjNzhmdzZ0RGhZNUw4ejlP?=
 =?utf-8?B?TlIzTnJHMUR6WDRHQkt5Ymw1MlN5L1VydXRUZ3lBNmczSGZ4N1RjbFFrVDZT?=
 =?utf-8?B?bzhHcXpRUkpNNGE3NEg4aTBuaGR6YjN2N2J5b3ozT1h5VWVvSVZsYzNkRTM0?=
 =?utf-8?B?V3lkMzZjcngwWUN1SWhtZGx2QmgxNTRVMjZwRWJhMnF5SkhjYnlEbEM5QjZI?=
 =?utf-8?B?U0ZiRVlHdXl0ZlBRWEN3amZzZHpVUGFLS2hWdmJmMVhBMENBbW05K2VJbVE4?=
 =?utf-8?B?SVZMN2llZzNZUk5aaERsbWplZktXNTBtbEpHUzd4V3IvSDlxVmQ4UU04Q2V5?=
 =?utf-8?B?cWt0VmRrQmhjWmJ4U0VjamJoRTBRY3hBUjZGeVYxSHk1TGlXdFpLUDRzNExn?=
 =?utf-8?B?bmV4a2xjMlR0UUNOTDZDbjc0eHp1bjhlaUVyd1RLY3BjNXlpb3hGRlpkVGV3?=
 =?utf-8?B?Tm50L3lVOTNDL25DSkJ3VC9mTng2TVpaQU0yTjk0a1NId25YQ1htaHhzRUg4?=
 =?utf-8?B?eTl4RnpXY2lPMk1weDNudUw5WVZ2Wnc1ZVFTNEZjcmdpVTA3a0VER3Y0REE1?=
 =?utf-8?B?ckUrOVN6ejF4aDBidDNrWUk3ei9iQVBQeGd4WnhJQzdVYlhoRGJYYXErWUxa?=
 =?utf-8?B?L3JtZWNXUTVaN1NXNVdaNXpIbmhIVjF1alExbFJkbkl6SW5PazdlNnhxKzM5?=
 =?utf-8?B?aFRUb0FCOFRsMVlKRHFUcDdZd004bXpQSFBPMG94dTdwYTUvcXhhL2hGcVJj?=
 =?utf-8?B?ZnZtMjUxOER5ZnpVeTZlZGFXN0tGS1Voc2wrckxac0JML01wV1Z3ZnYyVzFT?=
 =?utf-8?B?SWJ0NDF6T25mcnlYSVoxbFhtQ21uSUdCVTVWdzR0MXNCNFZEVHFCMWVBU1lG?=
 =?utf-8?B?VVp0Ull3ZE16Ukp2dnZSdTF6WW1Qays1QmNwbnJiNWZlelJGajU2dWdhdCtm?=
 =?utf-8?B?WjljV1ROSmlkNHlZc1RiZVM4NWxvTXdEeGtUSUhmVnd4Qnp5TzFqU2VlbTlV?=
 =?utf-8?B?cTFITS96MlRwLytYbEx1TTR6TmtRb3hsL0xPdlpNelZRQ2xuOE1LRkVjYkZu?=
 =?utf-8?B?NjU0U09iVnZuMGlmNU9IWDRob1pkcnBVaG5jeUdHc2xwRVVhRGZJUWZ3L3Jt?=
 =?utf-8?B?cEgxZG9UakZhSkxWQUJWT1hpTHk5Ukg1U1RubFBLQ2pZUHJrRGVnQXRDUUY4?=
 =?utf-8?B?YWE1V2FndDNsdnIzYjBxNEVvUlN0b3MvUVQwZWNia2ZMVDZQb0s4bTczVFhI?=
 =?utf-8?B?UmtIM2FOKzZ5TDhNbTJ3c2VzYzAvYm1LQ0VBdDU5dWNkUUxOV0dTWm9wUjVk?=
 =?utf-8?B?SUd3c3JoNlhtOFdoVUNhczRDR0d0SzF1T3JvMGlhb1p2Qjg2SE43ZHBWaitQ?=
 =?utf-8?Q?l2YhgVcuvenKJzehgzz+4BBN7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f31212-39bb-45bc-1c83-08db9dbe99e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:36:55.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AxeH6BgLVmwiKMtEsXE6q9/fsc355URQHVdEk7WxEg1isvyTGGNyMeM9I2Mcjqi4t1viQPwKkRHOeihodrGJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guchun Chen <guchun.chen@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/15/2023 12:26, Hamza Mahfooz wrote:
> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
> Otherwise, the framebuffer might take a while to flush (which would
> manifest as noticeable lag). However, we can't enable this callback for
> non-fbcon cases since it might cause too many atomic commits to be made
> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
> framebuffers on devices that support atomic KMS.
> 
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: stable@vger.kernel.org # 6.1+

This is safe specifically because other things like FB_DAMAGE_CLIPS have 
come back to 6.1.y as well via f1edb2f58adb ("drm/amd/display: add 
FB_DAMAGE_CLIPS support") and fixups to that.

> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
> v2: update variable names
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 ++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index d20dd3f852fc..d3b59f99cb7c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -38,6 +38,8 @@
>   #include <linux/pci.h>
>   #include <linux/pm_runtime.h>
>   #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>   	return true;
>   }
>   
> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file *file,
> +			  unsigned int flags, unsigned int color,
> +			  struct drm_clip_rect *clips, unsigned int num_clips)
> +{
> +
> +	if (strcmp(fb->comm, "[fbcon]"))
> +		return -ENOSYS;
> +
> +	return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
> +					 num_clips);
> +}
> +
>   static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>   	.destroy = drm_gem_fb_destroy,
>   	.create_handle = drm_gem_fb_create_handle,
>   };
>   
> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
> +	.destroy = drm_gem_fb_destroy,
> +	.create_handle = drm_gem_fb_create_handle,
> +	.dirty = amdgpu_dirtyfb
> +};
> +
>   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>   					  uint64_t bo_flags)
>   {
> @@ -1139,7 +1159,11 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>   	if (ret)
>   		goto err;
>   
> -	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
> +	if (drm_drv_uses_atomic_modeset(dev))
> +		ret = drm_framebuffer_init(dev, &rfb->base,
> +					   &amdgpu_fb_funcs_atomic);
> +	else
> +		ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>   
>   	if (ret)
>   		goto err;

