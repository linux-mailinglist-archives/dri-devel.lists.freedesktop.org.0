Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6092ABAA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 00:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CCB10E426;
	Mon,  8 Jul 2024 22:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NON4pl3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D6C10E426
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 22:02:28 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ee7a1ad286so46441201fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 15:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720476146; x=1721080946;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OVXbp42/iCfjHuXvJmECuOHqicvfCZWVVW3q5Irl3s=;
 b=NON4pl3nHl57MfSx08qVYHYfdi/QFPanG6Nq1EZSEHL40cxmNiSLgOimDzREj3b4Jk
 lc72laAWlD2En8jD0m6cY3Wl9cZedSm4vUa6KLYh9DLOLR/WgEDDtDyn3pEmwCVmwDb8
 7zTG80+2b5dr8VAhCfhzGqJvHEsbmJxPd1DXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720476146; x=1721080946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OVXbp42/iCfjHuXvJmECuOHqicvfCZWVVW3q5Irl3s=;
 b=jxoRNr1NzL7Ytze8DiZs2m0pCG+/HM7G48DTm2sGpznayAXzuaC08v/OCwSBGUK5M8
 KGSnARTWYLu9fj9grRjKd/SvuntK/D+/5a4JFJD0CgBBUNg/UNvKBoyCBfZQsR5Td3vT
 FkFkVLzPV7ttF8mwKKkAPTlu9lJlOaswlNhCm95y7ktJQOR1tNLRByT/MrDoV3oa0Q94
 17Ms9Dm0i/fbubySEupNxAOS1aeYJV4K/cu1HWoADMFoyRmP16qhOAhsPrTouk+1fXwi
 CRtp3qFH0lzpfDVuwKJy2kHMoWEPDVniYf+l8sizqaswWuL8y+ZHdvjo1ZTuZQekBdvq
 OvQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl0Ke6pt+w+viubQ8KYz3R0Lzx7BcQzp0TECv0tzQ+imBGXH10LBVz91Y2Jdk5G/GQG9VaaaedgbCTvZziP8uvGvlxLSRzkUSg7q/toWCf
X-Gm-Message-State: AOJu0YyzCuvs20m1FEUW7kw4Tur+Eum7kixT+3monIK5Yw7yQb6hPCFv
 H4qAgXffHhHB3L6/rNFKp2h9bbY9bsJOCZIDlFd6Rlo9F4i3KMcANCbb9LBiNrSFQn9UmYx/ab/
 ztA==
X-Google-Smtp-Source: AGHT+IHhWfqlr68mQURY+NQjEvQceFyOfOzSkx5NSfr/pmL0ifv6OTvQHpAUUlCABE4xUmIaPngt5A==
X-Received: by 2002:a2e:9048:0:b0:2ee:6254:f9f1 with SMTP id
 38308e7fff4ca-2eeb30b8afdmr6090171fa.6.1720476146153; 
 Mon, 08 Jul 2024 15:02:26 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bc7c9e78sm289487a12.57.2024.07.08.15.02.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 15:02:25 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4266f796e67so9645e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 15:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUh8aOGDO9xNBxaeJKkY7/OHlyORCL+rMEz5024Nx7Ts5wrai9K8UdZC85or3X5Z2dDWjc3exo8QfgSMie9zxkSeWO9igoIcVtMofaSEkgv
X-Received: by 2002:a1c:771a:0:b0:426:6837:4cf8 with SMTP id
 5b1f17b1804b1-42671c0a512mr657505e9.6.1720476145006; Mon, 08 Jul 2024
 15:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240704045017.2781991-1-yangcong5@huaqin.corp-partner.google.com>
 <20240704045017.2781991-4-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdaj2quvNdD_UDzyYPK9LyBndDHr0GNb_y8CBFAWakSU+A@mail.gmail.com>
In-Reply-To: <CACRpkdaj2quvNdD_UDzyYPK9LyBndDHr0GNb_y8CBFAWakSU+A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jul 2024 15:02:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VssfZBxwh6i4e_mHhT8vZ_CnXCrUhoeTUeo5xN-FmASg@mail.gmail.com>
Message-ID: <CAD=FV=VssfZBxwh6i4e_mHhT8vZ_CnXCrUhoeTUeo5xN-FmASg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: jd9365da: Break some CMDS into helper
 functions
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org, 
 neil.armstrong@linaro.org, daniel@ffwll.ch, swboyd@chromium.org, 
 airlied@gmail.com, dmitry.baryshkov@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 4, 2024 at 1:03=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Jul 4, 2024 at 6:50=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > These panels have some common cmds (e0h~e3h,80h), let's break
> > them into helper functions.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>
> This is a good start! :)
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> If you get time one of these days, see if you can add some defines for
> the other vendor DCS commands as well, but no hurry with that,
> let's merge this series first.

I agree with Linus. It would be great to take this further, but this
is a good start and I'm OK with it merging.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'd tend to assume that Neil will merge this series with the various
Acks/Reviews. If I see it hasn't been merged after a while or Neil
says he's busy then I'm happy to land it.

-Doug
