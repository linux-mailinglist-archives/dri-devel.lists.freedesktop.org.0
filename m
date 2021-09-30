Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F341DDC1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 17:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D50B6E0F3;
	Thu, 30 Sep 2021 15:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FA86E0F3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 15:40:13 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p80so8108327iod.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rSIy18tZojmsrzjfN9FHZFTJAPBKRcMqEY55dmth7w=;
 b=H/6IrwGnlqZqz+Zp8FvojRJnoTCF0J5joy+th6XZ0bLY8vA5ptPZ73KFd0zpaZOPFm
 2UdU+uTV0yCGeeqr6jasZs757aIgb2S7xNZZVJBQ9RpW69ufXMWRkQRLTdrvY3PoqoCP
 8Zcmk0EEifP+TrZ20drZqiFfCjmtAZ+ckByzn938xj+0J58xoFUlcomtD4wlKPMB6X0d
 m8zWToLc/1L+aSh8wG+DwXntZzFfiW1P4i0iCH6wDWzD6Kd4/AWqSa/pgTA+90sZGTRp
 aqlrq/x2jzWUyAPBygKkDKMxNbISBOvEagt+YgKjcD+Eql4RNSlO/vJEBdztAXKp6MvM
 RW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rSIy18tZojmsrzjfN9FHZFTJAPBKRcMqEY55dmth7w=;
 b=f++vn4+BStNhjjKYtEA1fgRLWkKfRjmunbrXvoFlDn9JY9y+2mDRCrCN+uTTmksc6D
 4a9gWy/H8K0WVFUy7jPyH/a1et+9KOI0HA+ep2/C7B6GQnbA+jtRS8eLltrYg8FyC/Jz
 Kd8vLJWGDW1oHmeriPWL3O6T2WT0Iw9CYUlisRWrlBIsVM/D4GLeAI7K9DM7wBUHAq2d
 Sg9uUChzxcjGmobxqsKvMi/KZg2+LrMYf2N8tPaZgbZLK7faUfWIcrADNPRysnMG6FL1
 enU0QAuWruw3S2MGVcHXHsYJJP2E3v0WZMTS/AmnLhwEUQYeShZ2Qr5ZoNziJEHyaJv/
 rO1A==
X-Gm-Message-State: AOAM531kFt2TGnYGZXp+xPdSfDmprZH3/ESc0EA22B18p6s+SngVsLe4
 OjJP4W74ryoU4dq9n7VHQ/NXxPrDrD5mdXasRmi4FA==
X-Google-Smtp-Source: ABdhPJyQb/uJaGJlYxt7XHtcYu354PpX7r3E/vrRNXFvnIQvH5kFYsuh7+ZNQ0DQrpwz0sv8l9mUREABQvbBsBgcVPs=
X-Received: by 2002:a6b:f915:: with SMTP id j21mr4456834iog.98.1633016412417; 
 Thu, 30 Sep 2021 08:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
 <20210930030557.1426-2-bjorn.andersson@linaro.org>
In-Reply-To: <20210930030557.1426-2-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@google.com>
Date: Thu, 30 Sep 2021 08:40:00 -0700
Message-ID: <CAD=FV=UY7=gr4xFOR40fWA42B2T0jFS+=bOmwSb2_=ebTN7gXw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write API
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 29, 2021 at 8:06 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The multi-register u16 write operation can use regmap_bulk_write()
> instead of two separate regmap_write() calls.
>
> It's uncertain if this has any effect on the actual updates of the
> underlying registers, but this at least gives the hardware the
> opportunity and saves us one transation on the bus.

s/transation/transaction/


> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v5:
> - Extracted this hunk from patch 3.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Looks keen. I'll plan to apply this after giving it a few days on the
list to make sure nobody is upset, though I'm not sure why they would
be. ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
