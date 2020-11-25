Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372A42C504F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EE46E89C;
	Thu, 26 Nov 2020 08:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3ED86E8E8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 18:06:08 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m65so2214674qte.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BcVhHVVGnf3WvgX+ezgVKIjE/rfcsmBp0NN8oWI8KeQ=;
 b=oZokE3b9qW4wR31ltC6sLQ8tlsVQNdzsn6eGih9BX9owbzd4vdqHIicN+yS6UhLmWp
 3ItMtJDGOFCY1EYvQ97JYoz+bllXwb5hSufqcrUhqWQMB1IbJJWX0CT7Dwn8uE0Nh6z5
 dw+tG9V44ScSRsHrV7/VT1/OdTnZ/CQ5A6gTusM4CjwRb4DmoUyVsFAnVBK9xVV0b5VH
 3Mzp15tBB2D/v7WXW1Tzd8cStJSr2M7OHyaJH0C3r+eimOrdeDIRnOZqng+EBsuckQn/
 IgupkbnQ8lg3DQoP5zkAZWk208dxV0Dzx5MvaGoorv9NAiTZR3LBKtotzc+NJe+1xtrq
 mPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BcVhHVVGnf3WvgX+ezgVKIjE/rfcsmBp0NN8oWI8KeQ=;
 b=Pe9i9q0YLTOJY6p+xnEVtqsTBJGG6Scv8caEselVxrCuDrUxRLZbzx7Z6+O9aXBy0q
 kP4IgOlEqWcMsTdCnyIsRllPNqS4pvaAJ+mXSIcfXf/od0cLrjvkUV0BcjBbAuOvXlAD
 joyB4TLxKy/U7P8sF0LxaTd0Hdw1sUCZ/M8k169oua8FZVj4+GumbCkwXDr8Mto3ZFHb
 P9U/ukouBfJW1omjfcFPkzYJCXDqFnrC3f296Qlqdc/sbfp5doxJP9r4U5NG4BpcQ1Z3
 ysLVsphRZCq7j+2sAOiZt26ayAKkaqHk9BokqdQQEP/evo1iPBBQgvm4a/jd8ki5Dyhc
 EP0Q==
X-Gm-Message-State: AOAM530jiUyyze1cZ2J29ymC5d7cmvq2Y4aaU6RuRmTzRvxoHwucA9PC
 RtVRUUm/doC5UaN+hmggInRKpw==
X-Google-Smtp-Source: ABdhPJyTT0zfGule3EMk3EVFgg0sW/Gc+MYUEwA7cD2UFS4TswJqWZPz+DEHts834E3EnWVts2w0Nw==
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr29725qtt.381.1606327568092;
 Wed, 25 Nov 2020 10:06:08 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h4sm32176qkh.93.2020.11.25.10.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 10:06:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khzB8-001Lnb-ES; Wed, 25 Nov 2020 14:06:06 -0400
Date: Wed, 25 Nov 2020 14:06:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
Message-ID: <20201125180606.GQ5487@ziepe.ca>
References: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
 <20201125162532.1299794-5-daniel.vetter@ffwll.ch>
 <CAKMK7uGXfqaPUtnX=VgA3tFn3S+Gt9GV+kPguakZ6FF_n8LKuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGXfqaPUtnX=VgA3tFn3S+Gt9GV+kPguakZ6FF_n8LKuA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 05:28:32PM +0100, Daniel Vetter wrote:
> On Wed, Nov 25, 2020 at 5:25 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Random observation while trying to review Christian's patch series to
> > stop looking at struct page for dma-buf imports.
> >
> > This was originally added in
> >
> > commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> > Author: Thomas Hellstrom <thellstrom@vmware.com>
> > Date:   Fri Jan 3 11:47:23 2014 +0100
> >
> >     drm/ttm: Correctly set page mapping and -index members
> >
> >     Needed for some vm operations; most notably unmap_mapping_range() with
> >     even_cows = 0.
> >
> >     Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> >     Reviewed-by: Brian Paul <brianp@vmware.com>
> >
> > but we do not have a single caller of unmap_mapping_range with
> > even_cows == 0. And all the gem drivers don't do this, so another
> > small thing we could standardize between drm and ttm drivers.
> >
> > Plus I don't really see a need for unamp_mapping_range where we don't
> > want to indiscriminately shoot down all ptes.
> >
> > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > Cc: Brian Paul <brianp@vmware.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com>
> 
> Apologies again, this shouldn't have been included. But at least I
> have an idea now why this patch somehow was included in the git
> send-email. Lovely interface :-/

I wrote a bit of a script around this because git send-email just too
hard to use

The key workflow change I made was to have it prepare all the emails
to send and open them in an editor for review - exactly as they would
be sent to the lists.

It uses a empty 'cover-letter' commit and automatically transforms it
into exactly the right stuff. Keeps track of everything you send in
git, and there is a little tool to auto-run git range-diff to help
build change logs..

https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_send_patches.py

I've been occasionaly wondering if I should suggest Konstantin add a
sending side to b4, maybe using some of those ideas..

(careful if you run it, it does autosend without prompting)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
