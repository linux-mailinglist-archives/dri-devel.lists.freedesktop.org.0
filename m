Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC22B143FD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 23:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A610E591;
	Mon, 28 Jul 2025 21:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J6hlhVKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1946C10E591
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 21:44:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A40E600AC;
 Mon, 28 Jul 2025 21:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C71C4CEE7;
 Mon, 28 Jul 2025 21:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1753739066;
 bh=e4qpRsRlxizUPvkIKw+wZTEquLyTGsFG6AbZAuYAuf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J6hlhVKstfGAVfcVCcw6+XhmyqGiw7p9N4a59jQox7nDjH/qkEppQae1cRg7vPy4n
 q1RrqH34k6DYMG4jKgxjZLg1tJ4JOGrVtQ3V8xcjRMN20mFm03JPOSfwTtx4WsVfNI
 i3c8G+aflc7MLDU69A6WWrv7OkJu5tu0A/ETKS2g=
Date: Mon, 28 Jul 2025 14:44:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: hughd@google.com, patryk@kowalczyk.ws, ville.syrjala@linux.intel.com,
 david@redhat.com, willy@infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, christian.koenig@amd.com, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
Message-Id: <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
In-Reply-To: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, 28 Jul 2025 16:03:53 +0800 Baolin Wang <baolin.wang@linux.alibaba.c=
om> wrote:

> After commit acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs"=
),
> we extend the 'huge=3D' option to allow any sized large folios for tmpfs,
> which means tmpfs will allow getting a highest order hint based on the si=
ze
> of write() and fallocate() paths, and then will try each allowable large =
order.
>=20
> However, when the i915 driver allocates shmem memory, it doesn't provide =
hint
> information about the size of the large folio to be allocated, resulting =
in
> the inability to allocate PMD-sized shmem, which in turn affects GPU perf=
ormance.
>=20
> To fix this issue, add the 'end' information for shmem_read_folio_gfp()  =
to help
> allocate PMD-sized large folios. Additionally, use the maximum allocation=
 chunk
> (via mapping_max_folio_size()) to determine the size of the large folios =
to
> allocate in the i915 driver.

What is the magnitude of the performance change?

> Fixes: acd7ccb284b8 ("mm: shmem: add large folio support for tmpfs")
> Reported-by: Patryk Kowalczyk <patryk@kowalczyk.ws>
> Reported-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Tested-by: Patryk Kowalczyk <patryk@kowalczyk.ws>

This isn't a regression fix, is it?  acd7ccb284b8 adds a new feature
and we have now found a flaw in it.

Still, we could bend the rules a little bit and backport this, depends
on how significant the runtime effect is.
