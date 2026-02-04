Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBjoFL5rg2l+mgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 16:54:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFC4E98ED
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 16:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D58710E699;
	Wed,  4 Feb 2026 15:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KxHqbDL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334DC10E0A2;
 Wed,  4 Feb 2026 15:54:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E0FEC43BBA;
 Wed,  4 Feb 2026 15:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D388C4CEF7;
 Wed,  4 Feb 2026 15:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770220472;
 bh=x3icpBvvX8hE/1nJfe0UBQcFgbUp9cP9zJMm3/3XEaY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KxHqbDL3n7bdE9UzsRk7XQac2TSqjA0spynqxf4kNsCT2S2xc4AJmT2jRbThrk/lj
 zqM8Y7P0LKKrOuokzq9D5RsQtuvhu35s5XQQkaAHUFs5q+CQcSmyT3ut4GWK+o5OPI
 14SAJHJapBuGFmX7oxUDsIvhZsyGyB0YjlBiOxf6rN98kFtP+S2n4rZWYrcUgLJhmD
 9NcQ68nt9u8ix1446F6Kxs5wH71sz+4B5rPxsLE9qGk7hd7PqDsnHXpUVk9htPicfP
 k2sqg8t4K+A8/NwJxyjtV+bc2Hucut1sgNP+GAgmZKl6q9A/sBoW/w3snteMjK3fK6
 y1v60E3s628dQ==
Date: Wed, 4 Feb 2026 17:54:29 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Maxime Ripard <mripard@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 0/8] dma-buf: Use revoke mechanism to invalidate
 shared buffers
Message-ID: <20260204155429.GJ6771@unreal>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260202160425.GO34749@unreal> <20260204081630.GA6771@unreal>
 <20260204-icy-classic-crayfish-68da6d@houat>
 <20260204115212.GG6771@unreal>
 <20260204-clever-butterfly-of-mastery-0cdc19@houat>
 <20260204121354.GH6771@unreal>
 <20260204-bloodhound-of-major-realization-9852ab@houat>
 <20260204135657.GE2328995@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204135657.GE2328995@ziepe.ca>
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
	FREEMAIL_CC(0.00)[kernel.org,amd.com,linaro.org,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DBFC4E98ED
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:56:57AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 04, 2026 at 02:44:42PM +0100, Maxime Ripard wrote:
> > > From what I have seen, subsystems such as netdev, the block layer, and RDMA continue
> > > to accept code that is ready for merging, especially when it has been thoroughly
> > > reviewed by multiple maintainers across different subsystems.
> > 
> > He said it multiple times, but here's one of such examples:
> > 
> > https://lore.kernel.org/all/CA+55aFwdd30eBsnMLB=ncExY0-P=eAsxkn_O6ir10JUyVSYdhA@mail.gmail.com/
> 
> Woah, nobody is saying to skip linux-next. It is Wednesday, if it
> lands in the public tree today it will be in linux next probably for a
> week before a PR is sent. This is a fairly normal thing for many trees
> in Linux.
> 
> Linus is specifically complaining about people *entirely* skipping
> linux-next.

Yes and yes.

> 
> > So, yeah, we can make exceptions. But you should ask and justify for
> > one, instead of expecting us to pick up a patch submission that was
> > already late.
> 
> I think Leon is only pointing out that a hard cut off two weeks before
> the merge window even opens is a DRMism, not a kernel wide convention.

Correct. I would like to see it in linux-next as soon as possible, and to
ensure I do not need to constantly rebase the patches because DRM changed
something in the .move_notify() area.

BTW, the series is in my tree:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-revoke-v7
and is monitored by the kbuild bot, so this is not a random or untested
submission.

Thanks

> 
> Jason
> 
