Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B22E9B3711
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 17:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68F810E512;
	Mon, 28 Oct 2024 16:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pkI5kqhF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717D410E510;
 Mon, 28 Oct 2024 16:50:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2D672A42A24;
 Mon, 28 Oct 2024 16:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDE5C4CEC7;
 Mon, 28 Oct 2024 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730134233;
 bh=pMWXPesuF8JzrcGMxw6QNKDodBCUrn/XJfWhJqOIi/k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pkI5kqhFOL4hPrCJsofC2stUnspJjm6zGrt4OxWKdikOpGkx9D4nmXJx4C/VcJftq
 mE/iv5zzaJNUwYeH+8UGSMffivBEWZTqJMxCYzZ/9RFDHN5GNWtEv594Vs8OqFbqFC
 KvHQ6yoKZLdlFCOHSacP0wOL0jLUNBLI+n9RCK3vySApUKgsE0v84V1CxaSLOD4/et
 Cwwgtu2Hp9Ae77Da0pXA4iasz1yvXST1obtG2ttbSY9QAIHmWR8QgQNkU9M3rHvNrv
 o2jLzg4XdR80Z4O+4l7LuGU2IhXufItbN14hvCNEZt4ssz6b4CVBKdRM0a6Jlr6sbV
 SgNclE/avtfMQ==
Date: Mon, 28 Oct 2024 11:50:31 -0500
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
Subject: Re: [PATCH v4 6/7] PCI: Allow drivers to control VF BAR size
Message-ID: <20241028165031.GA1106195@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025215038.3125626-7-michal.winiarski@intel.com>
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

On Fri, Oct 25, 2024 at 11:50:37PM +0200, Michał Winiarski wrote:
> Drivers could leverage the fact that the VF BAR MMIO reservation is
> created for total number of VFs supported by the device by resizing the
> BAR to larger size when smaller number of VFs is enabled.
> 
> Add a pci_iov_vf_bar_set_size() function to control the size and a
> pci_iov_vf_bar_get_sizes() helper to get the VF BAR sizes that will
> allow up to num_vfs to be successfully enabled with the current
> underlying reservation size.
> ...

> + * pci_iov_vf_bar_get_sizes - get VF BAR sizes that allow to create up to num_vfs
> + * @dev: the PCI device
> + * @resno: the resource number
> + * @num_vfs: number of VFs
> + *
> + * Get the sizes of a VF resizable BAR that can fit up to num_vfs within the
> + * resource that reserves the MMIO space (originally up to total_VFs) the as
> + * bitmask defined in the spec (bit 0=1MB, bit 19=512GB).

This sentence doesn't quite parse; something is missing around "the as".

I'm guessing you mean to say something about the return value being a
bitmask of VF BAR sizes that can be accommodated if num_vfs are
enabled?  If so, maybe combine it with the following paragraph:

> + * Returns 0 if BAR isn't resizable.
> + *
> + */
> +u32 pci_iov_vf_bar_get_sizes(struct pci_dev *dev, int resno, int num_vfs)
> +{
> +	resource_size_t size;
> +	u32 sizes;
> +	int i;
> +
> +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> +	if (!sizes)
> +		return 0;
> +
> +	while (sizes > 0) {
> +		i = __fls(sizes);
> +		size = pci_rebar_size_to_bytes(i);
> +
> +		if (size * num_vfs <= pci_resource_len(dev, resno))
> +			break;
> +
> +		sizes &= ~BIT(i);
> +	}
> +
> +	return sizes;
> +}
> +EXPORT_SYMBOL_GPL(pci_iov_vf_bar_get_sizes);
