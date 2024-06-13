Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47E907DD0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2DA10EBA4;
	Thu, 13 Jun 2024 21:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BYPR2Ky4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0C110EB9C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:06:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CCCD61D22;
 Thu, 13 Jun 2024 21:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54530C2BBFC;
 Thu, 13 Jun 2024 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718312776;
 bh=dZba39hnCowmc0pZmrIXvEi2zoYdUdHjuntIBlNjS8E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BYPR2Ky4Du7wsrS+bltF98D9HrMCtHL4ExMmzEOpEKnRxdTDqkwRpQ4yPby6cTU01
 q//gRWX7lSxAEigiQ9CqUrSw9S+kAnm7PZQkUkr0P0IElkYBWjHJhX9sB/NnGi7FpD
 yRipPbdfd9g+pIAc8AdvuxAPNwCIQ33vTGpzwnvDhjyGmbDDzxjk0363KxJWVEKZxy
 48UF8xEmOVWq5Z/Dktpf4n8oR8X5nr9bo3za1TYgAN0DYd4/hata3qOKou2/yKPke6
 mKPhASsvQ2J9zWml1w0GqcX/YxG1jV8NdKx6v5TWPccjnXWMInKgB8sN02iUOpK5RC
 E2e7d80jw9jmA==
Date: Thu, 13 Jun 2024 16:06:14 -0500
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
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Message-ID: <20240613210614.GA1081813@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613115032.29098-11-pstanner@redhat.com>
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

On Thu, Jun 13, 2024 at 01:50:23PM +0200, Philipp Stanner wrote:
> pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> sometimes managed, sometimes not). Providing a separate pcim_intx()
> function with its own device resource and cleanup callback allows for
> removing further large parts of the legacy PCI devres implementation.
> 
> As in the region-request-functions, pci_intx() has to call into its
> managed counterpart for backwards compatibility.
> 
> As pci_intx() is an outdated function, pcim_intx() shall not be made
> visible to drivers via a public API.

What makes pci_intx() outdated?  If it's outdated, we should mention
why and what the 30+ callers (including a couple in drivers/pci/)
should use instead.

Bjorn
