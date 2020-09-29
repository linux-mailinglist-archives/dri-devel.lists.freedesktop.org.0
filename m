Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C027CD59
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 14:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC4889D4A;
	Tue, 29 Sep 2020 12:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005289D40;
 Tue, 29 Sep 2020 12:43:42 +0000 (UTC)
IronPort-SDR: acd0xYFwZJZR0Tfxadefh5p34/l49M4Yboi0mBC7Agjbh8e2mr/CfFj/tlTT7FM/sKNOBJ611H
 YqZiS3BtKwyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="163058471"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="163058471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 05:43:38 -0700
IronPort-SDR: 7NX3Uj2736sJSbglPVjhaPntDnQdsledhJmbVZ7ccHlY/O7oFpamoLrlz94VPls0ygLxWO+Opt
 LlneFgXipAmw==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="457266308"
Received: from akoski1-mobl7.ger.corp.intel.com (HELO localhost)
 ([10.252.11.87])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 05:43:33 -0700
MIME-Version: 1.0
In-Reply-To: <20200928123741.GA4999@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
 <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
 <20200926062959.GA3427@lst.de>
 <160128801808.6464.1013594053120198786@jlahtine-mobl.ger.corp.intel.com>
 <20200928123741.GA4999@lst.de>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove alloc_vm_area v2
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <160138340987.15771.13645983702040612672@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 29 Sep 2020 15:43:30 +0300
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Matthew Auld <matthew.auld@intel.com>, xen-devel@lists.xenproject.org,
 Nitin Gupta <ngupta@vflare.org>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Christoph Hellwig (2020-09-28 15:37:41)
> On Mon, Sep 28, 2020 at 01:13:38PM +0300, Joonas Lahtinen wrote:
> > I think we have a gap that after splitting the drm-intel-next pull requests into
> > two the drm-intel/for-linux-next branch is now missing material from
> > drm-intel/drm-intel-gt-next.
> > 
> > I think a simple course of action might be to start including drm-intel-gt-next
> > in linux-next, which would mean that we should update DIM tooling to add
> > extra branch "drm-intel/gt-for-linux-next" or so.
> > 
> > Which specific patches are missing in this case?
> 
> The two dependencies required by my series not in mainline are:
> 
>     drm/i915/gem: Avoid implicit vmap for highmem on x86-32
>     drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported
> 
> so it has to be one or both of those.

Hmm, those are both committed after our last -next pull request, so they
would normally only target next merge window. drm-next closes the merge
window around -rc5 already.

But, in this specific case those are both Fixes: patches with Cc: stable,
so they should be pulled into drm-intel-next-fixes PR.

Rodrigo, can you cherry-pick those patches to -next-fixes that you send
to Dave?

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
