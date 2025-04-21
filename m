Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC0CA9543C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 18:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916B10E098;
	Mon, 21 Apr 2025 16:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="aSwWbdmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EFD10E098;
 Mon, 21 Apr 2025 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DBF741060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1745253330; bh=gxGq9sDQzTilFhNI+sgogQzrTLgAysNYCMUBWj3Hgkk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aSwWbdmJJYHlULeQRqmIZiBkTXpcuPN9ZRV82SfV4CHb3MYZCZjYv+zeQz79Sr2GS
 9KknI8nxQs92hOToWkh4alhfHM9NZdOcXHTrfqxSnxe1M0+elhQktvbrW3mwuCmB24
 cO28qpPPqc0wEZM8RUenc5GRruiIiiTUXLTHUW7hjkOBHZwTtx/qVdXMY82k+kzvBr
 p33+deEZilo2NWQF9jXjz3aEoCdtZfho6XG//atJ+fWewga0vH3dFzkIKwXpmVSFCL
 oCeEzKDxbZ5vSChkApWLnHdkxmx5ad8KZZLLhVHLCoB+3z/k/MXsaHIZlXKxGWB/y6
 pFG8rChiQj9AQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1DBF741060;
 Mon, 21 Apr 2025 16:35:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
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
In-Reply-To: <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
Date: Mon, 21 Apr 2025 10:35:29 -0600
Message-ID: <87bjspzd4e.fsf@trenco.lwn.net>
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

> On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
>> 
>> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
>> when W=1. Due to Python's normal behavior, its JIT compiler will create
>> a bytecode and store it under scripts/lib/*/__pycache__. 
>> 
>> As one may be using O= and even having the sources on a read-only mount
>> point, disable its creation during build time.
>
> Would it be possible to properly support O= and create pyc / pycache
> inside the object/output dir?

I have to confess, I've been wondering if we should be treating the .pyc
files like we treat .o files or other intermediate products.  Rather
than trying to avoid their creation entirely, perhaps we should just be
sure they end up in the right place and are properly cleaned up...?

To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
should do the trick?

Thanks,

jon
