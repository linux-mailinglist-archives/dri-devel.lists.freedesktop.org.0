Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11759A2C12F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 12:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35510EAC0;
	Fri,  7 Feb 2025 11:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEaVoHlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD6310EABE;
 Fri,  7 Feb 2025 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738926288; x=1770462288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z7AWC7cEJQR2Xez4ESakcjQvGOcNMRHSVon+moZHDRQ=;
 b=cEaVoHlTeX0GCkEYyqJZ/6MQadIpH0W8SUAIqxc1gbIgL12aQzzJlxes
 s4J++aal7vvg+lRl/U1T9DdP9mrRzQpcLMtoTQWJDbgx5RxNixAhaR86J
 nVUoo2kQ5BrOxA66ep7LX63sGT/EiNq4PqhNlnCVr3h0vkFnmj6ylDzO/
 EhUJBKoWuhSoARfbs5JDhpg7mP/1E4lJ0EU4OVWaj95HUHtILlu2ly+xE
 4ZozmzsXtwNCvm2zzp+BhP5FS0SJpmQMXhN7oI2N4KFCiEhdaoXeL8UTV
 Xy4VzU6zSzG4EzRCSYhk7Xl7tniAwzPTWGH53Lz2sKqiWqS1D2G0SbkvZ Q==;
X-CSE-ConnectionGUID: csPWf9+BQO+nBzZ5/rJbMA==
X-CSE-MsgGUID: W1vqrUZeTlS6QbVPE864BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27171264"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="27171264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:04:48 -0800
X-CSE-ConnectionGUID: eULHLgzER9+dgkAp4I6OLw==
X-CSE-MsgGUID: fi2GWJneTdq0KGj+SiOweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111282496"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.140])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:04:42 -0800
Date: Fri, 7 Feb 2025 12:04:38 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Josef Bacik <josef@toxicpanda.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Brian Geffon <bgeffon@google.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/i915: Fix NULL vs IS_ERR() check in
 __shmem_writeback()
Message-ID: <Z6Xoxpa8tKb6Fx2U@ashyti-mobl2.lan>
References: <7f99a56b-d517-40b0-92b7-421c4fd813f2@stanley.mountain>
 <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6XoU6GopCT-CxNK@ashyti-mobl2.lan>
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

> > -		if (!folio)
> > +		if (IS_ERR(folio))
> 
> I don't see this patch yet in -next yet (and of course not in
> drm-tip), which branch is it based on?

To be precise, not this patch, but the patch(*) that this is fixing :-)

Andi

(*) "drm/i915/gem: Convert __shmem_writeback() to folios" from
Kirill
