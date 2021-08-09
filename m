Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946C3E46C9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 15:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD0789B66;
	Mon,  9 Aug 2021 13:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C34A89B66
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 13:38:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n12so11444433wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 06:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PUoT48Kepu/WtsZ2zSXdg3rVEV6q2hzCreGMpVRHbBY=;
 b=dRDp3P0MjiNOTlyUFXjf9e+528S552qdXJ7krg52p0OSY36FdlpRvaHvEY1J4HZpfx
 cXwGcrKEaXw0BbV2yplnU8EM9AwDasAVq2p8sRVh9dInVZOonHVH20GOp1tjv3zydsc/
 hTfrwT30/9D+TAxgkiulYHv1IuEc3r9br+Ces=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PUoT48Kepu/WtsZ2zSXdg3rVEV6q2hzCreGMpVRHbBY=;
 b=OXMzRzn35mtek5gMw2SzPXTaSBxcEgGThvVGCiHbFw7PMpj1dOoxuHeEx5fv0dyD4K
 EyGUy6cVjvmK0O8M//VgrViD7siXUmXj0E4nK6JUHIFTB+66tVyc+fyTFYC0StZmai1W
 HlcobyWc8CnWiTjwiEtWAPNftpYC8hhK7P+3N3mAMEIRHSTH8reSOR+nEV5+56aQIbcc
 ObdoH/9cA4pb4dUFvmaJn3/UJeDcwAJLso901LPl2tG8LSZoZguJS7nnP/EJdg7c5Ica
 qXyTZMct80awqBUio28jFwaaVAanBAv4Fk3oNRiMJZ37gbQX51xWOrpY6JYfOIfjVhHg
 6rDA==
X-Gm-Message-State: AOAM533MFWGHDWn/wZPCnoF3fg4EyYQHGY6kmG9PGrg1rwdkla22C4DA
 ZBH0BB4wFaJW5ZJgF/Oysi1cww==
X-Google-Smtp-Source: ABdhPJwNMIksoNnfwnDL94M6cCLC469zciqEj6l/tCwCCWMtveboPOpy0iUcTZQMtdzk16jAFXwx2Q==
X-Received: by 2002:a5d:5750:: with SMTP id q16mr25440040wrw.9.1628516321122; 
 Mon, 09 Aug 2021 06:38:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 140sm18782060wmb.43.2021.08.09.06.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:38:40 -0700 (PDT)
Date: Mon, 9 Aug 2021 15:38:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/selftests: Fix memory
 corruption in live_lrc_isolation
Message-ID: <YREv3mwWxH6cN9I7@phenom.ffwll.local>
References: <20210808180757.81440-1-matthew.brost@intel.com>
 <20210808180757.81440-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210808180757.81440-3-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Sun, Aug 08, 2021 at 11:07:56AM -0700, Matthew Brost wrote:
> GuC submission has exposed an existing memory corruption in
> live_lrc_isolation. We believe that some writes to the watchdog offsets
> in the LRC (0x178 & 0x17c) can result in trashing of portions of the
> address space. With GuC submission there are additional objects which
> can move the context redzone into the space that is trashed. To
> workaround this avoid poisoning the watchdog.

A Bspec reference here would be good (we can quote anything that's marked
for public release, so doesn't have one of the IP markers).

Also I think the above should be replicated in condensed form instead of
the XXX comment.

With those: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> since I
definitely have enough clue here for a detailed review.
-Daniel

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 29 +++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index b0977a3b699b..6500e9fce8a0 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
>  	goto err_after;
>  }
>  
> +static u32 safe_offset(u32 offset, u32 reg)
> +{
> +	/* XXX skip testing of watchdog */
> +	if (offset == 0x178 || offset == 0x17c)
> +		reg = 0;
> +
> +	return reg;
> +}
> +
> +static int get_offset_mask(struct intel_engine_cs *engine)
> +{
> +	if (GRAPHICS_VER(engine->i915) < 12)
> +		return 0xfff;
> +
> +	switch (engine->class) {
> +	default:
> +	case RENDER_CLASS:
> +		return 0x07ff;
> +	case COPY_ENGINE_CLASS:
> +		return 0x0fff;
> +	case VIDEO_DECODE_CLASS:
> +	case VIDEO_ENHANCEMENT_CLASS:
> +		return 0x3fff;
> +	}
> +}
> +
>  static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
>  {
>  	struct i915_vma *batch;
> @@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
>  		len = (len + 1) / 2;
>  		*cs++ = MI_LOAD_REGISTER_IMM(len);
>  		while (len--) {
> -			*cs++ = hw[dw];
> +			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
> +					    hw[dw]);
>  			*cs++ = poison;
>  			dw += 2;
>  		}
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
