Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ2RLkZ+eGkFqQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:58:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D60891615
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:58:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26818890B2;
	Tue, 27 Jan 2026 08:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bAB6hl7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD82890B2;
 Tue, 27 Jan 2026 08:58:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 773E7600AD;
 Tue, 27 Jan 2026 08:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78ED1C16AAE;
 Tue, 27 Jan 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769504321;
 bh=m9sbIqU1XdlQnXm2tN68nmeagKR1Wrmm8XlTuHQ4gaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bAB6hl7oG53Z5NaRzppvV3aOmPWOsOx1U7WgjZAo/MByByWmhGqS4/O2kekR1OMyx
 mQTdVm9JsHILgUhUwCbN+yCY9zG/a3nAgGHREqz1o1Pu9NxUGN+qD4JhJvYQSHJ2h7
 DV0HRAarEmmVN4jkgeMBb2Li/CSIYgQAKa9BuAwLgoIuh6wIe8Ni0EAOjTUz2TSSgV
 IoN120Zlz1QJqEpCVMMH0v6BbyexGT8q2SrPZ/0x/7ClhwrYYGyc62I432RUDP+jZB
 H67MwBVZ42sQtwFhWN9msXincpCyPWj5NNsEcIwurDVEKKOJDyyuPND7LvAPGvSJuT
 T2lnuSKLEB1pQ==
Date: Tue, 27 Jan 2026 10:58:35 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260127085835.GQ13967@unreal>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXfUZcSEr9N18o6w@google.com>
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
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D60891615
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 08:53:57PM +0000, Pranjal Shrivastava wrote:
> On Sat, Jan 24, 2026 at 09:14:16PM +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > dma-buf invalidation is handled asynchronously by the hardware, so VFIO
> > must wait until all affected objects have been fully invalidated.
> > 
> > In addition, the dma-buf exporter is expecting that all importers unmap any
> > buffers they previously mapped.
> > 
> > Fixes: 5d74781ebc86 ("vfio/pci: Add dma-buf export support for MMIO regions")
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 71 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 68 insertions(+), 3 deletions(-)

<...>

> > @@ -333,7 +359,37 @@ void vfio_pci_dma_buf_move(struct vfio_pci_core_device *vdev, bool revoked)
> >  			dma_resv_lock(priv->dmabuf->resv, NULL);
> >  			priv->revoked = revoked;
> >  			dma_buf_invalidate_mappings(priv->dmabuf);
> > +			dma_resv_wait_timeout(priv->dmabuf->resv,
> > +					      DMA_RESV_USAGE_BOOKKEEP, false,
> > +					      MAX_SCHEDULE_TIMEOUT);
> >  			dma_resv_unlock(priv->dmabuf->resv);
> > +			if (revoked) {
> > +				kref_put(&priv->kref, vfio_pci_dma_buf_done);
> > +				/* Let's wait till all DMA unmap are completed. */
> > +				wait = wait_for_completion_timeout(
> > +					&priv->comp, secs_to_jiffies(1));
> 
> Is the 1-second constant sufficient for all hardware, or should the 
> invalidate_mappings() contract require the callback to block until 
> speculative reads are strictly fenced? I'm wondering about a case where
> a device's firmware has a high response latency, perhaps due to internal
> management tasks like error recovery or thermal and it exceeds the 1s 
> timeout. 
> 
> If the device is in the middle of a large DMA burst and the firmware is
> slow to flush the internal pipelines to a fully "quiesced"
> read-and-discard state, reclaiming the memory at exactly 1.001 seconds
> risks triggering platform-level faults..
> 
> Since the wen explicitly permit these speculative reads until unmap is
> complete, relying on a hardcoded timeout in the exporter seems to 
> introduce a hardware-dependent race condition that could compromise
> system stability via IOMMU errors or AER faults. 
> 
> Should the importer instead be required to guarantee that all 
> speculative access has ceased before the invalidation call returns?

It is guaranteed by the dma_resv_wait_timeout() call above. That call ensures
that the hardware has completed all pending operations. The 1‑second delay is
meant to catch cases where an in-kernel DMA unmap call is missing, which should
not trigger any DMA activity at that point.

So yes, one second is more than sufficient.

Thanks

> 
> Thanks
> Praan
> 
> > +				/*
> > +				 * If you see this WARN_ON, it means that
> > +				 * importer didn't call unmap in response to
> > +				 * dma_buf_invalidate_mappings() which is not
> > +				 * allowed.
> > +				 */
> > +				WARN(!wait,
> > +				     "Timed out waiting for DMABUF unmap, importer has a broken invalidate_mapping()");
> > +			} else {
> > +				/*
> > +				 * Kref is initialize again, because when revoke
> > +				 * was performed the reference counter was decreased
> > +				 * to zero to trigger completion.
> > +				 */
> > +				kref_init(&priv->kref);
> > +				/*
> > +				 * There is no need to wait as no mapping was
> > +				 * performed when the previous status was
> > +				 * priv->revoked == true.
> > +				 */
> > +				reinit_completion(&priv->comp);
> > +			}
> >  		}
> >  		fput(priv->dmabuf->file);
> >  	}
> > @@ -346,6 +402,8 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> >  
> >  	down_write(&vdev->memory_lock);
> >  	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> > +		unsigned long wait;
> > +
> >  		if (!get_file_active(&priv->dmabuf->file))
> >  			continue;
> >  
> > @@ -354,7 +412,14 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> >  		priv->vdev = NULL;
> >  		priv->revoked = true;
> >  		dma_buf_invalidate_mappings(priv->dmabuf);
> > +		dma_resv_wait_timeout(priv->dmabuf->resv,
> > +				      DMA_RESV_USAGE_BOOKKEEP, false,
> > +				      MAX_SCHEDULE_TIMEOUT);
> >  		dma_resv_unlock(priv->dmabuf->resv);
> > +		kref_put(&priv->kref, vfio_pci_dma_buf_done);
> > +		wait = wait_for_completion_timeout(&priv->comp,
> > +						   secs_to_jiffies(1));
> > +		WARN_ON(!wait);
> >  		vfio_device_put_registration(&vdev->vdev);
> >  		fput(priv->dmabuf->file);
> >  	}
> > 
> > -- 
> > 2.52.0
> > 
> > 
> 
