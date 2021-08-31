Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81383FC9B3
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 16:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828F26E09E;
	Tue, 31 Aug 2021 14:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA916E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 14:26:05 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so2127479pjc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ysJARml9hvQhxWkQGnSee4N2rvgFLMKbDovp4lP2LPg=;
 b=CIerM5zaDu3bLrRJpOuATMcjNqRG0wlOpQrPsxVcyxfa2iOx7sdZArfmwf0y2rXRoe
 fEmQXMNWn+9/I4vkHRUcJ7zFupltTpHxoqW/7CZ5QpR47qkREE/5YZozs8DL7oppEGsa
 Ve0fMZdA2MR/pCnNmwUEtaCs2xKjK2jF5cif9F4XtoiB7IUs2GZSYPj97OvYbpBhin5F
 TJY5o4bOI4+Q1t2hy3CuK3rLZhFKL7pQO4kW4DrgaFkimLQyAKpzydtYIkj3xaBtqN9Z
 NrPfWWu8d5wgSVaDAHPa/6T0W21QfjWlSkIF1poYrys4414b9s+/C+PjJ3mibqOQyNti
 O8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ysJARml9hvQhxWkQGnSee4N2rvgFLMKbDovp4lP2LPg=;
 b=m1k49LhNvOT1n0DwokAmUeKTQ8/lqNdr5YvUxjGnm4EB2TSwy7+EWeg72cKXPLrjis
 8UFvgoW0j7IKG/6LXRaJJEPPZbl5vLR5xb/ZDjFSO7aF2KuUhMoREYLbnAZU/gv3OYsd
 +NMBN9fLmmnAhTD3M56vo4T+VKEPzQAUQzfHWEQdH5oqa1OoLfDBKJ9MVKb6gw0eJLJA
 W9I4FUNEV0tvxUcLQZ7qW3s2FpXwoeHZ1+2cJhVIAETCP6c4suHmuhK9AlMhFHYLmXF1
 pHj6FCsyzSFsnNkm3kOvE9hILiA5sQiaBZodOh85xLXulxI89PZN13GtwyAkHE5bVXVY
 usqg==
X-Gm-Message-State: AOAM532jPb4nd4jfr+nrpRdj22RsWMuGjv6J2LxwK/BRIwehzpeXWvr2
 SReZ+L/VzWkFVJcmbpiJNQtXkILBh9J0TvzeRcw2dQ==
X-Google-Smtp-Source: ABdhPJw85e6v2e4XdIa48zuxRlXebSpwS2wWM3qtUei3YMH29CKgSxWgYhYxZKgyJ2OO5TsAIkN+cZA5IWxX63J56aA=
X-Received: by 2002:a17:902:6b8a:b029:12d:3f99:9e5e with SMTP id
 p10-20020a1709026b8ab029012d3f999e5emr4996810plk.66.1630419964677; Tue, 31
 Aug 2021 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210831135143eucas1p1bc6f6a6ca587818c1bb036a64723577c@eucas1p1.samsung.com>
 <20210831135048.4305-1-caihuoqing@baidu.com>
 <5ef0c227-555d-a12c-1685-ff43e43bdf97@samsung.com>
In-Reply-To: <5ef0c227-555d-a12c-1685-ff43e43bdf97@samsung.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 31 Aug 2021 16:25:53 +0200
Message-ID: <CAG3jFyvot4auJMVrndw_+DHhBsis05iuhTDzYYtyRHsD-GR12Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: cdns: Make use of the helper function
 devm_platform_ioremap_resource()
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Cai Huoqing <caihuoqing@baidu.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, 31 Aug 2021 at 15:58, Andrzej Hajda <a.hajda@samsung.com> wrote:
>
>
> W dniu 31.08.2021 o 15:50, Cai Huoqing pisze:
> > Use the devm_platform_ioremap_resource() helper instead of
> > calling platform_get_resource() and devm_ioremap_resource()
> > separately
> >
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to drm-misc-next.
