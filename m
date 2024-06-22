Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABD69133DD
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 14:19:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E5210E029;
	Sat, 22 Jun 2024 12:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XVYQxh0E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5AA10E035
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 12:19:05 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so32573071fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719058743; x=1719663543; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFTJWPHoWIzzZYySQj01J40y/z9s/zNsE0TqSi/ZOOw=;
 b=XVYQxh0Efvo3VyUaHL2r4tVR9GN3NOiC93JNUBoUG1IRA007AMwtm5dncQEObJMWAA
 DBRWSxQDnD/+13bhPH7lTUlD06ZD2KHW6gRuArc+hmNq3jSZ9klf3amOUCJ5oqgpmam+
 jVrhQOHdX1A9mE4nUyW4CMd0LKlEflZdjQy2FwWF5MwOwlqYrXx+X7dM0N/3u869vbIR
 7HC5hbDEfUeYUF/2N2iR1HF9TwFn+YShw7Lj9AE05KlzkFyIrHwejOx8zx2UCLj1PUxQ
 wFZLAm1eoD0kV+swRl7Epk1lJfTgJI4tFrWQxQPI2ctOqA/MFb/FPtNqMO0vTrf1zliq
 CYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719058743; x=1719663543;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFTJWPHoWIzzZYySQj01J40y/z9s/zNsE0TqSi/ZOOw=;
 b=bh8SxQfv3zNRP6NNqI/xr32qcJWTvEPxHpG0KLfI2dYynWI8yctU8zfkzBBj3adNhd
 nhnTRWyLJmIC6J0JlHh4uDlFDkJSp4GblNMzQDeOWQgNqtfL/3ZGO4teVhcqDbBjDVWu
 fzteX7MfVYSljrkin18KJspNE6ZDbto6cmcQBtl5jmqesZr5uBgQqAURUjjnKVajwzgD
 vmks8mRh11HAJuThv1qsb2z/G7ZSsl+lM7K5MFOWWwdptLwsbCTh/sgXhxWmHfkUwBmh
 02+SY/iknBoqz96IvFuPlnlVJ+sBBkoQozbLaV9b1IrJUG+ig/dzAlhuDwnMoc1V4D9Q
 3zIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1YxkYKqpN8k60uhGshyykgizex2eZHJlXSLAdql6PlAKKQglBmfegJE5hohP055VN22wJUYNWJpCmxPC4neCJ0ThxhWvhs7jw6IgrKiil
X-Gm-Message-State: AOJu0YzSAWkrYLLR+Q7fpxKJjEYbSSQsVk3VJ1Bf1CYPp8qCuk+F1crV
 LyRivnzqOKB5xp17WWYaueJrfUY8EvXJ09oswxwEFPIc1s7yL18IMAwpkaVWvqE=
X-Google-Smtp-Source: AGHT+IHZ/lhd6X/rx/n+EobIKJogWOuMNlLQQQqYQAVR2+BTc252BAZ4shFesdOp1i9t2/g4du319A==
X-Received: by 2002:a2e:9dc1:0:b0:2ec:4d48:75ec with SMTP id
 38308e7fff4ca-2ec4d487811mr24681611fa.22.1719058743543; 
 Sat, 22 Jun 2024 05:19:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d76e950sm4266561fa.107.2024.06.22.05.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 05:19:03 -0700 (PDT)
Date: Sat, 22 Jun 2024 15:19:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Marek Vasut <marex@denx.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-ID: <bebvl4vycvpkdqjlz3xi33t7qtb4oj7mriywxmahfemyee3uxk@m3nbraynomg2>
References: <20231108-tc358767-v2-0-25c5f70a2159@ideasonboard.com>
 <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <2f3bb86b-6f8c-4807-985e-344a0c47864c@siemens.com>
 <3277848.aeNJFYEL58@steina-w>
 <b2052bc9-b2da-489b-9e5b-3c9b4f6c1c99@ideasonboard.com>
 <bc96c6b5-a7f8-4ef3-a89b-bf577943f11c@denx.de>
 <36ef53b6-57a3-42e4-95ef-a10eef4ca1c9@siemens.com>
 <o4bwopeuyxm6344oqqm3e7p3xcx76aw2trsiuhhfyhel2e7po7@sz2jaj6i7kqd>
 <71e809fa-b471-4bb3-8f7d-e497397c0de4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71e809fa-b471-4bb3-8f7d-e497397c0de4@ti.com>
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

On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
> 
> 
> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
> >> On 16.02.24 15:57, Marek Vasut wrote:
> >>> On 2/16/24 10:10, Tomi Valkeinen wrote:
> >>>> Ok. Does anyone have a worry that these patches make the situation
> >>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
> >>>> are not set up early enough by the DSI host, the driver would break
> >>>> with and without these patches.
> >>>>
> >>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
> >>>> I'd like to merge these unless these cause a regression with the DSI
> >>>> case.
> >>>
> >>> 1/2 looks good to me, go ahead and apply .
> 
> Isn't there any way for the second patch to move forward as well though?
> The bridge device (under DPI to (e)DP mode) cannot really work without
> it, and the patches have been pending idle for a long time. =)
> 
> >>
> >> My local patches still apply on top of 6.10-rc4, so I don't think this
> >> ever happened. What's still holding up this long-pending fix (at least
> >> for our devices)?
> > 
> > Neither of the patches contains Fixes tags. If the first patch fixes an
> > issue in previous kernels, please consider following the stable process.
> > 
> > If we are unsure about the second patch, please send the first patch
> > separately, adding proper tags.
> > 
> 
> Thanks Dmitry! I can send the patches again with the required fixes
> tags (or just patch-1 if we cannot do anything about patch-2).

The problem with the second patch is that it get mixed reviews. I can
ack the first patch, but for the second one I'd need a confirmation from
somebody else. I'll go on and apply the first patch later today.

-- 
With best wishes
Dmitry
