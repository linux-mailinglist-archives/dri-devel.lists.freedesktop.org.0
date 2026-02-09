Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCQSF8r2iWl7FAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:01:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771211165B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE8210E40D;
	Mon,  9 Feb 2026 15:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lcdXVf1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9798C10E40D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770649274;
 bh=2Jn6ht9R44NVLk0YTLUNGVwTRbNRIHRw4ncSbNE5+Lc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lcdXVf1L5yg0p/y9x6biLEMw1DINlbMW4X95SONyD4ld0EbDvHzS1bkT7CNbO4Uzp
 XxXBE+qUzdmMpqwAZxsKySKV5VkgNiv580PwhHr4tpFjCm//KFbLMZ7A0Da2x4wGQt
 TRxlkmIK/A9nNJ2lkmcLiFf52US8l5HqEkakigsI3Jhlo/7i+NvifzAp4ZaKK06keT
 ZSvcxO2/vMCqtpm/MmICIRqxWySpmQIGsSFNLm1v5mLUA8Ai+hwUjCfOyZC+7gRpH8
 IkjUXP0bc0p7ufU6EFBJLSc3gwRpCEXxfx0HQd/PYkTyeVXO90UE14gwBoNKC2emew
 UJhdxYD4L/pFA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A229217E13D5;
 Mon,  9 Feb 2026 16:01:13 +0100 (CET)
Date: Mon, 9 Feb 2026 16:01:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 5/6] drm/gem-shmem: Track folio accessed/dirty status
 in mmap
Message-ID: <20260209160109.79a020ae@fedora>
In-Reply-To: <0d00a0f6-d0e4-41db-b48b-77157cd2e968@suse.de>
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-6-tzimmermann@suse.de>
 <20260209152340.16f9b30a@fedora>
 <0d00a0f6-d0e4-41db-b48b-77157cd2e968@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:loic.molinari@collabora.com,m:willy@infradead.org,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[collabora.com:query timed out,suse.de:query timed out];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,imgtec.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,kvack.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Rspamd-Queue-Id: 2771211165B
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 15:46:21 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi Boris,
>=20
> thanks for reviewing the series.
>=20
> Am 09.02.26 um 15:23 schrieb Boris Brezillon:
> > On Mon,  9 Feb 2026 14:27:14 +0100
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > =20
> >> Invoke folio_mark_accessed() in mmap page faults to add the folio to
> >> the memory manager's LRU list. Userspace invokes mmap to get the memory
> >> for software rendering. Compositors do the same when creating the final
> >> on-screen image, so keeping the pages in LRU makes sense. Avoids paging
> >> out graphics buffers when under memory pressure.
> >>
> >> In pfn_mkwrite, further invoke the folio_mark_dirty() to add the folio
> >> for writeback should the underlying file be paged out from system memo=
ry.
> >> This rarely happens in practice, yet it would corrupt the buffer conte=
nt.
> >>
> >> This has little effect on a system's hardware-accelerated rendering, w=
hich
> >> only mmaps for an initial setup of textures, meshes, shaders, etc.
> >>
> >> v3:
> >> - rewrite for VM_PFNMAP
> >> v2:
> >> - adapt to changes in drm_gem_shmem_try_mmap_pmd()
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> ---
> >>   drivers/gpu/drm/drm_gem_shmem_helper.c | 20 ++++++++++++++++++++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/=
drm_gem_shmem_helper.c
> >> index c3a054899ba3..0c86ad40a049 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -598,6 +598,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fa=
ult *vmf)
> >>   	if (ret !=3D VM_FAULT_NOPAGE)
> >>   		ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> >>  =20
> >> +	if (likely(!(ret & VM_FAULT_ERROR))) =20
> > Can't we just go
> >
> > 	if (ret =3D=3D VM_FAULT_NOPAGE)
> >
> > here? =20
>=20
> After reviewing the code in vmf_insert_pfn, I think so. All we'll see is=
=20
> _OOM and _SIGBUS; or _NOPAGE on success.=C2=A0 I'll change it then.
>=20
>=20
> > =20
> >> +		folio_mark_accessed(folio);
> >> +
> >>   out:
> >>   	dma_resv_unlock(obj->resv);
> >>  =20
> >> @@ -638,10 +641,27 @@ static void drm_gem_shmem_vm_close(struct vm_are=
a_struct *vma)
> >>   	drm_gem_vm_close(vma);
> >>   }
> >>  =20
> >> +static vm_fault_t drm_gem_shmem_pfn_mkwrite(struct vm_fault *vmf)
> >> +{
> >> +	struct vm_area_struct *vma =3D vmf->vma;
> >> +	struct drm_gem_object *obj =3D vma->vm_private_data;
> >> +	struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> >> +	pgoff_t page_offset =3D vmf->pgoff - vma->vm_pgoff; /* page offset w=
ithin VMA */
> >> +	struct page *page =3D shmem->pages[page_offset]; =20
> > Should we have a
> >
> > 	if (WARN_ON(!shmem->pages ||
> > 		    page_offset <=3D (obj->size >> PAGE_SHIFT)))
> > 		return VM_FAULT_SIGBUS;
> >
> >
> > ? =20
>=20
> I left it out because it doesn't seem necessary.=C2=A0 In the fault handl=
er=20
> in drm_gem_shmem_fault(), I can see that we could get an OOB access. But=
=20
> we only call pfn_mkwrite() after going through _fault() first. I don't=20
> see a way of getting here unless we've already tested for the page in=20
> _fault().

I agree it's not supposed to happen, but isn't it what WARN_ON()s are
for (catching unexpected situations)?
