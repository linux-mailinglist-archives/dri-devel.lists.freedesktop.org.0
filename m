Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A246092CD4B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED28410E6B3;
	Wed, 10 Jul 2024 08:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="R5wY7s/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC3510E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:43:44 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52a559e4429so889794e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720601022; x=1721205822; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yhUibTlqabbjxA3p6g3/z47vHiVZll4AJPBzwT49V8A=;
 b=R5wY7s/1VH7HAWnmu2l/MwQBNZYmZPl04921SakjGZQ5MmsTFH99PMmxv6kn8suGG1
 hJgID2jb99H/9LrMH/R1QP4Vv18ZnV4jPrYlMnCjrme6+1PWPHA5SsIb5R0t2LmrBNl6
 P+eM/TpWFBP72rJsTQw0c/J6YOPe5K2Vt19s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720601022; x=1721205822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhUibTlqabbjxA3p6g3/z47vHiVZll4AJPBzwT49V8A=;
 b=B5b6c2h0PzN41rTgJzIFYh859W/GDnBrNYOrhpj/+lGG7BoVzOM2TUtlGZ1oq8BvKc
 fYfJNlnwXqB4J+sn4bkb8qOFPDFQ+A0Cn8MHPECnOjaKybC3FyOyBAbsunATdyzLCGCx
 cFfh6gkFHzRTx7y6TY8IKUAyYtNiuCrMsmCTlPMYm17I9dUQLuEEyS3pcx6q3NmlaoCs
 owRqjaZWQBT1HQxtttZTGT+QpuC4lZ9cOfOD3iEKG2FW9vwa9OGN4AS6epFhyMgO0or/
 0tooGZALS/4CfhHOO6q6lSl0eyDgSpWRJwW9+Tq9JqLaJFghXgRvAifh9iD3Dimwf/Hk
 w43g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfTjY28vGXrIFfuqKRlu3YucRWgvEzBUPyTp8NiqtwlI22Cje/0keJQS+/H4xrgvxmlW/Sgp1NJHDudL+1WQuRyR7/QMfuhNQ18YwW0jfp
X-Gm-Message-State: AOJu0Yz0bgA+UnjdVZpjCTSIAGMx3LmiJmDIs+AlL7DfLAKUXXByuGCF
 Xv3Xb+emJoRqj87I/brTg6N42XI+JR0WPRAl9EA/bVnok+dEfhjjPDtQz7gwIFk=
X-Google-Smtp-Source: AGHT+IGjNh/LmrRrjy0KMamgYOUkHQ+0kRaZJ7wdPUO+yrnWCEpLIRA8jdgUrbiAZPHXRA4u2N5lUQ==
X-Received: by 2002:a05:6512:10d2:b0:52e:9b18:9a7f with SMTP id
 2adb3069b0e04-52eb9993c36mr3153639e87.2.1720601022089; 
 Wed, 10 Jul 2024 01:43:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5f51sm74850235e9.25.2024.07.10.01.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 01:43:41 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:43:39 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
Message-ID: <Zo5Ju2bWFUVBHeKX@phenom.ffwll.local>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
 <20240708202907.383917-2-hamza.mahfooz@amd.com>
 <Zo0Dm_XeF3dMqK1C@phenom.ffwll.local>
 <Zo0MSB7eSp1H0iPI@phenom.ffwll.local>
 <3214e5a3-a616-4bcd-8f1d-238e1bf346fe@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3214e5a3-a616-4bcd-8f1d-238e1bf346fe@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 09, 2024 at 10:02:08AM -0400, Hamza Mahfooz wrote:
> On 7/9/24 06:09, Daniel Vetter wrote:
> > On Tue, Jul 09, 2024 at 11:32:11AM +0200, Daniel Vetter wrote:
> > > On Mon, Jul 08, 2024 at 04:29:07PM -0400, Hamza Mahfooz wrote:
> > > > Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
> > > > enable PSR more quickly for displays that support it.
> > > > 
> > > > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> > > > ---
> > > >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
> > > >   1 file changed, 22 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > index fdbc9b57a23d..ee6c31e9d3c4 100644
> > > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > > @@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
> > > >   static void manage_dm_interrupts(struct amdgpu_device *adev,
> > > >   				 struct amdgpu_crtc *acrtc,
> > > > -				 bool enable)
> > > > +				 struct dm_crtc_state *acrtc_state)
> > > >   {
> > > >   	/*
> > > >   	 * We have no guarantee that the frontend index maps to the same
> > > > @@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
> > > >   	 *
> > > >   	 * TODO: Use a different interrupt or check DC itself for the mapping.
> > > >   	 */
> > > > -	int irq_type =
> > > > -		amdgpu_display_crtc_idx_to_irq_type(
> > > > -			adev,
> > > > -			acrtc->crtc_id);
> > > > +	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
> > > > +							   acrtc->crtc_id);
> > > > +	struct dc_crtc_timing *timing;
> > > > +	int offdelay;
> > > > +
> > > > +	if (acrtc_state) {
> > > > +		timing = &acrtc_state->stream->timing;
> > > > +
> > > > +		/* at least 2 frames */
> > > > +		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
> > > > +						       (uint64_t)100),
> > > > +						      timing->v_total),
> > > > +					    timing->h_total) + 1;
> > > 
> > > Yeah, _especially_ when you have a this short timeout your really have to
> > > instead fix the vblank driver code properly so you can enable
> > > vblank_disable_immediate. This is just cheating :-)
> > 
> > Michel mentioned on irc that DC had immediate vblank disabling, but this
> > was reverted with f64e6e0b6afe ("Revert "drm/amdgpu/display: set
> > vblank_disable_immediate for DC"").
> > 
> > I haven't looked at the details of the bug report, but stuttering is
> > exactly what happens when the driver's vblank code has these races. Going
> > for a very low timeout instead of zero just means it's a bit harder to hit
> > the issue, and much, much harder to debug properly.
> > 
> > So yeah even more reasons to look at the underlying root-cause here I
> > think.
> > -Sima
> 
> The issue is that DMUB (display firmware) isn't able to keep up with all of
> the requests that the driver is making. The issue is fairly difficult to
> reproduce (I've only seen it once after letting the system run with a
> program that would engage PSR every so often, after several hours).
> It is also worth noting that we have the same 2 idle frame wait on the
> windows
> driver, for the same reasons. So, in all likelihood if it is your opinion
> that
> the series should be NAKed, we will probably have to move the wait into the
> driver as a workaround.

Well that's an entirely different reason, and needs to be recorded in the
commit log that disabling/enabling vblank is too expensive and why. Also
would be good to record that windows does the same.

I'm also not entirely sure this is a good interface, so some
thoughts/question:

- is the issue only with psr, meaning that if we switch the panel to a
  different crtc, do we need to update the off delay.

- there's still the question of why vblank_immediate_disable resulted in
  stuttering, is that the same bug? I think for consistency it'd be best
  if we enable immediate vblank disabling everywhere (for maximum
  testing), and then apply the 2 frame delay workaround only where needed
  explicitly. Otherwise if there's other issues than DMUB being slow, they
  might be mostly hidden and become really hard to track down when they
  show up.

- I think an interface to set the right values in lockstep with the vblank
  on/off state would be best, so maybe a special drm_crtc_vblank_on_config
  that takes additional parameters?

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
