Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27605296A3A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2376E4AA;
	Fri, 23 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DED06E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 11:43:47 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id bl9so647743qvb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tn5VStmyr19eg0AHWkg65WyZIMHvKO6plAVuAqOgPDQ=;
 b=W2W63+Km46WNPYtkSR3igfnV7TEUq5madmsiNOsLljJ4hXhwY+tNpYNU0U98RMc/Ra
 N/OqT1bclh4ytLL1rVRfHDNQXuCClycUHEstVDTB13O2SeX7rcenP16ZDtQZwB1W1jcc
 qY+V9dfylqzLN5PiDQabSjcYMeIPMV8H3MvDBIvqP9uVDzx0l3+DGSbt51z70fKAGBps
 MOgHN8p+THySDXKSzKDRAxFER+JAglmr7hGRyvf9N5t7jpnIarxCymOKiSFfwhwoQKR+
 3E88SiMtx1h9HdY+LUkd3T5LmcI1LTVNdrFdFYFYlKXO0Wntp7OMh6vxttQFR1tsYI0Q
 kJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tn5VStmyr19eg0AHWkg65WyZIMHvKO6plAVuAqOgPDQ=;
 b=mITGXpGHOsugqXIF3l3Hu++9rNg17cdXT/B5RQ81hxCY89FdnEvzPa7WCVx0qek+3h
 v+Q4vMz2CG1YCxJDcL/yp/0/xDYVRKJuIOMYN/WS9V9J2OCY955vR85XQ4W3Lr//lq9l
 Uhw389PtBdDCVTNIKAeHRsHhRqv3xnqDR9SzQb5wvcWywlLt87l/in4xuR/VRg6413PY
 C0/zBAIopb6fEnFqO5OH2iFy3lkrm86kOO4g0JCX3FYoKyuKgKW/md/inbZiLRpDhlwn
 IMx8yC4D43YuPhVqDHnjIwPAg8WCjvIt8oWMnW7eicR65Ud+orxInfiI3yqWZ4qgIgSX
 2nxA==
X-Gm-Message-State: AOAM5339bVlf4iWvsDXqVHIb4RwyT2QSdKysL20m7Zl9yAFKpcMDlHZx
 bkgSqTHZFv9tx2SxgFm1udyncQ==
X-Google-Smtp-Source: ABdhPJw6OYYGIWsKIpwZGlvXqWx4K8ij3H0LBJb/eEFtxBXIO8uo2emBiN1PSKDxC0xVD0g026FmxA==
X-Received: by 2002:ad4:45a5:: with SMTP id y5mr1935405qvu.40.1603367026713;
 Thu, 22 Oct 2020 04:43:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id l25sm820821qtf.18.2020.10.22.04.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 04:43:45 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kVZ0T-0040bW-1W; Thu, 22 Oct 2020 08:43:45 -0300
Date: Thu, 22 Oct 2020 08:43:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201022114345.GO36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca>
 <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
 <20201021232022.GN36674@ziepe.ca>
 <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEkAK42+19KRo06XzJFuMCVriEEg0jxqXq8oAdt2ExLsQ@mail.gmail.com>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 22, 2020 at 09:00:44AM +0200, Daniel Vetter wrote:
> On Thu, Oct 22, 2020 at 1:20 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> > > On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> > > >
> > > > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > > > split that. So ideally ->mmap would never set up any ptes.
> > > >
> > > > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> > > >
> > > > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > > > users that could work like this - eg anyone mmaping IO memory is
> > > > probably OK.
> > >
> > > I was more generally thinking for io_remap_pfn_users because of the
> > > mkwrite use-case we might have in fbdev emulation in drm.
> >
> > You have a use case for MAP_PRIVATE and io_remap_pfn_range()??
> 
> Uh no :-)

So it is fine, the pgoff mangling only happens for MAP_PRIVATE

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
