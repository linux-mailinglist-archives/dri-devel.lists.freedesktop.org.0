Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46146F1D67
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 19:28:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304D010E338;
	Fri, 28 Apr 2023 17:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7919C10E338
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:28:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93194644E1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCEAC433A4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682702886;
 bh=awzlaeaMJVwFKmd4eU3dpKmk4Ck+BaGjudrb7tg482Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mpSa/cBmj2Xf/Og6E2MVuM86bg7KoArkd+R9npdtcWIZdgS/QlvNlN7HApdJJPj+o
 QEp0ofqOZ7XUCRgIBYE6AbzDFPs9eZjH+wYSg3ypO/SREJVl8KkYDV1VSUgD52ZVoM
 pck/f1RtXnV6kgHUIvN7Yt1ioFpeuPB5972rTqzB7k0eiTT8yU1jxkYp35TtvcyaWD
 c9Jni6GuGbFCbHokR6cls9ft9asL6vONlZa1jhqVXNP8ZziJ1voZkXDQyA2AbH4hYq
 3PEIc9yi/bxTKvh8V8ODYC81+7t7NpYfZLs3z52jPpMhEGWF8HHm4I77LbXs/1n/a+
 XHkWyLYcTq3sw==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-24782fdb652so160204a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 10:28:06 -0700 (PDT)
X-Gm-Message-State: AC+VfDz0yNkSJFJUXhswUXekezZ1zQJKq66r8+jEvkXg9ShpOmS4tzyu
 ILo+EywQXjDTjcE/qPvRZeQG1hFtBaNffQogjx8KSg==
X-Google-Smtp-Source: ACHHUZ4EzFJTkyoWOCd5UTE8lkquxKZMsfmdTvY1kPMRpButj1PQ3EvMJaw4oZOSH7LC5CPepwlb1PcWF+Mg7++5nVc=
X-Received: by 2002:a17:90b:4ac3:b0:24c:1de9:493 with SMTP id
 mh3-20020a17090b4ac300b0024c1de90493mr4272026pjb.47.1682702885951; Fri, 28
 Apr 2023 10:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
 <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
 <6f758653-36c9-91a2-7bbc-278ae3f8ccee@web.de>
 <CAN6tsi4WBDOyzvXJ8vV=xJYay1JbBGo+UzZ+vudTBm5Fk5nB=A@mail.gmail.com>
 <14083012-2f19-3760-a840-d685fcedc15e@web.de>
 <CAN6tsi7263VnTba+WUUWR171Y+CsOKAb=it8cofPQGRk26K=aA@mail.gmail.com>
 <fa69384f-1485-142b-c4ee-3df54ac68a89@web.de>
In-Reply-To: <fa69384f-1485-142b-c4ee-3df54ac68a89@web.de>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 28 Apr 2023 19:27:54 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5vukABCxWMNtUHokXj3+xObnX_aKvP-oQDde+M+Biv4g@mail.gmail.com>
Message-ID: <CAN6tsi5vukABCxWMNtUHokXj3+xObnX_aKvP-oQDde+M+Biv4g@mail.gmail.com>
Subject: Re: [PATCH resent] drm/bridge: it6505: Move a variable assignment
 behind a null pointer check in receive_timing_debugfs_show()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Hermes Wu <hermes.wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hsin-yi Wang <hsinyi@chromium.org>,
 cocci@inria.fr,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 5:56=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 16 Apr 2023 17:30:46 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Creceive_timing_debugfs_show=E2=80=9D.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cvid=E2=80=9D behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 ("drm/bridge: add it6505 =
driver")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index abaf6e23775e..45f579c365e7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3207,7 +3207,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                                            size_t len, loff_t *ppos)
>  {
>         struct it6505 *it6505 =3D file->private_data;
> -       struct drm_display_mode *vid =3D &it6505->video_info;
> +       struct drm_display_mode *vid;
>         u8 read_buf[READ_BUFFER_SIZE];
>         u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
>         ssize_t ret, count;
> @@ -3216,6 +3216,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                 return -ENODEV;
>
>         it6505_calc_video_info(it6505);
> +       vid =3D &it6505->video_info;
>         str +=3D scnprintf(str, end - str, "---video timing---\n");
>         str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
>                          vid->clock / 1000, vid->clock % 1000);
> --
> 2.40.0
>

Applied to drm-misc-next.
