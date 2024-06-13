Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395A5907BB8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D4310EB53;
	Thu, 13 Jun 2024 18:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R3XGyyGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E6B10EB8F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:45:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 67D1FCE2744;
 Thu, 13 Jun 2024 18:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CA4C2BBFC;
 Thu, 13 Jun 2024 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718304316;
 bh=SaYK7xDVIVPlSht74HhNqclsX16Ie88uGUDzvreWhC4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=R3XGyyGFzwjza+YIqcLz1yLluC+7EBBbxz+bjk3bINlUnfF3fBo0vxvRZJE5rfezX
 IdtqN5Ji664TSC9q1zDKWqteUv+wYuC1Nj5D/qWFhIxfv8aJHOsOlVa+YlyfZXwTbw
 q8YhThE/zwkuHoY0Gow1P3nfPb7g0HDwiVmv6lBgHboXDBhEInoNST0x9kr7XAcZST
 7l5nAMqy+jilTniLJNCAATJ9/PnOsT2mV1J+v0mG6Iq95VwyFrsc8mUvCjaBHL5hu4
 1iFHa0yZKD8X3mVu1QH6PyWqatlTDDPlcJHDN/wiinR13NnQmlbKLPuT6KqVIHBrt1
 ehn9BXQozHTbg==
Date: Thu, 13 Jun 2024 13:45:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 03/13] PCI: Reimplement plural devres functions
Message-ID: <20240613184514.GA1071919@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa4e5dd8-2ac4-ae58-2b1b-8d05115ac769@linux.intel.com>
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

On Thu, Jun 13, 2024 at 07:54:38PM +0300, Ilpo Järvinen wrote:
> On Wed, 5 Jun 2024, Philipp Stanner wrote:
> 
> > When the original PCI devres API was implemented, priority was given to
> > the creation of a set of "plural functions" such as
> > pcim_request_regions(). These functions have bit masks as parameters to
> > specify which BARs shall get mapped. Most users, however, only use those
> > to map 1-3 BARs.

> > +static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
> > +		unsigned long offset, unsigned long maxlen,
> > +		const char *name, int req_flags)
> > +{
> > +	resource_size_t start = pci_resource_start(pdev, bar);
> > +	resource_size_t len = pci_resource_len(pdev, bar);
> > +	unsigned long dev_flags = pci_resource_flags(pdev, bar);
> > +
> > +	if (start == 0 || len == 0) /* That's an unused BAR. */
> > +		return 0;
> > +	if (len <= offset)
> > +		return  -EINVAL;
> 
> Extra space.

Thanks for reviewing this.  I dropped the space locally in the v9
series.

> >  void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
> >  {
> > -	void __iomem * const *iomap;
> > -	int i;
> > -
> > -	iomap = pcim_iomap_table(pdev);
> > -	if (!iomap)
> > -		return;
> > +	short bar;
> 
> The current best practice is to use unsigned for loop vars that will never 
> be negative.
> 
> I don't entirely follow what is reasoning behind making it short instead 
> of unsigned int?

Existing interfaces like pcim_iomap() take "int bar".  I locally
changed all the BAR indices to "int".  We can make everything unsigned
later if worthwhile.

> > -	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
> > -		if (!mask_contains_bar(mask, i))
> > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> 
> Is this change minimal if it contains variable renames like this?
> Was "i" not "bar" even if it was given as a parameter to 
> mask_contains_bar()?

Replaced locally with "i".

Bjorn
