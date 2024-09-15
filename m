Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EE9794B7
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 08:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372C210E028;
	Sun, 15 Sep 2024 06:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="DER2PoBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0E10E028
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 06:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+4XgwVGxJeOjUz5ZvQCVWlV8A1nJn2/v5ZCP+iqPbM=; b=DER2PoBDYhRvbzjwgZnsh1iREo
 m3QYH/xlflR6I9HxIc99+Vl1nBuJBnIuWf9hFYtFnNYq7A1B5q/rf+KMKyFf2xyPScBLmkS7byTpv
 0O4WSDqQ1LM1xbyoatxdmo5mu9C3OJ/eSNMNb3lABEqxtnLFyzPvbo8p6kxcy2wRqe+O9ucH6s0d4
 +oFbx3NFjhBTqcKhfPl7NobNfhFG7Aj04+DmkdcmiBLMfpNicSSeU8ZpGcQO+6ZJM/xA/50YaQ1Tq
 Ek+GjfTq8e3sGBMZXuEUjVacGdqeniNoqbdFDYEYwjh0iVv4FX456PTyBZheaIzeTEcxrLW6Q34pm
 NVMtw74Q==;
Received: from [213.235.133.41] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1spiWX-0008L4-NC; Sun, 15 Sep 2024 08:14:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Date: Sun, 15 Sep 2024 08:13:53 +0200
Message-ID: <2748376.mvXUDI8C0e@phil>
In-Reply-To: <4766d230-c9c3-414d-a954-3b0c890e7e08@collabora.com>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <2376712.1SvkZsmPdQ@diego>
 <4766d230-c9c3-414d-a954-3b0c890e7e08@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Samstag, 14. September 2024, 20:28:59 CEST schrieb Cristian Ciocaltea:
> On 9/10/24 10:08 PM, Heiko St=FCbner wrote:
> > Am Freitag, 6. September 2024, 03:17:42 CEST schrieb Cristian Ciocaltea:

> > That hdmi->ref_clk just accidentially falls out of that loop at the end
> > looks somewhat strange, so getting and keeping that refclk
> > separately would make this look cleaner.
>=20
> I've added /* keep "ref" last */ comment above, but I agree it's not real=
ly
> the best approach.
>=20
> I'm going to submit v7 in the meantime, as this was the last remaining op=
en
> topic on my list.  I guess we can figure this out afterwards.

yep, that is fine to figure out later, as it's mainly a style thing.


