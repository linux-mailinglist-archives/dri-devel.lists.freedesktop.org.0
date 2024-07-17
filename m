Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E31933EE7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B9E10E1A0;
	Wed, 17 Jul 2024 14:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="li/VK0JL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882510E190
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:58:44 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b796667348so3748456d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721228322; x=1721833122;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/eGwogNe/nf8SgikTpuY8jnI/BAYLXXgaMeSpJB6GSc=;
 b=li/VK0JLldHYPzgAV+SHhOeKrlv7YBM/LtTuU91EGZgiSM+WUoNBlPSyA75Svc2uAt
 3S5sciQ+PImTl1DFJiZQzwsekHQ4Vr6r9WgmIalLy3AIpNotuYWYmj6moMbFlFshcSpf
 yoC/rPasG4udT9m3BYtuNwiPwcj1EJlhX+RXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721228322; x=1721833122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/eGwogNe/nf8SgikTpuY8jnI/BAYLXXgaMeSpJB6GSc=;
 b=kdPEq1cl0mMFgzd6pPpGUYLg1DRjjMSXwSO3xV3e+1lvcdR8P8+OF6un409WTgBcgp
 O8NliuSAV2VQ0BjGBqkY3fjI/yfYcsjDBu9PGAzyMc+a8M0pIgRGh/J2xWa3/pq+eaNc
 F7Av6hkCDYZsceKbdBr11rpUGmh17h6YAvknhze0iSnfkZJk7CYbfRjyemnG+WfWxLR4
 Ov2sleVaCA2NtTahUR1PvE/apMS/7TsK/7sB0utY44all2HdyZPmgLVDUNO+JHWAoYlI
 QegjKIWopBNRwPUQrnH4L43UhnJUASmC7aEwXL67MqMlp9ferB0bVaH5nLhwjfDJOEN/
 k+7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjKXoO1hoyoq/Lw8JmpR74RlON3I3tlYguEmMYAXzLCsZSjo/BzKZuSu/jH5NOzfmYxmpckPLZOkOcioG0r3FJf99aA4NhcOJ+g3bnx0rp
X-Gm-Message-State: AOJu0YwaTe3FkHY9TpD7I8c41yWMfPtTyTIG1eXlJjWHdDm+kOSKKi3t
 Rfp4PCBAt3K9AjJlzfgcPGVdJ0hP5RWdsbL+YOGazzIUcPnDL14VyfeGfRGut7lcffhMRerOnx4
 =
X-Google-Smtp-Source: AGHT+IGFXuNrUBueYbzfxSlvz0cG/6CULheYTCJSCdKn8d+bD96cj90ijMTqVxV30laKOK6mOHFKZQ==
X-Received: by 2002:a05:6214:c41:b0:6b5:33c6:9caf with SMTP id
 6a1803df08f44-6b78e706881mr26293856d6.16.1721228322370; 
 Wed, 17 Jul 2024 07:58:42 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b7980f8d35sm2864006d6.13.2024.07.17.07.58.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 07:58:41 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-447f8aa87bfso418851cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 07:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Ikskd/lfwt8OgPpiNmleSvVgTdhzMFFT7Z0cPpHFxq5kyCM81IbF5vI/zOsho7CnZ1GeTGv7g3iFGqzpXKw6+T1Abbg9Desoz1AOLgO+
X-Received: by 2002:a05:622a:6183:b0:447:e0a6:9163 with SMTP id
 d75a77b69052e-44f8395e9f4mr3721941cf.14.1721228321023; Wed, 17 Jul 2024
 07:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jul 2024 07:58:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
Message-ID: <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add panels with conservative timings
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Wed, Jul 17, 2024 at 2:39=E2=80=AFAM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> The 6 panels are used on Mediatek MT8186 Chromebooks
> - B116XAT04.1  (06AF/B4C4)
> - NV116WHM-A4D (09E5/FA0C)
> - N116BCP-EA2  (0DAE/6111)
> - B116XTN02.3  (06AF/AA73)
> - B116XAN06.1  (06AF/99A1)
> - N116BCA-EA2  (0DAE/5D11)
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Please resend with a better patch subject, like "drm/panel-edp: Add 6
panels used by MT8186 Chromebooks".

Also: are you adding timings based on the datasheets, or are you just
guessing here? The previous patches that added "conservative" timings
were because the Chromebooks involved were really old and couldn't be
tracked down and folks couldn't find the relevant datasheets. In the
case of MT8188 I'd expect you to be adding timings based on the
datasheets. Please confirm that you are.

If possible, it's really nice to have the raw EDIDs for the panels in
the commit message in case someone needs it later.


> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index f85a6404ba58..ac280607998f 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1845,8 +1845,11 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140X=
TN07.2"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116X=
TN02.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120X=
AN01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116X=
AN06.1"),

Please keep this sorted. For instance, 0xa199 should come _before_
0xd497, right?


> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116X=
AT04.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140X=
TN07.7"),
>
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unkn=
own"),
> @@ -1901,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140=
FHM-N47"),
>         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT11=
6WHM-N44"),
> +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116=
WHM-A4D"),
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116B=
GE-EB2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
> @@ -1916,8 +1920,10 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50, "U=
nknown"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N=
116BGE-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N=
116BCN-EB1"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115d, &delay_200_500_e80_d50, "N=
116BCA-EA2"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N=
116BCA-EA1"),
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N=
116BCJ-EAK"),
> +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116B=
CP-EA2"),

It looks suspicious that all the panels around this one need 50 ms for
disable but yours doesn't. While it's certainly possible that things
changed for this panel, it's worth double-checking.

-Doug
