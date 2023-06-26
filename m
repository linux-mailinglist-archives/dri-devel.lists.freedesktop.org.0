Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CB73E3B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB96010E231;
	Mon, 26 Jun 2023 15:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A75310E232
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:43:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C29A660710F;
 Mon, 26 Jun 2023 16:43:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687794189;
 bh=uh5GORAxcnudRnQP/KUZCRnKQmkXnauaUDS/93CCSRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YVcqFG4aPEy0jG8/T7XgaWbdOU8tuQtBW0Z52Rgr7AlURK9HXP+i1asCC5mh0QWy0
 lmrtfae3AVFTXtcoG2mYQhceok3PveaTPwc+VOei7X73LbjC+8eL65Iuar4n4nH8MS
 55bRsT15aIaST1ttkrihjGw2u5uQd7ggc6nSbi2x7QOBxXSZIsC1wYFNNOOwOjMjjO
 KnuMOwS7zswq4Va4NWPQeyBKE6HDPyKttTDCE37ZiAlmGglhOnn5rTNP9CAJU5rNnL
 XsYoJP1IWnxyjsM4pzDJQBGLbhJiCdGG9VBB3EjKg1crojSxY33FacenT9iTTrNpRJ
 JCsMkI5ygOv1Q==
Date: Mon, 26 Jun 2023 17:43:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH 1/5] drm/panfrost: Stop using drm_gem_shmem_put_pages()
Message-ID: <20230626174306.61671729@collabora.com>
In-Reply-To: <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
 <20230626120247.1337962-2-boris.brezillon@collabora.com>
 <2182355e-2412-fd60-fb0d-5359b43d4e0c@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 26 Jun 2023 16:20:53 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 6/26/23 15:02, Boris Brezillon wrote:
> > -err_pages:
> > -	drm_gem_shmem_put_pages(&bo->base);
> >  err_unlock:
> >  	dma_resv_unlock(obj->resv);
> > +
> > +	if (ret && pinned)
> > +		drm_gem_shmem_unpin(&bo->base);  
> 
> The drm_gem_shmem_unpin() was supposed to be used only in conjunction
> with drm_gem_shmem_pin(). I've a pending patch to enable the pin/unpin
> refcounting needed by drm-shmem shrinker, it will prohibit invocation of
> unpin without a previous pin.
> 
> I'm wondering whether it will be okay to simply remove
> drm_gem_shmem_put_pages() from the Panfrost code, letting pages to be
> kept allocated in a error case. They will be freed once BO is destroyed.
> 

Okay, so after looking at your shmem-shrinker series, I confirm we need
to take a pin ref here (hard-pin), otherwise the buffer might be
evicted before the GPU is done, especially after you drop gpu_usecount
and use only pin_count to check whether a GEM object can be evicted or
not.
