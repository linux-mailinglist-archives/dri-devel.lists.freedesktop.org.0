Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42832AB47AB
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 00:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B3910E1B0;
	Mon, 12 May 2025 22:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="lyZfm1Lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F6B10E1B0;
 Mon, 12 May 2025 22:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=yIeGfelRtQqSXOwV0zZSIgvIMRDmrzW80m/Cgd52BpA=; b=lyZfm1LfFTQwpCKF
 SOSbYzV3xlPgzEYHh4Zh2gU5G3vsUiW8W3NFNzudHX7RL2k7mP3BSdckkJJ61wYsQLFhiJuqXJ1jU
 tDd3JPkBKMR9LqNznFktcgyRYp9HV7iDS0VAL7ZB6CSoTVzvAxP4QCI1y7zk2k4f3PXz4N2VHbdcc
 RcmWUk9Cv4EawFbL2ltMhPZXqCuvsprFn5IAhtTi97446VM1FMnraPEJWWfUJr/fdspgTCavcYnHD
 tV5vURQgNThW6K69TYubbS6FbEfduv+kTjr0Ex/X14fxUamwz4cneldxAD40YG8fgc+wwDCv192gD
 Al6wpOwzE8CiZoWbqw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1uEc1r-0039Xc-0V;
 Mon, 12 May 2025 22:53:47 +0000
Date: Mon, 12 May 2025 22:53:47 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Message-ID: <aCJ7-zRkkopc8OKZ@gallifrey>
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
 <aCCQKkg6e3yPZmSU@gallifrey>
 <CADnq5_PECpX173wZOPV8VASyoQhDWkJnqvsh61zGwsiZqmNMBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PECpX173wZOPV8VASyoQhDWkJnqvsh61zGwsiZqmNMBw@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 22:53:28 up 15 days, 7:07, 1 user, load average: 0.00, 0.01, 0.00
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
> On Sun, May 11, 2025 at 8:13 AM Dr. David Alan Gilbert
> <linux@treblig.org> wrote:
> >
> > * Christophe JAILLET (christophe.jaillet@wanadoo.fr) wrote:
> > > Le 18/04/2025 à 02:21, linux@treblig.org a écrit :
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > >
> > > > radeon_doorbell_free() was added in 2013 by
> > > > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > > > allocator")
> > > > but never used.
> > >
> > > Hi,
> > >
> > > I think than instead of being removed, it should be used in the error
> > > handling path of cik_init() and in cik_fini().
> >
> > OK, here's an RFC that builds; but if I understand correctly only
> > some devices run this code, and I'm not sure mine does;
> >
> > Thoughts?
> >
> > Dave
> >
> > From 15b3830b4ee3eb819f86198dcbc596428f9ee0d0 Mon Sep 17 00:00:00 2001
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > Date: Sun, 11 May 2025 02:35:41 +0100
> > Subject: [RFC PATCH] drm/radeon/cik: Clean up doorbells
> >
> > Free doorbells in the error paths of cik_init and in cik_fini.
> >
> > Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/drm/radeon/cik.c | 38 ++++++++++++++++++++++++------------
> >  1 file changed, 26 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> > index 11a492f21157..3caa5a100f97 100644
> > --- a/drivers/gpu/drm/radeon/cik.c
> > +++ b/drivers/gpu/drm/radeon/cik.c
> > @@ -8548,7 +8548,7 @@ int cik_suspend(struct radeon_device *rdev)
> >   */
> >  int cik_init(struct radeon_device *rdev)
> >  {
> > -       struct radeon_ring *ring;
> > +       struct radeon_ring *ring, *ringCP1, *ringCP2;
> 
> I'd prefer ring_cp1 and ring_cp2 for readability.

OK.

> >         int r;
> >
> >         /* Read BIOS */
> > @@ -8623,19 +8623,22 @@ int cik_init(struct radeon_device *rdev)
> >         ring->ring_obj = NULL;
> >         r600_ring_init(rdev, ring, 1024 * 1024);
> >
> > -       ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> > -       ring->ring_obj = NULL;
> > -       r600_ring_init(rdev, ring, 1024 * 1024);
> > -       r = radeon_doorbell_get(rdev, &ring->doorbell_index);
> > +       ringCP1 = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> > +       ringCP2 = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> > +       ringCP1->ring_obj = NULL;
> > +       ringCP2->ring_obj = NULL;
> > +       ringCP1->doorbell_index = RADEON_MAX_DOORBELLS;
> > +       ringCP2->doorbell_index = RADEON_MAX_DOORBELLS;
> > +
> > +       r600_ring_init(rdev, ringCP1, 1024 * 1024);
> > +       r = radeon_doorbell_get(rdev, &ringCP1->doorbell_index);
> >         if (r)
> >                 return r;
> >
> > -       ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> > -       ring->ring_obj = NULL;
> > -       r600_ring_init(rdev, ring, 1024 * 1024);
> > -       r = radeon_doorbell_get(rdev, &ring->doorbell_index);
> > +       r600_ring_init(rdev, ringCP2, 1024 * 1024);
> > +       r = radeon_doorbell_get(rdev, &ringCP2->doorbell_index);
> >         if (r)
> > -               return r;
> > +               goto out;
> >
> >         ring = &rdev->ring[R600_RING_TYPE_DMA_INDEX];
> >         ring->ring_obj = NULL;
> > @@ -8653,7 +8656,7 @@ int cik_init(struct radeon_device *rdev)
> >
> >         r = r600_pcie_gart_init(rdev);
> >         if (r)
> > -               return r;
> > +               goto out;
> >
> >         rdev->accel_working = true;
> >         r = cik_startup(rdev);
> 
> I think you can drop the doorbells in the error case for cik_startup()
> as well since they won't be used in that case.

OK, can do that.

Thanks,

Dave

> Alex
> 
> > @@ -8678,10 +8681,16 @@ int cik_init(struct radeon_device *rdev)
> >          */
> >         if (!rdev->mc_fw && !(rdev->flags & RADEON_IS_IGP)) {
> >                 DRM_ERROR("radeon: MC ucode required for NI+.\n");
> > -               return -EINVAL;
> > +               r = -EINVAL;
> > +               goto out;
> >         }
> >
> >         return 0;
> > +
> > +out:
> > +       radeon_doorbell_free(rdev, ringCP1->doorbell_index);
> > +       radeon_doorbell_free(rdev, ringCP2->doorbell_index);
> > +       return r;
> >  }
> >
> >  /**
> > @@ -8695,6 +8704,7 @@ int cik_init(struct radeon_device *rdev)
> >   */
> >  void cik_fini(struct radeon_device *rdev)
> >  {
> > +       struct radeon_ring *ring;
> >         radeon_pm_fini(rdev);
> >         cik_cp_fini(rdev);
> >         cik_sdma_fini(rdev);
> > @@ -8708,6 +8718,10 @@ void cik_fini(struct radeon_device *rdev)
> >         radeon_ib_pool_fini(rdev);
> >         radeon_irq_kms_fini(rdev);
> >         uvd_v1_0_fini(rdev);
> > +       ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
> > +       radeon_doorbell_free(rdev, ring->doorbell_index);
> > +       ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
> > +       radeon_doorbell_free(rdev, ring->doorbell_index);
> >         radeon_uvd_fini(rdev);
> >         radeon_vce_fini(rdev);
> >         cik_pcie_gart_fini(rdev);
> > --
> > 2.49.0
> >
> >
> > --
> >  -----Open up your eyes, open up your mind, open up your code -------
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
