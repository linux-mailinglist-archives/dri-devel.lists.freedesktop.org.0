Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A092F8CF8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D686E5A9;
	Sat, 16 Jan 2021 10:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D5893E8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:49:47 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x12so5440795plr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=mHS+GmDucuVisO7/TEIKfi2038F5W5ODOHM5tYty678=;
 b=KIRkJcB62OI+2gSE6B0ufJiUa28Y6UKuq9fPy1UoCciO5jav0Ztuag0JxecnytAY2P
 l/lEtv0dVpCj1nqy3Cc4Wy3L8Q+U6WDmPCKkEKkCQCfa1mLlFQdgjJiwWXxoeOhqspWM
 +1OdvbdwZio/ryV8i4EjzY52whHAHY6NDvtmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=mHS+GmDucuVisO7/TEIKfi2038F5W5ODOHM5tYty678=;
 b=il3Zu1+qlUdWNSqxjD8qeG/SXXyYEAHcT/8itLrkCDCADsQx3DSzKtJruH4eQULzR8
 876lqYFYa3vutG5Yc0MHA14+211277QnOD1vRMAdYS4Zv9THbIfmYuAH7qTBBKRVcz/T
 AKGC58D+ejvWWf3g3FRd/g2U4NijS2tAIkygxSIhS8OEQOm7jczeUdHVhM0AlKuQf/eH
 4yFpkt6E620pac/mRC5dEvPaU/URWAgBKordA+uOLjRonuEVjU5LLxZ0ynqLLVz+HSzW
 C8G1zDCN0Bzn41q6WIJ0XNIT6fuLCa6ztqhhVcsndZ6xZzA/ozqrQ5+le/KoXDDaWCQ0
 Ugog==
X-Gm-Message-State: AOAM533DaBxkrzuvfEhoYCS5kTa/N/oeXIyGbvtqjHihmrnRbP/7z1ip
 BOTVx69OGwTwuTv4aqzR5hxbQg==
X-Google-Smtp-Source: ABdhPJyjJRm3oaf7/luMsSHFrTDffSjqmbq1kECJBjrdlfTUC4wembCp33zmhSKebJduSqkkL3K4KA==
X-Received: by 2002:a17:90a:df0d:: with SMTP id
 gp13mr12897807pjb.151.1610750986716; 
 Fri, 15 Jan 2021 14:49:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w20sm5428344pga.90.2021.01.15.14.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:49:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210115144345.v2.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
References: <20210115224420.1635017-1-dianders@chromium.org>
 <20210115144345.v2.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
Subject: Re: [PATCH v2 1/5] drm/panel-simple: Undo enable if HPD never asserts
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 15 Jan 2021 14:49:44 -0800
Message-ID: <161075098468.3661239.7555919770669361287@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-01-15 14:44:16)
> If the HPD signal never asserts in panel_simple_prepare() and we
> return an error, we should unset the enable GPIO and disable the
> regulator to make it consistent for the caller.
> 
> At the moment I have some hardware where HPD sometimes doesn't assert.
> Obviously that needs to be debugged, but this patch makes it so that
> if I add a retry that I can make things work.
> 
> Fixes: 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying prepare()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Nice catch on the unprepared_time

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
