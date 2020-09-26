Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F8279646
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 04:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8FE6E106;
	Sat, 26 Sep 2020 02:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0566E106;
 Sat, 26 Sep 2020 02:43:51 +0000 (UTC)
Received: from X1 (unknown [104.245.68.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3885820878;
 Sat, 26 Sep 2020 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601088231;
 bh=1nkZCA5YPl8bVzihcrG7vvM8b//lqkJ5TQeIuSIoqCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dCRAn6cZQrrJb2Wh/R/Zwk22edLD5gfhWGDqwTYHfDhwL8p9lj1q3nd20NicS+n6l
 q5ujK20g/b5JixrtLCZ8ysCD9kfVgSPlWmXQyL1yASDHU+i0PynwItHvs0xxsLQqqI
 YCTc9mEz0rJ75n3w690uhG5J+1mzUwI54ugn3gJs=
Date: Fri, 25 Sep 2020 19:43:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove alloc_vm_area v2
Message-Id: <20200925194349.d0ee9dbedb2ec48f0bfcd2ec@linux-foundation.org>
In-Reply-To: <20200924135853.875294-1-hch@lst.de>
References: <20200924135853.875294-1-hch@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, x86@kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Minchan Kim <minchan@kernel.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Sep 2020 15:58:42 +0200 Christoph Hellwig <hch@lst.de> wrote:

> this series removes alloc_vm_area, which was left over from the big
> vmalloc interface rework.  It is a rather arkane interface, basicaly
> the equivalent of get_vm_area + actually faulting in all PTEs in
> the allocated area.  It was originally addeds for Xen (which isn't
> modular to start with), and then grew users in zsmalloc and i915
> which seems to mostly qualify as abuses of the interface, especially
> for i915 as a random driver should not set up PTE bits directly.
> 
> Note that the i915 patches apply to the drm-tip branch of the drm-tip
> tree, as that tree has recent conflicting commits in the same area.

Is the drm-tip material in linux-next yet?  I'm still seeing a non-trivial
reject in there at present.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
