Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D9143D97
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 14:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E0F6ECD7;
	Tue, 21 Jan 2020 13:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4336ECD7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MIW1a1CzdzcRBKcD9gTvgSedoGDPOuKCDCTKx1yi8/I=; b=tQtN4IdeDDjJluRJEDxx6qRjy
 aKKTYwoJ8e/flf0xfU9SX2MxmDxP4hyzo/wN4btmpSwSh2FWxqjT4yQLV2lP/ofnd7UsuXJpf7MxV
 by72E3J1keyyZ0e7pzurn9uXxSyHoEiSSPAyPKkegrxFHbLUyq6KBpoh8qsFN/BpuakdXG/FaqfON
 NL87FSdLt12y0mxnnFcXhhbMgNjsD7GVWeaV/HqICX0vYeOQxxkZTdlzMq4UQYbhwQsvWq0zESjKU
 LR3z0e1oMV+DQDDFRfd1c+mh+hIvqm2y/h8zPXXswSBb6mk/h1hmbAFOWR/7HZmA6dyTBvIgigr7D
 c1Lm4Qy/Q==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:57886)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1ittB9-0004iM-8Q; Tue, 21 Jan 2020 13:02:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1ittB4-0003qO-3m; Tue, 21 Jan 2020 13:02:42 +0000
Date: Tue, 21 Jan 2020 13:02:42 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] drm/etnaviv: only reject timeouts with tv_nsec >= 2
 seconds
Message-ID: <20200121130241.GG25745@shell.armlinux.org.uk>
References: <20200121114553.2667556-1-arnd@arndb.de>
 <20200121125546.GA71415@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121125546.GA71415@bogon.m.sigxcpu.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 01:55:46PM +0100, Guido G=FCnther wrote:
> Hi,
> On Tue, Jan 21, 2020 at 12:45:25PM +0100, Arnd Bergmann wrote:
> > As Guido G=FCnther reported, get_abs_timeout() in the etnaviv user space
> > sometimes passes timeouts with nanosecond values larger than 1000000000,
> > which gets rejected after my first patch.
> > =

> > To avoid breaking this, while also not allowing completely arbitrary
> > values, set the limit to 1999999999 and use set_normalized_timespec64()
> > to get the correct format before comparing it.
> =

> I'm seeing values up to 5 seconds so I need
> =

>      if (args->timeout.tv_nsec > (5 * NSEC_PER_SEC))

I assume you're looking at 64-bit, but I suspect userspace needs
looking at considering 32-bit.  If userspace uses a 32-bit tv_nsec
anywhere in the path that it attempts to pass up to 5 seconds in
tv_nsec, then this will fail to pass the correct timeout.

If that is the case, userspace is buggy, and needs fixing not to
pass such large values through tv_nsec irrespective of this issue.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
