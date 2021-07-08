Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 215923C1572
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 16:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65406E8CE;
	Thu,  8 Jul 2021 14:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067296E8CE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUNuUzJxpWQ9/7mhxGOd+5A5iY6PGJl9Jgs7NRna4RM=; b=VMv6q7UYnm6a1cXRWzTHkrQknJ
 oMtqroVaoqygowG+iXOnK+LO4V8tdV4SgRi9T+JQkI+dudLqn5cdYQEAhSw7Ceq4OxDFUTNXFb7sp
 ayYKVY72Kr2qXY6NFQ8XqmU9oYNFQ+IWr3MIg1wuN3Wabzd8Oj5kUeNB7Cutg/ll2JmANtBjaCKfE
 wRCKeGI5BYVVyNRPpliP7eIqEvdWlWgi8qwcezQf8c+K4uVaUaEvyGpFE2ONdbg7mUzDCigtUXmWk
 cLfg9paSochPgwvY7r8WaA4ROD2xu1wIiImN7JksvpRjbiPaqOl+yKrBc+BWT43MuooUd7xjRpFcF
 Kqoq9dAg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56397
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m1VKg-0002qY-KM; Thu, 08 Jul 2021 16:48:54 +0200
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To: Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9d1c0730-af71-c0fa-09c1-37dea40edc44@tronnes.org>
Date: Thu, 8 Jul 2021 16:48:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: phone-devel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 08.07.2021 01.43, skrev Linus Walleij:
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
> 
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
> 
> The display optionally supports internal backlight control, but can
> also use an external backlight.
> 
> This driver re-uses the DBI infrastructure to communicate with the
> display.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
