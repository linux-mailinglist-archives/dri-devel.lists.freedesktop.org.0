Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9392C496A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 21:59:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1826E90E;
	Wed, 25 Nov 2020 20:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E0E6E90E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 20:59:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z1so3741397ljn.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSc+USIpYmzMEHaLwlR/SOzDt5gT00VeWyTNIbEhUIs=;
 b=M04Q+nJNQ64PNRROT/3tOL0jupqO3QrHou/ful+jKNW2Tnc5EqT1kzFVo31TvCxJpa
 vWDxJpgmyAvIdvqOfpnoO0MzXwzR69WnX9v84j9YfJsMiDuTGlMbK4mLxlbX/BW5PelV
 9a25glA2jNbCbCKda1zAE+UgGGcNVQW/u4/BqG3PNYnjqOOeX4bP5qwsvgqta2sFCom7
 eR9ArC1Vs7xf4OeBy5gHKlB0/zsq6qkj0YqSK0SzRVrzMpbjDIEYLxLTjhZvfUZ2poRe
 PYWCie8FZPdAbq7aH/rFHHxHzJXUKgp1HmEJ7lvD6xTZw1qvaDtloTnzJerZG4pN5P0I
 5w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSc+USIpYmzMEHaLwlR/SOzDt5gT00VeWyTNIbEhUIs=;
 b=N4VdXuum/54eL+zxNnmjYsD2IcV545WjVVmlyrGJAEJu9xnlC/U7BHhV16hPQM3rnA
 hQyuy+L3MMmLNueSz43k2tin8MqpbwzdHLu3FY0YeubffKGAV/AePp9K1C1UKThUOlcn
 lAjhScQafRUZM7ksjjD0E09dqwikm2lBndiJLWZ2SfRFu4VpNFNSkHMB0gBBl76jUXyM
 NfKjKGcCHtruRl+woXs+p4+seld3EIsisu5LlB7VFxDrP8fZ8mtz6WfiEIaBw+XFHP3V
 XTX4UUo+SAlhwUOuFESiI0/gtjOcGh6UCXpc6Hgq16hUFEATZAGlL/6oiVVXi2OA+x6r
 ys0w==
X-Gm-Message-State: AOAM530piiC6n6SpW5Belnso72XvNE0mgRM+jsfUOKcbKpO1pTa+081o
 zS7rxHYPp6k43UYbiVGLtgp9khvZg8oM5PbYdD26kg==
X-Google-Smtp-Source: ABdhPJwVX3EcY7GPmnzEgXyZTSKFqwyBVhx9q5jqicnILRhlTpWEhBlLh80EasIgAOmyhBRHb6FiPzKjzTcZOErgx0I=
X-Received: by 2002:a05:651c:c2:: with SMTP id 2mr1997756ljr.104.1606337967492; 
 Wed, 25 Nov 2020 12:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20201124121528.395681-1-colin.king@canonical.com>
In-Reply-To: <20201124121528.395681-1-colin.king@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Nov 2020 21:59:16 +0100
Message-ID: <CACRpkdbh_d14y2a3zA2HZvfx1hSWw8wQBQ7WZGgp2f4wqzdwkw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/mcde: fix masking and bitwise-or on variable val
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 1:15 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The masking of val with ~MCDE_CRX1_CLKSEL_MASK is currently being
> ignored because there seems to be a missing bitwise-or of val in the
> following statement.  Fix this by replacing the assignment of val
> with a bitwise-or.
>
> Addresses-Coverity: ("Unused valued")
> Fixes: d795fd322063 ("drm/mcde: Support DPI output")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice catch!
Patch applied.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
