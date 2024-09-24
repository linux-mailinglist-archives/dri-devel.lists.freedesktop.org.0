Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08FF984A70
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 19:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CB210E733;
	Tue, 24 Sep 2024 17:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OvznXLBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E8810E733
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 17:48:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-535694d67eeso132239e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727200136; x=1727804936;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6+1tMSPXdX+e7aqvVNDBI/94dfcqthc8RiI5QbNKDU=;
 b=OvznXLBCH5wGv8AuKA8sp7ZUpSjNNZGFJFY6GskY8GbAipdCr7+ZJa6V8zNTKe1Ctp
 KW9uAgn1/rTva+njrTUTE09Ry7QEqLAb1yIuafhJo7RoYXmxcE4boRn2sqfJIAmsjI4+
 KA52EzW2/prL6hKjcO1slyl+T3NJpRbkJt94I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727200136; x=1727804936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6+1tMSPXdX+e7aqvVNDBI/94dfcqthc8RiI5QbNKDU=;
 b=TV4WfotrEvCPdwrha1rDPv8NUK0jYj7CKxsiyTYdNId73t5u0Ta3FqKWyTk+Usr6M2
 e0QnwHOkbvOykuPb8PC/CV95plmd8Arf+jKvSFxn+gvKI/PDpdrtXA9H5w8Hu0zWYXBM
 t2230zus4NbTNQN+C1CBpRCgwt7ES03CbcTkIRz4tKGK46/PacEGidM8XzNrYBlPi95H
 ciSk9cYXDiBNydUFfkXraM3c+HMS4GGcZQY/KK0Qpskg7RCwlLStLA5yCzyjHimwjgE6
 /WXIcF35Pi8SWnKsccCORzWsZA1Q1YkaqsCja+5TE8eyGgM8DXleVlZ+zR6YXLvSYdBy
 q2PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBU1+igK6eZjgxCOvdfBewNVXSC4Qi4srB1aKl+tWBOW15dFFHZ1i4J8swGgnSV/CSPUD4n6L8qHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAcb0Z103JBJJxY1Biq0DM/FizQgKeBv8e+knlFuXdJh+Kd6jb
 UCH+5Q9BVj7M0XwL+Y0MHpcbYjL0PiUyxueJZ/3/1mHBzLC7Kp6OP0GeNxMor1oNVVtNMe+UywC
 WFTZD
X-Google-Smtp-Source: AGHT+IFB1AXi5vmMBMzHUv3oykv5Z+R7WyGHNihjEIGX/VJIXwz04O3rJQ70ctP/Xr7HPttbmrRAyw==
X-Received: by 2002:a05:6512:e89:b0:537:a82c:42ec with SMTP id
 2adb3069b0e04-538511734cemr7243e87.4.1727200135665; 
 Tue, 24 Sep 2024 10:48:55 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a8648b6fsm289753e87.208.2024.09.24.10.48.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 10:48:55 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f6580c2bbfso875091fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 10:48:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXjFk6muQAW1d9lAL/qemMXwNJzbwkr3EWKtX1izt+ctEBPxxvwZQUEMN78KJnkVjTHcgkFG2w8U/0=@lists.freedesktop.org
X-Received: by 2002:a2e:bc15:0:b0:2f2:b5c6:ccca with SMTP id
 38308e7fff4ca-2f8d0bc22d9mr14867861fa.14.1727200133930; Tue, 24 Sep 2024
 10:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240924035231.1163670-1-treapking@chromium.org>
 <20240924035231.1163670-3-treapking@chromium.org>
In-Reply-To: <20240924035231.1163670-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Sep 2024 10:48:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2V+LQ1XOo_eJ1Vv3Pn+E309kvyY9FOzaZP_j8ToXM2g@mail.gmail.com>
Message-ID: <CAD=FV=X2V+LQ1XOo_eJ1Vv3Pn+E309kvyY9FOzaZP_j8ToXM2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: it6505: Drop EDID cache on bridge power
 off
To: Pin-yen Lin <treapking@chromium.org>
Cc: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Mon, Sep 23, 2024 at 8:53=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The bridge might miss the display change events when it's powered off.
> This happens when a user changes the external monitor when the system
> is suspended and the embedded controller doesn't not wake AP up.
>
> It's also observed that one DP-to-HDMI bridge doesn't work correctly
> when there is no EDID read after it is powered on.
>
> Drop the cache to force an EDID read after system resume to fix this.
>
> Fixes: 11feaef69d0c ("drm/bridge: it6505: Add caching for EDID")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Ah, I guess this answers my question in the previous patch about
whether caching was important even for external displays since this
driver only supports external DP and the commit you mention in "Fixes"
says that caching was important.

So this looks reasonable. One thing I wonder is if you're totally
guaranteed to get a PM Runtime suspend whenever you get an unplug /
replug of a display. I tried to dig a little bit but I'm not super
familiar with this bridge and it looks complicated enough that I guess
I'll have to trust that it's fine. So...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
