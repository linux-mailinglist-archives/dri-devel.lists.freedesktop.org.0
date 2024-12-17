Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3304A9F49A1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BE110E10E;
	Tue, 17 Dec 2024 11:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="CkhRfWme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1177 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2024 11:11:49 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1093E10E10E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=pKIaSLMgzRitaeQqeBKxAj8nc5TyrOFd+OEeRdGYXPE=; b=CkhRfWmeWxL/5x2HeV77SFNevT
 xWGadKHW6ILfP+HFgtZY4mAyhk4hUPYV3TrbmIEorvoe0uU3PvgqsQiQgEfXK+R0yFwly3kMrPR5E
 8xd8/6tYYfb9dvrA44DbPxuqGO1wIcIeu8R/MOTqh0waxkni6idzCvdtPIlbA49oBMR8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tNVBP-000vL6-UP; Tue, 17 Dec 2024 11:52:07 +0100
Date: Tue, 17 Dec 2024 11:52:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Avri Kehat <avri.kehat@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 ogabbay@kernel.org, oshpigelman@habana.ai, sgoutham@marvell.com,
 zyehudai@habana.ai
Subject: Re: [PATCH 06/15] net: hbl_cn: debugfs support
Message-ID: <ce20fa38-0949-47fe-8c2f-635f761479f1@lunn.ch>
References: <b40391d5-66d2-44be-bc83-4ac3b7bcfe08@lunn.ch>
 <20241217100039.79132-1-avri.kehat@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217100039.79132-1-avri.kehat@intel.com>
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

On Tue, Dec 17, 2024 at 12:00:39PM +0200, Avri Kehat wrote:
> Revisiting the comments regarding our use of debugfs as an interface for device configurations -
> A big part of the non-statistics debugfs parameters are HW related debug-only capabilities, and not configurations required by the user.
> Should these sort of parameters be part of devlink as well?
> Is there another location where debug related configurations for development can reside in?

There are a few options:

If the user does not require them, don't even implement them. If the
user is not using them, who is?

Implement them in an out of tree patch, which your development team
can use, since these are not user configuration options.

devlink is a possibility, but developers complain it is slow to get
them merged since we want to understand what the configuration option
does, why would i want to use it, would any other vendor have the same
need, and should it be made generic etc.

You could join those asking for fwctl, which is a contentious subject.

	Andrew
