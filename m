Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215CA585291
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 17:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AC310E112;
	Fri, 29 Jul 2022 15:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB4C10E112;
 Fri, 29 Jul 2022 15:27:24 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F58B6601B77;
 Fri, 29 Jul 2022 16:27:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659108443;
 bh=FwcBwazYmQXJLuakqz5K3Zcb2Y9+PH3NRCkA7//8gAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iNiJcum2t1BmoV8iww9oWOQ7obyVOt4EGOK/UuDqCIJbvJ1B6V7WOPmP7Mg18WjlW
 7tCuPn99KKShl6ZhL4stRpZ0hemkYxqJu1f3QkbQ1FdLEOCq9VzOP9jxnYn877KScV
 UTa3Z9IxrFx6P2QLabj4JQGie+emlO+IG1qw1P8eYuHDt97rTM99wD0Cbr96GM+kDN
 jSo1riLMC7a/Lg+U7RSlStMKU3m2XV3Ltmmd3KIthmSfqf/Kqbu1gtdbR2gj1gXbCD
 p+RRD/NmBHzYzZHdEFgiUB1jMIrh5d9zWqwok7IOEhptVv3hC2Zc9jBU/LB+M86fTp
 cwvt90sFZdD4g==
Message-ID: <49fe9ecf-b1bd-a21b-8d8c-e4a33e3fa821@collabora.com>
Date: Fri, 29 Jul 2022 18:27:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
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
> + * drm_gem_lru_move_tail_locked - move the object to the tail of the LRU
> + *
> + * If the object is already in this LRU it will be moved to the
> + * tail.  Otherwise it will be removed from whichever other LRU
> + * it is in (if any) and moved into this LRU.
> + *
> + * Call with LRU lock held.
> + *
> + * @lru: The LRU to move the object into.
> + * @obj: The GEM object to move into this LRU
> + */
> +void
> +drm_gem_lru_move_tail_locked(struct drm_gem_lru *lru, struct drm_gem_object *obj)
> +{
> +	lockdep_assert_held_once(lru->lock);
> +
> +	if (obj->lru)
> +		lru_remove(obj);

The obj->lru also needs to be locked if lru != obj->lru, isn't it? And
then we should add lockdep_assert_held_once(obj->lru->lock).

-- 
Best regards,
Dmitry
