Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC617DF7F9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 17:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DC989E36;
	Thu,  2 Nov 2023 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5A489E36
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 16:54:19 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9dbb3e0ff65so122013366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698944055; x=1699548855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1LGxmWcx02Jh03WOgomaovWxeWfiplOkjhYrTDh8XI=;
 b=J2sCiZ5k5NKvoSf18fnfiSjYW//pBiouyE8EPLVZMvXLWJVTgGcU9mCpI/suSdfjqV
 Z3M63ixHHbEtLLvn/nkXLhMSKq5d2rieTp1x6mgPDx6gnOg8mhCnArhsKDPIdZ1ZuGuH
 SG83LyoTlngBMrNe9qg2Xx12QIWGQzDNMUrl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944055; x=1699548855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1LGxmWcx02Jh03WOgomaovWxeWfiplOkjhYrTDh8XI=;
 b=Zcu6b4HJbhq7PUqi950vta/jus1m1YKoRt9g8ucyNodru56yS9kN5ejWUOgRuR8OuA
 SCUc5etwphAJjVHoC0I1X6RU+5qoDGTMulFxYK4ocufBUm3/e2p8gn7lc0dD2OAK0zXr
 UCEJ5wUMYX6iVLTEviJDg60Cq2IxCgBGvVkRuGcM8BEssJiGFF7Ipec1C5RmYbqktpk9
 QQxeexGknjacw79Rl/RWdtvpGmQtrzU6ttpcD2caxCkSHVPvz1ikAXSOFZ96QOmMZ1mE
 /sanAifHRzX5+h5k28NEVJdK4nkcXdXnye5HbGNlkFdqljMBa37Qk5hrAXCt1wXXn+O8
 x5Dg==
X-Gm-Message-State: AOJu0YylFfu0puYovQerfoBfR/5klA6PxSUCKjf5DgERX2AVI/fytfzQ
 DOUaNHi23n37Nake4HdWliCTzjM9+U2ZrYYIzQJtPQ==
X-Google-Smtp-Source: AGHT+IHUGnZ84qQXoQGJOL3fkhGAS5+jEjwT4rRXITSlPShBA636/jCGBgTEvxgOYI01OkCu2KqKaw==
X-Received: by 2002:a17:906:da87:b0:9b7:37de:601a with SMTP id
 xh7-20020a170906da8700b009b737de601amr5053531ejb.49.1698944055015; 
 Thu, 02 Nov 2023 09:54:15 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 m22-20020a170906235600b0099bcf9c2ec6sm1347758eja.75.2023.11.02.09.54.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 09:54:14 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-408c6ec1fd1so1365e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 09:54:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1d14:b0:3f7:3e85:36a with SMTP id
 l20-20020a05600c1d1400b003f73e85036amr68368wms.7.1698944053735; Thu, 02 Nov
 2023 09:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-2-hsinyi@chromium.org>
In-Reply-To: <20231101212604.1636517-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Nov 2023 09:53:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UArV6uF7Q6=Z0D6u30BGEPLjNiBeZMiDMjpneAKnSTcw@mail.gmail.com>
Message-ID: <CAD=FV=UArV6uF7Q6=Z0D6u30BGEPLjNiBeZMiDMjpneAKnSTcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add several generic edp panels
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 1, 2023 at 2:26=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
>
> Add a few generic edp panels used by mt8186 chromebooks.
> Besides, modify the following panel:
> - AUO 0x235c B116XTN02 renamed to B116XTN02.3.
> - AUO 0x405c B116XAK01 adjust the timing to delay_200_500_e50. According
> to the datasheet: T3=3D200, T12=3D500, T7_max =3D 50.

Can you modify this in the `auo_b116xak01` structure? That should make
timing work more correctly for anyone directly specifying this panel.
The reason I had it point to the other structure was so we didn't
treat anyone specifying this panel directly differently than anyone
autodetecting it...


> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 62 ++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 9dce4c702414..06ce3a73d740 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1830,6 +1830,12 @@ static const struct panel_delay delay_200_500_e50 =
=3D {
>         .enable =3D 50,
>  };
>
> +static const struct panel_delay delay_200_500_e80 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 80,
> +};
> +
>  static const struct panel_delay delay_200_500_e80_d50 =3D {
>         .hpd_absent =3D 200,
>         .unprepare =3D 500,
> @@ -1849,6 +1855,25 @@ static const struct panel_delay delay_200_500_e200=
 =3D {
>         .enable =3D 200,
>  };
>
> +static const struct panel_delay delay_200_500_e200_d10 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 200,
> +       .disable =3D 10,
> +};
> +
> +static const struct panel_delay delay_200_150_e50 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 150,

I worry a little bit about seeing "unprepare" of 150. It doesn't mean
it's wrong, but it's been so consistent for me to see .500 here that
it's good to double-confirm. It looks like you use this one on
"KD116N2930A15". From the datasheet I see that T12 has a min of 150 ms
and a max of 500 ms. Is that the same thing you see?

Specifying a "max" for T12 makes no sense. That's saying that it
violates timing specs to ever turn the panel off for more than half a
second which is nonsense.

Given that:
* The spec is obviously nonsense for this number.
* The 500 ms number is present in the spec and somewhat standard for eDP pa=
nels.
* Having a larger number is safer.
* 500 ms usually won't have a real world impact since it just prevents
turning on the panel again right after turning it off (and we use
autosuspend to avoid this in most cases).

Maybe it's better to just use 500 here?


> +       .enable =3D 50,
> +};
> +
> +static const struct panel_delay delay_200_150_e200 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 150,
> +       .enable =3D 200,

Let's look at this unprepare of 150 too. I guess it's used for two panels.

NT116WHM-N21: Wow, there sure are a lot of panels that call themselves
"NT116WHM-N21" but have different IDs. :-P If you're sure that this is
150 this is fine, but if there's any doubt (like above) then 500 is
safer.

R140NWFM R1: I think I found this spec and yeah, it's super clear. 150 ms.


NOTE: I didn't try to double-check any of the other timings, mostly I
just looked at the unprepare since it stood out. ;-)


> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, =
_delay, _name) \
>  { \
>         .name =3D _name, \
> @@ -1869,38 +1894,71 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116X=
AB01.4"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133U=
AN02.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116X=
AK01.6"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116X=
TN02"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x208d, &delay_200_500_e50, "B140H=
TN02.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116X=
TN02.3"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116X=
AN06.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116X=
TN02.5"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140H=
AN04.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &delay_200_500_e50, "B116X=
AK01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116X=
AN06.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
>
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0715, &delay_200_150_e200, "NT11=
6WHM-N21"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0731, &delay_200_500_e80, "NT116=
WHM-N42"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0741, &delay_200_500_e200, "NT11=
6WHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0786, &delay_200_500_p2e80, "NV1=
16WHM-T01"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x07d1, &boe_nv133fhm_n61.delay, "=
NV133FHM-N61"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x07f6, &delay_200_500_e200, "NT14=
0FHM-N44"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x082d, &boe_nv133fhm_n61.delay, "=
NV133FHM-N62"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x08b2, &delay_200_500_e200, "NT14=
0WHM-N49"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116=
WHM-N21,836X2"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116=
WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135=
FBM-N41 v8.1"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116=
WHM-N49 V8.0"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116=
WHM-N21"),

0x904b is already specified above and this is in the wrong sort order.

> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116=
WHM-N47"),

Please sort 0x0951 before 0x0979.

>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "=
NV110WTM-N61"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x09ae, &delay_200_500_e200, "NT14=
0FHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116=
WHM-N21"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116=
WHM-N45"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116=
WHM-N4C"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV14=
0FHM-T09"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140=
FHM-N47"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
>
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay=
, "N116BCA-EA1-RC4"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay=
, "N116BCA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1145, &delay_200_500_e80_d50, "N=
116BCN-EB1"),

Please sort 0x1145 above 0x114c

>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1152, &delay_200_500_e80_d50, "N=
116BCN-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1153, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N=
116BCA-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N=
116BCN-EB1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N=
120ACA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N=
140HCA-EAC"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N=
140HGA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140H=
GA-EA1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14e5, &delay_200_500_e80_d50, "N=
140HGA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N=
140HCA-EAC"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d6, &delay_200_500_e80_d50, "N=
140BGA-EA4"),
> +
> +       EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB11=
6AN01-2"),
>
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10, "=
M116NWR6 R5"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140=
NWF5 RH"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M1=
33NW4J"),
>         EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R1=
33NW4K-R0"),
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x8c4d, &delay_200_150_e200, "R140=
NWFM R1"),
>
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv=
_a010.delay, "116N21-30NV-A010"),
>         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "1=
16N29-30NK-C007"),
> +       EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_150_e50, "KD116=
N2930A15"),

Please sort 0x0809 above 0x1120.
