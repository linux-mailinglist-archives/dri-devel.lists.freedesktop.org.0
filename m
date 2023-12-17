Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FC6815D0C
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4234A10E114;
	Sun, 17 Dec 2023 01:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D44710E114
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:39:29 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3363aa2bbfbso1777027f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702777108; x=1703381908;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=KZvP4fL3Nz75ZyOFfSnsYpgH0MiazCjRnOKU1EHMPm8=;
 b=iyjJ7D1P+qgYAi9KK1hLfQdUGxcQbqI8/j1KQCD0tgMubGNgoyAER/JkiDA9QmK0CK
 c9Cdo5duzyzJ/U4AJDrF+tN+48jr9k+J5KjlhmjWe0AF0ja8FiPcRnBn5ZC5dY/2ntSy
 +v8L+eAniLjuCsOrpXSI8SEWhVe92LxBpH6qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702777108; x=1703381908;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZvP4fL3Nz75ZyOFfSnsYpgH0MiazCjRnOKU1EHMPm8=;
 b=CAfx9th03wVJonvz3stiKbC8tpEbXcZiBAqtmjpX/NW4uXGHIudmhlNBXBUuBEaizv
 Mgce0ri81DV6dnf/o6gN39++Prh2aMfJbx9Dh3r163/wNSEiVoQ5Mw25/gB66jR2i56P
 Z3FU2JOxu7tzeq0QRCWej2vKQ3Vg5MV6HYVXLbnJL/A+FL0/FonuYygpKSA0UQDqn4VY
 hy6kiv/tyOWdpMtpkJMXVcSLJLPPXZMTm778gnYtFgwIod5xl2c8judMcoQAyfTluhyY
 Q2k1VPrbZ2ItjTC97cIoMPNzOznfeF/d0Gmz5fywn7LYTGABeMO0lxh8hbNfQvPftu0+
 1Jtg==
X-Gm-Message-State: AOJu0YyVd93aEcF5dTHaLpet17Gpg9T4hFtPT+EpS5epbw83T3IQ20Vw
 EyaU1c9DlN/TSwRm/N64IIzFVodWokmgz8J0izFyAGpurAJCsnWd
X-Google-Smtp-Source: AGHT+IEtsTVdo91RRo/T0ysvJXNkeuxkKFctEkemIJaU/LFJ344lorZ2hh3+CSEcbgLa2Zg87ZJvzN4cpfivGY6x0e4=
X-Received: by 2002:a05:651c:2002:b0:2cc:30dd:1b59 with SMTP id
 s2-20020a05651c200200b002cc30dd1b59mr3443489ljo.84.1702775297334; Sat, 16 Dec
 2023 17:08:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Dec 2023 01:08:17 +0000
MIME-Version: 1.0
In-Reply-To: <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
 <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sun, 17 Dec 2023 01:08:16 +0000
Message-ID: <CAE-0n52nK6fs_K8s1pfwGw0K_6HCzAMPfjNruxkVmWZfbEUTDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Never store more than
 msg->size bytes in AUX xfer
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-12-14 12:37:52)
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
> Fixes: 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux failures")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
