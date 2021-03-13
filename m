Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEEB33A0FC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 21:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7246E175;
	Sat, 13 Mar 2021 20:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9C26E175
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 20:25:14 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id w7so9991821pll.8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 12:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=v3vY56f73yYRGQoRVyLC2J2MmOEbfpTBn19IMuyaMzo=;
 b=SJ7HYzHQCXlKPz+g8XwP5a0yua+xQW9XsyNmzipwqSxpAbDHfEbpRJ1+jIGuOcUOeo
 mUETiOW1dfn83yqEQU2aMuC5vTA0lP+RPnKi7cmwpALUPixtqFe4Ur5OPyPQ25obMudi
 c2Nj4k76ShAU49a2tnTVrkcsDoBT2ojyUMW7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=v3vY56f73yYRGQoRVyLC2J2MmOEbfpTBn19IMuyaMzo=;
 b=VCust66ZYNvK3q49fonmvoWJkan6OIcxfPraH0Pv6d3xwW66yRFpgsdDZ6SKYVzwIT
 L6145ENzYoGLwHBpRuGub/B5Y0DE68uqC/5bDLAvOJzsMD3NMzZHNRUVWLopStX10ezf
 Ia6Px2Im93pN9Q3Lyi35vFGmfWf5GTBzgkpikrEDKHdJR1wnx9ZskWHFwWJLMbP8VBrE
 r8Lkd5mQYPO8ttad/ODTmVN6f6HHCQzvoX6rwh/0Do+rEv2JN9C0UvIpqTkpm8H/GPIT
 d/veC9xfNb0FF1ek+1q7wWQ+Guf+t+eoUt2QPWLC0HwWEoDtdJdoZspreRilyAWBEx2O
 Thng==
X-Gm-Message-State: AOAM532mnCjr7lz0mLI+ahfu/XFUijfPdsTvFnCapcbQZEDIFixT6yqT
 wUVzTyuRWHmV1bOMOWewD3DH6Q==
X-Google-Smtp-Source: ABdhPJxOEsz/IKrr+VJDO0X6BLSVsEVwP/TcZ4L1UImrAp4MkFWx0aA6BSz/7QwfpnU3izA99mZ4hA==
X-Received: by 2002:a17:90a:fa0b:: with SMTP id
 cm11mr5266895pjb.140.1615667114263; 
 Sat, 13 Mar 2021 12:25:14 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
 by smtp.gmail.com with ESMTPSA id 138sm9167366pfv.192.2021.03.13.12.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 12:25:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 13 Mar 2021 12:25:12 -0800
Message-ID: <161566711226.1478170.16782631593370115752@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-03-04 15:52:00)
> This patch is _only_ code motion to prepare for the patch
> ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> refclk") and make it easier to understand.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
