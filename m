Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D837152296
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 00:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18186E927;
	Tue,  4 Feb 2020 22:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262356E924;
 Tue,  4 Feb 2020 22:59:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20118416-1500050 for multiple; Tue, 04 Feb 2020 22:59:43 +0000
MIME-Version: 1.0
To: Alex Deucher <alexdeucher@gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CADnq5_N7azVKP0iB1NMWz7KM79cU7HvR7Ssh1nbLDyBP946hxw@mail.gmail.com>
References: <20200202171635.4039044-1-chris@chris-wilson.co.uk>
 <CADnq5_N7azVKP0iB1NMWz7KM79cU7HvR7Ssh1nbLDyBP946hxw@mail.gmail.com>
Message-ID: <158085718138.1394.5219439535106159931@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 1/5] drm: Remove PageReserved manipulation from
 drm_pci_alloc
Date: Tue, 04 Feb 2020 22:59:41 +0000
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "for 3.8" <stable@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Alex Deucher (2020-02-03 21:49:48)
> On Sun, Feb 2, 2020 at 12:16 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > drm_pci_alloc/drm_pci_free are very thin wrappers around the core dma
> > facilities, and we have no special reason within the drm layer to behave
> > differently. In particular, since
> >
> > commit de09d31dd38a50fdce106c15abd68432eebbd014
> > Author: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Date:   Fri Jan 15 16:51:42 2016 -0800
> >
> >     page-flags: define PG_reserved behavior on compound pages
> >
> >     As far as I can see there's no users of PG_reserved on compound pages.
> >     Let's use PF_NO_COMPOUND here.
> >
> > it has been illegal to combine GFP_COMP with SetPageReserved, so lets
> > stop doing both and leave the dma layer to its own devices.
> >
> > Reported-by: Taketo Kabe
> 
> Needs an email address.

None provided, I don't insist that they opt in to potential spam
harvesting.

> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/1027
> 
> Should be Bug: rather than Closes:

We're using Closes for gitlab, since we hope to integrate with gitlab
someday. (Or at least some integrated bug/source management, of which
gitlab is the current forerunner.)
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
