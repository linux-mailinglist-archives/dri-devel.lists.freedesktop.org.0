Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF793254A2A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 18:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAD16E0D6;
	Thu, 27 Aug 2020 16:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEFA6E0D6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 16:04:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABD8E2087C;
 Thu, 27 Aug 2020 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598544293;
 bh=rwQ/I+StX+hW3DzS8e/XvFVLw192KlfoLbzKaXNNNho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzFH5E1V0v6VtsHnccLbsHLdtZ1RhFXnwf06Oo61n+DzUzOMylTsokXN9OnGNSGoM
 iS4ukL3VI8o5PrGu9/VL17TssOd0kyPNiQ08wnRISXRxHy/sx7ITH83rXvmph8lkuH
 FzQI/ClSexFV4js1QzHN1YxTDDWC0k9EAAdhN5QQ=
Date: Thu, 27 Aug 2020 18:05:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laura Abbott <laura@labbott.name>
Subject: Re: [PATCH] staging: ion: remove from the tree
Message-ID: <20200827160506.GC684514@kroah.com>
References: <20200827123627.538189-1-gregkh@linuxfoundation.org>
 <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d8de519-65b3-123b-8ace-e820982884e0@labbott.name>
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
Cc: devel@driverdev.osuosl.org, Christoph Hellwig <hch@infradead.org>,
 kernel-team@android.com, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Joel Fernandes <joel@joelfernandes.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Suren Baghdasaryan <surenb@google.com>, Hridya Valsaraju <hridya@google.com>,
 Shuah Khan <shuah@kernel.org>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 27, 2020 at 09:31:27AM -0400, Laura Abbott wrote:
> On 8/27/20 8:36 AM, Greg Kroah-Hartman wrote:
> > The ION android code has long been marked to be removed, now that we
> > dma-buf support merged into the real part of the kernel.
> > =

> > It was thought that we could wait to remove the ion kernel at a later
> > time, but as the out-of-tree Android fork of the ion code has diverged
> > quite a bit, and any Android device using the ion interface uses that
> > forked version and not this in-tree version, the in-tree copy of the
> > code is abandonded and not used by anyone.
> > =

> > Combine this abandoned codebase with the need to make changes to it in
> > order to keep the kernel building properly, which then causes merge
> > issues when merging those changes into the out-of-tree Android code, and
> > you end up with two different groups of people (the in-kernel-tree
> > developers, and the Android kernel developers) who are both annoyed at
> > the current situation.  Because of this problem, just drop the in-kernel
> > copy of the ion code now, as it's not used, and is only causing problems
> > for everyone involved.
> > =

> > Cc: "Arve Hj=F8nnev=E5g" <arve@android.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: Christian Brauner <christian@brauner.io>
> > Cc: Christoph Hellwig <hch@infradead.org>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Joel Fernandes <joel@joelfernandes.org>
> > Cc: John Stultz <john.stultz@linaro.org>
> > Cc: Laura Abbott <laura@labbott.name>
> > Cc: Martijn Coenen <maco@android.com>
> > Cc: Shuah Khan <shuah@kernel.org>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Todd Kjos <tkjos@android.com>
> > Cc: devel@driverdev.osuosl.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> We discussed this at the Android MC on Monday and the plan was to
> remove it after the next LTS release.

I know it was discussed, my point is that it is actually causing
problems now (with developers who want to change the internal kernel api
hitting issues, and newbies trying to clean up code in ways that isn't
exactly optimal wasting maintainer cycles), and that anyone who uses
this code, is not actually using this version of the code.  Everyone who
relies on ion right now, is using the version that is in the Android
common kernel tree, which has diverged from this in-kernel way quite a
bit now for the reason that we didn't want to take any of those new
features in the in-kernel version.

So this is a problem that we have caused by just wanting to wait, no one
is using this code, combined with it causing problems for the upstream
developers.

There is nothing "magic" about the last kernel of the year that requires
this code to sit here until then.  At that point in time, all users
will, again, be using the forked Android kernel version, and if we
delete this now here, that fork can remain just fine, with the added
benifit of it reducing developer workloads here in-kernel.

So why wait?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
