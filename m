Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1531AC94FD1
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 14:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E904A10E18A;
	Sun, 30 Nov 2025 13:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="BIS6eInB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F5510E18A
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 13:09:57 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29558061c68so40587315ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 05:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1764508197; x=1765112997;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
 b=BIS6eInBsAqIh+N4reHl+luDSWGEY0sAzoA9xyug+eIwKcTGyx/fe+SY2mqvNKxU0L
 DNMjWlR8tBPYXRxbOcA9u+QlTN9xZVj0SPgRwOjuxHLmp2Or/MTsNt3YDrvvdGrdykUv
 zWSsCFnUWgBbTHs0wlXXW3cxNoWHFdyADKf58w3YRTC6iJMnTnQGc4A/znCL0qgQGM7u
 2jdWbOmM6QgbymlcslAvjvj0c4fk2+ie0YBUjEL23Gtl6z6Qwj+TXp8k6Rq8d6kpFqL8
 U+eFT8/egDdRSnx3fSeYRJ2UuDxfOWaflPd7YgMLCyFVm3n+bjt2StDdJhB6BMstqU5N
 vVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764508197; x=1765112997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FNmbbxbBaoTz8DomyGsXnxRB8wBP1F/AJR530QwYnIc=;
 b=AErEmK7ngDCf8Q4wXlynpnH0p9QbF8t/XhF9mKfHW+f5i36VQcJDvmgvqIHBPTPdHC
 3MWo8ZBBN850YdU2+NONKBBbYDRMReS2ekz4owioFl8DZFaFjdjlbeOpmVksL8/jwaYw
 QALYIg9f9QsSvS5+y7lR8MU0ejekSAOyUbQYP8iO4dj5Z84TBwEG781RGuVfygGvPXks
 fs0h7WIdO7kbqJRKsugFE+riY/f5p9VNRI7fMLfoWwqfVv2DQGTEbUERaRQQgA+Xpv87
 4yW/zqMXtoSe5Tk55Za2+tWn8mPVmZphCGtengpCsTDkijsr1o/auBcVu7mDSiTyTZ3G
 o3vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHxKZ5QnqFe78BgHR/6CnQi5T0fSGLhno8+p2NtpB278/TAd3jvBiP5C2N9LJWYiMOipohmapFlYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJatjjBvVvEp9xxcpTx0cIzOttAmBbTldUnuApeuZ/Umk8T/bf
 ZINzLzN7DU64qpTKRU1zhYdbuSUvmIGFfNI8pAYJmOlMVt5USEqDQZ2bJ0kmpbwOQlocdeiczTu
 C+SaQnd3bExqCWt6hMiKbCH+TsOBGaZo=
X-Gm-Gg: ASbGncvnFrvuNvgOPnv+ORcKzVUhcmB45rM3iOopenOhLlxWg+iZu6lzjPcKSFrub2R
 ViK6PcI+v7j3zY4nJWwrI4bofKNDA6aKB1yjYnvqveL5k90zd6ISgVp0JJloDZgb1KClDz8Dqkj
 FdmgbJ0b+zNz590dC23VmYSs0oYnlpNPfLRVUNmRJ7zapxGt01R3wfuiQzDtRk9aNFypIOwbF4H
 mrXUEfvXd0XLvRkenmmTlhv8k3gbd8YXBLC4HKggBrXx9GhLCPWsoOdtrdrkOvhtd3jEMKee5Im
 IIXM4YG2tUkQyV5MzONSnx7ofGAW
X-Google-Smtp-Source: AGHT+IG53GhYkY/+dF5qGVT19Jadft1SJnnMvw5Wcu0qyYtU4QLG8FtzqF0lB0krYhtMk3QufvRzdFqig5aHMJFxvm0=
X-Received: by 2002:a17:903:903:b0:295:a1a5:bae9 with SMTP id
 d9443c01a7336-29b6be86b48mr332545755ad.8.1764508197220; Sun, 30 Nov 2025
 05:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Nov 2025 14:09:46 +0100
X-Gm-Features: AWmQ_bkqQ0yeDiiVRXlgzLTrdqIA678_lHRrauQKV29M6KsFuJAoinD-iLMIAaM
Message-ID: <CAFBinCCQjeUu7pgfwViH6b0-M6S_sKgfvz9VAP1hpqLRj=bL_g@mail.gmail.com>
Subject: Re: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

Hi Luca,

On Fri, Nov 28, 2025 at 5:54=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
> reference on remove or on probe failure.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm=
/meson/meson_encoder_cvbs.c
> index dc374bfc5951..bf8588a5f6dd 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
>                 return 0;
>         }
>
> -       meson_encoder_cvbs->next_bridge =3D of_drm_find_bridge(remote);
> +       meson_encoder_cvbs->next_bridge =3D devm_of_drm_get_bridge(priv->=
dev, remote);
>         of_node_put(remote);
>         if (!meson_encoder_cvbs->next_bridge)
>                 return dev_err_probe(priv->dev, -EPROBE_DEFER,
Would you be happy with me sending a patch that replaces the whole
logic in two meson_encoder_{cvbs,dsi,hdmi}.c with
devm_drm_of_get_bridge()?
I see two benefits:
- simpler code
- a patch less in your series (less maintenance burden for you)

What I'm not sure about is how this series interacts with
devm_drm_of_get_bridge() which is why I'm asking before cooking a
patch.


Best regards,
Martin
