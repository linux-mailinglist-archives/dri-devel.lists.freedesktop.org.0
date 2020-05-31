Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE691E9A57
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 22:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1BB89F07;
	Sun, 31 May 2020 20:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8101389F07
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 20:35:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 575858050E;
 Sun, 31 May 2020 22:35:44 +0200 (CEST)
Date: Sun, 31 May 2020 22:35:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] drm/vblank: use drm_* functions for logging
Message-ID: <20200531203542.GB138722@ravnborg.org>
References: <20200523071224.1716837-1-sam@ravnborg.org>
 <20200523071224.1716837-2-sam@ravnborg.org>
 <7151c066-163d-74a5-6338-8e7e036a8fc1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7151c066-163d-74a5-6338-8e7e036a8fc1@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=PMi9V-AzGPdz1Vo4CvcA:9
 a=qQoPRW0miiOVAZ2H:21 a=bfItaBdFiP8Sa2td:21 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Y David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.
On Mon, May 25, 2020 at 01:07:29PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 23.05.20 um 09:12 schrieb Sam Ravnborg:
> > Replace all DRM_* logging functions with their drm_ counterparts.
> > checkpatch emits a few "quoted string split across lines",
> > which is left as is. The strings was already split in the original code
> > base and it would not increase readability to fix them.
> > =

> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 130 ++++++++++++++++++++---------------
> >  1 file changed, 73 insertions(+), 57 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index 8837bebc7e13..631d7d60e72f 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -311,15 +311,15 @@ static void drm_update_vblank_count(struct drm_de=
vice *dev, unsigned int pipe,
> >  		 * frame/field duration.
> >  		 */
> >  =

> > -		DRM_DEBUG_VBL("crtc %u: Calculating number of vblanks."
> > -			      " diff_ns =3D %lld, framedur_ns =3D %d)\n",
> > -			      pipe, (long long) diff_ns, framedur_ns);
> > +		drm_dbg_vbl(dev, "crtc %u: Calculating number of vblanks."
> > +			    " diff_ns =3D %lld, framedur_ns =3D %d)\n",
> > +			    pipe, (long long)diff_ns, framedur_ns);
> >  =

> >  		diff =3D DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
> >  =

> >  		if (diff =3D=3D 0 && in_vblank_irq)
> > -			DRM_DEBUG_VBL("crtc %u: Redundant vblirq ignored\n",
> > -				      pipe);
> > +			drm_dbg_vbl(dev, "crtc %u: Redundant vblirq ignored\n",
> > +				    pipe);
> >  	} else {
> >  		/* some kind of default for drivers w/o accurate vbl timestamping */
> >  		diff =3D in_vblank_irq ? 1 : 0;
> > @@ -335,15 +335,16 @@ static void drm_update_vblank_count(struct drm_de=
vice *dev, unsigned int pipe,
> >  	 * random large forward jumps of the software vblank counter.
> >  	 */
> >  	if (diff > 1 && (vblank->inmodeset & 0x2)) {
> > -		DRM_DEBUG_VBL("clamping vblank bump to 1 on crtc %u: diffr=3D%u"
> > -			      " due to pre-modeset.\n", pipe, diff);
> > +		drm_dbg_vbl(dev,
> > +			    "clamping vblank bump to 1 on crtc %u: diffr=3D%u"
> > +			    " due to pre-modeset.\n", pipe, diff);
> >  		diff =3D 1;
> >  	}
> >  =

> > -	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> > -		      " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> > -		      pipe, (unsigned long long)atomic64_read(&vblank->count),
> > -		      diff, cur_vblank, vblank->last);
> > +	drm_dbg_vbl(dev, "updating vblank count on crtc %u:"
> > +		    " current=3D%llu, diff=3D%u, hw=3D%u hw_last=3D%u\n",
> > +		    pipe, (unsigned long long)atomic64_read(&vblank->count),
> > +		    diff, cur_vblank, vblank->last);
> >  =

> >  	if (diff =3D=3D 0) {
> >  		WARN_ON_ONCE(cur_vblank !=3D vblank->last);
> > @@ -483,7 +484,7 @@ static void vblank_disable_fn(struct timer_list *t)
> >  =

> >  	spin_lock_irqsave(&dev->vbl_lock, irqflags);
> >  	if (atomic_read(&vblank->refcount) =3D=3D 0 && vblank->enabled) {
> > -		DRM_DEBUG("disabling vblank on crtc %u\n", pipe);
> > +		drm_dbg_core(dev, "disabling vblank on crtc %u\n", pipe);
> >  		drm_vblank_disable_and_save(dev, pipe);
> >  	}
> >  	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
> > @@ -628,18 +629,19 @@ void drm_calc_timestamping_constants(struct drm_c=
rtc *crtc,
> >  		if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> >  			framedur_ns /=3D 2;
> >  	} else
> =

> In cases where the if branch has braces, the else branch should have
> them too. Might be a good opportunity to fix the coding style.
Good catch. Added braces while applying.
In other words - both patches applied to drm-misc-next.

	Sam


> =

> Best regards
> Thomas
> =

> =

> > -		DRM_ERROR("crtc %u: Can't calculate constants, dotclock =3D 0!\n",
> > -			  crtc->base.id);
> > +		drm_err(dev, "crtc %u: Can't calculate constants, dotclock =3D 0!\n",
> > +			crtc->base.id);
> >  =

> >  	vblank->linedur_ns  =3D linedur_ns;
> >  	vblank->framedur_ns =3D framedur_ns;
> >  	vblank->hwmode =3D *mode;
> >  =

> > -	DRM_DEBUG("crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> > -		  crtc->base.id, mode->crtc_htotal,
> > -		  mode->crtc_vtotal, mode->crtc_vdisplay);
> > -	DRM_DEBUG("crtc %u: clock %d kHz framedur %d linedur %d\n",
> > -		  crtc->base.id, dotclock, framedur_ns, linedur_ns);
> > +	drm_dbg_core(dev,
> > +		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
> > +		     crtc->base.id, mode->crtc_htotal,
> > +		     mode->crtc_vtotal, mode->crtc_vdisplay);
> > +	drm_dbg_core(dev, "crtc %u: clock %d kHz framedur %d linedur %d\n",
> > +		     crtc->base.id, dotclock, framedur_ns, linedur_ns);
> >  }
> >  EXPORT_SYMBOL(drm_calc_timestamping_constants);
> >  =

> > @@ -692,13 +694,13 @@ drm_crtc_vblank_helper_get_vblank_timestamp_inter=
nal(
> >  	int delta_ns, duration_ns;
> >  =

> >  	if (pipe >=3D dev->num_crtcs) {
> > -		DRM_ERROR("Invalid crtc %u\n", pipe);
> > +		drm_err(dev, "Invalid crtc %u\n", pipe);
> >  		return false;
> >  	}
> >  =

> >  	/* Scanout position query not supported? Should not happen. */
> >  	if (!get_scanout_position) {
> > -		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
> > +		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
> >  		return false;
> >  	}
> >  =

> > @@ -711,7 +713,8 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
> >  	 * Happens during initial modesetting of a crtc.
> >  	 */
> >  	if (mode->crtc_clock =3D=3D 0) {
> > -		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
> > +		drm_dbg_core(dev, "crtc %u: Noop due to uninitialized mode.\n",
> > +			     pipe);
> >  		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
> >  		return false;
> >  	}
> > @@ -735,8 +738,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
> >  =

> >  		/* Return as no-op if scanout query unsupported or failed. */
> >  		if (!vbl_status) {
> > -			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
> > -				  pipe);
> > +			drm_dbg_core(dev,
> > +				     "crtc %u : scanoutpos query failed.\n",
> > +				     pipe);
> >  			return false;
> >  		}
> >  =

> > @@ -750,8 +754,9 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
> >  =

> >  	/* Noisy system timing? */
> >  	if (i =3D=3D DRM_TIMESTAMP_MAXRETRIES) {
> > -		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> > -			  pipe, duration_ns/1000, *max_error/1000, i);
> > +		drm_dbg_core(dev,
> > +			     "crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
> > +			     pipe, duration_ns / 1000, *max_error / 1000, i);
> >  	}
> >  =

> >  	/* Return upper bound of timestamp precision error. */
> > @@ -775,11 +780,12 @@ drm_crtc_vblank_helper_get_vblank_timestamp_inter=
nal(
> >  	ts_etime =3D ktime_to_timespec64(etime);
> >  	ts_vblank_time =3D ktime_to_timespec64(*vblank_time);
> >  =

> > -	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d u=
s, %d rep]\n",
> > -		      pipe, hpos, vpos,
> > -		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
> > -		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
> > -		      duration_ns / 1000, i);
> > +	drm_dbg_vbl(dev,
> > +		    "crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d us, %d rep=
]\n",
> > +		    pipe, hpos, vpos,
> > +		    (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
> > +		    (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
> > +		    duration_ns / 1000, i);
> >  =

> >  	return true;
> >  }
> > @@ -1111,7 +1117,8 @@ static int drm_vblank_enable(struct drm_device *d=
ev, unsigned int pipe)
> >  		 * prevent double-accounting of same vblank interval.
> >  		 */
> >  		ret =3D __enable_vblank(dev, pipe);
> > -		DRM_DEBUG("enabling vblank on crtc %u, ret: %d\n", pipe, ret);
> > +		drm_dbg_core(dev, "enabling vblank on crtc %u, ret: %d\n",
> > +			     pipe, ret);
> >  		if (ret) {
> >  			atomic_dec(&vblank->refcount);
> >  		} else {
> > @@ -1286,8 +1293,8 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
> >  	spin_lock_irqsave(&dev->event_lock, irqflags);
> >  =

> >  	spin_lock(&dev->vbl_lock);
> > -	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
> > -		      pipe, vblank->enabled, vblank->inmodeset);
> > +	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> > +		    pipe, vblank->enabled, vblank->inmodeset);
> >  =

> >  	/* Avoid redundant vblank disables without previous
> >  	 * drm_crtc_vblank_on(). */
> > @@ -1312,9 +1319,9 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
> >  	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
> >  		if (e->pipe !=3D pipe)
> >  			continue;
> > -		DRM_DEBUG("Sending premature vblank event on disable: "
> > -			  "wanted %llu, current %llu\n",
> > -			  e->sequence, seq);
> > +		drm_dbg_core(dev, "Sending premature vblank event on disable: "
> > +			     "wanted %llu, current %llu\n",
> > +			     e->sequence, seq);
> >  		list_del(&e->base.link);
> >  		drm_vblank_put(dev, pipe);
> >  		send_vblank_event(dev, e, seq, now);
> > @@ -1413,8 +1420,8 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
> >  		return;
> >  =

> >  	spin_lock_irqsave(&dev->vbl_lock, irqflags);
> > -	DRM_DEBUG_VBL("crtc %d, vblank enabled %d, inmodeset %d\n",
> > -		      pipe, vblank->enabled, vblank->inmodeset);
> > +	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
> > +		    pipe, vblank->enabled, vblank->inmodeset);
> >  =

> >  	/* Drop our private "prevent drm_vblank_get" refcount */
> >  	if (vblank->inmodeset) {
> > @@ -1477,8 +1484,9 @@ void drm_vblank_restore(struct drm_device *dev, u=
nsigned int pipe)
> >  		diff =3D DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
> >  =

> >  =

> > -	DRM_DEBUG_VBL("missed %d vblanks in %lld ns, frame duration=3D%d ns, =
hw_diff=3D%d\n",
> > -		      diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
> > +	drm_dbg_vbl(dev,
> > +		    "missed %d vblanks in %lld ns, frame duration=3D%d ns, hw_diff=
=3D%d\n",
> > +		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
> >  	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
> >  }
> >  EXPORT_SYMBOL(drm_vblank_restore);
> > @@ -1637,8 +1645,8 @@ static int drm_queue_vblank_event(struct drm_devi=
ce *dev, unsigned int pipe,
> >  =

> >  	seq =3D drm_vblank_count_and_time(dev, pipe, &now);
> >  =

> > -	DRM_DEBUG("event on vblank count %llu, current %llu, crtc %u\n",
> > -		  req_seq, seq, pipe);
> > +	drm_dbg_core(dev, "event on vblank count %llu, current %llu, crtc %u\=
n",
> > +		     req_seq, seq, pipe);
> >  =

> >  	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
> >  =

> > @@ -1729,10 +1737,11 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
> >  	if (vblwait->request.type &
> >  	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> >  	      _DRM_VBLANK_HIGH_CRTC_MASK)) {
> > -		DRM_DEBUG("Unsupported type value 0x%x, supported mask 0x%x\n",
> > -			  vblwait->request.type,
> > -			  (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> > -			   _DRM_VBLANK_HIGH_CRTC_MASK));
> > +		drm_dbg_core(dev,
> > +			     "Unsupported type value 0x%x, supported mask 0x%x\n",
> > +			     vblwait->request.type,
> > +			     (_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
> > +			      _DRM_VBLANK_HIGH_CRTC_MASK));
> >  		return -EINVAL;
> >  	}
> >  =

> > @@ -1775,7 +1784,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev,=
 void *data,
> >  =

> >  	ret =3D drm_vblank_get(dev, pipe);
> >  	if (ret) {
> > -		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, re=
t);
> > +		drm_dbg_core(dev,
> > +			     "crtc %d failed to acquire vblank counter, %d\n",
> > +			     pipe, ret);
> >  		return ret;
> >  	}
> >  	seq =3D drm_vblank_count(dev, pipe);
> > @@ -1811,8 +1822,8 @@ int drm_wait_vblank_ioctl(struct drm_device *dev,=
 void *data,
> >  	if (req_seq !=3D seq) {
> >  		int wait;
> >  =

> > -		DRM_DEBUG("waiting on vblank count %llu, crtc %u\n",
> > -			  req_seq, pipe);
> > +		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
> > +			     req_seq, pipe);
> >  		wait =3D wait_event_interruptible_timeout(vblank->queue,
> >  			vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
> >  				      !READ_ONCE(vblank->enabled),
> > @@ -1836,10 +1847,11 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
> >  	if (ret !=3D -EINTR) {
> >  		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
> >  =

> > -		DRM_DEBUG("crtc %d returning %u to client\n",
> > -			  pipe, vblwait->reply.sequence);
> > +		drm_dbg_core(dev, "crtc %d returning %u to client\n",
> > +			     pipe, vblwait->reply.sequence);
> >  	} else {
> > -		DRM_DEBUG("crtc %d vblank wait interrupted by signal\n", pipe);
> > +		drm_dbg_core(dev, "crtc %d vblank wait interrupted by signal\n",
> > +			     pipe);
> >  	}
> >  =

> >  done:
> > @@ -1865,8 +1877,8 @@ static void drm_handle_vblank_events(struct drm_d=
evice *dev, unsigned int pipe)
> >  		if (!vblank_passed(seq, e->sequence))
> >  			continue;
> >  =

> > -		DRM_DEBUG("vblank event on %llu, current %llu\n",
> > -			  e->sequence, seq);
> > +		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
> > +			     e->sequence, seq);
> >  =

> >  		list_del(&e->base.link);
> >  		drm_vblank_put(dev, pipe);
> > @@ -2005,7 +2017,9 @@ int drm_crtc_get_sequence_ioctl(struct drm_device=
 *dev, void *data,
> >  	if (!vblank_enabled) {
> >  		ret =3D drm_crtc_vblank_get(crtc);
> >  		if (ret) {
> > -			DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, r=
et);
> > +			drm_dbg_core(dev,
> > +				     "crtc %d failed to acquire vblank counter, %d\n",
> > +				     pipe, ret);
> >  			return ret;
> >  		}
> >  	}
> > @@ -2071,7 +2085,9 @@ int drm_crtc_queue_sequence_ioctl(struct drm_devi=
ce *dev, void *data,
> >  =

> >  	ret =3D drm_crtc_vblank_get(crtc);
> >  	if (ret) {
> > -		DRM_DEBUG("crtc %d failed to acquire vblank counter, %d\n", pipe, re=
t);
> > +		drm_dbg_core(dev,
> > +			     "crtc %d failed to acquire vblank counter, %d\n",
> > +			     pipe, ret);
> >  		goto err_free;
> >  	}
> >  =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
