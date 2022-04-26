Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481550F2AF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232A610EEB0;
	Tue, 26 Apr 2022 07:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37710EEB0;
 Tue, 26 Apr 2022 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650958617; x=1682494617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=S3egy43WTJExLU3u7/k2FT8QCl0oLX3uS9BX5mAWDfo=;
 b=idzsVy16UXldV/rJRe1uBVHRw8UqrsuxRW5ITE73lFryUoSaGGFTuNQ0
 iUUBkvlF50VxQ+6dvUkQvSkSYQ5wFNArqgA24jc5twdOCULCg9xV5Oz9H
 OHe1HDU1zYy2Wksp0lPrBnW0gyAy+rHtGcTglOdqZuInubyW/6wBZzDpo
 31jNr0s9KZiZoK7EqtcLi9W+x5sXzD4eWiMkO6iEHJ6ULrdNGZ3bwjktm
 G6sSd+7Hk+9tU9X6OQZ3y5w8mZAvPVS5C2KewKu3/v2mFasV3nDJ7AOTc
 JS3wR/fZKNmss2uvc72sA2lRzwIbsucr+s2htl+RIcS9qha39xjXUgei8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265009356"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="265009356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:36:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="532528422"
Received: from vhlushch-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.136])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 00:36:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
In-Reply-To: <20220426120802.574a9659@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426120802.574a9659@canb.auug.org.au>
Date: Tue, 26 Apr 2022 10:36:50 +0300
Message-ID: <87a6c8uwh9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Zhi Wang <zhi.a.wang@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Apr 2022, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: modpost: "intel_runtime_pm_put" [drivers/gpu/drm/i915/kvmgt.ko] undefined!
>
> Possibly caused by commit
>
>   8b750bf74418 ("drm/i915/gvt: move the gvt code into kvmgt.ko")
>
> or one of tehe follow ups.
>
> I have used the drm-intel tree from next-20220422 for today.

Details at [1], fix at [2].

BR,
Jani.

[1] https://lore.kernel.org/r/87ilqxuyu3.fsf@intel.com
[2] https://lore.kernel.org/r/20220425220331.24865-1-zhi.a.wang@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
