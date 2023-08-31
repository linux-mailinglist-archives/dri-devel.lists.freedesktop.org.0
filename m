Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764BC78EF4B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 16:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D410E687;
	Thu, 31 Aug 2023 14:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Thu, 31 Aug 2023 14:08:27 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F6910E687;
 Thu, 31 Aug 2023 14:08:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74B34B822A2;
 Thu, 31 Aug 2023 14:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93068C433C8;
 Thu, 31 Aug 2023 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1693490464;
 bh=bhdJzbcUDiU8F267YV9GPJNZorUfdGvRfv0Zanffxlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dt4grCozA/NuOXr8/L7WRrWozLJyn4aujUgLwxM1zCLIzhVDGU86YnC9Z1+oQ4yD4
 eLcaMYJfwZ17CMnPDEYh7xhyCS6DgXJ3shvcan1nxj4IF9AkmJ9TOXwMnWLwFFZSAI
 /o84xxJ2DVEn56tt5q1w/mg3IWr9ZzKXEZ4WRrBI=
Date: Thu, 31 Aug 2023 16:01:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Message-ID: <2023083144-railroad-daybreak-7f41@gregkh>
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
 <55fc4a28-1e17-44df-2069-a688828080e6@gmail.com>
 <2023083145-scoured-celery-2511@gregkh>
 <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c657653e-24d8-5790-a91c-4c13bb9eaeb0@gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 03:26:28PM +0200, Christian König wrote:
> Am 31.08.23 um 12:56 schrieb Greg KH:
> > On Thu, Aug 31, 2023 at 12:27:27PM +0200, Christian König wrote:
> > > Am 30.08.23 um 20:53 schrieb Chia-I Wu:
> > > > On Sun, Jul 23, 2023 at 6:24 PM Sasha Levin <sashal@kernel.org> wrote:
> > > > > From: Lang Yu <Lang.Yu@amd.com>
> > > > > 
> > > > > [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
> > > > > 
> > > > > When using cpu to update page tables, vm update fences are unused.
> > > > > Install stub fence into these fence pointers instead of NULL
> > > > > to avoid NULL dereference when calling dma_fence_wait() on them.
> > > > > 
> > > > > Suggested-by: Christian König <christian.koenig@amd.com>
> > > > > Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > > > ---
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
> > > > >    1 file changed, 4 insertions(+), 2 deletions(-)
> > > > We start getting this warning spew on chromeos
> > > Yeah because the older kernels still kept track of the last VM fence in the
> > > syncobj.
> > > 
> > > This patch here should probably not have been back ported.
> > > 
> > > Why was that done anyway? The upstream commit doesn't have a CC stable and
> > > this is only a bug fix for a new feature not present on older kernels.
> > It is part of the AUTOSEL process.
> 
> Could we prevent patches from being backported by adding a Fixes: tag?

Yes, that will show exactly where the patch should be backported to.

thanks,

greg k-h
