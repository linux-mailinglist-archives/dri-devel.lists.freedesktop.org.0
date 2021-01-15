Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F792F74A7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F10C89B22;
	Fri, 15 Jan 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A381D6E140
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 02:09:44 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id n7so5056445pgg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 18:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=dannooC+A5LWkd3Ac8LXRquK9ciYe/oflIGuwcSGfTA=;
 b=obhcRYWu1TQQF/rfqb1MHAvpWn0lWgr5DV/FVMgO4R3PA6AqHp2JDcWe+z4aqaw8fG
 /z8NKxNFYn8UgxEbuiYJic06U6Tu8UtcaGGEA6+AY2Qwl59QA1dAk0S5OOrOHS1GKtAj
 fizvuhKMBbE7LzFBCtiT/HpDf/7ImkRfbEuD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=dannooC+A5LWkd3Ac8LXRquK9ciYe/oflIGuwcSGfTA=;
 b=oDB1gQLCy4XcbeMyA9nwtq+VZpS4UUfMADNjDCYC4I+mSal2DdT9wSDiYnKV3ApU8f
 qGuvoU0jDk5qTFlTeF/bUNEyUq9Q08g6P8hxk1BrZcjbXZamo5yUenRVRlwHsQ+LlwQD
 0bMZjL6WZBoVPnOj5ivim5AJ49tOa+6CmBX4IJRACzN+8QzwsgeETym2Xi/ILD9gbezt
 Sr8rDfti5LL2Gy6YLTXMjd+LyhuhcVGpL2L63h4hcePkpAKpH4tdRU5x713FjH5xhUdG
 BgPWwNWvwXb2vggrk/E+e25DGHD4Lp7Z/NIzb3G+Y5M4Vti4xJ/VdDHm01zhIboDNZ3Y
 9OCA==
X-Gm-Message-State: AOAM531wxHqVkTorxPND12mnrLSSFM9wZg9mUZIS4YXSXsf2+1cOiLcc
 IrGo5ZNCQ1SlRDbsgqSUkWAuXA==
X-Google-Smtp-Source: ABdhPJyWGZRCJiQNQl64uo7yCE8fHw8Vw4JwrWpDJL+EJJpEiGsGhi5X4/dekyMOyA8SjfJJ153MMw==
X-Received: by 2002:a63:da4f:: with SMTP id l15mr10386961pgj.22.1610676584423; 
 Thu, 14 Jan 2021 18:09:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id w11sm6721197pge.28.2021.01.14.18.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 18:09:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20210114172254.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
References: <20210114172254.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
Subject: Re: [PATCH] drm/panel-simple: Undo enable if HPD never asserts
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 14 Jan 2021 18:09:42 -0800
Message-ID: <161067658243.3661239.4774914368205323276@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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

Quoting Douglas Anderson (2021-01-14 17:22:59)
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
