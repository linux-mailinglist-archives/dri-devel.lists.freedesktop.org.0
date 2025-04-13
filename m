Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE1EA871DE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 13:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853610E1D9;
	Sun, 13 Apr 2025 11:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="BGhT3Y2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F8310E1D9;
 Sun, 13 Apr 2025 11:31:26 +0000 (UTC)
Received: from localhost (unknown [10.10.165.18])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0BC784487873;
 Sun, 13 Apr 2025 11:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 0BC784487873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1744543877;
 bh=RoiB+6K4balMwOqjDxvX20TNHB/AXBNeQ7kZn+PUhFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BGhT3Y2jA6UXr23ZvjvPSC3lQHFla1z13HdxeE12BwQW7gHpRBlU2RYKL1X8CTEvs
 VAehhf7gDVJR699V+u55SA7u6KGM6NgAL6g2RDpcfXJuMGBddA3SrIMLpsZPCgi0k6
 brurd1tyjLnTPWRxThtAuBSWEzbFxg0SB0lbeE3w=
Date: Sun, 13 Apr 2025 14:31:16 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number
 of BOs in list
Message-ID: <fgd6hrllcwj2guhr4mwzfblhausluczprlbjqhsqiqeshoq2g2@jgi4rgufn6wx>
References: <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
 <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
 <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
 <b7286f30-15ac-4803-b204-0fe6f2423f73@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7286f30-15ac-4803-b204-0fe6f2423f73@amd.com>
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

On Thu, 10. Apr 11:07, Christian König wrote:
> Am 09.04.25 um 19:27 schrieb Linus Torvalds:
> > The VM layer allows larger allocations. But the "this is a simple
> > allocation, choose kmalloc or vmalloc automatically based on size"
> > helper says "you are being simple, I'm going to check your arguments
> > are actually sane".
> >
> > So the drm code can easily have a function that validates the input
> > for your specific cases, and then you (a) don't need the helper
> > function that does the overflow protection and (b) don't want it.
> >
> > But it should actually validate arguments for real sanity at that
> > point. Not just open-code kvmalloc() without the sanity check.
> 
> Yeah, exactly that has been proposed by driver maintainers before and we just rejected it on the subsystem maintainers level.
> 
> For this particular use case here I will propose some hopefully high enough hard coded limit, but I can't guarantee that this will work for all use cases.

FWIW, the current code anyway has this limit being some sort of 4Gb, not
more.

The resulting calculation of `bytes` wraps at 32 bits albeit itself being
of type *unsigned long*.

	/* copy the handle array from userspace to a kernel buffer */
	r = -EFAULT;
	if (likely(info_size == in->bo_info_size)) {
		unsigned long bytes = in->bo_number *
			in->bo_info_size;

		if (copy_from_user(info, uptr, bytes))
			goto error_free;

