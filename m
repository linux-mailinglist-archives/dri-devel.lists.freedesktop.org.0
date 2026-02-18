Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFRTDQCblWmsSgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 11:57:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E483155B26
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 11:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762AF10E158;
	Wed, 18 Feb 2026 10:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cU24d4+r";
	dkim=pass (2048-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jvaBWo6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08E510E158
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771412217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
 b=cU24d4+rQUm2uGbHlnP1g2cSEJgrTg4WyjJfNexcjCJ3rBDQ1yGVHBo0QKRZ7EyHF51VOK
 m6rjaJjCyeJPhiVxPMqB+NN95jNMLeMcxdgEefAekypN308VxETZ8WGXPiOVxUHZ7j9Bwy
 mqUdLzBxddSdCCb4IhZsrkuHBpoCnAg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-HvGuCiaKNie-9u0bq8M3oQ-1; Wed, 18 Feb 2026 05:56:55 -0500
X-MC-Unique: HvGuCiaKNie-9u0bq8M3oQ-1
X-Mimecast-MFC-AGG-ID: HvGuCiaKNie-9u0bq8M3oQ_1771412214
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-435ab9ed85dso3710166f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1771412214; x=1772017014; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
 b=jvaBWo6sytbOSk27SfxBFBUY5LBKnrckizSS7MEvZdBAlPMiUrBeq/2cTmIQlTHnpC
 pVD5/kL/F6XkaWFIES+3UQGHeH9NgomUW86lhMUzbkorfLocDXvMKW+LuM8aKoHOgZm1
 09bHRkauo+F6cCZh6/BnI8sZ6kKVq07/jWza4HpabOkV1EgQCuPa0Q9m7mM2vbDvSOGM
 MA3xbSfPgvHp1NJ1NvqXcuqZpAf6vD8OObJ89oadfs+YnoEzXmkD5reQ0a5FUyuVQ4AM
 MnnLG/olgscqJcAdfGaPiYy2duuyRrK/scrODpKZy+vloEpQ/dzZHpWyU3XhiQXhRM/O
 UsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771412214; x=1772017014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g5EhFzRS9kh8aYP/2UGoHhJQm5CJn7dpEnQsAb/ZMSE=;
 b=WLS2pQdWkMexQpaqnzmPb+R2GygGv4A6OxnO4PPGYU3euS0ZXwwqpDevBiuNsMu3Rx
 cQnUCCck457XMsjnDhBlq2RPBLNEVHKcgvLD2xNorhP+yAqmv5WBMIa8mOmx3JckeV1z
 GB3cBnpwaKKUFh9jZpM4BGHFNyBcuD3ghzkkdEKHnzMZW/HBC1p9tZAb+CmuU/EK2+6Y
 vW32XuHZv7/nSlmNRDTBySKhbMlFzH+i+OOjjX9SGp3DurcllkGs4lIVVUs/7tA2tn72
 zhmh8UrSDaD7pKLOeQA8oXQkCQXIUy5lNhUNDI6Um8dCS1cWN1zJNkxZSgU7MhIE8Fdl
 tN+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjPZp/iDDdIdiozz1YC4arPxQFUBzQKpjr1SBe61K/sGe/u7di51eNB3yZ9M2B3k4UKl/l9jKJFU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5JaI69Ei1cG6R/6fFvhU0YrDhHFdViCneWAR2+tD+kKxs5GIz
 4qar6k+romR3f9nEKhbOlHU22xedj7DFFDOZ+H5ZMmO0q3+dtLEVOf2WdLtJKqqvrckmcIacaT9
 rJnGp3hQ22iEwsPhIrFEje880MZ6PmIzTdtonJmU+gUHlvYx+zmeCTZ6dLvWvhpWw1oGhJg==
X-Gm-Gg: AZuq6aLtDAAei4FG2CC/TMUMs9jRVRa8h3/Rh8DvRiQtwbCsl87Fyx165M8FbLmNoGI
 SEIRIesea3B8jWnGiO5B2Iak+i4kmwsjRItd+SSSWprcMcgCTPLrsCXTRblMGAMyRaM5rOtLc5E
 jeVGpQ7oSA51AYBEE7kMuI9XaZuSewllA1qiuRwrPH3YsEVmizizWs200GIdRyvuE6SHYwrxdR1
 guVcqP3hY3mPWVoY1J4VP6iHAOIgS6D3D7ZrFqSFQVWTg+iq/zqknqKj70pDXHN9DRifVfE0n9d
 p/8fcEMsk0sOEBQc7hME+dqOF/hgH//Jh2LQFfFXiiP3aBkJBhSPvBeps1koxskJnBSGuoEYRw=
 =
X-Received: by 2002:a05:6000:2c0c:b0:437:8ff8:fea3 with SMTP id
 ffacd0b85a97d-4379db66593mr24384205f8f.21.1771412214102; 
 Wed, 18 Feb 2026 02:56:54 -0800 (PST)
X-Received: by 2002:a05:6000:2c0c:b0:437:8ff8:fea3 with SMTP id
 ffacd0b85a97d-4379db66593mr24384146f8f.21.1771412213558; 
 Wed, 18 Feb 2026 02:56:53 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc85csm40735722f8f.22.2026.02.18.02.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 02:56:53 -0800 (PST)
Date: Wed, 18 Feb 2026 11:56:52 +0100
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
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
Message-ID: <20260218-magnificent-flying-coucal-a4f1c0@houat>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-8-thierry.reding@kernel.org>
 <20260123-slim-seal-of-luxury-bdb58b@houat>
 <aY3oyMhkbxhgMbfi@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3lkrnqpcfmpi4l5q"
Content-Disposition: inline
In-Reply-To: <aY3oyMhkbxhgMbfi@orome>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8E483155B26
X-Rspamd-Action: no action


--3lkrnqpcfmpi4l5q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 07/10] arm64: tegra: Add VPR placeholder node on
 Tegra234
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:51:29PM +0100, Thierry Reding wrote:
> On Fri, Jan 23, 2026 at 02:28:50PM +0100, Maxime Ripard wrote:
> > On Thu, Jan 22, 2026 at 05:10:06PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > This node contains two sets of properties, one for the case where the
> > > VPR is resizable (in which case the VPR region will be dynamically
> > > allocated at boot time) and another case where the VPR is fixed in si=
ze
> > > and initialized by early firmware.
> > >=20
> > > The firmware running on the device is responsible for updating the no=
de
> > > with the real physical address for the fixed VPR case and remove the
> > > properties needed only for resizable VPR. Similarly, if the VPR is
> > > resizable, the firmware should remove the "reg" property since it is =
no
> > > longer needed.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 34 ++++++++++++++++++++++=
++
> > >  1 file changed, 34 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra234.dtsi
> > > index 850c473235e3..62a5dfde9e38 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > @@ -29,6 +29,40 @@ aliases {
> > >  		i2c8 =3D &dp_aux_ch3_i2c;
> > >  	};
> > > =20
> > > +	reserved-memory {
> > > +		#address-cells =3D <2>;
> > > +		#size-cells =3D <2>;
> > > +		ranges;
> > > +
> > > +		vpr: video-protection-region@0 {
> > > +			compatible =3D "nvidia,tegra-video-protection-region";
> >=20
> > The heap name doesn't follow the documented convention, see
> > https://docs.kernel.org/userspace-api/dma-buf-heaps.html#naming-convent=
ion
>=20
> I could change this to protected@0, which would make the name of the
> exported heap "protected".

protected-video would work too, but yeah, as long as it's unique, this
works.

Maxime

--3lkrnqpcfmpi4l5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZWa7wAKCRAnX84Zoj2+
dvUhAYCm3FfvWk95XHH2FpeLOwuwKc6yGIbEd2DSsZvfEyoEj29SyLApBrBuUbbF
1e/ifR4BgM0QdBWXEmJb3YcqxnY/OdqsBvatOWUWz2hoGC3/GAFLKTRWhVfS1lbP
wk++E+B39w==
=Z//1
-----END PGP SIGNATURE-----

--3lkrnqpcfmpi4l5q--

