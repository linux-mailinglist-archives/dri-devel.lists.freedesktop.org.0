Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08BAA99D07
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 02:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6898B10E05E;
	Thu, 24 Apr 2025 00:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GnazM4dL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7E10E05E;
 Thu, 24 Apr 2025 00:31:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0445B5C5456;
 Thu, 24 Apr 2025 00:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39655C4CEE2;
 Thu, 24 Apr 2025 00:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745454699;
 bh=Ga4t6ugV8zqmuUfvWiT3IWeSKoulLQekoUS3Y/ImDnw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GnazM4dLMIjk4TycpzjmVcI8buSnuluUwvELckUC+JcLXF4FJp9NN8Q19dYGaAKfh
 F6nSySL6sJVbyKsO3wEAjDckE2Mu4HwUunCv23iHZE4G2cACYXkJtypWqXGk2tb3FV
 VgwLCTDQbAg2u2Vxp5403v3d/v8XhUSqJ2pkZJP6aImJQJ2m2gk253fpguC1wF1RRH
 IWrJ2vvM1zyCur3ESuqbHIoib7LW04pNhuqrMoNOPy3D+d6iCUVIrWsVPaSsFX53/U
 KSCffp0OUuZG37aY5Pvih6Z/dS4fwnZWXaeUdDCkxGOCmRZF7tiCzi8q3H8Ivoh1Fu
 mXhAzMRnlNZTw==
Date: Thu, 24 Apr 2025 08:31:25 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <20250424083125.1c8a0d24@sal.lan>
In-Reply-To: <87bjspzd4e.fsf@trenco.lwn.net>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
 <87bjspzd4e.fsf@trenco.lwn.net>
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

Em Mon, 21 Apr 2025 10:35:29 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
> 
> > On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:  
> >> 
> >> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> >> when W=1. Due to Python's normal behavior, its JIT compiler will create
> >> a bytecode and store it under scripts/lib/*/__pycache__. 
> >> 
> >> As one may be using O= and even having the sources on a read-only mount
> >> point, disable its creation during build time.  
> >
> > Would it be possible to properly support O= and create pyc / pycache
> > inside the object/output dir?  
> 
> I have to confess, I've been wondering if we should be treating the .pyc
> files like we treat .o files or other intermediate products.  Rather
> than trying to avoid their creation entirely, perhaps we should just be
> sure they end up in the right place and are properly cleaned up...?

I sent a v4 of the series disabling *.pyc creation, basically placing
*.pyc at the right place on .gitignore.

That's said, I agree that the best would be to use PYTHONPYCACHEPREFIX,
placing the intermediate products altogether with O= results. There is
however something we need to deal with. To follow our building system
to the letter, if we have *.py files at scripts/lib/kdoc, the intermediate
files should be at: either:

	- {outdir}/scripts/lib/kdoc; or: 
	- {outdir}/scripts/lib/kdoc/__pycache__ 

The same shall happen for all other places including Documentation/sphinx.
In the specific case of Sphinx extensions, it would mean that it would
produce *.pyc for both scripts/lib/*/*.py and Documentation/sphinx.
No idea how to make Python to do that without doing some horrible tricks.

An alternate approach would be to store all of them at the same place, like:

	- {outdir}/__pycache__ 

The problem is that, if we end having two scripts with the same name, and
using PYTHONPYCACHEPREFIX would place both of them at the same place, we'll
have troubles.

IMO, let's apply this series first, and then see if we can replace patch 3
with another one using PYTHONPYCACHEPREFIX, after we're sure that there's
a way for it to do the right thing.

> 
> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> should do the trick?

Regards,
Mauro
