Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3E0AACB44
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AE110E0CD;
	Tue,  6 May 2025 16:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cIhVxbib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292110E0CD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:44:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5f62d3ed994so5121968a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 09:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746549885; x=1747154685; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IHvaBJ3UA5wQzSuQuqqdg5+tccnOgm+U77rPrezPw3k=;
 b=cIhVxbibBOY6fUai2MlQ/j5eewqDxMSoSI9Y+0YnCY+pUgWTMmuV5HfzCN/LTf4vrO
 btN71OM/otXIZgSPMLsfjaHz0rt0P4lpaYFEwFk7AV2ObnfK/9+JNmK55V6ibjouKMn1
 81JHi1KaKB3V09fXhq/h/CA6Mx6z+B4IvqKATxGUeeSF+SP5l1D95OmjXTMLGpIhmx00
 V8l0AJTCBmsyyobw00yi0ftHSTfy86AkO/l7fnAGQM21fo50nsLu8DqKa3XlC/SdNoce
 z1TKhxSWLzIxfUUg1Dthd6KIrx/R2/BKdIh/hia0lfrxirD3LbLufFpntx/hpB317uVS
 LCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746549885; x=1747154685;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IHvaBJ3UA5wQzSuQuqqdg5+tccnOgm+U77rPrezPw3k=;
 b=wcd3Oa2lTGMIHjNv4NzqEHhywvn11argZFgNhQ1/8pfwsqRsFal9eSE3irMdEGljgA
 GS0UkEIiKVlVz0ckb9kmCkjoK6qmiQoOT7s0De/cDD8rPBV7ajE+pn8wbGhAOHcXpsc/
 EiWxo1JCj9GgUgXOlh6VXuGcwaPIRDnAzpSDOu47yakPV/j0987yWTNbNVf+1zxV2efb
 Deq0Bg0YexPK1Xq1YwrYxQrhxW3TO00Fme26865IxaqRY1TW/cov04fTPiUWT1+mANsE
 +DtIz0XaoiT3cUUobjgxlQkqCxzQzekGrPNnQmfHezpDLaOCTqXvksW/ErrO4n/1Cs8k
 FdjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfFN8uS1WDMD+B2Z0tkMW/lXyjEVOoS+fJxhbwzaQUidWILxGIJKCiOKqZwQXyJTAZh+kpmhG5QT0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymuJZ/kv963y790LY4jTHI8XQ0HXR6LNrkO32xjZ9zBxXcFsDT
 Ru30Ez94n28r09IHpoayFBXaBHTMydFn5r6WFV1M5tPEbFtA7Txg
X-Gm-Gg: ASbGncsAT4D8P1/+fUfbLQO8hJkPw7zobXx1NTf1iT8KzWSBs1wQS7dF/zuc5/8tYrK
 8+cJecJGtcyBJukZWs2v9EIN36KreUkJRVcoGcR8HWmWxEVWCyCOxMaxBJCrpM7AfQinSxKoDVM
 IrtwtT1PiDZK82ZoV6tKTqTx3wMAec3KNg05nrFda6+I/hVBim8t315LIhfy0BSka+gva6jUinp
 p+7Z/hFnaweYbpR/tbCBnBLntueEpucEjlrBNh7ssrHLjtVqMtKiEcxlxz1E3kiBDtHBu9U7ouB
 23fwrGABkl5+9a9gfpEd8usq4ZseTcKCTyiWIWOzJfHqzteGaI2wa8cxoptEzIx8Mgcsud9hKgO
 KtHjRmEqZcHsv3TpJq/d/Xw==
X-Google-Smtp-Source: AGHT+IGLgZu5f8s1dcCDDtbrwGgWg+Mz6F251h3GFcuMyz151n/G5dgwIazSbTf1LLNnPQ3HZKA2IA==
X-Received: by 2002:a05:6402:1d4f:b0:5f4:d60b:6f8e with SMTP id
 4fb4d7f45d1cf-5fb6fea1fa8mr3657012a12.13.1746549884256; 
 Tue, 06 May 2025 09:44:44 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch.
 [83.173.201.248]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fb45a0c675sm2504900a12.14.2025.05.06.09.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:44:43 -0700 (PDT)
Date: Tue, 6 May 2025 18:44:42 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: max.krummenacher@toradex.com, Jayesh Choudhary <j-choudhary@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
Message-ID: <aBo8elFPYgPleK5n@toolbox>
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
 <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
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

On Thu, May 01, 2025 at 08:38:15PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 1, 2025 at 12:48 AM <max.oss.09@gmail.com> wrote:
> >
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > The bridge driver currently disables handling the hot plug input and
> > relies on a always connected eDP panel with fixed delays when the
> > panel is ready.
> 
> Not entirely correct. In some cases we don't have fixed delays and
> instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
> code.

Will reword in a v2

> 
> 
> > If one uses the bridge for a regular display port monitor this
> > assumption is no longer true.
> > If used with a display port monitor change to keep the hot plug
> > detection functionality enabled and change to have the bridge working
> > during runtime suspend to be able to detect the connection state.
> >
> > Note that if HPD_DISABLE is set the HPD bit always returns connected
> > independent of the actual state of the hot plug pin. Thus
> > currently bridge->detect() always returns connected.
> 
> If that's true, it feels like this needs:
> 
> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
> connector operations for DP")
> 
> ...and it would be nice to get Laurent to confirm. Seems weird that he
> wouldn't have noticed that.

I retested by adding a print in ti_sn_bridge_detect().
With the HPD_DISABLE bit set the HPD_DEBOUNCED_STATE is always true
resulting in reporting always connected.

When one does not set the HPD_DISABLE bit and is in runtime suspend
(i.e. detect() enables the bridge with its call to
pm_runtime_get_sync() ) then the HPD_DEBOUNCED_STATE is only set
after the debounce time. As it is immediately read here detect()
always reports disconnected.

> 
> 
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > ---
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 01d456b955ab..c7496bf142d1 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> >          * If HPD somehow makes sense on some future panel we'll have to
> >          * change this to be conditional on someone specifying that HPD should
> >          * be used.
> > +        * Only disable HDP if used for eDP.
> >          */
> > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                          HPD_DISABLE);
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > +                                  HPD_DISABLE, HPD_DISABLE);
> >
> >         pdata->comms_enabled = true;
> >
> > @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
> >         struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
> >         int ret;
> >
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
> > +           pdata->comms_enabled)
> > +               return 0;
> > +
> 
> I don't understand this part of the patch. You're basically making
> suspend/resume a no-op for the DP case? I don't think that's right...

That is what I wanted to do as nothing else worked ...
Probably there are better solutions.

> 
> First, I don't _think_ you need it, right? ...since "detect" is
> already grabbing the pm_runtime reference this shouldn't be needed
> from a correctness point of view.

Correct, it shouldn't. However if the bridge is coming out of
powerup/reset then we have to wait the debounce time time to get the
current state of HPD. The bridge starts with disconnected and only
sets connected after it seen has the HPD pin at '1' for the debounce
time.

Adding a 400ms sleep would fix that.

> 
> Second, if you're looking to eventually make the interrupt work, I
> don't think this is the right first step. I think in previous
> discussions about this it was agreed that if we wanted the interrupt
> to work then we should just do a "pm_runtime_get_sync()" before
> enabling the interrupt and then a "pm_runtime_put()" after disabling
> it. That'll keep things from suspending.

The HW I use doesn't has the interrupt pin connected. So for me that is
out of scope but should of course work.

> 
> Does that sound correct, or did I goof up on anything?

If I remove disabling suspend/resume and fix detect() to report the
'correct' HPD state in both runtime pm states I now get another issue
after disconnecting and then reconnecting the monitor:

[   50.035964] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read lane count (-110); assuming 4
[   50.212976] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read eDP rev (-110), assuming 1.1
[   50.389802] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read max rate (-110); assuming 5.4 GHz
[   50.686572] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Link training failed, link is off (-5)

monitor stays black without signals.

So it seems the bridges internal state is not completely restored by
the current code. Looking into that now.

> -Doug

Regards
Max
