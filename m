Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F080A790CD2
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 17:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDA210E0D1;
	Sun,  3 Sep 2023 15:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (unknown
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A01C10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lP/iAdoz+QPtqGG4L+OAJQCXqeS+EyZfaraPJ5/Yo1s=; b=m4NmGQiUQSJTyj3MHAxadEbHIT
 MNkmYzjB8yygZ2mQnCsq9098Rtbc2KAjNln0d+m/RErpf7YYmwMMqkzwAMJ4EMu+k1lLOzTG93vDj
 Xccxh4eGFTrVAip8un2o03GlSWWIj+0sna5IAJwTZ8bosjsmBfJqMnGC7ltVA0DKiiJGW3hLBuVJo
 VaNVjfpGkta0tgNB21Lt2FKTOcOBCSeZy0Pl/bQ6epyNLkq5KPiIeaiLgPMCHhpc4epYzXDAah0pd
 SxD3GU6azl14KvFLql4ZUTdO+8L7y43EsXc8iRJirVm8J4cRIzZaHl7e3T+0c6uMvXPnahFBshNTy
 9cpq1M8g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50168)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qcpPy-00061f-36;
 Sun, 03 Sep 2023 16:53:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qcpPy-0001bq-94; Sun, 03 Sep 2023 16:53:42 +0100
Date: Sun, 3 Sep 2023 16:53:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
> 
> This driver was fairly easy to update. The drm_device is stored in the
> drvdata so we just have to make sure the drvdata is NULL whenever the
> device is not bound.

... and there I think you have a misunderstanding of the driver model.
Please have a look at device_unbind_cleanup() which will be called if
probe fails, or when the device is removed (in other words, when it is
not bound to a driver.)

Also, devices which aren't bound to a driver won't have their shutdown
method called (because there is no driver currently bound to that
device.) So, ->probe must have completed successfully, and ->remove
must not have been called for that device.

So, I think that all these dev_set_drvdata(dev, NULL) that you're
adding are just asking for a kernel janitor to come along later and
remove them because they serve no purpose... so best not introduce
them in the first place.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
