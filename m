Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E731C4E9B
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBD86E52A;
	Tue,  5 May 2020 06:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439F89DB4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 05:36:18 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 18so355347pfx.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=PgNn3V7/MzuRcjOMN9rd19kSSaAjSXc1sbvAQljU/hA=;
 b=SM7cLj321gsqku/RcDGUTvjhUWhaWgSRlq+T4JlGUjnomhg0gFtNX4IPqFznQGaCE0
 fJ+ioa3bAOkK0uMmzhCYvKPr5NydIsmo27aIJ5EDtHwGsuykNx/UOt15PO5YBLJ24CbA
 H87V4WJ1KvGvLgl9IN6GleQbJKC8t08luv4wE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=PgNn3V7/MzuRcjOMN9rd19kSSaAjSXc1sbvAQljU/hA=;
 b=fbtSygddcJnHh51vhfa5OMEreFTsjwYmgdMhQFf4gExMUc+jMpzfxkPUwTCsaDu23S
 vaB/9gwO5g/0EJBQJZplD8cE2aUZnC+zjoEbhukIHMUu+FSUssQYGvOcA0FdZ7lTWJhA
 nxV+znqVO5eJdiALAld4e5gY62/DKsIA8jteqhTZBl8RCoNG/1NhsScEiMrzgNi8iX3i
 m5Z4V6ZdRdpWDN0kh77Tjet73zk5c9hOc/aWtO6KlCsEVJG6G/t6ilpdFvOAJ6SGNYrD
 JWF2T4QjJuDS+RPUBosrBSlmaoWCgW5KpFVSNu3k5UweJB53Of2kM5Xrtbnfpb1iyfcb
 7CJQ==
X-Gm-Message-State: AGi0PubttcYtcdeRsxj7KQmmlYR3LN6/QPMDDnh4vDFw8CChl/dGu8mV
 jPfu0rZRolJE+C1G7Zu4rbuWfw==
X-Google-Smtp-Source: APiQypJCj1XTR2XkP+3PzHlfBOHxZ/4kCpbE0LsmFF42bc3+AilTA09X7ifq6p9O0wuvwLTx9dfT6A==
X-Received: by 2002:a05:6a00:d:: with SMTP id
 h13mr1562393pfk.254.1588656978175; 
 Mon, 04 May 2020 22:36:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id h17sm803393pfk.13.2020.05.04.22.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 22:36:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
References: <20200504213225.1.I21646c7c37ff63f52ae6cdccc9bc829fbc3d9424@changeid>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock
 choice
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 04 May 2020 22:36:16 -0700
Message-ID: <158865697643.11125.1165741750015641823@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Sandeep Panda <spanda@codeaurora.org>,
 seanpaul@chromium.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-05-04 21:32:29)
> If the rate in our table is _equal_ to the rate we want then it's OK
> to pick it.  It doesn't need to be greater than the one we want.
> 
> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
