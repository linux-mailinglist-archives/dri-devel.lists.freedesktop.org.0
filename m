Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7331F3DB9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 16:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F5E6E11C;
	Tue,  9 Jun 2020 14:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1C56E11C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 14:15:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id C8E5D2A3B9C
From: Rohan Garg <rohan.garg@collabora.com>
To: Eric Anholt <eric@anholt.net>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v6] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
Date: Tue, 09 Jun 2020 16:15:35 +0200
Message-ID: <11536458.O9o76ZdvQC@solembum>
Organization: Collabora Ltd.
In-Reply-To: <CADaigPUKm-FSb8nVEPZQWn3f6_VWKN_hXqT-U7MzWLXhKJ3H+w@mail.gmail.com>
References: <20200528170604.22476-1-rohan.garg@collabora.com>
 <4235324.LvFx2qVVIh@saphira>
 <CADaigPUKm-FSb8nVEPZQWn3f6_VWKN_hXqT-U7MzWLXhKJ3H+w@mail.gmail.com>
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1951083438=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1951083438==
Content-Type: multipart/signed; boundary="nextPart5361613.DvuYhMxLoT"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5361613.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On viernes, 29 de mayo de 2020 19:10:29 (CEST) Eric Anholt wrote:
> On Fri, May 29, 2020 at 6:44 AM Rohan Garg <rohan.garg@collabora.com> wrote:
> > Hey Eric!
> > 
> > On jueves, 28 de mayo de 2020 20:45:24 (CEST) Eric Anholt wrote:
> > > On Thu, May 28, 2020 at 10:06 AM Rohan Garg <rohan.garg@collabora.com>
> > 
> > wrote:
> > > > DRM_IOCTL_HANDLE_SET_LABEL lets you label buffers associated
> > > > with a handle, making it easier to debug issues in userspace
> > > > applications.
> > > > 
> > > > DRM_IOCTL_HANDLE_GET_LABEL lets you read the label associated
> > > > with a buffer.
> > > > 
> > > > Changes in v2:
> > > >   - Hoist the IOCTL up into the drm_driver framework
> > > > 
> > > > Changes in v3:
> > > >   - Introduce a drm_gem_set_label for drivers to use internally
> > > >   
> > > >     in order to label a GEM object
> > > >   
> > > >   - Hoist string copying up into the IOCTL
> > > >   - Fix documentation
> > > >   - Move actual gem labeling into drm_gem_adopt_label
> > > > 
> > > > Changes in v4:
> > > >   - Refactor IOCTL call to only perform string duplication and move
> > > >   
> > > >     all gem lookup logic into GEM specific call
> > > > 
> > > > Changes in v5:
> > > >   - Fix issues pointed out by kbuild test robot
> > > >   - Cleanup minor issues around kfree and out/err labels
> > > >   - Fixed API documentation issues
> > > >   - Rename to DRM_IOCTL_HANDLE_SET_LABEL
> > > >   - Introduce a DRM_IOCTL_HANDLE_GET_LABEL to read labels
> > > >   - Added some documentation for consumers of this IOCTL
> > > >   - Ensure that label's cannot be longer than PAGE_SIZE
> > > >   - Set a default label value
> > > >   - Drop useless warning
> > > >   - Properly return length of label to userspace even if
> > > >   
> > > >     userspace did not allocate memory for label.
> > > > 
> > > > Changes in v6:
> > > >   - Wrap code to make better use of 80 char limit
> > > >   - Drop redundant copies of the label
> > > >   - Protect concurrent access to labels
> > > >   - Improved documentation
> > > >   - Refactor setter/getter ioctl's to be static
> > > >   - Return EINVAL when label length > PAGE_SIZE
> > > >   - Simplify code by calling the default GEM label'ing
> > > >   
> > > >     function for all drivers using GEM
> > > >   
> > > >   - Do not error out when fetching empty labels
> > > >   - Refactor flags to the u32 type and add documentation
> > > >   - Refactor ioctls to use correct DRM_IOCTL{R,W,WR} macros
> > > >   - Return length of copied label to userspace
> > > > 
> > > > Signed-off-by: Rohan Garg <rohan.garg@collabora.com>
> > > 
> > > I don't think we should land this until it actually does something
> > > with the label, that feels out of the spirit of our uapi merge rules.
> > > I would suggest looking at dma_buf_set_name(), which would produce
> > > useful output in debugfs's /dma_buf/buf_info.  But also presumably you
> > > have something in panfrost using this?
> > 
> > My current short term plan is to hook up glLabel to the labeling
> > functionality in order for userspace applications to debug exactly which
> > buffer objects could be causing faults in the kernel for speedier
> > debugging.
> 
> So, something like "when a fault happens, dump/capture names of nearby
> objects"?  That would certainly be nice to have!
> 

Pretty much, yep. This seems to be a pretty common use case at the moment.

> > The more long term plan is to label each buffer with a unique id that we
> > can correlate to the GL calls being flushed in order to be able to
> > profile (a set of)  GL calls on various platforms in order to aid driver
> > developers with performance work. This could be something that we
> > corelate on the userspace side with the help of perfetto by using this
> > [1] patch that emits ftrace events.
> 
> I'm curious how BO names are part of profiling?  Do you have the
> ability to sample instruction IP and use that to figure out where time
> is spent in shaders, or something?

The BO name itself isn't part of the profiling, but if we label our batch 
buffers, and then sample the performance counters with something like
gfx-pps [1] and co relate them then we could figure out the cost of a batch of 
GL calls that were flushed to the hardware. The plan is to use DRM scheduler 
trace markers like this one [2] to figure out when jobs get run. 

Cheers
Rohan Garg

[1] https://gitlab.freedesktop.org/Fahien/gfx-pps/
[2] https://cgit.freedesktop.org/drm/drm-misc/commit/?
id=c2c91828fbdbc5a31616f956834c85ab011392e1

--nextPart5361613.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl7fmYcACgkQpwS9TvJn
IJQMShAAk0P60wNQyMLDkWXKH+LujO9LXeTReFwzIhg3WPBFww0AQdI83Whr9smu
3kuyvj806eIGAKjMshTe7KxYMWYbjh1p7Qx2N6ELbCATN+At6q8VqAC3Rg68guqF
VUCj2jNbOftK2PmdmkS1A8A7KixovPu9mScJH4CBi7IZESWXoujQIZigKmBB28gX
gFkAc9se18189SzrP5z4DOCUHagosGPx3vK4J11ww6pSl0DTPkPG0pqNqjHO0JkD
H7+q2O348WKcMSf34nd/RZvL1pi5S75rMeK7h1LTFejH1nyZkpYpu5n46z6BRO3H
S1xhpNHnbeX8h0avcC+Myb+Byl/63r+xZ6JYTzfpudTl9Gbx3GOuDUEXQiwBwN/E
J2vdk/kqHYMB3eK1BQuB6kthp8WaO4UxQZ9G9plAionWCZOBYzgoP7JHmHAHVgyS
V7DBfhV13QWxNm1JpYCEW08ikOPm/fu9UiPjNkraSlMCzcCx/uTcySVzDjZBJxTO
P2f97tWIWuZ2AGVSkdw0bGCdLBFuFLzSCufmQPegmRIdi19+OiWX8NyS/NE01b23
fpK5vUAOeJZispybzM5ciwF6wzUS5yg0wtn/H8XmPmtILuVc1mNluKfrXwV18n7l
ynEwvcEI4bxTBcYVilDVeqm/w5RTYL/k7CtQlCGjDZCjg1Aw3L0=
=T00D
-----END PGP SIGNATURE-----

--nextPart5361613.DvuYhMxLoT--




--===============1951083438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1951083438==--



