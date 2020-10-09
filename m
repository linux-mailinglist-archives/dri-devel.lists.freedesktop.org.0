Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D2289FC1
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E085B6EE95;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2576ECD7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 12:48:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x20so3363670qkn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
 b=HLVf/9fs3er+0kSwyJTggMLNde7v6twDJX2OORdUgNP4K/LTsJAusSj3xZhnK/9iEP
 2MiDVI/gcY40GDzZOHFy1D1gUeZmYvK+y8q3WrgO2wIZyqUCgxZmIrGytraz5FbwrvVk
 FIWoQQ/EYzOwBXKaVfiWwe8sni4FQhNRH93rHGzY9G+WQBuX2toU0JYl3qUK8vxILogk
 CO/+6WIVejt98w1VEtO30gtBiu4FzGnjZIpjkg9+CRC8VLCjso0cqZThY5uICmC4Leel
 mG8PVTlyewS4MOqVzGOqsDKY0BxrcNvf/7YuapUiGj3wEjRkZ+Rv/IezCJ6KD+Oa9Tui
 5i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bKAda/rTW4nq6+j1jXEBgS/13SJBQ2WY2j5bHQ+ISAM=;
 b=qUs5s2xWqJpyypKQg+wLATKobFi7RszOn1DIlFMIJPAAKOYJEe6DyalM+aeP9I2Ycy
 UpY00BshTZ6Z+mdr/AVwbG62vQzImcsHjME2A0cIIETihMP3kZE/GZ/WmLCkUPn3I2Kk
 ICOxrgsh/j+Iy5mGDkL7U+AIBo0oY7emWDe8S54v+lomNsax0uQC1pm+wpn8FbADAsgX
 gnXJd3/jDzwSEfkmHDNAwxostqrdowNyWfafPq/15cjmnYDSJ86Qc9zkJSJ/0dakk7xM
 Pgr3CddH1+sEI8ZiDhTw2FzAgxa3D0qpol2dgLtVoGq/stke0gyFt6Lwho3h5dT7KBlK
 cNdQ==
X-Gm-Message-State: AOAM530bevxQlxN0MEvljEf9r3HIM0t3LgvJ4QIMicMTsXtXFZOPyLAN
 2WgJSUqXe5DrEUxe9I3aqIzllg==
X-Google-Smtp-Source: ABdhPJxKkkXOIA4i8TbRkwc7dtfamUS7+upXdOHf9JVMgQW+IXdzrhalpqUKvvNnrEeFMFZ6pHcyaQ==
X-Received: by 2002:ae9:e702:: with SMTP id m2mr6280147qka.387.1602247731583; 
 Fri, 09 Oct 2020 05:48:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m18sm4248636qkk.102.2020.10.09.05.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 05:48:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQrpK-001y6e-9J; Fri, 09 Oct 2020 09:48:50 -0300
Date: Fri, 9 Oct 2020 09:48:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201009124850.GP5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009143723.45609bfb@coco.lan>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:

> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> description is that this is unsafe *only if*  __GFP_MOVABLE is used.

No, it is unconditionally unsafe. The CMA movable mappings are
specific VMAs that will have bad issues here, but there are other
types too.

The only way to do something at a VMA level is to have a list of OK
VMAs, eg because they were creatd via a special mmap helper from the
media subsystem.

> Well, no drivers inside the media subsystem uses such flag, although
> they may rely on some infrastructure that could be using it behind
> the bars.

It doesn't matter, nothing prevents the user from calling media APIs
on mmaps it gets from other subsystems.

> If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> flag that it would be denying the core mm code to set __GFP_MOVABLE.

We can't tell from the VMA these kinds of details..

It has to go the other direction, evey mmap that might be used as a
userptr here has to be found and the VMA specially created to allow
its use. At least that is a kernel only change, but will need people
with the HW to do this work.

> Please let address the issue on this way, instead of broken an
> userspace API that it is there since 1991.

It has happened before :( It took 4 years for RDMA to undo the uAPI
breakage caused by a security fix for something that was a 15 years
old bug. 

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
