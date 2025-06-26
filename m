Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC76AE99DD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375B110E130;
	Thu, 26 Jun 2025 09:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="utUg7EZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85BC10E130
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:23:24 +0000 (UTC)
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id ECC671F967;
 Thu, 26 Jun 2025 11:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1750929792;
 bh=izAjhpsXTal8f3hm9SJLot604E5bhxsb/4OFueLGShY=;
 h=Received:From:To:Subject;
 b=utUg7EZ6/KmoskT8pK882I06qecDzO3j3zgPDifDO3S7FCfVo2D1q+LUGIaKeLJCv
 TZHqwBbvlESBfiLZAEWQNMv74de4YmEkSj5oSZ6V1s93DUfxaEwNk5e0k7hoeLwupR
 /Lrl3LWBbcoxIwep4gjUXPIKkkO1MX6W2HlgpZtEOy7/DUXLOKkBW+OyKoUZpdKlGj
 HVfxcaXhKQn36QYXxeoEGvnUicwlrUV5OwkzsSt0jOkYN+eNokpNVJaxmRTgL1YFGn
 BKgoGg9vuCEwrpfzhJEdqm1trRhSY284pG3YIWmolrPydpd9kRJQ4TQmRpzY76a2gk
 vv7pf9//pSzAA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
 id A697D7F9CF; Thu, 26 Jun 2025 11:23:11 +0200 (CEST)
Date: Thu, 26 Jun 2025 11:23:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v2] panel/simple-simple: Identify simple DPI panels using
 .compatible field
Message-ID: <aF0Rf8YiriLCN85V@gaggiata.pivistrello.it>
References: <20250625-b4-simple-panel-regression-v2-1-9422d46917ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-b4-simple-panel-regression-v2-1-9422d46917ac@redhat.com>
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

Hello Anusha,
thanks for your patch

On Wed, Jun 25, 2025 at 05:44:44PM -0500, Anusha Srivatsa wrote:
> The panel allocation in panel_simple_probe() breaks due to not having
> the panel desc for DPI panels. DPI panels gets probed much later.
> 
> Currently driver is checking for desc == &panel_dpi to do the DPI
> specific panel desc allocations. This looks hacky.
> 
> This patch does the following:
> 
> - Rename panel_dpi_probe() to panel_dpi_get_desc() and call it before
> panel allocation. panel_dpi_get_desc() returns a panel desc unlike
> panel_dpi_probe() which returned an int. This way driver has a known
> connector type while allocating the panel.
> - panel_dpi_get_desc() returns a panel desc
> - Add a simple helper is_panel_dpi() to identify a simple DPI panel from
> a simple panel based on .compatible field
> 
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Reported-by: Francesco Dolcini <francesco@dolcini.it>
> Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Not working for me.

I tested on top of current torvalds/master [1], and the result is display not working, no WARNING
message and this `platform disp0: deferred probe pending: (reason unknown)`.

reverting de04bb0089a9 on top of current master [1] fixes the issue.

[1] commit ee88bddf7f2f ("Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf")

Francesco

