Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26EBD64AB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 22:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3B10E51B;
	Mon, 13 Oct 2025 20:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T5G5vHFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1AC10E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 20:55:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC7BE61EC4;
 Mon, 13 Oct 2025 20:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F502C4CEF8;
 Mon, 13 Oct 2025 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760388932;
 bh=IvZ5qPiJg4nsDInLimGBW6RVw9VdP4KCLc7lgSkyw10=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=T5G5vHFPwfAcHGzeDU91/NjU01oUDsKPTDIGWz+CamLMXtBTA5Iq/VDCzC86z8O5G
 79eKJ6WSDySyqA8FnEkp2QPNZr7rAiG7sbf74nRlQJ5IplElaiw5Q0NsA/uaYME0vr
 h6NW3fvu/dXA20Ydzib4rccOLFEHYe84IsaxZaqmMNzrkeW1+YZ/oKcsUbIpJ5zJEE
 xMdeP7LroxWj7ZUKYcplqw2BTHjfY6HEkSu9khTaioRfgwN379LKCoKsUa+hsdlxYS
 0S98arvkgF7hwNRckqPnF49sJlU/u8Ah7tQAqz4nWY5EsbF2hGH7RAxyh7fLJkNhdr
 ozG+/vvFuNj1w==
Date: Mon, 13 Oct 2025 15:55:31 -0500
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
Message-ID: <20251013205531.GA863704@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012182302.GA3412@sol>
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

[+cc regressions]

On Sun, Oct 12, 2025 at 11:23:02AM -0700, Eric Biggers wrote:
> On Mon, Aug 11, 2025 at 11:26:04AM -0500, Mario Limonciello (AMD) wrote:
> > vga_is_firmware_default() checks firmware resources to find the owner
> > framebuffer resources to find the firmware PCI device.  This is an
> > open coded implementation of screen_info_pci_dev().  Switch to using
> > screen_info_pci_dev() instead.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> I'm getting a black screen on boot on mainline, and it bisected to this
> commit.  Reverting this commit fixed it.

#regzbot introduced: 337bf13aa9dd ("PCI/VGA: Replace vga_is_firmware_default() with a screen info check")
#regzbot link: https://lore.kernel.org/r/20251013154441.1000875-1-superm1@kernel.org
