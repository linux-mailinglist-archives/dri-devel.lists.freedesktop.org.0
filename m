Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF1C173B1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06310E691;
	Tue, 28 Oct 2025 22:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VYvPmfuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C20610E691
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 22:50:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13BAC442F9;
 Tue, 28 Oct 2025 22:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC911C4CEE7;
 Tue, 28 Oct 2025 22:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761691852;
 bh=L4JGtdU/PjFb6Mg5UZQwW4ZifK4zb8fU7qiihyPidzU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VYvPmfuFIwFFKG0xW/1zwOngMDq86wzK9/tYYY0jF6socm+7UDjazsfo+RKrQGNj3
 bqQpVnsv7SPg53gOiJ97C5sHiV1B0REEuPmCZ4a5VBdkKMMxWvcfX1PAp1GX9xe8XW
 +o9xN6ly3PCh9M458Y4kwg8QF/0/88xgcB9TEJPr7tv1G8lz+WZIuv5abkqjtY1oWR
 zOmdQ0vAw5S+OHOrbf1wVoZkZu3uPgYaIRJUWMlyy/ElBgvwO+PTjMtbx1oA8zps/9
 EN5SWWq9Jm7qAFEqxrjkawtNtnwHW1LpDTkx/EVmIp5qwJlhpu69jDv/RDZ3rKqgpg
 ISO2lDrXKNKGQ==
Date: Tue, 28 Oct 2025 17:50:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, regressions@lists.linux.dev
Subject: Re: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with
 a screen info check
Message-ID: <20251028225051.GA1539380@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013205531.GA863704@bhelgaas>
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

On Mon, Oct 13, 2025 at 03:55:31PM -0500, Bjorn Helgaas wrote:
> On Sun, Oct 12, 2025 at 11:23:02AM -0700, Eric Biggers wrote:
> > On Mon, Aug 11, 2025 at 11:26:04AM -0500, Mario Limonciello (AMD) wrote:
> > > vga_is_firmware_default() checks firmware resources to find the owner
> > > framebuffer resources to find the firmware PCI device.  This is an
> > > open coded implementation of screen_info_pci_dev().  Switch to using
> > > screen_info_pci_dev() instead.
> > > 
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > 
> > I'm getting a black screen on boot on mainline, and it bisected to this
> > commit.  Reverting this commit fixed it.
> 
> #regzbot introduced: 337bf13aa9dd ("PCI/VGA: Replace vga_is_firmware_default() with a screen info check")
> #regzbot link: https://lore.kernel.org/r/20251013154441.1000875-1-superm1@kernel.org

#regzbot fix: a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
