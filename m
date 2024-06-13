Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0F907BB9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 20:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034A10EB5D;
	Thu, 13 Jun 2024 18:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G9eSwAzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E8C10EB5D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 18:47:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6C53461A8D;
 Thu, 13 Jun 2024 18:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E392C2BBFC;
 Thu, 13 Jun 2024 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718304433;
 bh=6CfjmERPAvC/8/2dtK9KLsIJQPfSvo/2DU6MYJDWabE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=G9eSwAzFL/TAvwfSbOZgnbg9fyai0gIxBIozJGDKSH4J0uUHoUz+UyiEW4rjAloW4
 EgfpsYNd9t0SzTjfplKpzl61omwfIibj/5GpeST/gqH2zNlSWJ6ThukiNfnCSvtJao
 GjllABGwoV8f/CLolKnTfTg6HGHGRwB3huU7pC/PDhDoPpNydkxuD15MQA2WupbUvK
 cFUTkSquJsJRAXhrhLqiMQZTFXZyB870KLkO1EF793QHNghAQPcBA9eotv8ZX3reEH
 0hfrFsTSNUEkQqEK83VjFoNyuaAdgEeObMNV6g3kqV1NAuFYWaM9Mpkclhj561maRp
 jLakN3XEU9nhw==
Date: Thu, 13 Jun 2024 13:47:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 10/13] PCI: Give pci(m)_intx its own devres callback
Message-ID: <20240613184710.GA1072582@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cd568a9-1332-5a47-bdb2-ea079a8462af@linux.intel.com>
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

On Thu, Jun 13, 2024 at 08:23:26PM +0300, Ilpo Järvinen wrote:
> On Wed, 5 Jun 2024, Philipp Stanner wrote:
> 
> > pci_intx() is one of the functions that have "hybrid mode" (i.e.,
> > sometimes managed, sometimes not). Providing a separate pcim_intx()
> > function with its own device resource and cleanup callback allows for
> > removing further large parts of the legacy PCI devres implementation.

> > +/* Used to restore the old intx state on driver detach. */
> 
> INTx

Updated locally in v9 series.

> > @@ -392,32 +397,75 @@ int pcim_set_mwi(struct pci_dev *pdev)
> >  }
> >  EXPORT_SYMBOL(pcim_set_mwi);
> >  
> > +
> >  static inline bool mask_contains_bar(int mask, int bar)
> 
> Stray change.

Updated locally in v9 series.
