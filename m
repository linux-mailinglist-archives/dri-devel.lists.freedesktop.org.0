Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230D6FEBD4
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 08:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D0A10E5AB;
	Thu, 11 May 2023 06:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BA210E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 06:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=RtWxN7e4QjgKeMqyRm8+weDfqFq3jfnkuzd3W1qjtiM=; b=jw/mMH9qT+/rpGk7mfI4YGlPGe
 uWTb2lZmqfZIuwVdgWuQnLtmQkWFasYr7kqa7CUIFVCLKRFtUvi1n8Qd+6fMBYIIAbvrl/GdFxv2J
 lqAmLygNJHA+XCTSh+mldXiQG+o7dI8T8FS5MrntPj1B3P2ekHWFpwYFdC4tjvXb2QUArkaE0igA9
 oZtyK6diEXw40KxwmYst51pwkoEifoIuQGmWWNdXLmKJ3cCOtTTeK1EclD5jXQT9bgdhOYp/vs0Fz
 UBoWWTUbFlQsarbW1h9IC4EJZW1ubTxAV15CCwSdzwFvYrZWcxDjqD9Lezep+zRrsTgNjjVxyMM2m
 zJpZGunw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pwzyw-001dzq-0x; Thu, 11 May 2023 06:40:54 +0000
Date: Thu, 11 May 2023 07:40:54 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf/sync_file: Use fdget()
Message-ID: <20230511064054.GM3390869@ZenIV>
References: <202305051103396748797@zte.com.cn>
 <b9ceed26-bf64-6314-3ec5-562542b2b1c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9ceed26-bf64-6314-3ec5-562542b2b1c6@amd.com>
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
Cc: ye.xingchen@zte.com.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 gustavo@padovan.org, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 10:22:09AM +0200, Christian König wrote:
> Am 05.05.23 um 05:03 schrieb ye.xingchen@zte.com.cn:
> > From: Ye Xingchen <ye.xingchen@zte.com.cn>
> > 
> > convert the fget() use to fdget().
> 
> Well the rational is missing. Why should we do that?

We very definitely should not.  The series appears to be
pure cargo-culting and it's completely wrong.

There is such thing as unwarranted use of fget().  Under some
conditions converting to fdget() is legitimate *and* is an
improvement.  HOWEVER, those conditions are not met in this case.

Background: references in descriptor table do contribute to
struct file refcount.  fget() finds the reference by descriptor
and returns it, having bumped the refcount.  In case when
descriptor table is shared, we must do that - otherwise e.g.
close() or dup2() from another thread could very well have
destroyed the struct file we'd just found.  However, if
descriptor table is *NOT* shared, there's no need to mess
with refcount at all.  Provided that
	* we are not grabbing the reference to keep it (stash
into some data structure, etc.); as soon as we return from
syscall, the reference in descriptor table is fair game for
e.g. close(2).  Or exit(2), for that matter.
	* we remember whether it was shared or not - we can't
just recheck that when we are done with the file; after all,
descriptor table might have been shared when we looked the file up,
but another thread might've died since then and left it not
shared anymore.
	* we do not rip the same reference out of our descriptor
table ourselves - not without seriously convoluted precautions.
Very few places in the kernel can lead to closing descriptors,
so in practice it only becomes a problem when a particularly
ugly ioctl decides that it would be neat to close some descriptor(s).
Example of such convolutions: binder_deferred_fd_close().

fdget() returns a pair that consists of struct file reference
*AND* indication whether we have grabbed a reference.  fdput()
takes such pair.

Both are inlined, and compiler is smart enough to split the
pair into two separate local variables.  The underlying
primitive actually stashes the "have grabbed the refcount"
into the LSB of returned word; see __to_fd() in include/linux/file.h
for details.  It really generates a decent code and a plenty of
places where we want a file by descriptor are just fine with it.

This patch is flat-out broken, since it loses the "have we bumped
the refcount" information - the callers do not get it.

It might be possible to massage the calling conventions to enable
the conversion to fdget(), but it's not obvious that result would
be cleaner and in any case, the patch in question doesn't even
try that.
