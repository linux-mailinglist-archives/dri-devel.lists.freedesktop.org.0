Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E0534652
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 00:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F4710F293;
	Wed, 25 May 2022 22:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B2E10F263;
 Wed, 25 May 2022 22:20:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9A8BB81EAD;
 Wed, 25 May 2022 22:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0633C385B8;
 Wed, 25 May 2022 22:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1653517207;
 bh=c7KzToDeUqtD99O2hzHK7o5kCE8vnxm1uZ6cI59st/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lc5Bswn5/mLgrZUzDGaOfcSNR02Mm/oMMFmAsk3PMUUgwWwgJa8zBW3fhkYeoBrs6
 zULKKPi/KMazKRvfEOpIG5mlq58qHM3l4UzEO0HxQt9EhuXQjV37+aQrktHPNlneq8
 f2dYK6/dz9JhOi+TYCUG0YZy8hrl37z6cFtGSZlg=
Date: Wed, 25 May 2022 15:20:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-Id: <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
In-Reply-To: <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 kvm@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-parport@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 May 2022 23:07:35 +0100 Jessica Clarke <jrtc27@jrtc27.com> wrote:

> This is i386, so an unsigned long is 32-bit, but i_blocks is a blkcnt_t
> i.e. a u64, which makes the shift without a cast of the LHS fishy.

Ah, of course, thanks.  I remember 32 bits ;)

--- a/mm/shmem.c~mm-shmemc-suppress-shift-warning
+++ a/mm/shmem.c
@@ -1945,7 +1945,7 @@ alloc_nohuge:
 
 	spin_lock_irq(&info->lock);
 	info->alloced += folio_nr_pages(folio);
-	inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
+	inode->i_blocks += (blkcnt_t)BLOCKS_PER_PAGE << folio_order(folio);
 	shmem_recalc_inode(inode);
 	spin_unlock_irq(&info->lock);
 	alloced = true;
_

