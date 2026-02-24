Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDm+C4dynWmAQAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:42:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840C5184D33
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC110E530;
	Tue, 24 Feb 2026 09:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cxIAOHdG";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TzwxIrYr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394D310E534
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771926145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
 b=cxIAOHdGv/fx8IgL31fhuO6wUORDOsxRwIM7aDbo8SVHONU72wYele4fkExdVsIxbrGqPc
 ckcuWI22GIEtEaG6s7TQTXqO612a5mN4b8Xuo15piRmDCTjNMwrMLCCLi3z9XxY6xu0uiA
 s2dGLpDtfG4GL8Y2QQmEBVBxPMHYXl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-JBecMR2WPpuxyOI70odn6g-1; Tue, 24 Feb 2026 04:42:15 -0500
X-MC-Unique: JBecMR2WPpuxyOI70odn6g-1
X-Mimecast-MFC-AGG-ID: JBecMR2WPpuxyOI70odn6g_1771926134
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4836cc0b38eso6769585e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771926134; x=1772530934; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
 b=TzwxIrYrSff69mJSJ5wceMRuVuN9VxNs3PizlYMR0q2vb4mFq44Xr5hpLKGzyU47/g
 +2qVgqNaxSLSKhJAmCp4zzFqYXTOejZS50eYFY+1hAGgGjHmjkECb/QShaYtwH6B/Neg
 opvN5SlIDSXNKF5ZtuMZmLQI6EUXF60jfiF9MOl6tsBbSRZebezR+ZSbZK+h9DtgT8sW
 TRgGBniXvana9LR76w7l9O30lvT1R94kKNts5KuXLeslwd63R5mIJ8iuDoBkTW57cIEV
 qTqYQPFfiVWnizMEWFHeqC+xZonp7qBIFqhi+EkTda+o8CuQRlVFx9cDvw8hhJQpts7i
 oWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771926134; x=1772530934;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFXRiyap5BrRiey8XcKRTLPgUy6tRvIlHZrT7O+t8rM=;
 b=rHwk/GKUCVWACMVnGVj2tkCDySydF2myI4K/AG85d88bUtH5ZAZwfSFz8NYJ7jEUmF
 PsXyKx+MsUPnxktCbGElbE0v2skfgcIepbsc5aizrY2XU7QrGvv1X4iqMjnzoQJnW14J
 6ErgITSfQXV7i2IXvMDEWEzOhcBLsDRc7WanDRr9I+F4hWWlgcfE6mTccpx7AQmu3v5U
 1nBL0RqlkZz0873rRiGxMEkH8kfl+HKrDERZmAOSsWPGzUIq17lIdMq6XnHUxACaAHZU
 rnPYdC5ta/0tJCmqeTXJjvy+VOv8tqmtsybWJ3DaXNWnc9iRwtRqL/0CV0Oi9R9BQoSg
 gs3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlxew83NURXGtQmrepNHLfBr4AClEy4dygj+Iw05mfM7tJ6ghw6WbFdgw1jQvXvyCFdruIFVK6BkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZOCFZbdaa0HLwItbpc6Ifv23Nsc3yQzaS+TNkzzsOaQ7Fo9eF
 o98d2QvOkLTXzhE6DRa/uHBKQHW92DLBy1aZoz6CLQm5Ob1Xi9qyJlD2JvRlXdHLQtPwoh3uKO5
 YtbxRX5U4HSy318jNodBc/rGwPQ7GE0UkzxdUUuaWnVUHCJcr6iZHcHoGj52LHHRfNCSP9g==
X-Gm-Gg: AZuq6aJPrFf9zUWq/1cZSrqGPewM+LK69Lk5b0Dw1HF+0ZIHOPR5q9FpmxTn6oMLinM
 CpiJvZbjErV50MCPSTVJzuxYaGABYwf3lTtnwpQpWtHYnyljnpRd62bPTef/PGJGaeLNtT1jMG0
 oKZo14fqfo+DxZKH1nVjBwX5KNJRdYiSlBCNFXf5OAg4Wk7Yf5JQf1aMkJW3S052SSOCAS3MfCI
 +dETwD8JLKY96gWMV3yUZBn5VYbmhui5O9PTSsBwzUurAJW1JmPAKSjMULwDwEGWPFndu4LVsLT
 dMTZKkGXlnR/7EAwhoDIfQ7yfvcoDDQ7PPL3VGYxRI3vHY95y7nxP7kq+Q/PeRj6d17gSQuidg=
 =
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id
 5b1f17b1804b1-483a95aaeb9mr191397915e9.4.1771926134365; 
 Tue, 24 Feb 2026 01:42:14 -0800 (PST)
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id
 5b1f17b1804b1-483a95aaeb9mr191397375e9.4.1771926133815; 
 Tue, 24 Feb 2026 01:42:13 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b7fddbsm253006935e9.8.2026.02.24.01.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 01:42:12 -0800 (PST)
Date: Tue, 24 Feb 2026 10:42:12 +0100
From: Maxime Ripard <mripard@redhat.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Albert Esteve <aesteve@redhat.com>, 
 linux-mm@kvack.org, Yosry Ahmed <yosryahmed@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zryjcv333aysdxbr"
Content-Disposition: inline
In-Reply-To: <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tjmercier@google.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 840C5184D33
X-Rspamd-Action: no action


--zryjcv333aysdxbr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
MIME-Version: 1.0

Hi TJ,

On Thu, Feb 19, 2026 at 05:14:42PM -0800, T.J. Mercier wrote:
> On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.co=
m> wrote:
> > An earlier series[1] from Maxime introduced dmem to the cma allocator in
> > an attempt to use it generally for dma-buf. Restart from there and apply
> > the charge in the narrower context of the CMA dma-buf heap instead.
> >
> > In line with introducing cgroup to the system heap[2], this behavior is
> > enabled based on dma_heap.mem_accounting, disabled by default.
> >
> > dmem is chosen for CMA heaps as it allows limits to be set for each
> > region backing each heap. The charge is only put in the dma-buf heap for
> > now as it guaranties it can be accounted against a userspace process
> > that requested the allocation.
>=20
> But CMA memory is system memory, and regular (non-CMA) movable
> allocations can occur out of these CMA areas. So this splits system
> memory accounting between memcg (from [2]) and dmem. If I want to put
> a limit on system memory use I have to adjust multiple limits (memcg +
> dmems) and know how to divide the total between them all.
>=20
> How do you envision using this combination of different controllers?

I feel like it can be argued either way, and I don't really see a way
out of supporting both.

Like you pointed out, CMA can indeed be seen as system memory, but it's
also a limited pool that you might want to place arbitrary limits on
since, unlike system memory, it can't be reclaimed, will not trigger the
OOM killer, and more generally is a much more sparse resource.

Maxime

--zryjcv333aysdxbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ1ycwAKCRAnX84Zoj2+
dm9VAX9JuCh6S7GJf/wUUY2RPjeN5/Hr5cmqHNDJmY78HFfnpCUW4mFYqDeZaoeP
aK99/MkBf0bRStrApFYWF5JgHSK2oeVEEzJ9MxforcaAQ09KVjoG4RckJH53I57/
PQy+P4+J5A==
=fLNZ
-----END PGP SIGNATURE-----

--zryjcv333aysdxbr--

