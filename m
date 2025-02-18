Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4841A39485
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4151010E62A;
	Tue, 18 Feb 2025 08:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RsLnlksF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9379B10E627
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:10:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDBEE5C5BAC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC25CC4CEF0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739866211;
 bh=lm4izQPUPAxU1EFbWA1X1QGgm3ceV+i3LzDKWszTFuo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RsLnlksF3ghInRjfQUK2RbEcqA4utlAXSkdEuDOes0UY6OEHubhGH9LV9w0k9HI8g
 w1J2zhebwtjsjUt4moRwPvipUmD9TWYTLhxBahQaztXJpd/ttcbtVYAUf6oXMGBc8f
 /BoLRhvbRBbtDq8W1mIuSvv++WQD/pQhNElF9lqTSyXApYZ9WSvSP289j7maCKfmfg
 nyA9L/dTpKS9Sgn2IZPKsMeWXVklaBgV97Io+6bXR5YI7sC8yVFIHhQZEBoeYscq3L
 3XlFCrk87mclPoiw8aFg9O78aCThHrsEw6GrIPNEMT3as1PHG160dthI0sNwkm6ef4
 xaR1Aeas7lbdQ==
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e5dcc3b0c77so2350283276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 00:10:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX62Eff41//44y3W81OxBDbbWYLzfDphfA7Qjbml36A2qLbSn3H5AodyLOrVSeKfylBuSW6bHHm+2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwehXqFXjKp/Ibu+C9EwKBFrfGyGhIwI6NfzxKEQbLsjrIEfbN+
 R8QNAdUtuU5oFDv6yDVpzenMvkMQ6Ia+JFxQRto5//8zQSCaIQ/TjFY8keJ+IfyyYWGrw9lenY/
 vvRbfb+lUo9b/In9w2qtsb9+BEn1dnQ75Cco1Aw==
X-Google-Smtp-Source: AGHT+IECc7JXf4PulZUAuqjkIE4N91vsuo67KP4yMuA2IEZ6yNrlZtVPBQlMqGyALdhW2ompVxgJOZSBbCCzz20fC7A=
X-Received: by 2002:a05:6902:2ec1:b0:e5d:d4e3:ad8 with SMTP id
 3f1490d57ef6-e5dd4e31aa6mr7029201276.28.1739866210764; Tue, 18 Feb 2025
 00:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20250217174936.758420-2-u.kleine-koenig@baylibre.com>
 <519b82d4-7904-4320-93e4-efda799b545c@bootlin.com>
In-Reply-To: <519b82d4-7904-4320-93e4-efda799b545c@bootlin.com>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 18 Feb 2025 09:09:54 +0100
X-Gmail-Original-Message-ID: <CAN6tsi5MNzK5piULQN4x7r2np8fF2RaPxpksPszP-GBTW+4b_w@mail.gmail.com>
X-Gm-Features: AWEUYZlCU8GZZu1AIfPxJ-K_nmRqCoXWLxYkqwQTskKMCDCFCP1jOIC3mj0uPHo
Message-ID: <CAN6tsi5MNzK5piULQN4x7r2np8fF2RaPxpksPszP-GBTW+4b_w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Check for CONFIG_PWM using
 IS_REACHABLE()
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org
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

On Mon, Feb 17, 2025 at 6:55=E2=80=AFPM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 17/02/2025 =C3=A0 18:49, Uwe Kleine-K=C3=B6nig a =C3=A9crit :
> > Currently CONFIG_PWM is a bool but I intend to change it to tristate. I=
f
> > CONFIG_PWM=3Dm in the configuration, the cpp symbol CONFIG_PWM isn't
> > defined and so the PWM code paths in the ti-sn65dsi86 driver are not
> > used.
> >
> > The correct way to check for CONFIG_PWM is using IS_REACHABLE which doe=
s
> > the right thing for all cases
> > CONFIG_DRM_TI_SN65DSI86 =E2=88=88 { y, m } x CONFIG_PWM =E2=88=88 { y, =
m, n }.
> >
> > There is no change until CONFIG_PWM actually becomes tristate.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Robert Foss <rfoss@kernel.org>
