Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EEA37F8F1
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 15:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DD56E890;
	Thu, 13 May 2021 13:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840E16E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 13:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LETaaoQDm7+0SUJrdU0yq+SGacSDpz8UZ3z+Vo+OGjU=; b=dYoo2xXkTGJt7WrVetpgLQraf
 KQGcupC85h8uFfPHXI0vqaxv1TaqLx6btwHo9I7FUX7rz3qN8VncxmqpgXJYCTlN9zHy1tH9HQiH+
 N8gPwHgCE/3qrCqVa8LDl5G6icWFurrwJzRF5x3rfgBUYtVlsxSEQUYhB8ewIaTvrpqb4qCRuZhXa
 U1GAbBVF03kSx/FTz3xtchEF6/NsewE0zugMJ8RuVj+ZCMy9caAYckWXOSkJNCqvHLzwZjpDaCXpu
 wMGfADf81YNw8kX/YCeBmngudJlJ+bR+Q+L6Sij2qeDZu8lXPw+LCkkxc/O2u2GiN5nvmHH9bdY+z
 fLQTsEFNA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43932)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lhBZZ-0006Du-FM; Thu, 13 May 2021 14:40:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lhBZY-00033J-3L; Thu, 13 May 2021 14:40:16 +0100
Date: Thu, 13 May 2021 14:40:16 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] component: Move host device to end of device lists on
 binding
Message-ID: <20210513134016.GY1336@shell.armlinux.org.uk>
References: <20210508074118.1621729-1-swboyd@chromium.org>
 <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJlZwYS+oH7W5WjO@phenom.ffwll.local>
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 06:05:21PM +0200, Daniel Vetter wrote:
> Entirely aside, but an s/master/aggregate/ or similar over the entire
> component.c codebase would help a pile in making it easier to understand
> which part does what. Or at least I'm always terribly confused about which
> bind binds what and all that, so maybe an additional review whether we
> have a clear split into aggregate and individual components after that
> initial fix is needed.

I'm not entirely sure what you mean "which bind binds what".

The component helper solves this problem:

We have a master or aggregate device representing a collection of
individual devices. The aggregate and individual devices may be probed
by the device model in any order. The aggregate device is only complete
once all individual and aggregate devices have been successfully probed.

It does this by tracking which devices are present, and only when they
are all present does it call the bind() operation. Conversely, if one
happens to be removed, it calls the unbind() operation. To me, that's
very simple.

When we start talking about PM, the original idea was for the aggregate
device to handle that. However, DRM/OF has pushed to change the model a
bit such that the aggregate device is created as a platform device when
we detect the presence of one of the individual devices.

I suspect what we actually want is something that, when the first
individual device gets notified of a transition to a lower power mode,
we want to place the system formed by all the devices into a low power
mode. Please realise that it may not be appropriate for every
individual device to be affected by that transition until it receives
its own PM call.

> One question I have: Why is the bridge component driver not correctly
> ordered wrt the i2c driver it needs? The idea is that the aggregate driver
> doesn't access any hw itself, but entirely relies on all its components.

As far as I'm aware, bridge was never converted to use any component
stuff, so I'm not sure what you're referring to.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
