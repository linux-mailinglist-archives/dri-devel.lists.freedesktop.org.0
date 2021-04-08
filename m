Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D5358A02
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 18:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CCE6EB73;
	Thu,  8 Apr 2021 16:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6345B6EB73
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 16:46:14 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id c3so2868758qkc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P9Dutpry47e9G1LsI+esYplVO+0VII6tEqAJFfWkRFs=;
 b=YgqR7clyk2k4fwdMNax1iDXb2sF/XnKNGxf0wo1TO8GFWHr9fn3olwvZRTnhLiG401
 Mg74Akp1RiWZym/qucXFCGV+PA7tE9GSB1FxRXUa12JWocy5RCT3AKfLOF0rPbKAp8zK
 QDz77Rezb71XzcRKjk67GImEAzjs/v2nKZ80axmwHu/PYnVK5lGGWeP6MQm0qGM8cjbc
 CePlxVevLaG+j2FEa/lmwKvJRXnHCFMMOtqfpLtAmxzzonEYQ4xP8e4P3F42nXwP39SP
 QBVuP3x8MHGGhx7X6YmAx60QXV9mNcADixygvhUrdhGe5SJSv9lS4wXFKSFMCma9xIw7
 TuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P9Dutpry47e9G1LsI+esYplVO+0VII6tEqAJFfWkRFs=;
 b=Hcqb46n+9/ZFlBx6vss8OxWFIiwrxmz+HbST79o3d5FVYn1mYiUwXMtSVZeL97c8Dl
 Nrk0u+lfNwFahKL4S68mrin0kUi7VXw4h7rLzzU//Id5DWefECocq2Y9cToMdVtcGz1F
 crqbg35cnJznd/wQdFYoMveBOMsHaux0KMeWInmFdjHi+Bxan0cg6hclmue2krG4tf+b
 c8ZnrdZwlmH4CeCNpt94KyISHCKN1w57ZjnfTwhDdgN4KVdWZG/cA8AWktL+jky91UOs
 43oUBe+lW000pZW5G6F68gmBDIlSrSjmvCnPNf92io/32CETcU6yj1s9dxZQv9KyS5qm
 5yTw==
X-Gm-Message-State: AOAM531EY3PTICwU+vsHRHpw6FSBwoU1bPEPM67A20YgUHv+HNUBDDs/
 Z2E123r+6kICJzvaNbNkL7OEfg==
X-Google-Smtp-Source: ABdhPJzbDYutSfn+FmJJZIAbAHyE8DAfowirb1kwOsQfAUvjL2fOsMnXGxO5fiM2OyXlWuyJctyzMw==
X-Received: by 2002:a37:6c01:: with SMTP id h1mr9726497qkc.182.1617900373391; 
 Thu, 08 Apr 2021 09:46:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id p5sm21412244qkj.35.2021.04.08.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:46:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lUXnI-002nMT-BD; Thu, 08 Apr 2021 13:46:12 -0300
Date: Thu, 8 Apr 2021 13:46:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mike Rapoport <rppt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Collingbourne <pcc@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <20210408164612.GD227011@ziepe.ca>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <YG7rKfJkTDJorqvY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YG7rKfJkTDJorqvY@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:38:17PM +0200, Daniel Vetter wrote:

> If you want to change this, we need automatic conflict resolution like apt
> and other package managers have, with suggestions how to fix the config if
> you want to enable a driver, but some of its requirements are missing. The
> current approach of hiding driver symbols complete if any of their
> dependencies are off is really not great.

+1 to this.. 

Though Kconfig is basically already unusuable unless you have hours to
carefully craft the kconfig you need to get out.

I'm not sure trying to optimize this by abusing the existing language
rules is such a good idea.

I gave a very half hearted go at a simple heuristic solution solve for
kconfig a while ago. It is good enough to sometimes automate a kconfig
task, but it is not so nice.

I use it to do things like "turn on all RDMA drivers" which is quite
a hard to do by hand.

It looks liked heursitics need a lot of fine tuning as the
conditionals are complex enough that it is hard to guess which branch
is going to yield a success.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
