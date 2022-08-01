Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3813258718A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 21:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E970B11B700;
	Mon,  1 Aug 2022 19:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D538D8D3DC;
 Mon,  1 Aug 2022 19:41:46 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D2A46601BA5;
 Mon,  1 Aug 2022 20:41:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659382905;
 bh=k5EraTwHAEVrhojLCqVx1FWHD2f7NGKvuhlO2ptrZ8c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gTmFFtTz0V1cbFEZIG4avYtl1KBj8ARpZgTTbHPEaLeBhlx5TS4UGiv6SIcSivaQG
 8COE65IXzErRaIgVt3NuVZmojRPcp6TNXfRBFXG9mtLvm8VfYOReoLhkdiRx73uew5
 cnx7ung2K2PXXjHs17F9WyeTjUoFAvA2nSy6fi5cPtPGpaDQSwONgPBz9Fx8wWWpal
 +p+6kyTyU4JxvKxtcmjTDQTc45JBY1nLRuUZARaGpCojqI50EOv94+NtwUEyJTovdx
 i25DDfP/GyqrarCky7ixFCXc9AgdXPkZ2gvy2ek5YU7lnc9q+rt7ij3kSo4ZjpVakw
 h3j2XjuKyWw9Q==
Message-ID: <def8e47c-067e-0841-4ae4-1eb90244cd50@collabora.com>
Date: Mon, 1 Aug 2022 22:41:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220726175043.1027731-10-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/22 20:50, Rob Clark wrote:
> +/**
> + * drm_gem_lru_remove - remove object from whatever LRU it is in
> + *
> + * If the object is currently in any LRU, remove it.
> + *
> + * @obj: The GEM object to remove from current LRU
> + */
> +void
> +drm_gem_lru_remove(struct drm_gem_object *obj)
> +{
> +	struct drm_gem_lru *lru = obj->lru;
> +
> +	if (!lru)
> +		return;
> +
> +	mutex_lock(lru->lock);
> +	lru_remove(obj);
> +	mutex_unlock(lru->lock);
> +}
> +EXPORT_SYMBOL(drm_gem_lru_remove);

I made a preliminary port of the DRM-SHMEM shrinker on top of the the
latest version of dma-buf locking convention and yours LRU patches. It
all works good, the only thing that is missing for the DRM-SHMEM
shrinker is the drm_gem_lru_remove_locked().

What about to add a locked variant of drm_gem_lru_remove()?

-- 
Best regards,
Dmitry
