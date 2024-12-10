Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6CB9EC51B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 07:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E710E5DC;
	Wed, 11 Dec 2024 06:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="wD3UMRxD";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="BPkmprzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255FD10E930;
 Tue, 10 Dec 2024 16:53:50 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id 2D403480525;
 Tue, 10 Dec 2024 11:53:49 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733849628;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=PPV/GHXwYA75Qk+vBJmS5CKvRytPVt2P7mQWbvhA7KA=;
 b=wD3UMRxDuXgwaGrlzzvtlsdAYUd6ZthHn7SPY+6HWtZPuNwRQzCh6+vT6KQv4tzwg3GGo
 uv79hJXIqw7QqvSCQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733849628; 
 cv=none;
 b=uKYreAe9nlsKlDkyS3y2eEjNHuEKJP2uKchljXhQbQ8PsoDv9xuLCHdyuA9tkQROru8IyBt9xQmrF+B2iadVVjODM8dzIoVymeaDQf9pJkEZjRHer80/NbTPBoYFU9R2pEdMthyKIUnigeeSSFrYRViiVHmzgC/3YKzL5t3jF83vbpdigi6gTOEVWTu5+65xYBs3wLfYompsMR/7bQgYeZdHHVtEdXTiQECRwpwxbFog87a4cNWKt32jLdGCDIuvHqEYoNVdj6RQ6SCDc6Zmer7O92S0EgNN1A9A9XV0hf4jMaTp4BK0lA99FIW8h+v83OgFUHitdWATzqe75yy8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1733849628; c=relaxed/simple;
 bh=PPV/GHXwYA75Qk+vBJmS5CKvRytPVt2P7mQWbvhA7KA=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=ZNDdmjHEFbnQrxn73CA8+FXO1RhRXZ+SVueJS1DfPUqXhVhkWTiMztqTf2w8LyIsCOadkQ9hQ3TSB8GFYA+rwzjSz0qc/ucy02/L7EBI87KdIjDoYXE1b1wMoRTI5SjiI+8xZD79NMXLS4cnws2tQvbfvHVxUGPMYffD/FgwbDYcgEwma0ojy5JuuLaMpOWvmWWCQtvGImPfbJ2GMDVmHu+wGHir1app/knB4Zscnw0Lla3sEkQiS9SGYPB3S7xM1S7iBt+mQIAEEh0nPZ8zPrRxVxRPDf8fI6sUgfG6KIs1QZHsGZcVVRAMQv4K3wGIc8PmKDnqIQ/RZTQs3z4i4A==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733849628;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=PPV/GHXwYA75Qk+vBJmS5CKvRytPVt2P7mQWbvhA7KA=;
 b=BPkmprzBZOodw8hR206xK5QG40OfcEf8XX3vi3gw8cmATqc1qUi7rNNtm8f4lgHNVmzsj
 2UBEwTAYxiMlt4IUVP81fdZkP4C9N5pEcW6eg0kenh/llFU9IDIGZ6naP3sYwkvWyNptipy
 9+fa1dTFi159z2Sv2qPtHdgtZ4avomBPZ30IIBA4xRwX7y8r7APq7JQIoE4hVgkk2O49vIx
 aJBbHf2JybZpQwmSLYahuoRQXZBSd7sN2seGC4PcheiU/uJT7z8coItuRy3jaE2PQ5hMW5T
 wbjS188+U2AON0y53pIRuGfam7BvGVFJ2X/1lp8dBNQiHfErCBt4ce85gN1A==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id DAD31280015;
 Tue, 10 Dec 2024 11:53:48 -0500 (EST)
Message-ID: <d42a3c2b47fbcce8be3c4aa613451ce431c281a8.camel@sapience.com>
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
From: Genes Lists <lists@sapience.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Greg
 Kroah-Hartman	 <gregkh@linuxfoundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, 
 akpm@linux-foundation.org, torvalds@linux-foundation.org,
 stable@vger.kernel.org, 	linux-media@vger.kernel.org, bingbu.cao@intel.com,
 Rodrigo Vivi	 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 10 Dec 2024 11:53:48 -0500
In-Reply-To: <Z1hbyNXUubokloda@linux.intel.com>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
 <87bjxjzpwn.fsf@intel.com> <2024121001-senator-raffle-a371@gregkh>
 <Z1hbyNXUubokloda@linux.intel.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-bHGp4P46otAfPh8D5/ik"
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2024 06:58:14 +0000
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


--=-bHGp4P46otAfPh8D5/ik
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-12-10 at 16:18 +0100, Stanislaw Gruszka wrote:
>=20
> The problem will disappear after applying:
> https://lore.kernel.org/stable/20241209175416.59433-1-
> stanislaw.gruszka@linux.intel.com/
> since the allocation will not longer fail.
>=20
> ...
> Regards
> Stanislaw

I confirm that (6.12.4 + above patch) now boots without problems.

Thank you for sorting it out.



--=20
Gene


--=-bHGp4P46otAfPh8D5/ik
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ1hyHAAKCRA5BdB0L6Ze
22qyAQCiow8EKie6x4WLJm79+9e46CEZ9gd5lJR0bGTh39txpQEAx4xNEdphp9mz
xnLYva4vWbPImT2BELnv4B97Yw8B6QU=
=+KY4
-----END PGP SIGNATURE-----

--=-bHGp4P46otAfPh8D5/ik--
