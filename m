Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIIDF1U7oGmagwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:23:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279291A5A7F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1848010E912;
	Thu, 26 Feb 2026 12:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g9Kl0Ddd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AB110E040;
 Thu, 26 Feb 2026 12:23:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 06E884173E;
 Thu, 26 Feb 2026 12:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E9C19422;
 Thu, 26 Feb 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772108623;
 bh=tmoQ8NMtoL4FR91LkCRDafLZ639jNUiDpE0JDfaia4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9Kl0DdduTYqLNE0GczAwmNvQQuQvmx13FtpSNP8HCGWTi2yXbEOWKg3wXEnitl4H
 EFsDDECpkDcu/QEV1pVuGet/13kpDJzIMGrcaDgsXueU7Azkl7b2MGETmUsJHNV9il
 Tf9n8OWDEvxoiN7Kzd9GqfvxLJmT9SsuyGRkgFeRCpakXNmbESqDuzOF7LxmPKpmD5
 fAZyvDEyctsMQuYKTdP7GePcjQCgs3gR91Z4vr7D+64X38qXCQYtlJ/otFmDzfumvs
 KFH8NUR08drQMKY26uO4pk+T6pIOTvkKSCq+eD+dCvfrcdv8M+CeymX6wk66MjgUIl
 +YXdWaLu4jezQ==
Date: Thu, 26 Feb 2026 13:23:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aaA677ZYYWJptOqz@zenone.zhora.eu>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
 <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
 <10397304.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10397304.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zenone.zhora.eu:mid]
X-Rspamd-Queue-Id: 279291A5A7F
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:29:12PM +0100, Janusz Krzysztofik wrote:
> On Wednesday, 25 February 2026 16:38:18 CET Andi Shyti wrote:
> > > > For clarity this can be written as
> > > > 
> > > > 		nr_pages = min_t(unsigned long,
> > > > 				folio_nr_pages(folio), page_count - i);
> > > > 		nr_pages = min_t(unsigned long, nr_pages, max_pages);
> > > 
> > > Do you think the min_array() is less clear?  Let's see what others say.
> > 
> > min_array() is clear, it's the ((unsigned long[]) { ... }) that
> > iis nice and fancy but of difficult first read. But, as I said,
> > it can stay, I don't have a strong opinion, maybe I'd have done
> > the same.
> 
> Would you be more happy with a locally declared unsigned long table, 
> initalized with those 3 values, nr_pages - i and max_segment << PAGE_SHIFT 
> statically, folio_nr_pages(folio) once folio is ready, then passed to 
> min_array()?

mine was only an idea, I'm fine with what it is now if no one has
anything against it. Perhaps, just a little comment could help
understand why we are evaluating out of three elements (but we
are talking trivial details here :) ).

Thanks,
Andi
