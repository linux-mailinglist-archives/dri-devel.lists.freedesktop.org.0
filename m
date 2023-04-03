Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C6C6D4B9B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B4610E4D1;
	Mon,  3 Apr 2023 15:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A433610E4D1;
 Mon,  3 Apr 2023 15:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzkPkjng247PYyIIRG4kSurvwk32OjQkXbhZEUjk/qF6jTgLye/7/SdJpkpWw0XGPzp9EXdiXz4wo0bWjrRzihy1EBHmjb4AQoxovlTYFhuj+CTQPmetaxIhjeTPZyHS2zwtVozsQkQ3TiZHtAlMORsDYUSrMowr/U6K5k1p3M12tVqfSm5e/M3n7Lr2w7YW7VcP1dJwbH25EoDw95AedPNEgHS3txe6qDHrwWRyUrkCYXNiOutCuYVt5htvVmtxouFVgpqs+Y8+l/EGlQQA6O685nETfKoXewhvr0Xe2wvfr38VrcMzAMduNUO3iliQ7iEVi5ylsMEKNCPCRHE+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYr+BEYcS3evb/LrvDsledhg8Ojdg6pW6sbyMBGhZvU=;
 b=XHkZiBQG1FYqjbXPswhkbod5ZvxAuh13TiTbl3wBwsLrn+u5unkSkrPLsYtGrHjUKto4qLrw1U5xyEKgvkcxpxWOUOw6vcaTjy5ih2LAETeZIbqmZaE5tXkKZf4sJ0Lont8cOYvock+EuUrg+NHBdJtppKeYpkCEpjbS1vU0xTWURLUYa2p3slgudamq3V5tVWo4xO86XRoxIrRxM0UzCpMWF1L+eMUIJl/uIIsfIDESEAfnXCKbBTKbSSwOTpT1M36Y/WnBUh9KFOYQbHmS/RIMBslvMg9P9zec2E7hA3Y1dpZervO7Nl1FfiiBMEBopimlUx6W7ZGZeiL4HGiU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYr+BEYcS3evb/LrvDsledhg8Ojdg6pW6sbyMBGhZvU=;
 b=bILXMAudUFeOCPuVtb3jXGr2TkOmMIM9NWC1kjs17BAueY7cJWP4HvWeq0R7Ihn9yeFwFqkLSupFslS2zreJTzoZKEk/tnwBGJgL8bzg47fX+O9k401zHfUOPdjyeJnSBBblOAV+olgpbcIB2MnkpMySh7szzrQEOo29Pj59AJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 15:17:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 15:17:31 +0000
Message-ID: <7854897f-67f8-e82c-3edf-e8ef923d2474@amd.com>
Date: Mon, 3 Apr 2023 17:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/7] Revert "drm: Assert held reservation lock for
 dma-buf mmapping"
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>
References: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
 <20230402164826.752842-6-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230402164826.752842-6-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 566a4c94-824b-4585-155a-08db34568b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHYOWiV5+1BrvZgbFPLyI5WemshzQ5K2QzDfuNu62quRx0wl9YUuvNh56Ua9xaC6K+cbcMr2mXm7a+L1rswwpmJJooTNyRP1VVclqXt+IzwYkTkFqGT3YGFv1zwEGXmD29q0mpLu8gi+CK90hpdNOZ8WK82SIE9nb7qRt2NvPGHlN6sxcJhkLoBeSTmPk54sJGF6eVPGzJGsiz51lkGZP9pcuSGTLgCK7w8o+F9YADX9Du/KfzJMGAH1fc1pYCLOJodZmiTX8BmTVfZUkQW0KOIoNut9pqMlry2ceQJS6N1MtZ3Y/UmGsEvVukgnfn8gXOcD+w1zQEJJQjbqEduoG2o2YpUz+N6fWsMSY/ZjoeK849FkANEFJnAChKoGXEXERfm/KQB+yq1aXJo0uI2gNxQ3O1d7tVaLcvBWYUv0dCUnau0xtdqYOlG7VwsrFQSX7yEu3KWaQSm/OFeM8+MQYOi60785G9SBkITn5oHlzpOWHhPiXnz5ZJNOiOMPNTlK/uqeyk1va/kC4XCJiu+PTPWUac3YIXwtG06wr6POC4MoX518IzX8WVEEXIkK9elR7UJfMUs3Udt8QZvqAfWXn7tqpMMwSmutecAc2qratzzUJMhR6Cpoc+nhwZuNDB3Eg6wOltgpMxDUgU8w6YaI2eL5Hryb3pRTiU5BJybsW9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(478600001)(110136005)(83380400001)(31686004)(31696002)(86362001)(6506007)(6486002)(6666004)(66946007)(66556008)(66476007)(316002)(6512007)(2616005)(66574015)(4326008)(186003)(7416002)(921005)(41300700001)(38100700002)(2906002)(8676002)(8936002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUtBalJsQkJxMTQwdjZJbnlLd0QyYTZFS2dXZmxoRUdwU1VzNEtYeS9uTUNQ?=
 =?utf-8?B?YWJqbjM2MnFMMEVQRzlFUUhmZmM2dVhDU3lvdmpJNmJiYm9Scjd3dDhwRGF0?=
 =?utf-8?B?TE9TS2pMcFBCTFFEL3lYMVdFM1pGT2JtR2tLUm5sdlc2YlF0bU5YeDB2UGxP?=
 =?utf-8?B?VFJnbHcvcW03bXVrMGVCZC9wMzhjcXMzWEFNNW1SeG13c1JIUnJqYlJHb2dJ?=
 =?utf-8?B?OGJ6UkVBRVBDaHlpU1QxOXZSTWpnMkhRYXJKVW9OemhZc21yU1RWNE1CN0Fr?=
 =?utf-8?B?bjdUaytHb3d4aWNnaTR5Z0lBZkkrYitOV0xBRXM4cGFhWVlqWXh2bFZzeUF0?=
 =?utf-8?B?K2REL0lxYmlqdzJXVFBFUWEzM0R0VEFnVVpXQzZHc1RHQjdlVlRBTisrWEsv?=
 =?utf-8?B?SkJoWDZoWUNEa3daMHhxbi9kOUE2eVB4SVRZY3d1UngwWmNCRWI5OFlqTFVM?=
 =?utf-8?B?Y1RLNEdiZXNrYmNmZGxvSWo0ZHZ0MktWWDZkNDMzNDljekhySzFGMTJvbHov?=
 =?utf-8?B?TUY4MkZSVjdZSU55VjllZW8rbC94VFZhZ0xKQjI2RTlDNjFiamdqRDUvaFBi?=
 =?utf-8?B?SGhVR1RBZzlnQjIzNDcxcHNLSytxZUliNWJ0L09aQnRlU01DY04vWVlFRVhp?=
 =?utf-8?B?WGh0UDJmUFkveDRrd0NadmFsM0FxcFNRS2pLRzBCM2cyNGM5ek1HbmRaTUZB?=
 =?utf-8?B?R0trMldPRWFjU1hmN1RJd3BiaCtXNCsrY1BoRmt3R3JGM3VlbDFSWFZJQ0Fv?=
 =?utf-8?B?ZmNvUC9RTDZka05jOWRDY2tDVnJhRjlGb2NMSmtpV2RJQXBQQjNPQzZuNXMy?=
 =?utf-8?B?QXR1TStlMnFXR3EwYm92R2FBeG15SXd2K3g1Z1ZFUU81M0sxa1lWZUQxUDRJ?=
 =?utf-8?B?Qk5EaEMxNlk5M3lCVGs2cUlTR1EzaFZBY0QrME5Bb3E5aFVFc1RiWmhZUitK?=
 =?utf-8?B?blg1eGJTZndsaVNaTXl6UlVXN0NIQ1RyOUJqZzZrSy9ZUzJTWjg2Z216UkMy?=
 =?utf-8?B?bjdaS0pWNEtQc0E3VjJwb0VqZW1WYXlYVjFqQnRSUGQ3U1kwU3gzWmZic3Zx?=
 =?utf-8?B?WVl1ZVEvK2ZOekFBWUgzaGNvZ1dQS25WZlJQOFRDdjNYUkM5cXg1MVkyeUdq?=
 =?utf-8?B?WlVFcmNscmtabURwVEl2elJYdXEveHZiNnBNNDVqdnA1dDRiRVlTVXdhVTVP?=
 =?utf-8?B?SVB4YnAvYWxYbUFhVTFjSUg0VGtWa1lIdFRsTlNJeG5kWHdka0FMM0dxdmxG?=
 =?utf-8?B?VW92U3ZXWUxkUTBxSm5INmJTaFdLbE9LSTJSZE9hZEFuRzhUS1BiSGNKbklz?=
 =?utf-8?B?V0FXTDYxRE5LZm5EalBBREZSZkV1T1FrazU2TlExUFZoMndoMzl0V0R3QjVs?=
 =?utf-8?B?cWhkZ01zclROVGFqSnhma0VYbHA5QllSbVNHNXlzcTJhdDdCaEFjanc5VTFp?=
 =?utf-8?B?UVBuajBwV2ZFWGZCNEJxNHF2OG1pNVBrcWtSQUcvVzRWeEE3OUJ3TUY4M3FX?=
 =?utf-8?B?ajBTWkdpay9zcm9QYnVLYkZHN2NKRlMxaGx6WGNCYTJvd1prVEdJcWRoQWdp?=
 =?utf-8?B?Z25nTWJ5eWtrNWZpY1pYa0tzK1AwZ2hrTGQ4TWdqeFBVRzVISEVXYVVEMVpy?=
 =?utf-8?B?YXhuZXZPczF4bkJNZUhYRXUrQlZvRitLdVVvek5MM1dKbStCaWtZR3dvaXJa?=
 =?utf-8?B?TCsxcDErNkd2YUs2TWtDRk10cXE0azdINXV1T2tza212dk9rczBCMUh0aFBP?=
 =?utf-8?B?MkFCTzZwSnpSRHFhbFdUM0dDVTN6emk2WUtPaVlGR2prMkJUWnZqS0cvM01V?=
 =?utf-8?B?dVNodWl1bmhXNlo2RFpJeXArY1pXc1VlRVZLMWtDOGs4T1VqL3BkYk9OWHNS?=
 =?utf-8?B?ckFZbWtCSTAvblJ1dXJoVTZqcVY0dm5EN1IycGJVS3B6U0xNRGdhNTU1eWdU?=
 =?utf-8?B?dzJLWWQrSXUrSFRuUzNkSTRxbzVRbVByeUMvczVCa3hjaUJhTU1xajR4dDFS?=
 =?utf-8?B?S2xwTE4vRlVDNUpLMFhUcUkwVlVLS1VFTFdQWUtiS3Rwa2NGb0lnS2lPaHZI?=
 =?utf-8?B?bU00UFdpUzRjbG45MDFTRjZwbWUrWm5QS1RFeG1reHJZaURROGorVHVCNXht?=
 =?utf-8?B?dFhUQmtLNCtDOXREeWdXSmJnK0NZL0J4eERvWUZXcXlhczZzay9FUklFcDI3?=
 =?utf-8?Q?+VhILNsRjeC/lQUH6QRFiyJJloAgfL0hWvBxI2a9uMzw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566a4c94-824b-4585-155a-08db34568b29
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 15:17:31.3440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rrmKlzAmRidkXnHTG/MA/YmUefRfjIbf2xAn560S/PdMlAxTD/mb+pdkdZTEkRA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.04.23 um 18:48 schrieb Dmitry Osipenko:
> Don't assert held dma-buf reservation lock on memory mapping of exported
> buffer.
>
> We're going to change dma-buf mmap() locking policy such that exporters
> will have to handle the lock. The previous locking policy caused deadlock
> problem for DRM drivers in a case of self-imported dma-bufs, it's solved
> by moving the lock down to exporters.

I only checked the TTM code path and think that at least that one should 
work fine.

> Fixes: 39ce25291871 ("drm: Assert held reservation lock for dma-buf mmapping")

This here is not really a "fix" for the previous patch. We just found 
that we didn't like the behavior and so reverted the original patch.

A "Reverts..." comment in the commit message would be more appropriate I 
think.

> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/drm_prime.c                | 2 --
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 --
>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c  | 2 --
>   drivers/gpu/drm/tegra/gem.c                | 2 --
>   4 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 149cd4ff6a3b..cea85e84666f 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -781,8 +781,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>   	struct drm_gem_object *obj = dma_buf->priv;
>   	struct drm_device *dev = obj->dev;
>   
> -	dma_resv_assert_held(dma_buf->resv);
> -
>   	if (!dev->driver->gem_prime_mmap)
>   		return -ENOSYS;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index fd556a076d05..1df74f7aa3dc 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -97,8 +97,6 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   	int ret;
>   
> -	dma_resv_assert_held(dma_buf->resv);
> -
>   	if (obj->base.size < vma->vm_end - vma->vm_start)
>   		return -EINVAL;
>   
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> index 3abc47521b2c..8e194dbc9506 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
> @@ -66,8 +66,6 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
>   	struct drm_gem_object *obj = buffer->priv;
>   	int ret = 0;
>   
> -	dma_resv_assert_held(buffer->resv);
> -
>   	ret = drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index bce991a2ccc0..871ef5d26523 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -693,8 +693,6 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
>   	struct drm_gem_object *gem = buf->priv;
>   	int err;
>   
> -	dma_resv_assert_held(buf->resv);
> -
>   	err = drm_gem_mmap_obj(gem, gem->size, vma);
>   	if (err < 0)
>   		return err;

