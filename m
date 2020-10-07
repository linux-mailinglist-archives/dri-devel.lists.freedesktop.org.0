Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B98286255
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7081D6E92C;
	Wed,  7 Oct 2020 15:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83466E8FC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 14:58:17 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id cv1so1297786qvb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P2gM9yMWULW8Gy0X53Dd8f+mRA7vL7mt4JQg7J+CsJg=;
 b=EkrWq1MrrRrhX94tY4shxt2sLz9reBBnaXPgSxaBe8tilDqy+2IS1g570qnI6q2Bwb
 VTZx0T7ukCpH2KhVpGwAlcgwN+08jcdBryOAUJsnrCoQ3sDIRGhbR49CMNFI4tETADRf
 CS4ynbPfqQ+EfaUNE0vtblxsA5wAfc6seY0Is0oCap6lr3N+S8vvfmpnh7Yelpm1c7B0
 mLinWmmY747mC1qpUt2odZnzr8hLQog7wTcAPIaeK9bsSbxe6JHWZE+fIEJVz+CJIgTt
 1IeH4KA8rzkLIgg5NfFox6GHYfwfLa/83FQ+yNgrLHAOFw09XKpj880UZUJDvOWgo7iE
 wzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P2gM9yMWULW8Gy0X53Dd8f+mRA7vL7mt4JQg7J+CsJg=;
 b=X+eBdm8tZR3Dhp/owjq8xrOXdZi7Wt2CKst1bzorSpjgzvTt/rxlkzVzt6iqXJggCh
 MFNLx4ag9CByms9h0vYgv0mJ6evctkgR7CdetWDNVFdT7Adw9H7d1GQtDUH7ovrKu7Jq
 vqU0cO+O0g+6jEwIQp6+ySFE1takuja8E3dU2NhobwxjLcCtted4Z6gC2RE8zFq6+r1K
 8YUPJdOBaQjgSbJmZpRh9TEBN7jZKEOUmUnNk9aibjfhUoz7qpSYC7CyMmuDcBWUmxga
 Pe19whMzWsKdnql/UBfYJETAt49Wa8aZeJnQehtiF7R50sqOIrXzZ0PG7sKz8SoEGj43
 Gddg==
X-Gm-Message-State: AOAM531ax8bxzV5bJJVf4aJjGYfy3p6Cs0R8LxGTct/0JlihWgCO7LMv
 wwc7yq9Ql00MIWSCmZHE2Gu94Q==
X-Google-Smtp-Source: ABdhPJyjY3nHEt0ctmWulUEEoQC0sv3v89EPil6229gZRAfJaFF/qKe7nim9Rza8tp1X2JRL4Y6Eww==
X-Received: by 2002:a05:6214:945:: with SMTP id
 dn5mr3776857qvb.56.1602082696901; 
 Wed, 07 Oct 2020 07:58:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id n7sm1705722qtp.93.2020.10.07.07.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 07:58:16 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQAtT-000wnC-KC; Wed, 07 Oct 2020 11:58:15 -0300
Date: Wed, 7 Oct 2020 11:58:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201007145815.GS5177@ziepe.ca>
References: <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
 <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
 <725819e9-4f07-3f04-08f8-b6180406b339@samsung.com>
 <20201007124409.GN5177@ziepe.ca>
 <CAAFQd5D0ahP-3hp_vGEmJ2cyBOMXeW9HX5yKaVPcQTsFwwOE8Q@mail.gmail.com>
 <CAKMK7uG3fds79Yf9VhMstnJ2+UHYUEVdODkoOvtwFC28_+T6RA@mail.gmail.com>
 <20201007130610.GP5177@ziepe.ca>
 <CAAFQd5CH8ytmwfd_AD0e9C92xkW3fRPmqvi9_4UN6pw-y3f-sg@mail.gmail.com>
 <CAKMK7uFSTrULTE-o+vHU-81dJpKJ5cHAAb8qkpQtcz6KrhvPzg@mail.gmail.com>
 <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5ArKWR8f4XO73UB7tyeq3ZCYJb4OD_K=2hxOgputRY=Rw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 04:11:59PM +0200, Tomasz Figa wrote:

> We also need to bring back the vma_open() that somehow disappeared
> around 4.2, as Marek found.

No

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
