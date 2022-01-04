Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C848422F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5697F10E340;
	Tue,  4 Jan 2022 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D8410E27A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:15:35 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id i6so21044828pla.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=n9vUynbb8WtN3nKr5kWYjBzh+WgPXoa+P6IcyfUpAuTpSHbMUrXe0LIOxP+zdrMu68
 v91Oju61Sasm4GvcArbOIeqTyCee/MgcMHAEgqSVAMqXEjtBi3sv7nepJhZRcnxlLff5
 us3AjvOqLXNgB50BMvLBFzvwksiTlgzxt2obP7ws5Wry6L7Yarx6hUVpIubxUVCnuhWy
 qVUhaS4/gBUVPzyCwrf/5HISXpIBNnyyq2tpnsSieEjZoHboFhnvVYqCFQRSKnxu1FSc
 cRTTkgDAhnDVydoeIjTmHH4bRSURkapmLJEMX+/awUlNqBcL3TnvbKGvfTm8ljuB7UUM
 of9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqezZ2/HwBTxC4hfR4A8RkBTbm8B6r0iUtltdIvH/WQ=;
 b=rWxUQG9OJHZhqW/YxupxYydclUQdEs5OkYwTodPL3eobrN5Cla5nzoBFN4wHxNGUJL
 Nh+ZDv3Nt3fomiQmOmM/CiIsif/V0ebnKUPasJgXvAA93nLmTW9g1mY7JrwKS4l/TAqP
 pELIrDvP4J2F8Gj3TKAbrXjzgmvLmJQgsHcI5s0NEsN7i5oBlSF0jRLZoPGVGKGV6irc
 hqcjADLOQTieFUTv8VVpUzXZAxZTXNTh1aCfHgDv1Zg2JJomnkMNEbS2uYxSLyuHm8Kb
 8Le3sQrgX4YfrOBXmao73HW+ZEKNBWjjoyhJbPVSt7uRAULjxUmZCo+3KI3x6eG8ui7M
 0Mvg==
X-Gm-Message-State: AOAM531JHeCxlO0fuIPKgl3jORTjLYb6VplchECrQjCZHvxBo29PtD0p
 EzKvD2ZgT1WBzbm1264IzsjHIlHbQUQtJXdbUn96iQ==
X-Google-Smtp-Source: ABdhPJwBv4TI88plhh0uLEzERDifwkhBbzcd2m8wdyy43ozibmpOQUpu4tWNpVRhrCCQ4xr1uzjLfYtgN5gxlZrwymI=
X-Received: by 2002:a17:902:c40f:b0:148:f2e0:3f6e with SMTP id
 k15-20020a170902c40f00b00148f2e03f6emr48706008plk.65.1641302135468; Tue, 04
 Jan 2022 05:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20211227092522.21755-1-linmq006@gmail.com>
 <CAG3jFytHBizw_kxbjgRkv0WcxJE1LsKhO7X98fDGSqCzh2kafA@mail.gmail.com>
In-Reply-To: <CAG3jFytHBizw_kxbjgRkv0WcxJE1LsKhO7X98fDGSqCzh2kafA@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:15:24 +0100
Message-ID: <CAG3jFyu6LKh=oFierfztVhcy4u3pFPec3SwQErkQYtEyaFdCnw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Fix free wrong object in
 sii8620_init_rcp_input_dev
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Sean Young <sean@mess.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maciej Purski <m.purski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next
