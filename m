Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNgWMnIxn2lXZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:29:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3519B8F9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85710E817;
	Wed, 25 Feb 2026 17:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMarFZur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE5C10E816;
 Wed, 25 Feb 2026 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772040559; x=1803576559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rRhiG+Az1wT1j6b/Jn1XoF/E4c/Tlz9HWN0jGTXIgFg=;
 b=VMarFZurJQrSK+5DLlLxG54JVoQ+oZqW12NXOF7n2guEx2twGc+J89o8
 epRANH9Fuz3C6p0Z4mxiQYRc+dmZNB0qHRiyoSdKtwTE4uvKwnf6ZKPHk
 MqZZoZjDtB+IzZ9PfhOtlvn1t6JhyhfPb20RjbkpQ9+Yiy0wnJ7S7a9X6
 ZOokw6gfw1j11i3N21VQaD9QBsGuS8iSvQtA0YjEneJ6T55I8MqZYaXLp
 eTbrmQa1UDVPz3aWq7ryVQ/znb9TMX/ZIAEU9KqoMc+C9h7lTp/xwTL4r
 grlZ2tI5h3QVfnOzFCHYodpncd5wgg6sUsUfhuv+Ambxaa0MKMnSjQ3MG g==;
X-CSE-ConnectionGUID: 0Ltt2gDRRSS7hToCtu9QcQ==
X-CSE-MsgGUID: YuNkxBA4QiubaTkb26kfNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73193681"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73193681"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:29:18 -0800
X-CSE-ConnectionGUID: s8bHyPrwTomLIyadqLigYg==
X-CSE-MsgGUID: qdPgP+CBQ6OxJBE9vEr9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216444884"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 09:29:15 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
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
Date: Wed, 25 Feb 2026 18:29:12 +0100
Message-ID: <10397304.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
 <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
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
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,jkrzyszt-mobl2.ger.corp.intel.com:mid]
X-Rspamd-Queue-Id: 83C3519B8F9
X-Rspamd-Action: no action

On Wednesday, 25 February 2026 16:38:18 CET Andi Shyti wrote:
> > > For clarity this can be written as
> > > 
> > > 		nr_pages = min_t(unsigned long,
> > > 				folio_nr_pages(folio), page_count - i);
> > > 		nr_pages = min_t(unsigned long, nr_pages, max_pages);
> > 
> > Do you think the min_array() is less clear?  Let's see what others say.
> 
> min_array() is clear, it's the ((unsigned long[]) { ... }) that
> iis nice and fancy but of difficult first read. But, as I said,
> it can stay, I don't have a strong opinion, maybe I'd have done
> the same.

Would you be more happy with a locally declared unsigned long table, 
initalized with those 3 values, nr_pages - i and max_segment << PAGE_SHIFT 
statically, folio_nr_pages(folio) once folio is ready, then passed to 
min_array()?

Thanks,
Janusz

> 
> Andi
> 




