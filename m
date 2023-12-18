Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3D8179D3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21E10E3A3;
	Mon, 18 Dec 2023 18:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FB610E290
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:39:07 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a2330a92ae6so253446766b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702924745; x=1703529545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6y3ll1JV4kECb7ETSXvUzgYXA9pzoacjYnpy2l56Ho=;
 b=NvOiRQPD25DAe19S6O4HSfBWl3xAaqXXSzUOPOX6DGuG6JyqIxbL+VmyZxFe+AvjN3
 DMzetGzOestyMDFQ8kDCA9hj1Z6NmPOdfNtjAOMVn7iZuXTaqpsYsVv1ol7H7sd42hFZ
 5iTIOBS9o0CPCmmFoSWAOXYZlUGv03GEWH+lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924745; x=1703529545;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6y3ll1JV4kECb7ETSXvUzgYXA9pzoacjYnpy2l56Ho=;
 b=sck8cOvwgqo+HRhz6v7cB/K+IkcCzcAMQXnl88EQdVDE8U+ZjROyyTSy2J+jrYRWPd
 LeLsCAlDb0zrqIoHS/LnpE7dr+Cv7lcW3mvCdTlu405uKiHzngqi0+cCIdsHnSEubpDn
 eBsNtl7VdUapgTO1egD/HUHSsfTYdU1TmNl4HCSeHTm/i5VuHVsORtpOt+y5hVuVMcKC
 qGIBU0FrcbP0HlZyVlSGj3xA0hF7tYEVqOmOw+AZfvTTdaI2uu8nRk8RO4uUTS4g/j8b
 197E8B3rNijFBg/R4x+EmJXEIYEUEtMvMvVW+QV+cYDRjy2ApIwbTDf5DC7bRsHGDwd2
 enYg==
X-Gm-Message-State: AOJu0Yw4fHmL9+GudyG4H4IefmBVAXhQ4eQxwA/g+VT2EIRomgeqZs69
 GZMXoSH0RTzbR6b8cxehnZblMd51uRd43HXBt64ANDuA
X-Google-Smtp-Source: AGHT+IF9J+G888MqNPB5/jROGCHxwoh87R40Y+NF5LW4G2GXIS8OKn9tp3dUCkqxIOn4Up/TiEjHpQ==
X-Received: by 2002:a17:906:b246:b0:a23:6715:7372 with SMTP id
 ce6-20020a170906b24600b00a2367157372mr569894ejb.112.1702918093644; 
 Mon, 18 Dec 2023 08:48:13 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 vs4-20020a170907a58400b00a22fb8901c4sm7597738ejc.12.2023.12.18.08.48.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:48:13 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40c3963f9fcso92495e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:48:12 -0800 (PST)
X-Received: by 2002:a05:600c:1ca7:b0:40c:6557:733d with SMTP id
 k39-20020a05600c1ca700b0040c6557733dmr366346wms.0.1702918092382; Mon, 18 Dec
 2023 08:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
 <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
In-Reply-To: <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 08:48:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U8eJ3J_zY2uaCYGcEjuxkNeTUd1ir33r1f0Xdk+nD3sQ@mail.gmail.com>
Message-ID: <CAD=FV=U8eJ3J_zY2uaCYGcEjuxkNeTUd1ir33r1f0Xdk+nD3sQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Never store more than
 msg->size bytes in AUX xfer
To: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 14, 2023 at 12:38=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> For aux reads, the value `msg->size` indicates the size of the buffer
> provided by `msg->buffer`. We should never in any circumstances write
> more bytes to the buffer since it may overflow the buffer.
>
> In the ti-sn65dsi86 driver there is one code path that reads the
> transfer length from hardware. Even though it's never been seen to be
> a problem, we should make extra sure that the hardware isn't
> increasing the length since doing so would cause us to overrun the
> buffer.
>
> Fixes: 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux failu=
res")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Updated patch subject to match ps8640 patch.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Since the patch fixes a potential crash, has two Reviews (even if
they're both from @chromium), and doesn't seem controversial, I didn't
want a full week and just landed it in drm-misc-fixes. If anyone is
upset by this then please shout and we can revert or I can post a
followup patch.

Pushed to drm-misc-fixes:

aca58eac52b8 drm/bridge: ti-sn65dsi86: Never store more than msg->size
bytes in AUX xfer
