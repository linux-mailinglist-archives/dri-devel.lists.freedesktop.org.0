Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8418B1438
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C023F10E969;
	Wed, 24 Apr 2024 20:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dxuogYdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F7110E969
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 20:12:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73FB9CE182F;
 Wed, 24 Apr 2024 20:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB87C113CD;
 Wed, 24 Apr 2024 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713989558;
 bh=2Dj97MqB0+KxSUpFoSn5vPI5paGeISoPys0v4rngQK0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=dxuogYdE8Ogd4lUlvyAT+sHHTarFFWfuxlSxa2pzl+W+XCxzQa35pR8eENXgHkTVw
 yHH8e15VPFYJb7zvfxIefVyS0+NrTGFAr8VapDkdspYAFZUrxbbjoX0PDf/5mQzNIG
 zlJezJ2N5tkTil3iGXVoJUE0atjSwar0qE65RG6IfpDgKV/flhymiDbFHjqay9BuVe
 XVz8b58UOyipf1ZbfPFc8GvbmaNZFySxAxJAQuUGdBqR6JZ38X+8eKaTnumZJTR1a+
 xW1t0Iz60W3pYNZ20GoQkxdpcX3Q8fnBM6a27nJ76PEIJd6qpyUN/oppprwTG9VxuY
 iqed37IeeSyZQ==
Date: Wed, 24 Apr 2024 15:12:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 04/10] PCI: Make devres region requests consistent
Message-ID: <20240424201236.GA504035@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408084423.6697-5-pstanner@redhat.com>
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

On Mon, Apr 08, 2024 at 10:44:16AM +0200, Philipp Stanner wrote:
> Now that pure managed region request functions are available, the
> implementation of the hybrid-functions which are only sometimes managed
> can be made more consistent and readable by wrapping those
> always-managed functions.
> 
> Implement a new pcim_ function for exclusively requested regions.
> Have the pci_request / release functions call their pcim_ counterparts.
> Remove the now surplus region_mask from struct pci_devres.

This looks like two patches; could they be separated?

  - Convert __pci_request_region() etc to the new pcim model

  - Add pcim_request_region_exclusive()

IORESOURCE_EXCLUSIVE was added by e8de1481fd71 ("resource: allow MMIO
exclusivity for device drivers") in 2008 to help debug an e1000e
problem.  In the 16 years since, there's only been one new PCI-related
use (ne_pci_probe()), and we don't add a user of
pcim_request_region_exclusive() in this series, so I would defer it
until somebody wants it.

Bjorn
