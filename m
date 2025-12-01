Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533DEC978A1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67510E2AC;
	Mon,  1 Dec 2025 13:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F1ykKtUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49BF10E138;
 Mon,  1 Dec 2025 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cPiAfx7FdDOpOGsC72ThWHuHw4YoMlt69Iwmcf91efo=; b=F1ykKtUl8axnsePILvv1n5IyfT
 muXHi/NsapQAhJuCgTSgTUKFWi9Tu+8Hj1K25SUoeTFmSnTlUCHj9UHI6v0B7BjEIQmfZ5fpNNKJe
 LiYBm/FfDU7A000mG7ROPxNNK+OxAzR2YWroSAaFL/C3K2i6Ah3LSdYDd3KNJoNHglXTNzJYBNlfW
 +2N83hgabMUjzT0kJ7KdGAfZ33af3q2bvbQ6S2bU31PGr0NQWHJcoVfHpNX2qlPkacVxd2u80Tdvi
 mr7yDORard5qvM6WaQY6VoOjGBk0ZlDUkCKUaAF5nrNo9k6PcJalvdk71IvLKEf5BWjUEJy5UXz7d
 gyhZA/ig==;
Received: from [189.7.87.198] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQ3le-007OGa-VH; Mon, 01 Dec 2025 14:16:39 +0100
Message-ID: <69f7bdc1-e2e2-4a0c-94be-b096a4de218b@igalia.com>
Date: Mon, 1 Dec 2025 10:16:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/10] drm/v3d: Use huge tmpfs mountpoint helpers
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-7-loic.molinari@collabora.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20251128185252.3092-7-loic.molinari@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Loïc,

On 28/11/25 15:52, Loïc Molinari wrote:
> Make use of the new drm_gem_huge_mnt_create() and
> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
> it's just a few lines long, the single function in v3d_gemfs.c is
> moved into v3d_gem.c.
> 
> v3:
> - use huge tmpfs mountpoint in drm_device
> - move v3d_gemfs.c into v3d_gem.c
> 
> v4:
> - clean up mountpoint creation error handling
> 
> v5:
> - fix CONFIG_TRANSPARENT_HUGEPAGE check
> - use drm_gem_has_huge_mnt() helper
> 
> v8:
> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
> 
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> 
> v10:
> - get rid of CONFIG_TRANSPARENT_HUGEPAGE ifdefs
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

With one suggestion below:

> ---
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c    |  5 ++-
>   drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 11 +-----
>   drivers/gpu/drm/v3d/v3d_gem.c   | 27 ++++++++++++--
>   drivers/gpu/drm/v3d/v3d_gemfs.c | 62 ---------------------------------
>   6 files changed, 30 insertions(+), 80 deletions(-)
>   delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
> 

[...]

> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5a180dc6c452..62532a89dd14 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -259,6 +259,30 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
>   	v3d_invalidate_slices(v3d, 0);
>   }
>   
> +static void
> +v3d_huge_mnt_init(struct v3d_dev *v3d)
> +{
> +	int err = 0;
> +
> +	/*
> +	 * By using a huge shmemfs mountpoint when the user wants to
> +	 * enable Super Pages, we can pass in mount flags that better
> +	 * match our usecase.
> +	 */

I feel that this comment is phrased in a way that isn’t very clear. If
possible, could you rephrase it or remove it? I think this comment is
no longer needed given all the documentation already added to the
DRM GEM functions.

Best Regards,
- Maíra

> +
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
> +		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> +
> +	if (drm_gem_get_huge_mnt(&v3d->drm))
> +		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +	else if (err)
> +		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n",
> +			 err);
> +	else
> +		drm_notice(&v3d->drm,
> +			   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> +}
> +
