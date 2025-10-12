Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9170BD0A15
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 20:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059710E187;
	Sun, 12 Oct 2025 18:48:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DZGpI1Ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786FA10E187
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 18:48:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F5B94521A;
 Sun, 12 Oct 2025 18:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79030C4CEE7;
 Sun, 12 Oct 2025 18:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760294926;
 bh=cOrnDFV6qXfyhpfWj33oRaJEz5ZnXGKRMOEeTOdcbJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZGpI1Ua20DglBkzdZw0jkZorNwQdurfq3abfesjQLx+DUOtFLU9nHsdqtk4x3VHm
 h5m6t8yG6fIU7lUFfik+e2NaaReTTa16vWJF8FRQjcRc4vqNfOdd5as5h/6CwouLKb
 rik2chimNBNkdo4MG1gtuHzMXpJjb9qrhJnHakYG9mNr6PmO8kFnxJfM29jyp+Cswg
 E5WMl68ooxhV7G3gEcmWZ80fzKwi1XabH5n0YkrJmCpZ2FhrzVuJJJzlfoxd2RAZVM
 FtM6g/j7/uAzogOqHWJGuDSUfbcy6R+o2UazDy4XVBmh+dYe+u3Vd0CLJFjuk7+T/a
 fUeY5U2vV2a/g==
Date: Sun, 12 Oct 2025 11:47:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v10 2/4] PCI/VGA: Replace vga_is_firmware_default() with
 a screen info check
Message-ID: <20251012184717.GB3412@sol>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-3-superm1@kernel.org>
 <20251012182302.GA3412@sol>
 <1be1a119-1fbd-435f-bb27-70f48d677ebf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be1a119-1fbd-435f-bb27-70f48d677ebf@kernel.org>
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

On Sun, Oct 12, 2025 at 01:37:33PM -0500, Mario Limonciello wrote:
> 
> 
> On 10/12/25 1:23 PM, Eric Biggers wrote:
> > Hi,
> > 
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
> > 
> > Please revert.
> > 
> > - Eric
> 
> Can you please share more information about your issue before we jump
> straight into a revert?  What kind of hardware do you have?  Perhaps a
> kernel log from mainline and another from mainline with the revert could
> help identify what's going on?
> 
> A revert might be the right solution, but I would rather fix the issue if
> it's plausible to do so.

Relevant hardware is:
    AMD Ryzen 9 9950X 16-Core Processor
    Radeon RX 9070

The following message appears in the good log but not the bad log:

    fbcon: amdgpudrmfb (fb0) is primary device

I don't have CONFIG_SCREEN_INFO enabled, so the commit changed
vga_is_firmware_default() to always return false.

If DRM_AMDGPU depends on SCREEN_INFO now, it needs to select it.

- Eric
