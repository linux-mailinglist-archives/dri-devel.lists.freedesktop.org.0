Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EFRLTjteWkF1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:04:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC29FE6A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64C410E654;
	Wed, 28 Jan 2026 11:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dan18Pzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD3F10E654
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:04:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-432d2670932so6067005f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769598259; x=1770203059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqxiDDJL8+kOG7viwOsgkBd749Kmuo+B5Ya1pZqhFsU=;
 b=dan18PzkUHIHSfoEv8fNjPIeIgkL776CFwDQfclf9cCN4DSDMP3eQW0MTiAdAaP59e
 Ws2PGUgtii5AL4kPdj71g24kvVaIbYbe9tBSvyLNp53OKq79Mok/mwXrLARMkIetyTLl
 j1NbePNGu1pxOn0EfvvNpQubKjDppb88NlqFT2hFcce4iWmbSAvRrAJU38nAVIQM43KB
 CN2qmveuFBkXDZB/WIU/TqmPwxNJfRIkG+VlxkEu9cMNi+9vQ0LrEqLitPWtazaTuT2T
 bAqEbQ6aBRxKPqjuMsZRqlPSnaghhnxyOoA8emcs/mi79b3DmS2do56s3FMxb6XfUcFN
 lUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769598259; x=1770203059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EqxiDDJL8+kOG7viwOsgkBd749Kmuo+B5Ya1pZqhFsU=;
 b=ZjSvZExLXI5XnkTSB8ybR+G6K7kkJ+1Mwc02f+53kduSgrprrkfJKaEKhU45+UJPOE
 VYrMe685pRUp0JDp9ONw1oxEgVvejVgNRDjYzkAe8umbURDP/kWEulVz582oHaYdCign
 sIvF7IMNaMXwksFuU2QSeUuREsnXAzgGm+hzItWIgdAQ7QEHfmYwXOTg1VIndmR3i95e
 6MulHBEF+21TcVa/y93lv1XK8imSSzm9RWwK1JepsesMNinD5/m73C3rs1D1XGtRDtaN
 73XrYCdoZxuCQaTcZeQlTurfosyrx9EFWH9vK8BxPXySdKB71M++tgavWpQpS8M/2Lam
 2lWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9vfKA1SucGCkbH4kCjvgEkqpRXgZX3TXzEb5js44C5GzWBgfaPM07yHS+YDIO65zMVHR61EjeZSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcQfWb8ztVnhyfCOcO9J2g5DjZgbDQmZmn/xSmpJ1OXMvk9LTi
 tJuK6QzHRxWCq3BpjB7Q88D0KUaT8EeoRRKuY7JpDgyLIFrh7fL5yB1ig3GkHw==
X-Gm-Gg: AZuq6aIPpDhbSQD/Rq4UOeXHWz3WQnvQ7i24h1i3GBpHGKPZCwMPIUgC3q2ZbjIwkVw
 eoYn8x0AIkZ+TSAor0xoEZtd6jKNv+b6LxwRxb4dZYKpN/eG5diddtoyXYwetSoWx7LjosVbht8
 JtZuAwUewA2olcRhbPsYNmvaMEudT+TJurTGngJzmDYJIv34eQuFYIwN6/sqIq4EZzn+Q2wwDT6
 YElA+g3CiNGSEHmtlx89qmOfVMpFGFF8bz0szkPuC2WUfeXr/Oai0gfUPvcTc9GWjC4RV15B++6
 GVVnV0OCx7xrOxChaWrYgZO83k9uo1PusJ3//WJB2M3+RFnHoxQczk4i7sWN685pdKqVAEUO88r
 ow+4uWC1LTzuFYlMpJBCx+u0jIsLr7Gt8v7h443785x9bnar3ybsZhN/V9SryuGQ5eK3MbTPqYE
 EweRN+FTbMZkb5JTWxNQVFXFW7DH99QDhuXrzOSHCufxTiX8FHV4nexI/nzPasFnKr2wNc+1nyu
 f0zsvWsUfNnVbFgzg==
X-Received: by 2002:a05:6000:26ce:b0:430:b100:f591 with SMTP id
 ffacd0b85a97d-435dd0649c9mr6800554f8f.28.1769591974093; 
 Wed, 28 Jan 2026 01:19:34 -0800 (PST)
Received: from timur-max.localnet
 (20014C4E24CAAB0049977272BDA969E7.dsl.pool.telekom.hu.
 [2001:4c4e:24ca:ab00:4997:7272:bda9:69e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e490esm5431242f8f.9.2026.01.28.01.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 01:19:33 -0800 (PST)
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
Date: Wed, 28 Jan 2026 10:19:32 +0100
Message-ID: <5173841.OV4Wx5bFTl@timur-max>
In-Reply-To: <601b38b5-1890-48f9-adf9-54fb85650852@amd.com>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <79ed136a-cedd-4e97-adb8-bc3f4f2b8bb4@mailbox.org>
 <601b38b5-1890-48f9-adf9-54fb85650852@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:someguy@effective-light.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:sunil.khatri@amd.com,m:cesun102@amd.com,m:lijo.lazar@amd.com,m:kenneth.feng@amd.com,m:ivan.lipski@amd.com,m:alex.hung@amd.com,m:chiahsuan.chung@amd.com,m:mwen@igalia.com,m:mdaenzer@redhat.com,m:Jerry.Zuo@amd.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,indico.freedesktop.org:url]
X-Rspamd-Queue-Id: E4FC29FE6A
X-Rspamd-Action: no action

On 2026. janu=C3=A1r 26., h=C3=A9tf=C5=91 14:00:59 k=C3=B6z=C3=A9p-eur=C3=
=B3pai t=C3=A9li id=C5=91 Christian K=C3=B6nig=20
wrote:
> On 1/26/26 11:27, Michel D=C3=A4nzer wrote:
> > On 1/26/26 11:14, Christian K=C3=B6nig wrote:
> >> On 1/23/26 15:44, Timur Krist=C3=B3f wrote:
> >>> On Friday, January 23, 2026 2:52:44=E2=80=AFPM Central European Stand=
ard Time
> >>>=20
> >>> Christian K=C3=B6nig wrote:
> >>>> So as far as I can see the whole approach doesn't make any sense at
> >>>> all.
> >>>=20
> >>> Actually this approach was proposed as a solution at XDC 2025 in Harr=
y's
> >>> presentation, "DRM calls driver callback to attempt recovery", see pa=
ge
> >>> 9 in this slide deck:
> >>>=20
> >>> https://indico.freedesktop.org/event/10/contributions/431/attachments/
> >>> 267/355/2025%20XDC%20Hackfest%20Update%20v1.2.pdf
> >>>=20
> >>> If you disagree with Harry, please make a counter-proposal.
> >>=20
> >> Well I must have missed that detail otherwise I would have objected.
> >>=20
> >> But looking at the slide Harry actually pointed out what immediately c=
ame
> >> to my mind as well, e.g. that the Compositor needs to issue a full
> >> modeset to re-program the CRTC.>=20
> > In principle, the kernel driver has all the information it needs to
> > reprogram the HW by itself. Not sure why the compositor would need to be
> > actively involved.
> Well first of all I'm not sure if we can reprogram the HW even if all
> information are available.
>=20
> Please keep in mind that we are in a dma_fence timeout handler here with =
the
> usual rat tail of consequences. So no allocation of memory or taking locks
> under which memory is allocated or are part of preparing the page flip
> etc... I'm not so deep in the atomic code, so Alex, Sima and probably you
> as well can answer that much better than I do, but of hand it sounds
> questionable.
>=20
> On the other hand we could of course postpone reprogramming the CRTC into=
 an
> async work item, but that might created more problems then it solves.
>=20
> Then second even if the kernel can do it I'm not sure if it should do it.
>=20
> I mean userspace asked for a quick page flip and not some expensive CRTC/=
PLL
> reprogramming. Stuff like that usually takes some time and by then the
> frame which should be displayed by the page flip might already be stale a=
nd
> it would be better to tell userspace that we couldn't display it on time
> and wait for a new frame to be generated.

I agree with Michel here. It's a kernel bug, it should be solved by the=20
kernel. I don't like the tendency of pushing userspace to handle kernel bug=
s,=20
especially if this is just needed for one vendor's buggy driver. (No offenc=
e.)

>=20
> And third, there must be a root cause of the page flip not completing.
>=20
> My educated guess is that we have some atomic property change or even
> turning the CRTC off in parallel with the page flip. I mean HW rarely tur=
ns
> off its reoccurring vblank interrupt on its own.

I think a page flip timeout can many root causes, so it's unlikely that a=20
single solution would solve all of it.

See:
https://gitlab.freedesktop.org/drm/amd/-/issues?
label_name[]=3Dpage%20flip%20timeout

Best regards,
Timur



