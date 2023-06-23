Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C773B211
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EFF10E5E8;
	Fri, 23 Jun 2023 07:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4065210E02D;
 Fri, 23 Jun 2023 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687506520; x=1719042520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iX6DkmUl4cz2IjtF1PHE1fVSnIeq15AXAzNyDDfvQOQ=;
 b=R+LYFZoP8Oq1BuPvNplEmFPAVWbrPKq4MvjesYj7zyx7jzekkFR77UVA
 /IDHZAlNmHr6ulD1MSe0qaqLi81wm7YcmjtsduTXlHwM3hTuqgzA9YMNm
 kL64lEEAL70qXGhqOcTvpnc7qBAxgdZiCnNvlEreWGxcqHKWxa9saCJNm
 7/TD4sIn4UTPRm+dd7X6RufR+cE/Alo0/iS68nYotbvumhl/C16GTMVUQ
 dLrbz+bQr0Mh+xxh4sHS+BLibfJ9BpcNXbQ4+obj4lS4sl2Gbzm+PY5Yi
 2IoWKk2hpkmAlXlhnHxlwThW+lir9qHN6MDZwGWIOLHWSEzsriuT7l0YV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="341046744"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="341046744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 00:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="692588026"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="692588026"
Received: from wtedesch-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.233])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 00:48:35 -0700
Date: Fri, 23 Jun 2023 09:48:31 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/ttm: Don't leak a resource on
 eviction error
Message-ID: <ZJVOTzorVVTvvF2z@ashyti-mobl2.lan>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
 <ZJRSyp7fT6VXpow7@ashyti-mobl2.lan>
 <3a089ebb-7389-3d3e-beb0-13a8d64eb04d@linux.intel.com>
 <196a7f74-66ac-1eae-4795-a42691f4793e@amd.com>
 <ef5d91b8-c68b-5edc-d611-6a4dbf55c945@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef5d91b8-c68b-5edc-d611-6a4dbf55c945@linux.intel.com>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, intel-xe@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian and Thomas,

> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > index 615d30c4262d..89530f2a027f 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > @@ -462,14 +462,14 @@ static int ttm_bo_evict(struct
> > > > > ttm_buffer_object *bo,
> > > > >       ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
> > > > >       if (ret == -EMULTIHOP) {
> > > > >           ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
> > > > > -        if (ret) {
> > > > > -            if (ret != -ERESTARTSYS && ret != -EINTR)
> > > > > -                pr_err("Buffer eviction failed\n");
> > > > > -            ttm_resource_free(bo, &evict_mem);
> > > > > -            goto out;
> > > > > -        }
> > > > > -        /* try and move to final place now. */
> > > > > -        goto bounce;
> > > > > +        if (!ret)
> > > > > +            /* try and move to final place now. */
> > > > > +            goto bounce;
> > > > As we are at this, can't we replace this with a while()? Goto's
> > > > used instead of a while loop are a fist in the eye...
> > > 
> > > I'm completely OK with that. this patch already did away with one of
> > > them. Let's hear Christian's opinion first, though.
> > 
> > I'm not a fan of that goto either, but could we somehow avoid the
> > while(1) ? E.g. something like do { } while (!ret) after handling the
> > multihop?
> 
> I think the construct that makes it most obvious what's happening, although
> it needs two tests for -EMULTIHOP is something like
> 
> do {
> ....
>    if (ret != -EMULTIHOP)
>       break;
>    ....
> } while (ret ==-EMULTIHOP);

even better :)

Thank you!
Andi
