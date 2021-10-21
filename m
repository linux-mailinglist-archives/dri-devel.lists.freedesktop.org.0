Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0351543689F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5C56ECED;
	Thu, 21 Oct 2021 17:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358F86ECDA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 17:03:21 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so6123944pjd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dTcg4nnP3Q8OPOldUBNlJ77tCd6O60oSXI5JUaJbrOw=;
 b=eW1MZxI1OmRUonS9v1rnZyRZSTC93O+t4454bYQxxN7sTvn0gzcyFi6nR0qXvK+4i4
 ZkvHDpSMKZdH0IBFm9GsdJJkj+iDsEKWm5Xf/0sD2bDbWvHj+sIVH7sSu7kpTC2CY72U
 acruMO4FPGAcQz5J7GuxKRVt/F5ICDOn9khtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dTcg4nnP3Q8OPOldUBNlJ77tCd6O60oSXI5JUaJbrOw=;
 b=U+cK/3+IHXI6UX/WTI5dbQqY/ZrTnVEJnM+IisDlp+tV8L5jCeiSvP5mZM8rDFo72+
 0ec74NQuoR2z1ng5LncWBD7aUvskaPk6Bpkk576yF+57V/dxuaplQ9aZwZDeou4bGSe7
 F96YrTNpMriSqQ2eUd/AK1JwK7fsrhPw/jMjqLOGlFb6hYd/G0+9DE/7YZNNoSoGNISr
 OMoRySJ0KykjcVF0lpV2nmKICZ5t76+dDLujopmt4Kopc1CgSQmkAdSwJf7CqApsN6pV
 4VYoyAIlcYP915AKTU9DIvT3ukD70J1Jvvt8K2EEYUsgLnk+gZawuJ3frFu9ah8b0vRc
 2NWg==
X-Gm-Message-State: AOAM530qd3p9bQ/lYLTlfHf/M+AxeT8RtuSpSdNfMqS9og4bCzhHEL0x
 P6sd2tYZBnleNBrmJ8lqjvkWHQ==
X-Google-Smtp-Source: ABdhPJxZPJROdmRol0REI+7u9He1qjFMzOPLeVcePBcrcnWgEUcZVclthczh6pTD+jqh26sdf0mjdg==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr8220645pjb.87.1634835800642; 
 Thu, 21 Oct 2021 10:03:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id pc3sm6654862pjb.2.2021.10.21.10.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:03:20 -0700 (PDT)
Date: Thu, 21 Oct 2021 10:03:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] nouveau/svm: Use kvcalloc() instead of kvzalloc()
Message-ID: <202110211002.CB975695@keescook>
References: <20210928222513.GA294575@embeddedor>
 <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
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

On Wed, Sep 29, 2021 at 05:28:47AM +0200, Karol Herbst wrote:
> Lack of documentation inside Linux here is a bit annoying, but do I
> understand it correctly, that the main (and probably only) difference
> is that kvcalloc checks whether the multiplication overflows and
> returns NULL in this case?

That's correct. :)

> On Wed, Sep 29, 2021 at 12:21 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > Use 2-factor argument form kvcalloc() instead of kvzalloc().
> >
> > Link: https://github.com/KSPP/linux/issues/162
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

> > ---
> >  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > index b0c3422cb01f..1a896a24288a 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > @@ -992,7 +992,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
> >         if (ret)
> >                 return ret;
> >
> > -       buffer->fault = kvzalloc(sizeof(*buffer->fault) * buffer->entries, GFP_KERNEL);
> > +       buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
> >         if (!buffer->fault)
> >                 return -ENOMEM;
> >
> > --
> > 2.27.0
> >
> 

-- 
Kees Cook
