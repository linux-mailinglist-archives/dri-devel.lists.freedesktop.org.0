Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82130288AC6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 16:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ECA6ECEB;
	Fri,  9 Oct 2020 14:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6016ECEB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 14:24:57 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id w141so10399388oia.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4j8VU4wpGDl6YV4vbFDWVWHEZCZz4TBGhbt0uuUGdBg=;
 b=YLM0g/4oQLD0hu/Oa87scm3scHf+vbiPkLbDqUAnyXk3ER+QRam40zaijXvFBD6PRA
 nzSbXcW7hn805lQbe6AX68hG76VYbA+coTzGsCT/QWJIzeeROcYpI8QHsxV9QNKX8ew0
 Dn833fe+dPzpkngPWmhP7pgAZbKyHIAe+x52Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4j8VU4wpGDl6YV4vbFDWVWHEZCZz4TBGhbt0uuUGdBg=;
 b=WHEqsErgtaU8ACLkY1g3mRRuQUQDxHADNtKOa2ZzKeTqccVApawEIX8/XHxPkUmQ49
 kHspsDuM6JFDRRDbIJYnkRcBRw0so2hlzL2rA/dcW8QPv2N1q+xwompeptiY/DXwPpeD
 mIXc3ekRmPMPoQxQOd7BluOT54VoEgL0F4RZSeQ3ukdiCgxNpkHbKLDCl8BH6/WmLEyg
 2SQBm5wIBVwtAVhjEQrsNfR2BJ8vXjxhOfFKJG0j9AjqnSGKNR2GAgNUx6cyK7NmmN1L
 h0r1m+/kfJoyt4f87n8h5boGb8k2pmW02OxQn2rTIZNM+1rMzzdBKnGgmsY2eOWgAXxj
 Oe7g==
X-Gm-Message-State: AOAM53059afVLhELTXQj+TQ2ahGLnNFxka4dxGOJ6iRWUlggjy0hN4WP
 YjIMYBx7Ld7cxUz+ZxwlOq/ocL8ppffh1akua8rE9Q==
X-Google-Smtp-Source: ABdhPJyHxT/6NZr88G54H2j+X8AAqjyafUNpDVmVkQQPYeZ/EXQjiOmXOOdqJRKMWvSSWVU71sVuY9YK0QkcwCetmpo=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2688783oib.14.1602253497033; 
 Fri, 09 Oct 2020 07:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
In-Reply-To: <20201009123109.GO5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Oct 2020 16:24:45 +0200
Message-ID: <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
>
> > +struct address_space *iomem_get_mapping(void)
> > +{
> > +     return iomem_inode->i_mapping;
>
> This should pair an acquire with the release below
>
> > +     /*
> > +      * Publish /dev/mem initialized.
> > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > +      */
> > +     smp_store_release(&iomem_inode, inode);
>
> However, this seems abnormal, initcalls rarely do this kind of stuff
> with global data..
>
> The kernel crashes if this fs_initcall is raced with
> iomem_get_mapping() due to the unconditional dereference, so I think
> it can be safely switched to a simple assignment.

Ah yes I checked this all, but forgot to correctly annotate the
iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
Add missing memory barriers for devmem_inode").

The reasons for the annotations is that iomem requests can happen
fairly early, way before fs_initcalls happen. That means revoke_iomem
needs to check for that and bail out if we race - nothing bad can
happen since userspace isn't running at this point anyway. And
apparently it needs to be a full acquire fence since we don't just
write a value, but need a barrier for the struct stuff.

Now iomem_get_mapping otoh can only be called after userspace is up &
running, so way after all the fs_initcalls are guaranteed to have
fininshed. Hence we don't really need anything there. But I expect the
kernel race checker thing to complain, plus that then gives me a good
spot to explain why we can't race and don't have to check for a NULL
iomem_inode.

I'll add that in v3.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
