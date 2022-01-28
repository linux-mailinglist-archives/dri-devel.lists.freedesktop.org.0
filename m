Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9416C4A00C7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 20:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176F10E26F;
	Fri, 28 Jan 2022 19:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE6510E26F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643397631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mig7DWzSwp/dgfKpPr73AnI1RojscQkVEm4yd9tasvQ=;
 b=YyE3BH1K4tnXOXGiEShYILXld/UUf7BLTP3aryjLT2BlnjLQ6WMoDjmmRbcS0PFpT1rdZ7
 uQ8JBnKXEJIVhsj8HQCkfiSuwA68Kv18LR8rV85KMXdBSKvp5wS+tL71Ro2zAUCMD7UD+v
 Ez+LGsvkwdedlHCvZp3N60ELbykm4z8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-GCQ3H_nrMDyHOhIz2YAzdg-1; Fri, 28 Jan 2022 14:20:28 -0500
X-MC-Unique: GCQ3H_nrMDyHOhIz2YAzdg-1
Received: by mail-qv1-f72.google.com with SMTP id
 t2-20020ad45bc2000000b00424bc599ef3so6898134qvt.22
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 11:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mig7DWzSwp/dgfKpPr73AnI1RojscQkVEm4yd9tasvQ=;
 b=h92Nswul5xQf+o/7WaxkHyIMxXIfaNDfm16idic4l7US5kl37SZRzYdQ3IaoY2IkEL
 arvio2+xhqUIjYUF/CePQ5pzOfkcg0AkO+3idAY2z+qjRZmHYR3O7A6KV5LUqre8Linc
 3gqBFlaW1vqNoIiI3hxBsgWDppOvT4xiyvfOCbRyVeE9zkxA2Ml0IcP5pRw4CGoqGtrn
 8CUC8S8Y3rz8Gw8e2hJJb7cmPPsXGQWo1cNM+ArWU7UERt+V9zs+ul+Go5UptTF/GH73
 RtP6dgsxYMmW9qdKkaXMxYRTn+/hLh3kW4bII72TtBhDWWiQWPVUYO0VAbS6FNm04/Jj
 stUA==
X-Gm-Message-State: AOAM532JW0tyd/sHnU1WiFchj3N4CaBzgJkPFoBwogkcT7prdbFfnCVU
 APTEIyitEzLWLQVK3d2HMho6GoK9WI/+6T+6/IZZ+l8tldNINV+qGSWCk873zrbTtQRBU3PJj4V
 taVXJsJutTCE/mEz6fF+G3+bHfVMU
X-Received: by 2002:ad4:5769:: with SMTP id r9mr8886916qvx.52.1643397627505;
 Fri, 28 Jan 2022 11:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+Z3FzcdHTo3905MS7g1gUVZTFQpk0hs9iapN/w42adkJFAEEkEGcoNse6Q6tOGh2WnkBPtg==
X-Received: by 2002:ad4:5769:: with SMTP id r9mr8886848qvx.52.1643397626259;
 Fri, 28 Jan 2022 11:20:26 -0800 (PST)
Received: from [192.168.8.138] (pool-98-118-105-43.bstnma.ftas.verizon.net.
 [98.118.105.43])
 by smtp.gmail.com with ESMTPSA id c14sm2243444qtc.31.2022.01.28.11.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 11:20:25 -0800 (PST)
Message-ID: <536c833413ccbe0b8ad653a50c5ea867bf975290.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
From: Lyude Paul <lyude@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>, Zhou Qingyang <zhou1615@umn.edu>
Date: Fri, 28 Jan 2022 14:20:24 -0500
In-Reply-To: <YfPC3N+H9Fu/gqpz@kroah.com>
References: <20220124165856.57022-1-zhou1615@umn.edu>
 <YfPC3N+H9Fu/gqpz@kroah.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sigh-thank you for catching this - I had totally forgot about the umn.edu ban.
I pushed this already but I will go ahead and send a revert for this patch.
Will cc you on it as well.

On Fri, 2022-01-28 at 11:18 +0100, Greg KH wrote:
> On Tue, Jan 25, 2022 at 12:58:55AM +0800, Zhou Qingyang wrote:
> > In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
> > passed to memcpy(), which could lead to undefined behavior on failure
> > of kmalloc().
> > 
> > Fix this bug by using kmemdup() instead of kmalloc()+memcpy().
> > 
> > This bug was found by a static analyzer.
> > 
> > Builds with 'make allyesconfig' show no new warnings,
> > and our static analyzer no longer warns about this code.
> > 
> > Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace
> > "secure boot"")
> > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > ---
> > The analysis employs differential checking to identify inconsistent 
> > security operations (e.g., checks or kfrees) between two code paths 
> > and confirms that the inconsistent operations are not recovered in the
> > current function or the callers, so they constitute bugs. 
> > 
> > Note that, as a bug found by static analysis, it can be a false
> > positive or hard to trigger. Multiple researchers have cross-reviewed
> > the bug.
> > 
> >  drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > index 667fa016496e..a6ea89a5d51a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
> > @@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const
> > char *name, int ver,
> >  
> >         hsfw->imem_size = desc->code_size;
> >         hsfw->imem_tag = desc->start_tag;
> > -       hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
> > -       memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
> > -
> > +       hsfw->imem = kmemdup(data + desc->code_off, desc->code_size,
> > GFP_KERNEL);
> >         nvkm_firmware_put(fw);
> > -       return 0;
> > +       if (!hsfw->imem)
> > +               return -ENOMEM;
> > +       else
> > +               return 0;
> >  }
> >  
> >  int
> > -- 
> > 2.25.1
> > 
> 
> As stated before, umn.edu is still not allowed to contribute to the
> Linux kernel.  Please work with your administration to resolve this
> issue.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

