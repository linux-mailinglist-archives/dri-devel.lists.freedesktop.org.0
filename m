Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLvjIjgTn2nWYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:20:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F90E199774
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D36A10E77F;
	Wed, 25 Feb 2026 15:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1K0a6sJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84210E17F;
 Wed, 25 Feb 2026 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772032821; x=1803568821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C04skGnwp4ewKNiFr0TWzFbvtmCEOXTudVcZnez9cuU=;
 b=X1K0a6sJCjCFQhivC/wOHv63xKl55vOSCCsYhHnUOOIfL/eey1wv85d8
 v9BsFVcIiHUzigmms1fBeBcoQZQiI8O36puM7ebzTwhkp05+1HyxX4yPv
 168wVvZsE566q/qawT4t9dQsbMbj06+ycivR6qT78IUYjQ4AeQuNxK53X
 3LdWzNJiUJOMF+QvgyI+MowdjVSQlYAiIUG/yj92/RWDrJuJOtCu+K0JO
 trUQ7vk7LgAgI6EjecOm6xh/rtO/O57bdrGL6E1RCMxmSnCUG+Be5aKF9
 KYGgKoUQsFQjY3hNHh2VCc0IEubly4FHFx96lCvtTpZqfJryVnaNMsh8i w==;
X-CSE-ConnectionGUID: 1J1VHst7R4uCpfh4hDIytg==
X-CSE-MsgGUID: UVv36JKhS8Sxmpv41SnFcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84436228"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="84436228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:20:21 -0800
X-CSE-ConnectionGUID: C+RxnuYKSD6HbZbNZWi5Rg==
X-CSE-MsgGUID: 4KPaL44XS0mD9DmMLSoViw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="213936341"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.81])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:20:17 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
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
Date: Wed, 25 Feb 2026 16:11:31 +0100
Message-ID: <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aZ7h4pJlB70wf7In@zenone.zhora.eu>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <aZ7h4pJlB70wf7In@zenone.zhora.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	CTE_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[janusz.krzysztofik@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jkrzyszt-mobl2.ger.corp.intel.com:mid]
X-Rspamd-Queue-Id: 4F90E199774
X-Rspamd-Action: no action

Hi Andi,

Thanks for review.

On Wednesday, 25 February 2026 15:41:13 CET Andi Shyti wrote:
> Hi Janusz,
> 
> ...
> 
> > @@ -153,8 +153,12 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
> >  			}
> >  		} while (1);
> >  
> 
> Perhaps we could add here:
> 
> 	max_pages = max_segment >> PAGE_SHIFT;
> 	/* Just to be paranoic, but not necessary */
> 	if (!max_pages)

GEM_BUG_ON(!max_pages), I would rather say.  The max_segment comes from 
drivers/gpu/drm/i915/i915_scatterlist.h:i915_sg_segment_size(struct device *dev),
let's assume that can't be that much broken.

> 		max_pages = 1;
> 
> 
> > -		nr_pages = min_t(unsigned long,
> > -				folio_nr_pages(folio), page_count - i);
> > +		nr_pages = min_array(((unsigned long[]) {
> > +					folio_nr_pages(folio),
> > +					page_count - i,
> > +					max_segment / PAGE_SIZE,
> 
> max_segment >> PAGE_SHIFT ?

Yeah, shift seems more optimal than division here, however, I've just followed 
the patter used a few lines below. where we can see a multiplication, not a 
right shift, and since PAGE_SIZE is a constant, I hope the compiler will 
optimize that.

> 
> For clarity this can be written as
> 
> 		nr_pages = min_t(unsigned long,
> 				folio_nr_pages(folio), page_count - i);
> 		nr_pages = min_t(unsigned long, nr_pages, max_pages);

Do you think the min_array() is less clear?  Let's see what others say.

> 
> But these are nitpicks, it's then up to you to choose the style.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you,
Janusz

> 
> Thanks,
> Andi
> 
> > +				      }), 3);
> > +
> 




