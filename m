Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGc1Du2KhGl43QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:19:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC5F2568
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 13:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D3710E045;
	Thu,  5 Feb 2026 12:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8xsIjDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD510E045;
 Thu,  5 Feb 2026 12:19:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12B6660128;
 Thu,  5 Feb 2026 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EA5C16AAE;
 Thu,  5 Feb 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770293989;
 bh=jDVAIy0un6bKwi7cwnpyXpEFdjN35m4ddNYoOutYhhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8xsIjDRjR/7Rs5Naa0Zy2HxOGqc5prWf5cwXS/H3radpAqh/avw9U+IxguyWKA8y
 huFln+oJd1vu7ldLn6LNYkQ6RJxjWsoJ5eS3hT0tMYh4dmMUdxahfCEdqFj5VXkqpT
 9ddi8EzI4CBmF7r3/HIXROK8jlpHjEAdgQe9URyey+9Vwp7WQHQV8s4nvLC46FZ6a2
 c9HMUyfFhI1lUXLb8Xb4BXpe77RU5uB+OQv6MQF6rYrWjvvFziYpPIuIRa15haC6F5
 k9QrwVZPhPwCYG1uDdQYVzTA2Sbfz33PJKtJRXrvJXZ7pvFO9um7Ecx+7L4LAFSQPe
 OpIywz7bjpfXA==
Date: Thu, 5 Feb 2026 14:19:45 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Alex Williamson <alex@shazbot.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260205121945.GC12824@unreal>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[shazbot.org,ffwll.ch,intel.com,linaro.org,amd.com,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,ziepe.ca,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: B3CC5F2568
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:43:08AM +0100, Christian König wrote:
> On 2/4/26 17:56, Alex Williamson wrote:
> ...
> >>
> >> This chunk here doesn't want to apply to drm-misc-next, my educated
> >> guess is that the patch adding those lines is missing in that tree.
> >>
> >> How should we handle that? Patches 1-3 have already been pushed to
> >> drm-misc-next and I would rather like to push patches 4-6 through
> >> that branch as well.
> >>
> >> I can request a backmerge from the drm-misc-next maintainers, but
> >> then we clearly don't get that upstream this week.
> > 
> > Hmm, drm-next already has a backmerge up to v6.19-rc7, the patch here is
> > based on a commit merged in rc8.  The tag for that change was based on
> > rc6.  It can be found here:
> > 
> > https://github.com/awilliam/linux-vfio.git tags/vfio-v6.19-rc8
> > 
> > As the same tag Linus merged in:
> > 
> > 1f97d9dcf536 ("Merge tag 'vfio-v6.19-rc8' of https://github.com/awilliam/linux-vfio")
> > 
> > drm-misc-next only seems to be based on v6.19-rc1 though, so I don't
> > know that any of that helps.  Thanks,
> 
> Thanks Alex, that was indeed helpful.
> 
> Simona, Jani and Lucas can we do a backmerge of 6.19-rc8 into drm-misc-next or does that completely breaks the flow?
> 
> If it's not possible immediately then I will do the merge next week or so when the final 6.19 is out and everything merged back into the drm-misc trees.

Christian,

You don't need any backmerge, SHA-1 version of vfio-v6.19-rc8 tag is the
same as in Linus's tree, so the flow is:

➜  kernel git:(wip/leon-for-next) git remote update drm-misc
Fetching drm-misc
remote: Enumerating objects: 32768, done.
remote: Counting objects: 100% (21620/21620), done.
remote: Compressing objects: 100% (4620/4620), done.
remote: Total 18154 (delta 14789), reused 16751 (delta 13519), pack-reused 0
Receiving objects: 100% (18154/18154), 4.33 MiB | 4.30 MiB/s, done.
Resolving deltas: 100% (14789/14789), completed with 1564 local objects.
From https://anongit.freedesktop.org/git/drm/drm-misc
 * [new branch]                drm-misc-fixes                                           -> drm-misc/drm-misc-fixes
 * [new branch]                drm-misc-next                                            -> drm-misc/drm-misc-next
...
➜  kernel git:(wip/leon-for-next) git checkout -b drm-misc-next drm-misc/drm-misc-next
Switched to a new branch 'drm-misc-next'
HEAD is now at 2bcbc706dfa0 dma-buf: add dma_fence_was_initialized function v2
➜  kernel git:(drm-misc-next) git merge vfio-v6.19-rc8 
Auto-merging drivers/vfio/pci/vfio_pci_dmabuf.c
Merge made by the 'ort' strategy.
 drivers/vfio/pci/vfio_pci_dmabuf.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)
➜  kernel git:(drm-misc-next) git l -2
f6e4419050ce (HEAD -> drm-misc-next) Merge tag 'vfio-v6.19-rc8' into drm-misc-next
2bcbc706dfa0 (drm-misc/drm-misc-next, drm-misc/HEAD) dma-buf: add dma_fence_was_initialized function v2

And after that you can apply rest of dma-buf patches.

Thanks

> 
> Leon the flow of patches through the DRM subsystem is documented here: https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-misc.html#merge-timeline
> 
> Thanks,
> Christian.
> 
> > 
> > Alex
