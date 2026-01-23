Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP1eFvqfc2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:21:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B717F78668
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78AD10E1B4;
	Fri, 23 Jan 2026 16:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZV1LgC1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB7A10E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:21:09 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so2115990f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 08:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769185268; x=1769790068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rb7u39V+EWrAiLj+yjS6kM65VvsRc96IK2z8zgH3Va8=;
 b=ZV1LgC1bymJ/YrmtrfB8jkHCvhTJ0LqBDaz8ZmUE1V+5qQMWYMRfFsXe3JeR6teT3k
 1u3Qy9Ga8fL2OI2oFzzD9juwikdVWZ+AjBm/yn6HfDGQ+c01mkTpK5trSA2YV3zleYIy
 aSdIvJk4GjxADXAtfDC08+OhGYCPsA7/38Aux3AGklv+QRRpsvZUh9Xw1BZHrkQbivdZ
 2P8JCZff9PdMLiQ1Tat+0oooWGsl+8qUxlFPAqcNxtJ074xX26ye0al9NOyDd0ikcKjh
 t2vnkiuFB9DosL4L0sfOudl+2NNYrNPt5uIhkbXCkXp1x65UGntp+pvcuCWW0ZehNZ/p
 XPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769185268; x=1769790068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rb7u39V+EWrAiLj+yjS6kM65VvsRc96IK2z8zgH3Va8=;
 b=tbiJq/5UjWqZZqnSeC2AdNC6XOt+OhlWgA3s1Ls3XMhRorG1TJU7OYhjYF8yrwgkA+
 +Yt+tCq1Otjnj3w34r7njXZwtkZzbEhwR51N43PNsPGC/XihTfGSYErWFX6ajRU5mQ/Q
 r2hX1bEFFIjGxCLz8CVGQnN6F2H71IuGf54LW9mbKKgqwgVnfavD06AMqXrmCQaVpw26
 SXGHb5cuQ/lThqP+Ox/NGHLvI/pDeFBlHEpyusXYdCNrJWlhsMj3tyDj3nusrsB9VUfN
 rWC4KGhW50gYCvEywftG/IEd6EtRUx2ye6WdAF2xxfSYgI4KBBW9K5RK0sd3DlvPseQn
 nG9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/YRs6N4DrmiJiIUCi1tsyA9u1vDfOWLno04hHUdOdxbzNW6lXFXdtgKkCBGptf2u3zaOqX/SZxGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8sazhDG6GCBX03v15kcGz11GWdbHDpHy7D1LBX8diUZcY4nyZ
 v7s4D1GSUwjOBjJD89Efd7k78froZtnWbNpoguOQDzgYYDIU1akmcJF2
X-Gm-Gg: AZuq6aKTOlVwJVQc6d9p/X5f4aPPgRQkV1ueLNSFKt0tcgSU6Zer4JQohqwTXEY+NDZ
 DJmqZzkI3+ACmbMmrtrj/mq2AFv+s5/qx6yE2oPABYjTNiMK3uf07zw1l0K3ZoHZIhhfZ4X3QZG
 LDx5b+j5CB0WCuFz8Aak5z99cAM/dmnPYFNWw5NTbBxUeTOU36XjgxycGoPWcdVp14nNjOegh5z
 VjKfJJqWIAIjG5Au3owJl87ica946ARTtTA9qe9YocKw3/m4xfdrrgc4Ea9WB4GmijoExm61ZnI
 RxI+H68kVgmw9BnzWAGMGwBKxlklpEW6DloTscIZgmfbaL0ckfdxoC8RmO9w7CCpGWks5CFYP0U
 xqVJBXl09+l8Xhha8IUTbUca8LJ8Kog2e3QefN6SMMwTxMnAd4MwUY1miXJu7rDxcmvIj8v01Z6
 3Lw5Bx3PSFLxlCFecNRx82qdYTkZHFaZGQg+NgcdECQJmTfDruUgIrJm/gHL3CVFsGNGw8
X-Received: by 2002:a05:600c:1c1f:b0:47e:e5c5:f3a3 with SMTP id
 5b1f17b1804b1-4804c9b24e5mr58013925e9.24.1769179492597; 
 Fri, 23 Jan 2026 06:44:52 -0800 (PST)
Received: from timur-hyperion.localnet (54001FF2.dsl.pool.telekom.hu.
 [84.0.31.242]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804dbb6939sm23700435e9.5.2026.01.23.06.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 06:44:52 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Hamza Mahfooz <someguy@effective-light.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Date: Fri, 23 Jan 2026 15:44:50 +0100
Message-ID: <2349754.vFx2qVVIhK@timur-hyperion>
In-Reply-To: <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2de6d428-b997-4ba8-8766-a211e5612e72@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:someguy@effective-light.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.920];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:email]
X-Rspamd-Queue-Id: B717F78668
X-Rspamd-Action: no action

On Friday, January 23, 2026 2:52:44=E2=80=AFPM Central European Standard Ti=
me=20
Christian K=C3=B6nig wrote:
> On 1/23/26 01:05, Hamza Mahfooz wrote:
> > There should be a mechanism for drivers to respond to flip_done
> > time outs.
>=20

I am adding Harry and Mario to this email as they are more familiar with th=
is.

> I can only see two reasons why you could run into a timeout:
>=20
> 1. A dma_fence never signals.
> 	How that should be handled is already well documented and doesn't=20
require
> any of this.

Page flip timeouts have nothing to do with fence timeouts.
A page flip timeout can occur even when all fences of all job submissions=20
complete correctly and on time.

>=20
> 2. A coding error in the vblank or page flip handler leading to waiting
> forever. In that case calling back into the driver doesn't help either.

At the moment, a page flip timeout will leave the whole system in a hung st=
ate=20
and the driver does not even attempt to recover it in any way, it just stop=
s=20
doing anything, which is unacceptable and I'm pretty surprised that it was=
=20
left like that for so long.

Note that we have approximately a hundred bug reports open on the drm/amd b=
ug=20
tracker about "random" page flip timeouts. It affects a lot of users.

>=20
> So as far as I can see the whole approach doesn't make any sense at all.

Actually this approach was proposed as a solution at XDC 2025 in Harry's=20
presentation, "DRM calls driver callback to attempt recovery", see page 9 i=
n=20
this slide deck:

https://indico.freedesktop.org/event/10/contributions/431/attachments/
267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf

If you disagree with Harry, please make a counter-proposal.

Thanks,
Timur



>=20
> > Since, as it stands it is possible for the display
> > to stall indefinitely, necessitating a hard reset. So, introduce
> > a new crtc callback that is called by
> > drm_atomic_helper_wait_for_flip_done() to give drivers a shot
> > at recovering from page flip timeouts.
> >=20
> > Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> > ---
> >=20
> >  drivers/gpu/drm/drm_atomic_helper.c | 6 +++++-
> >  include/drm/drm_crtc.h              | 9 +++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> > b/drivers/gpu/drm/drm_atomic_helper.c index 5840e9cc6f66..3a144c324b19
> > 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1881,9 +1881,13 @@ void drm_atomic_helper_wait_for_flip_done(struct
> > drm_device *dev,>=20
> >  			continue;
> >  	=09
> >  		ret =3D wait_for_completion_timeout(&commit->flip_done, 10=20
* HZ);
> >=20
> > -		if (ret =3D=3D 0)
> > +		if (!ret) {
> >=20
> >  			drm_err(dev, "[CRTC:%d:%s] flip_done timed=20
out\n",
> >  		=09
> >  				crtc->base.id, crtc->name);
> >=20
> > +
> > +			if (crtc->funcs->page_flip_timeout)
> > +				crtc->funcs-
>page_flip_timeout(crtc);
> > +		}
> >=20
> >  	}
> >  =09
> >  	if (state->fake_commit)
> >=20
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 66278ffeebd6..45dc5a76e915 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -609,6 +609,15 @@ struct drm_crtc_funcs {
> >=20
> >  				uint32_t flags, uint32_t target,
> >  				struct drm_modeset_acquire_ctx=20
*ctx);
> >=20
> > +	/**
> > +	 * @page_flip_timeout:
> > +	 *
> > +	 * This optional hook is called if &drm_crtc_commit.flip_done times=20
out,
> > +	 * and can be used by drivers to attempt to recover from a page=20
flip
> > +	 * timeout.
> > +	 */
> > +	void (*page_flip_timeout)(struct drm_crtc *crtc);
> > +
> >=20
> >  	/**
> >  =09
> >  	 * @set_property:
> >  	 *




