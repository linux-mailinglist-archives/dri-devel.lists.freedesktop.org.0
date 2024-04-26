Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1E8B3B6A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FAB10ED84;
	Fri, 26 Apr 2024 15:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="G+G0NAa+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341A910ED84
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:28:50 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-69b10ead8f5so11403876d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714145327; x=1714750127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VL2JVp5517IAZMpOsSFYe/avtgfEuaWIXQ+vHOFMkZg=;
 b=G+G0NAa+z0nxxRLRI2BpGSdTJB6txd4yorDwKfxj72tz0NgNkNfiaI1SEso+I77NZ/
 ibWHiEQ+bT1xt6sJI5npRjfxTyWNWLhAyIBmfdlySzcH+EQHPi0pIICsAY4DVK7k0zSg
 bMyqg6WNGwg8i4BpuTHU/zAoOtBuPlHX7G1bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145327; x=1714750127;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VL2JVp5517IAZMpOsSFYe/avtgfEuaWIXQ+vHOFMkZg=;
 b=UhaU+ykPwd8TneChBGw55O5EqyxL4tMHI717UETOF8glVoYkEPfUPP4Ino9NyJQbXV
 be5lIQK4eN+HDhA6DxAjbBF1y4JHyHTEdGiCvO8IbcH/QO4FkVnhZ8cFYk7YrCRvIDqL
 ijE/oHgsELvme3nKQsJJUy0ehqjedtSVZQBb94+dLRmvrSp67zyo79UTpsd+HxlqBn0A
 qzLmuXliCcpIiIzv3QdMsS+oCLzRLYyhdBibyfP/dgTcLAwqptnHfUr09HUt0A8wzSjY
 6qwZgcP53SrgKEyd7/QuDpKa/RlV7n9p/yzm0cHkMWGTfw7SgZnaS0aFv6RxKY0uYY1/
 PGZw==
X-Gm-Message-State: AOJu0YwSAqp8r5XNG5VFcrZ8tnVLyK8E8ja1GMdooEuy2e8i9/fQLxzW
 N1pM+yxsLdxBjH6oSR3VD6HNOrzWDJA0+mlyhMXwR9cm0ujH64VmAOgYQSwga9hlz8rv8pGncfI
 =
X-Google-Smtp-Source: AGHT+IGpb83ASaUPVRaSlcaOs/1LKgybYWkRVQFot4ISscfbeHvehOOgMSLzgWxrB0o8P5Ofy8DFCg==
X-Received: by 2002:a05:6214:c43:b0:6a0:b3cc:ee06 with SMTP id
 r3-20020a0562140c4300b006a0b3ccee06mr1448902qvj.37.1714145327388; 
 Fri, 26 Apr 2024 08:28:47 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 s11-20020a0c8d4b000000b0069ba200fd5csm6739566qvb.70.2024.04.26.08.28.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:28:46 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-434ffc2b520so194051cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:28:46 -0700 (PDT)
X-Received: by 2002:ac8:72d8:0:b0:434:d055:5b00 with SMTP id
 o24-20020ac872d8000000b00434d0555b00mr280304qtp.20.1714145326083; Fri, 26 Apr
 2024 08:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
 <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
 <8734r85tcf.fsf@intel.com>
In-Reply-To: <8734r85tcf.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Apr 2024 08:28:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNbRauayNFNOODm-aaaLy2_vJk8OW-mR_XmLv505RtGA@mail.gmail.com>
Message-ID: <CAD=FV=XNbRauayNFNOODm-aaaLy2_vJk8OW-mR_XmLv505RtGA@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang <hsinyi@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
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

On Fri, Apr 26, 2024 at 3:09=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> > 2. Accept that a slightly less efficient handling of the error case
> > and perhaps a less intuitive API, but avoid the goto.
> >
> > Essentially you could pass in "ret" and have the function be a no-op
> > if an error is already present. Something like this:
> >
> > void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi,
> > const void *data, size_t len, int *accum_ret)
> > {
> >   if (*accum_ret)
> >     return;
> >
> >   *accum_ret =3D mipi_dsi_dcs_write_buffer(dsi, data, len);
>
> No reason you couldn't do error logging here
>
>         if (*accum_ret)
>                 dev_err(...)

Yup, exactly. This is probably best.


> > }
> >
> > ...and then the caller:
> >
> > int ret;
> >
> > ret =3D 0;
> > mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0xcd, &ret);
> > mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETMIPI, 0x84, &ret);
> > mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0x3f, &ret);
> > mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETVDC, 0x1b, 0x04, &ret);
> > if (ret)
> >   goto some_cmd_failed;
> >
> > This has similar properties to solution #1.
>
> I like this option the best, for the simple reason that the caller side
> is aware of what's going on, there's no magic control flow happening,
> and they can add error handling in the middle if they so choose.

Sounds good to me. I went back and forth a bit between solution #1 and
this and I see the benefits of both. If folks like this one I think we
should run with it. Certainly it's better than the current hidden
return.



> I don't find this unintuitive, but if it helps, you could conceivably
> add a context parameter:
>
>         struct mipi_dsi_seq_context context =3D {
>                 .dsi =3D dsi,
>         };
>
>         mipi_dsi_dcs_write_seq(&context, HX83102_SETSPCCMD, 0xcd);
>         ...
>
>         if (context.ret)
>                 ...
>
> And even have further control in the context whether to log or keep
> going or whatever.

I agree there are some benefits of adding the extra "context"
abstraction and we can go that way if you want, but I lean towards the
simplicity of just passing in the accumulated return value like I did
in my example.


I'll try to write up patches and see if I can post them later today.

-Doug
