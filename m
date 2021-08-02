Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8F03DE2FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 01:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909F56E134;
	Mon,  2 Aug 2021 23:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C196E134
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:22:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78E6960EE8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627946521;
 bh=3UoqdS3ZjZO9aG1FWGZpLNJXpg3edmkfj19jMqgZlag=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fZhBqZC5RN6LFgGTGAhcn9gnxLB6jXBYSgOOOb3AzHHBvQBRGi0ncfOX+8XzA3G+b
 uRWDWytkUy+fILgu0GiBK/xlCsIiOBJQ/P3aTSYFsoynHfrSRGezrzY5rQRd+d1tgd
 enAjzKNkNQdAzL+CTW3IRAwInHu8WyyFLBFFzk5EGN7hpEs6yf1f5A3PRM2jhtoJgN
 aIa3A7EByOkol74HKb3UynsYZFhIl+Ut5hDk5XNUxCSB+Oropz9drSfdJcjcK1XQiv
 X2tzH143UQee2M7iIboGmRrlKHp/F5y1/gSMFEAGvWufIPxVp2UVwvahkDHr0mtcln
 Fb4lPigquJArA==
Received: by mail-ej1-f53.google.com with SMTP id nd39so33500427ejc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 16:22:01 -0700 (PDT)
X-Gm-Message-State: AOAM531x9HUmYQZDlq7vZmTs7yZtKIsPLxTgRwpxm6Wtp1zJgz7P8ng5
 Mt1lC4mL3isOKU4tcnj69UThSP+cliqEce/d2Q==
X-Google-Smtp-Source: ABdhPJzVHbdqkXZSKJFkdObdtrHHP6P1rJNANKJM5suYmF9hkJsLk9QTqNsPcHe3pRC+2S0r6+TIODJy9UBBYIcSj/0=
X-Received: by 2002:a17:906:2451:: with SMTP id
 a17mr17629191ejb.75.1627946520087; 
 Mon, 02 Aug 2021 16:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
In-Reply-To: <20210714121116.v2.7.Idbb4727ddf00ba2fe796b630906baff10d994d89@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:21:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__EA323tC+BswgTfx4EM9FF8Hf9AAkqoxuacuxQwr4SnA@mail.gmail.com>
Message-ID: <CAAOTY__EA323tC+BswgTfx4EM9FF8Hf9AAkqoxuacuxQwr4SnA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] drm/mediatek: mtk_dsi: Reset the dsi0 hardware
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Collabora Kernel ML <kernel@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi, Enric:

Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2021=E5=B9=
=B47=E6=9C=8814=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:12=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Reset dsi0 HW to default when power on. This prevents to have different
> settingbetween the bootloader and the kernel.
>
> As not all Mediatek boards have the reset consumer configured in their
> board description, also is not needed on all of them, the reset is option=
al,
> so the change is compatible with all boards.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Suggested-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index ae403c67cbd9..d8b81e2ab841 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -11,6 +11,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>
>  #include <video/mipi_display.h>
>  #include <video/videomode.h>
> @@ -980,8 +981,10 @@ static int mtk_dsi_bind(struct device *dev, struct d=
evice *master, void *data)
>         struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
>
>         ret =3D mtk_dsi_encoder_init(drm, dsi);
> +       if (ret)
> +               return ret;
>
> -       return ret;
> +       return device_reset_optional(dev);
>  }
>
>  static void mtk_dsi_unbind(struct device *dev, struct device *master,
> --
> 2.30.2
>
