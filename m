Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBFvHPB3c2kfwAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:30:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A576434
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C7110E2C0;
	Fri, 23 Jan 2026 13:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CYZlga9M";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hnjOkpJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810CB10E2B6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769175019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7Dwu+CNXtg5bTxCbEyb6A4+Vw/Acc988cNs3Meb1J8=;
 b=CYZlga9Mf0vKluuPkLAOTVDehTLUOTQMqqztMPLb9XEtfIaRlV24a64MpWuoTqxwDj5f6e
 2hQji93YyQzbI3YUR2BbmuoKdPYKfAJhFNREtOIWfTE849y3u5ToXQRA163nJuiUI8D87I
 ylnXU1o/MXu0cGmVWp9Gn3Midd8Bq3s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-hrjwIraeP_6nnaKJB8WTIw-1; Fri, 23 Jan 2026 08:30:18 -0500
X-MC-Unique: hrjwIraeP_6nnaKJB8WTIw-1
X-Mimecast-MFC-AGG-ID: hrjwIraeP_6nnaKJB8WTIw_1769175017
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso21791945e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 05:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1769175017; x=1769779817; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q7Dwu+CNXtg5bTxCbEyb6A4+Vw/Acc988cNs3Meb1J8=;
 b=hnjOkpJ6UuXlt5QrtJZ1ix/PhnQKhpvuVM5lslEaxPKBA5wS7khhqvyIMyZ0SVcBet
 igH6Xc/4+ZTu2gn8rpKcoa1MdFPDXvmfueVxf9l/fUSXa0zkt6OjBdb85LEjx7Wid931
 tg6vSoeg1PMZSGaVFeYoXNs0IIZtLrMFl9WBpIgW9kguuUbZTziXTign+tVzHi/G0A4U
 xYVFRQ1wybYXKVPG7NiyEMretLwmHAK0bl27KHpfVzFWngN9dhMQPTfJ4xVaWqNnW+ft
 aViREkfX7xVnd8Ay3NSibiuxnT8LYZxACXFpS+rfMSaYlzrBpQiCGyvhgDR2EpNyarR+
 FBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769175017; x=1769779817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7Dwu+CNXtg5bTxCbEyb6A4+Vw/Acc988cNs3Meb1J8=;
 b=gjnDu46oTctGKJTAHnMIoj9qhKkAFJWmnJEAUJowkDmNQVKNoqx79r3uTFvGUFOvce
 PYP7qYZCdSY9hswijg28Y7h9pN9+49b+sl39DDlSQQ9w7f3a0vYBl3XE9YMO7SFQg10n
 k0jOhm9NJG5ZeUm/vfv7sbokWyOEAtB8XgYawQ6Ok09gPcF+4ZBXuOnI1yG7BttvaRpi
 W6+HFrrwVZXsuzy7ag9d2je1ivILfJUGE45kTYv+qI8xYU5KdUozb1ubVd3Rzusuzkx9
 HQ0Jc27t8QTDQhmKbEgwvccbL8GYC648RgO6W6M7Q4UXzruwr3ILo+IV4sY8MjurUFJ1
 HVhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKamcm55r4BXYmO7MSmEfPPyCyitLSWnK2ZrSX4GSd6ewllnmgq8FlzKtwAFbT8eS6UblRBQ8WNy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaIJEFSPfzT1drdljW5GEVgZvnozVaqLqzc/Y1yCo+07I3ifys
 C/CZ1eBuwhllEqr5prcRFAQaktUo4oxxfKf5/7xOuuJFOFZDx9BKaqoVQaxBb6rzGu+QWjdrWmC
 U5AnC/XedMRbmKLD8aw870BXaO+LcuWnQNOZ1e589sl7O/y0+jgOBCS/7l5x2GPaSn4cJVw==
X-Gm-Gg: AZuq6aIZeYb7U1k46FUvqraE3rL2fX2Va1Zsg4EWAYUvzl7u8Ilczhb2qVtbmkpSbTX
 taHjOVb6cHoo3UTk+obkHyo364Rt9TOmyF+b7evbvBYGw0BOqz1j3CCcruV1XXPwcBRe2FfWbH+
 DDZXKAbT3gBjUriFdGEF8ZGFierC0ZSQEF4Lz05UqG0D1rclHhsqLe7r4lelHyVRFqn/PV1QCgJ
 R17wxi8NOyENz4G/75w0eOSXS2/FYfa8KIqOkW37+Blu/HgenoPIuuuhz8tYwAKlPJTUudq7VNs
 n5E3PKRFNJYVLIvc2GogiOnILi+facYI1QSE50RdfNJGClXMN27ZvE5KHWpiiQ==
X-Received: by 2002:a05:600c:310b:b0:47d:73a4:45a7 with SMTP id
 5b1f17b1804b1-4804c9b4d0dmr52292615e9.24.1769175016324; 
 Fri, 23 Jan 2026 05:30:16 -0800 (PST)
X-Received: by 2002:a05:600c:310b:b0:47d:73a4:45a7 with SMTP id
 5b1f17b1804b1-4804c9b4d0dmr52291525e9.24.1769175015283; 
 Fri, 23 Jan 2026 05:30:15 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804db63817sm22696555e9.3.2026.01.23.05.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 05:30:14 -0800 (PST)
Date: Fri, 23 Jan 2026 14:30:14 +0100
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
Message-ID: <20260123-meteoric-butterfly-of-imagination-fd691f@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-7-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xayh7cobbiwzraak"
Content-Disposition: inline
In-Reply-To: <20260122161009.3865888-7-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.730];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B77A576434
X-Rspamd-Action: no action


--xayh7cobbiwzraak
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 06/10] dma-buf: heaps: Add support for Tegra VPR
MIME-Version: 1.0

Hi,

On Thu, Jan 22, 2026 at 05:10:05PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> NVIDIA Tegra SoCs commonly define a Video-Protection-Region, which is a
> region of memory dedicated to content-protected video decode and
> playback. This memory cannot be accessed by the CPU and only certain
> hardware devices have access to it.
>=20
> Expose the VPR as a DMA heap so that applications and drivers can
> allocate buffers from this region for use-cases that require this kind
> of protected memory.
>=20
> VPR has a few very critical peculiarities. First, it must be a single
> contiguous region of memory (there is a single pair of registers that
> set the base address and size of the region), which is configured by
> calling back into the secure monitor. The memory region also needs to
> quite large for some use-cases because it needs to fit multiple video
> frames (8K video should be supported), so VPR sizes of ~2 GiB are
> expected. However, some devices cannot afford to reserve this amount
> of memory for a particular use-case, and therefore the VPR must be
> resizable.
>=20
> Unfortunately, resizing the VPR is slightly tricky because the GPU found
> on Tegra SoCs must be in reset during the VPR resize operation. This is
> currently implemented by freezing all userspace processes and calling
> invoking the GPU's freeze() implementation, resizing and the thawing the
> GPU and userspace processes. This is quite heavy-handed, so eventually
> it might be better to implement thawing/freezing in the GPU driver in
> such a way that they block accesses to the GPU so that the VPR resize
> operation can happen without suspending all userspace.
>=20
> In order to balance the memory usage versus the amount of resizing that
> needs to happen, the VPR is divided into multiple chunks. Each chunk is
> implemented as a CMA area that is completely allocated on first use to
> guarantee the contiguity of the VPR. Once all buffers from a chunk have
> been freed, the CMA area is deallocated and the memory returned to the
> system.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Aside from the discussion on CMA, it doesn't look like the heap defines
anywhere the attributes of the allocated buffers this heap provides.

Maxime

--xayh7cobbiwzraak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXN35QAKCRAnX84Zoj2+
di8FAYCOkztgtjE43ySzEaa0yAsqQduekc23hd1d+jt1Rs7EtiAvzP+ciybiSQwk
DUzYoicBgP4Oh3gf3t211CT8YUccPrYQrrNg2xkUvpgMi28C/P9/n1V75W2MOChK
DyngiCfqgA==
=4Im3
-----END PGP SIGNATURE-----

--xayh7cobbiwzraak--

