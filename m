Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA360EFFA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 08:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBE710E4E4;
	Thu, 27 Oct 2022 06:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E0610E4DF
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 06:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGGfzIaD6gzIJFus0mvzD6HPMdYSwgqrKAawnLlT4vrD4MVEXpnu6RY6dhKTsgD7sVDR1nfCYBeS7cAOk+XsATkEW0oRAocaPzNF6McrfcZj5vcU8W9fYYKl6dYZlKRB7zOQrulR8om3gTKkW6VHYEzTiUbIOxNs3WGqiVyoj1vhzuBL778cCzkKT39zHXY97TUlUccmuI/I6mvkIrpAT7LfwrUOJVtfCQowP578gwjt8Gvxn7nY3c5/A6aaDdQMfXXUdidHmXR1GISAynXpYN7Hp/zu7XhCnRaU7haDjJRleHhMZ7WAn5vAP5K78hA6zZvK/5forOrIzYEGi4fl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98lh5zfoutqgLofLMCNlmEOIQysarUCcJt0aTQraSv0=;
 b=jgvsxLLwhuBv/o2nXr2gMKHjTNrO2f+Gq7jwgdRYfMMLloxkMSATEcCpFK5CYtLrm03hKwL+lOuqM+k12noS6FvhDrI2LZ2KrSjHOACAMn4NHCm9xtIAUQSnisnFAhrSI3j8Y8sRCasyNAzyLcuL410EzGKzpOujvrkJhaRTJ0OlnxRQoUh4Ywz5fjz2o+ghlTop5MEfaksVKEs4lnp5YhOg6jbhODaAwvTmj65Kew+cLGIFNjZGrwrqKesoLzSUhbkl6efXy+9qyLZkjPrN1UHMF1W/M048rxaV26n8Zbw0itdQt/RA/m5TlGgn5YAJYMZ+x68DKo5Om0XDelPcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98lh5zfoutqgLofLMCNlmEOIQysarUCcJt0aTQraSv0=;
 b=ObEFO7K/snvxhOZNRSfnM2Ezl4UanF89r0ptQ61B7hMrdrh6CbjZ7Z3xRMnglUyk7Mnv7QZxzD0gnWyV4o8RD3eiUMObRSs99ImHVDH+y3+x2B0FCjyWI2F1a12h5ynMZwXdRxfwmneXrhZ7Uf5ysIvu6DOYPlNMUiS5dB8n/6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5305.namprd12.prod.outlook.com (2603:10b6:408:102::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 06:17:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 06:17:37 +0000
Message-ID: <6b37315d-74d0-713a-3544-b8d4c873488d@amd.com>
Date: Thu, 27 Oct 2022 08:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 2/2] drm/gem: Check whether object is NULL in
 drm_gem_vunmap()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, noralf@tronnes.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221026224640.7542-1-dmitry.osipenko@collabora.com>
 <20221026224640.7542-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221026224640.7542-3-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0181.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f505b8c-83c1-48f7-7763-08dab7e2f1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xfia2SDVZS6xVMt+XKNe9tgzeCQx5Hkcjv/4BAh9GYSD8WhEHKuHtkcdCK+3dG6FVzSn3hdJiagpvgJBwwSu10FAvYb3gOLpdM2st9efh5SJ0nciiOTVpSgmYqjmy2LLo/RWJaDP6J5iZ6kGioY42KL6F8onCHcZJ9egXiLzEC6EICDRifAM3S8QZPpgFN0p79KJl4Ojtjnrrk+fylD2I+REq/Ru6iSzwKjGTsxNELTy+ux/eqAp/uiHzuzMjCV9nfjn9yPcKDIUJ+3z42XJDt3nQz/RyfCzmSjncwM3XT6KGDDtPJSqa5pVnOe3qt9HiTUFg+l2EhiOxYQSh4K0yWG4iM+RPJBs1bKw4856u1dx1xb9/jmsG5UQE8iLYHYwRM8UIJBvVmeHZxIjM8R7ZW/Ocv6IrWSMFkUSuwujV5xkH0kf8vCIo+UceKwfpZBpeXJgOXQmvIwacOHAf32R6W/vN9UIrPBInPTn23QxRbdHtxN/3YgCgRFpdfZtc5mCJsSu0LCcecDZ6Pre3az+RisKGojHtil5DcQuVCaLwlnDS0R+dZzC6yFTQR1reKf5s3+W7QPOXRPgHPA8XdXgU2RStI7TaIIGsBNRyTZOdZpDxUX40Z+Clb0ReBB6gpBKlviaKKW4sXMfJKZR/Ugt+72XL52qCweFQ5MKEqi2vOtri1bSNhNJ7MojYYAerhENHUPjYZ/Z4QQiwGNGiiyq1XquUpug3O3pnuu0XlLWODzkzSlyMWJGAP26qoTnTqwlOIy0+OBuk8BgApG6pAi3Mz1GVDsP8FH/O4cqE+4oqRQSbSMQQCavRyQ/NTQlbLJmSxYtPpzxtM5TE6cx7Lmmyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(4326008)(36756003)(6666004)(66556008)(8676002)(6506007)(66946007)(110136005)(66476007)(316002)(38100700002)(5660300002)(2906002)(186003)(83380400001)(86362001)(31696002)(26005)(6512007)(41300700001)(2616005)(8936002)(7416002)(6486002)(966005)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmNEU3VockVOUTluZGg0SStyRXJma3N2ZUtXT2oxYTlKMjBwaURpNWdlaGt1?=
 =?utf-8?B?dGNqK2E1aEROOUlraEpOVkloVGRUdWdSZ1FhL2daRmhZNWFDeGhkeG5RdVNh?=
 =?utf-8?B?STNmZkJEMUhQVVJDU3JxQUh2YjRTTEo3dkxvZ211ME1uQkNMU3J6dnBnaEhM?=
 =?utf-8?B?STRjMWgxYjV6RkczdXI4Si9JVDhhQUF4THZZUUNVZmRnN1V5VHZ1RTdPRzhr?=
 =?utf-8?B?ZUM2QUg5SXEvWjArRFZ5alp3Ylc4U2l0b1haTUVBM2Z6QXRIb1NZYlNzbmha?=
 =?utf-8?B?OVJLMjdlazZKQmU4M2VRL2tETWZiVWpSY1FBRXBLNWR5d2NYd2p4anE0RUFn?=
 =?utf-8?B?aDRZelBISU1xaXRGQW5pYjA2RVFVdC9EeTV0Yzk3ZnYvelBMVU1pd2pyaHdG?=
 =?utf-8?B?aTRDdmdwQ2hDdmZOR1dZeWlHUkJUbExTZndxVWRPNGZSK0MzZU1icWNPTmh1?=
 =?utf-8?B?UjVHUFR2SDZsb1JSNFpFc1VpYnZnOVZVek5jQzJaWDd0MnZqcElIaDRKL0ly?=
 =?utf-8?B?YmRyUUZoUWY5VEtvNVhwVkIzVlVBbjFJTDIxS3FMYzFiSS9YaUpxZTA2VW5D?=
 =?utf-8?B?ZjVEMFltanNYMGNGZFA5VGlVSjNqVTFXL0Z1WFc0cTluNGVmUk9ZNzZlaklm?=
 =?utf-8?B?TnlhREw4SjBXMXh0eEl0TG90MUZFaEdZZTNadVBuUmdNaytZWDhzL2VsQWpW?=
 =?utf-8?B?K2YxK3Z0aXd0WHIwblRQeU9nTXEvZ3daenhIaGtZcHZESjZMeDJOK2ZEZDJr?=
 =?utf-8?B?VWZEd04rU09VS252cll2czR3WldmbW1CUCtjMFZlUWhtakpVcEdVQmswclVv?=
 =?utf-8?B?aUFCck4zcTdpaTNDeTYrY1hBTnJlcmk4dEVhL0l6aFNTUDkxQndMcy94WVlo?=
 =?utf-8?B?bGlSL3VOc2U3dWdNbm0vczY5M2FLRFpyLzdiMnZXM3haY2ZUcmhvejR4Vklo?=
 =?utf-8?B?WTltYWxtTXl5QnFvKzZtcnh2M24ybkxpNjcxODFCNXpVMWJtakg5QWhCQVds?=
 =?utf-8?B?eE56bGUzbHFSVzdmVitHUWF3ZElnUWs5NEp4MjRIWXdVUWU0UGthVGlkYkFT?=
 =?utf-8?B?ejE2ZlVtaHpqQm5rUHNpU0NLUWVzYUFlYy93L0tjcG5WbEhTMzRYMmFuYmlJ?=
 =?utf-8?B?OEVJTVZIQWhZWkpabGF1UVY1MUN6NnFLQ2V0UXRaRG93VlJNTHdBbDhxWVdC?=
 =?utf-8?B?d0Q2VjVzYndlTnI5VDVrRjN3WjJZOFViZDFGWDJhSHROOE9ZM2dSOGhiaEdF?=
 =?utf-8?B?UHhPS1ZISWF3Nmx3TnJIUk91dU5VTmdiQzMxTW5YdEVDdGZ2b1hlVDd2bUc4?=
 =?utf-8?B?cXhXQlNrTU5EOFV4RENBYThZTDVVdmVEQ2N5QTBXQ0lKU1hnM1RJSUdkRlBy?=
 =?utf-8?B?NHpFbnVVdEZ5Rm03ek5wZTBCVmtzVk1UUUcwcE5aZUg3MWtpRXRjSHNpeVZk?=
 =?utf-8?B?OE9TWWhXQTVkZzhHeGJOOTgvRDB3Vkl2TzdDQXFCbnJQWHQzNDI3NGRDS0Js?=
 =?utf-8?B?VFVlZVJUWXpYTzdxeHhmbmhkdFBaQTRrZlRJcGxaMXZBaVQ3eHRyZ1dxUExw?=
 =?utf-8?B?czNDTkFBdVRhRzhRMUt2Y1o4cjdFYnVHcStZYnVhb2RtNU12Tm9qNVN0ZHFm?=
 =?utf-8?B?dVIwL3VRbjdEcldwdXU2aFZETUY3SGN6WUhRT0FaZVkrb05iZlhyM29Dcisr?=
 =?utf-8?B?bElRL1lhVFFQVTVJVEpHa21pZkhRUitUbkRJVGNKTlQ5ZEVUMVB0TDg3SHQy?=
 =?utf-8?B?bnllV2N6Z0VNTHdIU2w0bXBGWkk0eUVoUVc3Y3BrN1NNWHUvbnNsWkFKY01K?=
 =?utf-8?B?Tlg4ZEJMekprc0NwVno1YWNKbHpTeUZ4SkNudkMzQTdPVjR3SEtIUFp6ODNy?=
 =?utf-8?B?T21jcXpUNVJzNGNLanFwS2tSRlo4UHN4RXBrMTV5d1NKWDF1eDBqbVVwNWVn?=
 =?utf-8?B?a1hINS9KOWwzcVprMCt2NVRXMEpMMDMyR3RIZ0VLd0RGb0IzejEyYnhWZ25r?=
 =?utf-8?B?N3dZWG1UVWE2VjA4UW9qc1hzdG95alNkQjdjYlB3SkV5RVpHekZqV1ZYazhz?=
 =?utf-8?B?bm5uM1ZFL0NNSUNTTllmZVlFdVp1Z3FJOG0xNmtIYmhZR3lxNkVJQ2dBdEg3?=
 =?utf-8?Q?AaEt9yxsU6XSKOPXxIBxkllbu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f505b8c-83c1-48f7-7763-08dab7e2f1f2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:17:37.8225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mMYtOOZlR6xYF24sbr67mf6YR5ydmSyVSFD4udni0eNPXsyZ08Ac4pCbDeO0eH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5305
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 27.10.22 um 00:46 schrieb Dmitry Osipenko:
> The drm_gem_vunmap() will crash with a NULL dereference if the passed
> object pointer is NULL. It wasn't a problem before we added the locking
> support to drm_gem_vunmap function because the mapping argument was always
> NULL together with the object. Make drm_gem_vunmap() functions to handle
> the NULL pointers better.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Link: https://lore.kernel.org/dri-devel/Y1kFEGxT8MVlf32V@kili/
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index b8db675e7fb5..ee0a246ff4ac 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1175,11 +1175,11 @@ EXPORT_SYMBOL(drm_gem_vmap);
>   
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> -	dma_resv_assert_held(obj->resv);
> -
> -	if (iosys_map_is_null(map))
> +	if (!obj || iosys_map_is_null(map))
>   		return;

I'm not very keen about that. Calling a function with all parameters 
NULL doesn't make much sense and is clearly a coding error. Hiding that 
somehow doesn't help but rather makes things worse.

The only execption to that are things like kfree() or *_put() which work 
with the lifetime of objects.

Why is the static checker complaining about that in the first place?

Regards,
Christian.

>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (obj->funcs->vunmap)
>   		obj->funcs->vunmap(obj, map);
>   
> @@ -1202,6 +1202,9 @@ EXPORT_SYMBOL(drm_gem_vmap_unlocked);
>   
>   void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> +	if (!obj || iosys_map_is_null(map))
> +		return;
> +
>   	dma_resv_lock(obj->resv, NULL);
>   	drm_gem_vunmap(obj, map);
>   	dma_resv_unlock(obj->resv);

