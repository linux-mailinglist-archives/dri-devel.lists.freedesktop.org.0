Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE25A87A37
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AC710E4D4;
	Mon, 14 Apr 2025 08:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="poaIFy94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Mon, 14 Apr 2025 08:25:00 UTC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE2210E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:25:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E06943212;
 Mon, 14 Apr 2025 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744619097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMI+QJBZXFdwaOEwENZ/Wk7G4tgkYRiH7f6+ILsCAQ8=;
 b=poaIFy94nV/ZDFtWFFz/IhlAKQTc56qy9O2lmr9DKz7Ogo7mebp9fESIlxDMuPTmfvcOWd
 bgApjJNukM6+c9KmnIMZFunUkHpIBq8A8/JlBmY9OGhpcAcLPhWDaO4yaiNup+V+88LQiQ
 hDohe2thkdmiOZIMn8295bCaUFivcSUjKlQFJi3lqmLakNJkIVLJ6tPfnO/jf4qZ2SKqtD
 qXLiyDirqI+j0pzwCN/lI9Vssw81/NfShVSi5c6KU3Tj5BzWzxc66fqEc4ZlHGtGGuP/Oc
 QUmacvOMU5r2CoawdpddXHXxcMNhsiz5X8NkL3FJZBq0E6ZhmbLjnccYOlLdXQ==
Date: Mon, 14 Apr 2025 10:24:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Message-ID: <20250414102455.03331c0f@windsurf>
In-Reply-To: <Z_yjNgY3dVnA5OVz@infradead.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddttdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgedvjeehgeetgfeufffglefhkedvfeduveeiieelteeliedtfefguefggffhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegfeegmeelfhdtleemvdektddumeefsgelmeejsggtfhemheehleehmegvfhefvgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsu
 hhmihhtrdhsvghmfigrlheslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhgrrhhoqdhmmhdqshhigheslhhishhtshdrlhhinhgrrhhordhorhhg
X-GND-Sasl: thomas.petazzoni@bootlin.com
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

Hello Christoph,

On Sun, 13 Apr 2025 22:55:02 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Apr 10, 2025 at 04:53:17PM +0200, Bastien Curutchet wrote:
> > Hi all,
> > 
> > Many UIO users performing DMA from their UIO device need to access the
> > DMA addresses of the allocated buffers. There are out-of-tree drivers
> > that allow to do it but nothing in the mainline.  
> 
> In which case it does not matter at all for mainline.

It is impressive how "out-of-tree" triggers kernel maintainers, and
then end up not even reading what the patch series is all about (but I
forgive you, because it triggers me in the same way).

This patch series is NOT about adding new kernel APIs meant to be used
by out-of-tree drivers, which of course would be bad, and we would have
never proposed.

What this patch series is about is to add new user-space interface to
extend the existing UIO subsystem. What my colleague Bastien was
mentioning about out-of-tree drivers is that there are a LOT of
out-of-tree drivers extending UIO to allow user-space applications to
do DMA, and our proposal is that considering how many people need that
and implement ugly out-of-tree drivers to solve this issue, we suggest
the mainline kernel should have a built in solution.

Please re-read again, and realize that we are NOT adding new kernel
APIs for out-of-tree drivers.

> FYI the proper and safe way to do DMA from userspace is to use
> vfio/iommufd.

I am not sure how this can work in our use-case. We have a very simple
set of IP blocks implemented in a FPGA, some of those IP blocks are
able to perform DMA operations. The register of those IP blocks are
mapped into a user-space application using the existing, accepted
upstream, UIO subsystem. Some of those registers allow to program DMA
transfers. So far, we can do all what we need, except program those DMA
transfers. Lots of people are having the same issue, and zillions of
ugly out-of-tree solutions flourish all over, and we're trying to see
if we can constructively find a solution that would be acceptable
upstream to resolve this use-case. Our platform is an old PowerPC with
no IOMMU.

Note that the safety argument doesn't hold: UIO already allows to map
registers into user-space applications, which can already program DMA
transfers to arbitrary locations in memory. The safety comes from the
fact that such UIO devices are associated with permissions that the
system administrator controls, to decide which applications are safe
enough to be granted access to those UIO devices. Therefore, providing
access through UIO of the physical address of well-defined DMA buffers
properly allocated through a sane API is not reducing the safety of
anything compared to what UIO already allows today.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
