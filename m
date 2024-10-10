Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B567999952F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 00:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A929610E9E6;
	Thu, 10 Oct 2024 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pf4BhbzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A85F10E9E5;
 Thu, 10 Oct 2024 22:27:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 62A9AA41813;
 Thu, 10 Oct 2024 22:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739D1C4CEC5;
 Thu, 10 Oct 2024 22:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728599257;
 bh=oTNzX0Px6F2ZuEdSdbpP0nHju9ehSWKosmu3toVlgy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Pf4BhbzNjET2vqzRkOWkNObKT9+3v+3g4SHSdy+1tpvL6vl4hEwcRRznlwxWc9SpL
 2ImhQkURL1Dsm0G/uFMlhz02FywDkPw2ml5J544X1gV81NSDVwgV1rakOLFsmiBbNV
 EIQ2DwNgm20C5hTNMOUxlG+Xwjn2CJ9o4QJSzRPuscYWDllIHfGQN5orwonzHDa7w7
 LBlGkdFS4EBJbVMjP+eJCc3tYX/lo4nIx0oyc431qSUO3wcI3TzRdF69JB0LByP5JJ
 +eL9i4RdpAVTQDveIkREhRXCYwXqng5nPWsiU7lCP12cHtKUPqMPIlBjwvq9Q4f52O
 FjtjwkQ/xbYhg==
Date: Thu, 10 Oct 2024 17:27:35 -0500
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
Subject: Re: [PATCH v3 4/5] PCI/IOV: Allow extending VF BAR within original
 resource boundary
Message-ID: <20241010222735.GA580854@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010103203.382898-5-michal.winiarski@intel.com>
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

On Thu, Oct 10, 2024 at 12:32:02PM +0200, Michał Winiarski wrote:
> VF MMIO resource reservation, either created by system firmware and
> inherited by Linux PCI subsystem or created by the subsystem itself,
> contains enough space to fit the BAR of all SR-IOV Virtual Functions
> that can potentially be created (total VFs supported by the device).

It's *possible* that this is true, but there's no guarantee that
firmware has assigned enough space for all BARs of all possible VFs.

> This can be leveraged when the device is exposing lower than optimal BAR
> size as a default, allowing access to the entire resource when lower
> number of VFs are created.
> It is achieved by dynamically resizing the BAR to largest possible value
> that allows to fit all newly created VFs within the original resource
> boundary.

Add blank lines between paragraphs.

This log doesn't actually say what the patch does.  It describes a
possible configuration and ways that it may be used, and even *how*
something might be done, but something along the lines of the subject
line should be included in the commit log.

> +static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)

Please wrap to fit in 80 columns like the rest of the file.

> +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)

Please add kerneldoc here to help users of this exported function.

> @@ -480,6 +560,11 @@ static ssize_t sriov_numvfs_store(struct device *dev,
>  		goto exit;
>  	}
>  
> +	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
> +		if (pdev->sriov->rebar_extend[i])
> +			pci_iov_resource_do_extend(pdev, i + PCI_IOV_RESOURCES, num_vfs);

Wrap to fit in 80 columns.

Bjorn
