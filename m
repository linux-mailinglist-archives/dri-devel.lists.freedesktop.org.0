Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C43C3B9CEE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155D89BF6;
	Fri,  2 Jul 2021 07:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021C789BF6;
 Fri,  2 Jul 2021 07:30:04 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id x20so12085017ljc.5;
 Fri, 02 Jul 2021 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=TWhi8KglLJtv9oqwrI8H9D+50iU/laImGT26SNbtqvw=;
 b=iPyLEY7Qi08/Y49Lezu2hVfXucVhejhGYVePr6VxFYLT32EjIamkC+NC4Er7tXTcsz
 WCwzZnfTRUEi0G9gML0VfIgmEgKsr+aDbaD3QBCN7vyoAC7hMPFntF2DD20Mdq7J4j/M
 1R9ROotYbQes2jGU72AlJU+Fu8fZljDKqfme1chvJOULWjJtQ6TPfhiAdh0jfuAEXCzd
 lVCwhoQevzPJtYMAeWMKDWeDOaL95220+I4i9jWerJ6CGBRjocCNHzIUnBwzYBquruuM
 vf27PwiRtnx/l96EA+3FJ+6ATIzsvBh0ZVIaBBwZn9aA6zS4dSWf2GmWvgqbYRodG5ij
 KDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=TWhi8KglLJtv9oqwrI8H9D+50iU/laImGT26SNbtqvw=;
 b=PVWjUOx1rTFegI+XjxFKLtI6oV5h4aSLohnnJKaae47W926Hr4M0R3eCWMGRL+S5OX
 OOo/cEeZ961cMSKoo3aFcUZXiyuYYtF5nfSNiy1yUkfotTC5Orce0ZAsBbniHLPLC8JJ
 vnGiUv8O/wjof//My3BOT9xqE2yz0lhkweQdFY1a2wcEwquIdhKlNo26tIi3+7FnMI2U
 XJxMWRpPfRf7vskk7Jk21ZAsF8vHZf423qsMd55NerlvWfgH3RoihMj90K16DfIX888b
 KlP07JVinq4Ptgp8oxcTasqyp/I8CjZ78Arc+iJhRtXlnyFA2UJaigJ+1g0OjiOYO7rf
 rQ+w==
X-Gm-Message-State: AOAM532gr5kPQ1YTKvQtP4wpE/BB6Q2Nmdgk06TJKEGyKgCKSFI9aHUT
 2InxUHQRCKXvW5rnDO8o3WU=
X-Google-Smtp-Source: ABdhPJyIEj8Oye4mE6nJFkHr9iz0uW8EyCzashiCWQwQR4ZCxs/VMeDG3i1spyAN+SVZe6iMVS3yOQ==
X-Received: by 2002:a2e:9cf:: with SMTP id 198mr2775211ljj.183.1625211003178; 
 Fri, 02 Jul 2021 00:30:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q3sm189333lfg.178.2021.07.02.00.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 00:30:02 -0700 (PDT)
Date: Fri, 2 Jul 2021 10:29:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 47/47] drm/i915/guc: Unblock GuC submission
 on Gen11+
Message-ID: <20210702102944.3a8c4915@eldfell>
In-Reply-To: <CAKMK7uH1svoSEGa=sv+BsU4_BMou2sEJQWddQgy1XDMYtz7-Dw@mail.gmail.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-48-matthew.brost@intel.com>
 <88cbe963-7188-f4ae-5acf-01a80bd2fe25@free.fr>
 <05e1d462-57ae-888a-888c-3ad486150821@intel.com>
 <20210701111410.3fc6551e@eldfell>
 <050296b9-8958-353a-9f76-699bfbafa1c1@free.fr>
 <CAKMK7uH1svoSEGa=sv+BsU4_BMou2sEJQWddQgy1XDMYtz7-Dw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FEJ8elAyx5i+NLnZP4vKY3D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/FEJ8elAyx5i+NLnZP4vKY3D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Jul 2021 21:28:06 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Jul 1, 2021 at 8:27 PM Martin Peres <martin.peres@free.fr> wrote:
> >
> > On 01/07/2021 11:14, Pekka Paalanen wrote: =20
> > > On Wed, 30 Jun 2021 11:58:25 -0700
> > > John Harrison <john.c.harrison@intel.com> wrote:
> > > =20
> > >> On 6/30/2021 01:22, Martin Peres wrote: =20
> > >>> On 24/06/2021 10:05, Matthew Brost wrote: =20
> > >>>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > >>>>
> > >>>> Unblock GuC submission on Gen11+ platforms.
> > >>>>
> > >>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel=
.com>
> > >>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >>>> ---
> > >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  1 +
> > >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 ++++++++
> > >>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h |  3 +--
> > >>>>    drivers/gpu/drm/i915/gt/uc/intel_uc.c             | 14 ++++++++=
+-----
> > >>>>    4 files changed, 19 insertions(+), 7 deletions(-)
> > >>>> =20
> > >
> > > ...
> > > =20
> > >>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > >>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > >>>> index 7a69c3c027e9..61be0aa81492 100644
> > >>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > >>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > >>>> @@ -34,8 +34,15 @@ static void uc_expand_default_options(struct
> > >>>> intel_uc *uc)
> > >>>>            return;
> > >>>>        }
> > >>>>    -    /* Default: enable HuC authentication only */
> > >>>> -    i915->params.enable_guc =3D ENABLE_GUC_LOAD_HUC;
> > >>>> +    /* Intermediate platforms are HuC authentication only */
> > >>>> +    if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> > >>>> +        drm_dbg(&i915->drm, "Disabling GuC only due to old
> > >>>> platform\n"); =20
> > >>>
> > >>> This comment does not seem accurate, given that DG1 is barely out, =
and
> > >>> ADL is not out yet. How about:
> > >>>
> > >>> "Disabling GuC on untested platforms"?
> > >>> =20
> > >> Just because something is not in the shops yet does not mean it is n=
ew.
> > >> Technology is always obsolete by the time it goes on sale. =20
> > >
> > > That is a very good reason to not use terminology like "new", "old",
> > > "current", "modern" etc. at all.
> > >
> > > End users like me definitely do not share your interpretation of "old=
". =20
> >
> > Yep, old and new is relative. In the end, what matters is the validation
> > effort, which is why I was proposing "untested platforms".
> >
> > Also, remember that you are not writing these messages for Intel
> > engineers, but instead are writing for Linux *users*. =20
>=20
> It's drm_dbg. Users don't read this stuff, at least not users with no
> clue what the driver does and stuff like that.

If I had a problem, I would read it, and I have no clue what anything
of that is.


Thanks,
pq

--Sig_/FEJ8elAyx5i+NLnZP4vKY3D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDewGgACgkQI1/ltBGq
qqfoSA/9GxjgO6muHD9qo9dTTDgkOZMyBoyAGW0jabJVFPyu/z1irqFfUlH9UG7J
q4bGbLMBQsFMNAWmNKx4NJN9MsQRIQimEGrIoCjIiHUzotnN9INreWdVN7Tt+0U8
YjI19NYiEz8Qu8wpYaliP8wA8cNFTVo3wmAJLUaFpD1pHlgjtNZOX+rU20ZMFPk5
itbLypossKM5bUMwQrclGFiT/PhQP+ri4jG+5uc4GQDp4AqFBU2UbZsiRjAFI/+O
RGZmfKE2jOdC36OLuNQR92bv0nRw4ey+gBkAYTCtl2879E6uXHvroLWTu8wgLZG7
rI5qsuIqauqArft6JZ825lqwKq6LDVTZ1lsNSC+AZ1CIQ+VKbHO47quZWsYw3bLS
9u/o0RyJrYsBG7CaHfhsKpj6cXC60KyvFq7BrjDfIeeMVEz6SlEiGDu9hCOYJckR
RoR8R3fw++bUYHQjFI8u6dRfohJjFW+I4RaS4ndZS5FmSMFCWM8mZz1nz+Zki1tv
cIZPk0LCpSBrIJlx2l9sPn8cAnb//L4WQb8lsHQIH5ET4gr+aKDnkV/IOVbQHMi8
mP4o1nssE+uutcjeAa+wqlZeiRrCeU3YA1IUiRf/3WEn4xlHO70Tzb6aOKrzeaON
l1R1CtLuASpybi90HKEPYCpJwBwrMlFlVl2dmRvAJoz45mGG6WI=
=t4oW
-----END PGP SIGNATURE-----

--Sig_/FEJ8elAyx5i+NLnZP4vKY3D--
