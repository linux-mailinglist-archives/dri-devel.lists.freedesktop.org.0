Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB60EA7E677
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117D310E510;
	Mon,  7 Apr 2025 16:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y3wgLohg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D3A10E50E;
 Mon,  7 Apr 2025 16:29:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0193A6115E;
 Mon,  7 Apr 2025 16:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C86C4CEDD;
 Mon,  7 Apr 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744043385;
 bh=yXMQBu0GyLTPoE3gkFmC2nns5przlZL4HLcX1yZT9K8=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Y3wgLohgM6p0/u1FBKyY9LdGDuYN7o1z8zqPiEkjSgLE99KhL9PIqpau83C0DpkM8
 jpscPof6Lsskj18VSPotDeh349sBQKzsns2ItNlumNcqQzR4MUXEoh/WigKWzVScLy
 iOVuj55ZjVytajnAzA0MU53rvuWJ6eiE+uFF7rWTTgQMYv3mQ0Cj3DpzC9PhDmZPyS
 OpG9bZWSV22orn98bUFmRt1N+hVfTiAuCyUOcHUYMiuI7UBS0AF/bhBZc+V+sgIDng
 8WETA3tjW6rXJ78YldVvLUAuM1kysmp6m2v7eDcXupuQJgYEt4mq0e7yeQQGizcm+Y
 jGGYiRpphGs2g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id BF5DBCE089F; Mon,  7 Apr 2025 09:29:44 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:29:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-team@meta.com" <kernel-team@meta.com>,
 kernel test robot <lkp@intel.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of
 ratelimit_state structure's internals
Message-ID: <bcf4ab09-5b87-404c-9231-567a10fd9764@paulmck-laptop>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <20250403211514.985900-4-paulmck@kernel.org>
 <BL1PR12MB5144A3990501E76BB96F9557F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5144A3990501E76BB96F9557F7AA2@BL1PR12MB5144.namprd12.prod.outlook.com>
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 07, 2025 at 02:35:59PM +0000, Deucher, Alexander wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Paul E. McKenney <paulmck@kernel.org>
> > Sent: Thursday, April 3, 2025 5:15 PM
> > To: linux-kernel@vger.kernel.org
> > Cc: kernel-team@meta.com; Paul E. McKenney <paulmck@kernel.org>; kernel
> > test robot <lkp@intel.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Deucher,
> > Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Xinhui Pan <Xinhui.Pan@amd.com>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Subject: [PATCH RFC 4/9] drm/amd/pm: Avoid open-coded use of ratelimit_state
> > structure's internals
> >
> > The amdgpu_set_thermal_throttling_logging() function directly accesses the
> > ratelimit_state structure's ->missed field, which work, but which also makes it more
> > difficult to change this field.  Therefore, make use of the ratelimit_state_reset_miss()
> > function instead of directly accessing the ->missed field.
> >
> > Nevertheless, open-coded use of ->burst and ->interval is still permitted, for
> > example, for runtime sysfs adjustment of these fields.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202503180826.EiekA1MB-
> > lkp@intel.com/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> 
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Feel free to take this via whatever tree makes sense for the larger series.  Otherwise, let me know, and I will pick it up.

Thank you, and yes, this does depend on a patch that is earlier in
this series, so I will be happy to carry it.

							Thanx, Paul

> Alex
> 
> 
> > Cc: Kenneth Feng <kenneth.feng@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: <amd-gfx@lists.freedesktop.org>
> > Cc: <dri-devel@lists.freedesktop.org>
> > ---
> >  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > index e8ae7681bf0a3..6adf4e8822108 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > @@ -1663,7 +1663,6 @@ static ssize_t
> > amdgpu_set_thermal_throttling_logging(struct device *dev,
> >       struct drm_device *ddev = dev_get_drvdata(dev);
> >       struct amdgpu_device *adev = drm_to_adev(ddev);
> >       long throttling_logging_interval;
> > -     unsigned long flags;
> >       int ret = 0;
> >
> >       ret = kstrtol(buf, 0, &throttling_logging_interval); @@ -1674,18 +1673,12
> > @@ static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
> >               return -EINVAL;
> >
> >       if (throttling_logging_interval > 0) {
> > -             raw_spin_lock_irqsave(&adev->throttling_logging_rs.lock, flags);
> >               /*
> >                * Reset the ratelimit timer internals.
> >                * This can effectively restart the timer.
> >                */
> > -             adev->throttling_logging_rs.interval =
> > -                     (throttling_logging_interval - 1) * HZ;
> > -             adev->throttling_logging_rs.begin = 0;
> > -             adev->throttling_logging_rs.printed = 0;
> > -             adev->throttling_logging_rs.missed = 0;
> > -             raw_spin_unlock_irqrestore(&adev->throttling_logging_rs.lock,
> > flags);
> > -
> > +             ratelimit_state_reset_interval(&adev->throttling_logging_rs,
> > +                                            (throttling_logging_interval - 1) * HZ);
> >               atomic_set(&adev->throttling_logging_enabled, 1);
> >       } else {
> >               atomic_set(&adev->throttling_logging_enabled, 0);
> > --
> > 2.40.1
> 
