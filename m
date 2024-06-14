Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40377908FCE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D765E10E291;
	Fri, 14 Jun 2024 16:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="encO+XLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC20310E088
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:14:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73EF461F87;
 Fri, 14 Jun 2024 16:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D12C2BD10;
 Fri, 14 Jun 2024 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718381685;
 bh=6/hK32YyxB/oulfz7g+LC1o7De7LeZULQu3LvuNUbpA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=encO+XLLfhclLh17ucfRA+1G9aZik3WtQrNyy4rlKnHJu4hNRHt4R43pIB5q86mHn
 6YmT4CewVfuozNLkvqBo1uinKkkObS+JYNQvYZq+sjtQWW7QR+f1sbZcXCXXUqygM+
 3vapXlNKDHrMWWyDRx+ogl/wc5ZpYMAt5lPYLAmvvnwJE5BhZN0rARQZvm2+H1pmOl
 Zp5D5IqmLygidHzHDYSuOeQl5JqXu6Vs4wtV5AtqScgYEnqmGmS/fpGqlktvgJ4zOi
 I9nuLYjzcIVwJHDH6s5PAz98cIgtmygUQIkUPEbvPhvjrWhhuPSn0qiIvjBQ9Fkbdn
 /VFthmuytJ4RQ==
Date: Fri, 14 Jun 2024 11:14:43 -0500
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
Message-ID: <20240614161443.GA1115997@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d38858130e129fd3568e97d466a4b905e864f8f.camel@redhat.com>
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

On Fri, Jun 14, 2024 at 10:09:46AM +0200, Philipp Stanner wrote:
> On Thu, 2024-06-13 at 16:06 -0500, Bjorn Helgaas wrote:
> > On Thu, Jun 13, 2024 at 01:50:23PM +0200, Philipp Stanner wrote:
> > > pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> > > sometimes managed, sometimes not). Providing a separate pcim_intx()
> > > function with its own device resource and cleanup callback allows
> > > for
> > > removing further large parts of the legacy PCI devres
> > > implementation.
> > > 
> > > As in the region-request-functions, pci_intx() has to call into its
> > > managed counterpart for backwards compatibility.
> > > 
> > > As pci_intx() is an outdated function, pcim_intx() shall not be
> > > made
> > > visible to drivers via a public API.
> > 
> > What makes pci_intx() outdated?  If it's outdated, we should mention
> > why and what the 30+ callers (including a couple in drivers/pci/)
> > should use instead.
> 
> That is 100% based on Andy Shevchenko's (+CC) statement back from
> January 2024 a.D. [1]
> 
> Apparently INTx is "old IRQ management" and should be done through
> pci_alloc_irq_vectors() nowadays.

Do we have pcim_ support for pci_alloc_irq_vectors()?

> [1] https://lore.kernel.org/all/ZabyY3csP0y-p7lb@surfacebook.localdomain/
