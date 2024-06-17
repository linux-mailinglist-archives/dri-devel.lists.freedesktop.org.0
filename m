Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653E90B08A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1271410E3D3;
	Mon, 17 Jun 2024 13:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="FPZZY70r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DD410E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:57:25 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4217ee64ac1so3810675e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718632644; x=1719237444; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+sfcU2gw12qDfkWYeoKb+aUUJsfQK52P8g/i+Fi8iug=;
 b=FPZZY70rwQGyb//s2HWwkVLJAntF2G4UlGDfOy7pKRMivgFKnZrByMYJWeq2tnjv0v
 +ICX1sTHQJ2C9i35kV8eRzWIXT0mEp/8owxTvlJErh55SIm0QIdl16i3Z22g9+9xxOTT
 lBoRuV2H39YDjsxj1ybiAPJr4tUkuQZ4iDvng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632644; x=1719237444;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sfcU2gw12qDfkWYeoKb+aUUJsfQK52P8g/i+Fi8iug=;
 b=eUQ+fL2rFtA1Y1SwXTNcDTzcDZHibIt4PvWS8BJgGwMATkv1oM7ddf/uecQg/KTTfb
 QavCBCwHSIVmNy6ALDmRllFfFD9Pb46+NcIxL66xUfRVMhBPwcgv5efzCZCB++r6ErOF
 QNIyZOgchcyC33de/K5Tz3DCbJaz4J+x2RPzgcRmiTitYtdytyqYEXf+5053y88uPt44
 nYI7j7kUfJwp72rO1iCy3WEHKNmsOAUNzUnEVhR4173H84f/onA3TF5M0wLoDUI+ra/4
 m2qmM38CJ5BJDCrj15y0wRASOZhzzwok2kZcT2013ygaqY9Z07iCWQmx3VUnNHra8KRu
 EZiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWCCeKCNf2EkGO/FtkpQtGfYPYV9dHGfQDZpDiujtb8KUepUGLTDjbPNoXnpGpmaZTn43fyqDRz8AaIPxR2Z50cQjFn4kBwYzcZtvJ9QrH
X-Gm-Message-State: AOJu0YyUg8HzDBS+0z3BIFdmnFZ6gerZQhT+VtC0lbzIakqwS1xRr9wB
 fSr4IWcx/lZWg/tAvJeyXKWh5N2lsg8OoI15VMgUgWFzQVtXrXyMCB/0SF3/JnY=
X-Google-Smtp-Source: AGHT+IEjyG2DD6w/7O/yI/YMTdYTAGNYaXex4xcy5IR7xFoS8nHgeRzyslci8uugnU/nFOUaKl5N7g==
X-Received: by 2002:a5d:584a:0:b0:35f:2a75:91fd with SMTP id
 ffacd0b85a97d-3607a785886mr6848932f8f.6.1718632643830; 
 Mon, 17 Jun 2024 06:57:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3607509c8cdsm11855468f8f.35.2024.06.17.06.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:57:23 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:57:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <ZnBAwbBFGZQJXBWx@phenom.ffwll.local>
References: <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
 <ZeBh3N4uttG53qhU@phenom.ffwll.local>
 <20240523-graceful-shellfish-of-development-db7bd8@houat>
 <ZmwG-RwxAIsUMOYn@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmwG-RwxAIsUMOYn@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 14, 2024 at 11:01:45AM +0200, Daniel Vetter wrote:
> On Thu, May 23, 2024 at 04:51:25PM +0200, Maxime Ripard wrote:
> > Hi,
> > 
> > Reviving this thread because I'm not sure what the outcome was.
> > 
> > On Thu, Feb 29, 2024 at 11:52:12AM GMT, Daniel Vetter wrote:
> > > > The only thing I'm saying is that this breaks the usual DRM requirements.
> > > > If, as a maintainer, you're fine with breaking the rules and have a good
> > > > motivation to do so, that's fine by me. Rules are meant to be broken from
> > > > time to time depending on the situation. But please don't pretend that
> > > > modetest/xrandr is valid user-space to pass the rules.
> > > 
> > > I think it bends it pretty badly, because people running native Xorg are
> > > slowly going away, and the modetest hack does not clear the bar for "is it
> > > a joke/test/demo hack" for me.
> > > 
> > > I think some weston (or whatever compositor you like) config file support
> > > to set a bunch of "really only way to configure is by hand" output
> > > properties would clear the bar here for me. Because that is a feature I
> > > already mentioned that xrandr _does_ have, and which modetest hackery very
> > > much does not.
> > 
> > The expectation (and general usage) for that property was that it was
> > set by the kernel command line and then was forgotten about. Old TVs
> > require one mode and that's it, so it doesn't make much sense to change
> > it while the system is live, you just want the default to work.
> >
> > So it's not really a matter of "the user-space code should be open"
> > here, there's no user-space code, and there will likely never be given
> > that it's mostly used to deal with decades-old systems at this point.
> 
> Yeah if this is being used just with the kernel cmdline, then I guess
> that's somewhat ok-ish. And TVs are horrible, so "massage your kernel
> cmdline" is comparitively not a horrible interface :-P
> 
> Anyway, I guess this makes this an ack.

To clarify, since people asked about this on irc and why it's not a
terrible precedence.

This is very much just for very, very dead old tech like analog TVs. If
people try this escape hatch for hdmi or dp screens, the answer will be
completely different :-)
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
