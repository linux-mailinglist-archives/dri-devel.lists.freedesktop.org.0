Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71E64DA2E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45410E05C;
	Thu, 15 Dec 2022 11:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086410E05C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:20:39 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r11so4971676oie.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cmk0PdpBMK0sped7JhGYOwBdXV8EVeBAiY0Lb6X/myc=;
 b=Wka0wIlExft4VpGS8jLFeSOPzzT8wmggrLJis4x7Mzie5Z9AOositkhMfK3TP+uYp5
 GoDJf5iXgh5+zRRcH/yoaJIKf324F84RXMUJdNtpEnsHw8N2n5+/JD8VUy71QlKUxqox
 RCJe4e99/CdKLeDsymFfMT+sIqdgtB0pbc48X4x+/rob6dpe4zYBN2NH0814BQTTf4/r
 gUOPPDYNFRqNX3qzI2rYHlwnUin2LYQQfQbMgjL/R8fUzxAiirfK/qNbOe2DJNVNKnAX
 9NK6rA9Zv5lWo2VBZd1Q73gRRiOZsjRRXSU4HCpTIniKnP9tJnTMcYjingezIYH2wRa0
 d4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cmk0PdpBMK0sped7JhGYOwBdXV8EVeBAiY0Lb6X/myc=;
 b=1WTlP/cu1DFjnRt/F/sslKb/ARaYhWiRbgDx3SAnpn4zOMVMF/7h+7Bh4ei6y4ZQf8
 uLyQX+VCiB6JeJvMibxBWMPmirOfGnjSJLvUcL4JHOsNklwYJ2qn7wDKLG4JjQrSQbTY
 MdmJ0OajxEs0miBjCaUNlU7xbjiXkUt3MUUhhfqi4rx3kC+yLvsvA9rEQctWIEzAE7U8
 1+Uduf3fwf3BBC332Nnn+NvTw0sApwMPn1yBHgonXUJOi39W1vuMyFBXTp2EEW1GRdo0
 iVXza3vc9VcSBhwa9A5Un5m999zuqUIetCgQo2EWcUwnNo8xZLb4jZc9qutf90evmJ+x
 QptA==
X-Gm-Message-State: ANoB5pmM8vEFGtFHRAaXOLAheKnM2tzVzAFOnmX5/2cvFbAd3uwFBSYm
 mEpFVtmW3zrDx9XbUhUBnJqMRUkL2Nb/6G5o56E6mA==
X-Google-Smtp-Source: AA0mqf6ul9+QZU4hm6yqMhWx9ryWax/rv5tjNs1P8UrwxuqP7LLLD/URmkKdihtN7/JQhAlX2g6zMdxTJ2U46P3YUvo=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr308690oic.14.1671103238656; Thu, 15 Dec
 2022 03:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-8-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-8-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:20:27 +0100
Message-ID: <CAG3jFytqa7h2kYJAz4meYvCfVK7BJp6KXZvvFY+bSNCuNGvOoA@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm: bridge: it66121: Don't clear DDC FIFO twice
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
> The DDC FIFO was cleared before the loop in it66121_get_edid_block(),
> and at the beginning of each iteration; which means that it did not have
> to be cleared before the loop.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 06fa59ae5ffc..5335d4abd7c5 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -456,18 +456,6 @@ static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
>         return 0;
>  }
>
> -static int it66121_clear_ddc_fifo(struct it66121_ctx *ctx)
> -{
> -       int ret;
> -
> -       ret = it66121_preamble_ddc(ctx);
> -       if (ret)
> -               return ret;
> -
> -       return regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
> -                           IT66121_DDC_COMMAND_FIFO_CLR);
> -}
> -
>  static int it66121_abort_ddc_ops(struct it66121_ctx *ctx)
>  {
>         int ret;
> @@ -515,10 +503,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>         offset = (block % 2) * len;
>         block = block / 2;
>
> -       ret = it66121_clear_ddc_fifo(ctx);
> -       if (ret)
> -               return ret;
> -
>         while (remain > 0) {
>                 cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
>                                 IT66121_EDID_FIFO_SIZE : remain;
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
