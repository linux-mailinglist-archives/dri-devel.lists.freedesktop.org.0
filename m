Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0A17912AB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D34B10E2C6;
	Mon,  4 Sep 2023 07:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (unknown
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367C910E2C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tw6BjEdmTEnEK69ocWJcU3RD1jG8jFmpOeU7wO40c6A=; b=fvj4V4dYvMEO9DUFGeMrMD+gLy
 vGzwRqG6X13kViRNkQHTvSEhuaeQzBWsP0lxlydYy8I7dqybu33YTUTfRLFyaEjTMWJwZpkU6nnBf
 1q4jcQ17aX34e9TO9D1pdv6pcvCL/gegKpOlHqVPW+bdkm3UXi2ESeSeZL2yBy3bRVnbRwhaPMr9g
 M6xayiiS+stvWYSAnBBitM6+fVVE9K3d2yGN5ZEbk328f4fSp/Sw6Tgn/ag0CnFyXVWUCdH5qz1bQ
 uWYhfIRwTWFpqA4gTBuNb9xotmxkqYYJlyRMAbXSqm4CVtLZMLUaKedbZpSofzz0CuYRHdpVvPdV0
 PLusFdrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42072)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qd4Qy-0006Zd-0w;
 Mon, 04 Sep 2023 08:55:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qd4Qx-0002LJ-NQ; Mon, 04 Sep 2023 08:55:43 +0100
Date: Mon, 4 Sep 2023 08:55:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Ripard <mripard@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
Message-ID: <ZPWNf51FrqBfyM1O@shell.armlinux.org.uk>
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
 <wi2j43vzk3t55xc6ylvbekxqybnc62fqpx7v277d5htcqxrtxf@qya4mbky2y7l>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wi2j43vzk3t55xc6ylvbekxqybnc62fqpx7v277d5htcqxrtxf@qya4mbky2y7l>
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
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 09:36:10AM +0200, Maxime Ripard wrote:
> On Sun, Sep 03, 2023 at 04:53:42PM +0100, Russell King (Oracle) wrote:
> > On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that it
> > > won't be cleanly powered off at system shutdown time.
> > > 
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > > 
> > > This driver was fairly easy to update. The drm_device is stored in the
> > > drvdata so we just have to make sure the drvdata is NULL whenever the
> > > device is not bound.
> > 
> > ... and there I think you have a misunderstanding of the driver model.
> > Please have a look at device_unbind_cleanup() which will be called if
> > probe fails, or when the device is removed (in other words, when it is
> > not bound to a driver.)
> > 
> > Also, devices which aren't bound to a driver won't have their shutdown
> > method called (because there is no driver currently bound to that
> > device.) So, ->probe must have completed successfully, and ->remove
> > must not have been called for that device.
> > 
> > So, I think that all these dev_set_drvdata(dev, NULL) that you're
> > adding are just asking for a kernel janitor to come along later and
> > remove them because they serve no purpose... so best not introduce
> > them in the first place.
> 
> What would that hypothetical janitor clean up exactly? Code making sure
> that there's no dangling pointer? Doesn't look very wise to me.

How can there be a dangling pointer when the driver core removes the
pointer for the driver in these cases?

If I were to accept the argument that the driver core _might_ "forget"
to NULL out this pointer, then that argument by extension also means
that no one should make use of the devm_* stuff either, just in case
the driver core forgets to release that stuff. Best have every driver
manually release those resources. Nope, that doesn't work, because
driver authors tend to write buggy cleanup paths.

There are janitors that go around removing this stuff, and janitorial
patches tend to keep coming even if one says nak at any particular
point... and yes, janitors do go around removing this unnecessary
junk from drivers.

You will find examples of this removal in commit
ec3b1ce2ca34, 5cdade2d77dd, c7cb175bb1ef

Moreover:

7efb10383181

is also removing unnecessary driver code. Testing for driver data being
NULL when we know that a _successful_ probe has happened (because
->remove won't be called unless we were successful) and the probe
always sets drvdata non-NULL is also useless code.

If ultimately you don't trust the driver model to do what it's been
doing for more than the last decade, then I wonder whether you should
be trusting the kernel to manage your hardware!

Anyway, I've said no to this patch for a driver that I'm marked as
maintainer for, so at least do not make the changes I am objecting to
to that driver. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
