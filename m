Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D204B63E1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 08:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BBA10E29A;
	Tue, 15 Feb 2022 07:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B64910E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:01:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AB27B81732;
 Tue, 15 Feb 2022 07:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0A5C340EC;
 Tue, 15 Feb 2022 07:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644908501;
 bh=wpzzdawXPScQHsJKBVOQr1uSYppSynJn4bs/yhbdSyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sDmBWC3bBYfh7HeEsWgCqhfPOjCVWGl90AwNQquw/s37apawMvykr5dLCSbz5VT27
 a5wp3rnQFH3/laPLOG74o03tMDNPPnSjnHPzjnFiNl3JfoADYuF4Ae3fNI0UhZkloP
 Bj+1hg9P55uKX3tSh0BSWmUJrdwJHc5XuXmorEUI=
Date: Tue, 15 Feb 2022 08:01:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
Message-ID: <YgtPzXUmSOVyplnm@kroah.com>
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com>
 <Ygdfe3XSvN8iFuUc@kroah.com>
 <CABdmKX1eKZZ9809uxnzT_Bm+mdNuK2AObLRxyBpdDF3yE76Hrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX1eKZZ9809uxnzT_Bm+mdNuK2AObLRxyBpdDF3yE76Hrg@mail.gmail.com>
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
Cc: Zefan Li <lizefan.x@bytedance.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 linaro-mm-sig@lists.linaro.org, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 Hridya Valsaraju <hridya@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 02:25:47PM -0800, T.J. Mercier wrote:
> On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> > > --- a/include/uapi/linux/android/binder.h
> > > +++ b/include/uapi/linux/android/binder.h
> > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > >
> > >  enum {
> > >       BINDER_BUFFER_FLAG_HAS_PARENT = 0x01,
> > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED = 0x02,
> > >  };
> > >
> > >  /* struct binder_fd_array_object - object describing an array of fds in a buffer
> > > --
> > > 2.35.1.265.g69c8d7142f-goog
> > >
> >
> > How does userspace know that binder supports this new flag?
> 
> Sorry, I don't completely follow even after Todd's comment. Doesn't
> the presence of BINDER_BUFFER_FLAG_SENDER_NO_NEED in the header do
> this?

There is no "header" when running a new kernel on an old userspace,
right?  How about the other way around, old kernel, new userspace?

> So wouldn't userspace need to be compiled against the wrong
> kernel headers for there to be a problem? In that case the allocation
> would still succeed, but there would be no charge transfer and
> unfortunately no error code.

No error code is not good.  People upgrade their kernels all the time,
and do not do a "rebuild the world" when doing so.

> > And where is the userspace test for this new feature?
> 
> I tested this on a Pixel after modifying the gralloc implementation to
> mark allocated buffers as not used by the sender. This required
> setting the BINDER_BUFFER_FLAG_SENDER_NO_NEED in libhwbinder. That
> code can be found here:
> https://android-review.googlesource.com/c/platform/system/libhwbinder/+/1910752/1/Parcel.cpp
> https://android-review.googlesource.com/c/platform/system/libhidl/+/1910611/
> 
> Then by inspecting gpu.memory.current files in sysfs I was able to see
> the memory attributed to processes other than the graphics allocator
> service. Before this change, several megabytes of memory were
> attributed to the graphics allocator service but those buffers are
> actually used by other processes like surfaceflinger, the camera, etc.
> After the change, the gpu.memory.current amount for the graphics
> allocator service was 0 and the charges showed up in the
> gpu.memory.current files for those other processes like this:
> 
> PID: 764 Process Name: zygote64
> system 8192
> system-uncached 23191552
> 
> PID: 529 Process Name: /system/bin/surfaceflinger
> system-uncached 109535232
> system 92196864
> 
> PID: 530 Process Name:
> /vendor/bin/hw/android.hardware.graphics.allocator@4.0-service
> system-uncached 0
> system 0
> sensor_direct_heap 0
> 
> PID: 806 Process Name:
> /apex/com.google.pixel.camera.hal/bin/hw/android.hardware.camera.provider@2.7-service-google
> system 1196032
> 
> PID: 4608 Process Name: com.google.android.GoogleCamera
> system 2408448
> system-uncached 38887424
> sensor_direct_heap 0
> 
> PID: 32102 Process Name: com.google.android.googlequicksearchbox:search
> system-uncached 91279360
> system 20480
> 
> PID: 2758 Process Name: com.google.android.youtube
> system-uncached 1662976
> system 8192
> 
> PID: 2517 Process Name: com.google.android.apps.nexuslauncher
> system-uncached 115662848
> system 122880
> 
> PID: 2066 Process Name: com.android.systemui
> system 86016
> system-uncached 37957632
> 
> >  Isn't there a binder test framework somewhere?
> 
> Android has the Vendor Test Suite where automated tests could be added
> for this. Is that what you're thinking of?

tools/testing/selftests/ is a good start.  VTS is the worst-case as no
one can really run that on their own, but it is better than nothing.
Having no test at all for this is not ok.

thanks,

greg k-h
