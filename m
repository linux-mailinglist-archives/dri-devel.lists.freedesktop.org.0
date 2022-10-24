Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECCF60B7EB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568E510E77D;
	Mon, 24 Oct 2022 19:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A23710E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 19:37:00 +0000 (UTC)
Received: from [192.168.2.31] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D7DF6602820;
 Mon, 24 Oct 2022 20:36:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666640218;
 bh=9YlOiiJFFn/lRLlSj5J0a6w6dJtCCcMej435SmulU3Q=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=CFcmZ8C6BB2A8CM2A0b7Wfltf1yPbbEtg6pjnWc0MwNzZ6ghV0qhGpzg30o4KQG1n
 Oi3hLsCSWwJWf0Q5Afgij5SRvAwoSLlsxO7pLUTohqkh8xX+ABtO+NOf5TZx38g1M6
 H4XjZ7Y2YNOG059jANmN9lvo8Sm4OWKy+VQL1jVaFmkDea2ZdEMTwYYA0Lco3SF/fA
 1bb9pk0jYP5Q3vUx5xLippRhU271U1TEvV2cy8EVXOOmH2jrZBmtwtEOZ2QqUXkxKS
 QzUbQhZEA11BinyEh3DNFMXeS5N4Wyrrlhy+gE2+Igo+FKsB2Xt4eqPWbiDktVnJ3B
 5BkaVKDy5InxQ==
Message-ID: <47c5b64e-b765-41be-b58b-cdc83edeca49@collabora.com>
Date: Mon, 24 Oct 2022 22:36:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1] drm: Switch drm_client_buffer_delete() to unlocked
 drm_gem_vunmap
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/21/22 00:33, Dmitry Osipenko wrote:
> The drm_client_buffer_delete() wasn't switched to unlocked GEM vunmapping
> by accident when rest of drm_client code transitioned to the unlocked
> variants of the vmapping functions. Make drm_client_buffer_delete() use
> the unlocked variant. This fixes lockdep warning splat about missing
> reservation lock when framebuffer is released.
> 
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Link: https://lore.kernel.org/dri-devel/890f70db-68b0-8456-ca3c-c5496ef90517@collabora.com/T/
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index fbcb1e995384..38e1be991caa 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	struct drm_device *dev = buffer->client->dev;
>  
> -	drm_gem_vunmap(buffer->gem, &buffer->map);
> +	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>  
>  	if (buffer->gem)
>  		drm_gem_object_put(buffer->gem);

Applied to misc-next

-- 
Best regards,
Dmitry

