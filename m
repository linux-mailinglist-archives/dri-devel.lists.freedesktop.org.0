Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F228D6EE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 01:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D66E982;
	Tue, 13 Oct 2020 23:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56F6E982
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 23:17:57 +0000 (UTC)
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8A7520B1F;
 Tue, 13 Oct 2020 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602631077;
 bh=UQ1kTWTCvomm7q0TZd9VPzHpHgnguOcIZu5JIN7IRpY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DFcN8qVOV4J2yI4znV6kmlilndnh2Ne6YdgO13yzegnqrxHEX1N40a2B2r1ZtCVu0
 cBmQBzxX9ApPMcKW2Yygot3ZUIgCN5Io0+IqvUeEWBD31eENWsRuWbwYrPJeNPNmGF
 c/SIgXvCS5TFk63eACfY14qL/LqPVkf8QcXTwA3Y=
MIME-Version: 1.0
In-Reply-To: <O0S7HQ.34QHSNHJ7JWJ2@crapouillou.net>
References: <20200915123818.13272-1-paul@crapouillou.net>
 <20200915123818.13272-3-paul@crapouillou.net>
 <20200924202237.GJ1223313@ravnborg.org>
 <O0S7HQ.34QHSNHJ7JWJ2@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/ingenic: Reset pixclock rate when parent clock
 rate changes
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 13 Oct 2020 16:17:55 -0700
Message-ID: <160263107570.310579.5439811142598502777@swboyd.mtv.corp.google.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, od@zcrc.me, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Paul Cercueil (2020-09-25 05:29:12)
> >>  +static int ingenic_drm_update_pixclk(struct notifier_block *nb,
> >>  +                                unsigned long action,
> >>  +                                void *data)
> >>  +{
> >>  +   struct ingenic_drm *priv = drm_nb_get_priv(nb);
> >>  +
> >>  +   switch (action) {
> >>  +   case PRE_RATE_CHANGE:
> >>  +           mutex_lock(&priv->clk_mutex);
> >>  +           priv->update_clk_rate = true;
> >>  +           drm_crtc_wait_one_vblank(&priv->crtc);
> >>  +           return NOTIFY_OK;
> >>  +   default:
> >>  +           mutex_unlock(&priv->clk_mutex);
> > Any risk the POST_RATE_CHANGE or ABORT_RATE_CHANGE may go missing so 
> > we
> > fail to unlock the mutex?
> > I think not but wanted to make sure you had thought about it.
> 
> My assumption was that you always get POST_RATE_CHANGE or 
> ABORT_RATE_CHANGE. But I am not 100% sure about that.
> 
> Michael, Stephen: is it safe to assume that I will always get notified 
> with POST_RATE_CHANGE or ABORT_RATE_CHANGE, after I got notified with 
> PRE_RATE_CHANGE?
> 

I think one or the other will happen. Of course, the notifiers are sort
of shunned so if you can avoid using notifiers entirely it would be
better.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
