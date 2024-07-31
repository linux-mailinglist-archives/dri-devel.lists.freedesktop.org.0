Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D4943682
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 21:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D438110E6C0;
	Wed, 31 Jul 2024 19:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O3lGUVjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC41E10E6C0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 19:36:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E3E762605;
 Wed, 31 Jul 2024 19:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F04CC4AF09;
 Wed, 31 Jul 2024 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722454567;
 bh=Vd8fqkfwlFHhHJNjJJ8PkDDVoKHE/NzxbbiRJuqU6A0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=O3lGUVjVHsx7HxAGvOsQhXjWehnqSCzJRaSafGYfyuPCnIDC8kkVYuBLh/NTlR0MU
 JiSYF37mpYv+0icISrQuZZWIvj2olN6Y/A9/cWG1073dfshcJjHju5ctJMqRcdjzWl
 7t+Xy/r5iTYrFHtFDgT9/9Ot6jBGYXmvIggEfzpcmUdiG0NfqeC1jwA3HGGCZZCmBK
 /RCUfTUbdHEyCuqW2AiPMz1zS17cG91dyX+K4aTuf9kHVTtL+tjo5xN+YoMcaOOHOc
 znkXmAqpV1sdxfkjPOJHYp1KwZJJ5eLNt8tltPjHIIZPSFQBoRBSoU59+7W1FY5rp8
 Fz7ZQs5+FzpWA==
Date: Wed, 31 Jul 2024 14:36:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/2] Use pcim_request_region() in vboxvideo
Message-ID: <20240731193605.GA77260@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729093625.17561-2-pstanner@redhat.com>
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

On Mon, Jul 29, 2024 at 11:36:24AM +0200, Philipp Stanner wrote:
> Hi everyone,
> 
> Now that we've got the simplified PCI devres API available we can slowly
> start using it in drivers and step by step phase the more problematic
> API out.
> 
> vboxvideo currently does not have a region request, so it is a suitable
> first user.
> 
> P.
> 
> Philipp Stanner (2):
>   PCI: Make pcim_request_region() a public function
>   drm/vboxvideo: Add PCI region request
> 
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++++
>  drivers/pci/devres.c                  | 1 +
>  drivers/pci/pci.h                     | 2 --
>  include/linux/pci.h                   | 1 +
>  4 files changed, 6 insertions(+), 2 deletions(-)

Given an ack from the vboxvideo maintainers, I can apply both of these
via the PCI tree so there's no race during the merge window.
