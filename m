Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIDyNTSiqGnKwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:20:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5EB207E56
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 22:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE62510EAAD;
	Wed,  4 Mar 2026 21:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TkOPy8Qh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1329310EAAD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772659248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK2xbKjTh7YS8l8UlXiWuMxnqe1azTtxqlIRamKekdc=;
 b=TkOPy8QhRF3hTkYlY6sDj73dELeHpJCnTIqGDPLK2KlwGnEGxdEiZfbIDviWfRa8taYXyO
 ydBtD6kuA+Cwhr+Go4EYfZGQdYziB1Ig/ZZVzov7Qg7iur2IloLU7BWUKkvXzZ3mC2TBCb
 szJ18bVLoj7dO1Q7zOY7av+TjSknp+E=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-CAotq-AcMq2HhquNHC0HUw-1; Wed, 04 Mar 2026 16:20:47 -0500
X-MC-Unique: CAotq-AcMq2HhquNHC0HUw-1
X-Mimecast-MFC-AGG-ID: CAotq-AcMq2HhquNHC0HUw_1772659246
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-660ee5202a2so1289583a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772659246; x=1773264046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wK2xbKjTh7YS8l8UlXiWuMxnqe1azTtxqlIRamKekdc=;
 b=jc3mboJNmOWCUYFUTG9CKefDHKHhq1DksKKcCCNGO7mfj/Vs/eJYVH4eGg+0h3MleP
 j2CU+saGP/mAV+1pSYhdA2xiUB4JTv2lXbc7knuE8C30u/2vE5Y5FLFSGS+0fY0vf36L
 chVSC9A9eaIldTlg9KzG50uWSRB5nPvlUJvbd9D+3ybFZffYwS+ED5SnXa6nEHmQv8nC
 p9cJAKBZxQdWd6SWHfjcb2n6RxpXOJDK4fQAtaGO5dfAJ+znZsXV7qw80qaxluYg9H75
 7aWObbUYKjF+im59Ctqdyrssl2+GWuDkaD1ekaEjjhsSI6tVynAPoHmAuL9PLrrwGIzy
 QUPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKjisoCPhn9wSUbgaw1e1DjafXqI/mW8XuoAPX0m+yaBRWGgxFpQQYf7nPXzjSsC54uX+PXNP72Pw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8FH5EWK+Ir1C8etR3MQ6g4b6Jk5Qu53rTMq8dUTLqqfI3z9eV
 B4GqbPPO8+o+ZsA1WGzifSJvkkN2IOZxXNQVQXRqYa2HZVIau3GBHwfFJ4+xynGM8RQ85doCjWE
 MPfvUMBaeiVVwbvhTwTstGX3YbZsaxRYPUWxcmTPnzJNtzKTl9mWG0qnyn5mQBugqtb7WIzc0NL
 ciuYsKW8GtA3NpjxpFw69LlsN8P1BSen/ujSz24o35RBD3
X-Gm-Gg: ATEYQzzZn0J/IcEup55Msfmyu+RSLSHIdq2eMhfUKGXwfG1Zc9cQVwqgXxA21oK/XS7
 VQ8PAL1DaiejhkyjIDQ98E1N0OdizEbiCbDNgNkbwtvnAe+8Dp2S0xAkKwaffZt+3esArNFfGX+
 V+buZLCXkNFcy1UiHhTK0JrEYbjdJ2K3w3PoyVhoia0IwdnaGyJ0KEao8lUjV3rJJ62gXbWFSlI
 burl+g=
X-Received: by 2002:a05:6402:13c9:b0:65f:d060:5877 with SMTP id
 4fb4d7f45d1cf-660f00cf2a4mr1948865a12.26.1772659245755; 
 Wed, 04 Mar 2026 13:20:45 -0800 (PST)
X-Received: by 2002:a05:6402:13c9:b0:65f:d060:5877 with SMTP id
 4fb4d7f45d1cf-660f00cf2a4mr1948851a12.26.1772659245393; Wed, 04 Mar 2026
 13:20:45 -0800 (PST)
MIME-Version: 1.0
References: <25ca7b31-7fde-4259-8370-a28b4e459bad@nvidia.com>
 <CACO55tvtLOkvSx9_4NzWHs=zC2AwwVo9=fLd51TBKFDTyLExpw@mail.gmail.com>
 <82438c6d-6737-4416-96bb-6c81294371af@nvidia.com>
In-Reply-To: <82438c6d-6737-4416-96bb-6c81294371af@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Mar 2026 22:20:07 +0100
X-Gm-Features: AaiRm50dNhP9hFBHg7ivTPaWVlkm4Hz-fDx_LWi2crJrOaVAcUoFabCCmAHyYn0
Message-ID: <CACO55tuYEBtGJUvmunsY23DE527EEQX+A1Qf8Qrn3Uw_NzXzSg@mail.gmail.com>
Subject: Re: nouveau mailing list is stripping Cc headers from relayed messages
To: John Hubbard <jhubbard@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eduGLyp7I51P3ap2LqfbjyESvvOmQFAxv0qhdV_yGWk_1772659246
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 3B5EB207E56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jhubbard@nvidia.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:acourbot@nvidia.com,m:ecourtney@nvidia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,gmail.com,lists.freedesktop.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kherbst@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:email,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 10:14=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> On 3/4/26 1:10 PM, Karol Herbst wrote:
> > On Wed, Mar 4, 2026 at 7:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.co=
m> wrote:
> >>
> >> Hi,
> >>
> >> I'm worried about this because eventually Nova will have to use this
> >> mailing list, at least according to the current plan.
> >>
> >> The nouveau@lists.freedesktop.org mailing list is stripping Cc recipie=
nts
> >> from message headers when relaying posts. Recipients who are Cc'd on t=
he
> >> original message but are not subscribed to the list get silently remov=
ed
> >> from the Cc header in the copy the list delivers.
> >>
> >> This breaks "reply all" workflows: anyone whose mail client picks up t=
he
> >> Nouveau-delivered copy ends up replying without the original Cc recipi=
ents,
> >> dropping them from the thread.
> >>
> >> Here is a concrete example. This message on lore shows me (jhubbard@nv=
idia.com)
> >> in Cc:
> >>
> >>     https://lore.kernel.org/DGTNPPB7GUP0.KDZGQ9AHPOG2@nvidia.com
> >>
> >
> > uhm.. I took a second look and your email address
> > "jhubbard@nvidia.com" doesn't seem to appear there either? Do you have
> > a link where it does?
>
> Yes, in the parent message, here:
>
> https://lore.kernel.org/all/20260304-cmdq-continuation-v5-7-3f19d759ed93@=
nvidia.com/
>
>

Ah yeah, just found that. Yes, okay. That looks wrong on the nouveau
side indeed. But I couldn't really see what's different compared to
you or any other recipient there... I'm asking Freedesktop infra
admins about this, maybe they know what's going on here.

>
> thanks,
> John Hubbard
>
> >
> >> But the copy delivered through the Nouveau list has my address strippe=
d from
> >> Cc. The rust-for-linux copy of the same message (same Message-Id) pres=
erves
> >> the full Cc list correctly.
> >>
> >> Could the Mailman settings for the nouveau list be checked? The list a=
ppears
> >> to be munging or filtering Cc headers on outgoing posts. Vger-hosted l=
ists
> >> (like rust-for-linux and linux-kernel) do not do this.
> >>
> >> thanks,
> >> --
> >> John Hubbard
> >>
> >
>

