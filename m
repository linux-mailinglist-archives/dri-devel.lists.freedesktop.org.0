Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DEC53DE83
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 00:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0311B2AB;
	Sun,  5 Jun 2022 22:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA84E11B2AB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jun 2022 22:02:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id q21so25680265ejm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 15:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zt9GSJY6oHFpCzwgjAcBrGgFRTLh7TnEuClTteoy+qI=;
 b=fD8XxZY1UodhyOBn79r1tZ+Q0MT0UQOxYmKuwWu9STl2WERhDyPRlrW76bSrHbR0p8
 h2jIOQMEfKo943/CfW+W7qD3jgv8tlDwjC38Z1qyfiROdPyldOBURnJyTjq+0wFyEQOv
 ZOymioOaqVofr8QXjy5bYg0FEnQs8GYNYYIlsIkqVeYAUXLIRFsmX/DXdu41cZy60tvx
 nqI9VHkEHq1z4KTzZ8pKcWGAa8ctpadE/cjcK3VZSw2YGKVjZAmRhoRlQ4FjZNlRYuq5
 1WxPCDQd8EDwxH/hZFWu2q0o7VouN3IK6vpONMII7jLb5dcT+6YyJJVv/6F5DKewRHt0
 GFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zt9GSJY6oHFpCzwgjAcBrGgFRTLh7TnEuClTteoy+qI=;
 b=vXMFYma771jYbppkRx9z4sc/JkVmJvBtrsPtZ5ap0oieVPlln0VVtCHaUv3V1bauH1
 5Y0CQcDVcj2POGXAXup+wKp55bwlBw8WsMc3NWOG178aVvMDUIF3LvmFx65Kyy6G/m86
 YyjC8EZ0NIB3sMAsMndGKAZ5sDXO2+6gTXVkFVfSVoTXxXo1okiLDpXRaMdeeWKRYIxU
 Vd5DbyC41pn7ecAEKs00d59X2Fu23GsaYmkO+RoeMvMwnfudXXwxEFcq6LwwJufIRqRj
 GGvJVKHGeVYAXeDWGcJd2/g+PHI3c5vB+ezvt5ZNEBaHSXBWl6XqMxHx6FiJf4/xnu0r
 wyKA==
X-Gm-Message-State: AOAM5331vhsn7CFtjhVp65D9FJCAxtUYJCpGPbvEsz5Oxk/K/J+w9VMp
 bCjSg9DI4f9yrWrJ8knQXA8OKtxmdt/tD9hHyZ+GsDWN+YM=
X-Google-Smtp-Source: ABdhPJwPw8jFhUlGOroYyzAMGOrWBCkJypBlZn//O+7ZtQdDWM0D6LpkEi2VMyUEjPbLEZCd+AQhTQeVLI3Q18ByDY0=
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id
 w14-20020a170906b18e00b0071026db7a53mr10185146ejy.290.1654466568353; Sun, 05
 Jun 2022 15:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220601033927.47814-1-linmq006@gmail.com>
 <20220601033927.47814-2-linmq006@gmail.com>
In-Reply-To: <20220601033927.47814-2-linmq006@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jun 2022 00:02:37 +0200
Message-ID: <CAFBinCAkdRrk+EcZvFFiGEU3r9QtKfxYEPgpkn-HtRmBdwRSmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/meson: encoder_cvbs: Fix refcount leak in
 meson_encoder_cvbs_init
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

thank you for your patch!

On Wed, Jun 1, 2022 at 5:39 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device nodepointer with
> refcount incremented, we should use of_node_put() on it when done.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
As far as I can tell this patch is identical to the one from v1.
Please keep my Reviewed-by from the previous version in case nothing
has changed for this specific patch:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin
