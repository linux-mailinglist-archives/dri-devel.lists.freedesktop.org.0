Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E377D9F2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 07:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E426810E2C8;
	Wed, 16 Aug 2023 05:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B64310E2C7;
 Wed, 16 Aug 2023 05:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsBRMeJl2E3TshpM2g9KnJtQztBfc2kdoZsAdGy7YqMQFomdtitQzVirKk6mTSmom1bMZ6f2hbNltxio26JU0YwqYamA8m8hyNK77+zq0xatqYuo7JJaAzreh6Z4TD9bvVamOTtta1XPz+0KhHx4qVsSMBtXNWcS03VdUgPaBgHkOrAxymqFciTTpRFnNsSxEgkuuZSk8Tz1ejIUkGCbv5P06oAL8ohOqyz44TH9fvuglFjXltH/QySNkpwqviRfhT7nf+bgMWucBBPF/vw3+W6c8JlJ8w05kx90wO3507C6ij6tGMNKwAADxi0aByHQwwR2dksbErnd2WIg2+gSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8bxG1vnVwV68u3ZeCudYML6fFNhD/w55fKbSsvan2A=;
 b=DtQm3JAJqokoC6HeYK9+0Nio6YhqN0HhsUtDdLGtG1Asr1U4YV3bBqidlRlHCEwcnDSuJdzQ/sJpB7KcDUuq4alXzNSqgSMGn5d4SqVBA9VksIgHAkETmVIsGWhifawk7uHEDfXeO0flMW2Pga9FSKwBCc/6NRvAjxueOIHAZk5ZzX2q03H9Y0kC7BHPQpM3NjiZ8c+BPgtVcGPwP+TuhkbnR3tVtyoMaP7rU9CLDw9VuM55Fu59sC6EcqXzmF4jFFu30Ek9nubp2Hk2greUlJtognrIzVzAknZouNCAF81stwkjleh4TwJOku8qw86wdoMvL7iHW6HJkbqR61qCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8bxG1vnVwV68u3ZeCudYML6fFNhD/w55fKbSsvan2A=;
 b=C099pVHh++Rer5nCTC9a6EVqAWmGaRePs+WoZOPm1YU+EBYY1bf2f9M4l/dNzILFZttw/c26tkbIWgCY/6irPsHktBeKDVfyCvZ2hObEqk/xaw5q670WFoM5JHeDncFm6PgzNyyE+XYSSgcdgOwovfcw7pzuEBq1mlOVlSmguac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5476.namprd12.prod.outlook.com (2603:10b6:303:138::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 05:48:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 05:48:10 +0000
Message-ID: <fe4664ab-8401-a86b-b160-f1b85cc63152@amd.com>
Date: Wed, 16 Aug 2023 07:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230815171011.232410-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230815171011.232410-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f44f24a-f9be-48dc-ecac-08db9e1c5fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: us1d23VYWfk7/C1K9+7x5O1ElA8S5bWEzWCwezKh+g8FJP3QnW+UbkQ/Sb25Bwz314o0pbC/VGsl9W6NTZG2RKFGD/JJf6YvdrFfYIzeko7VeGn9E9jVJ41r5Ec9TTFVDDW2//2oZzwlAebpzI3vQVZCY3qo0v44lJezm0rvU3mXVCOeSkC9rEHrGvYHrJ+6hSRtRJPF/HDi2H1NfaHuZ9VyIbv9wVzmOCm0spu5pJq+Qo0+MiB6YBBMqZ5B8AFp5f0Cy8HWg9p5hXq1RRAM8//fxpetrrpmiM1QGNGMuTkggp2+f0XQFS8CD197d9qfRJSMw8mnBdBfkJj70SsA8GWGfwUvzOLF04QJM2met9wQ2E3D0p23VlnpltGZaubRKBBsUsqGmozY4y+jKM81COMv1KX59KLiK8TtwogZLZgXwUNNeMy47QCg5l913sPpHzOQkluIYJM1LVTACXWTMViHTT+EL9hPTo3XBFIXcMgZlrWKa5/BmT6YlJWz7okMCvtm8DGjJ35KBC+n4FcL126CVJnsaNO4pwkiibcuElH5hhibzXjtpnHbVVo1lArxJPZZSfJ/ki3bOmOWP9u0AbXRQq4apLpGbW7CsTHPZ6yDlpTfcDkZ/HizD6AQ5bSurSd3MdXDZ6m9jzlaAfdD5noJiKw5d4Dg6s6wExnLcqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199024)(1800799009)(186009)(478600001)(38100700002)(6486002)(966005)(6666004)(4326008)(66476007)(66556008)(66946007)(41300700001)(316002)(54906003)(8936002)(8676002)(5660300002)(2616005)(36756003)(31696002)(86362001)(2906002)(83380400001)(31686004)(6506007)(6512007)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1pCek1KVDYycnNneUV2TndpZ09yQUtRTVErczY3elczUngzYnFvdGljVCt0?=
 =?utf-8?B?VWNXeFpnbE0xNmFxYkZjRk9RNFNwbmhOZXZlcFFRNXJxd0Mva3pZNUNDK0ha?=
 =?utf-8?B?cURQWHA3N05GOTJRRnZyMjZ1K0dBcHdUU2srNmJQOVFDRTRtc0xVMXNZMUIz?=
 =?utf-8?B?UFcyeWVmSmFPclJlYWlDaU1CZ2syNmRYa0VBZHVWbzFLR2xUWlp4VU05bUpt?=
 =?utf-8?B?KzI4OEg5eXhNbE5MQ01oVWhQQkltanhXWmRVSUdKelJXOEI4K2pqSjJUY3NC?=
 =?utf-8?B?WHE1QUJkczdWdkppbUNGcVk0Q29mMlJ0YjJWVHNTblV2Z2JvZWxQQkRPWkJT?=
 =?utf-8?B?RzMyY3Y3V0w0bVJCaFpORGNOSzNxRTN5OXFVUUVWNEtOb09jWkxCZG5TdDYv?=
 =?utf-8?B?RE5XNzhEYmtlRHJyRWdlTWVMR3g4RTU3R0xOQzFCL3pTcHA3R0hVQ1BIY3ho?=
 =?utf-8?B?RXhYVVpvUXFieHNrMS9GbFhCUFA0L20rQk95MFozcEM0Wkl0RHl3cUJxNkli?=
 =?utf-8?B?TEZTcE9YdlpvdEtJbng4SnAxcHAxNkpFUUNIQk84eWs5cmc0NjZtaUQ4RHha?=
 =?utf-8?B?Z25NaDJjYkFjaWgxNGs5cnN5S0xBL1BMclFkSHNFNWFsMWJKN3pSQ3FwbmFV?=
 =?utf-8?B?MUhsQ3pvOStNUkppM2NOdm42MUxHRkF5Y2kvMTdDWUJxeHV5ZHVaeWZVM1RK?=
 =?utf-8?B?UEtIUlFhWEtISmwrUG1VakNLOHhETFd2V3hYNWUvdWlFOVZ2b2dQTnl0Rk5x?=
 =?utf-8?B?T29QajRja1lSd2JCMG5Ba1FSK0ljYW9zekhoU3N2WUxOcjVCdmVtVWEvbEFI?=
 =?utf-8?B?V21xK21abXRsYURITlQwTlNXTm5KZkJ5SnFBc2dyNHNNR3FUWTUvdmFvbWta?=
 =?utf-8?B?THVFVzdQamJScTRIYXdsMFVxVk5UekRRbXpheVBYWDJRUVd4Q0Z0M1Rta2lz?=
 =?utf-8?B?dHlMNlpVZU00amphM29sY3JyOXZUR3J0N2NxU0VWRzVsbGpFMEgwenc0NWpK?=
 =?utf-8?B?SkFhNmpWUExQMVp2TitaVzBKWnR3L243OHplVkk5MlV0VTdrcDZmdk9RT0pZ?=
 =?utf-8?B?eGZCSU1sclF0eUUzb3ZhbHcvRjFPdGhjVkVVM1pQb1A2aTY5U1l0dUN3cWVk?=
 =?utf-8?B?OW03WDFoU3dWNTZJenhUR0VyMlh3V2FSY1Jaby9iZTk3QVc2VEdyNnFoa3J3?=
 =?utf-8?B?N1l1OFZ5b25QUEhGUUZMQ3FUMDJ2M2tWdit5QVd1QzZ4Y2ppSnl5N01WTmlX?=
 =?utf-8?B?eW9YT2tqSVhnL1Z6T2RncWRkMTVKQUhOK2RMVmtOMGlESzYvUTFCaksxbEdJ?=
 =?utf-8?B?eVZEQ21hNk9sVURsQjBGMEFUdU9DYi9xT1hpREpyQ2xVL2JlQStUdXhFNTVy?=
 =?utf-8?B?Z3RPZXhKK0c5UE1tRVg4dTBWV2h1VXMyN2xTT2EvMHVSWTF6WCtEOTZEb3k5?=
 =?utf-8?B?MHpzUUgwTStWbEJkN0N4bTVUSGNPOS9kaWxVU2NrWnhqdlFRRjBhTHNqd0pv?=
 =?utf-8?B?UCtIQmRCQk5JN0M3K3lvMThFNStuMXJnN3RtZStteE5aeGZLOFRJbUVzRFNi?=
 =?utf-8?B?bklhUFI3aGloN3Z5U0JmR1hWWmxkeWdiSndjQlJ4aHlzeTYxNm1zVVBuaVpG?=
 =?utf-8?B?R0s2bk1NOGhMY1dEN1dFQjZiRjRKcjBjVzBRcDhxd29DNEc0WkNXVXhISUFj?=
 =?utf-8?B?TVpXTXpUYkNmZkxRaWczOXlHZW5rdnRmenh4YWRnbjBFMHdPTXYrdy9DVVBu?=
 =?utf-8?B?MnprMjVGZVFLYXVGVG1wY0d0QjUyak1Rczd4eTZYYmxvRHp6ZjdqSU5rbjg4?=
 =?utf-8?B?SUdSekxiZ0I5cU9nOFdPa0M0TTMrc1B4QlNZV2RZSEZCNlJZcS9WU25aTHcr?=
 =?utf-8?B?MUtjWWppNDM4WDlGU2IxbTFSc3crTnZvdFV5Y2w5cXl3bm0yclhSb2FZQTQx?=
 =?utf-8?B?QnRxMEI2bGNRcThSSmU0VDhJaVVqYVUyZVd3d3hPZFB1ckdLajdzWm05UjZX?=
 =?utf-8?B?WGd3V0VkcXgrNFQxQ1JXOHN2bkl2N01HdE9Pc0pLNG1mSnFUcWFZbWVBNzQ4?=
 =?utf-8?B?ODhZdlZETDhaaTkrbVUzNXhmWnlnZ0xmRkttNFlsZmllcnZCbld3ZGRaYXpG?=
 =?utf-8?B?YS9CZ3h1RXZmOE44Mm90U2hDRW9JclVmendiQ05VdFJMWjJjcVJNdU1sMkRM?=
 =?utf-8?Q?QN8W85m4afVEsnAUmCOgnyj70hQgNS0GDkm5CX1vaoTz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f44f24a-f9be-48dc-ecac-08db9e1c5fa6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 05:48:10.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oYE+js3AYovOcXu7VZfCofUjdBrZjyhYPyedOqrl3efd+CsVNa4cUMIdBAxQRf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5476
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
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.23 um 19:10 schrieb Hamza Mahfooz:
> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
> Otherwise, the framebuffer might take awhile to flush (which would
> manifest as noticeable lag). However, we can't enable this callback for
> non-fbcon cases since it might cause too many atomic commits to be made
> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
> framebuffers on devices that support atomic KMS.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: stable@vger.kernel.org # 6.1+
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 ++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index d20dd3f852fc..743db9aee68c 100644
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
> +	if (strcmp(framebuffer->comm, "[fbcon]"))
> +		return -ENOSYS;

Checks like this are a pretty big NO-GO.

I'm not an expert for the display stuff, but in general this here looks 
like a pretty ugly hack.

Regards,
Christian.

> +
> +	return drm_atomic_helper_dirtyfb(framebuffer, file_priv, flags, color,
> +					 clips, num_clips);
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

