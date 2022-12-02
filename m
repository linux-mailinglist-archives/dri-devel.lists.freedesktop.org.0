Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B419640807
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 14:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EEF10E109;
	Fri,  2 Dec 2022 13:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F1110E0C0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kvxrxBCW4GJgYGlNptg0Jo2kSacfwxWOJC7wYSfaQ+M=; b=n9y4h+lBKpjvC+qcxZ9QUWJvJF
 C3/9TSDciRShHSITeTUQjoRDls71w1M6DnuAkECGHxajU2yczLVbAq/B24xdWQW7+uxokkygLfLPb
 sY/8IPccPc4kTlVxa12eoT+BW7UsPs8TEXaM3vkaINYe2eT54UroYGy+hAUZrP6ekBvhZUl6VPSS8
 8x0L6fA+7UrYeOjphSSYOrovyHpYSlyN07ElRmMH+uG12kpjcdzrrqYwNF/MZQfnjDpcuAPK364yD
 8oFDyMZQTGNKvnR2MRwxJQ1NINoKFcUeM/HUVyefJr51sb1H1HKeHLAO1qFiYZgdGy1xGbLhSUI13
 +60svlVQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35530)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p16Vr-0004AX-B6; Fri, 02 Dec 2022 13:55:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p16Vo-0004Rk-Em; Fri, 02 Dec 2022 13:55:32 +0000
Date: Fri, 2 Dec 2022 13:55:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 0/2] ASoC/tda998x: Fix reporting of nonexistent
 capture streams
Message-ID: <Y4oD1Of4wfN0dMGi@shell.armlinux.org.uk>
References: <20221130184644.464820-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130184644.464820-1-broonie@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 06:46:42PM +0000, Mark Brown wrote:
> The recently added pcm-test selftest has pointed out that systems with
> the tda998x driver end up advertising that they support capture when in
> reality as far as I can see the tda998x devices are transmit only.  The
> DAIs registered through hdmi-codec are bidirectional, meaning that for
> I2S systems when combined with a typical bidrectional CPU DAI the
> overall capability of the PCM is bidirectional.  In most cases the I2S
> links will clock OK but no useful audio will be returned which isn't so
> bad but we should still not advertise the useless capability, and some
> systems may notice problems for example due to pinmux management.
> 
> This is happening due to the hdmi-codec helpers not providing any
> mechanism for indicating unidirectional audio so add one and use it in
> the tda998x driver.  It is likely other hdmi-codec users are also
> affected but I don't have those systems to hand.
> 
> Mark Brown (2):
>   ASoC: hdmi-codec: Allow playback and capture to be disabled
>   drm: tda99x: Don't advertise non-existent capture support
> 
>  drivers/gpu/drm/i2c/tda998x_drv.c |  2 ++
>  include/sound/hdmi-codec.h        |  4 ++++
>  sound/soc/codecs/hdmi-codec.c     | 30 +++++++++++++++++++++++++-----
>  3 files changed, 31 insertions(+), 5 deletions(-)

Looks sane.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
