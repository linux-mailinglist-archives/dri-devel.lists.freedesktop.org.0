Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F03F0B63
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F96F6E8BD;
	Wed, 18 Aug 2021 19:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CF06E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 19:02:34 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id a5so2404571plh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMXez8qENPUCcqh2E+tbnIxsJfldRTnwEZLMxK7eXc8=;
 b=c8xDb3VhAM2UIAdOt9z9b/Wbob+uRx0FmaK+KR+eQy6dysj8cv+U6AjDt0EdkZ2361
 8DH+d1rDWQGumbm1weW6y+49EvJQugDSRI7FdsLoB8IhE3fOs/ypXDjAzSXstWItFQdS
 Sg+JSf7LGfFIMpKFsioTnB+5Yd9zSeFnL1wt/K5eceIQNpdkIH1EwOcrvgwzJyOXWWos
 QSlDAw8lC+neFkWd5lG+dmQHIDS+azCTkRHmEuO7o0CkxwEafJmVug5clZwaVVfvyqLN
 IEsJWXSwIhbpmD0ncTiF0WMs5m4PZRisu2xjDEptAD4ngx3oT3b+je2MjsjkUjBHQWE6
 iJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMXez8qENPUCcqh2E+tbnIxsJfldRTnwEZLMxK7eXc8=;
 b=EhlcXGiZdmzb9UD1sHnwW2hNRBYVeBKsGwQuSKo7mm35WrmYYchiGaNfaeM6GVbVd/
 ezixKe8kXoy+MPxOusdAWkDfgUmqICOCWCtpPa1BtMqWzKV3HzEdMIwrtkwEorbGqHuc
 MW99R+Kcxp9Kf7rO/+p/hd9VEf82+M/lku54Gt3V4Ec6i4bZRixgoJsCon6aoP0A3X56
 sB0WdecGEJGC1W45h+2sp0mW05tZk7l5cFJChlj3X6i+5Da5Uu6XIZcp8+ML86MQeWZy
 4URmcNCEYo7x9A0/fhhdKzV1MHXx+P+rMp3RqxODLcK3eyiNhQy5B7cPVOgo+B62FT5m
 BsUQ==
X-Gm-Message-State: AOAM5334kyv/g03I085PG5Fghir3nsgBqDWgMBqWTdqNL9PINxfpGPpu
 tojDcDvVaGOMHbrr/RkHANorLILjxBDvuZ+tevrhcg==
X-Google-Smtp-Source: ABdhPJxSsH7+R4Vr35DJYqsUv8sBHjgia/aPY5AUcIG0AzDMU05I02y0VsRjaBMcpir9IGiJRfjyg9KfwdJpkojrIWE=
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr10623395pjt.14.1629313354417; 
 Wed, 18 Aug 2021 12:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210818171318.1848272-1-robert.foss@linaro.org>
 <20210818171318.1848272-2-robert.foss@linaro.org>
 <YR1F+I4/JbBAgpwZ@ravnborg.org>
In-Reply-To: <YR1F+I4/JbBAgpwZ@ravnborg.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 18 Aug 2021 21:02:23 +0200
Message-ID: <CAG3jFysiY-w1wXcA=qpjbTKF=2N3tjOND+SvwcLr7b_UZhepGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Propagate errors from
 sp_tx_edid_read()
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>, 
 Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

Thanks Sam!

On Wed, 18 Aug 2021 at 19:40, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Robert,
>
> On Wed, Aug 18, 2021 at 07:13:18PM +0200, Robert Foss wrote:
> > During the sp_tx_edid_read() call the return value of sp_tx_edid_read()
> > is ignored, which could cause potential errors to go unhandled.
> >
> > All errors which are returned by sp_tx_edid_read() are handled in
> > anx7625_get_edid().
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index ea414cd349b5c..abc8db77bfd36 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -845,8 +845,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >                               if (g_edid_break == 1)
> >                                       break;
> >
> > -                             segments_edid_read(ctx, count / 2,
> > -                                                pblock_buf, offset);
> > +                             ret = segments_edid_read(ctx, count / 2,
> > +                                                      pblock_buf, offset);
> > +                             if (ret < 0)
> > +                                     return ret;
> > +
>
> This could be just "if (ret)".
> Same goes for the next case.
>
> With or without this simplification:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> I assume you will apply the patches.

Applied to drm-misc-next
