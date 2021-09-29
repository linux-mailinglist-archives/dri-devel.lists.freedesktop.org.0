Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25141BCBB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 04:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A3C6E15A;
	Wed, 29 Sep 2021 02:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20816E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 02:28:27 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b20so4401922lfv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 19:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzNXCj84D1g4PbD9Z2/a7WAfkTzxrDKROcDc/hzpBWc=;
 b=UFBbRLUsdxkCVsyDBTZelri1sE1uBJFhlXVFzOQ00BYD/vd027QrYNGqzaxNahSk5t
 p6RkaJek68Zp/n/NESHX4OhAOqTF0Ns7OTCXh7/7WouElvWnEJzoUqEO5tfPylzKLTcJ
 4mmlTm0nReyACi0Ttcsrq2osd9UWg42lgdAnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzNXCj84D1g4PbD9Z2/a7WAfkTzxrDKROcDc/hzpBWc=;
 b=pWVUO+poq4Eck88Zy/dn9YB8igw3nlXtRRTwyW5D89a/Ja08gK+1VqqbPjbgdK80cu
 quvziv2aHz6cv/oYGu6ohs06q1dECy5LKK9BMTBS524ZP6pqGEAe6HaxzwwYgZbTnmRh
 blIOm4kY65Ud/76F/BkaKid/1K0fDxMlZ3zaUvZAJUyQVIeqKNX0ttFnom4LM/uh0z8D
 BQQziymdgoZiPKDk28TGaAoHcF57rOugR1kPrDendjH5CAHzL5S6PjW145edXsWfZ5SC
 TQJq4i35FGHusDepW+iLsVnDTzeIgbUAmdJNp7lfui0O2zp6eUEZuD4dyAQCIZHsIH/o
 5KVg==
X-Gm-Message-State: AOAM532ofTQnlFH/KTQdiKK8IQLUZ8n7qe84OFpFHTzG7eS2ixEY0Rt1
 /MscKNX826/doHEZeh3jHIfkHkWBJmm+XNmtuI2Zfg==
X-Google-Smtp-Source: ABdhPJyNUZV2MQMbi62ec77cW4ABFydIvPmDIM3cOMvSI1YRYR4lewd8Ni0ge/QhfE1OeZiNo6sOeIu/PGqaRs29+uo=
X-Received: by 2002:a2e:b80f:: with SMTP id u15mr3549500ljo.414.1632882506299; 
 Tue, 28 Sep 2021 19:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210928213552.1001939-1-briannorris@chromium.org>
 <20210928143413.v3.2.I4e9d93aadb00b1ffc7d506e3186a25492bf0b732@changeid>
In-Reply-To: <20210928143413.v3.2.I4e9d93aadb00b1ffc7d506e3186a25492bf0b732@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Sep 2021 10:28:15 +0800
Message-ID: <CAGXv+5GiQrxrcwCt0A6Dxxodd8JTqUvEJtZdzB=SUKJuWD_RVw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/rockchip: dsi: Reconfigure hardware on resume()
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, 
 Thomas Hebb <tommyhebb@gmail.com>, stable@vger.kernel.org
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

On Wed, Sep 29, 2021 at 5:36 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Since commit 43c2de1002d2, we perform most HW configuration in the
> bind() function. This configuration may be lost on suspend/resume, so we
> need to call it again. That may lead to errors like this after system
> suspend/resume:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -110
>
> Tested on Acer Chromebook Tab 10 (RK3399 Gru-Scarlet).
>
> Note that early mailing list versions of this driver borrowed Rockchip's
> downstream/BSP solution, to do HW configuration in mode_set() (which
> *is* called at the appropriate pre-enable() times), but that was
> discarded along the way. I've avoided that still, because mode_set()
> documentation doesn't suggest this kind of purpose as far as I can tell.
>
> Fixes: 43c2de1002d2 ("drm/rockchip: dsi: move all lane config except LCDC mux to bind()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
