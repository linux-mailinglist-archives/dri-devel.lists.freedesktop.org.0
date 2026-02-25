Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6lbHL3cXn2n/YwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:38:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D09C199C5E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 16:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B710E793;
	Wed, 25 Feb 2026 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPoAc/OA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F4D10E363;
 Wed, 25 Feb 2026 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772033906; x=1803569906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=51uIVEcCb4gb+d1It8eAaGS6CNeLNEuK+vziL4H4Ri4=;
 b=NPoAc/OAw7e/hWClrACzUC4cenQ2mOS8K4sxoEam0i9UmkSID1ABCc+v
 ede/CdnuA/1nv1D1LmlrfZAY78ECdlUqOY3Q3pYnIkLd79/DXehdZc26K
 Z7Mft3Ma0iri996jom10fAyBzKsQK9MysTUC5+Ja0hZVCx4ooHoq3JAXu
 eofdTstZDVJydYUU2fChqae5NGF94i6zTf2a5p2Kgz2T+LIuBptVck8zV
 Ku3lPtP2eZ2qiuLT6+2CEnWgsrzAGo3M5OP/eOaIOd8SHPSvAFEuhnQqW
 SkTiy/A+8Wr+2RzjtHUUUzv+Ls89ZUFElxaGphzjv3qeVXUDrdt+amGZs g==;
X-CSE-ConnectionGUID: MrYzIHnsQCiqk5zcxo13lQ==
X-CSE-MsgGUID: +eIDYm01T8+D4B0oPx09hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72779090"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72779090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:38:26 -0800
X-CSE-ConnectionGUID: jka7VdglRxy7hZV4SlBbkQ==
X-CSE-MsgGUID: e26hBsa+Q5uywkAApWbkUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220877144"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 07:38:21 -0800
Date: Wed, 25 Feb 2026 16:38:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
Message-ID: <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <aZ7h4pJlB70wf7In@zenone.zhora.eu>
 <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
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
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 7D09C199C5E
X-Rspamd-Action: no action

> > For clarity this can be written as
> > 
> > 		nr_pages = min_t(unsigned long,
> > 				folio_nr_pages(folio), page_count - i);
> > 		nr_pages = min_t(unsigned long, nr_pages, max_pages);
> 
> Do you think the min_array() is less clear?  Let's see what others say.

min_array() is clear, it's the ((unsigned long[]) { ... }) that
iis nice and fancy but of difficult first read. But, as I said,
it can stay, I don't have a strong opinion, maybe I'd have done
the same.

Andi
