Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181253DE90
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 00:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78EF11B40B;
	Sun,  5 Jun 2022 22:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E4611B455
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 22:07:12 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id s12so18444384ejx.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 15:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EvdrzNnwpDnDn9YN3OQw+McxNhWHrslS9QPN5TMLp4w=;
 b=jvBhc6+k40HESfBa2/kHjiPXNsmhn9RWusQQuekRCoRpZQxLjI+/bUUbQl40oGkXNZ
 DDlDD3Kts3OXg3AmYrDeujl79CfM+aMVcarycdisbklXcuz9M6WyPexFrr+ZQMwsJ7fn
 dYHoHaT6aA2SCKYliWMEXzOsKPHOWWDi99Y6hRp5dv1oHYwcBWUEXQlnm+bbcGdQQLZH
 LV2qZDFjXplNKazciGbp3xseWSxXEVDm6+uGpG8oJEcAMulX+6vxNeX0qqBb+3f0vEKP
 okp7x7oGotXEuPMC3aAd5a+4/PqZ12tcenMvg6drAosssBmSjmuhpmp/86uuoPdeDk2c
 QyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvdrzNnwpDnDn9YN3OQw+McxNhWHrslS9QPN5TMLp4w=;
 b=H+9Q4OQ93apJ7kbqlImHgZRIHcW9SlplKk2zBpxpikuuuxtxZtvAhue6bI+B3iwTXp
 JF85H6qzzHPjY94kvSdpZJcT2P3F5CTyYuiZMtrhH1ozkLqPTIFBZjnxrfvKF4cb6Ye2
 vh1fWl0a2YLsrAqjg05/Vsme1No7CAq1hvvNQnJ3zs0f+0TxsfMrIW9jOKupcRR4f/q2
 uEJp8SKN+99d0FVqoO5CC/+Gxa+d1eOpjwBhWcrd/sgxKD7KEqALsy3F+mFhmeEximMx
 9FNl/yRNnYnt8seccWtyxMgK4K+sfq2S46OkZXj7tc2o3XLxDXm/ffzJPYATR6Y+80b7
 N+mw==
X-Gm-Message-State: AOAM532e2/yu4aCdXrUVe5s21StBw34glGDSICLhUIsVvgfAIUwlp6pB
 Pa6ZIOzDJX4sLgie5eyRJUBb5WQCHzVJlSZ+QQk=
X-Google-Smtp-Source: ABdhPJyum2q6NTjWpptCxZaYoHpCsIXUQommOK3UQGv2TUoY11eOyZCV12TIf8OGUqFO9UJM26QCVQsp7K7VJczHj2I=
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr19174262ejc.13.1654466831106; Sun, 05
 Jun 2022 15:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220601033927.47814-1-linmq006@gmail.com>
 <20220601033927.47814-3-linmq006@gmail.com>
In-Reply-To: <20220601033927.47814-3-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jun 2022 00:07:00 +0200
Message-ID: <CAFBinCCS2ypuv8jWCyhTVruGJTUfq394CySDDaXExHq4R526rQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/meson: encoder_hdmi: Fix refcount leak in
 meson_encoder_hdmi_init
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

thank you for working on this!

On Wed, Jun 1, 2022 at 5:40 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Note to self: at first I thought the following code needs to be changed as well:
  notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
  if (!notifier)
    return -ENOMEM;
But a few lines before this we already have:
of_node_put(remote);
Meaning: this patch is fine as is.


Best regards,
Martin
