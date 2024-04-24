Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ACD8B143B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 22:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE7112073;
	Wed, 24 Apr 2024 20:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kVnkFev/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5F2112073
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 20:12:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E8D960EAD;
 Wed, 24 Apr 2024 20:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91507C113CD;
 Wed, 24 Apr 2024 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713989575;
 bh=Z31A8N0qW+ZyGJx8PwhBZp2nsGK8UYpFU7rmbakzEfc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=kVnkFev/TiZTySQUl4vTE3gALeCYbONHxzH+MJibn9p60uXTGAbHlT7Jm6T0LG431
 AldHO2UoU3LA5UJeDdQzsDqD9ANeyL18Kd4+nM3DN2TcLuwwN6AMDbGAC53CjtSJVe
 hM41diZx+HhF+/tTHMHdssvTCmJKfH7YJNyX6N2LNbi4kULJH5B6z4rCjH9vQFfFk+
 suMwe50kS0IvOjRmKeECTqlxEWiev8IXU1GzRq6klc7ukkDdEl6tC3WPQ3EScIHpQJ
 6DLftMO+cXRHN4hs5bWTflXQ99tX07tk8z1bJ7BmW9V4sS9tf+UL7iT4fU4U9Jly52
 ji6qGFJSyN5bQ==
Date: Wed, 24 Apr 2024 15:12:53 -0500
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
Subject: Re: [PATCH v6 03/10] PCI: Warn users about complicated devres nature
Message-ID: <20240424201253.GA499493@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408084423.6697-4-pstanner@redhat.com>
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

On Mon, Apr 08, 2024 at 10:44:15AM +0200, Philipp Stanner wrote:
> The PCI region-request functions become managed functions when
> pcim_enable_device() has been called previously instead of
> pci_enable_device().
> 
> This has already caused bugs by confusing users, who came to believe
> that all pci functions, such as pci_iomap_range(), suddenly are managed
> that way.

Since you mention a bug, it'd be nice to include a URL or commit if
you have one.

> This is not the case.
> 
> Add comments to the relevant functions' docstrings that warn users about
> this behavior.

> @@ -3914,6 +3916,13 @@ EXPORT_SYMBOL(pci_release_region);
>   *
>   * Returns 0 on success, or %EBUSY on error.  A warning
>   * message is also printed on failure.
> + *
> + * NOTE:
> + * This is a "hybrid" function: Its normally unmanaged, but becomes managed
> + * when pcim_enable_device() has been called in advance.
> + * This hybrid feature is DEPRECATED! If you need to implement a new pci
> + * function that does automatic cleanup, write a new pcim_* function that uses
> + * devres directly.

This note makes sense on exported functions, but I think it's overkill
on static ones like this.

s/Its normally/It's normally/
s/new pci/new PCI/

Rewrap into one paragraph (or separate by blank line).

Applies to all the hunks of this patch.

>  static int __pci_request_region(struct pci_dev *pdev, int bar,
>  				const char *res_name, int exclusive)
