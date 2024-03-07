Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE98759BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 22:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DA010E842;
	Thu,  7 Mar 2024 21:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BXKKHTuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC8910F5B8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 21:46:55 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-69096fe743dso5820846d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 13:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709848012; x=1710452812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4K+s5sUxDYWx5pg6uBsJMOUkr+xrBl+2jFYJBWQaGY=;
 b=BXKKHTuGhKW+hish0d1axMwncYoii/9nEDnjnJEJMSQRjekCe83BTFRmFGK3rp+s1A
 brEH9F4+pLPXdZg2ZbKUybxq6Bz8cDQxJK5gWmx0oms3s4v0pNEh+L+5cRTyPJQUgGpr
 hHoa9JUW9FolgxTG5atpbD2FLTeiI1X8vyGuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709848012; x=1710452812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q4K+s5sUxDYWx5pg6uBsJMOUkr+xrBl+2jFYJBWQaGY=;
 b=k4bMdjVndN1Xxl+u7Pt4zKNbV+EzgaK3CoVlDvqSVDNtrOFxw92YX9yIYmtKtjG42U
 ClRQBcYFrNILXHknelG0dGZQuWaq/WbP+lX0nViZI6/h3tLfTqEeZobowoYxcflS293w
 Wsj9cjv0CCi9secVsMLdvLeO6lLdlyTBziTqYapWoYHRoea3dX3nTjZZVXd9gjr613kC
 oXf12iBge3wr1icpLMugW6R6Dz+xHhgZFuDlXSlNl6nr3F2gGuiY1K/vuksftIyjg98C
 pokxSSTa8ADBsNH/BsS9zYioflNH8Vtla1OB8l4aqVaoRG15EylUS4mkg8xx2n9iCR9P
 +RiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+NtkQd0LMDkfEbcCMZ/uagUl2z7eaE98utTKnUH9oM0k/uRQnTXmrDQZ0fmhvrTx2MYM9Ae5DAgA8ZlHb2mD9lg1dAi42y6yMzj23Xn5i
X-Gm-Message-State: AOJu0YyPkWGgtf4rgRaRwFNHx70GCD1+Zrnz2r94ui6xfIEgfQF0N4He
 TnzpF7X3FAd6sLQnxyY6cPfunsWF/vxOhLC8TVPS+eMayNLZgkMQIITyPTKPZpQSlNMX5w5v+ws
 =
X-Google-Smtp-Source: AGHT+IGdHYupzIcTM0xWvrgGjm8fCmpUzqSQ/1BgDmBj9svU05+S2YH8JEo1WegpIiAxW26kzly30A==
X-Received: by 2002:a05:6214:284:b0:690:9a28:a28f with SMTP id
 l4-20020a056214028400b006909a28a28fmr5356950qvv.28.1709848012441; 
 Thu, 07 Mar 2024 13:46:52 -0800 (PST)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 op29-20020a056214459d00b0068fa815b517sm9134294qvb.6.2024.03.07.13.46.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 13:46:51 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-42f024b809cso81951cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 13:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUrbQLJG+8OSsyre0tH3WasUGLzFCiSWEr/yqMZRgdzfsw8ykIMoLYaVm8dnc4jxmSX7+SRRyNYTpa52DkL+LredfK5fcoDyKth9WyPJILW
X-Received: by 2002:ac8:5fd6:0:b0:42e:f79c:ca37 with SMTP id
 k22-20020ac85fd6000000b0042ef79cca37mr425362qta.18.1709848010477; Thu, 07 Mar
 2024 13:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-7-hsinyi@chromium.org>
 <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
 <87msraw4q6.fsf@intel.com>
 <CAJMQK-izRv18V1o7_Q23vWFXQsFgaR74xxZ4Vby0FVtNn21TMg@mail.gmail.com>
 <874jdhwzw4.fsf@intel.com>
In-Reply-To: <874jdhwzw4.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Mar 2024 13:46:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKWd743ZWOgkP4Sn_aq9ca97QygdEcS93=tcGa7r7s8g@mail.gmail.com>
Message-ID: <CAD=FV=UKWd743ZWOgkP4Sn_aq9ca97QygdEcS93=tcGa7r7s8g@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and add
 a variant
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Mar 7, 2024 at 12:28=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 07 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > On Thu, Mar 7, 2024 at 5:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.i=
ntel.com> wrote:
> >>
> >> On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> >> > Hi,
> >> >
> >> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromiu=
m.org> wrote:
> >> >>
> >> >> @@ -1009,6 +1009,19 @@ static const struct panel_desc auo_b101ean01=
 =3D {
> >> >>         },
> >> >>  };
> >> >>
> >> >> +static const struct drm_display_mode auo_b116xa3_mode =3D {
> >> >> +       .clock =3D 70589,
> >> >> +       .hdisplay =3D 1366,
> >> >> +       .hsync_start =3D 1366 + 40,
> >> >> +       .hsync_end =3D 1366 + 40 + 40,
> >> >> +       .htotal =3D 1366 + 40 + 40 + 32,
> >> >> +       .vdisplay =3D 768,
> >> >> +       .vsync_start =3D 768 + 10,
> >> >> +       .vsync_end =3D 768 + 10 + 12,
> >> >> +       .vtotal =3D 768 + 10 + 12 + 6,
> >> >> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> >> >> +};
> >> >> +
> >> >>  static const struct drm_display_mode auo_b116xak01_mode =3D {
> >> >>         .clock =3D 69300,
> >> >>         .hdisplay =3D 1366,
> >> >> @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> >> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, =
"B116XAN06.1"),
> >> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, =
"B116XTN02.5"),
> >> >>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, =
"B140HAN04.0"),
> >> >> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay=
, "B116XAK01.0"),
> >> >> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay=
, "B116XAN04.0"),
> >> >> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.dela=
y, "B116XAK01.0 ",
> >> >
> >> > Remove the trailing space from the string above now?
> >>
> >> Maybe it actually needs to be considered part of the name; see my othe=
r
> >> reply in the earlier patch.
> >>
> > I randomly checked 3 of the AUO panels that I had a datasheet with,
> > and all of them have a white space padding before \n.
> > The descriptor of that field is marked as "Reserved for definition",
> > unlike other characters, representing the name, which are marked with
> > "Manufacture P/N".
> >
> > For this example, do we still want to consider the white space part of
> > the name? I know they didn't follow the spec exactly.
>
> If there's one thing that's for sure, EDIDs are full of stuff like this,
> across the board.
>
> Ignoring the whitespace at the end seemed reasonable, initially, to me
> too. But the question is, if we start catering for this, what else
> should we cater for? Do we keep adding "reasonable" interpretations, or
> just go by the spec?

Personally, I don't really care a whole lot either way. If I had to
make a judgement call I think it's a little cleaner the way Hsin-Yi
has it where we ignore whitespace at the end. Given that Dmitry also
suggested ignoring whitespace at the end [1] I guess I'd believe that
he also feels it's a little cleaner that way. However, If the only way
to get the patch series landed is to put the space at the end of the
name in panel-edp.c then I'm OK with that.

In terms of what else we should cater to, I guess we'd have to answer
that question when it comes up, with a bias against adding more
special case rules. _Hopefully_ it won't be common that we even need
this code and it will be the exception rather than the rule that
panels with incompatible timings have the same panel ID anyway...

In any case, hopefully the above explains my opinion on this. If you
feel strongly that we should remove the code handling whitespace at
the end then so be it. If you're on the fence then I guess I'd say
let's keep it...


[1] https://lore.kernel.org/lkml/CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz=
51TJeSQrA@mail.gmail.com/
