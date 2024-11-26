Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74609D98AE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C7E10E27F;
	Tue, 26 Nov 2024 13:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="cGTHpe+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB5410E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tN0r84mltrzWKXImKJPU4zA3MIm8jfWmB/JmJnj+81A=; b=cGTHpe+PbK5cetpMFRQwt0vOma
 IKOaMrbpCHEttoujvWhb+esxr/IJylAxWpnIf6oPVztXWgiIozWpdwCcf5nlzE+qPrPWhc2VhAZEJ
 9lMJA34Trj5JhmDmUP8Kjgrua3Ij5DkAvWZnZJfr2pA8XO0cCIp4Ip3e64gcjWnzrTZcwJXIPKkku
 0ehWv/PL65V1Tqft1Arq2nPDfKaWG+a/8EcBFJRI6vlcEpojC8hjuayzHEWJC2ckVroBpSWKBYbsF
 fEiNoXJMQXoQXWkUO7WmkS4XTFm15tcnvC+A5qasNX5771F3SNdgtXBC2+igR8zN20Zb/jSMKGS/N
 S3umjoAw==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tFvmZ-0008Sx-N7; Tue, 26 Nov 2024 14:39:11 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 3/3] drm/rockchip: Add MIPI DSI2 glue driver for RK3588
Date: Tue, 26 Nov 2024 14:39:10 +0100
Message-ID: <9368781.CDJkKcVGEf@diego>
In-Reply-To: <D5F4UD59MUJG.2HFCTRSPELO98@cknow.org>
References: <20241106123304.422854-1-heiko@sntech.de>
 <20241106123304.422854-4-heiko@sntech.de>
 <D5F4UD59MUJG.2HFCTRSPELO98@cknow.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, 6. November 2024, 14:33:25 CET schrieb Diederik de Haas:
> > +#define IPI_DEPTH_5_6_5_BITS		0x02
> > +#define IPI_DEPTH_6_BITS		0x03
> > +#define IPI_DEPTH_8_BITS		0x05
> > +#define IPI_DEPTH_10_BITS		0x06
> 
> Possibly dumb remark (sorry):
> drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c also defines these
> values, so wouldn't it be better if they're defined in 1 place?

they are quite device-specific, so for me it doesn't really make sense
to try to centralize them. I.e. these are the values that need to go into
the GRF register to select a specific depth and are more or less the
same by chance.

I still remember quite well the answer to why Rockchip hardware engineers
sometimes shuffle around similar grf entries between socs "because they
want to" ;-)

At least for the rk3576, they seem to stay the same for now, though part
of me just expects the values to change in the future.

So personally I'd like to keep them where they are :-)

Heiko


