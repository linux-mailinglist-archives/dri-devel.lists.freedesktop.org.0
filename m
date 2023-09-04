Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6983791292
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108F810E2C0;
	Mon,  4 Sep 2023 07:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC6B10E105;
 Mon,  4 Sep 2023 07:52:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 691286607239;
 Mon,  4 Sep 2023 08:52:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693813940;
 bh=qDLcWoPKJotDDqdrPehwbo7fA/IUDDuKz/QM3kq8ocE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MuENvPRR5UPyp0YvJWlgBkS6v3RyftroIhFz7PClFmI2fzjxoanJhm3XAM/eVo3NV
 6jwj6h/Yiudb6UKZD7BiQa855ndK0057ROLNsWRhtorn4Cj64oIXCx4Kfawn7shVJL
 RJYakEPjwjg/KaRe5qhbHJ+G/oil8ZZXQJQ0MglUa8H1VDqUuupiXM0r2roNKxm0f4
 sXqfdWCuq5QLZCt0o1lXBtD90D8hIVItH5PvSTTgQKYg4hu7wxx58eAqsk5jAGRxmh
 YZeDJHJS3lBHHHXuKlXhSBRKeO5/pPK1aFCwywRpvWapn9ftwe/w8IVnTPInt88p1y
 xU971xAGvEKIA==
Date: Mon, 4 Sep 2023 09:52:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v15 02/23] drm/shmem-helper: Use flag for tracking page
 count bumped by get_pages_sgt()
Message-ID: <20230904095217.06eb80f0@collabora.com>
In-Reply-To: <1a40d9c6-fdbf-1494-00f2-1e37206fc984@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
 <20230827175449.1766701-3-dmitry.osipenko@collabora.com>
 <20230828125518.7b926fc6@collabora.com>
 <1a40d9c6-fdbf-1494-00f2-1e37206fc984@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 intel-gfx@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Sep 2023 21:28:21 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> On 8/28/23 13:55, Boris Brezillon wrote:
> > On Sun, 27 Aug 2023 20:54:28 +0300
> > Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> >   
> >> Use separate flag for tracking page count bumped by shmem->sgt to avoid
> >> imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
> >> to assume that populated shmem->pages at a freeing time means that the
> >> count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
> >> the ambiguity.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
> >>  drivers/gpu/drm/lima/lima_gem.c        | 1 +
> >>  include/drm/drm_gem_shmem_helper.h     | 7 +++++++
> >>  3 files changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> index 78d9cf2355a5..db20b9123891 100644
> >> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> >> @@ -152,7 +152,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
> >>  			sg_free_table(shmem->sgt);
> >>  			kfree(shmem->sgt);
> >>  		}
> >> -		if (shmem->pages)
> >> +		if (shmem->got_sgt)
> >>  			drm_gem_shmem_put_pages(shmem);  
> > 
> > Can't we just move this drm_gem_shmem_put_pages() call in the
> > if (shmem->sgt) block?  
> 
> As you've seen in patch #1, the shmem->sgt may belong to imported dmabuf
> and pages aren't referenced in this case.

Unless I'm wrong, you're already in the if (!import_attach) branch
here, so shmem->sgt should not be a dmabuf sgt.

> 
> I agree that the freeing code is confusing. The flags make it a better,
> not ideal. Though, the flags+comments solution is good enough to me.

But what's the point of adding a flag when you can just do an
if (!shmem->import_attach && shmem->sgt) check. At best, it just
confuses people as to what these fields mean/are used for (especially
when the field has such a generic name, when what you want is actually
something like ->got_sgt_for_non_imported_object). But the most
problematic aspect is that it adds fields to maintain, and those might
end up being inconsistent with the object state because
new/driver-specific code forgot to update them.

> Please let me know if you have more suggestions, otherwise I'll add
> comment to the code and keep this patch for v16.

I'd definitely prefer adding the following helper

static bool has_implicit_pages_ref(struct drm_gem_shmem_object *shmem)
{
	return !shmem->import_attach && shmem->sgt;
}

which provides the same logic without adding a new field/flag.

> 
> BTW, I realized that the new flag wasn't placed properly in the Lima
> driver, causing unbalanced page count in the error path. Will correct it
> in v16.

See, that's the sort of subtle bugs I'm talking about. If the state is
inferred from other fields that can't happen.
