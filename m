Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC13484CA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E797C6EAA0;
	Wed, 24 Mar 2021 22:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CC76EAA0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:45:11 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 7so19823483qka.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8nt2tcO/o4/zlLYQXVM4u2/2lHhJoANdZ4tq344KBt8=;
 b=MEGyYvhbOMsM6iSnFVZApDL7UWms0z+vRSWP0Qx0hVwQxOs1VrXu6oj5npSLF5AUXw
 oxXxsd8SE5DUFN0FnmtM1CGTm1yRT6UY56vhteEshaHmgi73+gc8Vx9pk8pboCIJtQqj
 voO9jIl0DEpxBV502dVcdt5UAmNHVFfdzsG4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8nt2tcO/o4/zlLYQXVM4u2/2lHhJoANdZ4tq344KBt8=;
 b=s2zUrp8oNLts69FV7DUm0Dg4gUEHDFSydPUfbOP1J5Khh0K6FTHKZSvBUWzqj0ZTuq
 4kAE6ddoYSULtCclRpKhkef6DeD7iugfLRiVNMWycKE7eDL7cRA2EFFrP1QuXyCvKHFP
 RJ8mYlTKN43CIMgnAaPpf54ztgJB+9JR6WS/ec40xC8lV4SCRegLVx+hHNJb9i32/jcC
 uMDjbmZGsx6caDgzTqMs16tQtbXOaJiMMGNL3wtH4sivpTDWUAaIMlZihtiHgJa6HQgo
 bwU62s/omznf6jGo5Y7qxRhBTMjCl06svkPWMn/TXCK/pSpGTwUR7fiIS+0JsSaR7QFi
 TI9Q==
X-Gm-Message-State: AOAM530Ni6swDh2ZUdJh1M2XsQjimjTA7x1aiuZjVI3UW84081mGXMef
 JDuW02+s+VxgxizLESLojAitPwHo9+QEiA==
X-Google-Smtp-Source: ABdhPJx0KZbeJVTfWz2XERkqTksMGa7EcTfz50xFlEB8PkK7AVBACdN6khc01AgoloAjlj4BzelLMg==
X-Received: by 2002:a37:bc8:: with SMTP id 191mr5467144qkl.76.1616625910373;
 Wed, 24 Mar 2021 15:45:10 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181])
 by smtp.gmail.com with ESMTPSA id l8sm2365937qtr.19.2021.03.24.15.45.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:45:10 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id x189so282120ybg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:45:09 -0700 (PDT)
X-Received: by 2002:a25:2654:: with SMTP id m81mr8285676ybm.405.1616625909042; 
 Wed, 24 Mar 2021 15:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-8-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Mar 2021 15:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPT=woS51O9B3AGQqrt8wjxCBHXajnThMt_wFqAKE9uQ@mail.gmail.com>
Message-ID: <CAD=FV=WPT=woS51O9B3AGQqrt8wjxCBHXajnThMt_wFqAKE9uQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] drm/bridge: ti-sn65dsi86: Split connector
 creation to a function
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> To prepare for making connector creation option, move connector creation
> out of ti_sn_bridge_attach to a separate function.
>
> No functional change intended.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 31 ++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
