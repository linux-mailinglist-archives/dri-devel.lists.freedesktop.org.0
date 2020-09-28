Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADB27AB9C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 12:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813E76E113;
	Mon, 28 Sep 2020 10:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321AA89F8E;
 Mon, 28 Sep 2020 10:13:50 +0000 (UTC)
IronPort-SDR: ifmlwUl4aDrxFAMWZhMU2qhwXOe5rLot1YtYxn1NugFnSD4xvu3EWL6FodP41Pqjo55wHy13pr
 VUvZTjiwUVWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="159312100"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="159312100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 03:13:47 -0700
IronPort-SDR: oynyLpLaEo8E2hmYKjUK2eLejsF9h1nd7bvB1+8YkaeLPVcxKUTeXs7JzHnC+u3AXBq2RQNnIu
 AssYzP9UKYBw==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="456766108"
Received: from jrcarrol-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.31.240])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 03:13:41 -0700
MIME-Version: 1.0
In-Reply-To: <20200926062959.GA3427@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
Subject: Re: remove alloc_vm_area v2
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Rothwell <sfr@canb.auug.org.au>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 28 Sep 2020 13:13:38 +0300
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ Dave and Daniel
+ Stephen

Quoting Christoph Hellwig (2020-09-26 09:29:59)
> On Fri, Sep 25, 2020 at 07:43:49PM -0700, Andrew Morton wrote:
> > On Thu, 24 Sep 2020 15:58:42 +0200 Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > this series removes alloc_vm_area, which was left over from the big
> > > vmalloc interface rework.  It is a rather arkane interface, basicaly
> > > the equivalent of get_vm_area + actually faulting in all PTEs in
> > > the allocated area.  It was originally addeds for Xen (which isn't
> > > modular to start with), and then grew users in zsmalloc and i915
> > > which seems to mostly qualify as abuses of the interface, especially
> > > for i915 as a random driver should not set up PTE bits directly.
> > > 
> > > Note that the i915 patches apply to the drm-tip branch of the drm-tip
> > > tree, as that tree has recent conflicting commits in the same area.
> > 
> > Is the drm-tip material in linux-next yet?  I'm still seeing a non-trivial
> > reject in there at present.
> 
> I assumed it was, but the reject imply that they aren't.  Tvrtko, do you
> know the details?

I think we have a gap that after splitting the drm-intel-next pull requests into
two the drm-intel/for-linux-next branch is now missing material from
drm-intel/drm-intel-gt-next.

I think a simple course of action might be to start including drm-intel-gt-next
in linux-next, which would mean that we should update DIM tooling to add
extra branch "drm-intel/gt-for-linux-next" or so.

Which specific patches are missing in this case?

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
