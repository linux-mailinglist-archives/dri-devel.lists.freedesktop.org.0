Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B7814FE71
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 18:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7136E0CA;
	Sun,  2 Feb 2020 17:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531126E0CA;
 Sun,  2 Feb 2020 17:06:59 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20091882-1500050 for multiple; Sun, 02 Feb 2020 17:06:51 +0000
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200202164306.GQ43062@phenom.ffwll.local>
References: <20200202161009.3969641-1-chris@chris-wilson.co.uk>
 <20200202164306.GQ43062@phenom.ffwll.local>
Message-ID: <158066320986.17828.7875090801235082375@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm: Remove PageReserved manipulation from drm_pci_alloc
Date: Sun, 02 Feb 2020 17:06:49 +0000
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-02-02 16:43:06)
> On Sun, Feb 02, 2020 at 04:10:09PM +0000, Chris Wilson wrote:
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
> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/1027
> > Fixes: de09d31dd38a ("page-flags: define PG_reserved behavior on compound pages")
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: <stable@vger.kernel.org> # v4.5+
> 
> Given that after your i915 patch only mga and r128 still use this I think
> deleting code is the best action here.

drm_bufs.c has a little sting in its tail with the inclusion of the
drm_dma_handle struct in its seglist. Certainly after removing r128 we
can remove the EXPORT_SYMBOL and make it internal.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
