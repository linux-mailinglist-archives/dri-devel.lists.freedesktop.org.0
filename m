Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AYNHT4XemlS2QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:03:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C31A2716
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD55C10E2C0;
	Wed, 28 Jan 2026 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CrSZoCeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957EF10E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:03:36 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64b791b5584so10217189a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 06:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769609015; x=1770213815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuRBJsDCSrwFtqMVKXPOBvEwtKqngmn1pY31nw2tKng=;
 b=CrSZoCeCe4DU+5fIVIYX34iaiRCiY4zLgaEVK9oWtuk+dgXW11OJE/VeYX1QZM4kum
 wx94rKqVO+31Mx8ONQV5HgpvpvsZzCWRt4SnG6pCP3egqd/WyD6ptEiXzA85KOSt+pnE
 l8MDSbKi2zzaA9EVb3BVqf7FSWQgME1AanKbNRUq2EvE6sJp0gXXR99tcwYljhT3XVes
 mpXwzFPELiAdvSU/JzrytA6AvL3Irlm3ANxDZipxHL48YGcmnPYtAhgydFL6E1oqV8Z7
 d5vK/yYGMrYOqHOzrjnfxIj805KczuUOOQPoJiWgkK9All2HGkNgPMMF6HW66tBX+qsx
 Rj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769609015; x=1770213815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QuRBJsDCSrwFtqMVKXPOBvEwtKqngmn1pY31nw2tKng=;
 b=UYSBTE38cHst44+lo/ixvz+tuh7+NHpIq14OE/L8DB7o5JlXmc2HyRGgYzHwj3R2p7
 1CH+GB+5tTebUGIcyDhoQ9kqEG70bYMeg+1IWxLs9RllpBnyp9RKG5lsFvG7FO3e5BNs
 4lIOEAp5Gloumq1UFhpd+wcLACcXiB7J+voXfQmcRInf2uyopNYMWtqjmaXxkWh3+SDc
 F+dx7pbdnhKPrWqY9HSyXMqWNii2fOHM4fzAf5NO+y8xXj1FQn12Eq1Bw447hJJ+NyLd
 gtiwrx5DeUc0CFH9kiclqXNWsXgNEVTP4euw6UhjqViIaKLsLvQ6yO52rJRgBED7afsl
 pEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuxjHePq8bzpJ3pjgcSf4PML9Ew7YwThtzgz6tPfeOnVjgLD6ZIVvNvNWqeLGHOuKjJWMb5Jy/jpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysomljNla5jOuwweBYjVIklS42t1rDNAvKBSID2uPYKdlSTJAC
 2sIkSRAisc9cLTXiWuGqkz149o8Lv4yr9IlwD0Xl86p7PG+2SfbXiR48WJ4ksw==
X-Gm-Gg: AZuq6aLy75kxIHMsDfymgnYg6g6C+Ajf90zPWlJvB5x4lb7zPCXre4LAiz6XX1+hx8E
 ez0/ygUtqCrcjZlSPQK3hB1saaUMSZuUOEfowXkxgQGBQrslEfNl5s/JCiF8EvdYhU1zR2gWQp6
 0NtAAkK7jrlwoPAWqgYZ++tY65SjbTC9vEu/ealvXE63QeuX4t9kg4XoG7c9RPa134VN+o6jG1b
 IMJjWtNRBqpnLsDgJac7opyn6dCVH/LkBkgz2SHF7lr7b4D4JYC7WaL8cg3QWdKW5XzYgEGEaq9
 xOtZ9VBrPjqx+b68cNZz5vAqLPwXH5dt1ZbbVfcGxkr4uQwGCsl8LBKYconUj84hVMxS+FETgn2
 AcJUqydhRUeMBL5sZSbOo2y10JJUeEyqIkPvsuTVVYuOTYADhxnlSUD23oVfWjVLAp8eN+P1n1m
 HMYSaQkFoe8JAZZxAPZqTR4gkzjsQ+XubN86iVHkK8mtn0awH8LTop9ZkuMyg=
X-Received: by 2002:a05:600c:1994:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-48069c788c5mr66971155e9.21.1769602974756; 
 Wed, 28 Jan 2026 04:22:54 -0800 (PST)
Received: from timur-hyperion.localnet (5401DF8B.dsl.pool.telekom.hu.
 [84.1.223.139]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bfb59asm119139985e9.7.2026.01.28.04.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 04:22:54 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Hamza Mahfooz <someguy@effective-light.com>, dri-devel@lists.freedesktop.org, 
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
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
Date: Wed, 28 Jan 2026 13:22:53 +0100
Message-ID: <2770547.lGaqSPkdTl@timur-hyperion>
In-Reply-To: <a2fe8187-9271-4cbf-8b7e-37ffda0799de@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <5173841.OV4Wx5bFTl@timur-max> <a2fe8187-9271-4cbf-8b7e-37ffda0799de@amd.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:someguy@effective-light.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[indico.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 32C31A2716
X-Rspamd-Action: no action

On Wednesday, January 28, 2026 12:25:31=E2=80=AFPM Central European Standar=
d Time=20
Christian K=C3=B6nig wrote:
> On 1/28/26 10:19, Timur Krist=C3=B3f wrote:
> > On 2026. janu=C3=A1r 26., h=C3=A9tf=C5=91 14:00:59 k=C3=B6z=C3=A9p-eur=
=C3=B3pai t=C3=A9li id=C5=91 Christian K=C3=B6nig
> >=20
> > wrote:
> >> On 1/26/26 11:27, Michel D=C3=A4nzer wrote:
> >>> On 1/26/26 11:14, Christian K=C3=B6nig wrote:
> >>>> On 1/23/26 15:44, Timur Krist=C3=B3f wrote:
> >>>>> On Friday, January 23, 2026 2:52:44=E2=80=AFPM Central European Sta=
ndard Time
> >>>>>=20
> >>>>> Christian K=C3=B6nig wrote:
> >>>>>> So as far as I can see the whole approach doesn't make any sense at
> >>>>>> all.
> >>>>>=20
> >>>>> Actually this approach was proposed as a solution at XDC 2025 in
> >>>>> Harry's
> >>>>> presentation, "DRM calls driver callback to attempt recovery", see
> >>>>> page
> >>>>> 9 in this slide deck:
> >>>>>=20
> >>>>> https://indico.freedesktop.org/event/10/contributions/431/attachmen=
ts/
> >>>>> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
> >>>>>=20
> >>>>> If you disagree with Harry, please make a counter-proposal.
> >>>>=20
> >>>> Well I must have missed that detail otherwise I would have objected.
> >>>>=20
> >>>> But looking at the slide Harry actually pointed out what immediately
> >>>> came
> >>>> to my mind as well, e.g. that the Compositor needs to issue a full
> >>>> modeset to re-program the CRTC.>
> >>>=20
> >>> In principle, the kernel driver has all the information it needs to
> >>> reprogram the HW by itself. Not sure why the compositor would need to=
 be
> >>> actively involved.
> >>=20
> >> Well first of all I'm not sure if we can reprogram the HW even if all
> >> information are available.
> >>=20
> >> Please keep in mind that we are in a dma_fence timeout handler here wi=
th
> >> the usual rat tail of consequences. So no allocation of memory or taki=
ng
> >> locks under which memory is allocated or are part of preparing the page
> >> flip etc... I'm not so deep in the atomic code, so Alex, Sima and
> >> probably you as well can answer that much better than I do, but of hand
> >> it sounds questionable.
> >>=20
> >> On the other hand we could of course postpone reprogramming the CRTC i=
nto
> >> an async work item, but that might created more problems then it solve=
s.
> >>=20
> >> Then second even if the kernel can do it I'm not sure if it should do =
it.
> >>=20
> >> I mean userspace asked for a quick page flip and not some expensive
> >> CRTC/PLL reprogramming. Stuff like that usually takes some time and by
> >> then the frame which should be displayed by the page flip might already
> >> be stale and it would be better to tell userspace that we couldn't
> >> display it on time and wait for a new frame to be generated.
> >=20
> > I agree with Michel here. It's a kernel bug, it should be solved by the
> > kernel. I don't like the tendency of pushing userspace to handle kernel
> > bugs, especially if this is just needed for one vendor's buggy driver.
> > (No offence.)
> Well I strongly disagree. The kernel is not here to serve userspace, but =
to
> give userspace access to the HW in a generalized manner.

Isn't this why kernel mode setting was invented in favour of the mess that =
we=20
used to have in the DDX drivers?

> If this is caused by a HW failure then reporting back to userspace is the
> most reasonable thing to do.

Nothing wrong with reporting the problem back to userspace. But it isn't wo=
rth=20
much, because userspace is extremely unlikely to be able to fix it. How wou=
ld=20
userspace fix a missed or broken interrupt, a firmware hang, or buggy=20
programming of display engine registers?

Also, even if it were possible, expecting userspace to fix it would just pl=
ace=20
extra burden on compositor maintainers, which in turn would put us in a=20
similar situation where were with GPU recovery before queue reset was=20
implemented. Only a small handful of compositors can handle it (only one of=
=20
the major players and maybe a few smaller ones). That gives all other users=
 a=20
bad experience by default.




