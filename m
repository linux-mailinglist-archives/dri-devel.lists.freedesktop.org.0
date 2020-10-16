Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED528FFF3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 10:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788FA6E0F3;
	Fri, 16 Oct 2020 08:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FEF6E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 08:29:14 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 557D720848;
 Fri, 16 Oct 2020 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602836954;
 bh=gfZRHfiV80AkMKP13njGzfHmEMvVJhxSpHJPlsKp1c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M99FiJnEjdsc3CNdrjTG2ze4YE+/WGGIya7iMnIJ2VJM/C48P8VP8gGVqGmjMQLgI
 7qJdGyKvgKAmGLUAhXsyRdkeTUX4EybvdBq0WNvZQFpQsEexH8YzwD7Ha5pbTjcA5s
 /JpgKN2bLBqm0vwfX6OownE57unxVBFlCa2ng6Rc=
Date: Fri, 16 Oct 2020 10:29:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Laura Abbott <laura@labbott.name>
Subject: Re: [PATCH] staging: ion: remove from the tree
Message-ID: <20201016082945.GA1722359@kroah.com>
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

As 5.10 will be the next LTS release, I have now merged it to my
"testing" branch to go into 5.11-rc1.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
