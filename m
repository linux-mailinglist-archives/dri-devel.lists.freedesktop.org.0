Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBC48DE38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 20:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5310E23E;
	Thu, 13 Jan 2022 19:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C682310E23E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 19:43:41 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id k15so26897848edk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3gm+gNo0zjsmtqAqZojO6FheaWTHrpjc/JFQYPb+89I=;
 b=Elpf6wzr/rTYwUH8dDbMnQY/eDnzUUmm6V69NIGrg24nZi5yWGtRxKEcJXZUyE4nKT
 6+TF1/R3CI09N0TxwNXFbWKVrUZZG7zcUY7a+8L1/I31dx2ROW2vvhkF51t709mJOD1Y
 ou1pdCySuHLCorZtWvidHkllvvBCi9qG+K1Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3gm+gNo0zjsmtqAqZojO6FheaWTHrpjc/JFQYPb+89I=;
 b=LcbfNDuTTlBYcQrsRHLnTBs0MSEJNusNVWdMsMdKoBATbcAkAl3psZFvwSfJhbnoVL
 xsC9L9SEwbVrEnYZtxfObqHeIxHNynvNnV4swwfnbclauh7e5DBUSE55R3cdaLBtPoEE
 OWlXEXHgruwv5FjuS4gLMrImEnC6OcqIE56AYivWrO+XgWaOL271Vsh7v5pm/KllHrKz
 qBGxFCxfBlPAiSOdyIub4q5g6jMWL6oBDYOWcT9u6Zv6P7jHMJxe5SHS9JwJKEuhksCS
 3o3cDLaQLb2p9xm7gvwhpVnPEi3jI8A4EUnUQmKHeRhOjF2HEGEElS1hkYps0shn0YE2
 VAag==
X-Gm-Message-State: AOAM532YkU5h3XUj+O0Quq2WuCfsAmft8JfXrvjrL6qJ/ymQBnk+yBXf
 iiEInEN/pXgR6g0obqjK9cewhZgA1okdKCfxKDwbpw==
X-Google-Smtp-Source: ABdhPJwSGzQMALZDzukZvCwFu3bEC7PAaQZfsvUvIf4CKj49ZhnRmcM+B3lppKCcQPik7TqQq7RqyylpbRv0o97G6ME=
X-Received: by 2002:a17:906:b003:: with SMTP id
 v3mr4797695ejy.770.1642103020036; 
 Thu, 13 Jan 2022 11:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20211112061741.120898-1-jagan@amarulasolutions.com>
In-Reply-To: <20211112061741.120898-1-jagan@amarulasolutions.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 14 Jan 2022 01:13:29 +0530
Message-ID: <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Switch to atomic operations
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Heiko Stubner <heiko@sntech.de>, Yannick Fertre <yannick.fertre@foss.st.com>
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 11:47 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Replace atomic version of the enable/disable operations to
> continue the transition to the atomic API.
>
> Also added default drm atomic operations for duplicate, destroy
> and reset state API's in order to have smooth transition on
> atomic API's.
>
> Tested on Engicam i.Core STM32MP1 SoM.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

Gentle ping!
