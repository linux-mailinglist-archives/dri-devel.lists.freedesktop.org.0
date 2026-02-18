Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FvOBad+lWl8RwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:56:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7208A1545D9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1DE10E002;
	Wed, 18 Feb 2026 08:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eHqXEQZD";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IKAP71EC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6483210E002
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771404961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
 b=eHqXEQZDZ52O1vvy4DVzuRDATt+OyJ2cw4G6YuSQEjUb34APk6mTUggs6xEqG3MIZSXhix
 A2YvexCnrLz5j0FOXIKNa0VfomXkz9/LQGO7qQNw7xHZZXkXYseodUQzsTwOY4RSCUzl+0
 L0fi6NsjXAr2fRnBZTXeIYDAYD1b7Rk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-vfVRMrR3PPK33t6uKfWszQ-1; Wed, 18 Feb 2026 03:55:57 -0500
X-MC-Unique: vfVRMrR3PPK33t6uKfWszQ-1
X-Mimecast-MFC-AGG-ID: vfVRMrR3PPK33t6uKfWszQ_1771404956
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-435aadfaf4eso3251374f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 00:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771404956; x=1772009756; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
 b=IKAP71ECmvaevH2JdBZ71jAXxFqdbCiAhPmmwbFYWfM5gDjBvoju3wraq98GkSbese
 9WDlCedWrsHO7hkS4kuVTdNew5BNPzs3lT1p6wirntxZCYblN7iV46O/OccA2OWVP5wH
 Wu2F04BcFdw/wIIAZxcAwSU+IrGdfnx8IRtZSESonWwT4SJ64/EKcBLxw5xeqHAv+HuR
 dQSfcaK4FL58g336xBTVRtCzXB+ReBCxomd1XATBVnpRbnVneRt7Gqf7CiUn/VIg9dAN
 jhMfstYi/wkgt/EhmjOHKa7J6W/d0VKK+PJ6+K2NyuEaa6AkqJPFIs74dcD7aGd6AWmg
 ak8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771404956; x=1772009756;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9otZd25ocNn9HUDGmNAX0+CEXD0GlGASUVcWCKDTQI=;
 b=RBWQ8uaypxoN+ib/ZBC3bh6V6Itee9CxvkoOBMQnuolIDsCG/M5mltjZYCAAqZNyEY
 v96ojMjYaFuhy8xDqyJMMKrMxKjbkJB64N6Y/XuzL5jYajlH0RSJ6zDsJkidRkY4QAXL
 zgJhkEv2Xu5uq46AP96+ioLV+oF2FQCjWAyXFVJku1SsFCeaQUyB1rpftJo4MleWGkBE
 up0vX0GZxfJuBGdNqmBq8B50AdJpwCJnCvYNnSuLwSYElNRM9h8gWvCuNxUBVw3Rktnt
 Pv28MYvKcApfjcWV3+8/X/mCN0PY5LEKtfZPTUGh+sU+EEnHMS3zsp5iZN4cKvgKPjbR
 Ai1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyhDxgFxAfNcfefRi+MhZYcHCY6CO1jgSKpCQje7iFst/MSARdhgv5OFdmu3YVHajgo6Ev4rKc3Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAEt9zNLTXNLaQpy15wj/2MQy/4kGxuM+gTnwyyDYSxGTRN5EG
 wDKg9z2oKCTPCU+sR+dYDyNcMCYf54ZzxWcC8AEMpc6XLUXGQMYEUPYI2u3EQBamV9rfl3qhw/c
 /2qcFGhZbxRltOcO0YEJSJ1Y/vDxLIuldhnzOnsvRrZS/zGRTty3dQe+tvbMUbFtxh8Ym7g==
X-Gm-Gg: AZuq6aKUN901kVNrUmuKmT7V3SPm7w/smrgzU63DT6wL2QKqXvxUNa7iZojfZtZj0IT
 uV8omKgk5xMDsb5PjndZvqDQbNdSPYycwKDmVijQK6JLoZ5Ix0HfUydhDn3l86OkSf1634FV9I6
 Q1+EnHuP2bnENCot7dH59iIh5sqcXh0dR19AgYiRkwl0h0SuMhw3CcuL9KnGSMJcwFZe9ESboZA
 6I/0e/3euqGYZa0Kw5v9z3PsAkT0nVRYlwcJPx3bMK7DMZkRsupIO8jZUNeO9ryBzceooPMfUy5
 cph0fhGnwlOo1Azc4oEvESIavrhxt6IzCQomD362rgH9W9LumX/NEZ0khz9mkC8OzLJlSNQSnQ=
 =
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id
 ffacd0b85a97d-43958e4c9a0mr1686384f8f.40.1771404955710; 
 Wed, 18 Feb 2026 00:55:55 -0800 (PST)
X-Received: by 2002:a05:6000:26cf:b0:435:95dc:b8ca with SMTP id
 ffacd0b85a97d-43958e4c9a0mr1686327f8f.40.1771404955056; 
 Wed, 18 Feb 2026 00:55:55 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm41853724f8f.30.2026.02.18.00.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 00:55:54 -0800 (PST)
Date: Wed, 18 Feb 2026 09:55:53 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <20260218-lean-faithful-beaver-2efd77@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-5-thierry.reding@kernel.org>
 <20260123-active-witty-rabbit-0fc5b9@houat>
 <aY3j57xvdOY09EwQ@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sfzhuutowl7gwtka"
Content-Disposition: inline
In-Reply-To: <aY3j57xvdOY09EwQ@orome>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7208A1545D9
X-Rspamd-Action: no action


--sfzhuutowl7gwtka
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:44:11PM +0100, Thierry Reding wrote:
> On Fri, Jan 23, 2026 at 02:25:16PM +0100, Maxime Ripard wrote:
> > On Thu, Jan 22, 2026 at 05:10:03PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > There is no technical reason why there should be a limited number of =
CMA
> > > regions, so extract some code into helpers and use them to create ext=
ra
> > > functions (cma_create() and cma_free()) that allow creating and freei=
ng,
> > > respectively, CMA regions dynamically at runtime.
> > >=20
> > > The static array of CMA areas cannot be replaced by dynamically creat=
ed
> > > areas because for many of them, allocation must not fail and some cas=
es
> > > may need to initialize them before the slab allocator is even availab=
le.
> > > To account for this, keep these "early" areas in a separate list and
> > > track the dynamic areas in a separate list.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > AFAIU, this won't create a new cma heap when registering. This goes
> > against the recent work we did to create one for every cma region.
> >=20
> > I guess, since you have a driver that would explicitly handle that
> > region, we should create some kind of opt-out mechanism, but by default,
> > we should still create such a heap.
>=20
> It sounds like there's a bit of a conflict between what you want to
> achieve and what this series attempts to do.

It's not ongoing really, it's part of 6.19.

> The way I see it, the CMA code is more of a helper that gives you a
> specific functionality set. Exposing each CMA area as a heap that
> userspace can allocate from seems like a bad idea to me.
>
> Without knowing anything specific about a CMA area you don't know if it
> makes sense to expose it as a heap. Given that there is very little
> information associated with a CMA area there's only so much guessing
> that you can do. I think it'd be more sensible to make CMA areas opt-in
> to have a heap created for them rather than requiring opt-out. Exposing
> a heap publicly applies only to a (potentially) small subset of all CMA
> areas, albeit at the moment it may seem that that is what it's primarily
> used for.

Do you have any specific example in mind except for that driver?

So, the reason why we did that was, mostly, to allow proper cgroup
memory accounting through dmem. In order to enable it in DRM and v4l2,
it was agreed upon that we would switch the use of dma_alloc_* to rely
on the heaps instead, where the memory accounting is greatly simplified.

So we want any reserved memory region a device can allocate from to have
a heap.

So I do think we need the call to register a heap in rmem_cma_setup.

That being said...

> In fact, for this particular driver nobody must allocate from any of the
> CMA regions associated with the heap driver outside of that heap driver,
> simply because the heap driver maintains meta data about these CMA
> regions for things to work. If we allow access to it from anywhere,
> things are eventually going to explode.

=2E.. I also agree that having it in dma_contiguous_reserve() might be
overdoing it, and I assume it would solve the issue with your driver?

> > That being said, it's not clear to me why the heap driver uses CMA in
> > the first place.
>=20
> We use CMA as a way of reclaiming memory if needed. The heap that we
> create is meant to be resizable, so that when nothing uses the heap, the
> memory can be reused for other purposes. However, when memory is
> allocated from the heap, we need to reclaim that memory for the heap and
> relocate any buffers allocated from the region somewhere else. CMA does
> all of that for us, so it seemed like the logical choice for this.

Ack, thanks!
Maxime

--sfzhuutowl7gwtka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZV+lAAKCRAnX84Zoj2+
dlYJAYC4+jPKHkn42l5qLnxTY3EvbGxcZHDH6RVzs/0th5A4+2dTD8lM8sIBBgPj
qui+8ooBf0t6WS1apZEC3zF8JlGWCr77XkBnVp5ZaozpXhqmNBMCQy7tm7z3cF/c
XrmTT30Bzg==
=yW5/
-----END PGP SIGNATURE-----

--sfzhuutowl7gwtka--

