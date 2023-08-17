Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D692377FF67
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 22:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A566210E090;
	Thu, 17 Aug 2023 20:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3521310E090
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 20:59:19 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-51f64817809so40764a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692305958; x=1692910758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Bw7QlxoxGVRnYreIiU6VXUliqehbFENeqT/KzAZ24Q=;
 b=ZOjMStG8k4y+1lUKtclfzBKQCWA6smeEu8j6VLTdEeUYEh3YQuKvfAX18ITqOSxW/p
 bF8mYiGpjsRfku5J4keO3HVt3lxNUYH6rWMPngE7b6eonhiHo8n9MUWbOSfsUWHQD2kp
 6Z6qlFEMzfJCy9pzWBHCA0aV+0A7kXLsQ3iofVbumc+t8iU73QdWz6nlMRj+6GZoExeb
 cn3Ip1maxazHjdCpdfz4zpoIRfxosC9aKNMuPal7Fl41iuKLj9cQggHPXtJawENRgJQE
 stzLh6oVO8bjPoT65Iw2mjBl+aqZxhWITf3cY8RORV0kHLof9Vok78be5UkedrU+vjjI
 lQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305958; x=1692910758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Bw7QlxoxGVRnYreIiU6VXUliqehbFENeqT/KzAZ24Q=;
 b=BiFrExYm5BHX0Uoi5hMsE359D4JnfDcJEIdJWUcQ/6YBxwwIYxK1ZNAyqdikQcJ2VC
 gGOKF4rm3eMcAM5Ju7TWk3BQghtk3x+zeQRWWN+ZAt6loZ1Al9nKgqnvnBDE9yiK3Efh
 lkQGS4xgpgPQm8uX0rv7RLpOUGsr4O+j2ZRQlKAOXWkuBIZLNwNXHShSgrN0fjAHMJ65
 T2Iug/xXZjpPF+NX0ZCl7sH2+Y5NCD23DLHFLEHC7N2K5znGxw4lo1HtCe8fCAe0AlEQ
 bfdAkBblPS8APn8UIjfeoQPgbJVC6MIaPNtK0eAd82t4RpM02UWIdtzU1Atzzl7+U8/X
 r6yA==
X-Gm-Message-State: AOJu0Yw6giAqyDQraUP9ti0hQ9CnruEjyFHsDxuES7V8btBdVtbdzOyG
 tNDiUdot7jvjfHYAKO+eZw7fZD7Qww1tVBM1GjQ=
X-Google-Smtp-Source: AGHT+IGAfktZdkEG0Wkw0BsEMMrCbym4+evYp65NA60yeZ+eypqzVnSeVeoxCjK0Wn3r72QXBzsGNcDuvUg37LtxTNA=
X-Received: by 2002:a05:6a21:999f:b0:145:3bd9:1377 with SMTP id
 ve31-20020a056a21999f00b001453bd91377mr790079pzb.5.1692305958381; Thu, 17 Aug
 2023 13:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230724151640.555490-1-frieder@fris.de>
 <CAJ+vNU27A15eLWtFfHCOVn8JgawcgoGUAv2PhKmEf3wcoerPXg@mail.gmail.com>
In-Reply-To: <CAJ+vNU27A15eLWtFfHCOVn8JgawcgoGUAv2PhKmEf3wcoerPXg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Aug 2023 17:59:05 -0300
Message-ID: <CAOMZO5At6U9_JinNnumCqLMi2ER=3RZXDtsfdAEyjS35SvBaKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix init during host
 transfer
To: Tim Harvey <tharvey@gateworks.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Frieder Schrempf <frieder@fris.de>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tim,

On Thu, Aug 17, 2023 at 5:53=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> =
wrote:

> Frieder,
>
> Sorry for the delay. Yes this resolves the regression I ran into. I
> tested it on top of v6.5-rc6 on a gw72xx-0x with a DFROBOT DRF0678 7in
> 800x480 (Raspberry Pi) display which has the Toshiba TC358762
> compatible DSI to DBI bridge.
>
> Let's please get this into v6.5 as soon as possible.

Care to provide your Tested-by tag?
