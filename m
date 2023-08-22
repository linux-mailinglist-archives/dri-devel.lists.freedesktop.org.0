Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE5784280
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 15:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F5D10E373;
	Tue, 22 Aug 2023 13:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1E110E373
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 13:54:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4971B65730;
 Tue, 22 Aug 2023 13:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAA7C433C7;
 Tue, 22 Aug 2023 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692712485;
 bh=OZdk+L9lV/tUVafdBKQSUhvJ0WoEpL/rmRTFTm+vvng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=apzzx2iRS7drX7IIQCP8qIt0eKye5QX1aSRRzQcePIv9xVzvqs0WcQVMUjCvHxcND
 Bkf+pVYdoPedujn1TuOq9bPh4wXU1isdkuJ7pzUGkETPkuVYczq7H/AziHyepJqdjc
 hSCk5pyNAjtlYOjXb/7x4JGzKGOzO/SpBXpj7E2ECKMwsti0cznxhzFu8AzBRbrzfa
 A7Eb2/76/0PKEyHMv7zwjTCzE3V0pCKAt4/vorhCud8vK9Zj2fZeCzXtKpJwmuvQmp
 bCRD1lmD3bHv788Ed/MG9prmcrKKcJciJWrASB8vXisoxyOnQ6lpgcwuN8vxghkzGp
 WpnyrEm6irNPw==
Date: Tue, 22 Aug 2023 19:24:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 2/7] phy: Add HDMI configuration options
Message-ID: <ZOS+IQgFZYxN503B@matsya>
References: <20230808083243.3113192-1-Sandor.yu@nxp.com>
 <20230808083243.3113192-3-Sandor.yu@nxp.com>
 <c485b64e-3c83-4616-b8d8-76c2c7d56b0e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c485b64e-3c83-4616-b8d8-76c2c7d56b0e@linaro.org>
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
Cc: andrzej.hajda@intel.com, sam@ravnborg.org, alexander.stein@ew.tq-group.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 Sandor Yu <Sandor.yu@nxp.com>, jernej.skrabec@gmail.com, linux-imx@nxp.com,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-08-23, 13:05, Dmitry Baryshkov wrote:
> On 08/08/2023 11:32, Sandor Yu wrote:
> > Allow HDMI PHYs to be configured through the generic
> > functions through a custom structure added to the generic union.
> > 
> > The parameters added here are based on HDMI PHY
> > implementation practices.  The current set of parameters
> > should cover the potential users.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >   include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
> >   include/linux/phy/phy.h      |  7 ++++++-
> >   2 files changed, 30 insertions(+), 1 deletion(-)
> >   create mode 100644 include/linux/phy/phy-hdmi.h
> 
> I think this looks good now, thank you!
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Should this go thru drm or phy...?

> 
> -- 
> With best wishes
> Dmitry

-- 
~Vinod
