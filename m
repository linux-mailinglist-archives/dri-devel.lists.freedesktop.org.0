Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E577A30DD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 16:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E9810E028;
	Sat, 16 Sep 2023 14:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11DA10E11D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 14:24:09 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4018af103bcso20085545e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Sep 2023 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694874248; x=1695479048; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1VUAsOBNA2UelmG0YB0ECv/9F8gno9lGmN4dd2u9r00=;
 b=hxyLiOmOUje/1VyfjlU/62a20CDse6M1L7k6AXaMTcCKESIUbqzIFd9QamSHruBCsp
 OzqA0kg525HYlvimh7Jv0FLX8of/a6WJyEz5jDkIcaehkGyS+m9jJaUgtqnij0rL0uq4
 gLX04mwHt4uZ3Ikce4PIrqWeM3h4b3m2O33hcDhrB/lr4Wsf/W+wBxRmPnthSHGDfdP0
 IHhBS2oC6rSH2gaVwEZ7RKzfr5KvP9keYmh8yYgmpjmFABonP45b/r1++kp31Gb+REpl
 txOXnMZeIx5uEPL3gWLa1Jj6aQi0k4p8Mp/H/SH6bDqgcS9Z6Dg7UH7LTj2ZYoQRmpUR
 UDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694874248; x=1695479048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1VUAsOBNA2UelmG0YB0ECv/9F8gno9lGmN4dd2u9r00=;
 b=xT6Ed1+nVw2ifx9JSC8BYBbDB/Junoqqil1ean+NGPQLBW30kX53j+4Y94dvGhqA+7
 qy4vpBDku+NoqJeyTEuggSP9SNe0C4f3y6s/6sOSVCC3KYuyH8czNBoM8/EN0GPmOabI
 zw1Kz9u3od8abs0htyLmfzVuR5qQbI4DgrbkwpygCgNJDOikZU7fWQMC4W/D5eR59TRN
 imJBY41txrhBkhDOCZT28UPNbvEHVX+qkHDk5l0lAUqSTYd0Nn9eF71b/6LHAq0hxGWG
 I1pVQYl4ud6giqBz4HMEKbn8RxKty3sCgzdZ5LtY3qcM+n2x0brUcux/fOvi778huRTc
 5EDg==
X-Gm-Message-State: AOJu0YwPDMRs1a1RSm7hKYXhfnhdBnxLm6FrC4NAG9y3pV+A6iIWCGyN
 1zS1KgBGG/wPkyS/vnrlESv06Q==
X-Google-Smtp-Source: AGHT+IFtFYGIZIADf3ER5VqIcxXW6g6h2GQovX61KCfsw1b/Wj/OY0SFnQoRu2LYqqjRK/Bmdju5HQ==
X-Received: by 2002:a7b:cd0d:0:b0:3ff:516b:5c4c with SMTP id
 f13-20020a7bcd0d000000b003ff516b5c4cmr3514084wmj.18.1694874247889; 
 Sat, 16 Sep 2023 07:24:07 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c235300b003fe2a40d287sm7552003wmq.1.2023.09.16.07.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 07:24:07 -0700 (PDT)
Date: Sat, 16 Sep 2023 17:24:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
Message-ID: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
> Hi Dan,
> 
> On 9/15/23 14:59, Dan Carpenter wrote:
> > The u_memcpya() function is supposed to return error pointers on
> > error.  Returning NULL will lead to an Oops.
> > 
> > Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index 3666a7403e47..52a708a98915 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> >   	size_t bytes;
> >   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
> 
> I plan to replace this function with an upcoming vmemdup_array_user() helper,
> which returns -EOVERFLOW instead, hence mind using that?
> 
> Unless you disagree, no need to resubmit the patch, I can change it
> before applying the patch.

Generally, I would say that ENOMEM is the correct error code.  I feel
like someone thinks EOVERFLOW means integer overflow and that's not
correct.  I means like if you pass a number higher than INT_MAX to
kstroint().

But I don't care strongly about this.  You can change it if you want to.

regards,
dan carpenter

