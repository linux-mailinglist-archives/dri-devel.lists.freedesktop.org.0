Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E54B645D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82B810E387;
	Tue, 15 Feb 2022 07:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E205E10E387
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:30:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D6BC615BD;
 Tue, 15 Feb 2022 07:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F634C340EC;
 Tue, 15 Feb 2022 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644910246;
 bh=d7O0LjAMCqSVPzrmAjEUAUrhTljBtokM4lMRkzTZRn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nI9BT8e7bH53D6xl7GN7ShLijc1GUvEbq4aQlISk6014ej3GYNqf5qP80x8gmm/C9
 0guWhIB8CG6B5zuHuf00vQIZDZHrwIIKCzcTJ9SwAxgKSiayqHfUjljXOt3LauL8UI
 VXdXc4rXKsY/KwXxCm704rsBDZEywjRr3as+lK1g=
Date: Tue, 15 Feb 2022 08:30:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
Message-ID: <YgtWo+6UeAU4/CvT@kroah.com>
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com>
 <Ygdfe3XSvN8iFuUc@kroah.com>
 <CABdmKX1eKZZ9809uxnzT_Bm+mdNuK2AObLRxyBpdDF3yE76Hrg@mail.gmail.com>
 <YgtPzXUmSOVyplnm@kroah.com>
 <CAJuCfpG0V2qZVVUPRmw3fZP-bQmp+w36nOUe9iHtgmuHb7PemQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpG0V2qZVVUPRmw3fZP-bQmp+w36nOUe9iHtgmuHb7PemQ@mail.gmail.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Laura Abbott <labbott@redhat.com>, linux-media <linux-media@vger.kernel.org>,
 Todd Kjos <tkjos@android.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Tejun Heo <tj@kernel.org>, cgroups mailinglist <cgroups@vger.kernel.org>,
 Martijn Coenen <maco@android.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 LKML <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 11:19:35PM -0800, Suren Baghdasaryan wrote:
> On Mon, Feb 14, 2022 at 11:01 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Feb 14, 2022 at 02:25:47PM -0800, T.J. Mercier wrote:
> > > On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> > > > > --- a/include/uapi/linux/android/binder.h
> > > > > +++ b/include/uapi/linux/android/binder.h
> > > > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > > > >
> > > > >  enum {
> > > > >       BINDER_BUFFER_FLAG_HAS_PARENT = 0x01,
> > > > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED = 0x02,
> > > > >  };
> > > > >
> > > > >  /* struct binder_fd_array_object - object describing an array of fds in a buffer
> > > > > --
> > > > > 2.35.1.265.g69c8d7142f-goog
> > > > >
> > > >
> > > > How does userspace know that binder supports this new flag?
> > >
> > > Sorry, I don't completely follow even after Todd's comment. Doesn't
> > > the presence of BINDER_BUFFER_FLAG_SENDER_NO_NEED in the header do
> > > this?
> >
> > There is no "header" when running a new kernel on an old userspace,
> > right?  How about the other way around, old kernel, new userspace?
> 
> 1. new kernel + old userspace = kernel supports the feature but
> userspace does not use it. The old userspace won't even mount the new
> cgroup controller, accounting is not performed, charge is not
> transferred.
> 2. old kernel + new userspace = the new cgroup controller is not
> supported by the kernel, accounting is not performed, charge is not
> transferred.
> 3. old kernel + old userspace = same as #2
> 4. new kernel + new userspace = cgroup is mounted, feature is
> supported and used.
> Does that work or do we need a separate indication of whether binder
> driver supports the charge transfer feature?

Ok, if that's all working, this is fine, it just seemed odd to add a new
type like this.  Perhaps this can go into the changelog text...

thanks,

greg k-h
