Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D553AF7290
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 13:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356FC10E168;
	Thu,  3 Jul 2025 11:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PcWAM3Be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BA510E168
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 11:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B985A537F4;
 Thu,  3 Jul 2025 11:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C45EC4CEE3;
 Thu,  3 Jul 2025 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751542681;
 bh=MkhGLruOucZARLsZikLDanvBS9WnavvoCIx5cJdjPfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcWAM3Be2WoNu0WAmoGdLtqP6ompjjjZfeGtwPUQA4PnstwjjkdcWCF2GRgbmCUGl
 hMUIUckg6g8/d+aXGWFglR0Yoj++ajBQ8KSDnvf6NAQ5n7PYctaWeVU/0ktDNhDrxa
 1dhHaUVwWJEPBeT7fLD/cj2lFzJMl0c8MXA7YQ6U=
Date: Thu, 3 Jul 2025 13:37:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH 01/11] zynqmp: don't bother with
 debugfs_file_{get,put}() in proxied fops
Message-ID: <2025070316-curled-villain-c282@gregkh>
References: <20250702211305.GE1880847@ZenIV> <20250702211408.GA3406663@ZenIV>
 <175149835231.467027.7368105747282893229.b4-ty@kernel.dk>
 <20250703002329.GF1880847@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703002329.GF1880847@ZenIV>
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

On Thu, Jul 03, 2025 at 01:23:29AM +0100, Al Viro wrote:
> On Wed, Jul 02, 2025 at 05:19:12PM -0600, Jens Axboe wrote:
> > 
> > On Wed, 02 Jul 2025 22:14:08 +0100, Al Viro wrote:
> > > When debugfs file has been created by debugfs_create_file_unsafe(),
> > > we do need the file_operations methods to use debugfs_file_{get,put}()
> > > to prevent concurrent removal; for files created by debugfs_create_file()
> > > that is done in the wrappers that call underlying methods, so there's
> > > no point whatsoever duplicating that in the underlying methods themselves.
> > > 
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [10/11] blk-mq-debugfs: use debugfs_get_aux()
> >         commit: c25885fc939f29200cccb58ffdb920a91ec62647
> 
> Umm...  That sucker depends upon the previous commit - you'll
> need to cast debugfs_get_aux() result to void * without that...

Wait, what "previous commit" this is patch 01/11 of the series?

I'm all for you just taking this through your trees if it depends on
something else that is there, but that wasn't obvious, sorry.

greg k-h
