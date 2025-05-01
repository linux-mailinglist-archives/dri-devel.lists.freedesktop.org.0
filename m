Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B6FAA5BF6
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 10:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA4410E1FC;
	Thu,  1 May 2025 08:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="go4WGBEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C1810E1FC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 08:12:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so486496f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746087125; x=1746691925; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dFcXTX8spCHSXrXH6Pgc6qh5jLURBCENnqr3E6Qi8BA=;
 b=go4WGBEbsNSFWnHW7MkwiQFAnGdOliYzGYWHqRAVZHYPf1S9ImUtbrmG/7CulCTjRa
 IvBHuOn7yWwmXBELd5PWjbv+uSVKsWW76NuPFqaCXIRZpHvFCaR+j7NOaKFDPVVJiILj
 W0Qz2qTSGwTun1MqDTsL56ComfltWqHEV1tE7p71I6ENHqvbeNIibapZITED3XH22h3j
 FNn1JgIbS5pcT8ZblStw4EA7dZaE6dXXjbRV5jrBw4NXKTP3Z7lhnUKOGAVqpBrqp9PU
 dSAbeV8hWEKSZ4jkLZt1cLF985ChTxTBeBaR8pOV/0gwEvPbFhlMlrwW1GwIkRhuCbvP
 RN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746087125; x=1746691925;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dFcXTX8spCHSXrXH6Pgc6qh5jLURBCENnqr3E6Qi8BA=;
 b=HBwL6Fr3v9taFTIlX9nsSwQk7piE5CFKRnWWuLuhjuBzgJwOIscK/dfV/xKTX5ZNqe
 ovfZz4uEqsavDb95pvaXHZHOuGjdIIm/3IFfXlJhmC84ELxwse+7eJZsY1ei/zzde0d3
 lT5a6eYn/ha8W/uCwpyZ62H54EkW+uFRuv2k8ytJ4jr684PNoHMUFhri+ougI6Sblsyu
 gmOwp3lFQN9YHbXhY4G/oQvEukkTkU81Wc0snAY7+Wvnrh89ZfH9JZd5O2dYI6ITSXJb
 6a25Ag85V0R30xslYtUNOEDmi41FH2PSFIWryLpmWlO40xQtNG/cl7D0jaoe5B3PycNQ
 e/TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE92GFp7rHLngqHl04M3j1OOF9ZYVrnL/kEolRSoP31IhAzl7dGG1nSKVOCKxQ8AaL9eIA/aFcnog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypdV1FQbsAKNHlK2xGwASaC0n8jMiqvreF0nsY7IuFQCoJ/uvw
 w6UUvl/Bok3tjEbY7LgkK/fZzy+/GVu+0iSGgOnG6GaV34ZCtugD
X-Gm-Gg: ASbGncsbYXEuldmMkctPyzNdQmykD4zzIYB9Z0/cn97dUkL7bLRNKrXAmSlm1H5LOU9
 dGPQZxZX4yLQJiFtCGvT0Y2ffLXL0CXm8Ze5AohuuroPmwHelL47cC9A5YX1Z2vWL9QaQa6M6xM
 P25cm+AYh6r0kE9msrKqCt5tNwWSHEUPqb3c/ojGQ+nt3e33KE2A9a98DRBCUTEgqb5orOZZy+r
 nUXuorp+5+Eu5WE5fIMk8+DWdxo/oif/T6vaUmnEc5Yy4Qgpjwq+rKyHQHRPJG8AwLi9KBGKcBE
 XUXMsZ0djSWZm7ZeegSkeTobFlj9h6Yj6ERZQgzVbA8Fsw3Nd7URX11QcO1nfIms2w6qdd8kOw=
 =
X-Google-Smtp-Source: AGHT+IEmZq7EmvWiYmlEHOv6ulsRLrFfVbnN+gN6GVBc96hwKOkN1xpjR8St45L1drCZHHDFEjh/6w==
X-Received: by 2002:a5d:47c5:0:b0:3a0:8acc:1df4 with SMTP id
 ffacd0b85a97d-3a094044aa7mr1306480f8f.7.1746087124562; 
 Thu, 01 May 2025 01:12:04 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a095a4c1basm187938f8f.59.2025.05.01.01.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 01:12:04 -0700 (PDT)
Date: Thu, 1 May 2025 10:12:02 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
Message-ID: <aBMs0ubSip7MAtMQ@toolbox>
References: <20250424105432.255309-1-j-choudhary@ti.com>
 <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
 <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 02:15:12PM -0700, Doug Anderson wrote:
Hello Jayesh,

> Hi,
> 
> On Thu, Apr 24, 2025 at 6:32 PM Kumar, Udit <u-kumar1@ti.com> wrote:
> >
> > Hello Jayesh,
> >
> > On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> > > For TI SoC J784S4, the display pipeline looks like:
> > > TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> > > This requires HPD to detect connection form the connector.
> > > By default, the HPD is disabled for eDP. So enable it conditionally
> > > based on a new flag 'keep-hpd' as mentioned in the comments in the
> > > driver.
> > >
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > > ---
> > >
> > > Hello All,
> > >
> > > Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
> > >
> > > Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> > > some comments on this approach to "NOT DISABLE" hpd in the bridge.
> > > As the driver considers the eDP case, it disables hpd by default.
> > > So I have added another property in the binding for keeping hpd
> > > functionality (the name used is still debatable) and used it in
> > > the driver.
> > >
> > > Is this approach okay?
> > > Also should this have a "Fixes" tag?
> >
> > >
> > >   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
> > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
> > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index c93878b6d718..5948be612849 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -34,6 +34,12 @@ properties:
> > >         Set if the HPD line on the bridge isn't hooked up to anything or is
> > >         otherwise unusable.
> > >
> > > +  keep-hpd:
> > > +    type: boolean
> > > +    description:
> > > +      HPD is disabled in the bridge by default. Set it if HPD line makes
> > > +      sense and is used.
> > > +
> >
> > Here are my suggestions
> >
> > 1) use interrupt in binding as optional instead of keep-hpd
> >
> > 2) use interrupt field (if present to enable of disable HPD functions in
> > driver)
> 
> Officially we've already got a "no-hpd" specified in the device tree.
> You're supposed to be specifying this if HPD isn't hooked up. It would
> be best if we could use that property if possible. If we think that
> using the lack of "no-hpd" will break someone then we should be
> explicit about that.
> 
> I'd also note that unless you've figured out a way to turn off the
> awful debouncing that ti-sn65dsi86 does on HPD that using HPD (at
> least for initial panel power on) only really makes sense for when
> we're using ti-sn65dsi86 in "DP" mode. For initial eDP panel poweron
> it was almost always faster to just wait the maximum delay of the
> panel than to wait for ti-sn65dsi86 to finally report that HPD was
> asserted.
> 
> I could also note that it's possible to use the ti-sn65dsi86's "HPD"
> detection even if the interrupt isn't hooked up, so I don't totally
> agree with Udit's suggestion.
> 
> I guess the summary of my thoughts then: If you want to enable HPD for
> eDP, please explain why in the commit message. Are you using this to
> detect "panel interrupt"? Somehow using it for PSR? Using it during
> panel power on? If using it for panel power on, have you confirmed
> that this has a benefit compared to using the panel's maximum delay?
> 
> -Doug

I'm working on a similar issue where the bridge is used to provide a
connector to a display port monitor and hot pluging would be needed.

Related, but not the issue here: We have two display outputs and the
reported connected display without an actual monitor to report a
video mode then confuses the system to also not use the second display.

As I already have a solution which fixes my issue, hopefully not
affecting the eDP use case a proposed that here:

https://lore.kernel.org/all/20250501074805.3069311-1-max.oss.09@gmail.com/

Regards,
Max
