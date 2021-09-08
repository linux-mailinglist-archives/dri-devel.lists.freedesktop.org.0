Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16AC403E30
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 19:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE926E212;
	Wed,  8 Sep 2021 17:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC886E212
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 17:11:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g8so3875533edt.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 10:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=fZFPWfpUjBfmfyPVniqFfV8xQXNj2TCZ/K6MCuay8jc=;
 b=g0pHU6tSNcDVWMaIwhl+3pft719J1R+Dn710bJIREkMh1Z5UfGnvCf6T7OeY83UGgn
 I89jsrqvcIHJw4kG3GFX51aD/g4Lsi+l0Xk3Fqz44Rv7KBAda3xyrT4pBa9mc8KPRgmh
 cT8kqdzXMJQRg/ELtJhk5GpMdditrCr9jDNY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=fZFPWfpUjBfmfyPVniqFfV8xQXNj2TCZ/K6MCuay8jc=;
 b=qpwqzTSudj3+EVex/HStvczbrMeDtzYwhdd/hvBlHO4vDJbtaw1QU0Jbt9h4sH6tlz
 kYgQM+N39012Z3OgCrHK9a2sQWlVioVHCX5hBGzLq9lEENHoksjXRXI4Z3uOhxlMVrqe
 kLI0IcBDBD8zZ58agxAYQEK1N2Q0kcAwDoXodPmTjF9VEgXJ5fqQXR09CvWfYTBLCGWS
 Oj/0cNmqKQu9y05dga2/AsHLRH7fk4B1diY1fazCOfRiGZ4+XWinFIN9eZId5oqGV1NE
 of0CgWPtdAGgNGUosf+29MIz6XjurR1PsDfcjPU11Fy5ogNN7J8IFF1Meu4zZZCdMlvt
 c+AQ==
X-Gm-Message-State: AOAM531ku74nw4EYc4fqyJz6V1w/3R8bThE3JN9R+0vG1KnGMuAGvm+Y
 GybGHAjXKDS2eLUJbiNmQSHxAg==
X-Google-Smtp-Source: ABdhPJwiKFtpULQAFgOuBN/N3JwKr/ljJWXegBl52xUcw9unKTU19JHCnQ+4HyvJtfNrs8ilakxGNw==
X-Received: by 2002:a50:ba84:: with SMTP id x4mr3864950ede.376.1631121077576; 
 Wed, 08 Sep 2021 10:11:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i20sm1269859eds.14.2021.09.08.10.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:11:16 -0700 (PDT)
Date: Wed, 8 Sep 2021 19:11:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Gow <davidgow@google.com>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um <linux-um@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
Message-ID: <YTjusuDs4UhvCJuc@phenom.ffwll.local>
Mail-Followup-To: David Gow <davidgow@google.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um <linux-um@lists.infradead.org>,
 David Airlie <airlied@linux.ie>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
 <YTDjlixwDWi7Y2uR@phenom.ffwll.local>
 <CABVgOSnvW_H03KjXxK5=j0ApEPh-Me3RxMF9QGFFT3kEtXJ65Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABVgOSnvW_H03KjXxK5=j0ApEPh-Me3RxMF9QGFFT3kEtXJ65Q@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 04, 2021 at 11:50:37AM +0800, David Gow wrote:
> On Thu, Sep 2, 2021 at 10:46 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Sep 02, 2021 at 07:19:01AM +0100, Anton Ivanov wrote:
> > > On 02/09/2021 06:52, Randy Dunlap wrote:
> > > > On 9/1/21 10:48 PM, Anton Ivanov wrote:
> > > > > On 02/09/2021 03:01, Randy Dunlap wrote:
> > > > > > boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
> > > > > > member named 'x86', so provide a default page protection mode
> > > > > > for CONFIG_UML.
> > > > > >
> > > > > > Mends this build error:
> > > > > > ../drivers/gpu/drm/ttm/ttm_module.c: In function
> > > > > > ‘ttm_prot_from_caching’:
> > > > > > ../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: ‘struct
> > > > > > cpuinfo_um’ has no member named ‘x86’
> > > > > >    else if (boot_cpu_data.x86 > 3)
> > > > > >                          ^
> > > > > >
> > > > > > Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for
> > > > > > page-based iomem")
> > > > > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: Jeff Dike <jdike@addtoit.com>
> > > > > > Cc: Richard Weinberger <richard@nod.at>
> > > > > > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > > > > Cc: linux-um@lists.infradead.org
> > > > > > Cc: David Airlie <airlied@linux.ie>
> > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > ---
> > > > > >   drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
> > > > > >   1 file changed, 4 insertions(+)
> > > > > >
> > > > > > --- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
> > > > > > +++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
> > > > > > @@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > > > >       if (caching == ttm_cached)
> > > > > >           return tmp;
> > > > > > +#ifdef CONFIG_UML
> > > > > > +    tmp = pgprot_noncached(tmp);
> > > > > > +#else
> > > > > >   #if defined(__i386__) || defined(__x86_64__)
> > > > > >       if (caching == ttm_write_combined)
> > > > > >           tmp = pgprot_writecombine(tmp);
> > > > > > @@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > > > >   #if defined(__sparc__)
> > > > > >       tmp = pgprot_noncached(tmp);
> > > > > >   #endif
> > > > > > +#endif
> > > > > >       return tmp;
> > > > > >   }
> > > > >
> > > > > Patch looks OK.
> > > > >
> > > > > I have a question though - why all of DRM is not !UML in config. Not
> > > > > like we can use them.
> > > >
> > > > I have no idea about that.
> > > > Hopefully one of the (other) UML maintainers can answer you.
> > >
> > > Touche.
> > >
> > > We will discuss that and possibly push a patch to !UML that part of the
> > > tree. IMHO it is not applicable.
> >
> > I thought kunit is based on top of uml, and we do want to eventually adopt
> > that. Especially for helper libraries like ttm.
> 
> UML is not actually a dependency for KUnit, so it's definitely
> possible to test things which aren't compatible with UML. (In fact,
> there's even now some tooling support to use qemu instead on a number
> of architectures.)
> 
> That being said, the KUnit tooling does use UML by default, so if it's
> not too difficult to keep some level of UML support, it'll make it a
> little easier (and faster) for people to run any KUnit tests.

Yeah my understanding is that uml is the quickest way to spawn a new
kernel, which kunit needs to run. And I really do like that idea, because
having virtualization support in cloud CI systems (which use containers
themselves) is a bit a fun exercise. The less we rely on virtual machines
in containers for that, the better.

Hence why I really like the uml approach for kunit.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
