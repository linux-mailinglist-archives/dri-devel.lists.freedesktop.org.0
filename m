Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FE289FBA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A786E091;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501606ECAB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 12:31:12 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t9so6929411qtp.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K8oqjNwy1IItwzS5nAtnJfKoqbYdlnvHoUJ/yQIxMlE=;
 b=cdaBlGmBZL4cakXZlvJuZERmIRIX6jD7dwzimgC10KWdoWEXxqnVyCAO2D0RVxCrE3
 SiHI343vdap2cRRglH6ua6mGWuo7/fxfox6RkGqmDhIsAnKFSeohUX9VYGJSKAwhIU6B
 2TcxKC37KpT1QUH/a9OmlQtDEo327+kakIXLdXGqBOKFhRN4BS67JiDu+bvG4a5CPI+r
 pqcyhIAj+gFL2/lmzDWusy4E62ErCo67w+IagQCo+gX4l+6CaOr61WFu2i1yy0l+Wgf3
 xGuhQ4gDKh6os3wK0BjatM5g2y6nWPQvLIHBtHwaCM52uhc/sKGK0XWe8qKcZr9st8fm
 fLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K8oqjNwy1IItwzS5nAtnJfKoqbYdlnvHoUJ/yQIxMlE=;
 b=LoWDDHRBq58MgfZQPBJQLpyDszMfsWayVGzEcEBV+JbO2HFwEcYRnjUq2MLs/6ZM81
 Akm+JIshSReJ5LCR0CFIDcQORZyF3eg9Fy0/DOmy2zagOGY48SREdLiOqce4GBjE+4RO
 z3ey7s6Jr87mXB6molDkpj8ndjqpMwsz9hkPlY1GxEesGjQcwU4Vtv4+2chj/LmGUt8Q
 vYbGkADOBsb7ojaiSCPXaNiob2PIQlqOxZSyoYdMDA+1R/8uxOX2rcAyHtixyChlgTrA
 QkTMR6274mGeoPoJ4Mq73oBYnt2vu6giqW5KO1BLUdOEdWGAJNXqpFhL4Jl9YPpKZlm4
 Brew==
X-Gm-Message-State: AOAM533B5hI4AMlEAtE9ckXuNkZ2FFn9AYzin0GDZpwGw7wGvdgNlipI
 dFWU8YdtuSm6wsWbyC3yFsj8CQ==
X-Google-Smtp-Source: ABdhPJxG8zCIXDditfEGKgb8JSFeGI61awPyS7AMuV2YFh9LkEtvSTVL1XgAfKTEjxIzUEviyqvgUw==
X-Received: by 2002:ac8:d8d:: with SMTP id s13mr12568868qti.42.1602246671500; 
 Fri, 09 Oct 2020 05:31:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g1sm6069368qtp.74.2020.10.09.05.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 05:31:10 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQrYD-001xsF-Sz; Fri, 09 Oct 2020 09:31:09 -0300
Date: Fri, 9 Oct 2020 09:31:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
Message-ID: <20201009123109.GO5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
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
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:

> +struct address_space *iomem_get_mapping(void)
> +{
> +	return iomem_inode->i_mapping;

This should pair an acquire with the release below

> +	/*
> +	 * Publish /dev/mem initialized.
> +	 * Pairs with smp_load_acquire() in revoke_iomem().
> +	 */
> +	smp_store_release(&iomem_inode, inode);

However, this seems abnormal, initcalls rarely do this kind of stuff
with global data..

The kernel crashes if this fs_initcall is raced with
iomem_get_mapping() due to the unconditional dereference, so I think
it can be safely switched to a simple assignment.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
