Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC48EECD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 17:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124910EBAB;
	Fri, 14 Jan 2022 16:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6410EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 16:57:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v6so16607652wra.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8tlmhR9a+oSiQxYgTs9TSjEyT0cpPnO4gBCG7leedNI=;
 b=QcCsaXmaZFWsArkyS5ubMHNqwdV+bONwmyEp85ScjOc2CF/42wJGz4jjT+ad/Ry611
 083GxGtKg4TJ79eMUo3dC2J+XtNJ9+5FfgSuwjcmtvOR/4zwkboYinLPZ2YyT7IQEcX6
 O4+0Ww9RTbJquWrvJBsU4RGpdabqbKvq6Eo4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8tlmhR9a+oSiQxYgTs9TSjEyT0cpPnO4gBCG7leedNI=;
 b=3n7/K8jFVMGzojL2E9Inph0To/GSpRJJ2Noc34V8+8XLLiZiFLZcE6Pry31sKBmcQf
 UxnYCUy4iKqziYwWJN/GpI3gs1e+/82a9M0By6+RQ1GhDv23XNqz04huf1xmCI73RDjF
 JPeP1CRGAsae9z8xktzRvUQ0YmWwlMj8CGrg/aHNi28B8WNrdoQdEutEn1f9acH2d+rY
 ibjJKJlUaWKTOfS0lHW/5Rw4HNfXhj2Jjcol9QkrX+m7mF98lqP2nrsa/loFGwJurdYy
 Lry4/4zcCjy/zkBKs85CwwGToekYKlU6FDVp/DE3KGNDN2inlLPC4bLaIscnEwY/4RKb
 awvw==
X-Gm-Message-State: AOAM530zXrbMOUfl1hKiKHIhjgUqdfHcsNDmrmeidJBLrV1WP+zHdRKh
 LN0Slk52uQLxgsJlWqrSkjQ6AEEiOf7vdA==
X-Google-Smtp-Source: ABdhPJwJs+M7uqymw5kPe5LWbLvcWEC9656nwi+iTRgHPrTpBHgrVMtYX3b6p8Xz5qk20YpoKPr0gw==
X-Received: by 2002:a5d:6e09:: with SMTP id h9mr9098120wrz.116.1642179461451; 
 Fri, 14 Jan 2022 08:57:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s10sm10546434wmr.30.2022.01.14.08.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 08:57:40 -0800 (PST)
Date: Fri, 14 Jan 2022 17:57:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] udmabuf: validate ubuf->pagecount
Message-ID: <YeGrgs+4PXM2ud+n@phenom.ffwll.local>
Mail-Followup-To: Pavel Skripkin <paskripkin@gmail.com>, kraxel@redhat.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com
References: <20211230142649.23022-1-paskripkin@gmail.com>
 <c5ae2a68-070f-884c-c82a-2d3f4b8e06b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5ae2a68-070f-884c-c82a-2d3f4b8e06b1@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kraxel@redhat.com, syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 12, 2022 at 09:08:46PM +0300, Pavel Skripkin wrote:
> On 12/30/21 17:26, Pavel Skripkin wrote:
> > Syzbot has reported GPF in sg_alloc_append_table_from_pages(). The
> > problem was in ubuf->pages == ZERO_PTR.
> > 
> > ubuf->pagecount is calculated from arguments passed from user-space. If
> > user creates udmabuf with list.size == 0 then ubuf->pagecount will be
> > also equal to zero; it causes kmalloc_array() to return ZERO_PTR.
> > 
> > Fix it by validating ubuf->pagecount before passing it to
> > kmalloc_array().
> > 
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Reported-and-tested-by: syzbot+2c56b725ec547fa9cb29@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > ---
> > 
> 
> Gentle ping :)

Gerd Hoffmann should pick this one up, pls holler again if it doesn't
happen.
-Daniel

> 
> > 
> > ---
> >   drivers/dma-buf/udmabuf.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index c57a609db75b..e7330684d3b8 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -190,6 +190,10 @@ static long udmabuf_create(struct miscdevice *device,
> >   		if (ubuf->pagecount > pglimit)
> >   			goto err;
> >   	}
> > +
> > +	if (!ubuf->pagecount)
> > +		goto err;
> > +
> >   	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
> >   				    GFP_KERNEL);
> >   	if (!ubuf->pages) {
> 
> With regards,
> Pavel Skripkin

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
