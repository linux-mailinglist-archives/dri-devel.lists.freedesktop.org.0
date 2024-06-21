Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1D912AFF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 18:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE2210F331;
	Fri, 21 Jun 2024 16:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="J8aZzq+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6225C10F331
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=9Y6negZVZePySlebIwaToYMdqW9+ah2eSR4eJJzPrvo=; b=J8aZzq+OXu0RL24rErzEnS1FDi
 I73XkOMYZGGvEhGnfqi4Mvbeqe0S0Ia3YzVmdG2T5D1neiS31c1dFDbV1lyDrfzUhgpqyNS76cVku
 u8LgtXxd3H+OS0uIzQmCjaWcg90e1HNp3gFeQ/HkndduyMy3GJ4CN518V/zXrFT//OUo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKgGo-000gLU-Bv; Fri, 21 Jun 2024 17:33:46 +0200
Date: Fri, 21 Jun 2024 17:33:46 +0200
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
Message-ID: <060ac3a6-bbac-400c-bfd9-cb1a32c653b4@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
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

> I see other vendors have debugfs entries for debug configurations or
> settings, not just for dumping debug info.

Did you see any added in the last few years? This is also something
DaveM pushed back on. We want uniform APIs so that all devices look
alike. Please consider what you are exporting here, how it should
cleanly fit into ethtool, devlink, etc, and expand these APIs to cover
your needs.

> 
> >> +What:           /sys/kernel/debug/habanalabs_cn/hbl_cn<n>/nic_mac_loopback
> > 
> > Why not use ethtool ?
> >
> 
> We have an ethtool option for that, but we have also internal NIC ports
> that are not exposed as netdevices and for them the ethtool path is
> irrelevant. Hence we need this debugfs option as well.

If there is no netdev, what is the point of putting it into loopback?
How do you send packets which are to be looped back? How do you
receive them to see if they were actually looped back?

	Andrew
