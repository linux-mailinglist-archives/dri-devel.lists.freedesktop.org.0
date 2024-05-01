Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F48B8D7F
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D0911234C;
	Wed,  1 May 2024 15:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Zt75N5EA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC2411234C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:55:21 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-7da3ec3e044so324909639f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714578920; x=1715183720;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkEs8J1ffdIWhMMglu+CsW3L9Q3EHJqY0I8USedJfzM=;
 b=Zt75N5EAnTYxQVxt/6SN5rwyO4jCMnIHGoC2OJFAok2/jpHVOTG197vZ522BcTUjjG
 4y+zHa0AxZgyczwwdYVlyA/jVxc4g7EUUI8+0mv7pU1HJ+BZbOMpwnJiuRD2fOttygcu
 XMtgJrKhaZQZB76kiOoz+hyjpXDjZ59ch2Zes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714578920; x=1715183720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkEs8J1ffdIWhMMglu+CsW3L9Q3EHJqY0I8USedJfzM=;
 b=DXjo1EjCKQAYU6VUjT63G6lPqRHNe+M54uc7dberAo9k4/v96cF4R7NKVSCFRNXnOK
 3E5nmPjuqh4fe6RWE28+22gbhQDRk6V9uq9uF0yUSz5CW1ICiYZ3lmB753A4x6YJ0Wym
 B9n4h0xaG3iAuIOqj4cuZpjec0UPIcYdxgXsbZsAF/hIvGbjk+VuBGTEGZGMqoEGM578
 abfAH0Aa2mT73Pgp0BhQj2NBT2JzpqqaiU7z3ZhIHvLbJ/I07UX+NzP1JllMUZXiQ1Kz
 aDS/P3LG+dWhn1lMPBhjFcCBp+b8q0IQUtDdlW79EIKDjk/OOetFlSKzpa5qkTeCSspP
 RJNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+JHyo6ziLciXo2VlfKWd6xijNeYdhTeSrO+nqtC/93RSck69OBryrrzCvLTOnrORfgLWxyt0/qzqcKvh11uLJyfFGB9Ocy4BFr2PMp+gt
X-Gm-Message-State: AOJu0Yy9/ClK6KksLbAGRbOXPDBtDX37IlCik8KCUNiPGHcvTFvgydmk
 56UQ1VospjErS8uaqdPIhBnwRE0pxenf2iafCBjV9VB75/ILQhk12eAoEco57jjK73NSgcIjHXA
 =
X-Google-Smtp-Source: AGHT+IGBsa5QG12yvqgJYCL6MsQ9oPRq2G5pds41CCWPRP2a4NZqrYWjSVU0MGW+JTfZf0etZjkxHw==
X-Received: by 2002:a6b:6313:0:b0:7de:c81b:7a3d with SMTP id
 p19-20020a6b6313000000b007dec81b7a3dmr3493497iog.2.1714578920298; 
 Wed, 01 May 2024 08:55:20 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 ix27-20020a056638879b00b00487909f7416sm2546823jab.5.2024.05.01.08.55.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 08:55:20 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-36c670757aaso10135ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7vXcn7jYPOgkGTmg+bH4lrrMfogIvxLxCoHkK/WZ2VR/EbyuSenzKx1ackAKEqir/as0sychXDGSV55sJGReXGjjCCCFvOeH/I0ughqOO
X-Received: by 2002:ac8:5a0c:0:b0:43a:fa0d:69b5 with SMTP id
 n12-20020ac85a0c000000b0043afa0d69b5mr214045qta.7.1714578588051; Wed, 01 May
 2024 08:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
 <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
 <87y18w2n6h.fsf@intel.com>
In-Reply-To: <87y18w2n6h.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 May 2024 08:49:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X5jBqBgOqtm8nYtEKNHcnJgQDWj+ynS5U7KXuQgHLySg@mail.gmail.com>
Message-ID: <CAD=FV=X5jBqBgOqtm8nYtEKNHcnJgQDWj+ynS5U7KXuQgHLySg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Hsin-Yi Wang <hsinyi@google.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Joel Selvaraj <jo@jsfamily.in>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Apr 29, 2024 at 8:39=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 29 Apr 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Mon, Apr 29, 2024 at 2:38=E2=80=AFAM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> > +/**
> >> > + * struct mipi_dsi_multi_context - Context to call multiple MIPI DS=
I funcs in a row
> >> > + * @dsi: Pointer to the MIPI DSI device
> >> > + * @accum_err: Storage for the accumulated error over the multiple =
calls. Init
> >> > + *   to 0. If a function encounters an error then the error code wi=
ll be
> >> > + *   stored here. If you call a function and this points to a non-z=
ero
> >> > + *   value then the function will be a noop. This allows calling a =
function
> >> > + *   many times in a row and just checking the error at the end to =
see if
> >> > + *   any of them failed.
> >> > + */
> >> > +
> >> > +struct mipi_dsi_multi_context {
> >> > +     struct mipi_dsi_device *dsi;
> >> > +     int accum_err;
> >> > +};
> >>
> >> I like the design, but having a context struct seems over-engineered w=
hile we could pass
> >> a single int over without encapsulating it with mipi_dsi_multi_context=
.
> >>
> >> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ct=
x,
> >>                                      const void *data, size_t len);
> >> vs
> >> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi, int =
*accum_err,
> >>                                      const void *data, size_t len);
> >>
> >> is the same, and it avoids having to declare a mipi_dsi_multi_context =
and set ctx->dsi,
> >> and I'll find it much easier to migrate, just add a &ret and make sure=
 ret is initialized to 0.
> >
> > Yeah, I had the same reaction when Jani suggested the context style
> > [1] and I actually coded it up exactly as you suggest above. I then
> > changed my mind and went with the context. My motivation was that when
> > I tested it I found that using the context produced smaller code.
> > Specifically, from the description of this patch we see we end up
> > with:
> >
> > Total: Before=3D10651, After=3D9663, chg -9.28%
> >
> > ...when I didn't have the context and I had the accum_err then instead
> > of getting ~9% smaller I believe it actually got ~0.5% bigger. This
> > makes some sense as the caller has to pass 4 parameters to each call
> > instead of 3.
> >
> > It's not a giant size difference but it was at least some motivation
> > that helped push me in this direction. I'd also say that when I looked
> > at the code in the end the style grew on me. It's really not too
> > terrible to have one line in your functions that looks like:
> >
> > struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };
> >
> > ...and if that becomes the canonical way to do it then it's really
> > hard to accidentally forget to initialize the error value. With the
> > other API it's _very_ easy to forget to initialize the error value and
> > the compiler won't yell at you. It also makes it very obvious to the
> > caller that this function is doing something a little different than
> > most Linux APIs with that error return.
> >
> > So I guess I'd say that I ended up being pretty happy with the
> > "context" even if it does feel a little over engineered and I'd argue
> > to keep it that way. That being said, if you feel strongly about it
> > then we can perhaps get others to chime in to see which style they
> > prefer? Let me know what you think.
> >
> >
> > [1] https://lore.kernel.org/r/8734r85tcf.fsf@intel.com
>
> FWIW, I don't feel strongly about this, and I could be persuaded either
> way, but I've got this gut feeling that an extensible context parameter
> might be benefitial future proofing in this case.

I've gone ahead and sent out a v3 where I still leave it as taking
`struct mipi_dsi_multi_context`. Neil: if you feel strongly about it,
I have no problem sending out a v4. I still think that the size
savings of using the context are a good "tiebreaking" factor in
choosing between the two styles... ;-)

-Doug
