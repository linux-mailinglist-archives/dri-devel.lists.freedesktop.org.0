Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN6YGj6Limk5LwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:34:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7D116027
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 02:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F2910E139;
	Tue, 10 Feb 2026 01:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2n4Qvnv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712A310E139;
 Tue, 10 Feb 2026 01:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F2CE60008;
 Tue, 10 Feb 2026 01:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F5BC116C6;
 Tue, 10 Feb 2026 01:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1770687287;
 bh=T/HCmpcNqFcFD7xZ86y+ZqO8jXnLnbpyYwBENPJl2eI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2n4Qvnv3dtojiMggwW254KgxnSn9CjO1dUWy3GOSer8V7sbAUuJUTPUZ4qine7txY
 V0v6T4Ggpk2LSpnLqB0OWN7YCvMGMU4/BzUzjxpvxFWoZLP+xlzPqjvxQstWW9Gw/O
 Yq/kTGRQ24+XqR4ouSD4ZmCR29P6yO2J3fgcgqNA=
Date: Mon, 9 Feb 2026 17:34:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Matthew Brost <matthew.brost@intel.com>, John
 Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-Id: <20260209173446.b76547c4028132f71de1b8eb@linux-foundation.org>
In-Reply-To: <89cb1d4744789702cd80dba8eb40dd50bf053b4e.camel@linux.intel.com>
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
 <89cb1d4744789702cd80dba8eb40dd50bf053b4e.camel@linux.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,linux-foundation.org:dkim,linux-foundation.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EDC7D116027
X-Rspamd-Action: no action

On Mon, 09 Feb 2026 15:47:38 +0100 Thomas Hellstr=F6m <thomas.hellstrom@lin=
ux.intel.com> wrote:

> @Alistair, any chance of an R-B for the below version?

Yes please.

> @Andrew, will this go through the -mm tree or alternaltively an ack for
> merging through drm-xe-fixes?

Either works.  I'll grab a copy.  It you want to take this via drm then
I'll drop the mm.git copy once the drm tree's version appears in linux-next.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

> > The lru_add_drain_all() function requires a short work-item

Pet peeve: s/the foo() function/foo()/g.  It's just as good!

> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > =A0				unlock_page(vmf->page);
> > =A0				put_page(vmf->page);
> > =A0			} else {
> > -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +				pte_unmap(vmf->pte);
> > +				softleaf_entry_wait_on_locked(entry, vmf->ptl);
> > =A0			}
> > =A0		} else if (softleaf_is_hwpoison(entry)) {
> > =A0			ret =3D VM_FAULT_HWPOISON;

So apart from the rename, this is the whole patch.  This got nicer!
