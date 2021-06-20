Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCF63ADF00
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 16:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E63589590;
	Sun, 20 Jun 2021 14:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 317 seconds by postgrey-1.36 at gabe;
 Sun, 20 Jun 2021 14:20:18 UTC
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2253C89590;
 Sun, 20 Jun 2021 14:20:18 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 15KEEsxi001510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 20 Jun 2021 10:14:55 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 4EFFB15C3C9F; Sun, 20 Jun 2021 10:14:54 -0400 (EDT)
Date: Sun, 20 Jun 2021 10:14:54 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v3 0/8] Support DEVICE_GENERIC memory in migrate_vma_*
Message-ID: <YM9NXrGlhdp0qb7S@mit.edu>
References: <20210617151705.15367-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617151705.15367-1-alex.sierra@amd.com>
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
Cc: rcampbell@nvidia.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 10:16:57AM -0500, Alex Sierra wrote:
> v1:
> AMD is building a system architecture for the Frontier supercomputer with a
> coherent interconnect between CPUs and GPUs. This hardware architecture allows
> the CPUs to coherently access GPU device memory. We have hardware in our labs
> and we are working with our partner HPE on the BIOS, firmware and software
> for delivery to the DOE.
> 
> The system BIOS advertises the GPU device memory (aka VRAM) as SPM
> (special purpose memory) in the UEFI system address map. The amdgpu driver looks
> it up with lookup_resource and registers it with devmap as MEMORY_DEVICE_GENERIC
> using devm_memremap_pages.
> 
> Now we're trying to migrate data to and from that memory using the migrate_vma_*
> helpers so we can support page-based migration in our unified memory allocations,
> while also supporting CPU access to those pages.
> 
> This patch series makes a few changes to make MEMORY_DEVICE_GENERIC pages behave
> correctly in the migrate_vma_* helpers. We are looking for feedback about this
> approach. If we're close, what's needed to make our patches acceptable upstream?
> If we're not close, any suggestions how else to achieve what we are trying to do
> (i.e. page migration and coherent CPU access to VRAM)?

Is there a way we can test the codepaths touched by this patchset?  It
doesn't have to be via a complete qemu simulation of the GPU device
memory, but some way of creating MEMORY_DEVICE_GENERIC subject to
migrate_vma_* helpers so we can test for regressions moving forward.

Thanks,

					- Ted
