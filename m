Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD7qLMr9eWm71QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:15:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A8A10CC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF0810E6A6;
	Wed, 28 Jan 2026 12:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GiK4idKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F6F10E6A6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:15:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso519483f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 04:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769602500; x=1770207300; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EG38pFgYHFmse9QO3EO0YAuSiyVhbofejs4VZvyDsQs=;
 b=GiK4idKkNHf1Jl4FLQGp9OWUs4m9YFg0gZ+oYjrXRR79EFy1DQUS3FuoGODG7jnCLn
 u8JQPirqHpr0rSIq8iy1qsoYVTvI0pHn/WMmeoVS6XesaEV+cXd6sqc2JfI+E8L4ZlKT
 9yE1JHKGTTbIEVTNR222+lVmSzLn9sMkvyBKyxRs0ht8st1hul40O4TTztT/OcnA7BHz
 gne/c7lRTXmY6FI9L9h6l+xc3AI1JfEJG3/pBbnj2FE3MHe7hgucfajNW+INjmEjGS/s
 8AjjyGM1UWsebrOxzcPVBnsFnxLdxZq949ksudPWU59a6RSYsrMNJbkyHI59/+3u0UI9
 +mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769602500; x=1770207300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EG38pFgYHFmse9QO3EO0YAuSiyVhbofejs4VZvyDsQs=;
 b=MSdt+l485juGxIG8bTYgBN6xmyr45x6yk4/QIv9Zr8Lsvj7G3b77LrmiE9NrSbufZi
 A41uxND12PvtOt49lWm6Xyk6gMt6nTao3EdOfptkeJ2+6RaxVJvVxxaMYA5nQOoS2BZl
 PqhE3IOw0PSRU1kNKvuhGJjLVYOUrYqKciwfpnpoNF70ct+pdsa45xbECNEQztpZzMtB
 U+Q4dK45akvnb6iF3qY9JRjwCSbh1ilejE7tHVTXDKADhoYAMFWe6geFkT1nUmBkjATg
 hmm5hSZDO5+XmXvo3+GULrpTFNTk/HbWxcOSk7PebDjD0O1ygHof8q+0b5KvwS858ry1
 7AHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULGgEq+e+KVpK/CWHfuI8UceDc8MXZW1X4e3yzAp4Aq+E5aYOeR6iDTOyUHIW7ynomHOu3s63wgPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7upp+7IuC/3IqePrJz09Ya9ClOm6ftULpbfFvFBvtixFjsHpT
 KEBfQsT90/f2coX+/1bSC1+ZNO6rMwxOvSRro5ESGoRdEfkGp24RIPQF
X-Gm-Gg: AZuq6aKWi4G36PWUxSDKCobgkrS4oPbuTArQpWwC4Uhnz/NddgS6uZgmppwnSY/JjhW
 eWequyB9cJnRVlu+IP+a7Y5fmlyAZGrta/uGeKgD9AprVe6MNu3RAC8RPHIHplRrj8cDSup/sSB
 KaeFXnK6YpcM688UQQnAvKvid7Sv2sb/jxbLryAEhCV1RUdOJ3D1NZLCNmlzaNHGPPfrUwS7TWs
 mFfd7ppG6uKRnurYPVFt9/ZisVKICR25Ltv1EF3PlbiXu38Qqy4827ki8d1n6/HUEG3Vx730MmU
 Q5kgPvelYWKm2emvWlbEBeOUKC0y0af65E2Q3hMP0u6ySgHzF0CqH3ST2sXUS9BXvjwre7zZ5X/
 hVp+Tc6wH/MmwUFIwgnPaT/XXlSEZax7xQBjjzK+RcC6K18O5D3I4/uHVPfi7My/5wZq6RHxZm8
 i1f5TLzc2Hx2ViRJbi6t3Biyj//d5ncNHW990WziV5NSw8qKSNyymrlM+MKJY=
X-Received: by 2002:a05:6000:2689:b0:431:8bf:f08c with SMTP id
 ffacd0b85a97d-435dd211888mr8047625f8f.21.1769602500162; 
 Wed, 28 Jan 2026 04:15:00 -0800 (PST)
Received: from timur-hyperion.localnet (5401DF8B.dsl.pool.telekom.hu.
 [84.1.223.139]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf16sm6937398f8f.22.2026.01.28.04.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 04:14:59 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
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
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Date: Wed, 28 Jan 2026 13:14:58 +0100
Message-ID: <2203806.9o76ZdvQCi@timur-hyperion>
In-Reply-To: <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
 <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexdeucher@gmail.com,m:someguy@effective-light.com,m:michel.daenzer@mailbox.org,m:mario.limonciello@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,effective-light.com,mailbox.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,effective-light.com:email]
X-Rspamd-Queue-Id: 132A8A10CC
X-Rspamd-Action: no action

On Wednesday, January 28, 2026 12:26:20=E2=80=AFPM Central European Standar=
d Time=20
Michel D=C3=A4nzer wrote:
> On 1/28/26 11:39, Christian K=C3=B6nig wrote:
> > On 1/27/26 23:57, Alex Deucher wrote:
> >> On Tue, Jan 27, 2026 at 5:53=E2=80=AFPM Hamza Mahfooz
> >>=20
> >> <someguy@effective-light.com> wrote:
> >>> On Mon, Jan 26, 2026 at 09:20:55AM -0500, Alex Deucher wrote:
> >>>> I suspect just calling drm_crtc_send_vblank_event() here on the
> >>>> relevant crtcs would be enough.
> >>>=20
> >>> Seems like an interesting idea, though I would imagine we would still
> >>> want to attempt a reset (of some kind) assuming that the subsequent p=
age
> >>> flip also experiences a timeout.
> >>=20
> >> Is it actually a timeout or just missed interrupts?  I'm wondering if
> >> some power feature races with the modeset and causes the interrupt to
> >> get missed from time to time.
> >=20
> > That is my strong suspicion as well.
> >=20
> > Even if we missed a vblank interrupt that thing is reoccurring, so the
> > worst thing that can happen is that we delayed reporting back success by
> > one frame.
> >=20
> > So something must have turned the CRTC fully off.
>=20
> Not sure that's a generally valid conclusion (do the gitlab issues talk
> about the display going black, or about it staying on but freezing?).

In all the bug reports I've seen about page flip timeouts, and in all the=20
timeouts I've seen on my machine, the screen remains on, but frozen.
It doesn't go black and doesn't turn off.

Christian, why would the CRTC be turned off?

> AFAIR
> at least in some cases amdgpu uses a dedicated "page flip" interrupt
> instead of the vblank interrupt,

That matches what I saw when I was digging in the code.

> in which case missing a single interrupt
> could cause a timeout.
>=20
>=20
> P.S. Completing the atomic commit and sending the completion event must w=
ork
> even if user space turns off any CRTCs as part of the commit[0]. So your
> hypothesis would be a kernel bug, accidentally turning off the CRTC and/or
> not handling a CRTC getting turned off correctly.
>=20
> [0] If any CRTC for which the commit has state is off both before and aft=
er
> the commit though, the commit fails with an error before it could result =
in
> a timeout.




