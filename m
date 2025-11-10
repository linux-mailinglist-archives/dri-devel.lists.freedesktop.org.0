Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5CBC49AD0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 00:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B91D10E32F;
	Mon, 10 Nov 2025 23:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fq25NlIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D24E10E0F7;
 Mon, 10 Nov 2025 23:00:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 267E144289;
 Mon, 10 Nov 2025 23:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D6EC116B1;
 Mon, 10 Nov 2025 23:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762815601;
 bh=BujzcxiDCu1XUvYvuSazspHPPX6uO2Q49KTJHCnBteM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Fq25NlIcNfb7ZrirU5L6qzWU2I/qH/CWKW/w8OQC2ZXdZNuXWy0/pVOpyDz+PppPs
 3cnnoS0+U7zqxefMGHK+GcEJ1bPvMoc9WS5T/PFJNOdssnEq8A1E4C/BY8kNYJO98f
 YAfdrTMd2JgFSj+9TM8Va4dY/j+X06X1GOXnZDGrWg3G4JdxW+BZrft8hp8xxrEbtN
 a1v++eycBKbmZ0FpC1z3pgSkWip7JeVzveINO/Tl8Sc09OVUpiRhUagLR5vm58ignH
 7BjniRQXXNFTzb/SlajwviaVC9iw2kmcUH4O/at9YIK46ab2ZALQt8lHOIBaXVqYGS
 0zWwumfG8/b8w==
Date: Mon, 10 Nov 2025 16:59:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] PCI: Prevent resource tree corruption when BAR
 resize fails
Message-ID: <20251110225958.GA2142254@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d697c9e1-580e-6449-796c-a3f5198e0934@linux.intel.com>
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

On Thu, Oct 30, 2025 at 10:22:27AM +0200, Ilpo Järvinen wrote:
> On Wed, 29 Oct 2025, Bjorn Helgaas wrote:
> 
> > On Tue, Oct 28, 2025 at 07:35:43PM +0200, Ilpo Järvinen wrote:
> > > pbus_reassign_bridge_resources() saves bridge windows into the saved
> > > list before attempting to adjust resource assignments to perform a BAR
> > > resize operation. If resource adjustments cannot be completed fully,
> > > rollback is attempted by restoring the resource from the saved list.
> > 
> > > Fixes: 8bb705e3e79d ("PCI: Add pci_resize_resource() for resizing BARs")
> > > Reported-by: Simon Richter <Simon.Richter@hogyros.de>
> > > Reported-by: Alex Bennée <alex.bennee@linaro.org>
> > 
> > If these reports were public, can we include lore URLs for them?
> > 
> > Same question for [PATCH 5/9] PCI: Fix restoring BARs on BAR resize
> > rollback path.
> > 
> > I put these all on pci/resource for build testing.  I assume we'll
> > tweak these based on testing reports and sorting out the pci/rebar
> > conflicts.
> 
> Thanks, the links will come in v2 along with fixing a few things found by 
> more extensive tests by LKP. E.g., it seems clang thinks guard() cannot be 
> used here because goto jumps over it (auto variable initialization gets 
> skipped so it's kind of understandable limitation).

Just a ping on this.  The lkp robot did build this fine:
https://lore.kernel.org/r/202510311139.1VIkw3Ez-lkp@intel.com

I'm happy to put it in pci/next as-is, especially if the amdgpu and
i915 folks are ok with it.
