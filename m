Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838B64DA32
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5F810E530;
	Thu, 15 Dec 2022 11:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A76A10E530
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:23:37 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 v15-20020a9d69cf000000b006709b5a534aso3373454oto.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/7JkFj5wLXXdl9G2ZA60qkoqbyje3qEI4jjTEGmM3vM=;
 b=CcL9N07GTjPa2REqAWIJtlX9R8sbNPxFUb4y+F6SwALx5iNPAG9IeXBD9mG5cFkCQF
 opv16LLuek0HOEcCWRzJEyIpQYIVERKmrVaZQPfKEfS0EXrowm4MpALjz1/Kr7fWJ7OG
 yvaoYl6BCI5nhZe/LSuIc5SVB2A9wSURh8oEPZKgVUJmuGnbznQ5zTa0Cbj2/zRP7aaf
 SJlfYFBb6jlVQhuCCPOYk7VuIwNLG1HIgEApSs0Vymf3F7IxM/UKgjiqd/M2o0DuSh/s
 pngRvKiPrBohN18p/BYPfUBg16kFbAQ7pN8aDfOpUhYRBK8Vzyxt+aZroW4sxFs77l91
 E8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/7JkFj5wLXXdl9G2ZA60qkoqbyje3qEI4jjTEGmM3vM=;
 b=RRfOSTg5pugdNnNQZBIOPRiVbLwYF2DS3SySWwKyrrWORh0w36NNBaTM0HNlTKqT0z
 Q+twoZcislMRJoGbdVgjbXmCxbGEFY86R+OEWpqmw9K5sEZ5J9mgshyss3URXb2Db4qI
 xGkoXq/utlYsOt0m8HaFyOy+jeOtFwC2M/5DHr9PVP4pipWL+LL7jfK7cw52rMtBRd3Z
 MIYzeZzYWdRZwmY+IFKoq0qIRgaLVojTQ2pD9CEWxtqbnEmavOGzzuog3vQiWYJbRQfG
 Bi3rkjgrKHNGCnthgbePR73NHeQT0VXaY+yFl6kN8dVhjsGgdmHqm2PBHP2vyV8Eyqbi
 K1yA==
X-Gm-Message-State: ANoB5pklQDznIi1/oxM/GmZuhCT48R2rA6+OROmgGj5aqNfrOg6fF7MX
 21pLzliBhJ16g73opxiJvM7m45GdKtZ3D7QRTpUb1Q==
X-Google-Smtp-Source: AA0mqf7pnU7OKXNDp+MRPy8cv53j2kDbmNqbCVlsGOk8psGQmpYGWU8smfmMwi4ZPQssKz+JFhamR8QDS41o5cEc0KA=
X-Received: by 2002:a05:6830:3697:b0:66b:e4f2:7f2a with SMTP id
 bk23-20020a056830369700b0066be4f27f2amr40770639otb.317.1671103416765; Thu, 15
 Dec 2022 03:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-9-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-9-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:23:25 +0100
Message-ID: <CAG3jFyuHL7oZMMj-2N5B9A0gby5T3wYDAPvLGdApFgXdzWi_qQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm: bridge: it66121: Set DDC preamble only once
 before reading EDID
To: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:59, Paul Cercueil <paul@crapouillou.net> wrote:
>
> The DDC preamble and target address only need to be set once before
> reading the EDID, even if multiple segments have to be read.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 5335d4abd7c5..7972003d4776 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -506,9 +506,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>         while (remain > 0) {
>                 cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
>                                 IT66121_EDID_FIFO_SIZE : remain;
> -               ret = it66121_preamble_ddc(ctx);
> -               if (ret)
> -                       return ret;
>
>                 ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
>                                    IT66121_DDC_COMMAND_FIFO_CLR);
> @@ -519,15 +516,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>                 if (ret)
>                         return ret;
>
> -               ret = it66121_preamble_ddc(ctx);
> -               if (ret)
> -                       return ret;
> -
> -               ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
> -                                  IT66121_DDC_HEADER_EDID);
> -               if (ret)
> -                       return ret;
> -
>                 ret = regmap_write(ctx->regmap, IT66121_DDC_OFFSET_REG, offset);
>                 if (ret)
>                         return ret;
> @@ -842,9 +830,25 @@ static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
>  {
>         struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
>         struct edid *edid;
> +       int ret;
>
>         mutex_lock(&ctx->lock);
> +       ret = it66121_preamble_ddc(ctx);
> +       if (ret) {
> +               edid = ERR_PTR(ret);
> +               goto out_unlock;
> +       }
> +
> +       ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
> +                          IT66121_DDC_HEADER_EDID);
> +       if (ret) {
> +               edid = ERR_PTR(ret);
> +               goto out_unlock;
> +       }
> +
>         edid = drm_do_get_edid(connector, it66121_get_edid_block, ctx);
> +
> +out_unlock:
>         mutex_unlock(&ctx->lock);
>
>         return edid;
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
