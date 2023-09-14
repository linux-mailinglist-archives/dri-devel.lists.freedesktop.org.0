Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C6A7A063A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB42E10E27F;
	Thu, 14 Sep 2023 13:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86AD10E27F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:38:45 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1d5a1965a9aso543096fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694698724; x=1695303524;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cmkM3eTScVXDHH0jlpqEzGVs0jKDHtYdRBTAlD8i+NE=;
 b=e9f4i2qTbHYPce/paY+E0UPyMQqV1RO6tQADQ6gD/+5jsXg0RowwvXnCl9fwOBMCge
 s7g47lv6mDf/auKvyuxUAD1MlVbmUBL3ijvTLXEnClkK8EnTvKzLwFfDy/F5JrUx/J0E
 PwdzATCqmgCBkFykbJj43FHXwBAFNy0QNbDqrwkQ/KB889SDUuQlWAaQck3wsOl1OeA3
 +1APPZ3Jm24OB2O872nm8goRWN6gbGvUla5jwJx9oO7S5z+qvqgA2aZK553U9uLiFq6P
 m77Z/xoOMGYYFX31wJpJZKu3pnpr2vhxFBHwtmeJlU2CyQDlPmpR3MZwExHdLgMMuf4o
 /x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694698724; x=1695303524;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmkM3eTScVXDHH0jlpqEzGVs0jKDHtYdRBTAlD8i+NE=;
 b=r9I+5h5kgKcQ8c90yuWH00ACaUiUHzF0DUoyA4pKsnDGI8srAmh12bgG7GCzJpTdQY
 22C86Z9jXAS8Regpwi/7mL4bpGvBMHxmKjr0RXSmJmXFUietPhoJWxdRZ7NozMB5EweI
 /s2MkZoFDqLDjLc/buyz03tSh+A2jcoieQt2R779cCgjQNHO4qFWWTIlxmfdI2XWo8+A
 0TmW4qi8kAHIRzBLhDPsHXmcQTy17hi8Z+06YNxYZVDAJmi5RvKm4WLPxZ+lFTPLljpf
 fDOcDr5vNG6TRrPL7ICG3HWRPMzYwLkaq9T1bvc0+cnfP6W2ohr/2Hf4GD54tgGqqf6L
 CE6g==
X-Gm-Message-State: AOJu0YyIy0iNTsUMlwQkPy1WU74NY1VaHdRPB3NwWrqbvvbaPeoXIYEH
 uqVH7cQNSHN5wrnofxv931pcBYJjiGIbI7sBwItLXA==
X-Google-Smtp-Source: AGHT+IFh7Yh89j5toiLrapBEM+lFJrnPKMRKQDggX4YR83wnaK2tnE/8N6Y+YLTaga5Qlr9XmuCrRhn8q0u0c8VABfw=
X-Received: by 2002:a05:6870:b69d:b0:1d5:b0b9:f6f1 with SMTP id
 cy29-20020a056870b69d00b001d5b0b9f6f1mr6386214oab.8.1694698724531; Thu, 14
 Sep 2023 06:38:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Sep 2023 13:38:43 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.3
References: <20230914131058.2472260-1-jani.nikula@intel.com>
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 13:38:43 +0000
Message-ID: <CABnWg9sy_u5+TRvuRXEN8FB8BGdSadYimUQ-R6=PYEKZn2RZRw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback
 error path
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023 15:10, Jani Nikula <jani.nikula@intel.com> wrote:
>Setting new_edid to NULL leaks the buffer.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>Cc: Markus Schneider-Pargmann <msp@baylibre.com>
>Cc: Guillaume Ranquet <granquet@baylibre.com>
>Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>Cc: CK Hu <ck.hu@mediatek.com>
>Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>Cc: Philipp Zabel <p.zabel@pengutronix.de>
>Cc: Matthias Brugger <matthias.bgg@gmail.com>
>Cc: dri-devel@lists.freedesktop.org
>Cc: linux-mediatek@lists.infradead.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: <stable@vger.kernel.org> # v6.1+
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
>---
>
>UNTESTED
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 2cb47f663756..8fc6eff68e30 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2049,6 +2049,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> 	 */
> 	if (mtk_dp_parse_capabilities(mtk_dp)) {
> 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
>+		kfree(new_edid);
> 		new_edid = NULL;
> 	}
>
>--
>2.39.2
>
