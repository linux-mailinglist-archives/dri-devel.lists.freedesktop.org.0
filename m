Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5E496AC3F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 00:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B10410E0BD;
	Tue,  3 Sep 2024 22:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fF8gk6iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF48010E0BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 22:35:45 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7a966f0ac8aso178906885a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 15:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725402944; x=1726007744;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Np+Q0wHOCgirMFjVPl8Z6i7/K3O+RkvC3vKi9xQ+BOA=;
 b=fF8gk6iVSFCJ5WOUWaSpP3guh6KCbbJ1aaU0lg7rVpP04n2dgR2gCDjw1bTTFmrGGs
 vVogkRu8SbIDtRKFtbWiKwvSUgQvp3KkZk48LLauh6yBiZ8zjrLPtcOI3a3PVactKRdx
 zctKBZeymR94ukB4r08b5qO7XRK8lzn3BvTac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725402944; x=1726007744;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Np+Q0wHOCgirMFjVPl8Z6i7/K3O+RkvC3vKi9xQ+BOA=;
 b=RS5426UC8OAg91XLPiZAl40Hix9yvC1sHt2tvBgolUhgatcLQMPVM52QQVRSj0evrt
 X0FrlGZt88y8g27v0zXTs3O5LZhh/U4+fSCbakzXYbK3WXLg1QvrcvIINWtRGn5xuPMH
 pqnXEdu8hFmthIWL+K6FFLJvbO+kCqLHBZzXwZPsd06Mf6f0BQb9Tt8mb/UrA6aLQAw9
 GOyJBwZ0IKO20MreXvidqQMCK15AnTMgiRfL8FwQwnaHCJXGqNSPLPn+n4U8S//imreZ
 aeiPL5KqRS2aoDAWIBmdikeOfTIpamiFk248DANzCfYp+wGzT1QqfP49DU33fKkDfpMi
 KkcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeaeWWxZUVY8yw4jib9H95bLc0tlSehL3nJXTLtg6pWjdZ8eoH67MMgoQARR/pr+AVOIrgZTznyk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/TMiDhHMQkiv+EpWVsFHzoYg2ja2+F4h1h7r0I2MHYFFX7WlK
 r5cNWw5G7AXP6afjYdK83HDHaN3ErbtnZkX9iOUPTQNJ/nip0tgFTIR/xZgGA0HiQFyo+runiNo
 Tm0cwZtz5oCKlDyUDQiFop6NJNcjsgzsSWt4B
X-Google-Smtp-Source: AGHT+IHROkfnEqJwyKjhAgQRGsJgxkFB29+Yc6u1MFfoALprduJBtTl2Q7hk3LAUymLuEO32wO/aAKlH5269r5m9+pM=
X-Received: by 2002:a05:620a:28c8:b0:7a6:6fd6:9d6a with SMTP id
 af79cd13be357-7a8f6b767cemr1583962985a.5.1725402944498; Tue, 03 Sep 2024
 15:35:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 3 Sep 2024 15:35:44 -0700
MIME-Version: 1.0
In-Reply-To: <ZtWeuFUEgnF9e2S4@smile.fi.intel.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-11-swboyd@chromium.org>
 <ZtWeuFUEgnF9e2S4@smile.fi.intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 3 Sep 2024 15:35:44 -0700
Message-ID: <CAE-0n51nLCNJxhxMr3EmqoWz=3dLU-ckfSwgEUtrhBRZchLu_w@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] devcon property: Document devcon_match_fn_t
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
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

Quoting Andy Shevchenko (2024-09-02 04:17:12)
> On Sat, Aug 31, 2024 at 09:06:48PM -0700, Stephen Boyd wrote:
> > The usage of this match function is hard to understand at a glance.
> > Document the arguments and the return value so it is clear how to
> > implement the function.
>
> Thank you for the patch!
>
> ...
>
> I believe we still use "device property:" in the subject for this header file changes.
> $ git log --oneline --no-merges -- include/linux/property.h
>

Ok.

>
> > +/**
> > + * devcon_match_fn_t - device connection match function
> > + * @fwnode: Remote connection's device node
> > + * @con_id: Identifier for the connection
> > + * @data: Match function caller specific data
> > + *
> > + * Implement a callback with this function signature to search a fwnode's
> > + * connections for a match with a function like device_connection_find_match().
> > + * This function will be called possibly multiple times, once for each
> > + * connection. The match function should inspect the @fwnode to look for a
> > + * match. The @con_id and @data provided are the same as the @con_id and @data
> > + * arguments passed to the functions that take a devcon_match_fn_t argument.
>
> > + * Note: This function can be called multiple times.
>
> As noted in the next patch, this would be nice to elaborate (at least to me
> this sounds like declaration of idempotency which is unlikely what is
> meant, or am I mistaken?).

I based this on something that I've already forgotten! :)

It's saying that the function you implement shouldn't have side-effects
because it will be called many times. I actually wrote above that it
will be called "possibly multiple times, once for each connection". Let
me try to remove "multiple times".
