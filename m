Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IutNfQjeWnmvgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:45:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969D9A6DC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 21:45:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C3C10E13A;
	Tue, 27 Jan 2026 20:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B23TEVsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42988A3E;
 Tue, 27 Jan 2026 20:45:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF105415F5;
 Tue, 27 Jan 2026 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B6BC116C6;
 Tue, 27 Jan 2026 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769546734;
 bh=kWJnczCRjQfP3+mri2axksFFudA/BEKhqvdeAp2MhAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B23TEVsJccWQDX9Mjx22xVlETkMrrPsVBBGPzr1/qClDRQwwIBUEpOC/B3atxGcBl
 s1GNk7zvmuHc8Ak8BzI57RVpONP9viPDQ9AUq4FK45Mh9JRYYIuCMLbbwyCrKLuUy2
 3aLWXhw79ygY0VefybeyuREyCYmCj2aKCHAwuwZhODd1oUQnKU0/D5zUmNMPWwzGhS
 VccjJRVDi7QyNxVnNABics3aPJZgWOd2TGAtA390Bkrtkg6RWzFHRZfK9zJpPGzack
 wBItE/Q3nIcFifOKrFXt7u9v+WwsoBkT+i0QyYk4WRkirXYn1QmRecC+jpiFNhqN5u
 ri0eOMMXGeg9w==
Date: Tue, 27 Jan 2026 22:45:30 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
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
Subject: Re: [PATCH v5 3/8] dma-buf: Always build with DMABUF_MOVE_NOTIFY
Message-ID: <20260127204530.GX13967@unreal>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-3-f98fca917e96@nvidia.com>
 <0d2ec2d6-c999-45d8-a2bd-b5b21883db47@amd.com>
 <20260127095831.GR13967@unreal>
 <83cd911c-99ea-4fab-821e-fcf703209731@amd.com>
 <20260127114243.GS13967@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127114243.GS13967@unreal>
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
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8969D9A6DC
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 01:42:43PM +0200, Leon Romanovsky wrote:
> On Tue, Jan 27, 2026 at 11:02:03AM +0100, Christian König wrote:
> > On 1/27/26 10:58, Leon Romanovsky wrote:
> > > On Tue, Jan 27, 2026 at 10:26:26AM +0100, Christian König wrote:
> > >> On 1/24/26 20:14, Leon Romanovsky wrote:
> > >>> From: Leon Romanovsky <leonro@nvidia.com>
> > >>>
> > >>> DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
> > >>> experimental and disabled by default ever since. Six years later,
> > >>> all new importers implement this callback.
> > >>>
> > >>> It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
> > >>> always build DMABUF with support for it enabled.
> > >>>
> > >>> Suggested-by: Christian König <christian.koenig@amd.com>
> > >>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > >>
> > >> Reviewed-by: Christian König <christian.koenig@amd.com>
> > >>
> > >> As long as nobody starts screaming in the last second or I encounter some other problem I'm going to push the first three patches to drm-misc-next now.
> > > 
> > > How do you see progress of other patches?
> > > Can they be queued for that tree as well?
> > 
> > I was hoping to get through them by the end of the week.
> > 
> > Just wanted to make sure that CI systems start to see the first three patches (who affect everybody), so that we get early feedback should we have missed something.
> 
> Perfect, I based my patches on these two commits:
> 61ceaf236115 (vfio/for-linus) vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF
> 24d479d26b25 (tag: v6.19-rc6) Linux 6.19-rc6

The fix was merged https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1f97d9dcf53649c41c33227b345a36902cbb08ad

Thanks

> 
> Thanks
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Thanks
> > > 
> > >>
> > >> They are basically just cleanups we should have done a long time ago.
> > >>
> > >> Regards,
> > >> Christian.
> > >>
> > 
> 
