Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC6345865
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63066E839;
	Tue, 23 Mar 2021 07:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0C6E839
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:15:04 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so9750086pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=GJS1m/A5U7XP3iq7fk/jli3OnxTi83Ud02GBGt0St/E=;
 b=gN4FlASgyHU1Ntq97QVzk1lwyTj8YdNDsq0dstEZspabzUqyRTJPNdlzIisGI3Av0U
 DtOOjUhj24mUb3X3RnS1vIVNQX5tt0weZLKlsvIgkZTyK/3fjgtn91QwH77+/UzP4Kh8
 j99GwAHxL2onNsoEOX8KVyyzA7gF+qAAzKetk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=GJS1m/A5U7XP3iq7fk/jli3OnxTi83Ud02GBGt0St/E=;
 b=k01k0954MrTaMGNmsYGxtMuRckPKjc3eURs0NXMoGzUahK5mPiIAejJywvSoMn4OE1
 CGMlVEHhCAdyy2ys5OZIVqNhXgW712lwRkOqA8eaBgTp8NNmfLDXumiDKcELC1KYdA5T
 x97TIradeB+fNjnGAiqR56ZoS5ctTCSjj+UnvxfOosNJEHPUOlD4gBiLu3AJcB0wF9Cf
 9xDnR3Oy9MrSsneZjW3pZrQrMIJ97K/qu/6v10mRgWtkFmAzjKwNl2A7JdWSjTubjFtA
 E6Ap3gCD2FF8GFAtiO15fk2s0lHM2f5IAQ/ZRXcalh2hQanrN6HXvi9QhDHyGyZAH8dt
 /Huw==
X-Gm-Message-State: AOAM533wPAQudrAjmCXM5E7kcOK+tpBmeEKf+eczTrLNhWY+DUlr0CYb
 snbgznyzqqssvX1RWoA26jZe7VjbgyK79Q==
X-Google-Smtp-Source: ABdhPJwgBMmh6QYlC8BOIZ7xAIR0GbJMf6zQhL9CLxvBvrByacMvfxg6HXogSxCLXVaksAE0T75Idw==
X-Received: by 2002:a17:90a:a4cb:: with SMTP id
 l11mr3094986pjw.144.1616483703916; 
 Tue, 23 Mar 2021 00:15:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id f2sm1524324pju.46.2021.03.23.00.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:15:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector
 creation to a function
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:15:02 -0700
Message-ID: <161648370205.3012082.3202368984408404985@swboyd.mtv.corp.google.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:24)
> To prepare for making connector creation option, move connector creation
> out of ti_sn_bridge_attach to a separate function.
> 
> No functional change intended.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
