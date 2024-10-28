Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 043FA9B3726
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2210E516;
	Mon, 28 Oct 2024 16:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="crWultVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7260A10E516;
 Mon, 28 Oct 2024 16:56:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90C32A42A45;
 Mon, 28 Oct 2024 16:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7440C4CEC3;
 Mon, 28 Oct 2024 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730134565;
 bh=zFHnF7cGEYGwCxaLixcm3YUBNgWn7en7LiCB5J6XxGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=crWultVXOmNOEWB7o8sIuKDEqFUlt3r+Br/8GzgAliwpSKBoSujztI2uuYN+2lbtB
 Ewnbd5OGtkZss7AkIZRlt71MQD/mHGyKKxqWn++ikTxS+0TAAo+CVEjSzYq7vkXQcD
 0nRDB1qdVegbRS2Ukf325gS9bslRdnSiSbBvySxs1lVxoXM2NXh44OofuZegv4oGBI
 AAfEuhcg0IPljWfYhVBMbGPR0MEUeQiVo17bAlmY2ImXM3YTHvmfRm5lXkiz7sMjvx
 Z5IHcbEbhyendDuKBmmhX5jmSiJj6+bq6F7bUfEfBAmQG4exPUGqCXwlS2IYu2/w+s
 uA96h5/dKXs4w==
Date: Mon, 28 Oct 2024 11:56:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 5/7] PCI/IOV: Check that VF BAR fits within the
 reservation
Message-ID: <20241028165604.GA1105091@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025215038.3125626-6-michal.winiarski@intel.com>
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

On Fri, Oct 25, 2024 at 11:50:36PM +0200, Michał Winiarski wrote:
> VF MMIO resource reservation, either created by system firmware and
> inherited by Linux PCI subsystem or created by the subsystem itself,
> should contain enough space to fit the BAR of all SR-IOV Virtual
> Functions that can potentially be created (total VFs supported by the
> device).

I don't think "VF resource reservation ... should contain enough
space" is really accurate or actionable.  It would be *nice* if the PF
BAR is large enough to accommodate the largest supported VF BARs for
all possible VFs, but if it doesn't, it's not really an error.  It's
just a reflection of the fact that resource space is limited.

> However, that assumption only holds in an environment where VF BAR size
> can't be modified.

There's no reason to assume anything about how many VF BARs fit.  The
existing code should avoid enabling the requested nr_virtfn VFs if the
PF doesn't have enough space -- I think that's what the "if
(res->parent)" is supposed to be checking.

The fact that you need a change here makes me suspect that we're
missing some resource claim (and corresponding res->parent update)
elsewhere when resizing the VF BAR.

> Add an additional check that verifies that VF BAR for all enabled VFs
> fits within the underlying reservation resource.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/pci/iov.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> index 79143c1bc7bb4..5de828e5a26ea 100644
> --- a/drivers/pci/iov.c
> +++ b/drivers/pci/iov.c
> @@ -645,10 +645,14 @@ static int sriov_enable(struct pci_dev *dev, int nr_virtfn)
>  
>  	nres = 0;
>  	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		int vf_bar_sz = pci_iov_resource_size(dev,
> +						      pci_resource_to_iov(i));
>  		bars |= (1 << pci_resource_to_iov(i));
>  		res = &dev->resource[pci_resource_to_iov(i)];
> -		if (res->parent)
> -			nres++;
> +		if (!res->parent || vf_bar_sz * nr_virtfn > resource_size(res))
> +			continue;
> +
> +		nres++;
>  	}
>  	if (nres != iov->nres) {
>  		pci_err(dev, "not enough MMIO resources for SR-IOV\n");
> -- 
> 2.47.0
> 
