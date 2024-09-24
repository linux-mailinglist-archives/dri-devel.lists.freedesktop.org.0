Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C8984ACD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 20:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B89710E03F;
	Tue, 24 Sep 2024 18:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ZytR1qLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2568 seconds by postgrey-1.36 at gabe;
 Tue, 24 Sep 2024 18:21:37 UTC
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B267C10E03F;
 Tue, 24 Sep 2024 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=M9TUQDMRJDjlgh3owcxaD9H83PPUtYCIzP7lrrP0PJc=; b=ZytR1qLvSJw4TPdG
 3MEIVJSG6JNhRevjCYJ13W9cTHmyMiyixa3mti3+ChAs3IGIiyWFINWxzmre9X7zVvnyYg34COgiF
 +bgQdYRLQV8H88GSh4IPkkydT/pK9gbQaCrlx3tbOwuYwwQ6+zt5X9NFHjUDi7/a/FCn0iH5Fg0wZ
 9jS9TPrffU18vdu5mggSEeMZxFeargFNx1xBYS7fV6GHMYV82xm2Ey3dVGvodSvl4vXcPAgjYEYX+
 dqT0N3+GzREJUhtr3eg0NH67Bu14bnBcIOQgexeSc9uhOu6K+u5v0xrFqoXLp02F5bEGeA8nIIOYZ
 Qq7+loQzyQgRZPw0EA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1st9Ur-0072Lb-2d;
 Tue, 24 Sep 2024 17:38:45 +0000
Date: Tue, 24 Sep 2024 17:38:45 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] AMDGPU deadcode
Message-ID: <ZvL5Jbw9RNCqjBS4@gallifrey>
References: <20240923012446.4965-1-linux@treblig.org>
 <CADnq5_PxBfpG6C80Wcm50wLzz=4eEKsscuZXiQ=ZsG8=gULhRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PxBfpG6C80Wcm50wLzz=4eEKsscuZXiQ=ZsG8=gULhRA@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:35:20 up 139 days,  4:49,  1 user,  load average: 0.01, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Alex Deucher (alexdeucher@gmail.com) wrote:
> On Sun, Sep 22, 2024 at 9:43 PM <linux@treblig.org> wrote:
> >
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > Hi,
> >   This is a bunch of deadcode removal in amdgpu;
> > some of the functions are ones which were previously
> > used but haven't been for a while, others are functions
> > that were added a few years ago and haven't ever been used.
> >
> >   There are some others that I've not removed, which have
> > been added in the last few years but not been used,
> > I was worried maybe there are patches in someones tree
> > about to use them (e.g. amdgpu_lsdma_copy_mem, amdgpu_mes_reg_wait,
> > amdgpu_ras_unbind_aca, amdgpu_seq64_alloc, and
> > amdgpu_xcp_prepare_resume) - I'd be happy to take those as
> > well.

Hi Alex,
  Thanks for taking the series, and the reply.

> There are patches in flight that make use of at least some of these.
> For example, the seq64 functions are used by the user queues patches
> which are being reviewed now.  Feel free to send out patches though if
> you are inclined.  If someone has plans to use something, they can
> bring that up in the patch review.

OK, I've made myself a note and will swing back at some point.

> >   One other thing I wasn't sure of; I removed
> > amdgpu_device_ip_is_idle
> > which has been unused since about 2016, but does that make
> > the 'is_idle' methods unused or is there something else that calls
> > them?
> 
> They've been used on and off in proposed patches over the years.  Some
> of the IP specific code may call the IP specific is idle functions
> directly rather than using the callbacks.

Do you think the 'is_idle' member itself should go?

Dave

> Alex
> 
> >
> > (Sent from this kernel booted on my RX550 GPU)
> >
> > Dave
> >
> > Dr. David Alan Gilbert (5):
> >   drm/amdgpu: Remove unused amdgpu_device_ip_is_idle
> >   drm/amdgpu: Remove unused amdgpu_atpx functions
> >   drm/amdgpu: Remove unused amdgpu_gmc_vram_cpu_pa
> >   drm/amdgpu: Remove unused amdgpu_gfx_bit_to_me_queue
> >   drm/amdgpu: Remove unused amdgpu_i2c functions
> >
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 10 --------
> >  .../gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c  | 12 ---------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 24 ------------------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       | 10 --------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |  2 --
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       | 12 ---------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h       |  1 -
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       | 25 -------------------
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h       |  4 ---
> >  9 files changed, 100 deletions(-)
> >
> > --
> > 2.46.1
> >
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
