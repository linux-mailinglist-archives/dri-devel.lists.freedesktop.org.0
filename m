Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B8A3FEFA6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C286E591;
	Thu,  2 Sep 2021 14:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C3E6E591
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:45:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b6so3349244wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=SBemzdNlacrnzlvpl8xEUdWlxlnHw5Q7DGxxpD9O63Y=;
 b=F8wErhsmbA7OzEGYxYwrW/Ypa4d2zsPTUaFJ2kuCx++KprCEIFpMBzF+cr7aJETYo+
 KFhZn4WGn0jMyyuX+h7O1akoKvYdNc9yVDCQSnh9D5m2DTmRMyJW/lkNwpL/JTqWL6CH
 qGStHPYxUqdTVkuLr1dlgkH9PG9a59+CYai+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=SBemzdNlacrnzlvpl8xEUdWlxlnHw5Q7DGxxpD9O63Y=;
 b=Sfg2SOQ2l5K2nqRVLpRYVbHbTJ46JOfUhWcnqN0WNan5T4c3F4PhnSQooFSi623Da4
 k2g78h5anErVU++QZKfEhrPzjIHhKNrA4ZVuk1cqnhV6FHgOEh1iK0b3W9AHaMx/d2Sq
 s7CR1lXz4+Zm/I3bRwCIjYtdzDd1XFjI3Aqr8edahybPqev2L2E/JYS4iWN4VWiWIgOb
 mX4O4mE8jQEqktP3RcWa24+S2BPMtcGMlZrz68D35o2nOnhQLERs/MOt2yaKbhemqbKI
 qKWb1JCSOxkRRd63zk5alZ7A/zDsZPOjX3WUy4OcKjWOhWJkTb3+xzMhd3BKPrV1osoh
 e5Rg==
X-Gm-Message-State: AOAM531occWmKCmvH4JTfKv7Racw1F07zUcLqO7ijcMKp2z9j9OzmPjP
 c+vE+6oIomkrr6a4OPD/bqtJaw==
X-Google-Smtp-Source: ABdhPJzCf8R2j8AB7PFlwy6aj/BOqLVbGNBReozZiXXYkSZ3rkJO8mhoVRbpW+vAiWPAyABsC+xqdw==
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr4233886wrb.195.1630593944785; 
 Thu, 02 Sep 2021 07:45:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j20sm1952481wrb.5.2021.09.02.07.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:45:44 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:45:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
Message-ID: <YTDjlixwDWi7Y2uR@phenom.ffwll.local>
Mail-Followup-To: Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
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

On Thu, Sep 02, 2021 at 07:19:01AM +0100, Anton Ivanov wrote:
> On 02/09/2021 06:52, Randy Dunlap wrote:
> > On 9/1/21 10:48 PM, Anton Ivanov wrote:
> > > On 02/09/2021 03:01, Randy Dunlap wrote:
> > > > boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
> > > > member named 'x86', so provide a default page protection mode
> > > > for CONFIG_UML.
> > > > 
> > > > Mends this build error:
> > > > ../drivers/gpu/drm/ttm/ttm_module.c: In function
> > > > ‘ttm_prot_from_caching’:
> > > > ../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: ‘struct
> > > > cpuinfo_um’ has no member named ‘x86’
> > > >    else if (boot_cpu_data.x86 > 3)
> > > >                          ^
> > > > 
> > > > Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for
> > > > page-based iomem")
> > > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Christian König <christian.koenig@amd.com>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Cc: Jeff Dike <jdike@addtoit.com>
> > > > Cc: Richard Weinberger <richard@nod.at>
> > > > Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > > Cc: linux-um@lists.infradead.org
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > ---
> > > >   drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
> > > >   1 file changed, 4 insertions(+)
> > > > 
> > > > --- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
> > > > +++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
> > > > @@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > >       if (caching == ttm_cached)
> > > >           return tmp;
> > > > +#ifdef CONFIG_UML
> > > > +    tmp = pgprot_noncached(tmp);
> > > > +#else
> > > >   #if defined(__i386__) || defined(__x86_64__)
> > > >       if (caching == ttm_write_combined)
> > > >           tmp = pgprot_writecombine(tmp);
> > > > @@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
> > > >   #if defined(__sparc__)
> > > >       tmp = pgprot_noncached(tmp);
> > > >   #endif
> > > > +#endif
> > > >       return tmp;
> > > >   }
> > > 
> > > Patch looks OK.
> > > 
> > > I have a question though - why all of DRM is not !UML in config. Not
> > > like we can use them.
> > 
> > I have no idea about that.
> > Hopefully one of the (other) UML maintainers can answer you.
> 
> Touche.
> 
> We will discuss that and possibly push a patch to !UML that part of the
> tree. IMHO it is not applicable.

I thought kunit is based on top of uml, and we do want to eventually adopt
that. Especially for helper libraries like ttm.

But also that's quite a bit in the future.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
