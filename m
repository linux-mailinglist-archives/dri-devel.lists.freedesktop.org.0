Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CB7F86F0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D46810E37E;
	Fri, 24 Nov 2023 23:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874910E37E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:48:46 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5ce4b3f12e5so7587427b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700869725; x=1701474525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/830YKnDcxSt/CJDe7WkW9RteXiYPTW2q0xMnOOWww8=;
 b=HKgrVBjSAJB3m1ms6BNUn9M837FCLyOmGvq/eNQ4w13Agd/Mu1t3AWV2ssfkqxUMFm
 nszsRrT7NibNwcVLetex+t4p4/nhp5O8o/V+E3Qh4T6/11DPb796EtC2PMGLpGDhuDFQ
 f8zPvKiLWyAlMdo7F2zXQpqyOYWJRk7gS33KTw+8Nz0Bf+jEXxRuWNCIcMmQvj6LSUIz
 j3lYLuN/T2uq12pZaJf//T+4MRICFaCR8SPm4DhI1K6RLdjIGcD2I5MUHBRYm8tny54h
 BeY4lgetc17qPQv0e8f9gqcK570SnHrBCChypynzqfPdS9Ktt89t1eaBKES8l9Q+me/z
 PwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869725; x=1701474525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/830YKnDcxSt/CJDe7WkW9RteXiYPTW2q0xMnOOWww8=;
 b=s6Osy9vTAxVn96FlDQ4Ik/KeKosfgvFRUXWN7GRZ/+zOMuMZ5ldwOmEl85D5/piSXt
 3UW4DP7Ssm+d3rNGQaeCtQiNZTN6SachNF0+7Yb0GLINI5hsbcWZVQnVo/+J7nFZnHz6
 V32Tr9MFDfMnzQ/hlVGMUILjihJzPCjyHdyCuHipws24lo+b2ajgstGHR6aTpzs6KVE1
 omZDws/mHjp7+TaKRPOiHhenByq1Khgs3FLjxqm7YWC4nUE2VApdQ1o+B7KUDNa0/Hik
 bfBCns8882M5fIGRKjON6YJklaumWWrv/mJWo2uqP7ksNy2h3RB/W4aXAnlQK+5WOkmD
 9ZYw==
X-Gm-Message-State: AOJu0Yw5GGqccpLSG/Yr0yGtYkswg1yBBI8K+DMX9+cuXVdB3C9yVOaN
 KxsWjy3MVu8bHhqIJtYNfE5qHEHmKZbx5JqvPACuig==
X-Google-Smtp-Source: AGHT+IGQeg1xyWfs+38KV7TLHDR+ADT+EAresNrQwsRA+n70yeLTadHSkV2mxHH0FpPr27asVE6qoh7iQZPNnjqXt4U=
X-Received: by 2002:a05:690c:3485:b0:5ce:cd8:ee1 with SMTP id
 fo5-20020a05690c348500b005ce0cd80ee1mr3528023ywb.7.1700869725147; Fri, 24 Nov
 2023 15:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20231123032615.3760488-1-victor.liu@nxp.com>
In-Reply-To: <20231123032615.3760488-1-victor.liu@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Nov 2023 00:48:34 +0100
Message-ID: <CACRpkdZsqR0MUoLdmdk1-XW0zQDTf0g+-dp1hsSzQ2vXosKoXA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: panel: Check device dependency before
 managing device link
To: Liu Ying <victor.liu@nxp.com>
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, ulf.hansson@linaro.org,
 jernej.skrabec@gmail.com, rfoss@kernel.org, tzimmermann@suse.de,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 4:22=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> Some panel devices already depend on DRM device, like the panel in
> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts, because DRM device is
> the ancestor of those panel devices.  device_link_add() would fail by
> returning a NULL pointer for those panel devices because of the existing
> dependency.  So, check the dependency by calling device_is_dependent()
> before adding or deleting device link between panel device and DRM device
> so that the link is managed only for independent panel devices.
>
> Fixes: 887878014534 ("drm/bridge: panel: Fix device link for DRM_BRIDGE_A=
TTACH_NO_CONNECTOR")
> Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm de=
vice and panel device")
> Reported-by: Linus Walleij <linus.walleij@linaro.org>
> Closes: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+=
nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Patch applied to drm-misc-fixes.

Yours,
Linus Walleij
