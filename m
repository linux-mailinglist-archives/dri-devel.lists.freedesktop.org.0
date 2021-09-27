Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1647418FC4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA1B89FDE;
	Mon, 27 Sep 2021 07:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520DE89FDE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 07:17:33 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e15so73172640lfr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tuPT9UMjnSF9/x2VxZzbMJbiT3SxCc7RjnbYKdMUOXk=;
 b=NpIOiC9JGVYQ+YGJXTh0LGscT4eTT3N3WB0MpB+nmp0e3RAkiFa2U+CmaWuVoqhtFB
 F4roQ/o1rqwAxesyKp5TXE9xgLRngmIpg3EjrhOt/gtJUwL3ikK+DfcjscR5NvdsGYnR
 5pO8pRUAAMSth27MjzOIJQ1hl4F0G9pW3gxD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tuPT9UMjnSF9/x2VxZzbMJbiT3SxCc7RjnbYKdMUOXk=;
 b=3bSpaLhjbX115DJ38jYUdbBnGGvqoBALFlSuMEp3WPlU0zoLpwv/03FJtgXSWzPa8/
 OHmwjWRctaVsCLis+Niiu938FCzcrs45h15YNKA4mbsdGeLXjHGbTR87B5zYuV+VTWHN
 L0Nwxw1Ic1GPdavqV66NYBk/JWUmv0Kw/wjtqGSv/0BEoN6ap64Isw7yVyiqRWFIUUc4
 VL6+R/Geg6wXlUU/anvkXua3l8fii1Nunfk2cZxwXKXg3PQWX8ewyuBtBudjnG1EpjyW
 RoBMSUNjAwmKG1bSsX0VOzcmnsKvUZnn4H9dtH25V6NvSwUkO5ehalu63cFmVlcbUIOr
 y6KA==
X-Gm-Message-State: AOAM533o+mCJgnvLNAgH8zxuRDt4Ajx7Pbvc2Ywnh+LQwm2as6DvIgu/
 W24vhYBKUBlU5n4WjQZ5bxiTGNzHsyrCTG9lrCCgMA==
X-Google-Smtp-Source: ABdhPJw4lCvDI5qxWeg9+Zx4oGNCCIFt2BJqNldnjQXhKLPJfzJPOcHS8LHpQntsfImx7DzCXz9/tkEB43a7uAvl+iE=
X-Received: by 2002:a19:c3d3:: with SMTP id
 t202mr23208923lff.678.1632727050548; 
 Mon, 27 Sep 2021 00:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210924162321.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
 <20210924162321.2.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
In-Reply-To: <20210924162321.2.Ie8ceefb51ab6065a1151869b6fcda41a467d4d2c@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Sep 2021 15:17:19 +0800
Message-ID: <CAGXv+5GVpm2PeKkHxnn4gd_WE_Pyoij1RjYiJbAMnyze6RT5oQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Fix unbalanced clock on probe error
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thomas Hebb <tommyhebb@gmail.com>
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

On Sat, Sep 25, 2021 at 7:24 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Our probe() function never enabled this clock, so we shouldn't disable
> it if we fail to probe the bridge.
>
> Noted by inspection.
>
> Fixes: 2d4f7bdafd70 ("drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver")
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
