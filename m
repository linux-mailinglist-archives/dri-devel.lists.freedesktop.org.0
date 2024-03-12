Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DB878BFE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 01:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA84D112D1B;
	Tue, 12 Mar 2024 00:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2NF+4Lt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7334112D1B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710204427;
 bh=4Rt4qb4goFm58llMXuHJYSc3IyM3rmcW/4Zju/zlUHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2NF+4Lt8o9JVGYmR3VO0k9trrXpm8PDhiLIm0jdvD6pllfw/EjmqjE+N5l+bq6+p+
 /rSwA8ZucC1Vnibg27lrEk0cUXZhJtCc8uWGwuomiIfJKQCA0PjCrRTBCDcjf/Sljg
 6FOY5PzVbmETcmwOnosYVIYBkR9g5MpqIef7mzegAU0R5rEUENvTSXL8G5mOpT4Z6d
 z8sx6HkD4/qKlWSJiF9vpe/SEnBdycaqSMZsLzG9dCKIYuM+s7gfreihC5dxq6fJAJ
 1AYpkhPldwioGErWrgfBvw0Vq/x6/MBcQqQ89pWiBrGz8eXMkCq2VwMYKKchN4i5K2
 w5PsixKDO9KuA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B4E837809D1;
 Tue, 12 Mar 2024 00:47:07 +0000 (UTC)
Date: Tue, 12 Mar 2024 00:47:06 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, robh@kernel.org, 
 steven.price@arm.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/1] drm/panfrost: Replace fdinfo's profiling debugfs
 knob with sysfs
Message-ID: <njeeciw7qetcgyc7mpqxyqjwx2rs2wvhfo2mails6apxv6b4wu@g7dux7u55frj>
References: <20240306015819.822128-1-adrian.larumbe@collabora.com>
 <20240306015819.822128-2-adrian.larumbe@collabora.com>
 <0db9babe-da95-48e2-b577-3e92a81f8303@ursulin.net>
 <20240311110238.1082a1f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240311110238.1082a1f6@collabora.com>
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

On 11.03.2024 11:02, Boris Brezillon wrote:
> On Wed, 6 Mar 2024 08:33:47 +0000
> Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> 
> > On 06/03/2024 01:56, Adrián Larumbe wrote:
> > > Debugfs isn't always available in production builds that try to squeeze
> > > every single byte out of the kernel image, but we still need a way to
> > > toggle the timestamp and cycle counter registers so that jobs can be
> > > profiled for fdinfo's drm engine and cycle calculations.
> > > 
> > > Drop the debugfs knob and replace it with a sysfs file that accomplishes
> > > the same functionality, and document its ABI in a separate file.
> > > 
> > > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >   .../testing/sysfs-driver-panfrost-profiling   | 10 +++++
> > >   Documentation/gpu/panfrost.rst                |  9 ++++
> > >   drivers/gpu/drm/panfrost/Makefile             |  2 -
> > >   drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ----------
> > >   drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 -------
> > >   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
> > >   drivers/gpu/drm/panfrost/panfrost_drv.c       | 41 ++++++++++++++++---
> > >   drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
> > >   8 files changed, 57 insertions(+), 44 deletions(-)
> > >   create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> > >   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
> > >   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> > > new file mode 100644
> > > index 000000000000..1d8bb0978920
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
> > > @@ -0,0 +1,10 @@
> > > +What:		/sys/bus/platform/drivers/panfrost/.../profiling
> > > +Date:		February 2024
> > > +KernelVersion:	6.8.0
> > > +Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
> > > +Description:
> > > +		Get/set drm fdinfo's engine and cycles profiling status.
> > > +		Valid values are:
> > > +		0: Don't enable fdinfo job profiling sources.
> > > +		1: Enable fdinfo job profiling sources, this enables both the GPU's
> > > +		   timestamp and cycle counter registers.
> > > \ No newline at end of file
> > > diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
> > > index b80e41f4b2c5..51ba375fd80d 100644
> > > --- a/Documentation/gpu/panfrost.rst
> > > +++ b/Documentation/gpu/panfrost.rst
> > > @@ -38,3 +38,12 @@ the currently possible format options:
> > >   
> > >   Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
> > >   `drm-curfreq-` values convey the current operating frequency for that engine.
> > > +
> > > +Users must bear in mind that engine and cycle sampling are disabled by default,
> > > +because of power saving concerns. `fdinfo` users and benchmark applications which
> > > +query the fdinfo file must make sure to toggle the job profiling status of the
> > > +driver by writing into the appropriate sysfs node::
> > > +
> > > +    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/profiling  
> > 
> > A late thought - how it would work to not output the inactive fdinfo 
> > keys when this knob is not enabled?
> > 
> > Generic userspace like gputop already handles that and wouldn't show the 
> > stat. Which may be more user friendly than showing stats permanently at 
> > zero. It may be moot once you add the auto-toggle to gputop (or so) but 
> > perhaps worth considering.
> 
> I agree with Tvrtko, if the line being printed in fdinfo relies on some
> sysfs knob to be valid, we'd rather not print the information in that
> case, instead of printing zero.

Me too. I'll go first change both gputop and nvtop to make sure they use the new
sysfs knob for Panfrost, and then submit a new patch that handles printing of
the drm-cycles-* and drm-engine-* stats depending on the profiling knob state.
