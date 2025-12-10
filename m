Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38BCB3F08
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 21:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAC210E281;
	Wed, 10 Dec 2025 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RhGeQF25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595510E281
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 20:21:42 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-6446d7a8eadso228197d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 12:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765398101; x=1766002901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZInM0NiQ7nFRNVeTnm9fViGpDJsRjTXAmkv4itoNQY=;
 b=RhGeQF25iEUoui9orGhMV78pW9mOWUXLLOc5Vab00MKU/hGpFFJxifFXHKujL3H6/0
 qNDIMyJkQO8We+U/QQR0rncs7Yd8ybgtrcZaJ6YlGNj/GLEh0A4tZ+T5uRrKmmkXrYw/
 zUXRX08Om+Paxu1ZP0/DAdASsBl8z9Ew+u7plrazYtLyxwdR1ZQJT4uFf1iNdiwzmapV
 A3oAt1SDe1wSWcaZCUZb12pR6JRGE2ZIWYxd9LsqmFZcTl9dBxMETMbLLVpH0QLzzHrl
 Bri/crM+WY4rAvKbUhSpranMBRxSy07RqqqcEZuMKswweZmbjw96EiQdWpaze6c/lTR2
 fHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765398101; x=1766002901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ZInM0NiQ7nFRNVeTnm9fViGpDJsRjTXAmkv4itoNQY=;
 b=Udsq3YU9egDpP0nMFk0mQX2dqCGmUnc4pVfm3tFuYYdgDIJMWwmDmHYUc5HN3frj7a
 Klks/d6plelvfF4HDFCUlsGkBBocFARZQ+2o5tyFDUd29hk6gKuC0QisEK6D41Qnz43X
 8X48O/iF7AX8QfNCe5w+GCKYlFcwLvBr0k8rzplOzyEoMvPSbcF1SGftCCvXUaW+tICe
 GmMncbZl0mT5Oj9WeVRc03bjl4Z8wCKOaur04hAUaozcXDmA0Y8o/uwTY1GxYUSB2bkH
 kh98SsXhnZ19P31agZyAcwLk+MbwwH8/HPOZ8A8kBv/4o3LvpiC3W2G3HA4+ZBZcgehR
 ZeGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq3KCyqdIP1jLwaY0x3HTcbgLuxnAC4E7gSAdwxVkjTworUOH3myxW6GwNwaWAFHCX+ESmjQSlhoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVpf08IzgRn3gg9Haqh48073hT/kKc7dzFPqAUMgbSsWM506Dm
 oWN6bx2zDgHw18umP+5wwdKMCF5K9N7Fa86NgoxcsufKEl0EH+AWnAe8pDiy0HuO6XiUGujcUuO
 i/pDg77CJMh8Jyz7VzCbKgWg5iy2/cHk=
X-Gm-Gg: AY/fxX5ScwfcVRW6RGcDuQzpWQHDfryTHWYh/6lXPzdGwg8eVFaPQ64Go0b3Ygn9Eue
 Kbq7YIF0/vBSUXxRYM0qKHxjvhbiC6CA2FYG1+1Duf+T5DZcEzE27QF8+7qyFihz4Bq54tvIf+R
 3DdkAIJrDV/UOGmejwbhcyn5mXAdg3kjCwVbAyI6z4KmI7NM60v2xSvvcnQQ2ZA07NhuOF0vWyK
 m659+kZ0sjOtUBq5r7NesO/uVRCPBg9TooA/u0OBNpml+jja3ZU55CB3O5JoC12kIse98DsDw==
X-Google-Smtp-Source: AGHT+IEd9Yp9ouRQjIqIHHL1BlQLYeX2qiLXcyiE+UEnu7ZeLOvh/BJcmz8Vq8ERwxLtQQLqXX/tsXg0aWvRF87WFhI=
X-Received: by 2002:a05:690e:118e:b0:63f:a5ff:46a4 with SMTP id
 956f58d0204a3-6446e8fbc61mr2766089d50.6.1765398101139; Wed, 10 Dec 2025
 12:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <20251118201842.1447666-17-jim.cromie@gmail.com>
 <fcb2532d-5627-4bc3-a990-ed361b56ccd3@akamai.com>
 <CAJfuBxxeaZDY+-f=7R0RSnE7FAyPtB_O+S3E4L_OckKNRK+7ag@mail.gmail.com>
 <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
In-Reply-To: <9f36429d-1d6e-4501-a092-fbf45254d116@akamai.com>
From: jim.cromie@gmail.com
Date: Thu, 11 Dec 2025 09:21:15 +1300
X-Gm-Features: AQt7F2rPGZR4Rg44iJ3Xr_UOgelrQ39K4qdCvflmk1RdZDQ43aUgkyzsJSQAuHE
Message-ID: <CAJfuBxw8xV2RrbTWpmQFpCpiSp9A7KCLP74T_bu+4mxBROf1sg@mail.gmail.com>
Subject: Re: [PATCH v6 16/31] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
To: Jason Baron <jbaron@akamai.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com, 
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>
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

On Thu, Dec 11, 2025 at 8:14=E2=80=AFAM Jason Baron <jbaron@akamai.com> wro=
te:
>
>
>
> On 12/10/25 1:33 AM, jim.cromie@gmail.com wrote:
> > !-------------------------------------------------------------------|
> >    This Message Is From an External Sender
> >    This message came from outside your organization.
> > |-------------------------------------------------------------------!
> >
> > On Wed, Dec 10, 2025 at 11:43=E2=80=AFAM Jason Baron <jbaron@akamai.com=
> wrote:
> >>
> >> Hi Jim,
> >>
> >> Very minor nit below about the kernel-doc ordering for args...
> >>
> >
> >>> +/*
> >>> + * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
> >>> + * the contiguous subrange of elements matching on ->mod_name.  Copy
> >>> + * the subrange into @_dst.  This depends on vars defd by caller.
> >>> + *
> >>> + * @_i:   caller provided counter var, init'd by macro
> >>> + * @_sp:  cursor into @_vec.
> >>> + * @_box: contains member named @_vec
> >>> + * @_vec: member-name of a type with: .start .len fields.
> >>> + * @_dst: an array-ref: to remember the module's subrange
> >>> + */
> >>
> >> Not sure if the odering matters for the docs, but it makes it a bit
> >> harder read when these don't go in order.
> >>
> >> Thanks,
> >>
> >> -Jason
> >>
> >
> > I chose that doc ordering for clarity,  the easy ones 1st,
> > and @dst last since it gets the subrange info.
> > I think reordering might mean more words trying to connect
> > the pieces, and with less clarity.
> > It does work against the macro arg ordering,
> > which places @dst near the front,
> > I did that to follow  LHS =3D RHS(...)   convention.
> >
> > Im happy to swap it around if anyone thinks that convention
> > should supercede these reasons,
> > but Im in NZ on vacation right now,
> > and I forgot to pull the latest rev off my desktop before I left.
> > so I dont want to fiddle with the slightly older copy I have locally,
> > and then have to isolate and fix whatever is different.
> >
> > the same applies to the Documentation tweaks that Bagas noted.
>
> Couldn't you then re-order the function args to match the doc order inste=
ad?
>

As you might surmise, the code was written before the kdoc.
Since it is setting the @_dst, it feels like an assignment.
Therefore the LHS =3D RHS convention seemed pertinent,
and the macro args are ordered to conform to this.
For the (pseudo- since its not /** ) kdoc,
the linear explanation was simplest and clearest, ending with @_dst.

So I see these options (in my preferred order), please pick one.
1. leave as is
2. add an NB: that arg order differs from doc-order
3. change macro arg order
4. change kdoc arg order

If 2-4 can wait, I can do that trivially once Im home (in Jan)
Doing it now, from here, will require fiddling with git am on the mbox.gz
with which Ive had mixed results/troubles in the past.

thanks,
Jim

> Thanks,
>
> -Jason
>
>
> >
> >
> >
> >
> >
> >>> +#define dd_mark_vector_subrange(_i, _dst, _sp, _box, _vec) ({       =
         \
> >>> +     typeof(_dst) __dst =3D (_dst);                                 =
   \
> >>> +     int __nc =3D 0;                                                =
   \
> >>> +     for_subvec(_i, _sp, _box, _vec) {                              =
 \
> >>> +             if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {      =
 \
> >>> +                     if (!__nc++)                                   =
 \
> >>> +                             (__dst)->info._vec.start =3D (_sp);    =
   \
> >>> +             } else {                                               =
 \
> >>> +                     if (__nc)                                      =
 \
> >>> +                             break; /* end of consecutive matches */=
 \
> >>> +             }                                                      =
 \
> >>> +     }                                                              =
 \
> >>> +     (__dst)->info._vec.len =3D __nc;                               =
   \
> >>> +})
> >>> +
> >>>    /*
> >>>     * Allocate a new ddebug_table for the given module
> >>>     * and add it to the global list.
> >>> @@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct=
 ddebug_table *dt, struct _ddebug
> >>>    static int ddebug_add_module(struct _ddebug_info *di, const char *=
modname)
> >>>    {
> >>>        struct ddebug_table *dt;
> >>> +     struct _ddebug_class_map *cm;
> >>> +     int i;
> >>>
> >>>        if (!di->descs.len)
> >>>                return 0;
> >>> @@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_inf=
o *di, const char *modname)
> >>>
> >>>        INIT_LIST_HEAD(&dt->link);
> >>>
> >>> +     dd_mark_vector_subrange(i, dt, cm, di, maps);
> >>> +
> >>>        if (di->maps.len)
> >>>                ddebug_attach_module_classes(dt, di);
> >>>
> >>
>
