Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA208A9A47D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F019B10E750;
	Thu, 24 Apr 2025 07:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XcRExeXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957C110E750;
 Thu, 24 Apr 2025 07:44:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBAEF68455;
 Thu, 24 Apr 2025 07:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DF9C4CEEB;
 Thu, 24 Apr 2025 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745480697;
 bh=p5jS+ElunkUNU9UC2/Wsfzwd+rjlMSIxjzYB/zjEpSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XcRExeXoVg3gbESW04zWtSYcC/Nte9HwDkJqi5HvOq2/uXK3U0j2a/yASHWpw7Q87
 N66ABLv7e1cOGZb+GtZ1tKvjqMZT4nPFnm5YoXX6t6C+ngZC38okYT2xZIY9fw/cIZ
 /IQYjz/U1pZlMYmaGf0UYtlOAy5djD8pm4feG0mb4LeoMaVG1cqj9Omie/30bVbEMS
 59cBkYVahaRHwHMXmuLqkyqTTkFiE3bOAAdfSQ25VkSXji8UloXuNCMjCTwua23eJB
 zLzNSqQo8kp0Mj++iAPNeoiQdrlfJADiR2pmy2+rGdk7FV33jvYGUo8Rbl5w398pAh
 LXY8D+aZrUfdA==
Date: Thu, 24 Apr 2025 15:44:41 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, airlied@gmail.com,
 corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mripard@kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, rodrigo.vivi@intel.com, simona@ffwll.ch,
 tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <20250424154441.3d4aed6e@sal.lan>
In-Reply-To: <20250424152648.0979054f@sal.lan>
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
 <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
 <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
 <20250424152648.0979054f@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Em Thu, 24 Apr 2025 15:26:48 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Thu, 24 Apr 2025 11:07:05 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
>=20
> > On Wed, 23 Apr 2025 19:31:36 +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote: =20
> > >> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote: =20
> > >>> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote: =20
> > >>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes: =20
> > >=20
> > > [...]
> > >  =20
> > >>>>> Would it be possible to properly support O=3D and create pyc / py=
cache
> > >>>>> inside the object/output dir? =20
> > >>>>
> > >>>> I have to confess, I've been wondering if we should be treating th=
e .pyc
> > >>>> files like we treat .o files or other intermediate products.  Rath=
er
> > >>>> than trying to avoid their creation entirely, perhaps we should ju=
st be
> > >>>> sure they end up in the right place and are properly cleaned up...?
> > >>>>
> > >>>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPR=
EFIX
> > >>>> should do the trick? =20
> > >>>
> > >>> It's not so easy. The Python is written in a way that it thinks it =
will never
> > >>> runs object files separately from the source. Hence that variable s=
ets only
> > >>> the folder per script as _home_ for the cache. It's completely unus=
able. They
> > >>> took it wrong. It still can be _painfully_ used, but it will make M=
akefiles
> > >>> uglier. =20
> > >>
> > >> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
> > >>
> > >> For example, try:
> > >>
> > >>     export PYTHONPYCACHEPREFIX=3D"$HOME/.cache/__pycache__"
> > >>
> > >> Wouldn't it be good enough for you? =20
> > >=20
> > > Of course not. We have _many_ scripts in python in kernel and having =
a cache
> > > there for _all_ of them is simply WRONG. You never know what clashes =
can be
> > > there with two complicated enough scripts which may have same module =
names,
> > > etc.
> > >  =20
> >=20
> > Interesting...
> >=20
> > I'm suspecting you replied without having tried the setting...
> >=20
> > FYI, this is an excerpt from list of .pyc files under __pycache__ after
> > building defconfig kernel and "make htmldocs"; and running
> >=20
> > $ find . -name *.pyc" -print" under ~/.cache/__pycache__
> > ---------------------------------------------------------------------
> > ./home/.../git/linux/scripts/lib/kdoc/kdoc_files.cpython-312.pyc
> > ./home/.../git/linux/scripts/lib/kdoc/kdoc_parser.cpython-312.pyc
> > ./home/.../git/linux/scripts/lib/kdoc/kdoc_re.cpython-312.pyc
> > ./home/.../git/linux/scripts/lib/kdoc/kdoc_output.cpython-312.pyc
> > [...]
> > ./usr/lib/python3.12/xml/__init__.cpython-312.pyc
> > ./usr/lib/python3.12/xml/parsers/expat.cpython-312.pyc
> > ./usr/lib/python3.12/xml/parsers/__init__.cpython-312.pyc
> > ./usr/lib/python3.12/xml/etree/ElementPath.cpython-312.pyc
> > ./usr/lib/python3.12/xml/etree/__init__.cpython-312.pyc
> > ./usr/lib/python3.12/xml/etree/cElementTree.cpython-312.pyc
> > ./usr/lib/python3.12/xml/etree/ElementTree.cpython-312.pyc
> > ./usr/lib/python3.12/mimetypes.cpython-312.pyc
> > [...]
> > ./usr/lib/python3/dist-packages/sphinx/deprecation.cpython-312.pyc
> > ./usr/lib/python3/dist-packages/sphinx/highlighting.cpython-312.pyc
> > ./usr/lib/python3/dist-packages/sphinx/pycode/ast.cpython-312.pyc
> > ./usr/lib/python3/dist-packages/sphinx/pycode/__init__.cpython-312.pyc
> > ./usr/lib/python3/dist-packages/sphinx/pycode/parser.cpython-312.pyc
> > ./usr/lib/python3/dist-packages/sphinx/config.cpython-312.pyc
> > [...]
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/deprecation.c=
python-312.pyc
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/highlighting.=
cpython-312.pyc
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/ast.cp=
ython-312.pyc
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/__init=
__.cpython-312.pyc
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/parser=
.cpython-312.pyc
> > ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/config.cpytho=
n-312.pyc
> > [...]
> > -----------------------------------------------------------------------=
--
> >=20
> > As you see, each of them are stored at a path corresponding to its orig=
inal
> > .py file.  The final part of the excerpt came from me running in-develo=
pment
> > Sphinx in a python venv with the same PYTHONPYCACHEPREFIX setting.
> >=20
> > I don't see any possibility of clashes as you mentioned above,
>=20
> I didn't test it, but it sounds good enough for me. Could you please send
> us a patch on the top of:
>=20
> 	https://lore.kernel.org/linux-doc/cover.1745453655.git.mchehab+huawei@ke=
rnel.org/T/#t
>=20
> for us to test it? The idea is to set PYTHONPYCACHEPREFIX only when O=3D
> is used.

Heh, I did a quick test here with Sphinx build. It Worked!

Patch is after my patch series, and it is just for Sphinx build.

We need something similar for the other places where the script is
used.

Regards,
Mauro

---

[PATCH] docs: Makefile: store __pycache__ at the output directory

Instead of blocking creation of *.pyc cache, store python
cache under Documentation/output/__pycache__

Documentation/output/__pycache__/
=E2=94=9C=E2=94=80=E2=94=80 new_devel
=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 v4l
=E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 docs
=E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 Documentation
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 sphinx
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 automarkup.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 kernel_abi.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 kerneldoc.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 kernel_feat.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 kernel_include.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 kfigure.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 load_config.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 maintainers_include.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=
=E2=94=80 rstFlatTable.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=
=E2=94=80 translations.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0         =E2=94=94=E2=94=80=E2=94=80 scripts
=E2=94=82=C2=A0=C2=A0             =E2=94=94=E2=94=80=E2=94=80 lib
=E2=94=82=C2=A0=C2=A0                 =E2=94=9C=E2=94=80=E2=94=80 abi
=E2=94=82=C2=A0=C2=A0                 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 abi_parser.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0                 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=
=80=E2=94=80 helpers.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0                 =E2=94=94=E2=94=80=E2=94=80 kdoc
=E2=94=82=C2=A0=C2=A0                     =E2=94=9C=E2=94=80=E2=94=80 kdoc_=
files.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0                     =E2=94=9C=E2=94=80=E2=94=80 kdoc_=
output.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0                     =E2=94=9C=E2=94=80=E2=94=80 kdoc_=
parser.cpython-313.pyc
=E2=94=82=C2=A0=C2=A0                     =E2=94=94=E2=94=80=E2=94=80 kdoc_=
re.cpython-313.pyc
=E2=94=94=E2=94=80=E2=94=80 usr
    =E2=94=9C=E2=94=80=E2=94=80 lib
    =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 python3.13
    =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 site-packages
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 abrt_exceptio=
n_handler3.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 alabaster
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 babel
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 core.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 dates.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 localedata.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 localtime
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _fallback.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _helpers.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 _unix.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 messages
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 catalog.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 mofile.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 plurals.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 pofile.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 plural.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 util.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 chardet
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 big5freq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 big5prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 chardistribution.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 charsetgroupprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 charsetprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 codingstatemachine.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 codingstatemachinedict.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 cp949prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 enums.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 escprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 escsm.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 eucjpprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 euckrfreq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 euckrprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 euctwfreq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 euctwprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 gb2312freq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 gb2312prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 hebrewprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 jisfreq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 johabfreq.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 johabprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 jpcntx.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langbulgarianmodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langgreekmodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langhebrewmodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langrussianmodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langthaimodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 langturkishmodel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 latin1prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 macromanprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 mbcharsetprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 mbcsgroupprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 mbcssm.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 resultdict.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 sbcharsetprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 sbcsgroupprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 sjisprober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 universaldetector.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utf1632prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utf8prober.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 version.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 charset_norma=
lizer
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 api.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 cd.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 constant.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 legacy.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 md.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 models.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 version.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 defusedxml
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 common.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ElementTree.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 _distutils_ha=
ck
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 docutils
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 core.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 frontend.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 io.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 languages
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 en.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 nodes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 parsers
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 rst
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=9C=E2=94=80=E2=94=80 directives
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 admonitions.cpyth=
on-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 body.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 images.cpython-31=
3.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 misc.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 parts.cpython-313=
.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 tables.cpython-31=
3.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=9C=E2=94=80=E2=94=80 languages
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 en.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=9C=E2=94=80=E2=94=80 roles.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=9C=E2=94=80=E2=94=80 states.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=94=E2=94=80=E2=94=80 tableparser.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 readers
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 doctree.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 standalone.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 statemachine.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 transforms
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 frontmatter.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 misc.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 parts.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 references.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 universal.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 writer_aux.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utils
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 code_analyzer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 error_reporting.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 math
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 latex2mathml.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 math2html.cpython-313=
.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 tex2mathml_extern.cpy=
thon-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 tex2unichar.cpython-3=
13.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 unichar2tex.cpython-3=
13.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 punctuation_chars.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 roman.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 smartquotes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 urischemes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 writers
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 docutils_xml.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 html4css1
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=
=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 html5_polyglot
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=
=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 _html_base.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 latex2e
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=82=C2=A0=
=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=
=80=E2=94=80 manpage.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 idna
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 core.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 idnadata.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 intranges.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 package_data.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 imagesize
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 imagesize.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 jinja2
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 async_utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 bccache.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 compiler.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 defaults.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 environment.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 exceptions.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ext.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 filters.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _identifier.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 idtracking.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 lexer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 loaders.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 nodes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 optimizer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 parser.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 runtime.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 sandbox.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 tests.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 visitor.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 packaging
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _elffile.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _manylinux.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _musllinux.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 specifiers.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _structures.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 tags.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 version.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 pygments
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 filter.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 filters
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 formatter.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 formatters
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 html.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 latex.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 _mapping.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 lexer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 lexers
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 c_cpp.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _css_builtins.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 css.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 data.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 html.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 javascript.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 jvm.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _lilypond_builtins.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 lilypond.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 lisp.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _mapping.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 markup.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 python.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 ruby.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _scheme_builtins.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 special.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 modeline.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 plugin.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 regexopt.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 style.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 styles
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 friendly.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 _mapping.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 token.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 unistring.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 util.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 pytz
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 exceptions.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 lazy.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 tzfile.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 tzinfo.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 requests
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 adapters.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 api.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 auth.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 certs.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 compat.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 cookies.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 exceptions.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 hooks.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _internal_utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 models.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 packages.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 sessions.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 status_codes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 structures.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 utils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __version__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 snowballstemm=
er
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 among.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 arabic_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 armenian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 basestemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 basque_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 catalan_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 danish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 dutch_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 english_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 finnish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 french_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 german_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 greek_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 hindi_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 hungarian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 indonesian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 irish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 italian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 lithuanian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 nepali_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 norwegian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 porter_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 portuguese_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 romanian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 russian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 serbian_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 spanish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 swedish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 tamil_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 turkish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 yiddish_stemmer.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 socks.cpython=
-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 sphinx
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 addnodes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 application.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 builders
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 changes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 dirhtml.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 dummy.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 epub3.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _epub_base.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 gettext.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 html
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _assets.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 transforms.cpython-31=
3.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 latex
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 constants.cpython-313=
.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 nodes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 theming.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 transforms.cpython-31=
3.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 util.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 linkcheck.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 manpage.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 singlehtml.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 texinfo.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 text.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 xml.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 cmd
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 build.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 config.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 deprecation.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 directives
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 code.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 other.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 patches.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 domains
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 c
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _ast.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _ids.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _parser.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _symbol.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 changeset.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 citation.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 cpp
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _ast.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _ids.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _parser.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _symbol.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 index.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 javascript.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 math.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 python
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _annotations.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _object.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 rst.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 std
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0     =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 environment
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 adapters
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 asset.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 indexentries.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 toctree.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 collectors
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 asset.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 dependencies.cpython-=
313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 metadata.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 title.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 toctree.cpython-313.p=
yc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 errors.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 events.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ext
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 autosectionlabel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 doctest.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 ifconfig.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 imgmath.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 mathjax.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 extension.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 highlighting.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 io.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 jinja2glue.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 locale
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 parsers.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 project.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 pycode
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 ast.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 parser.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 pygments_styles.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 registry.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 roles.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 search
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 en.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 theming.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 transforms
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 compact_bullet_list.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 i18n.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 post_transforms
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 code.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 images.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.=
pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 references.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 util
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 build_phase.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 cfamily.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 console.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 display.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 docfields.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 docutils.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 exceptions.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 fileutil.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 http_date.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 i18n.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 images.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 index_entries.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 inspect.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 inventory.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _io.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 logging.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 matching.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 math.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 nodes.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 osutil.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 parallel.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 _pathlib.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 png.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 requests.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 rst.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 tags.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 template.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=9C=E2=94=80=E2=94=80 texescape.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 typing.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 versioning.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 writers
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 html5.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 html.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 latex.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 manpage.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 texinfo.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 text.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=
=80=E2=94=80 xml.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=9C=E2=94=80=E2=94=80 sphinxcontrib
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 devhelp
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 htmlhelp
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 qthelp
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=
=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 serializinghtml
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=
=80=E2=94=80 jsonimpl.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0         =E2=94=94=E2=94=80=E2=94=80 urllib3
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 _collecti=
ons.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 connectio=
n.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 connectio=
npool.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 contrib
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 _appengine_environ.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=
=80=E2=94=80 socks.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 exception=
s.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 fields.cp=
ython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 filepost.=
cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 __init__.=
cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 packages
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=
=80=E2=94=80 six.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 poolmanag=
er.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 request.c=
python-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 response.=
cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=9C=E2=94=80=E2=94=80 util
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 connection.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 __init__.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 proxy.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 queue.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 request.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 response.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 retry.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 ssl_.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 ssl_match_hostname.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 ssltransport.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 timeout.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=
=80=E2=94=80 url.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=
=80=E2=94=80 wait.cpython-313.pyc
    =E2=94=82=C2=A0=C2=A0             =E2=94=94=E2=94=80=E2=94=80 _version.=
cpython-313.pyc
    =E2=94=94=E2=94=80=E2=94=80 lib64
        =E2=94=94=E2=94=80=E2=94=80 python3.13
            =E2=94=9C=E2=94=80=E2=94=80 argparse.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 ast.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 base64.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 bdb.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 bisect.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 bz2.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 calendar.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 cmd.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 code.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 codeop.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 collections
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _colorize.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _compat_pickle.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _compression.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 configparser.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 contextlib.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 contextvars.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 copy.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 copyreg.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 csv.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 dataclasses.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 datetime.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 decimal.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 difflib.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 dis.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 doctest.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 email
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 base64mime.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 charset.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _encoded_word=
s.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 encoders.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 errors.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 feedparser.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 header.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 iterators.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 message.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _parseaddr.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 parser.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _policybase.c=
python-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 quoprimime.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 utils.cpython=
-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 encodings
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 aliases.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 idna.cpython-=
313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 unicode_escap=
e.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 utf_8.cpython=
-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 utf_8_sig.cpy=
thon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 enum.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 filecmp.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 fnmatch.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 functools.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 __future__.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 gettext.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 glob.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 gzip.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 hashlib.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 heapq.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 hmac.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 html
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 entities.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 parser.cpytho=
n-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 http
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 client.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cookiejar.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 cookies.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 importlib
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _abc.cpython-=
313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 abc.cpython-3=
13.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 metadata
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _collections.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _functools.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 _itertools.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 _meta.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 resources
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 abc.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _common.c=
python-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _function=
al.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 __init__.=
cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 inspect.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 ipaddress.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 json
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 decoder.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 encoder.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 scanner.cpyth=
on-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 keyword.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 linecache.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 locale.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 logging
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 handlers.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 lzma.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _markupbase.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 mimetypes.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 multiprocessing
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 connection.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 context.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 popen_fork.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 process.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 reduction.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 util.cpython-=
313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 numbers.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 opcode.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _opcode_metadata.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 operator.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 optparse.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 pathlib
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _abc.cpython-=
313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _local.cpytho=
n-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 pdb.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 pickle.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 platform.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 pprint.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 queue.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 quopri.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 random.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 re
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _casefix.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _compiler.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _constants.cp=
ython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _parser.cpyth=
on-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 reprlib.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 rlcompleter.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 selectors.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 shutil.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 signal.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 site-packages
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 markupsafe
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 PIL
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _binary.c=
python-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _deprecat=
e.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ExifTags.=
cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 Image.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 ImageMode=
.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 __init__.=
cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 TiffTags.=
cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _typing.c=
python-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _util.cpy=
thon-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 _version.=
cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 socket.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 ssl.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 string.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 stringprep.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 struct.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 subprocess.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 sysconfig
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _sysconfigdata__linux_x86_64-linux-=
gnu.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 tempfile.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 textwrap.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 threading.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 token.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 tokenize.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 tomllib
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _parser.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 _re.cpython-3=
13.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _types.cpytho=
n-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 traceback.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 types.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 typing.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 unittest
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 case.cpython-=
313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 loader.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 main.cpython-=
313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 result.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 runner.cpytho=
n-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 signals.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 suite.cpython=
-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 util.cpython-=
313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 urllib
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 error.cpython=
-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 parse.cpython=
-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 request.cpyth=
on-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 response.cpyt=
hon-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 uuid.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 warnings.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 weakref.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 _weakrefset.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 xml
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 dom
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 domreg.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 minicompat.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 minidom.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 NodeFilter.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 xmlbuilder.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 etree
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ElementPath.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 ElementTree.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 parsers
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=
=E2=94=80 expat.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=
=E2=94=80 __init__.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 sax
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 _exceptio=
ns.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 expatread=
er.cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 handler.c=
python-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 __init__.=
cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 saxutils.=
cpython-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 xmlreader=
.cpython-313.pyc
            =E2=94=9C=E2=94=80=E2=94=80 zipfile
            =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 __init__.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 _path
            =E2=94=82=C2=A0=C2=A0     =E2=94=9C=E2=94=80=E2=94=80 glob.cpyt=
hon-313.pyc
            =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=94=80 __init__.=
cpython-313.pyc
            =E2=94=94=E2=94=80=E2=94=80 zoneinfo
                =E2=94=9C=E2=94=80=E2=94=80 _common.cpython-313.pyc
                =E2=94=9C=E2=94=80=E2=94=80 __init__.cpython-313.pyc
                =E2=94=94=E2=94=80=E2=94=80 _tzpath.cpython-313.pyc

109 directories, 634 files

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 8c1f6a3dfc44..59e95ebae786 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -84,7 +84,7 @@ loop_cmd =3D $(echo-cmd) $(cmd_$(1)) || exit;
=20
 quiet_cmd_sphinx =3D SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx =3D $(MAKE) BUILDDIR=3D$(abspath $(BUILDDIR)) $(build)=3D=
Documentation/userspace-api/media $2 && \
-	PYTHONDONTWRITEBYTECODE=3D1 \
+	PYTHONPYCACHEPREFIX=3D$(abspath $(BUILDDIR)/__pycache__) \
 	BUILDDIR=3D$(abspath $(BUILDDIR)) SPHINX_CONF=3D$(abspath $(src)/$5/$(SPH=
INX_CONF)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
 	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \



