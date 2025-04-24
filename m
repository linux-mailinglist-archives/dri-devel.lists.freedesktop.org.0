Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEEA9A3A0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADD010E74D;
	Thu, 24 Apr 2025 07:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oL+NF4vP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D3D10E74B;
 Thu, 24 Apr 2025 07:27:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4463A4A437;
 Thu, 24 Apr 2025 07:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D19C4CEEC;
 Thu, 24 Apr 2025 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745479622;
 bh=UzTTywv21QkSKN0J9rFNF6MdzYkdUj2PWG2i9JPpbJI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oL+NF4vPAeygYdeRK6B0zGroR1+ZzdMuW8A/wrR72IaqgQQ4hTvPrbxFr+uIPrOYP
 x/rpvHNqNGaZreLngZH7dAoZVcOCwln7cUyCXM2azejQmZ5UydYeb70vh8xvYvgynr
 iX/cvpZ825CzTLTV2thwUXWOEtl8iIiGqh4WZpIRh47x2iMlkBv4CewAMqmIbwyGjy
 BLV2zSVD19WlVLTay+6enqcTnMZGXk2FDSaW7edkP1WMnnswrYBZSmHa3A+gXJq91f
 nnq3YH0Oe+3gf+/InN1dBbVUNUUohmEyNyfqx3QPyQzOsd/6FPhMC2uLca+AkosVUz
 eKEtm8cAcQ4gg==
Date: Thu, 24 Apr 2025 15:26:48 +0800
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
Message-ID: <20250424152648.0979054f@sal.lan>
In-Reply-To: <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
 <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
 <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Em Thu, 24 Apr 2025 11:07:05 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Wed, 23 Apr 2025 19:31:36 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:  
> >> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:  
> >>> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:  
> >>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:  
> > 
> > [...]
> >   
> >>>>> Would it be possible to properly support O= and create pyc / pycache
> >>>>> inside the object/output dir?  
> >>>>
> >>>> I have to confess, I've been wondering if we should be treating the .pyc
> >>>> files like we treat .o files or other intermediate products.  Rather
> >>>> than trying to avoid their creation entirely, perhaps we should just be
> >>>> sure they end up in the right place and are properly cleaned up...?
> >>>>
> >>>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> >>>> should do the trick?  
> >>>
> >>> It's not so easy. The Python is written in a way that it thinks it will never
> >>> runs object files separately from the source. Hence that variable sets only
> >>> the folder per script as _home_ for the cache. It's completely unusable. They
> >>> took it wrong. It still can be _painfully_ used, but it will make Makefiles
> >>> uglier.  
> >>
> >> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
> >>
> >> For example, try:
> >>
> >>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
> >>
> >> Wouldn't it be good enough for you?  
> > 
> > Of course not. We have _many_ scripts in python in kernel and having a cache
> > there for _all_ of them is simply WRONG. You never know what clashes can be
> > there with two complicated enough scripts which may have same module names,
> > etc.
> >   
> 
> Interesting...
> 
> I'm suspecting you replied without having tried the setting...
> 
> FYI, this is an excerpt from list of .pyc files under __pycache__ after
> building defconfig kernel and "make htmldocs"; and running
> 
> $ find . -name *.pyc" -print" under ~/.cache/__pycache__
> ---------------------------------------------------------------------
> ./home/.../git/linux/scripts/lib/kdoc/kdoc_files.cpython-312.pyc
> ./home/.../git/linux/scripts/lib/kdoc/kdoc_parser.cpython-312.pyc
> ./home/.../git/linux/scripts/lib/kdoc/kdoc_re.cpython-312.pyc
> ./home/.../git/linux/scripts/lib/kdoc/kdoc_output.cpython-312.pyc
> [...]
> ./usr/lib/python3.12/xml/__init__.cpython-312.pyc
> ./usr/lib/python3.12/xml/parsers/expat.cpython-312.pyc
> ./usr/lib/python3.12/xml/parsers/__init__.cpython-312.pyc
> ./usr/lib/python3.12/xml/etree/ElementPath.cpython-312.pyc
> ./usr/lib/python3.12/xml/etree/__init__.cpython-312.pyc
> ./usr/lib/python3.12/xml/etree/cElementTree.cpython-312.pyc
> ./usr/lib/python3.12/xml/etree/ElementTree.cpython-312.pyc
> ./usr/lib/python3.12/mimetypes.cpython-312.pyc
> [...]
> ./usr/lib/python3/dist-packages/sphinx/deprecation.cpython-312.pyc
> ./usr/lib/python3/dist-packages/sphinx/highlighting.cpython-312.pyc
> ./usr/lib/python3/dist-packages/sphinx/pycode/ast.cpython-312.pyc
> ./usr/lib/python3/dist-packages/sphinx/pycode/__init__.cpython-312.pyc
> ./usr/lib/python3/dist-packages/sphinx/pycode/parser.cpython-312.pyc
> ./usr/lib/python3/dist-packages/sphinx/config.cpython-312.pyc
> [...]
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/deprecation.cpython-312.pyc
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/highlighting.cpython-312.pyc
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/ast.cpython-312.pyc
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/__init__.cpython-312.pyc
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/pycode/parser.cpython-312.pyc
> ./home/.../sphinx-WIP/lib/python3.12/site-packages/sphinx/config.cpython-312.pyc
> [...]
> -------------------------------------------------------------------------
> 
> As you see, each of them are stored at a path corresponding to its original
> .py file.  The final part of the excerpt came from me running in-development
> Sphinx in a python venv with the same PYTHONPYCACHEPREFIX setting.
> 
> I don't see any possibility of clashes as you mentioned above,

I didn't test it, but it sounds good enough for me. Could you please send
us a patch on the top of:

	https://lore.kernel.org/linux-doc/cover.1745453655.git.mchehab+huawei@kernel.org/T/#t

for us to test it? The idea is to set PYTHONPYCACHEPREFIX only when O=
is used.

Regards,
Mauro
