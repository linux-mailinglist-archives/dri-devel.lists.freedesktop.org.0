Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00651AF7A2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 17:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B10C10E86E;
	Thu,  3 Jul 2025 15:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="GfKAXFWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD5010E86E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KHO5F2gS4NsM2cj8DILH9cfv+lGEr4oHFKOA0q0LhyA=; b=GfKAXFWUwfWAQUjYucF9scqsdu
 G+xWKXkIPqeFH+7/0OxHTVOlNTMMLM2XKeLUyfTsiL65l2lM83uFOmjLopIQgTyJK/SS2yO5icf2G
 bU+Us3ArfoPjoPi0gvDDWxuN2tkyBTi00C83pElAyUckh7F9BGnSpE7Yui5Q8DvHqs4RVfCzKhUBp
 pMd/mWNunPR9RJfbxNwng0gSEuajT9djtGepcAUSWqHlLWSOTctTF+niIj2YVYhxAiZtOagnX1TDo
 DV9j1DcrddKeRyJp0+b9c+ElqyYygrbWHkrag2dOhjnkQRqiWHrnky4O7mkvIKSo1BqsDRwiFP/uS
 T9+mV9Sw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uXLZw-00000003xSo-1qp2; Thu, 03 Jul 2025 15:10:24 +0000
Date: Thu, 3 Jul 2025 16:10:24 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH 01/11] zynqmp: don't bother with
 debugfs_file_{get,put}() in proxied fops
Message-ID: <20250703151024.GL1880847@ZenIV>
References: <20250702211305.GE1880847@ZenIV> <20250702211408.GA3406663@ZenIV>
 <175149835231.467027.7368105747282893229.b4-ty@kernel.dk>
 <20250703002329.GF1880847@ZenIV>
 <2025070316-curled-villain-c282@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025070316-curled-villain-c282@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 03, 2025 at 01:37:58PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 03, 2025 at 01:23:29AM +0100, Al Viro wrote:
> > On Wed, Jul 02, 2025 at 05:19:12PM -0600, Jens Axboe wrote:
> > > 
> > > On Wed, 02 Jul 2025 22:14:08 +0100, Al Viro wrote:
> > > > When debugfs file has been created by debugfs_create_file_unsafe(),
> > > > we do need the file_operations methods to use debugfs_file_{get,put}()
> > > > to prevent concurrent removal; for files created by debugfs_create_file()
> > > > that is done in the wrappers that call underlying methods, so there's
> > > > no point whatsoever duplicating that in the underlying methods themselves.
> > > > 
> > > > 
> > > > [...]
> > > 
> > > Applied, thanks!
> > > 
> > > [10/11] blk-mq-debugfs: use debugfs_get_aux()
       ^^^^^
> > >         commit: c25885fc939f29200cccb58ffdb920a91ec62647
> > 
> > Umm...  That sucker depends upon the previous commit - you'll
> > need to cast debugfs_get_aux() result to void * without that...
> 
> Wait, what "previous commit" this is patch 01/11 of the series?

Jens replied to 01/11 saying that he'd grabbed 10/11, unfortunately
without 09/11...
