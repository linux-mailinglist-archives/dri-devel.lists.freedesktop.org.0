Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48CA8B173
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3DF10E849;
	Wed, 16 Apr 2025 07:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/NAiUy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ED910E849;
 Wed, 16 Apr 2025 07:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EE5724A17E;
 Wed, 16 Apr 2025 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F382C4CEED;
 Wed, 16 Apr 2025 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744786831;
 bh=SsNuJ3RpS7E+2S0Ptg7xVQWifaO8YE/cOa8x5LLvIEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J/NAiUy0CsqRiLVh78VhnQz1sW+T3e/dGyEafTT/ifWafwgCuuiExr4fMRyxP4CT1
 Zyuiik8v5Asn806L1H7cMl3DUXMUnyyI16U274kE/7EOXdP+tDkXazh6F+trIvEFl4
 o+ZXVmGEly8mX4aTr/XdvAifuNssdnFB7maptVshBbQroUcGtVQCtopBcDcExgCmx8
 0QVF8Qi0KxQM7b/x8PJhrbEm1x7lTI5dNPLVwC+a/TN5lmoL6DiXuTZvKTdAAj1htT
 dePHsdE+L313jjO+hXqIP1Vm275Z/6qh1BWgXEIo5fKwnvlB/fnxAw72xzPglQkWtC
 d2xWRn98bMc1w==
Date: Wed, 16 Apr 2025 15:00:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, David Airlie
 <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <20250416150007.427f8161@sal.lan>
In-Reply-To: <432f17b785d35122753d4b210874d78ee84e1bb5.1744785773.git.mchehab+huawei@kernel.org>
References: <432f17b785d35122753d4b210874d78ee84e1bb5.1744785773.git.mchehab+huawei@kernel.org>
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

Em Wed, 16 Apr 2025 14:42:57 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> As reported by Andy, kernel-doc.py is creating a __pycache__
> directory at build time.
> 
> Disable creation of __pycache__ for the libraries used by
> kernel-doc.py, when excecuted via the build system or via
> scripts/find-unused-docs.sh.
> 
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sent a v2 with an extra patch, as this only solves the case where
the script is called from the build system.

When the script is manually called, if Python or the script is called 
without any parameters, Python JIT will still create a __pycache__
containing *.pyc files.

As we don't want to show such binaries as sources that need to be
committed, we need an extra patch adding *.pyc to .gitignore.

This is done on v2 of this.

> ---
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ed54a546bbe2..1469d64f8783 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ed05b131ed3a..bb873f9cc2aa 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
>  #
>  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
>  ifdef CONFIG_DRM_I915_WERROR
> -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
> +    cmd_checkdoc = $(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none -Werror $<
>  endif
>  
>  # header test
> diff --git a/include/drm/Makefile b/include/drm/Makefile
> index a7bd15d2803e..6088ea458f44 100644
> --- a/include/drm/Makefile
> +++ b/include/drm/Makefile
> @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
> index ee6a50e33aba..d6d397fbf917 100755
> --- a/scripts/find-unused-docs.sh
> +++ b/scripts/find-unused-docs.sh
> @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
>  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
>  	continue;
>  	fi
> -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
> +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
>  	if [[ -n "$str" ]]; then
>  	echo "$file"
>  	fi
