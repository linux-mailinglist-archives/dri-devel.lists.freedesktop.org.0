Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D328A9B3AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 18:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 243BF10E44B;
	Thu, 24 Apr 2025 16:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="LBn4GPYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A0D10E44B;
 Thu, 24 Apr 2025 16:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C94141062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1745511555; bh=X1RVPsXPN4ul2u8BOsbJ4LQIS55aq/P6e52DgvXJLwA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LBn4GPYhE9zxMOlt/nhNIQpnavWp6nkhJyBG3cBRGWCHmuqSiRWARvjF2hgMuAzHu
 /wK2biBJNp0tHH7Es0qNleFin5GAKuG/kO5bkq/EieucPv06tGud9ThbSjmbHi1uSD
 HtJW1Lm199zBh7oa+QZz4m4WsvakLw4ttrpyYY2TytsrBlLw+P5y4zdZJ9wLsVsYkq
 mil5aVf7Azg23+85qD6RzyyBwISda6PRIwSQ+1INau8EEpsWvXVMRjAPN4DoLsQfqw
 BNPfP1pD7TDnP4n5M+H07F7iXDihtojJaTzanyrAtLa24vX2oqgENqOtp3U/RIpC5b
 zma+akQALvQeA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7C94141062;
 Thu, 24 Apr 2025 16:19:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Date: Thu, 24 Apr 2025 10:19:14 -0600
Message-ID: <87v7qtzg59.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
>
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
>
> This series contain 4 patches:
>
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

I've applied the set, thanks.

jon
