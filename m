Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2690B6E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 18:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2DF10E463;
	Mon, 17 Jun 2024 16:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YUYl9lUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D91A10E463
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 16:46:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 833E2CE0EDE;
 Mon, 17 Jun 2024 16:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E4AC3277B;
 Mon, 17 Jun 2024 16:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718642766;
 bh=xO8XChDFPCNzZpffI0GKMk7UAMqF5tKfD7aEDZU04+0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YUYl9lUhjz94BZhQz9/gYarQ4pOP/8GbvmV5pbrZTc53wcOzF6VDfcg6f3DVoi1XT
 x8/z6mIHV4rBgEd8BjjcFZfKc1JEf01iWfbWijJ6YAJOwcodXaA4WVU6CoKAHAGYhr
 m7NDyCRTKNMrAPVNySrfPeVCYQf7ENQK19yJNOYXsgBfGE+AVK5PXLb7+eZA30szCJ
 OhIyGseEwn/ZWqEn2QTNpNkBX005hHX5oZkzXqtuPW8eNr33jGRaY05q6SlX2gCR+E
 zLi65gBwLERJiF0ogsYdBKnRdtTOlvGk00YuX0weMynueY98RQthvNC40kBra3JjiO
 VldAMGaR8udNw==
Date: Mon, 17 Jun 2024 11:46:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
Message-ID: <20240617164604.GA1217529@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdfd5c582e7b858d3f32428000d2268228beef5f.camel@redhat.com>
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

On Mon, Jun 17, 2024 at 10:21:10AM +0200, Philipp Stanner wrote:
> On Fri, 2024-06-14 at 11:14 -0500, Bjorn Helgaas wrote:
> > On Fri, Jun 14, 2024 at 10:09:46AM +0200, Philipp Stanner wrote:
> ...

> > > Apparently INTx is "old IRQ management" and should be done through
> > > pci_alloc_irq_vectors() nowadays.
> > 
> > Do we have pcim_ support for pci_alloc_irq_vectors()?
> 
> Nope.

Should we?  Or is IRQ support not amenable to devm?

Happened to see this new driver:
https://lore.kernel.org/all/20240617100359.2550541-3-Basavaraj.Natikar@amd.com/
that uses devm and the only PCI-related part of .remove() is cleaning
up the IRQs.
