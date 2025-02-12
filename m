Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEBA3329C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 23:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC68510E047;
	Wed, 12 Feb 2025 22:30:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sdore.me header.i=@sdore.me header.b="gZbJzqzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sdore.me (unknown [95.165.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAE610E047
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 22:30:16 +0000 (UTC)
Received: from [192.168.1.2] (beast.lan [192.168.1.2])
 by sdore.me (Postfix) with ESMTPSA id 9F09CEE7BBA38;
 Thu, 13 Feb 2025 01:30:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdore.me; s=SERV;
 t=1739399412; bh=WNonWBF4udDjpPlXnE3uoU9A0SFZBdAVCaeatr2Pkp8=;
 h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References;
 b=gZbJzqzzCk0aTRzEy7iYphVtTMN1EtCpl4X8rR8TN8rUaYLO8Nk9KMeNt5lq9Uj24
 PN3VyiBSftdwXVc3nOIX364aWx2Jrns85L8vKPxHDwFq2aWPZ0XLISttf+WUV5A2Ps
 87WpnKj/SZ2vfmoSGoqqMaoUOb9Uy5rXb0hseWvg=
Message-ID: <f0e0d4e7f5d552cb82cf3c9243f15772268fa311.camel@sdore.me>
Subject: Re: [PATCH v2] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
From: Egor Vorontsov <sdoregor@sdore.me>
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Date: Thu, 13 Feb 2025 01:30:12 +0300
In-Reply-To: <87zfirzerp.fsf@intel.com>
References: <7cab8349bc8bb6fa08d2a7127a724efea155f154.camel@sdore.me>
 <87zfirzerp.fsf@intel.com>
Autocrypt: addr=sdoregor@sdore.me; prefer-encrypt=mutual;
 keydata=mQINBGDSFnMBEADfvtLiuRL6CHdMzETKrux7sNHWG+eJ2+pgRZ3Nc9pH/YWqjoed8OpFx
 OLeUxr9YSQ3uMD//JEe3+Sgte29Z3PAAHVkCwKBIucCnhHpXbcQZgC9xYMCd6GWR5+DpXN9szOIyb
 kvnEtuqTddz6Q7fYsaFDs0pH3jUUWmSAyCn2JCIRfT22XgO44B/yoqnM3JXHAayeHbEAQOzMe81q3
 deauI9W7SC9ScRT6VkgLuc+SxqH99el/OkiKTe/QpO6I6cVS8leesqnOGffkRPos/o2eRonqgDu0e
 Mw4YTu0x5iNr8Lbr4TefU2W1l6M3MNwOsLmI+58+3fK1vh0QqZ70NC4eyD9UEXk3mJyV7epfNU6fY
 0mFJbAhGV1TXomcy2MlOD1rDixw85zdK5uUwp0tfEkpxqKtihJmrTdApOTTVed303CLzgDsMokTIe
 aUOPqVZoWFDkvOzq6IppBkApJHBf1lcLlgwEn3cLQlGpYRSSi5NY3+UYtcOEZLDbF3TO6ncY8W2h3
 yQH/sAcSllfKKvkhdqEz4/Mha3GbZQXWgjrLy9BcISsQFj+DBN54I6a6kLm2n5wXH99sOp7s3jMeN
 zSU6PtuxZq4Gkt2K5JGT8yrIdfJfOH7yRUVm+8JqKNKqd6oczlDKV+lzRk9M/kjb8VQivaNSNwTo9
 3NxEuft0+tZgwARAQABtCJFZ29yIFZvcm9udHNvdiA8c2RvcmVnb3JAc2RvcmUubWU+iQJOBBMBCA
 A4FiEEXlTCjXwaPBiJP3U33a9iH2xv60MFAmDSFnMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4A
 ACgkQ3a9iH2xv60OquRAAgbgenXi+Ud0tYoAz6giuFKYqzuEYuoSVkjxYvZq90ODrzbu7EdvMVuKA
 qNqYjs3VRBPBMHXhJKEftKbX4bZwCoC2o2wB5oV5O13jVN083r49FTLCxmOoufCkaqscBBxi/X2T6
 +i0n5Nqx5NLBL0kE4NMTk1jxEEyuEjv7bBMs196G/d3EpNJT3YGkLXBUibpaSaVjE6zBr3UygieLD
 2QXNkRJubx2d0FoD8TezSt5hsHWg9FOElsW6ZImRI+5q+ptL39K3cpjxHMKyhmo7xypD5XNWdmsmV
 1+STnK7R+id18xs7JUDxHBtG7Z/3K6txgF5CPbPvtaEi9fB3K/uS03BnIzsY2/cY3r9UHHrHa/sP6
 DhDwj9dr2xIFG5w6ZNh4mUTHEJoWKEEsYKwXy2eJCB3XvP7GURAm8fXdIapONbHDYj7XX49Mj+LBr
 s4PNBuKaZTFgGQ6RSc7LpAR56xaEDR93m7zNy84mQtpab/owaox1A+BEujzKK/vEDvj9f8EWlWZRa
 DH2auNNAxdr2ACR8RzkojcFDCErAgc5sFQrgVUlvNmMdn3VL0CWmndzEQxsOdgVk9SwoHHYpHf4Cg
 gtchq3pTQ5XSRaP/wxOtQpzqJWq5uFERBTLU8WRXYv3mM3KMdvtTJadF8+P+KSSnn+/yHahR0HKVx
 PtHSH7Px/vI=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
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
Reply-To: sdoregor@sdore.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-02-12 at 11:35 +0200, Jani Nikula wrote:
> > +	/* TODO: support video-optimized refresh rate */
> > +	if (timings->flags & (1 << 4))
> > +		return NULL;
>=20
> Mmh. I'm not sure I'd go this far. The bit indicates *two* timings, one
> for which the below *is* correct, and another additional one with
> vrefresh * (1000/1001).
>=20
> We could just add a drm_dbg_kms(dev, "<message>") here about missing
> fractional refresh rate, and proceed with the one non-fractional rate?
> Or just have the TODO comment with no checks.
I'll go with the former, for now.

> Either way,
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Thank you. ... But!

> Are you up for the follow-ups too? And since you've got the hang of it,
> maybe fix struct displayid_formula_timings_9 hactive/vactive to __be16
> as well?
... at this moment I realised that both the specs and the legacy code
actually indicate it's indeed *little*-endian shorts!
I.e. `x[0] | x[1] << 8' -- that's LSB-first.

Also, virtually no code in `drm_edid.c' uses big-endian.

Thus, I'm fixing both my code and `displayid_detailed_timings_1' (I
suppose you meant this struct instead) to use __le16.

Egor

