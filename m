Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1CB8BC078
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 15:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFD810FF65;
	Sun,  5 May 2024 13:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DyFIsDIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0E510FEF0;
 Sun,  5 May 2024 13:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4884360BA0;
 Sun,  5 May 2024 13:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E851C113CC;
 Sun,  5 May 2024 13:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714914588;
 bh=xlRUYoJPou2/MPpAB5hzWLpalR+ZAUvBv9HmZG5I9+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DyFIsDIcBCXPdf5m999VIskZIZ3Ju5s8JfJ7pbM8DKPrNCCZI9ot8LqlAFcA7zGeH
 xEfZUHP+pTYlQEqLs5pArOYOcT/l+a+8A+7Li6FYOIOb0T0Q92zUCdc02p38J1kKkN
 fGz+U2FNMt6C6ocJrCG3jWrFuT2kSuaQOuVPdsE/3Xt5+iiIhD2KTKWkyHVbirLHfh
 32cMVlj5dqsjTbb6WCnYlM6luqPotng5VtG5kZVmmJPSVMiRB1wsc8tj4jsVypNjmR
 0qe5FzwC3I1L1tkbGk2SvbABZQgkwvc244O3J4xGB0zePEAC4wEw7a2mGw3vkLSbks
 1+K3E3asdqGhg==
Date: Sun, 5 May 2024 16:09:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lukas Wunner <lukas@wunner.de>,
 Dean Luick <dean.luick@cornelisnetworks.com>
Subject: Re: [PATCH 3/3] RDMA/hfi1: Use RMW accessors for changing LNKCTL2
Message-ID: <20240505130945.GB68202@unreal>
References: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
 <20240215133155.9198-4-ilpo.jarvinen@linux.intel.com>
 <26be3948-e687-f510-0612-abcac5d919af@linux.intel.com>
 <20240503130416.GA901876@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503130416.GA901876@ziepe.ca>
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

On Fri, May 03, 2024 at 10:04:16AM -0300, Jason Gunthorpe wrote:
> On Fri, May 03, 2024 at 01:18:35PM +0300, Ilpo Järvinen wrote:
> > On Thu, 15 Feb 2024, Ilpo Järvinen wrote:
> > 
> > > Convert open coded RMW accesses for LNKCTL2 to use
> > > pcie_capability_clear_and_set_word() which makes its easier to
> > > understand what the code tries to do.
> > > 
> > > LNKCTL2 is not really owned by any driver because it is a collection of
> > > control bits that PCI core might need to touch. RMW accessors already
> > > have support for proper locking for a selected set of registers
> > > (LNKCTL2 is not yet among them but likely will be in the future) to
> > > avoid losing concurrent updates.
> > > 
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > > Reviewed-by: Dean Luick <dean.luick@cornelisnetworks.com>
> > 
> > I found out from Linux RDMA and InfiniBand patchwork that this patch had 
> > been silently closed as "Not Applicable". Is there some reason for
> > that?
> 
> It is part of a series that crosses subsystems, series like that
> usually go through some other trees.

Exactly, this is why I marked it as "Not Applicable".

> 
> If you want single patches applied then please send single
> patches.. It is hard to understand intent from mixed series.
> 
> Jason
