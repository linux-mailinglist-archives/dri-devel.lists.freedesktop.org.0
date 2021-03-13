Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BC33A0F9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 21:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDE66E118;
	Sat, 13 Mar 2021 20:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02006E118
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 20:23:25 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so12395550pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 12:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=ZComPBNmBnlqs+w0q0axDrp2f7RBu3PW/uQNk9c0Mhg=;
 b=nZrKaPnBoh/iTbk/rPQgvk9qqHWK/RiepcUBKG52cr72cN8noIjG4ylYQAnV6vV03+
 L7uTZCeeYJZPFnHf5oaOUgCir5abAz2eN+6OTWrpWm5qHWz0/BxJyifYCG1rKZNZQpOX
 ws2D8Ddv06kWnUXJOEOC10pHfySsaIMqJibbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=ZComPBNmBnlqs+w0q0axDrp2f7RBu3PW/uQNk9c0Mhg=;
 b=idMe7EG+VaOWxz1LLkkvKtb8zjEOpOjvXh3xbBiHuKxQJnYH6YTT5Y75H8YJoGDFy7
 a+5idlrcWkVmqScT75KvmArr6P8GbTcb8X0ltnSy4B8a4D0/B5NFprYOgJUHVcbmZ4cn
 /ClE0BbTIApS5vub8MmKFoXeb/2WSsTvZ+cjgbAjS6ZGBbJTfe2KiCoA24CLPbO6U5QL
 DZUSmMog57hf4zhL82Azp1F4QsdClORp2IMPmA4oE1UgQgL7NJ6862yeSDkUJSWerieI
 EXUv0sNOxXMJjYMJAhFEbSf40b7qI2asxiPHD/MiJ1+SpkIrpFQlP6BucOJNZDrx5NN1
 XKkQ==
X-Gm-Message-State: AOAM532im5cQ3ELeE7c11kaoVXA16egXPJvt5yEwighSzIs7SK0U0yVU
 QR3M/3cVasjEUAGNe4EA8RES7A==
X-Google-Smtp-Source: ABdhPJznrkgb4Vd9RGXUd7Ed7KRkZc2x1ozNjnwo1RoQtD567KQBnrtv+hRFwfyfkIYeRiOhS0oyPw==
X-Received: by 2002:a17:902:8a91:b029:e6:3e11:b252 with SMTP id
 p17-20020a1709028a91b02900e63e11b252mr4516299plo.7.1615667005608; 
 Sat, 13 Mar 2021 12:23:25 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
 by smtp.gmail.com with ESMTPSA id 22sm2521970pjl.31.2021.03.13.12.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 12:23:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 13 Mar 2021 12:23:23 -0800
Message-ID: <161566700332.1478170.13745405253404480721@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-03-04 15:51:59)
> The clock framework makes it simple to deal with an optional clock.
> You can call clk_get_optional() and if the clock isn't specified it'll
> just return NULL without complaint. It's valid to pass NULL to
> enable/disable/prepare/unprepare. Let's make use of this to simplify
> things a tiny bit.
> 
> NOTE: this makes things look a tad bit asymmetric now since we check
> for NULL before clk_prepare_enable() but not for
> clk_disable_unprepare(). This seemed OK to me. We already have to
> check for NULL in the enable case anyway so why not avoid the extra
> call?
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
