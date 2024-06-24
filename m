Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA8914634
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0757F10E3CB;
	Mon, 24 Jun 2024 09:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HoZd/vEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8D10E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:22:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 468CDCE1003;
 Mon, 24 Jun 2024 09:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A8FC2BBFC;
 Mon, 24 Jun 2024 09:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719220931;
 bh=002yBRgSFu/CHEstMDbsYVZPqrpw0FyS58gS7blKuso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HoZd/vENI49T0cdteZWrOm3AF7CqRqtk3mQ+5VeD4C7vK0JCqbm7ZmTMbmvuRgQHk
 8VMgRV1RbwUMdnC2jdnRy5KbEqQqVk2TcbqimQxw6xDfCWqf4HCTf8DisCiqO+sGyd
 xyc3nCoCiUYr9fr5fiYJINL4URfe1Cm5xO8iCQF4YccQ8qoGMFclXzBEl2v9rq9wZr
 /H6E36FzN6l5MIHgGVlBEKL8RXEc7fy5cPSXG1BqLF6UIhki35Secdf8AufhHSRjXg
 0HGKSL2OxjkFJ2CZ48CMVKScN1C/ujDQnFHNCRHOCr2Cgnm5rW0/xAiKDRrIKyX7yq
 /7VQ4YEjtwfoQ==
Date: Mon, 24 Jun 2024 12:22:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Omer Shpigelman <oshpigelman@habana.ai>,
 Sunil Kovvuri Goutham <sgoutham@marvell.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Message-ID: <20240624092207.GC29266@unreal>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
 <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
 <a1a3bafb-c64e-4960-a826-f49d4679d7a0@habana.ai>
 <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
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

On Sun, Jun 23, 2024 at 05:02:44PM +0200, Andrew Lunn wrote:
> > > If there is no netdev, what is the point of putting it into loopback?
> > > How do you send packets which are to be looped back? How do you
> > > receive them to see if they were actually looped back?
> > > 
> > > 	Andrew
> > 
> > To run RDMA test in loopback.
> 
> What is special about your RDMA? Why do you need something which other
> vendors don't? Please solve this problem for all RDMA devices, not
> yours.

I'm not aware of anything special here, which require special treatment.
All RDMA devices support loopback natively and can "put" traffic from
their TX directly to their RX. This is how we can run RDMA tests, which
are part of rdma-core https://github.com/linux-rdma/rdma-core/tree/master/tests.

Thanks
