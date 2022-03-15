Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BFF4D9BAF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 13:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973910E43B;
	Tue, 15 Mar 2022 12:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30DF10E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 12:57:38 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id e22so14876212qvf.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NcySFWs72+ekNVQe/iSrb9ADVfTngo3pJTXSZ1gdhw=;
 b=aD0+RK1f+djjXaYyUeiZmUW010D3ddcJo40HDZCjDVulVilNW6UyozCm5q6B7yYNPF
 PxJRn3Nhw6h/nRjo34Z6uEXug0mmuRelZRylOzAhUXRPdMMiP1bLpJJ71cZ6MMo0w2K8
 4RFmJaze+lkUcivc+pyg6YyTfefwp/0VMt++SxV6boYZr2u4uX2AKUHCVJBx0quM+L0t
 tIGzUDrVf8CAAVoKpT9VlEb/WF3ulBMVzUWK1cIAzDykYp8OGg9sUy3oXB7WGuReURqd
 cjlhmGF5RVe89NjWwr03WeIj754hovFp2UjCaVKNNljj/qPlf96Vu/Z4hSiTmtFpzbil
 1+Ng==
X-Gm-Message-State: AOAM5311AvGDs3mHPTPmO9YzuNjkmFBI4ToQwbfl2oMZS3bc5ZUY8k+U
 Ds2kkDhQTAM8Fv+pZtYBNJRrBZk/0dAlug==
X-Google-Smtp-Source: ABdhPJzBuDT8NyxlGSdudfYpvCY+fyMU55+EDjfemiTIlH45UWQhSC28E0FvHpUfQXCecjmfgU+s4A==
X-Received: by 2002:ad4:5942:0:b0:435:cff5:ebe6 with SMTP id
 eo2-20020ad45942000000b00435cff5ebe6mr21146214qvb.34.1647349057072; 
 Tue, 15 Mar 2022 05:57:37 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 bm21-20020a05620a199500b0067d5e6c7bd8sm7473304qkb.56.2022.03.15.05.57.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:57:36 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2dbd8777564so200843207b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 05:57:36 -0700 (PDT)
X-Received: by 2002:a81:5a08:0:b0:2db:d8c6:7e4f with SMTP id
 o8-20020a815a08000000b002dbd8c67e4fmr24074505ywb.256.1647349056232; Tue, 15
 Mar 2022 05:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-5-geert@linux-m68k.org>
 <43b88d77-bcba-e6d5-b51f-56c5c8c0318c@redhat.com>
In-Reply-To: <43b88d77-bcba-e6d5-b51f-56c5c8c0318c@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Mar 2022 13:57:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAY2QOLAXG9cH_ZMRFrRjoGmxxV97q8=Pm5bd_kXtzxg@mail.gmail.com>
Message-ID: <CAMuHMdUAY2QOLAXG9cH_ZMRFrRjoGmxxV97q8=Pm5bd_kXtzxg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm: ssd130x: Reduce temporary buffer sizes
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Tue, Mar 15, 2022 at 1:32 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 3/15/22 12:07, Geert Uytterhoeven wrote:
> > ssd130x_clear_screen() allocates a temporary buffer sized to hold one
> > byte per pixel, while it only needs to hold one bit per pixel.
> >
> > ssd130x_fb_blit_rect() allocates a temporary buffer sized to hold one
> > byte per pixel for the whole frame buffer, while it only needs to hold
> > one bit per pixel for the part that is to be updated.
> > Pass dst_pitch to drm_fb_xrgb8888_to_mono_reversed(), as we have already
>
> Just drm_fb_xrgb8888_to_mono() since you already fixed the name in patch 1/5.

Bummer, that happens when reshuffling patches :-(
Fixed for v2.

> > calculated it anyway.
> >
> > Fixes: a61732e808672cfa ("drm: Add driver for Solomon SSD130x OLED displays")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
>
> Indeed. I haven't noticed that got the calculation wrong until you pointed out.
>
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
