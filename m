Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDB53ED1C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D611BAF8;
	Mon,  6 Jun 2022 17:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36DC11BAF7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6KcmZERReMj91I4Z2hAEfo65JLY4e4eAS5un7mwvs8=; b=PTT0GDJfE3l97+z6Athyiwm7C5
 Ct6bJeSh2TYszVTIOOtyn7LU3RO1NbVPk25Dz7VJScrAYkijDfMqaWmqRHJ8ht3PvwGvJgX1HRA+v
 Fc9kx0d6/APwwqpcOgosf3oBbC85APJ2ZPfhDI7aADVCacdKENkNBpfr7TDi8jBFY72JPJMjIiXXm
 78l4Qej2seXMVb8N/oGOdqEBgdZhQNVzGyVOWtiI6ZfhzBFRpjPVJe3BHbJ3UC3mN4qOJRTtiTzU5
 X9CNm9lh2k91LeGsfDx35pacyJZxJXQ2OFXx1DJ8GWuOBsC+2jxi93oeDKbcLmFYTvPetdBBF0ydh
 47btb7zQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60976)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1nyGkG-0002IK-88; Mon, 06 Jun 2022 18:42:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1nyGkE-0008Qc-KL; Mon, 06 Jun 2022 18:42:26 +0100
Date: Mon, 6 Jun 2022 18:42:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/i2c: tda9950: Lower severity of log message about
 missing interrupts
Message-ID: <Yp48gqLTp8Bwu7rG@shell.armlinux.org.uk>
References: <20220606171436.2438051-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606171436.2438051-1-broonie@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 06:14:36PM +0100, Mark Brown wrote:
> The tda9950 driver prints an error message if it is instantiated without
> an interrupt being available since the device is non-functional in that
> case. Unfortunately due to packaging of tda9950 with tda998x series devices
> the tda998x driver unconditionally instantiates a tda9950 so systems with a
> tda998x configured without an interrupt will trigger this error message
> during boot if tda9950 support is available. Reduce the severity to debug
> level so this is less likely to be presented to end users, the information
> is still there for system integrators who run into problems.
> 
> We could add a check for an interrupt to the tda998x driver instead but
> this feels better from an encapsulation point of view, there's still a log
> message to help anyone doing system integration.

As the tda998x also makes use of the interrupt, it would be trivial to
avoid instantiating the tda9950 device if there's no interrupt. tda9950
does require it, and if it's missing, then it isn't functional. No
point wasting memory on the struct device.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
