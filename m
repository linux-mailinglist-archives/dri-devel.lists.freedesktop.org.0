Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A848E041
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 23:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408C110E132;
	Thu, 13 Jan 2022 22:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BFA10E132
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 22:29:19 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id pj2so11832759pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1K/yKL2WvJn2YGUJo5lqXQyVrI3vSCmiCN73nfsZf0=;
 b=zEXhmHNz02RxVCbfspu8UevBoIHOwntAfwjELDVfcib02KtcHHCr83emWqVXZvUG5g
 ORk3BAuPg6rO+b8p8aS1ctaoBVAZ7sfyrTrALV+u/X483FmP03scphDbgix+/xy1URKP
 JaPyVQEigh8P5N1xmcNeRVdfPWcs3o2WAEJjMovYHdahAapP55kkuO/SlGbD64nsbHfY
 eYoU6Z8Mtq+2SNoJYYzpJeAEVC+XqSMClPYOwG7bYbaiX3zr+h11w0F5X+x4Yt3zDZnt
 l4jKFRGRCUZ+eAuDrgFBiOGs1YpXggpAIIjI6MHOBATAJZBj/13Sbpzx5sB67Pq0//oD
 d98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1K/yKL2WvJn2YGUJo5lqXQyVrI3vSCmiCN73nfsZf0=;
 b=FYXMCAAaksw3CPSTlsRYl9Imm9sorXAUOlYeQ68cP8/LYX2F5D1Z9oP0hIJwygMyW+
 gPrv8LaQP54blWze3GmS+mvkNyVic80WcyZfm7Gb4SZ0PNjZsCzuqjru60WJCyCvYYyA
 ERMoafu+oZzSTXusDRbxrFgEFoWxAbcrIMcPTQC6gljkPSd8avE9WPWqaITRkr888oTl
 jeS+gVAoHPDVX7Yhr83tytgRFkm8cYONkkByhGQdIkT1pDwBwUy9tIBb1fRFnXoZFmQU
 YPw+xE2u6Gx5x58gvxvB/NLWDwBp7JKwgOlhp+9EFtPmzSEyOpRXyWdzLATAy5osGqLU
 MjJg==
X-Gm-Message-State: AOAM533MWzNe0XTdndPrAa/fYnyDHw81q03AiU0RRhKEhkw3ZqAlM5f/
 ndRYaMkN87llOxJBylw8atiY9g7dDp8kFKGf7+NoUA==
X-Google-Smtp-Source: ABdhPJzFlKwHmQIvDDrxARkQ+dVH6aAfYK79ymciXrpQfjKxHQ+oYkRfxCZT9peoGZcOcpvJA0wCSIjbeGeYZewWHr8=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr1025161pjb.179.1642112958996; 
 Thu, 13 Jan 2022 14:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20211112061741.120898-1-jagan@amarulasolutions.com>
 <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
In-Reply-To: <CAMty3ZD_JUBzEDky8Q0N4QEmaWkpkd4gUYmLzDPBhKvi=eiVDQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 13 Jan 2022 23:29:07 +0100
Message-ID: <CAG3jFytf4XBQN3kfAtyE+f48zdN2bcSzUzcZQ9B2vYiSwSXQ5g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Switch to atomic operations
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com,
 Yannick Fertre <yannick.fertre@foss.st.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.

On Thu, 13 Jan 2022 at 20:43, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Nov 12, 2021 at 11:47 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Replace atomic version of the enable/disable operations to
> > continue the transition to the atomic API.
> >
> > Also added default drm atomic operations for duplicate, destroy
> > and reset state API's in order to have smooth transition on
> > atomic API's.
> >
> > Tested on Engicam i.Core STM32MP1 SoM.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
>
> Gentle ping!
