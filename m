Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857E913BE8
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 17:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0042B10E224;
	Sun, 23 Jun 2024 15:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="d62+5SzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E2010E224
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=lAeNiNN7T2hP3j1rcbWFTsr6hZ4Ct1xVTB5elrFogu0=; b=d62+5SzZZhGQ0EO4TWRU14lMaj
 bsfy0dl0rM/dFmE0iwO9Opswh8k5s9z7Jqd2x5l2OYfHO/UHdR2TViD+PyC955fd4ssnXwLx2GPVx
 J0BNIWFxZZVRYc+/sgXK5zI6jhz3wk6WzkfxyIxfxrlm/LnYaiSnZ/1DLuEJN5oC2nxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sLOjs-000mnd-Ez; Sun, 23 Jun 2024 17:02:44 +0200
Date: Sun, 23 Jun 2024 17:02:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Message-ID: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
 <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
 <a1a3bafb-c64e-4960-a826-f49d4679d7a0@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1a3bafb-c64e-4960-a826-f49d4679d7a0@habana.ai>
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

> > If there is no netdev, what is the point of putting it into loopback?
> > How do you send packets which are to be looped back? How do you
> > receive them to see if they were actually looped back?
> > 
> > 	Andrew
> 
> To run RDMA test in loopback.

What is special about your RDMA? Why do you need something which other
vendors don't? Please solve this problem for all RDMA devices, not
yours.

This all part of the same thing with respect to module
parameters. Vendors would add module parameters for something. Other
vendors would have the same concept, but give it a different name,
different values. It was all poorly documented. You had to read the
kernel sources to figure out what kernel module parameters do. Same
goes for debugfs, driver values in /proc, /sysfs or /debugfs. So for
years we have been pushing back on things like this.

If you have something which is unique to your hardware, no other
vendor is ever going to have the same, then you can make an argument
for something driver specific in /debugfs. But RDMA loopback tests is
clearly not specific to your driver. Extend the KAPI and tools to
cover this, document the KAPI, write the man page, and let other
vendors implement the little bit they need in their driver, so users
have a uniform way of doing things over a rather of devices.

You will get a lot of pushback on everything in /debugfs, so please
review them all with this in mind.

       Andrew
