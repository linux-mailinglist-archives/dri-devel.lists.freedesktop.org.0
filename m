Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB182F449
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 19:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EFB10E59E;
	Tue, 16 Jan 2024 18:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C2510E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 18:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 49CB0CE1A5D;
 Tue, 16 Jan 2024 18:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB2FC433F1;
 Tue, 16 Jan 2024 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705429785;
 bh=QyGcrPCsH5mWKeg5veqXTGBrCMU5whrzG0xwiht42Ho=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tFoyXt9kT1rTsYtkOnwMFL1QYGCE/KuqoqnKJWZHglwRNZHtacgndtF8KDNZi9VTp
 mmVJzQUf3ZPZ5QUJ/F8imfU84MNAE5cC3JtaOJYDnYotRRJNILzhBjZ8rzqZ6ydORc
 aspbtRFkOtBBt6cZdyAdF5ixsMVOpItx3R6/UtubYM5GLLFAbafL0I0jJ0TtuwnKn5
 jNG2mSJBHe8FqVmOAJiwpYkiuK9bZyu4SMncNDE3SpMj0iuJQZ4ooov5mbITZp3CBt
 bAuaVoQdsAi1Ie5Ycpyiu3o7r2v2wnjwpl7saN3YQ0rP4z3bVgfYh1+vM+/XFZ4weo
 Rz//p/WpwIpbg==
Date: Tue, 16 Jan 2024 12:29:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH 00/10] Make PCI's devres API more consistent
Message-ID: <20240116182943.GA101377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner wrote:
> ...

>   pci: add new set of devres functions
>   pci: deprecate iomap-table functions
>   pci: warn users about complicated devres nature
>   pci: devres: make devres region requests consistent
>   pci: move enabled status bit to pci_dev struct
>   pci: move pinned status bit to pci_dev struct
>   pci: devres: give mwi its own callback
>   pci: devres: give pci(m)_intx its own callback
>   pci: devres: remove legacy pcim_release()
>   drm/vboxvideo: fix mapping leaks

If/when you update these, take a look at the drivers/pci/ subject line
history and capitalize these to match.

We haven't really used the "devres" prefix in drivers/pci.

The de facto convention is:

  - "PCI/AER:" for major features defined by the PCIe base spec (AER,
    DPC, VGA, ASPM, PM, etc).

  - "PCI: iproc:" for controller drivers (iproc, dwc, qcom, mvebu,
    etc).

  - "PCI:" for everything else
