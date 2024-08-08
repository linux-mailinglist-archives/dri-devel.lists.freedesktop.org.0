Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537094BC47
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FED10E6E1;
	Thu,  8 Aug 2024 11:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.b="coHS2CK2";
	dkim=pass (2048-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="nPlqu1jq";
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.b="BG0muSlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 911 seconds by postgrey-1.36 at gabe;
 Thu, 08 Aug 2024 11:28:41 UTC
Received: from e3i64.smtp2go.com (e3i64.smtp2go.com [158.120.84.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458CB10E6EC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1723115605; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=DWvwT7MwWty/w8bZJf5PhzT0d4KUoUgQ/VKY8SN+v/4=;
 b=coHS2CK2fF/iqgNZpdN5UgqStxRzqApt4arpSo+FfiIcgtT4g+GvdPaXTzwig5FyCo5VN
 2E3WxF1vy9R+tyDNn2ynXUZK1BcczSUjE0wpeouRXT9BuhPDMaNKba24ea9LISQfn1ttzaQ
 3IlzEUBaquzlTDcaCyRqnuY2pIIOTOhKCP+8p44l/r5wJXlJE1krjonbCDAMbgRCYxCOEev
 PJFuC81VPLcbW4c9i2coNQ791l8l288gpQy1RSf8Bud3SbQIaaXliyFaB0JmyVLOGejLXq3
 pfvEuicIq/ueYScC4/IlAcrNEBx83w8LidSwXncvu5xrxGRUP/lH7PXzaf/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1723115605; h=from : subject :
 to : message-id : date;
 bh=DWvwT7MwWty/w8bZJf5PhzT0d4KUoUgQ/VKY8SN+v/4=;
 b=nPlqu1jqnqg2+MjL+sntn7Rme6CSz6xhrZjY0PApsYTfqRh4mjzfVsQqbDkR6NTf/xKAA
 N7TT7Glnm2j04sHHXGxOyjZvJ70JEdG/k4S8Mxnk94DD0g+2smDnsDSzsosn1kbG+I11ZPI
 YRD0DQJyctp2oebzbqoouejulQEcsDu/qcWqCaQit/7ZrXIBtc6ZJO2D74s6s9ZXG94hbY1
 i+6ou6xWWL/TNDJykkGA+8kY0cWrByRnQzYCXmKCwRVgups46qD+LQNSrXEyY2p4Ir0WVF2
 l871fUszGRtxMEA+jt4Xpmh2DtC+WC8Romf0STRNeF/IZmKUckKQugKH4Yyg==
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sc14u-FnQW0hPl8lT-kBTA; Thu, 08 Aug 2024 11:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1723115576; bh=o7bhdwNQ62EoS95sx84tEhwI9oeEmv+6fwfOAXB/f5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BG0muSlj6GOKpUkPtJ0qd52efWk+CoW4jZdWTKnne+jdIvvJKqC3ltvtnGmjhM6mI
 ntIjsexl1m6K1i0KpZ0pMoOd7MLa/iz7heBW4/RbRrqhv+BTvbijSHbfD0DPQ3Cb8B
 WgqVLiFWs+fL3QDohjEbAtCBnj/mEdqJorCqp/58=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 82E5742DD9; Thu,  8 Aug 2024 13:12:56 +0200 (CEST)
Date: Thu, 8 Aug 2024 13:12:56 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "speakup@linux-speakup.org" <speakup@linux-speakup.org>,
 "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Finn Behrens <me@kloenk.dev>,
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 "gost.dev@samsung.com" <gost.dev@samsung.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
Message-ID: <ZrSoOM9z4VnqhOf2@fjasle.eu>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <CGME20240807153904eucas1p2264f7363ae2474c20c6dc1b84a232815@eucas1p2.samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes>
 <sbj3c3tlafewy2n4pylbnpb4gwylpnyxovdykfy3dhk2wqmpry@ekhhe3mgqnd6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VxNEXc5Vg6IlyTm+"
Content-Disposition: inline
In-Reply-To: <sbj3c3tlafewy2n4pylbnpb4gwylpnyxovdykfy3dhk2wqmpry@ekhhe3mgqnd6>
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286stAICZmwpS
X-smtpcorp-track: r4AxlWqzS3aV.NC9BWjgScQrF.OR1giwa_WkQ
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


--VxNEXc5Vg6IlyTm+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am Wed, Aug 07, 2024 at 09:41:00PM +0000 schrieb Daniel Gomez:
> Date: Wed, 7 Aug 2024 21:41:00 +0000
> From: Daniel Gomez <da.gomez@samsung.com>
> To: Nicolas Schier <nicolas@fjasle.eu>
> CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
>  <nathan@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
>  Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
>  <rodrigo.vivi@intel.com>, Maarten Lankhorst
>  <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
>  Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com=
>,
>  Daniel Vetter <daniel@ffwll.ch>, William Hubbs <w.d.hubbs@gmail.com>,
>  Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
>  Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul Moore
>  <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>,
>  Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas
>  <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier
>  <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James Morse
>  <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui
>  Yu <yuzenghui@huawei.com>, Greg Kroah-Hartman
>  <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Nick
>  Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
>  Justin Stitt <justinstitt@google.com>, "linux-kernel@vger.kernel.org"
>  <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
>  <linux-kbuild@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
>  <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
>  <dri-devel@lists.freedesktop.org>, "speakup@linux-speakup.org"
>  <speakup@linux-speakup.org>, "selinux@vger.kernel.org"
>  <selinux@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
>  <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
>  <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
>  <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
>  <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
>  (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
>  <gost.dev@samsung.com>
> Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
>  posix_types headers
> Message-ID: <sbj3c3tlafewy2n4pylbnpb4gwylpnyxovdykfy3dhk2wqmpry@ekhhe3mgq=
nd6>
>=20
> On Wed, Aug 07, 2024 at 05:38:28PM GMT, Nicolas Schier wrote:
> > On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wro=
te:
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >=20
> > > The genheaders requires the bitsperlong.h and posix_types.h headers.
> > > To ensure these headers are found during compilation on macOS hosts,
> > > add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> > > adjustment allows the compiler to locate all necessary headers when t=
hey
> > > are not available by default on macOS.
> > >=20
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/selinux/genheaders/Makefile | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/ge=
nheaders/Makefile
> > > index 1faf7f07e8db..017149c90f8e 100644
> > > --- a/scripts/selinux/genheaders/Makefile
> > > +++ b/scripts/selinux/genheaders/Makefile
> > > @@ -2,4 +2,5 @@
> > >  hostprogs-always-y +=3D genheaders
> > >  HOST_EXTRACFLAGS +=3D \
> > >  	-I$(srctree)/include/uapi -I$(srctree)/include \
> > > -	-I$(srctree)/security/selinux/include
> > > +	-I$(srctree)/security/selinux/include \
> > > +	-I$(srctree)/usr/include
> >=20
> > 'make headers' composes the UAPI header tree in $(objtree)/usr/include.
> > So, if you build out-of-source, -I$(srctree)/usr/include will not match.
> > Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.
>=20
> The 'headers' target also deploys installs the headers in arch/$(SRCARCH)/
> include/uapi, so I've updated selinux/genheaders/Makefile to the followin=
g:
>=20
> diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genhea=
ders/Makefile
> index 1faf7f07e8db..ae1f195b6f67 100644
> --- a/scripts/selinux/genheaders/Makefile
> +++ b/scripts/selinux/genheaders/Makefile
> @@ -2,4 +2,6 @@
>  hostprogs-always-y +=3D genheaders
>  HOST_EXTRACFLAGS +=3D \
>         -I$(srctree)/include/uapi -I$(srctree)/include \
> -       -I$(srctree)/security/selinux/include
> +       -I$(srctree)/security/selinux/include \
> +       -I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
> +       -I$(objtree)/arch/$(SRCARCH)/include/uapi

SRCARCH is not derived from the host but from $(ARCH) (cp. top-level
Makefile), thus you must not use arch/$(SRCARCH)/include/* for building
host progs as this breaks cross-building (e.g. consider build Linux for
32bit m68k on a arm64 host).

>=20
> The include path -I$(objtree)/arch/$(SRCARCH)/include/generated/uapi
> enables locating the asm/types.h.
>=20
> The include path -I$(objtree)/arch/$(SRCARCH)/include/uapi enables
> locating the asm/bitsperlong.h and asm/posix_types.h.
>=20
> >=20
> > But I am suspecting that this break cross-building.
>=20
> I=E2=80=99ve tested this change on macOS with ARCH=3Darm64, as well as on=
 Debian with
> ARCH=3Darm64 and ARCH=3Dx86_64. Is it enough to just confirm that cross-b=
uilding
> still works after this change?

No, it isn't.  asm/bitsperlong.h is probably similar (enough) for current
64-bit systems, but 32-bit platforms will have different versions.
Anyway, we must not use target arch/platform-specific header files for
host progs.  If we do, it will break.

You want to use arm64 specific header files for building your arm64 host
progs, as MacOS does not provide these (thus, it's a missing build
dependency).  As this is not common (yet), such a build hack should be limi=
ted
to MacOS/Darwin only to not accidentally break other platforms.  (Do you al=
so
have MacOS/amd64 in mind?)

As written elsewhere, another approach could be to create and maintain a Li=
nux
kernel dev kit for MacOS, that delivers (fetches, downloads, generates) all
missing header files.

Kind regards,
Nicolas


--VxNEXc5Vg6IlyTm+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAma0qC4ACgkQB1IKcBYm
EmlXFA//QK4VblCu85gKzeuSZduI65fyEghlP3E7HDD3wm89ScPK97QA6E3/18Eq
KBbtW4cg56lb2YdCbv9kuIbh4xGhW9+w8lOMrTBK2CKHtVT83hO+Oyd2ZYN1F6W/
9dBu+x09VAhWc01GPCM+1518klpvgEM9E6nmTh1xRSLaIjtlGPsiNXGaUcpMO4w2
TEAs9SSczQa/vazzKdd71q3e2eTpLEYOuIi6+07Iny4nWjWFPwK60OxmeDfXe0un
zZyapckz2FVMcAujnUVd8yxoaIrhlZ5K2e9GSk9BpH3LKpoTTqIhQUYFoI9Y7tHL
RSZA5igzUTBAcSIIegyBGa5D2NzkfiNSI+MxN5hqRbZclmll5fEyvu0ej+ZJTmLC
jDATEufQxckE3a1Q1qxxuoM3keRi7LUWPu/RZnU09BNIQFZGlOquPOmIGHyR6Vux
wfCr4WHohktugmKMwhLf4g6nxrdOy5H4Rd3RskWyBz2xkYSFKnm2zoaJZCBq8D2/
v/fWGHeswRzLjWqxbPsMdFfd8QuuaYYXf4wBrG9k02eAXH1Q+dOu/MZJ4Do4mCp+
O/+FGuyln0lUjxwG80YQslhSRNjov6VlrHSXTGNHNhcUffJYXAcBABbSYg2+NCYW
4AVxeP5dRxvjQYDCraWpTSnPOvQGnKo3Jy7++TppRl4ra4DxfC0=
=UoyI
-----END PGP SIGNATURE-----

--VxNEXc5Vg6IlyTm+--
