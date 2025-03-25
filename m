Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31560A706B1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B22610E565;
	Tue, 25 Mar 2025 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cB4oDeQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4725F10E561;
 Tue, 25 Mar 2025 16:23:58 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6fead317874so46366627b3.0; 
 Tue, 25 Mar 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742919837; x=1743524637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tvajp1z7h7S0xpIBdVLXi2Xx6HMtp2pRa+CQIj7GVM=;
 b=cB4oDeQ16vYXXL4aTIi25UinOLEpjbE/0Wjx840b+QsNFjwxzb3rq0PeT2NKvfKPEw
 +/Bb58oR8XB/0n9JF0qmdsVtZywVCK2Z6Pqya/xEY48I5zkVmmnNZrAOZ6AJcyMtZW/R
 321DfRoMJcmP1woRM1ZrPAQkYkiiunFOSVGNl++L5yte/DFIeBX46zhihFhX/Adgt2E7
 MCq5D0TVTB2n1n6us1BNvQjGTmZ7EsKM7cMErDuW8mWnAB5uoc0imeXlYMVhDgMlolzW
 v7xuYplB3wv09jy0vSGwwNRlZk/vvhuCnmBjmVwigSfswIIXknIpE0w7xonpnqu6J40g
 xkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742919837; x=1743524637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tvajp1z7h7S0xpIBdVLXi2Xx6HMtp2pRa+CQIj7GVM=;
 b=LikOjxWti494Ww9N0W5zL+Hy1H/tzOe/nXJl4ziZ9r6+LJoSALLibMuPqW+VwawKbS
 Z6tzO96IspodCrD6RGMb9fGxd2+0Qy6zqmyDhl1sAkQnL6jjcGbmE0pag781A0FEnRlo
 yKzuELkbdd6emCwZmb/fnyX/HfnG7xeePFJKnC/h8z+/+2RRnrJS3pgQeS48x+Lp3a5U
 Up3hC+ezli7U3APn+E3qlJGDjN08Q+HdPOtikTTLYBill1X0xBSSLqvC5dJC/3MF15dL
 GPw4b7rELTXox6Yj79wmFmkpkZSpc2z02Ezy9C6y3rhSixB9gvrPX68RpI6aOjSh8KZ3
 fdeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWg0X6w8u+E/pik94mbYHlpy33OCDZugGIIyY9dkeOmGrMJuMFg6UbvfHUNd8hDU8TCf6LMP8DK@lists.freedesktop.org,
 AJvYcCX9hmyUJN8uArdjR56YPU/zuejuhr83A13tu53LCJuA8PaDW6RMhVKC5p/9aQ48skSLJc1KY4nRjEfUMAbhc/2fQw==@lists.freedesktop.org,
 AJvYcCXKQ7j0Qn4HG/kZwl94ssKd+OPsxFLWDU9dtBpe9tEXwf6qqTod3ilckR0MIIn34ilIytXUoxY4Gpb2@lists.freedesktop.org,
 AJvYcCXao67Fe31tbSMG0d9M49WI8Bm3+/HzfWUbyaZOYBE119kZzDKX3rVXAeg1UCm6KNQsl0T4dtH24zQa@lists.freedesktop.org,
 AJvYcCXf1TEaORP9sCOCVK5JumxNK24HGw+hiIDejkbQM1otUTAGxgmOk2JqdmzbOyFVVv0btetL0L+VEuoONegabw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoV930oNBrDNl/boLlyYSF1m3VV3xk0IA82HB5Nwy7gLuLFil+
 1ueZ9LoJ2ggB+JpPjKWBppnWriOgyjxijWGi8yZ35ynGRG0cgBDU6nwJjPjlM/p9njcfVnO2zi4
 AhhQguJwAFhh3k7pnFcfb3rntnL8=
X-Gm-Gg: ASbGnct4676Z+OVzySL2JLti5oVpiNMK4iPfBxi9EhVm49OGl7t1EfSeKi09lpRwY9p
 orubWXxWBvb5IEsImkWLuFnAcggTmpZmDWTr96/gz7Jm/Kwy2nrznC1M1Fe+4Ee9n1wR9GOl4Pb
 y4uWfJiF4wQwKJNwwUJaIngdOm
X-Google-Smtp-Source: AGHT+IHvdSe6ls10wjFf5bZyI+Qsy8fQwauViiWeGwoJ0PgaQ5nRuZQauZvKQvLsCsA2s5Sf9UtaUnq1uwtCBzUkiGs=
X-Received: by 2002:a05:690c:3708:b0:6f9:afa2:acbd with SMTP id
 00721157ae682-700bad18b66mr239831077b3.38.1742919837042; Tue, 25 Mar 2025
 09:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-30-jim.cromie@gmail.com>
 <05dff3c7-91e8-4d42-b75a-90c410d6470d@bootlin.com>
In-Reply-To: <05dff3c7-91e8-4d42-b75a-90c410d6470d@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 25 Mar 2025 10:23:30 -0600
X-Gm-Features: AQ5f1JqQLsquNqtoxYfgRolUJVYd3SVfRGVGDiVPUxl9S4QdlGwEvycISFycUMY
Message-ID: <CAJfuBxyHzkNOrjsKQ5TmBX8UOpJDKnxZr-t+eQ52Hfkq3BVC-Q@mail.gmail.com>
Subject: Re: [PATCH v2 29/59] dyndbg: change __dynamic_func_call_cls* macros
 into expressions
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org, 
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 24, 2025 at 9:19=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 20/03/2025 =C3=A0 19:52, Jim Cromie a =C3=A9crit :
> > The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
> > (expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=3Dy becaus=
e
> > the invoked macro has a do-while-0 wrapper.
> >
> >     if (cond && (drm_dbg("expr-form"),1)) {
> >        ... do some more stuff
> >     }
> >
> > Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
> > macros into expressions, by replacing the do-while-0s with a ({ })
> > wrapper.  In the common usage, the trailing ';' converts the
> > expression into a statement.
> >
> >     drm_dbg("statement form");
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> > ---
> >   include/linux/dynamic_debug.h | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debu=
g.h
> > index 8043966a0fd6..80bcaad03400 100644
> > --- a/include/linux/dynamic_debug.h
> > +++ b/include/linux/dynamic_debug.h
> > @@ -339,20 +339,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descript=
or,
> >    * (|_cls): adds in _DPRINT_CLASS_DFLT as needed
> >    * (|_no_desc):     former gets callsite descriptor as 1st arg (for p=
rdbgs)
> >    */
> > -#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {        \
> > -     DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);      \
> > +#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({  \
> > +     DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
>
> Is it normal to remove the parenthesis around id? Or the other way
> around, why did you add parenthesis in PATCH 17?
>

heisen-thinking ?
noisy inputs ?
historically, checkpatch warnings on macros have given me difficulty
so I tend toward defense.
I think this one was a red-herring.

> >       if (DYNAMIC_DEBUG_BRANCH(id))                           \
> > -             func(&id, ##__VA_ARGS__);                       \
> > -} while (0)
> > +             func(&(id), ##__VA_ARGS__);                     \
> > +})
> >   #define __dynamic_func_call(id, fmt, func, ...)                      =
       \
> >       __dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,           \
> >                               func, ##__VA_ARGS__)
> >
> > -#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do { =
       \
> > +#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({  \
> >       DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);                \
>
> I expect the same constraints around id here, both with parenthesis, or
> no parenthesis at all.
>

yes, inconsistent.

> >       if (DYNAMIC_DEBUG_BRANCH(id))                                   \
> >               func(__VA_ARGS__);                                      \
> > -} while (0)
> > +})
> >   #define __dynamic_func_call_no_desc(id, fmt, func, ...)              =
       \
> >       __dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,        \
> >                                       fmt, func, ##__VA_ARGS__)
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
