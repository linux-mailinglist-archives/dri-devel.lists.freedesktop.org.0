Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8552987401E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71E110E802;
	Wed,  6 Mar 2024 19:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GE2rZvl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2F510E802
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 19:08:53 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-6e4efdf31c9so45056a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 11:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709752133; x=1710356933;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xe0QNgBhtWSfWE1nNZBiS0+/mEaaikyx4+HhVVMA5h8=;
 b=GE2rZvl2qdniSDf9xnppvli9jSnbC22Ot/bsBZXmBcQMyio1sEoNlkMzvQ8GgKlsqg
 zWr0+lqlBbCj53qKdrcMpN9blxkJBQh381tho9Y7sMiPOZ9XKGbgdgLMukeGQXfNU3Pe
 ni+aSqXGLmfdH36t4dWL/vTnOINazMgqeVmr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709752133; x=1710356933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xe0QNgBhtWSfWE1nNZBiS0+/mEaaikyx4+HhVVMA5h8=;
 b=DHhhknud0w9NwjqUnEJ00ap3cdasar2VLp88/sv51plc1FhNL5+RP0ajW8MXhMcUzf
 NqdzUaHYUHEm+ftBDhLPOL16WZPQEQ1ZyiA706h7qTfU+Qf2MGuy9wYuFe/WhL6i7AZ1
 CNn4aHuXD0uh7YC02/BmnXV23tIvEP914QznZiLqYlZ/T5qYnc13bwV5hodcw1ZLnF8M
 tDU4KWVuFFHJzQZ8X0WxI7GBUL5eUz4k3p6D4uttq9MWzR2RW5659czNQz63xkPnsSR5
 fZGu7bFtDYjwlMwpffoQnD/1YSv5Dil+aLnQ/gkbpT7TrnbcpJyrtmI26S/3WchMdOIK
 1bVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGhvJ8oWKj9PBAVHPNTkC17HZXzZroa7V/wbRS5YsCN73Y+tokqU84/oH3x2i0OqbLbIIcOUZbWWjUoDFTAiPw5I+FNIp7lxPddqldsgbc
X-Gm-Message-State: AOJu0Yw4tWbdevuSZDc/V4Q5Eled+Y9FMA0HB3wCCRGawncjPiOO/PDl
 bFhdMyw/TblrAAvra0Gd1O5VarePxsyF2NN22hwtKMLzsfeVMoNLvBHb+QUiaGxe2xBnIO+EIdX
 R3CLHhLUMxS1AF5vLWQttsts6royEsFDGtnHmokNJdOUNFlfi1w==
X-Google-Smtp-Source: AGHT+IEw+KB3tMPtIPFAOIzu2uRC4E+jpfyWg1B1uV1j9J8CxOl4tulHG2bobO9eW5yqEYg/RjVVFspNaKfxFHhwn8w=
X-Received: by 2002:a9d:6a11:0:b0:6e5:789:8337 with SMTP id
 g17-20020a9d6a11000000b006e507898337mr64849otn.8.1709752133085; Wed, 06 Mar
 2024 11:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20240306004347.974304-1-hsinyi@chromium.org>
 <20240306004347.974304-3-hsinyi@chromium.org>
 <87sf13zpmc.fsf@intel.com>
In-Reply-To: <87sf13zpmc.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 6 Mar 2024 11:08:27 -0800
Message-ID: <CAJMQK-gTuPRCJ2y4ErGcv6T74JgGjtzuWyeDxU2uX+=0+yYq9Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/edid: Add a function to match EDID with
 identity
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
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

On Wed, Mar 6, 2024 at 1:17=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Tue, 05 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > Create a type drm_edid_ident as the identity of an EDID. Currently it
> > contains panel id and monitor name.
> >
> > Create a function that can match a given EDID and an identity:
> > 1. Reject if the panel id doesn't match.
> > 2. If name is not null in identity, try to match it in the detailed tim=
ing
> >    blocks. Note that some panel vendors put the monitor name after
> >    EDID_DETAIL_MONITOR_STRING.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v3->v4:
> > 1. add a type drm_edid_ident
> > 2. match name -> match identity. Modify function to use edid iterators.
> > ---
> >  drivers/gpu/drm/drm_edid.c | 76 ++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_edid.h     |  8 ++++
> >  2 files changed, 84 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index f9e09f327f81..5e7e69e0e345 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -102,6 +102,11 @@ struct detailed_mode_closure {
> >       int modes;
> >  };
> >
> > +struct drm_edid_ident_closure {
> > +     const struct drm_edid_ident *ident;
> > +     bool matched;
> > +};
>
> More like drm_edid_match_closure.
>
> > +
> >  #define LEVEL_DMT    0
> >  #define LEVEL_GTF    1
> >  #define LEVEL_GTF2   2
> > @@ -5455,6 +5460,77 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *=
connector, const u8 *db)
> >                   connector->audio_latency[0], connector->audio_latency=
[1]);
> >  }
> >
> > +static void
> > +match_identity(const struct detailed_timing *timing, void *data)
> > +{
> > +     struct drm_edid_ident_closure *closure =3D data;
> > +     unsigned int i, j;
> > +     const char *str =3D closure->ident->name;
> > +     unsigned int buflen =3D strlen(str);
> > +     unsigned int size =3D ARRAY_SIZE(timing->data.other_data.data.str=
.str);
> > +
> > +     if (buflen > size ||
> > +         !(is_display_descriptor(timing, EDID_DETAIL_MONITOR_NAME) ||
> > +           is_display_descriptor(timing, EDID_DETAIL_MONITOR_STRING)))
> > +             return;
> > +
> > +     for (i =3D 0; i < buflen; i++) {
> > +             char c =3D timing->data.other_data.data.str.str[i];
> > +
> > +             if (c !=3D str[i] ||  c =3D=3D '\n')
> > +                     break;
> > +             }
> > +
> > +             if (i =3D=3D buflen) {
>
> This will never be true.

It should be

for (i =3D 0; i < buflen; i++) {
...
}

if (i=3D=3Dbuflen) {
...
}

But okay we can use strcmp.

>
> > +                     /* Allow trailing white spaces. */
> > +                     for (j =3D i; j < size; j++) {
> > +                             char c =3D timing->data.other_data.data.s=
tr.str[j];
> > +
> > +                             if (c =3D=3D '\n') {
> > +                                     closure->matched =3D true;
> > +                                     return;
> > +                             } else if (c !=3D ' ') {
> > +                                     break;
> > +                             }
> > +                     }
> > +                     if (j =3D=3D size) {
> > +                             closure->matched =3D true;
> > +                             return;
> > +                     }
> > +     }
>
> Please let's use strcmp and friends instead of reinventing our own:
>
> const char *name =3D closure->ident->name;
> int name_len =3D strlen(name);
> const char *desc =3D timing->data.other_data.data.str.str;
> int desc_len =3D ARRAY_SIZE(timing->data.other_data.data.str.str);
>
> if (name_len > desc_len)
>         return;
>
> if (strncmp(name, desc, name_en))
>         return;
>
> for (i =3D name_len; i < desc_len; i++) {
>         if (!isspace(desc[i]) && !desc[i])
>                 return;
> }
>
> closure->matched =3D true;
>
>
> > +}
> > +
> > +/**
> > + * drm_edid_match_identity - match drm_edid with given identity
> > + * @drm_edid: EDID
> > + * @ident: the EDID identity to match with
> > + *
> > + * Check if the EDID matches with the given identity.
> > + *
> > + * Return: True if the given identity matched with EDID, false otherwi=
se.
> > + */
> > +bool drm_edid_match_identity(const struct drm_edid *drm_edid,
> > +                          const struct drm_edid_ident *ident)
>
> Can we please just call this drm_edid_match()? Is the _identity in the
> name somehow helpful?
>
> > +{
> > +     if (!drm_edid || edid_extract_panel_id(drm_edid->edid) !=3D ident=
->panel_id)
> > +             return false;
>
> Side note, edid_extract_panel_id() could now be made to take struct
> drm_edid.
>
> > +
> > +     /* Match with name only if it's not NULL. */
> > +     if (ident->name) {
> > +             struct drm_edid_ident_closure closure =3D {
> > +                     .ident =3D ident,
> > +                     .matched =3D false,
> > +             };
> > +
> > +             drm_for_each_detailed_block(drm_edid, match_identity, &cl=
osure);
> > +
> > +             return closure.matched;
> > +     }
> > +
> > +     return true;
> > +}
> > +EXPORT_SYMBOL(drm_edid_match_identity);
> > +
> >  static void
> >  monitor_name(const struct detailed_timing *timing, void *data)
> >  {
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 9686a7cee6a6..01825a8954b6 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -312,6 +312,12 @@ struct edid {
> >       u8 checksum;
> >  } __packed;
> >
> > +/* EDID matching */
> > +struct drm_edid_ident {
> > +     u32 panel_id;
> > +     const char *name;
> > +};
> > +
> >  #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << =
8))
> >
> >  /* Short Audio Descriptor */
> > @@ -412,6 +418,8 @@ struct edid *drm_get_edid(struct drm_connector *con=
nector,
> >                         struct i2c_adapter *adapter);
> >  const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *ad=
apter);
> >  u32 drm_edid_get_panel_id(const struct drm_edid *drm_edid);
> > +bool drm_edid_match_identity(const struct drm_edid *drm_edid,
> > +                          const struct drm_edid_ident *ident);
> >  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> >                                    struct i2c_adapter *adapter);
> >  struct edid *drm_edid_duplicate(const struct edid *edid);
>
> --
> Jani Nikula, Intel
