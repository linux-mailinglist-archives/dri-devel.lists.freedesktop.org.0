Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82F7AC662
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 04:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6E310E093;
	Sun, 24 Sep 2023 02:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5510E093
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 02:57:14 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1ba5cda3530so2775250fac.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 19:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695524234; x=1696129034;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NPXBmCzK3FG70guuha+2I+A6yn1HdDxLwlr5P+cFkHs=;
 b=EiMGr6ujpxGiNhvsZYda4F64K2TYX7lo9ChSeJwTT/WCWVq8KrL+a41LxA+gVsVWQS
 vLsLGdIp2WvVHw6btASI0AJ5lK5GRmG4/i05WLjOe8mRX12xd+VgFophsoiGqoPRSZ/6
 Tfeg5Sk6nQfNo5A1P+DObGwwRLGUdk7R2LED8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695524234; x=1696129034;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPXBmCzK3FG70guuha+2I+A6yn1HdDxLwlr5P+cFkHs=;
 b=P/qmMAISyKEKh34pyuAQDQTiIWYVoFmwvCOdzbwlHxeCg+wMK/C2WtRrGO7U3zbQXv
 ZWVGdMVEHg9kmj/wPjQF2WYpX+o7nERKFSKYSNoOev4t7ZdD9t8txqV+nsM15SbmNqQD
 2Uf1VTfkxu2h86DfMlJB9RwNd89w0tx+ea35RC9k592cuaDEHmdPc/WWhcw277h1iNxh
 Dt269MCwVhb7DWMPei6SQxIY1ryxLLPREup0HPBsqLVkiWMyf5SstSNQvI/vl87pKyRf
 44YQ8YYNiPokxPgKYzyGhGXt5rHwkWKvZfJXczd2Qp/qFt+uqUYrvysrGEQmvasrYw/C
 vD0Q==
X-Gm-Message-State: AOJu0Ywrlrr/WbZAEuUugNI9eE2KW4Ke3+Dyx9TypO4SEKu1I20b+m+b
 Qy5nB8rwIpTbsFivLZzvUlByvg==
X-Google-Smtp-Source: AGHT+IFK1V+i4tYBOwcJa9hlcUbQL0WgYEFL3YN7gDnaCzlxB+A01+MYEGZT9yHCPBAf6SjDQGiVSQ==
X-Received: by 2002:a05:6870:6486:b0:1c0:c42f:6db2 with SMTP id
 cz6-20020a056870648600b001c0c42f6db2mr4979469oab.37.1695524233832; 
 Sat, 23 Sep 2023 19:57:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 m29-20020a638c1d000000b005787395e301sm3964077pgd.44.2023.09.23.19.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Sep 2023 19:57:12 -0700 (PDT)
Date: Sat, 23 Sep 2023 19:57:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <202309231954.1EAD0FA5A7@keescook>
References: <3e37f05c7593f1016f0a46de188b3357cbbd0c0b.1695060389.git.christophe.jaillet@wanadoo.fr>
 <7043f179-b670-db3c-3ab0-a1f3e991add9@embeddedor.com>
 <a49f800e-e56f-433a-81d2-6edd68a0a015@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a49f800e-e56f-433a-81d2-6edd68a0a015@wanadoo.fr>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-hardening@vger.kernel.org, linux-media@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 09:22:44PM +0200, Christophe JAILLET wrote:
> Le 18/09/2023 à 05:10, Gustavo A. R. Silva a écrit :
> > 
> > 
> > On 9/18/23 12:46, Christophe JAILLET wrote:
> > > If 'list_limit' is set to a very high value, 'lsize' computation could
> > > overflow if 'head.count' is big enough.
> > > 
> > > In such a case, udmabuf_create() will access to memory beyond 'list'.
> > > 
> > > Use size_mul() to saturate the value, and have memdup_user() fail.
> > > 
> > > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   drivers/dma-buf/udmabuf.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > > index c40645999648..fb4c4b5b3332 100644
> > > --- a/drivers/dma-buf/udmabuf.c
> > > +++ b/drivers/dma-buf/udmabuf.c
> > > @@ -314,13 +314,13 @@ static long udmabuf_ioctl_create_list(struct
> > > file *filp, unsigned long arg)
> > >       struct udmabuf_create_list head;
> > >       struct udmabuf_create_item *list;
> > >       int ret = -EINVAL;
> > > -    u32 lsize;
> > > +    size_t lsize;
> > >       if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
> > >           return -EFAULT;
> > >       if (head.count > list_limit)
> > >           return -EINVAL;
> > > -    lsize = sizeof(struct udmabuf_create_item) * head.count;
> > > +    lsize = size_mul(sizeof(struct udmabuf_create_item), head.count);
> > >       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
> > >       if (IS_ERR(list))
> > >           return PTR_ERR(list);
> > 
> > How about this, and we get rid of `lsize`:
> 
> Keeping or removing lsize is mostly a matter of taste, I think.

I'm on the fence, but kind of lean towards keeping lsize, but I think
it's fine either way.

> Using sizeof(*list) is better.

That I agree with, yes.

> Let see if there are some other comments, and I'll send a v2.

I note that this looks like a use-case for the very recently proposed
memdup_array_user():
https://lore.kernel.org/all/ACD75DAA-AF42-486C-B44B-9272EF302E3D@kernel.org/

(i.e. a built-in size_mul)

-Kees

-- 
Kees Cook
