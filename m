Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31591487C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 13:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B1110E068;
	Mon, 24 Jun 2024 11:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="os61YfZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F6710E068
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719228197;
 bh=/5Al0b5HHG2oYdcS/3NQg/K9CZPaF3+bWyB10z8Iwek=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=os61YfZpYh9c1mgFqF2MLD+ZDCVjNKayjI9gQ4ggwJzA8PQbrYJoxUQcDO+EznovB
 8elF8DxlmFqZjX68vANJ+8nty9ZGLWI3sROJmpjQmR+GOPUBbH8n/+4UMWSH3xxloC
 nmtTLX1x/9ho06OnKoXPsyDCEOH8PrwyA7QddYcDUzw9uxek0qRZHHXpEUiNdIZsQW
 hd5dQbDkPSjDrtRVLkjiyjFF3/AnvZ7c7YU8TlHR6p68/LRdff6MHcPI4no46ObTRP
 yPkpv3P2Tfu8CCIwSDGTE7b3iCw/vRQj/AKcb13Z9TGOwW6M8+wTsqxql5MrbeBwCk
 VWSssakTM/vOg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2275E37804C6;
 Mon, 24 Jun 2024 11:23:17 +0000 (UTC)
Date: Mon, 24 Jun 2024 12:23:16 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Support fdinfo runtime and memory stats on Panthor
Message-ID: <uzsqh2b3j7hp6z3zcjcsxxudt2sucgutzwof5bhsvjjaeusigy@wvfhibqtyz4y>
References: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
 <ae1ec268-fd76-48b5-94f9-761565153e12@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae1ec268-fd76-48b5-94f9-761565153e12@arm.com>
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

Hi Steven,

On 13.06.2024 16:28, Steven Price wrote:
> On 06/06/2024 01:49, Adrián Larumbe wrote:
> > This patch series enables userspace utilities like gputop and nvtop to
> > query a render context's fdinfo file and figure out rates of engine
> > and memory utilisation.
> > 
> > Previous discussion can be found at
> > https://lore.kernel.org/dri-devel/20240423213240.91412-1-adrian.larumbe@collabora.com/
> > 
> > Changelog:
> > v3:
> >  - Fixed some nits and removed useless bounds check in panthor_sched.c
> >  - Added support for sysfs profiling knob and optional job accounting
> >  - Added new patches for calculating size of internal BO's
> > v2:
> >  - Split original first patch in two, one for FW CS cycle and timestamp
> >  calculations and job accounting memory management, and a second one
> >  that enables fdinfo.
> >  - Moved NUM_INSTRS_PER_SLOT to the file prelude
> >  - Removed nelem variable from the group's struct definition.
> >  - Precompute size of group's syncobj BO to avoid code duplication.
> >  - Some minor nits.
> > 
> > 
> > Adrián Larumbe (7):
> >   drm/panthor: introduce job cycle and timestamp accounting
> >   drm/panthor: add DRM fdinfo support
> >   drm/panthor: enable fdinfo for memory stats
> >   drm/panthor: add sysfs knob for enabling job profiling
> >   drm/panthor: support job accounting
> >   drm/drm_file: add display of driver's internal memory size
> >   drm/panthor: register size of internal objects through fdinfo
> 
> The general shape of what you end up with looks correct, but these
> patches are now in a bit of a mess. It's confusing to review when the
> accounting is added unconditionally and then a sysfs knob is added which
> changes it all to be conditional. Equally that last patch (register size
> of internal objects through fdinfo) includes a massive amount of churn
> moving everything into an 'fdinfo' struct which really should be in a
> separate patch.

I do agree with you in that perhaps too many things change across successive
patches in the series. I think I can explain this because of the way the series
has evolved thorugh successive revisions.

In the last one of them, only the first three patches were present, and both
Liviu and Boris seemed happy with the shape they had taken, but then Boris
suggested adding the sysfs knob and optional profiling support rather than
submitting them as part of a different series like I had done in Panfrost. In
that spirit, I decided to keep the first three patches intact.

The last two patches are a bit more of an afterthought, and because they touch
on the drm fdinfo core, I understood they were more likely to be rejected for
now, at least until consensus with Tvrtko and other people involved in the
development of fdinfo had agreed on a way to report internal bo sizes.  However,
being also part of fdinfo, I thought this series was a good place to spark a
debate about them, even if they don't seem as seamlessly linked with the rest
of the work.

> Ideally this needs to be reworked into a logical series of patches with
> knowledge of what's coming next. E.g. the first patch could introduce
> the code for cycle/timestamp accounting but leave it disabled to be then
> enabled by the sysfs knob patch.
> 
> One thing I did notice though is that I wasn't seeing the GPU frequency
> change, looking more closely at this it seems like there's something
> dodgy going on with the devfreq code. From what I can make out I often
> end up in a situation where all contexts are idle every time tick_work()
> is called - I think this is simply because tick_work() is scheduled with
> a delay and by the time the delay has hit the work is complete. Nothing
> to do with this series, but something that needs looking into. I'm on
> holiday for a week but I'll try to look at this when I'm back.

Would you mind sharing what you do in UM to trigger this behaviour and also
maybe the debug traces you've written into the driver to confirm this?

> Steve
> 
> >  Documentation/gpu/drm-usage-stats.rst     |   4 +
> >  drivers/gpu/drm/drm_file.c                |   9 +-
> >  drivers/gpu/drm/msm/msm_drv.c             |   2 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c   |   2 +-
> >  drivers/gpu/drm/panthor/panthor_devfreq.c |  10 +
> >  drivers/gpu/drm/panthor/panthor_device.c  |   2 +
> >  drivers/gpu/drm/panthor/panthor_device.h  |  21 ++
> >  drivers/gpu/drm/panthor/panthor_drv.c     |  83 +++++-
> >  drivers/gpu/drm/panthor/panthor_fw.c      |  16 +-
> >  drivers/gpu/drm/panthor/panthor_fw.h      |   5 +-
> >  drivers/gpu/drm/panthor/panthor_gem.c     |  67 ++++-
> >  drivers/gpu/drm/panthor/panthor_gem.h     |  16 +-
> >  drivers/gpu/drm/panthor/panthor_heap.c    |  23 +-
> >  drivers/gpu/drm/panthor/panthor_heap.h    |   6 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c     |   8 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.h     |   3 +-
> >  drivers/gpu/drm/panthor/panthor_sched.c   | 304 +++++++++++++++++++---
> >  include/drm/drm_file.h                    |   7 +-
> >  18 files changed, 522 insertions(+), 66 deletions(-)
> > 
> > 
> > base-commit: 310ec03841a36e3f45fb528f0dfdfe5b9e84b037

Adrian Larumbe
