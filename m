Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B100A70A52
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 20:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5171110E5E2;
	Tue, 25 Mar 2025 19:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u09sutxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D81410E5E1;
 Tue, 25 Mar 2025 19:25:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7957343F92;
 Tue, 25 Mar 2025 19:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F170C4CEE8;
 Tue, 25 Mar 2025 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742930715;
 bh=gWkyMtHS0xcBwH8pzvQMA99qjRWL1D1RwXbikwYpbbQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=u09sutxWpIKsjUQ+MH69yUowYtWZxZ4KGn3wLnw2xE7v6LvUD3MAoZ2hewgTTWe63
 mHH3gj2ujyiTyWwt+r1P4IkG2/xiKiB6aQrZAXbIayd49rgkfOkX/McMC8hCKOXQ1x
 cvEnMZRvBkWfWFWbYGE9iig2CQ886gNfIsYhBZYEMvxWrXdZocp+KQOsu+FLqIzqbS
 IW/Z+eqdXx8NJ70r2DBL+IUinTSJ/oqgO0lQko7jQDf/0T+znkW2bGXGuBS6vCFnmI
 6tyJWdCoEdHWsXRGCTmRCWNcP0vGV2zrpa4T/w+1ObsWUYMoRdZ3+UPy/7MIHQYvje
 aDBUBdfEP0a9Q==
Date: Tue, 25 Mar 2025 12:25:12 -0700
From: Kees Cook <kees@kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Add __nonstring annotations for
 unterminated strings
Message-ID: <202503251224.F128AE971@keescook>
References: <20250310222355.work.417-kees@kernel.org>
 <01070195c306db7f-9f28efdd-9456-4db3-b6c6-343298bd571b-000000@eu-central-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01070195c306db7f-9f28efdd-9456-4db3-b6c6-343298bd571b-000000@eu-central-1.amazonses.com>
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

On Sun, Mar 23, 2025 at 12:42:41PM +0000, Damian Tometzki wrote:
> On Mon, 10. Mar 15:23, Kees Cook wrote:
> > When a character array without a terminating NUL character has a static
> > initializer, GCC 15's -Wunterminated-string-initialization will only
> > warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
> > with __nonstring to and correctly identify the char array as "not a C
> > string" and thereby eliminate the warning.
> > 
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: intel-gvt-dev@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gvt/opregion.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
> > index 509f9ccae3a9..f701638d3145 100644
> > --- a/drivers/gpu/drm/i915/gvt/opregion.c
> > +++ b/drivers/gpu/drm/i915/gvt/opregion.c
> > @@ -43,7 +43,7 @@
> >  #define DEVICE_TYPE_EFP4   0x10
> >  
> >  struct opregion_header {
> > -	u8 signature[16];
> > +	u8 signature[16] __nonstring;
> >  	u32 size;
> >  	u32 opregion_ver;
> >  	u8 bios_ver[32];
> > @@ -222,7 +222,7 @@ int intel_vgpu_init_opregion(struct intel_vgpu *vgpu)
> >  	u8 *buf;
> >  	struct opregion_header *header;
> >  	struct vbt v;
> > -	const char opregion_signature[16] = OPREGION_SIGNATURE;
> > +	const char opregion_signature[16] __nonstring = OPREGION_SIGNATURE;
> >  
> >  	gvt_dbg_core("init vgpu%d opregion\n", vgpu->id);
> >  	vgpu_opregion(vgpu)->va = (void *)__get_free_pages(GFP_KERNEL |
> > -- 
> > 2.34.1
> > 
> Hello together,
> 
> it doesnt resolve the build issue with gcc15 gcc (GCC) 15.0.1 20250228

This was a recent enhancement to GCC, and that 20250228 build does not
include it. (GCC 15 is not actually released yet...)

-- 
Kees Cook
