Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074227A285
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 21:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1511A6E2BC;
	Sun, 27 Sep 2020 19:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94DD6E084;
 Sun, 27 Sep 2020 19:16:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C2B8980637;
 Sun, 27 Sep 2020 21:16:06 +0200 (CEST)
Date: Sun, 27 Sep 2020 21:16:05 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200927191605.GA237178@ravnborg.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=GurwE-QF2vAYMD8ieTkA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 afd@ti.com, m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, robin.murphy@arm.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

> > 
> > struct simap {
> >        union {
> >                void __iomem *vaddr_iomem;
> >                void *vaddr;
> >        };
> >        bool is_iomem;
> > };
> > 
> > Where simap is a shorthand for system_iomem_map
> > And it could al be stuffed into a include/linux/simap.h file.
> > 
> > Not totally sold on the simap name - but wanted to come up with
> > something.
> 
> Yes. Others, myself included, have suggested to use a name that does not
> imply a connection to the dma-buf framework, but no one has come up with
>  a good name.
> 
> I strongly dislike simap, as it's entirely non-obvious what it does.
> dma-buf-map is not actually wrong. The structures represents the mapping
> of a dma-able buffer in most cases.
> 
> > 
> > With this approach users do not have to pull in dma-buf to use it and
> > users will not confuse that this is only for dma-buf usage.
> 
> There's no need to enable dma-buf. It's all in the header file without
> dependencies on dma-buf. It's really just the name.
> 
> But there's something else to take into account. The whole issue here is
> that the buffer is disconnected from its originating driver, so we don't
> know which kind of memory ops we have to use. Thinking about it, I
> realized that no one else seemed to have this problem until now.
> Otherwise there would be a solution already. So maybe the dma-buf
> framework *is* the native use case for this data structure.

We have at least:
linux/fb.h:
	union {
		char __iomem *screen_base;      /* Virtual address */
		char *screen_buffer;
	};

Which solve more or less the same problem.

 
> Anyway, if a better name than dma-buf-map comes in, I'm willing to
> rename the thing. Otherwise I intend to merge the patchset by the end of
> the week.

Well, the main thing is that I think this shoud be moved away from
dma-buf. But if indeed dma-buf is the only relevant user in drm then
I am totally fine with the current naming.

One alternative named that popped up in my head: struct sys_io_map {}
But again, if this is kept in dma-buf then I am fine with the current
naming.

In other words, if you continue to think this is mostly a dma-buf
thing all three patches are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
