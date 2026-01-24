Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODQ+GWcidWmYBAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:49:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D497EC3F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 20:49:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D540310E07A;
	Sat, 24 Jan 2026 19:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 105805 seconds by postgrey-1.36 at gabe;
 Sat, 24 Jan 2026 19:49:54 UTC
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com
 [198.54.127.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8A210E07A;
 Sat, 24 Jan 2026 19:49:54 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4dz5405rm3z3hhTT;
 Sat, 24 Jan 2026 14:49:52 -0500 (EST)
Received: from hal-station (unknown [204.137.14.92])
 by mta-13.privateemail.com (Postfix) with ESMTPA;
 Sat, 24 Jan 2026 14:49:19 -0500 (EST)
Date: Sat, 24 Jan 2026 14:49:15 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Message-ID: <aXUiO9EyYgy8dcW8@hal-station>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
 <2349754.vFx2qVVIhK@timur-hyperion>
 <a8b972be-7265-492f-9855-cdec94a0e0dc@amd.com>
 <aXUQKSJGkz7nzHJ4@hal-station.localdomain>
 <d327fc1a-0db4-4fcc-aed6-ded53fa28b62@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d327fc1a-0db4-4fcc-aed6-ded53fa28b62@amd.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[effective-light.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,amd.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 86D497EC3F
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:43:02PM -0600, Mario Limonciello wrote:
> 
> 
> On 1/24/2026 12:32 PM, Hamza Mahfooz wrote:
> > On Fri, Jan 23, 2026 at 04:30:12PM -0600, Mario Limonciello wrote:
> > > Hamza - since you seem to have a "workload" that can run overnight and this
> > > series recovers, can you try what Alex said and do a dc_suspend() and
> > > dc_resume() for failure?
> > > 
> > > Make sure you log a message so you can know it worked.
> > 
> > Sure, I'll try something along the lines of:
> 
> Generally speaking that looks good, but I'll leave a few comments.
> 
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > index 492457c86393..bc7abd00f5f4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> > @@ -579,11 +579,28 @@ amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
> >   }
> >   #endif
> > 
> > -static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc)
> > +static void amdgpu_dm_crtc_handle_timeout(struct drm_crtc *crtc,
> > +					  struct drm_crtc_commit *commit)
> >   {
> >   	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
> >   	struct amdgpu_reset_context reset_ctx;
> > +	struct amdgpu_ip_block *ip_block;
> > 
> > +	ip_block = amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_DCE);
> > +	if (!ip_block)
> > +		goto full_reset;
> > +
> > +	ip_block->version->funcs->suspend(ip_block);
> > +	ip_block->version->funcs->resume(ip_block);
> 
> Both of these can fail.  Especially considering the page flip timeout could
> be a DCN hang, I think you should check return code for both of them
> sequentially and jump to the full reset condition if either fails.
> 
> > +
> > +	if (drm_crtc_commit_wait(commit)) {
> > +		drm_err(crtc->dev, "suspend-resume failed!\n");
> > +		goto full_reset;
> > +	}
> > +
> 
> At least to prove "this worked" you should log a message "right here" that
> the reset occurred and you recovered.  That "might not" be in the final
> version, but I think it's worth having for now.

I have included all of the suggestions in my test run, fingers crossed
that I don't have to wait too long for a repro though.

> 
> > +	return;
> > +
> > +full_reset:
> >   	if (amdgpu_device_should_recover_gpu(adev)) {
> >   		memset(&reset_ctx, 0, sizeof(reset_ctx));
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 7175294ccb57..b38c4ee2fc95 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1961,7 +1961,7 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
> >   				crtc->base.id, crtc->name);
> > 
> >   			if (crtc->funcs->page_flip_timeout)
> > -				crtc->funcs->page_flip_timeout(crtc);
> > +				crtc->funcs->page_flip_timeout(crtc, commit);
> >   		}
> >   	}
> > 
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 45dc5a76e915..47a34a05f6de 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -616,7 +616,8 @@ struct drm_crtc_funcs {
> >   	 * and can be used by drivers to attempt to recover from a page flip
> >   	 * timeout.
> >   	 */
> > -	void (*page_flip_timeout)(struct drm_crtc *crtc);
> > +	void (*page_flip_timeout)(struct drm_crtc *crtc,
> > +				  struct drm_crtc_commit *commit);
> > 
> >   	/**
> >   	 * @set_property:
> 
