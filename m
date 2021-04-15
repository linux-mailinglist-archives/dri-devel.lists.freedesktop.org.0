Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721F3606D7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 12:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37A6EA20;
	Thu, 15 Apr 2021 10:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762026EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CbOTGVvPs0U6ccPcBAz3XTa5DR3oDV4c8Psx+m0JOCE=; b=Xz2u2WU+XkMOIzge50EntfZGiH
 WEskqO3kq7MPQBVc5Bz/iSGAydNJ/76D5oKIEs5rBq8RZZO4765DsJMtedxAUkaWaBz3K9MIAXk8Y
 TDfBgkyjy2MvnsW+DaMIJoeMk8F4NSu1hxMYGbt1UlyFcLBd3XtI6ki83co28rPNZsfSzV4t/AtuT
 ssS8dVWKRBVQTQkEmggIo0JutLgts6ZAI0ZtJ7NxnugajXEpEcd8F4BKTs9WDx/4jsWkW102uYzU1
 Rah7FW8SMxuzA0gPNgCye7uH4QzMRrFgHDC+7ms2o3vjZz2cxp6W31Zne5xHOgxUTek36avcI92Tp
 YNp82f3A==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1lWyz9-0000wI-45; Thu, 15 Apr 2021 13:12:31 +0300
MIME-Version: 1.0
Date: Thu, 15 Apr 2021 13:12:28 +0300
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: Centralize error message when bridge attach
 fails
In-Reply-To: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <04682a45a799554116db621627d28723@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Tomi Valkeinen <tomba@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Xinliang Liu <xinliang.liu@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Tian Tao <tiantao6@hisilicon.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-15 4:47, Laurent Pinchart wrote:
> Being informed of a failure to attach a bridge is useful, and many
> drivers prints an error message in that case. Move the message to
> drm_bridge_attach() to avoid code duplication.
> 
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Laurent Pinchart 
> <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
