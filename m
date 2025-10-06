Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B258BBEA52
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D4210E0B4;
	Mon,  6 Oct 2025 16:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H/eQo43q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69EF10E0B4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 16:26:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1464CB7D;
 Mon,  6 Oct 2025 18:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759767906;
 bh=urAPi5PtnmEjVyblteohOkDho6JfrnjSMqTu5Ai3YXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/eQo43qbQUcC3DL3yzFPzCSmJbqB7E//sIkVmKsAfpQ8l39r7q7ZfkDderkgM5eo
 433Zf89qFnNQVhH/crzs8biSG5JaIZtKzdkXHe+BDNI7JZTjYs3R09QELaITQ3aOVa
 MGov8SwXecILaVDWMRZFWVY/hu3mn7sTLXADweLk=
Date: Mon, 6 Oct 2025 19:26:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 2/5] drm/rockchip: dw_hdmi_qp: Improve error handling
 with dev_err_probe()
Message-ID: <20251006162631.GK5944@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-3-laurent.pinchart@ideasonboard.com>
 <gai5hfvu6xbbqpk4mu3i6nejolijeokjy3mkzca5xwzb4xwic7@jmee36svmwnb>
 <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8706f168-5598-4f91-9ad0-fdbd04b410b7@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 06, 2025 at 05:37:23PM +0300, Cristian Ciocaltea wrote:
> On 10/6/25 3:02 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 02:55:38AM +0300, Laurent Pinchart wrote:
> >> From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >>
> >> The error handling in dw_hdmi_qp_rockchip_bind() is quite inconsistent,
> >> i.e. in some cases the error code is not included in the message, while
> >> in some other cases there is no check for -EPROBE_DEFER.
> >>
> >> Since this is part of the probe path, address the aforementioned issues
> >> by switching to dev_err_probe(), which also reduces the code a bit.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> ---
> >>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 62 +++++++------------
> >>  1 file changed, 24 insertions(+), 38 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> index 7d531b6f4c09..4e7794aa2dde 100644
> >> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> >> @@ -457,10 +457,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
> >>  		return -ENODEV;
> >>  
> >>  	if (!cfg->ctrl_ops || !cfg->ctrl_ops->io_init ||
> >> -	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback) {
> >> -		dev_err(dev, "Missing platform ctrl ops\n");
> >> -		return -ENODEV;
> >> -	}
> >> +	    !cfg->ctrl_ops->irq_callback || !cfg->ctrl_ops->hardirq_callback)
> >> +		return dev_err_probe(dev, -ENODEV, "Missing platform ctrl ops\n");
> > 
> > This only makes sense for the purpose of unification.
> 
> Right, as mentioned in the commit description, the intention was to ensure
> consistent error handling across the probe path rather than limiting the scope
> to -EPROBE_DEFER exclusively.

Should I revert this change in v3 or keep it ? I see value in
unification, but I don't mind either way. Dmitry, what's your preference
?

-- 
Regards,

Laurent Pinchart
