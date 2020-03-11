Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB6181F87
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 18:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3F989FFD;
	Wed, 11 Mar 2020 17:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EAA89708
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:31:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m25so3843816edq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=2DGF3gMb+iPvYskNmsVGbLTEH/9YP6V4IWb7lMAfUbQ=;
 b=HUnzZD3TwlHsrltoc45sX2FOaLZXoHe89K9f6RcfFf6IdF8KavuxAA0rSTkwqxPbVI
 SQsxOAZjXvIdrm00qSR2q4IkTwH3GqfuY7bv0WRXTO6mPACGz4Ee6EKcF/oCpzHBJKTV
 zyE8RYRDC5E3WVXWaNudAT9/x75KNcVLfDCeX6Nxf7RnEQNV1sWRve5y9VQSe//TBurK
 cGapk6zDP7AHVTIF8kGq75xw0XNLQgZg8bP7D1jYOg63uBMW8f3XYVH/djSmxbB2z6IE
 az3ZVqip13Rx0/V4Ec3cBnsF9KJiCp8wd9ynZH/2pFgPgrpAibRKmjU/Lm7iKWowlUFI
 ziFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2DGF3gMb+iPvYskNmsVGbLTEH/9YP6V4IWb7lMAfUbQ=;
 b=g7WlQQfKlmc6NsTQ3lPxLszG/G6PFZ6ZG1VtK0lJSMGn4D4WNLkMM9yHxXVOnQYoO5
 oSmabZd1UQK/69vV3FXgzVjmpj9hXCyA/QmA7dnwzdHpDIQQm021EWwwoFkDuHp5NBXm
 X+/63ou+AkEaoRg6J+eidXeuZ3HUqs8hgmNSJ1bf/htswKh+chE0aC0zH3Vg1jtAgCpb
 f2iFCjNZZ9xbCdIzZDgNFVCwPeMk4pT86hruhKiG3E439zJPc3Gj7elflR6QjeMi7qhW
 XnGGChOZIUrza/GYPa785xoVq2vby/egxsU+/o0kKbLKksk1hYoTENIsTtSZSGPBTdw3
 6O7g==
X-Gm-Message-State: ANhLgQ3gQxAjQx6ScGDitm51EF1CVzlc8VKt/GAwwUaBBvlEp+m9ZxWy
 i4UAGAna2IkkMqC+qI4YhWolxwD42UATzDTnaQWePw==
X-Google-Smtp-Source: ADFU+vuaK7EvyR2zTGRAJsGVi9P4muxZQhE2yfg/qwiNaOcsfIa1QxQVep9euOqfZZjk4NIQdZxtf0rM+C8v0KBdLv0=
X-Received: by 2002:aa7:d684:: with SMTP id d4mr3747774edr.377.1583947883256; 
 Wed, 11 Mar 2020 10:31:23 -0700 (PDT)
MIME-Version: 1.0
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 11 Mar 2020 12:31:11 -0500
Message-ID: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
Subject: Plumbing explicit synchronization through the Linux ecosystem
To: ML mesa-dev <mesa-dev@lists.freedesktop.org>, 
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, 
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, xorg-devel <xorg-devel@lists.x.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-media@vger.kernel.org, 
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Daniel Stone <daniel@fooishbar.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All,

Sorry for casting such a broad net with this one. I'm sure most people
who reply will get at least one mailing list rejection.  However, this
is an issue that affects a LOT of components and that's why it's
thorny to begin with.  Please pardon the length of this e-mail as
well; I promise there's a concrete point/proposal at the end.


Explicit synchronization is the future of graphics and media.  At
least, that seems to be the consensus among all the graphics people
I've talked to.  I had a chat with one of the lead Android graphics
engineers recently who told me that doing explicit sync from the start
was one of the best engineering decisions Android ever made.  It's
also the direction being taken by more modern APIs such as Vulkan.


## What are implicit and explicit synchronization?

For those that aren't familiar with this space, GPUs, media encoders,
etc. are massively parallel and synchronization of some form is
required to ensure that everything happens in the right order and
avoid data races.  Implicit synchronization is when bits of work (3D,
compute, video encode, etc.) are implicitly based on the absolute
CPU-time order in which API calls occur.  Explicit synchronization is
when the client (whatever that means in any given context) provides
the dependency graph explicitly via some sort of synchronization
primitives.  If you're still confused, consider the following
examples:

With OpenGL and EGL, almost everything is implicit sync.  Say you have
two OpenGL contexts sharing an image where one writes to it and the
other textures from it.  The way the OpenGL spec works, the client has
to make the API calls to render to the image before (in CPU time) it
makes the API calls which texture from the image.  As long as it does
this (and maybe inserts a glFlush?), the driver will ensure that the
rendering completes before the texturing happens and you get correct
contents.

Implicit synchronization can also happen across processes.  Wayland,
for instance, is currently built on implicit sync where the client
does their rendering and then does a hand-off (via wl_surface::commit)
to tell the compositor it's done at which point the compositor can now
texture from the surface.  The hand-off ensures that the client's
OpenGL API calls happen before the server's OpenGL API calls.

A good example of explicit synchronization is the Vulkan API.  There,
a client (or multiple clients) can simultaneously build command
buffers in different threads where one of those command buffers
renders to an image and the other textures from it and then submit
both of them at the same time with instructions to the driver for
which order to execute them in.  The execution order is described via
the VkSemaphore primitive.  With the new VK_KHR_timeline_semaphore
extension, you can even submit the work which does the texturing
BEFORE the work which does the rendering and the driver will sort it
out.

The #1 problem with implicit synchronization (which explicit solves)
is that it leads to a lot of over-synchronization both in client space
and in driver/device space.  The client has to synchronize a lot more
because it has to ensure that the API calls happen in a particular
order.  The driver/device have to synchronize a lot more because they
never know what is going to end up being a synchronization point as an
API call on another thread/process may occur at any time.  As we move
to more and more multi-threaded programming this synchronization (on
the client-side especially) becomes more and more painful.


## Current status in Linux

Implicit synchronization in Linux works via a the kernel's internal
dma_buf and dma_fence data structures.  A dma_fence is a tiny object
which represents the "done" status for some bit of work.  Typically,
dma_fences are created as a by-product of someone submitting some bit
of work (say, 3D rendering) to the kernel.  The dma_buf object has a
set of dma_fences on it representing shared (read) and exclusive
(write) access to the object.  When work is submitted which, for
instance renders to the dma_buf, it's queued waiting on all the fences
on the dma_buf and and a dma_fence is created representing the end of
said rendering work and it's installed as the dma_buf's exclusive
fence.  This way, the kernel can manage all its internal queues (3D
rendering, display, video encode, etc.) and know which things to
submit in what order.

For the last few years, we've had sync_file in the kernel and it's
plumbed into some drivers.  A sync_file is just a wrapper around a
single dma_fence.  A sync_file is typically created as a by-product of
submitting work (3D, compute, etc.) to the kernel and is signaled when
that work completes.  When a sync_file is created, it is guaranteed by
the kernel that it will become signaled in finite time and, once it's
signaled, it remains signaled for the rest of time.  A sync_file is
represented in UAPIs as a file descriptor and can be used with normal
file APIs such as dup().  It can be passed into another UAPI which
does some bit of queue'd work and the submitted work will wait for the
sync_file to be triggered before executing.  A sync_file also supports
poll() if  you want to wait on it manually.

Unfortunately, sync_file is not broadly used and not all kernel GPU
drivers support it.  Here's a very quick overview of my understanding
of the status of various components (I don't know the status of
anything in the media world):

 - Vulkan: Explicit synchronization all the way but we have to go
implicit as soon as we interact with a window-system.  Vulkan has APIs
to import/export sync_files to/from it's VkSemaphore and VkFence
synchronization primitives.
 - OpenGL: Implicit all the way.  There are some EGL extensions to
enable some forms of explicit sync via sync_file but OpenGL itself is
still implicit.
 - Wayland: Currently depends on implicit sync in the kernel (accessed
via EGL/OpenGL).  There is an unstable extension to allow passing
sync_files around but it's questionable how useful it is right now
(more on that later).
 - X11: With present, it has these "explicit" fence objects but
they're always a shmfence which lets the X server and client do a
userspace CPU-side hand-off without going over the socket (and
round-tripping through the kernel).  However, the only thing that
fence does is order the OpenGL API calls in the client and server and
the real synchronization is still implicit.
 - linux/i915/gem: Fully supports using sync_file or syncobj for explicit sync.
 - linux/amdgpu: Supports sync_file and syncobj but it still
implicitly syncs sometimes due to it's internal memory residency
handling which can lead to over-synchronization.
 - KMS: Implicit sync all the way.  There are no KMS APIs which take
explicit sync primitives.
 - v4l: ???
 - gstreamer: ???
 - Media APIs such as vaapi etc.:  ???


## Chicken and egg problems

Ok, this is where it starts getting depressing.  I made the claim
above that Wayland has an explicit synchronization protocol that's of
questionable usefulness.  I would claim that basically any bit of
plumbing we do through window systems is currently of questionable
usefulness.  Why?

From my perspective, as a Vulkan driver developer, I have to deal with
the fact that Vulkan is an explicit sync API but Wayland and X11
aren't.  Unfortunately, the Wayland extension solves zero problems for
me because I can't really use it unless it's implemented in all of the
compositors.  Until every Wayland compositor I care about my users
being able to use (which is basically all of them) supports the
extension, I have to continue carry around my pile of hacks to keep
implicit sync and Vulkan working nicely together.

From the perspective of a Wayland compositor (I used to play in this
space), they'd love to implement the new explicit sync extension but
can't.  Sure, they could wire up the extension, but the moment they go
to flip a client buffer to the screen directly, they discover that KMS
doesn't support any explicit sync APIs.  So, yes, they can technically
implement the extension assuming the EGL stack they're running on has
the sync_file extensions but any client buffers which come in using
the explicit sync Wayland extension have to be composited and can't be
scanned out directly.  As a 3D driver developer, I absolutely don't
want compositors doing that because my users will complain about
performance issues due to the extra blit.

Ok, so let's say we get KMS wired up with implicit sync.  That solves
all our problems, right?  It does, right up until someone decides that
they wan to screen capture their Wayland session via some hardware
media encoder that doesn't support explicit sync.  Now we have to
plumb it all the way through the media stack, gstreamer, etc.  Great,
so let's do that!  Oh, but gstreamer won't want to plumb it through
until they're guaranteed that they can use explicit sync when
displaying on X11 or Wayland.  Are you seeing the problem?

To make matters worse, since most things are doing implicit
synchronization today, it's really easy to get your explicit
synchronization wrong and never notice.  If you forget to pass a
sync_file into one place (say you never notice KMS doesn't support
them), it will probably work anyway thanks to all the implicit sync
that's going on elsewhere.

So, clearly, we all need to go write piles of code that we can't
actually properly test until everyone else has written their piece and
then we use explicit sync if and only if all components support it.
Really?  We're going to do multiple years of development and then just
hope it works when we finally flip the switch?  That doesn't sound
like a good plan to me.


## A proposal: Implicit and explicit sync together

How to solve all these chicken-and-egg problems is something I've been
giving quite a bit of thought (and talking with many others about) in
the last couple of years.  One motivation for this is that we have to
deal with a mismatch in Vulkan.  Another motivation is that I'm
becoming increasingly unhappy with the way that synchronization,
memory residency, and command submission are inherently intertwined in
i915 and would like to break things apart.  Towards that end, I have
an actual proposal.

A couple weeks ago, I sent a series of patches to the dri-devel
mailing list which adds a pair of new ioctls to dma-buf which allow
userspace to manually import or export a sync_file from a dma-buf.
The idea is that something like a Wayland compositor can switch to
100% explicit sync internally once the ioctl is available.  If it gets
buffers in from a client that doesn't use the explicit sync extension,
it can pull a sync_file from the dma-buf and use that exactly as it
would a sync_file passed via the explicit sync extension.  When it
goes to scan out a user buffer and discovers that KMS doesn't accept
sync_files (or if it tries to use that pesky media encoder no one has
converted), it can take it's sync_file for display and stuff it into
the dma-buf before handing it to KMS.

Along with the kernel patches, I've also implemented support for this
in the Vulkan WSI code used by ANV and RADV.  With those patches, the
only requirement on the Vulkan drivers is that you be able to export
any VkSemaphore as a sync_file and temporarily import a sync_file into
any VkFence or VkSemaphore.  As long as that works, the core Vulkan
driver only ever sees explicit synchronization via sync_file.  The WSI
code uses these new ioctls to translate the implicit sync of X11 and
Wayland to the explicit sync the Vulkan driver wants.

I'm hoping (and here's where I want a sanity check) that a simple API
like this will allow us to finally start moving the Linux ecosystem
over to explicit synchronization one piece at a time in a way that's
actually correct.  (No Wayland explicit sync with compositors hoping
KMS magically works even though it doesn't have a sync_file API.)
Once some pieces in the ecosystem start moving, there will be
motivation to start moving others and maybe we can actually build the
momentum to get most everything converted.

For reference, you can find the kernel RFC patches and mesa MR here:

https://lists.freedesktop.org/archives/dri-devel/2020-March/258833.html

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037

At this point, I welcome your thoughts, comments, objections, and
maybe even help/review. :-)

--Jason Ekstrand
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
