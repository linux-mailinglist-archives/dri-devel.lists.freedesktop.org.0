Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304A874530
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 01:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129B113628;
	Thu,  7 Mar 2024 00:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eUkzivJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B84113628
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 00:38:03 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7882b1e87c4so26691985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 16:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709771880; x=1710376680;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7/zi3CCS/AlP7Knl+RPHO7eIgrqMmuL7/+zYnH8IaA=;
 b=eUkzivJJ6YrGvHNGq7IcEGF8in9moncPzmLBIfrh2y8kZH9wX9PJIu0B8T+RM801uv
 /XUY4JEuysIP8NEHxBkEqmewsDOMna5ZBZwt5k780x2QNwtrfBpZ6eNQhhV3SugxnkV9
 fNxTv2zo+nS+MJA4notf2U5KmuXU4czdSo4NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709771880; x=1710376680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7/zi3CCS/AlP7Knl+RPHO7eIgrqMmuL7/+zYnH8IaA=;
 b=j28q4ttIxjY61076rKzvaqR//hYLE9WrpwLZJSZtSaNK8D5s7vgCC7mH2XHH2+MgEv
 KbM1tp7Df4pUwWIfl4CvBmGXFQ/lyoNL1wIzfs7ZvXoHOxgnSwDQLLdxDCDZKFoyENfX
 flw7iWMmEtYvNFY0jo5Fc5lJcUjpnU7t+xxkV2CvGdHLRRo4wfIVCK+008p5V2bojAGB
 49LwJep42O7t0z+/Ko78t9bBA+VFFqAm3MZaMqzlmilxv2o3hNaXZgZ6KunOULIp1OZS
 x4cIvHAI1AFJiV9dDKshECU6bp7alhcqWojqSM8kDOx3ouZZfYDeEVMKuUorUIUaI5p1
 dKHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNC051oAfyQiaQ2KO8VNKGKhyo0vN0g4UhNrmYq1Aizj8LWJA7kLCftkFOP7uJjLCXL5lvkGvPrJHJ62tlhbsLp5fhCQWTirStB9yV97M
X-Gm-Message-State: AOJu0Yx2uvrsc7z6a3DwwGDjMhJnB2/AVJ5JyMXbPh1f1w+8hB+9FRJ2
 Ecy9/m+5RrdeHB1zPcEK3WuhHAP3w5GPTQqu9h+yIa/iQLkSUrYKC0tg7yPOC8AgBd570Pg7IcI
 =
X-Google-Smtp-Source: AGHT+IHTN/+RZlL8cUsEsP75jKtMWu0/tk6T0NKAhmmsPhUy2FgP4ISdMjoDV3gx23IR7BX8GA0yMA==
X-Received: by 2002:a05:620a:2237:b0:788:3c9f:e37d with SMTP id
 n23-20020a05620a223700b007883c9fe37dmr3632715qkh.12.1709771879963; 
 Wed, 06 Mar 2024 16:37:59 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05620a125100b007881f769315sm4739266qkl.68.2024.03.06.16.37.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 16:37:59 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so134561cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 16:37:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWYrnFST51X9hIfbdSd9WJibSDxxhzAOoHBMdzZc5dU7C8OU0hm/ZgGmsAJ4n2otsQR14k8AXeBeJQGvcYUBRfu+gEmJYrXDnhANapDyetZ
X-Received: by 2002:a05:622a:1a0e:b0:42f:a3c:2d46 with SMTP id
 f14-20020a05622a1a0e00b0042f0a3c2d46mr97100qtb.7.1709771878386; Wed, 06 Mar
 2024 16:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
 <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
 <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
In-Reply-To: <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 16:37:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
Message-ID: <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Wed, Mar 6, 2024 at 4:20=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> On Wed, Mar 6, 2024 at 3:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
> > >
> > > +static void
> > > +match_identity(const struct detailed_timing *timing, void *data)
> > > +{
> > > +       struct drm_edid_match_closure *closure =3D data;
> > > +       unsigned int i;
> > > +       const char *name =3D closure->ident->name;
> > > +       unsigned int name_len =3D strlen(name);
> > > +       const char *desc =3D timing->data.other_data.data.str.str;
> > > +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_data.=
data.str.str);
> > > +
> > > +       if (name_len > desc_len ||
> > > +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME)=
 ||
> > > +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRIN=
G)))
> > > +               return;
> > > +
> > > +       if (strncmp(name, desc, name_len))
> > > +               return;
> > > +
> > > +       /* Allow trailing white spaces and \0. */
> > > +       for (i =3D name_len; i < desc_len; i++) {
> > > +               if (desc[i] =3D=3D '\n')
> > > +                       break;
> > > +               if (!isspace(desc[i]) && !desc[i])
> > > +                       return;
> > > +       }
> >
> > If my code analysis is correct, I think you'll reject the case where:
> >
> > name =3D "foo"
> > desc[13] =3D "foo \0zzzzzzzz"
> >
> > ...but you'll accept these cases:
> >
> > desc[13] =3D "foo \nzzzzzzzz"
> > desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"
> >
> > It somehow seems weird to me that a '\n' terminates the string but not =
a '\0'.
>
> I'm also not sure about \0... based on
> https://git.linuxtv.org/edid-decode.git/tree/parse-base-block.cpp#n493,
> they use \n as terminator. Maybe we should also reject \0 before\n?
> Since it's not printable.

Ah, OK. I guess the EDID spec simply doesn't allow for '\0' in there.
I guess in that case I'd prefer simply removing the code to handle
'\0' instead of treating it like space until we see some actual need
for it. So just get rid of the "!desc[i]" case?

-Doug
