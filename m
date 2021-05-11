Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6737A9E5
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 16:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E816EA56;
	Tue, 11 May 2021 14:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 560 seconds by postgrey-1.36 at gabe;
 Tue, 11 May 2021 14:52:02 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7236EA63
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpdWWPVwCDuLCQx48KbKcWauncgjWTUPNT/nkVmSq+A=; b=SY5mhMbtH/IaXs+wEFCoh9Q0X
 ZO+jjAzbV+jlgKtzJuoZZo4GheG7V8l45AD1VbRUJqjpjOCYgny5YoGeu0kE8U4+LQ+hgKqQePbrY
 sjfUDxWO/whyJLJAnJOmyl/6SNY6649Q9L4PeWoMAZ5DePOAssq0DZz1w45ZBHJmbohyNzZZt+RoG
 FePwHQQmmNwoLeniH4L60tglhKGP0W/bx5qe/485ze5uQpHyIU0wy/VM52nLQAJMqJ4oz2wlsjdmD
 xLsXIfraewgVZNVNRMbSXRODnM49GoPQOLv3uh1nmPz9vNMewplbOiFxZDdoGEUnjEgVujSb+0l9V
 xWBg6znvg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43862)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lgTan-0002k7-NT; Tue, 11 May 2021 15:42:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lgTan-0001AK-3C; Tue, 11 May 2021 15:42:37 +0100
Date: Tue, 11 May 2021 15:42:37 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
Message-ID: <20210511144236.GL1336@shell.armlinux.org.uk>
References: <20210508074118.1621729-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508074118.1621729-1-swboyd@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 08, 2021 at 12:41:18AM -0700, Stephen Boyd wrote:
> Within the component device framework this usually isn't that bad
> because the real driver work is done at bind time via
> component{,master}_ops::bind(). It becomes a problem when the driver
> core, or host driver, wants to operate on the component device outside
> of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
> driver core doesn't understand the relationship between the host device
> and the component devices and could possibly try to operate on component
> devices when they're already removed from the system or shut down.

You really are not supposed to be doing anything with component devices
once they have been unbound. You can do stuff with them only between the
bind() and the unbind() callbacks for the host device.

Access to the host devices outside of that is totally undefined and
should not be done.

The shutdown callback should be fine as long as the other devices are
still bound, but there will be implications if the shutdown order
matters.

However, randomly pulling devices around in the DPM list sounds to me
like a very bad idea. What happens if such re-orderings result in a
child device being shutdown after a parent device has been shut down?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
