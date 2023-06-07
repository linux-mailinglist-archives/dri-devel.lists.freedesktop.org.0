Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69B7261A6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9BA10E058;
	Wed,  7 Jun 2023 13:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77D410E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:49:14 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-777a8f11e14so23756639f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686145753; x=1688737753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ko6xuu8UoxrurbfacVb4Coj+CWHhAb4UfD8neO3dRrU=;
 b=lhs0DsNF8AZ4tMcx71zirvrG1WKCluOS6pk/yo1Nt5wCfE0Nf2vQ6fQyG+3v16awIv
 b/GVvwxFTFz8hX45UOq/hroACA6ZAhxBj4B/tJhWC5ePhQj1+Zwnwz6SP56nNJbqtG/U
 3nXMJEoAgayqVcOzjnscDxfgCh3TTOJxugz48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686145753; x=1688737753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ko6xuu8UoxrurbfacVb4Coj+CWHhAb4UfD8neO3dRrU=;
 b=heIHa/Q5eAU6viXuH60EYPDV/o+2/hYY1AshVuOgDapQgVWHK61u6ef9gPjJx7Zc8c
 Pl+PEEJdhhpN2NHcqxaySsTa+WNhXjkAn/rzRmpR3niVXYbYktwuVKKGPDySD5LhzxdK
 Aht86y3bh2UD7WQfR7awm8WY/JItuyI5/ofJYO9C500Aydi0i2VC0EyYCAOpqNE7JpLh
 rl6F5S5tEnrx7H9y4QJy5S6YEHwvCdvIBd1CUKz4hPNQGFPw5cec6dVUhyD0pNU4SlKj
 bU0+aD5KEoeF3RC+9jEk+hSzwh0GZShitFAv2ZXeLTUEGAkZUe9c3Pr/OM4OcIGcB/3s
 FyBQ==
X-Gm-Message-State: AC+VfDzOPEN/w8nfVvPdKYXQGpysx9osBJRmo98AFrxnRTEHH7dsvIJb
 kaPpqxd4K4z3EZEyzpfB/FVA5TTQr6uVMcdGktk=
X-Google-Smtp-Source: ACHHUZ64MyRxMQxFrDnEumHBJA0H0X/FclgkbbUSzShx529lWPE1Pm9uTyKiAKSAJaWPpKH/BziErw==
X-Received: by 2002:a92:c908:0:b0:33a:a552:cf54 with SMTP id
 t8-20020a92c908000000b0033aa552cf54mr4289910ilp.7.1686145752780; 
 Wed, 07 Jun 2023 06:49:12 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 a12-20020a92d10c000000b0033842c3f6b4sm3657012ilb.83.2023.06.07.06.49.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 06:49:12 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-33b7f217dd0so134195ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 06:49:12 -0700 (PDT)
X-Received: by 2002:a05:6e02:2186:b0:33d:4e7a:3dac with SMTP id
 j6-20020a056e02218600b0033d4e7a3dacmr142983ila.3.1686145751615; Wed, 07 Jun
 2023 06:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230607102123.219862-1-laura.nao@collabora.com>
In-Reply-To: <20230607102123.219862-1-laura.nao@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 06:49:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvGGvH5ms0-v3aUuqg2Wurks69nCQ9ytcPuTAfua2kig@mail.gmail.com>
Message-ID: <CAD=FV=UvGGvH5ms0-v3aUuqg2Wurks69nCQ9ytcPuTAfua2kig@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO B116XAB01.4 edp panel entry
To: Laura Nao <laura.nao@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 7, 2023 at 3:23=E2=80=AFAM Laura Nao <laura.nao@collabora.com> =
wrote:
>
> Add a panel entry for the AUO B116XAB01.4 edp panel, found in the Acer
> Chromebook Spin 311 (CP311-3H) laptop.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index fbd114b4f0be..5f6297531347 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1867,6 +1867,7 @@ static const struct panel_delay delay_200_500_e200 =
=3D {
>  static const struct edp_panel_entry edp_panels[] =3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1062, &delay_200_500_e50, "B120X=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133U=
AN02.1"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116X=
AB01.4"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116X=
AK01.6"),

Panels should be sorted by their ID. 0x145c doesn't sort between
0x1e9b and 0x1ea5. Please send a v2 with this fixed.

-Doug
