Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Nx1LRAKn2neYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:41:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D802198DC2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865F410E75F;
	Wed, 25 Feb 2026 14:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sx/BBdqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AF210E0D0;
 Wed, 25 Feb 2026 14:41:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7C3AC409D1;
 Wed, 25 Feb 2026 14:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D46C116D0;
 Wed, 25 Feb 2026 14:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772030476;
 bh=aVTY17tMnwUKrtn7cYLbaqsiDtGlfzEBFX0+Lpz9dvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sx/BBdqO1jCT/XpzOZpQhRiqaTPGyD0DaVQDZ1M7r5/+ts5AuTtHrn3ECk7gheRkT
 fi1W5v3OGnXASUc+EP3Ua37UrF59D3aXuqdm+iZuU/yuO762Ijk5XqfDHCBmDX4boP
 KILiy8HeUo0XucvswtG1D7nN8Lyz53K+uccUFgiNbbfrezMiIbgKGA0Wblh0wZ9W5r
 H+pxwNiH0JwcVcvgPGd0UGkF3VI1VTI2mR8es6DL12OjPhadhWVIy75YK4WgqOaxnz
 fzQKO2i/c3j6M9eRNyRpWfJLSIuUAzX76foUa0JIbkFeea+zljefYmTmc9oIej1je/
 57rVeF1I1p/XA==
Date: Wed, 25 Feb 2026 15:41:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aZ7h4pJlB70wf7In@zenone.zhora.eu>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 7D802198DC2
X-Rspamd-Action: no action

Hi Janusz,

...

> @@ -153,8 +153,12 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
>  			}
>  		} while (1);
>  

Perhaps we could add here:

	max_pages = max_segment >> PAGE_SHIFT;
	/* Just to be paranoic, but not necessary */
	if (!max_pages)
		max_pages = 1;


> -		nr_pages = min_t(unsigned long,
> -				folio_nr_pages(folio), page_count - i);
> +		nr_pages = min_array(((unsigned long[]) {
> +					folio_nr_pages(folio),
> +					page_count - i,
> +					max_segment / PAGE_SIZE,

max_segment >> PAGE_SHIFT ?

For clarity this can be written as

		nr_pages = min_t(unsigned long,
				folio_nr_pages(folio), page_count - i);
		nr_pages = min_t(unsigned long, nr_pages, max_pages);

But these are nitpicks, it's then up to you to choose the style.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> +				      }), 3);
> +
