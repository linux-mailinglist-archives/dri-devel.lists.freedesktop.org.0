Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03873A120E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52766E5BD;
	Wed,  9 Jun 2021 11:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DDC6E871
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:07:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id bn21so31132399ljb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hO3vEEVdO0DPz+vO9KJvLBSJTaoPQXnru30sw8j8V+k=;
 b=tJ+IxUQX6y8nk471bg47+iouc2pnb5EzeCVGDMgfLNBUUydydIFqq6lhq/QTCdnxoi
 ETRyEs14qkwYFBNvb/vRgeiQw8SxbBcHxjYav9X1GrSQ3qaKSPkupNdkqkY/jwC+RDY7
 7A3o3Z4V/nSi5iyqhEr9hxnBtloNMkYSXpM+UjFwtN7Kz2HvnQ7P3YjmM5M0Q8/qTVHG
 3yVusC9NM0uIaOxkCxGe3ccLUlb59nfqak4qCXCkPmnMrkt4HxL+ZVO/zYUPfdsmP94r
 9cHO2x7EITXWT1XtHoIwzIklwSrrsHteBwexobdOewu31/N/V/hyIE6+7nbIgvvxrEUB
 CfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hO3vEEVdO0DPz+vO9KJvLBSJTaoPQXnru30sw8j8V+k=;
 b=Wc4DLCklKE5o2hfuHew66E+Y+mdp6+pYA9++RY9AW/ltmZ1zPcO4nRoAKikWPF2u+g
 5Z+0jHlX2LMYBo09o41oMeLNykZqHOYkumo8SmNKy6nU7KMCnMerbyf8ttS4kaMUFzJr
 73Amw0u+d8Fep34vi33szu7YYi+4HadxUXlgyJMpxCueKmgayqcXr8PT/UKPdF2R9je/
 9WFF5KGRAOy3XfnBmzi6TvinvSlv0bIUbtxdsDHNGt7otdPzBNgMq6kzq71cDpZAO3pJ
 paRBWdJMC9YV1z7Nt8wQ4LAUJ5o+5bTLicNM2Q+VBC/iyzzAcKMksle+YSwCZjCb2I5G
 iSfA==
X-Gm-Message-State: AOAM5321N48Aj3JToJpvfFKOX0wnSe2rnOuYQvTP7b0yKbSn1Tp/hWPz
 P+nhc9g6O+AypTCH48pv6ZPRG8tefE0KsikRCjB+Rg==
X-Google-Smtp-Source: ABdhPJxL1/o/55M4zUInEECGJ8JlN2FQ3cBr/0HO5voXevIvLQKWpjpiW9USKNXD1KKnOZdv1T7oDDPbAU6x4fmJssI=
X-Received: by 2002:a2e:22c3:: with SMTP id
 i186mr22139779lji.273.1623236859907; 
 Wed, 09 Jun 2021 04:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210607170555.4006050-1-dianders@chromium.org>
 <20210607100234.v9.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
In-Reply-To: <20210607100234.v9.6.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:07:29 +0200
Message-ID: <CACRpkdaa=1LsyESZenDWv91mTX4H_AhwzGnSO2b9v8zXRMAvzw@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] drm/panel: panel-simple: Stash DP AUX bus; allow
 using it for DDC
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 7, 2021 at 7:06 PM Douglas Anderson <dianders@chromium.org> wrote:

> If panel-simple is instantiated as a DP AUX bus endpoint then we have
> access to the DP AUX bus. Let's stash it in the panel-simple
> structure, leaving it NULL for the cases where the panel is
> instantiated in other ways.
>
> If we happen to have access to the DP AUX bus and we weren't provided
> the ddc-i2c-bus in some other manner, let's use the DP AUX bus for it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
