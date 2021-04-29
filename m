Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E194336EFD1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 20:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6716A6F446;
	Thu, 29 Apr 2021 18:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42246F448
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 18:56:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id m5so9712418wmf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7nfKYP7lOOGrHT5NYTqOPuzxqA4uplX7W6GpZa8VmZY=;
 b=f5VU76dw5tdcjJsR/V5kqIK69jNOSgkGJRgMv/AB5mLtqChg8HEWidRWmOo1+A0pfK
 WjgNMEvI2Z/x/qJUEWR8sr61ArvFU/fRvFLTOLg2D7b9uQw7mRW+Q79js6H828K5m7Xz
 c9t7t1e16ooO/JUKTXl4BoWEdS2f2wjd/Hzgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7nfKYP7lOOGrHT5NYTqOPuzxqA4uplX7W6GpZa8VmZY=;
 b=bik4lK9K4K+9W1i8YVicJlPNwc9+XZaCoad5PRdg+ddez+Jrh6rxa1jWtZaStElTt/
 G4LG9UV/M0o2xNi0wKlJrf98xvzvEGWRn8rurtk2MJXoL/1dwHmtVAgUZ+sLFE4Cz1dl
 Uqo4X32DPCDwObrhHf83HgEAFw5JpAEeODmbIFtUyxieHSQVT1A0RrlaUVutgm3XbRYK
 m+3ylhdWnPttVDGUcHN50KiYVbxiG7m8Ok0mi0ZOEBqhcvNstkgpxsg3nvBDorqFRlgS
 hbwm5+bK2uexFPEwKsT7Fig0W2hCbguEiYEXwmtHO7sgwsQmLhsLjVV0HR3TUWeg9QS1
 5ZfQ==
X-Gm-Message-State: AOAM533mus3cy/SMf7iH4Aa0XE5Z36QEXF6/z7E3DwOT6OlbFoFf73JN
 tAghQuLZpnpNwPuXgF6SDtDMVQ==
X-Google-Smtp-Source: ABdhPJwv6YaTPL++4UXIUupOqgNBPFZAiN96UWrLjfPKFQ/poI7xzb6nYBMcovKf8suPwR6z1NO0+Q==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr12353520wmc.51.1619722572315; 
 Thu, 29 Apr 2021 11:56:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h63sm1004410wmh.13.2021.04.29.11.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 11:56:11 -0700 (PDT)
Date: Thu, 29 Apr 2021 20:56:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
Message-ID: <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> >
> > I think we should have a FIXME here of not allowing this on some future
> > platforms because just use CTX_CREATE_EXT.
> 
> Done.
> 
> > > +     if (ret == -ENOTSUPP) {
> > > +             /* Some params, specifically SSEU, can only be set on fully
> >
> > I think this needs a FIXME: that this only holds during the conversion?
> > Otherwise we kinda have a bit a problem me thinks ...
> 
> I'm not sure what you mean by that.

Well I'm at least assuming that we wont have this case anymore, i.e.
there's only two kinds of parameters:
- those which are valid only on proto context
- those which are valid on both (like priority)

This SSEU thing looks like a 3rd parameter, which is only valid on
finalized context. That feels all kinds of wrong. Will it stay? If yes
*ugh* and why?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
