Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CF48CDA1A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 20:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106A10EEE6;
	Thu, 23 May 2024 18:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="CSNk1Yvj";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="WIprwJPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038F310EEE6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 18:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mqAiIL9UmsTZ5nfVp6r06fBx7paxMBf8wn1VlFeMkQE=;
 b=CSNk1Yvjxah3rkkxgpelc0VOPWIp75OPEQqWq1pcodABKvFFnSQXrVrenDn67tfY3D8higtjFf5q+
 f0TvD1Xu7CHYT9QFQsG9OcCU7x8/z4c95fh6Uf9WYi0vQ6qIaFLVX6h8lsXjJ4DbD84yaMWHR3pyp6
 GZLQ6b38p9ymFQvfMUNfPMbTSUYJx15BVomjZtwE3zJL++339XDSCo0Fk7IA9cleqdQlFI2m7eHQYN
 D2fN8Kiad80deL3bZJyVrJahjzYGWLb4MBhmBE+/PEu8u25A5abKXx2Cts49BDtJxevcGf1u14wI+b
 5KRl9Shn7wR/OMlcrYHM1Q8rTi1Kuyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=mqAiIL9UmsTZ5nfVp6r06fBx7paxMBf8wn1VlFeMkQE=;
 b=WIprwJPlFWVWsTuv+1kxtKhJKxGQvFhUAW6MY279TBYMtIaS5vQ91nOVFlbGExQxiLG2gBsvHPe9Q
 ZgCMlemCQ==
X-HalOne-ID: 10aba6c9-1934-11ef-91f6-953526d7c221
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 10aba6c9-1934-11ef-91f6-953526d7c221;
 Thu, 23 May 2024 18:41:29 +0000 (UTC)
Date: Thu, 23 May 2024 20:41:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/4] drm: enable -Wformat-truncation across the subsystem
Message-ID: <20240523184128.GA523806@ravnborg.org>
References: <cover.1716479340.git.jani.nikula@intel.com>
 <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719debc351075abc36b2573266bfd4d963361e40.1716479340.git.jani.nikula@intel.com>
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

Hi Jani,

On Thu, May 23, 2024 at 06:51:09PM +0300, Jani Nikula wrote:
> With the -Wformat-truncation warnings fixed, finish the job started in
> commit a61ddb4393ad ("drm: enable (most) W=1 warnings by default across
> the subsystem"), and enable that warning too.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

When it is enabled for all of drm then the explicit assignments here
could be dropped I think:

drivers/gpu/drm/i915/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
drivers/gpu/drm/xe/Makefile:subdir-ccflags-y += $(call cc-option, -Wformat-truncation)

Just a drive-by comment, I know this patch was mostly for the bots.

	Sam

> 
> ---
> 
> Gut feeling says there are more issues, and my configs just don't catch
> them all, but let's see what the build bots have to say. ;)
> ---
>  drivers/gpu/drm/Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 68cc9258ffc4..644613dbedda 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -16,8 +16,7 @@ subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
>  subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
>  subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
>  subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> -# FIXME: fix -Wformat-truncation warnings and uncomment
> -#subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
>  subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
>  # The following turn off the warnings enabled by -Wextra
>  ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> -- 
> 2.39.2
