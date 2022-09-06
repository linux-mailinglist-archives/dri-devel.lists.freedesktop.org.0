Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBB5AF4DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75810EA67;
	Tue,  6 Sep 2022 19:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5BB10EA67
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:54:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id h1so7433212wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=nLFlBHZY1lvIxs+wDFQOuCeDs8kLFFZtfH1W2GDdEPo=;
 b=UqsTLgVjQLipDQfZb/x0qe5JDHCOxqku0e19QU0dYlou2/J8OVBZJeRDxNXiMt97Fh
 3E5z3Ckh+fTAiNAZ88UqDkC8Rxqq2be8e1Xcs8X8S+5QiUwgVbbGmxhGgJ8jaABZOpvw
 +SV8IhftYfLCmHJyD8EeqxTHO2IpFsS+Y4e0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nLFlBHZY1lvIxs+wDFQOuCeDs8kLFFZtfH1W2GDdEPo=;
 b=7g/QPpOjQdAXyHu8gcZqBJOrVbMT59ufjDKw2kDRSE8KCBzJJU3M0hF44R2pFUCSuB
 lKbREgiYUtd11pyauTh4MONn1yUNxtzOXHdUkiXXpdbwpMc1p7t4BqMaXxL7zG1Fk6/3
 9CpMT+2DHI5pjdKkMyzyuQdxCya57QNFUj0azXorcd4mYiqqA1c8NCup8mh21gv3cROG
 WrM5E++IbBP4mLgkaAwi58q8ENcUw1aFElLySy/MMRIW1HTVjy4Iz+1CNg6wk/yAht7m
 aDafjFA/XSPlHo0WpMhYFHA6ZCCbZEMRnVfeyd56VipMqPsrUiSlkxafW3RAH80qrtwY
 3VKg==
X-Gm-Message-State: ACgBeo0lyEi2ZURFWpVW9qHSRSyEUIGwXyuWl8zFM0NS4P5MGiNjNEUD
 PJ61xu4wZ3Miq6REjp1WcKQbsQ==
X-Google-Smtp-Source: AA6agR4Ex0Q2u9orVMhIMp0RV1p91dVmN3st8TBkHWlsBcXFUjkX8mk1vLkzR/Iodys0dLHtL7HtSw==
X-Received: by 2002:a05:600c:1c95:b0:3a5:c28a:df3e with SMTP id
 k21-20020a05600c1c9500b003a5c28adf3emr54685wms.40.1662494084388; 
 Tue, 06 Sep 2022 12:54:44 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c465600b003a839b9ba0asm20868743wmo.40.2022.09.06.12.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:54:43 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:54:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Re: [ldv-project] [PATCH v2] drm/fb-helper: add virtual screen size
 check to drm_fb_helper_check_var()
Message-ID: <YxelgRXMMxbJmlAH@phenom.ffwll.local>
Mail-Followup-To: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Strachuk <strochuk@ispras.ru>, ldv-project@linuxtesting.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220811144850.215377-1-strochuk@ispras.ru>
 <CAMuHMdXSnHJpy=27pkAfQC0v+tkpx7Q4Ze1=nvTmy+aMBeVPFg@mail.gmail.com>
 <da72ac1b-57ef-18c5-98c7-f6f1a4c11b8d@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da72ac1b-57ef-18c5-98c7-f6f1a4c11b8d@ispras.ru>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: ldv-project@linuxtesting.org, Andrey Strachuk <strochuk@ispras.ru>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 11:59:00PM +0300, Alexey Khoroshilov wrote:
> For v2 I would suggest to update description to something like this:
> 
> Make sure that virtual screen size is not less than physical screen one.
> 
> and comment to:
>     /* make sure that virtual resolution >= physical resolution */

Did this land somewhere? If not please resend with r-b tags and
everything.

Thanks, Daniel

> 
> --
> Alexey
> 
> 
> On 11.08.2022 17:54, Geert Uytterhoeven wrote:
> > Hi Andrey,
> > 
> > On Thu, Aug 11, 2022 at 4:49 PM Andrey Strachuk <strochuk@ispras.ru> wrote:
> >> Add virtual screen size check to drm_fb_helper_check_var() in
> >> order to validate userspace input.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with syzkaller.
> >>
> >> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
> > 
> > Thanks for the update!
> > 
> >> Fixes: 785b93ef8c30 ("drm/kms: move driver specific fb common code to helper functions (v2)")
> > 
> > I'd drop the Fixes tag completely, as the bug was present in the
> > intel and radeon drivers before. But probably it doesn't matter, as no one
> > is gonna backport this to v2.6.31 and earlier ;-)
> > 
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> > 
> > _______________________________________________
> > ldv-project mailing list
> > ldv-project@linuxtesting.org
> > http://linuxtesting.org/cgi-bin/mailman/listinfo/ldv-project
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
