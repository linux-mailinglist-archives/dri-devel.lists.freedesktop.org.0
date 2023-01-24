Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C638679660
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 12:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B910010E059;
	Tue, 24 Jan 2023 11:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384C510E059
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674558927; x=1706094927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zg8/P28ps+IaW6WtOh6SZ9l5jzbkeb7NOV6ctj41Lo8=;
 b=l0X3EccSe0Y1l7pDcDM5U1Y83me05n0Pits6sKR+W2RFHl6gU1KNhWm/
 8CBXPTDwLESklPqZsmQ5COYRaOgR1CxMFG6zbnvYhzsdYciEXI+oHNJ+H
 hsArB1ivDxV+HgxBAZSvo2+8eiCvu24+7kMa5s0DMWndWDaeitln55SnV
 sfoa5tPxVzFIoajCjoniYPRC/HQgCyQsCfZGh5wrkhWnpMOO0fYSCFtgY
 VG4bEtgnNrTeO77cRKvDTnhaljOLXKjMpoDxzYzQa0rL28FPekTpJDOkh
 3+gCddnuTSFk2rCl/anDv6UhAYT+GV38Fd23VWXQYCMjHqo4icvSm/uiN A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; d="scan'208";a="28617118"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 24 Jan 2023 12:15:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 24 Jan 2023 12:15:25 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 24 Jan 2023 12:15:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674558925; x=1706094925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zg8/P28ps+IaW6WtOh6SZ9l5jzbkeb7NOV6ctj41Lo8=;
 b=OGe/gy68+eRmjcQPpwad8KlMcG7R1LsxyZOj9cfLmezWiGUUg0fEI9RU
 pEfAdbqSAOoQvS/9MrZCa1ws33E+i42B6Rse2/n4/wUutnoo3Q1hPke5v
 ghB/g9sPoxtZaeuE/Rv2MAv7QvO1gHJPR0zQLxyU/ErlY4al2Sc7A/tct
 qoAxUUBil3RSa8rvnfGPAj7sMkqSy4ZnNlusySFcyIG2YJbtzGP1m/SpV
 nCdbMQ9L5D3U5mye6BRcBvjd+oT+FaKgIhL68X7Y+TXwih2ycBikTcmEb
 HZkdZPAI/djBy51Ah2zpwY8gcrIY7g93YInb1GBBA1N+Jog4tYd1Uo9Jx A==;
X-IronPort-AV: E=Sophos;i="5.97,242,1669071600"; d="scan'208";a="28617117"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 24 Jan 2023 12:15:25 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C3AFF280056;
 Tue, 24 Jan 2023 12:15:24 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/2] drm: lcdif: Add i.MX93 LCDIF support
Date: Tue, 24 Jan 2023 12:15:24 +0100
Message-ID: <13189854.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <7ac57bc28da40df054c81fd74f69207af66ad97b.camel@nxp.com>
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <ace76615-533a-9295-8271-95262859d287@denx.de>
 <7ac57bc28da40df054c81fd74f69207af66ad97b.camel@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Dienstag, 24. Januar 2023, 08:59:39 CET schrieb Liu Ying:
> On Mon, 2023-01-23 at 16:57 +0100, Marek Vasut wrote:
> > On 1/23/23 08:23, Liu Ying wrote:
> > > The LCDIF embedded in i.MX93 SoC is essentially the same to those
> > > in i.MX8mp SoC.  However, i.MX93 LCDIF may connect with MIPI DSI
> > > controller through LCDIF cross line pattern(controlled by mediamix
> > > blk-ctrl) or connect with LVDS display bridge(LDB) directly or a
> > > parallel display(also through mediamix blk-ctrl), so add multiple
> > > encoders(with DRM_MODE_ENCODER_NONE encoder type) support in the
> > > LCDIF DRM driver and find a bridge to attach the relevant encoder's
> > > chain when needed.  While at it, derive lcdif_crtc_state structure
> > > from drm_crtc_state structure to introduce bus_format and bus_flags
> > > states so that the next downstream bridges may use consistent bus
> > > format and bus flags.
> > 
> > Would it be possible to split this patch into preparatory clean up
> > and
> > i.MX93 addition ? It seems like the patch is doing two things
> > according
> > to the commit message.
> 
> IMHO, all the patch does is for i.MX93 addition, not for clean up.
> Note that the single LCDIF embedded in i.MX93 SoC may connect with MIPI
> DSI/LVDS/parallel related bridges to drive triple displays
> _simultaneously_ in theory, while the three LCDIF instances embedded in
> i.MX8mp SoC connect with MIPI DSI/LVDS/HDMI displays respectively(one
> LCDIF maps to one display).  The multiple encoders addition and the new
> checks for consistent bus format and bus flags are only for i.MX93
> LCDIF, not for i.MX8mp LCDIF.  Also, I think the multiple encoders
> addition and the new checks should be done together - if the new checks
> come first, then the new checks do not make sense(no multiple displays
> driven by LCDIF); 

You are right on this one, but on the other hand there are lot of preparing 
patches already. Even if it is useless by itself, having the bus format & flag 
checks in a separate patch, it is easier to review, IMHO.

> if the new checks come later, then it would be a bug
> to allow inconsistent bus format and bus flags across the next
> downstream bridges when only adding multiple encoders support(also, I
> don't know which encoder's bridge should determine the LCDIF output bus
> format and bus flags, since the three encoders come together with the
> three next bridges).

Agreed, this order is a no-go.

Best regards,
Alexander

> Regards,
> Liu Ying




