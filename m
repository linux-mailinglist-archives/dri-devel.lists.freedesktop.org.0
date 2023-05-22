Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021070C423
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 19:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D2A10E19E;
	Mon, 22 May 2023 17:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53FB10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 17:22:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ae52ce3250so59381145ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684776143; x=1687368143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qgwrsrvR2OLewUEAKXpoKm83J7LNaLvisoBLwt+0FOs=;
 b=gtABt70s+9IRhefHIdX40Nvy/7/Fps4bT6TqqI7Byo1ca9Tuxp4rm4ipN3PbvMUN8e
 vCEuY71S2JwhiMyK9LLSHA3pVLflr2LCJisLdlzYhfU31GU61KrzHEEaCDnBAZ+aU6di
 qb8ESKrEtStarrlqNXhQy+nrCItEWzXv/R96s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684776143; x=1687368143;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgwrsrvR2OLewUEAKXpoKm83J7LNaLvisoBLwt+0FOs=;
 b=NIb0MrBx1AVHWDhCbrAXrOncKpW4+v0t5YDyfkeLrPr01A8hAT6YgLGPQixYEZB0iW
 wFD0kdTHVHEO5DckG+iRFVNQ5r74lvt4Lt4hRnNWHSfovSH+Dkayz6DCgP9ZjkPUXj9v
 qYTARRf2o4gf527LVw82wuiK3ZDtXOg5lFTh9wbBZIBJ4Tn9vjOZ3yhTFUXcosSpowwO
 slmnv+t8X0xJPI2+p4Y06N+57vhBOz0e0Qi+ztUcns0w2azU2Nw7G9I6Nteblckaa+4d
 d/9qS3nK3Nei44LtN+FhskKNh9jQFqmulo0NgLae34Gy5eJ1R/udimjiKSN2abmIYk1O
 37hg==
X-Gm-Message-State: AC+VfDxcfiexJoN173bOfkck5OSoSBxLK1tA1BF1gi2s9a19nBPHiYEs
 +NWvpJf2/hO/HQKELycxDZpxWw==
X-Google-Smtp-Source: ACHHUZ4CdndgtF5TE5I0shQjCG7A6gAGfSVYnQEfZuV10QNQNVvcrpr3N292VU27Q3HGk0NbiMTtxg==
X-Received: by 2002:a17:903:32c7:b0:1ac:43ea:7882 with SMTP id
 i7-20020a17090332c700b001ac43ea7882mr13774830plr.29.1684776143103; 
 Mon, 22 May 2023 10:22:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 c6-20020a170902c1c600b001ac84f5559csm5087014plc.126.2023.05.22.10.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 10:22:22 -0700 (PDT)
Date: Mon, 22 May 2023 10:22:21 -0700
From: Kees Cook <keescook@chromium.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH] drm/i2c: tda998x: Replace all non-returning strlcpy with
 strscpy
Message-ID: <202305221014.70326C3@keescook>
References: <20230522155350.2337029-1-azeemshaikh38@gmail.com>
 <ZGuSeZcLfXNyCqtv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGuSeZcLfXNyCqtv@shell.armlinux.org.uk>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 05:04:09PM +0100, Russell King (Oracle) wrote:
> On Mon, May 22, 2023 at 03:53:50PM +0000, Azeem Shaikh wrote:
> > strlcpy() reads the entire source buffer first.
> > This read may exceed the destination size limit.
> > This is both inefficient and can lead to linear read
> > overflows if a source string is not NUL-terminated [1].
> > In an effort to remove strlcpy() completely [2], replace
> > strlcpy() here with strscpy().
> > No return values were used, so direct replacement is safe.
> ...
> >  	memset(&cec_info, 0, sizeof(cec_info));
> > -	strlcpy(cec_info.type, "tda9950", sizeof(cec_info.type));
> > +	strscpy(cec_info.type, "tda9950", sizeof(cec_info.type));
> 
> Please explain how:
> 
> 1) a C string can not be NUL terminated.
> 2) this source string could be longer than I2C_NAME_SIZE (20 bytes)
>    which is unlikely to ever shrink.

Yes, in this case, obviously none of those can happen.

> I'm not saying I disagree with the patch, but the boilerplate commit
> message isn't correct for this change, and is actually misleading
> for what the patch actually is.

One of the common code patterns in the kernel is copying fixed sized
strings (like here), but Linus refused (probably correctly) to allow an
API for that, since we already had "too many" string functions.

The long-term goal here is to replace all use of strlcpy(),
strncpy(), and strcpy() and replace them with strscpy(). The strscpy()
wrapper is already optimized to short-cut for fixed-size dest/src:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/fortify-string.h?h=v6.3#n337

Perhaps this goal needs to be stated in the commit log to be more clear
about cases like this?

-Kees

-- 
Kees Cook
