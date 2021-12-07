Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7113646C4B8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DE86F4BB;
	Tue,  7 Dec 2021 20:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539436F3FC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:35:18 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y13so589936edd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MRZw23Xhwm034MxzUFYS0W2vmCiMWc2hTeEkBiheS4=;
 b=qfF0MYJkiFXO0yo8SQ6znn/oJgn6KSwPAP1iLWoYgqaPKBLjWS9aapuVGD44/aNRYw
 HS/lIJtTah7IN96FwxnpoMyotra7uHkqE5yzsXlWyN859sEjJDUGw7jv2F3deGJqDxJV
 0xG+aaSTkYAJJDvgcDGa/xpemTN7XfUe1H+CfpMm2mh7D14qhEAb89vDYvSN7Zu01WGd
 8r/JjuhQcJyPAY+LsixYEfL8sPtE0aGdnpGOKASxjqnTuE+L0fgnzUKBOP9pYWAYuhiM
 sks2/N1Q8BYbfSrkMfDWpm8xrZv0F/wM2KoMTapr+QpV1syjcTNpJC8ityaOJ/6/RrUN
 /Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MRZw23Xhwm034MxzUFYS0W2vmCiMWc2hTeEkBiheS4=;
 b=0ua6iUPLW+ZzXWyn/0Xm/Azg/YIcB5ZC4//jsE9hvt70jUQgT43eeSDvz5tIsZedcS
 /eb/7b2/NIMyfhv76eexpqx4zkB5R7f+j+bTJkZx710/NKYP9T3LBLcdp3xr1/XRfPpT
 71Wl6ssBFIbOEI85tSQQJdThW1WV+t91dD5+Rc+BPVqqMGDyaRz+gVnotOU26A43NVcy
 P8XxjjvuGVoDQ49KuQ1YAeIEUpO4FtcCe6OyZs7O61lQqMUgVpWiN2QYntpkqf+14ax1
 1x2LfECu1DokAYoEXUTSgMdQdLt2Ish4Rp9QxF54GkIJP3SuZNn5M+1607uF3YOnbyJv
 n5rg==
X-Gm-Message-State: AOAM531wswk1VK44WqnnRw/E63W3cQWlIvLt8c5DJQLI08nM6oi0OgNY
 IJ2u4KRv11cIgyQHsDn4SA0=
X-Google-Smtp-Source: ABdhPJx0SWF3W7Bhi3m6edkmD8uWCMeg8DC63JJDJOK2Np1eJ3slwzM5ocsXKmQHaTR4xNbZbvQOcQ==
X-Received: by 2002:a17:907:7896:: with SMTP id
 ku22mr2068285ejc.410.1638909316846; 
 Tue, 07 Dec 2021 12:35:16 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id og14sm320822ejc.107.2021.12.07.12.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:35:16 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/bridge: sn65dsi86: defer if there is no dsi host
Date: Tue, 07 Dec 2021 21:35:15 +0100
Message-ID: <2606289.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
References: <20211207200906.609673-1-robdclark@gmail.com>
 <CAD=FV=X81r4eBPYz_v6vju8bpUJX+HWS1vUuO+oC0AJUWsnCRg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 07. december 2021 ob 21:26:50 CET je Doug Anderson napisal(a):
> Hi,
> 
> On Tue, Dec 7, 2021 at 12:03 PM Rob Clark <robdclark@gmail.com> wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Otherwise we don't get another shot at it if the bridge probes before
> > the dsi host is registered.  It seems like this is what *most* (but not
> > all) of the other bridges do.
> > 
> > It looks like this was missed in the conversion to attach dsi host at
> > probe time.
> > 
> > Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI
> > device at probe") Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > b/drivers/gpu/drm/bridge/ti-sn65dsi86.c index 02b490671f8f..3684e12fbac3
> > 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -716,7 +716,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86
> > *pdata)> 
> >         host = of_find_mipi_dsi_host_by_node(pdata->host_node);
> >         if (!host) {
> >         
> >                 DRM_ERROR("failed to find dsi host\n");
> > 
> > -               return -ENODEV;
> > +               return -EPROBE_DEFER;
> 
> Can you delete the DRM_ERROR line?

or use dev_err_probe()

Best regards,
Jernej



