Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78E94E51B6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF3B10E6BB;
	Wed, 23 Mar 2022 11:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4600310E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 11:59:18 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id pv16so2427393ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=d0eC82WbIqRjKmK7FWSrMn/ejqGJJksvrYY2oTqfj78=;
 b=bf1A3J86oJmjAJkTV6VqO3LRw4xfJSb1KFGB/ssZOg+8i4gJ3kD0omkP9c981hN8RE
 lcqxqJxUbaAPvfOlpy9NuDJQDbE9jfnJaCaQ+h2qygmS/ePxaTBn0Fbs+reYrUKO9GxI
 oHZuS0xesLRSL0cBsEqKka6xdfTybjk+knJEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=d0eC82WbIqRjKmK7FWSrMn/ejqGJJksvrYY2oTqfj78=;
 b=wKbzNqhpDp3fwVLLsc88uL3cPzNvv7uIO1qWB9camk+/rGwAz2myD1zoqGFRc6ht2h
 j7Z9A+8HZmQEjfFuQMM3XfFwjyU8HDJVuImlkqqYpDoWECvlDus+Fygr7m7HoEV8nP3/
 gmTKd9bu8bPV8QW75BpAGJ2B7Lu/2OzmLTsHp+bP2MoBDYmqsVrNEexCBNmHJzXWXchC
 hT18I1s8KZhfTcXVEPARm6dUq4H0OoyzFpdz+9yPGk1yuaJZXUSg2G2XOr6FFec+4f/T
 vp9WzvR/x173fX/4ariidLyBS+SHseKAZ96BAGE5Y+aFvjkYiCvtO4JPVJwV833Xzc9q
 wR+g==
X-Gm-Message-State: AOAM533F6XMWX+wtE8jCMoE+TYqH1QxpgXGz86rBi0bHw+W2oT8Gprgr
 4ue3hCVWpqHCwLHiYqx42QKggA==
X-Google-Smtp-Source: ABdhPJynJDKyI4tugNFE6GX/sHO5gTGQh7jklyUrEHLFheG6yE+d4FCIyO6CCO7fed7fnp7HmNTbNQ==
X-Received: by 2002:a17:906:e16:b0:6df:c796:25b5 with SMTP id
 l22-20020a1709060e1600b006dfc79625b5mr23836365eji.302.1648036756818; 
 Wed, 23 Mar 2022 04:59:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a170906518e00b006dfd441fc80sm5891549ejk.52.2022.03.23.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:59:16 -0700 (PDT)
Date: Wed, 23 Mar 2022 12:59:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Message-ID: <YjsLkqGEnre4JKkR@phenom.ffwll.local>
References: <20220321132601.2161-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220321132601.2161-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
> This way we finally fix the problem that new resource are
> not immediately evict-able after allocation.
> 
> That has caused numerous problems including OOM on GDS handling
> and not being able to use TTM as general resource manager.
> 
> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
> v3: cleanup kerneldoc, add more lockdep annotation
> v4: consistently use res->num_pages
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

> +/**
> + * struct ttm_lru_bulk_move
> + *
> + * @tt: first/last lru entry for resources in the TT domain
> + * @vram: first/last lru entry for resources in the VRAM domain
> + *
> + * Helper structure for bulk moves on the LRU list.
> + */
> +struct ttm_lru_bulk_move {
> +	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
> +	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];

Not really needed, just a thought: Should we track the associated dma_resv
object here to make sure the locking is all done correctly (and also check
that the bulk move bo have the same dma_resv)? It wouldn't really be any
overhead for the !CONFIG_LOCKDEP case and we could sprinkle a lot more
dma_resv_held all over the place.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
