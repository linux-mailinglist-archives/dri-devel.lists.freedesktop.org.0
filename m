Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D949875751
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677EE10E5DE;
	Thu,  7 Mar 2024 19:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="V8WRY3aQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651C1132FC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 19:35:18 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6ddf26eba3cso945806a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 11:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709840117; x=1710444917;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cK3ZSwKK2C4Sgaq4Kpjc9c6oG9lJHBr2owryJEMOEvc=;
 b=V8WRY3aQOMoykIsgmObwC1FhbyXTc5fixyyPqi8Fob4JxPIl8d3wIlEbH3gHhjNVd2
 WVyPI+J8gZW4kslgdMoJB57BgwchlV44eBVv6j/clDMS5ejw9/wJeKYkc0KzjfzlXvPB
 eKfPkikYpxfg2ktw/wZ27KdfeXz1SUhtkUQhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709840117; x=1710444917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cK3ZSwKK2C4Sgaq4Kpjc9c6oG9lJHBr2owryJEMOEvc=;
 b=gd72+Bzg0GN932OVH7U98Eut6Gamt+NXVIrSh78ZTkN25qPn03d+4fmrANeEDeq1RP
 cx2NGPy9ZGfJ78ndu+GqAPBhwyMRRLOr4mAxrhrnqbL+HEu+FJKYA8XiliDEtikgoA0f
 IxhvzAqHctmw0mG8ToIxhXWQUwSrruREwgr46STONPJMidawkDPkoO1miZlieFBXSs9l
 eTxtdnqKDLJwEsuWZgYI0Pa6K9Pe8Ua1aj2cNZAfgIUrhcoxKbj1abjZWPGLAvMgDwG3
 1C4XKcG0xleGk+l+iZp6LsWks02S8CSMtf5e++w5gWH+i6mTkM/iL6NnC4herX95FZyK
 fBZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKZa4iv4117ru+S4QKlK5kIq7gatf7GBaPCcW1wzQLaC1YqgREzZdBniZsvPgdzs2lxPXd5DeWmeATiu5I7TtLiXkLbszAajmX2JaM1rxi
X-Gm-Message-State: AOJu0Ywj37Mr4PNrpa+B+mTeCKc14VgIMXumZGhZht9No55WC/rO5ne9
 BNLUrDFidXWmdRAu75hM2/D/BHeFc22ccUDxPRMmqCNXD+fsPsaK+uXq4w9qhDLXgwlSmmBrFY1
 yQJGDc4MzFggtmjniTGu0Ica8T3K5MWel1TE6
X-Google-Smtp-Source: AGHT+IEa7Z6B5cOslGdycgOfQrqUbifAuF6iyS6t6w765cGIbVMH6LPjb9/MiG331Yt0RpMjBp9oH47As6PW+ZAKdpc=
X-Received: by 2002:a05:6830:3449:b0:6e5:253:1af8 with SMTP id
 b9-20020a056830344900b006e502531af8mr5990484otu.22.1709840117072; Thu, 07 Mar
 2024 11:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-4-hsinyi@chromium.org>
 <CAD=FV=W2CKoOyhN49RBU0FdzcRC6SEwvVQYdJRnBBK16Lp-=FQ@mail.gmail.com>
 <CAJMQK-i=0COuMGW+PGv3zT4+JgwJc_Qj9oQHva6EQys_n3xoHA@mail.gmail.com>
 <CAD=FV=VHaU4HZHGp6tSoVuJRbYD9nrMZfNdnOait=ApRcvcmug@mail.gmail.com>
 <87r0gmw544.fsf@intel.com>
In-Reply-To: <87r0gmw544.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 7 Mar 2024 11:34:51 -0800
Message-ID: <CAJMQK-igm-OXa=L-Bb0hdm5+KL98sk9UAznvAR7SptP9iwWAoA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/edid: Add a function to match EDID with
 identity
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Doug Anderson <dianders@chromium.org>,
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

On Thu, Mar 7, 2024 at 5:20=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Wed, 06 Mar 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Wed, Mar 6, 2024 at 4:20=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.or=
g> wrote:
> >>
> >> On Wed, Mar 6, 2024 at 3:30=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromiu=
m.org> wrote:
> >> > >
> >> > > +static void
> >> > > +match_identity(const struct detailed_timing *timing, void *data)
> >> > > +{
> >> > > +       struct drm_edid_match_closure *closure =3D data;
> >> > > +       unsigned int i;
> >> > > +       const char *name =3D closure->ident->name;
> >> > > +       unsigned int name_len =3D strlen(name);
> >> > > +       const char *desc =3D timing->data.other_data.data.str.str;
> >> > > +       unsigned int desc_len =3D ARRAY_SIZE(timing->data.other_da=
ta.data.str.str);
> >> > > +
> >> > > +       if (name_len > desc_len ||
> >> > > +           !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NA=
ME) ||
> >> > > +             is_display_descriptor(timing, EDID_DETAIL_MONITOR_ST=
RING)))
> >> > > +               return;
> >> > > +
> >> > > +       if (strncmp(name, desc, name_len))
> >> > > +               return;
> >> > > +
> >> > > +       /* Allow trailing white spaces and \0. */
> >> > > +       for (i =3D name_len; i < desc_len; i++) {
> >> > > +               if (desc[i] =3D=3D '\n')
> >> > > +                       break;
> >> > > +               if (!isspace(desc[i]) && !desc[i])
> >> > > +                       return;
> >> > > +       }
> >> >
> >> > If my code analysis is correct, I think you'll reject the case where=
:
> >> >
> >> > name =3D "foo"
> >> > desc[13] =3D "foo \0zzzzzzzz"
> >> >
> >> > ...but you'll accept these cases:
> >> >
> >> > desc[13] =3D "foo \nzzzzzzzz"
> >> > desc[13] =3D "foo \0\0\0\0\0\0\0\0\0"
> >> >
> >> > It somehow seems weird to me that a '\n' terminates the string but n=
ot a '\0'.
> >>
> >> I'm also not sure about \0... based on
> >> https://git.linuxtv.org/edid-decode.git/tree/parse-base-block.cpp#n493=
,
> >> they use \n as terminator. Maybe we should also reject \0 before\n?
> >> Since it's not printable.
> >
> > Ah, OK. I guess the EDID spec simply doesn't allow for '\0' in there.
> > I guess in that case I'd prefer simply removing the code to handle
> > '\0' instead of treating it like space until we see some actual need
> > for it. So just get rid of the "!desc[i]" case?
>
> The spec text, similar for both EDID_DETAIL_MONITOR_NAME and
> EDID_DETAIL_MONITOR_STRING:
>
>         Up to 13 alphanumeric characters (using ASCII codes) may be used
>         to define the model name of the display product. The data shall
>         be sequenced such that the 1st byte (ASCII code) =3D the 1st
>         character, the 2nd byte (ASCII code) =3D the 2nd character,
>         etc. If there are less than 13 characters in the string, then
>         terminate the display product name string with ASCII code =E2=80=
=980Ah=E2=80=99
>         (line feed) and pad the unused bytes in the field with ASCII
>         code =E2=80=9820h=E2=80=99 (space).
>
> In theory, only checking for '\n' for termination should be enough, and
> this is what drm_edid_get_monitor_name() does. If there's a space
> *before* that, it should be considered part of the name, and not
> ignored. (So my suggestion in reply to the previous version is wrong.)
>
> However, since the match name uses NUL termination, maybe we should
> ignore NULs *before* '\n'? Like so:
>
> for (i =3D name_len; i < desc_len; i++) {
>         if (desc[i] =3D=3D '\n')
>                 break;
>         if (!desc[i])
>                 return;
> }
>
Allow trailing white spaces so we don't need to add the trailing white
space in edp_panel_entry.

https://lore.kernel.org/lkml/CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz51TJ=
eSQrA@mail.gmail.com/

>
> BR,
> Jani.
>
>
> >
> > -Doug
>
> --
> Jani Nikula, Intel
