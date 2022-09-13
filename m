Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940155B68F7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 09:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A65C10E638;
	Tue, 13 Sep 2022 07:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217A110E637;
 Tue, 13 Sep 2022 07:49:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A57DBCE0B62;
 Tue, 13 Sep 2022 07:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086DDC433D6;
 Tue, 13 Sep 2022 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663055358;
 bh=vbEK8a1FZJSD5mb8h3IpS0iL7BqomgfGkSEDht4TmC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W934uYq12yOZ9dEj+er+bqOSj1YRQThqDyVjAjfDVD3Y2cgWhUTADn3/0+8q8/CgX
 aazhOib/w1fOb3C9kgj1i9hB7uzENBI8fWqq0nr9jCHr6Nz8KCIsPrughCznpjkSUd
 gTICcoleBzr7H3UTE5J0MOgJC0KOVn6i27PD+cBFETJ+vpqlJLboZztMSfoXLJq7jh
 GLYdtJ56+q//HKYvSlgHsQyn3cHvBc7PdNHzfHhBTO3FaneG4nJuhyJgar/AeZhVLp
 bWOkK4LtIB2U7S6gtjIqeGK+WjMUpF+SDh4Nph84GEm90agbMYZdkVZkcB4qg71Euo
 yzfCUSvCB+Reg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oY0fT-0000yR-Rl; Tue, 13 Sep 2022 09:49:16 +0200
Date: Tue, 13 Sep 2022 09:49:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/7] drm/msm: fix memory corruption with too many bridges
Message-ID: <YyA1+xbgF+Gnm37S@hovoldconsulting.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-3-johan+linaro@kernel.org>
 <1f2dbfae-a29a-d654-0ad6-10125c6b6e0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f2dbfae-a29a-d654-0ad6-10125c6b6e0b@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 08:55:55PM +0300, Dmitry Baryshkov wrote:
> On 12/09/2022 18:40, Johan Hovold wrote:
> > Add the missing sanity checks on the bridge counter to avoid corrupting
> > data beyond the fixed-sized bridge array in case there are ever more
> > than eight bridges.
> > 
> > a3376e3ec81c ("drm/msm: convert to drm_bridge")
> > ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
> > a689554ba6ed ("drm/msm: Initial add DSI connector support")
> 
> Most probably you've missed the Fixes: here.

Indeed, thanks for catching that.

> > Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> > Cc: stable@vger.kernel.org	# 3.12
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
> >   drivers/gpu/drm/msm/dsi/dsi.c       | 6 ++++++
> >   drivers/gpu/drm/msm/hdmi/hdmi.c     | 5 +++++
> 
> Could you please split this into respective dp/dsi/hdmi patches. This 
> will assist both the review and the stable team.

Yeah, you're right, that should help the stable team if nothing else.

> Otherwise LGTM.

Johan
