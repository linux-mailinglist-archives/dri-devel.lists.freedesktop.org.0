Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H57MYiJlWnqSAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:42:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10C154CC3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B89610E59C;
	Wed, 18 Feb 2026 09:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PXy072Ag";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JTHsh7io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F2D10E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 09:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771407748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbLBL9om1fu4jfoAPaZMybNUHZLF4uVBzJp7dWB+x3o=;
 b=PXy072AglHqM0DGevzwlx32vn9nMyhcJ9EhAfQx3MHLS5eEfsna5F+eXTusJMwDdHdLWpn
 AAx8QInQqT661KWrsjyhI75zBtnPXqQ2RC8yjKrrZwXCf0LTlb9y2LbCZbfSObaFUJvfPL
 PRg12vz9E83CdU46dzgUZFx6tfLQEeE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-6lWEkQwIOyatTs53v2fZMQ-1; Wed, 18 Feb 2026 04:42:26 -0500
X-MC-Unique: 6lWEkQwIOyatTs53v2fZMQ-1
X-Mimecast-MFC-AGG-ID: 6lWEkQwIOyatTs53v2fZMQ_1771407745
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so31897115e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 01:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771407745; x=1772012545; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pbLBL9om1fu4jfoAPaZMybNUHZLF4uVBzJp7dWB+x3o=;
 b=JTHsh7ioLE72DJiNfpEwylcQVwpnU3jQd1Wtm2prKRXf1oXdM64uVPqP5+yJs7psxt
 EK/B290+D+Glz7WkOQl1YUOpQDEUA98xjlI4BpyP1Iyk4lDqZNWUYw5EbLryRcCMgt4v
 scDfGMdp/lirlQW67B/rkObr1XBECpkxbyEQSd6wXROVfEi1VPYceG4dSSYAAnu769nx
 wdoxQpH1GgSYFHP5KqbMvEW47crFSwXlI+fNNxHzcOgElh6+D9MIO1AA5fU6cfT+GyRJ
 NqWyLZ3nYo2CiVqiFQZOx7I8DbZ63w59Xxx8ov7c9vH0qjV/HmyYpb+i3pjeF/fSyR11
 uL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771407745; x=1772012545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbLBL9om1fu4jfoAPaZMybNUHZLF4uVBzJp7dWB+x3o=;
 b=IPN51lRp4Cs5Padez0Q2QHnnceaPu1cUJ85atkh+XVM09J+4n5riRuQKV0mOAbwpu2
 aCOwSP+ayHHdYixOlzy+APK+tGzC6ABzZKuc1Cwn8oEJZyOIstwqSyoYSdnpoPYoSucR
 tFR4yt6+cBMaYK46OrVtrk2aCUW9AN6Kr+dDsW+AQvLul5oRv2s1B0BSy1SxGgO2jYnG
 xumeEzuY0V9DnGKxLESEEFD6Ff4jafI0BupiSdSCx/p7mB4WvBffdYifCQI8e9Ag7A4x
 69wXr8f5Jpikw+4WkPqm3d5eGzBznKTs5ubS+dE4SPGn4AlAAiXgNU/keCTQzzDPA9SR
 cPwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3f3MwtkYhaHNaTCZBHAlU5kFgoP3It/1wX9RsnVaxaJ5S/FNESx2oKgZnzK0p6DCNu5NTnAqvRlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzO1yppB5fp5Tp+CQWwNG35LoYmHoKnt4aKY86ttwmXpMpZjL7E
 FFBSaSxNXwZeUe3aoJ6EHtheev0HfOuTNhjvB8cqeNiRevgDUXl5TFyifvKUTwZYOUIlsIwfyS7
 fyB5OOqOejDgmDuEIBrsg1cuKg3EKYhIdZ8xgNGm1Q59ZXjZYrgZaxbY3B8dxlfy7e8C4/w==
X-Gm-Gg: AZuq6aIo/8rL4CMgKFKzUFN/SgYtnDDxFunyck1OSARfX9pDrGsgry3+0Jm5I83H1J6
 EShtGIuN9yv09N5XSNYWBW/xHeRcuSwGO4PmOI/jv2qSCDNLqAeC79ihjBczBrOapSEA96RyLq1
 M3F2F7pw1oDBSAn1k8jdekHLO4D4v5EYWZO4gG+ACCXpND0mOTh5jNms/VPQM9mxcrVthX/uw5+
 hp2Mo02ydIYjOUE87qFU7gm4qe920CgQw7LAmTMCojWxVjcmX4NfGXIGnyY5hnJ/+hl/GT6YsLj
 qva2nbIAWDUn32HSPzuEi4i+TQNHGxWWHZ0mQ9ex5TCBF0e1XJTMo8mmKcdFoRcJ3gmnbBMZcw=
 =
X-Received: by 2002:a05:600c:528f:b0:483:702f:4641 with SMTP id
 5b1f17b1804b1-48379b8c45fmr250986115e9.3.1771407744674; 
 Wed, 18 Feb 2026 01:42:24 -0800 (PST)
X-Received: by 2002:a05:600c:528f:b0:483:702f:4641 with SMTP id
 5b1f17b1804b1-48379b8c45fmr250985705e9.3.1771407744101; 
 Wed, 18 Feb 2026 01:42:24 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4836ff00332sm354774195e9.2.2026.02.18.01.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 01:42:23 -0800 (PST)
Date: Wed, 18 Feb 2026 10:42:22 +0100
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
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
Message-ID: <20260218-voracious-orchid-malamute-febce0@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-7-thierry.reding@kernel.org>
 <20260123-meteoric-butterfly-of-imagination-fd691f@houat>
 <aY3nov29aBGWw93Y@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="4auwmrzja7jm6td5"
Content-Disposition: inline
In-Reply-To: <aY3nov29aBGWw93Y@orome>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3C10C154CC3
X-Rspamd-Action: no action


--4auwmrzja7jm6td5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:50:09PM +0100, Thierry Reding wrote:
> On Fri, Jan 23, 2026 at 02:30:14PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Jan 22, 2026 at 05:10:05PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > NVIDIA Tegra SoCs commonly define a Video-Protection-Region, which is=
 a
> > > region of memory dedicated to content-protected video decode and
> > > playback. This memory cannot be accessed by the CPU and only certain
> > > hardware devices have access to it.
> > >=20
> > > Expose the VPR as a DMA heap so that applications and drivers can
> > > allocate buffers from this region for use-cases that require this kind
> > > of protected memory.
> > >=20
> > > VPR has a few very critical peculiarities. First, it must be a single
> > > contiguous region of memory (there is a single pair of registers that
> > > set the base address and size of the region), which is configured by
> > > calling back into the secure monitor. The memory region also needs to
> > > quite large for some use-cases because it needs to fit multiple video
> > > frames (8K video should be supported), so VPR sizes of ~2 GiB are
> > > expected. However, some devices cannot afford to reserve this amount
> > > of memory for a particular use-case, and therefore the VPR must be
> > > resizable.
> > >=20
> > > Unfortunately, resizing the VPR is slightly tricky because the GPU fo=
und
> > > on Tegra SoCs must be in reset during the VPR resize operation. This =
is
> > > currently implemented by freezing all userspace processes and calling
> > > invoking the GPU's freeze() implementation, resizing and the thawing =
the
> > > GPU and userspace processes. This is quite heavy-handed, so eventually
> > > it might be better to implement thawing/freezing in the GPU driver in
> > > such a way that they block accesses to the GPU so that the VPR resize
> > > operation can happen without suspending all userspace.
> > >=20
> > > In order to balance the memory usage versus the amount of resizing th=
at
> > > needs to happen, the VPR is divided into multiple chunks. Each chunk =
is
> > > implemented as a CMA area that is completely allocated on first use to
> > > guarantee the contiguity of the VPR. Once all buffers from a chunk ha=
ve
> > > been freed, the CMA area is deallocated and the memory returned to the
> > > system.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > Aside from the discussion on CMA, it doesn't look like the heap defines
> > anywhere the attributes of the allocated buffers this heap provides.
>=20
> Attributes like what? Where would you expect the driver to define this?
> I don't see anything in struct drm_heap_export_info that sounds like
> what you expect, nor does the allocation ABI provide any means of
> reporting attributes.
>=20
> There's also not a whole lot to this, other than that the memory
> allocated by this can't be accessed by anything other than a select set
> of devices. You can't have any CPU access to these buffers (the hardware
> will refuse to let the CPU read from this memory) either, which is
> hinted at by the fact that no mmap() operations are allowed.
>=20
> Can you elaborate what you're looking for?

Are the buffers you're getting when allocating cacheable? uncacheable?
mappable? physically or virtually contiguous? etc.

See
https://docs.kernel.org/userspace-api/dma-buf-heaps.html#heaps

Maxime

--4auwmrzja7jm6td5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZWJdwAKCRAnX84Zoj2+
duX+AYCJXsCjOrlEdYQB6RhYNSa4Pv3CLkFQFr1nVSSBelNLtgkkxbQHuCJrRHFs
/M4ii7YBgMXgh8YAl2SPDy/1KeWGMmlbxnWoeLENw02uUWqVixSx2Xv05JLfe8V/
j/WNZ8aHOg==
=vKsS
-----END PGP SIGNATURE-----

--4auwmrzja7jm6td5--

