Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB043BDEA5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 22:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FB86E5A4;
	Tue,  6 Jul 2021 20:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151A06E06E;
 Tue,  6 Jul 2021 20:57:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="196360477"
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="196360477"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 13:57:55 -0700
X-IronPort-AV: E=Sophos;i="5.83,329,1616482800"; d="scan'208";a="491467826"
Received: from pbarbago-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.131.218])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 13:57:53 -0700
Date: Tue, 6 Jul 2021 13:57:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/53] drm/i915: Add "release id" version
Message-ID: <20210706205752.k2lm266zu6kdyqrz@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-2-matthew.d.roper@intel.com>
 <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 01:33:50PM +0100, Tvrtko Ursulin wrote:
>
>On 01/07/2021 21:23, Matt Roper wrote:
>>From: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Besides the arch version returned by GRAPHICS_VER(), new platforms
>>contain a "release id" to make clear the difference from one platform to
>>another. Although for the first ones we may use them as if they were a
>
>What does "first ones" refer to here?

XeHP-SDV and DG2. The additional register that commit
01eb15c9165e ("drm/i915: Add DISPLAY_VER() and related macros")
talks about is not available for these platforms. Here we hardcode them
in software to something that makes sense and it allows the driver to
be properly prepared for future platforms.

>
>>major/minor version, that is not true for all platforms: we may have a
>>`release_id == n` that is closer to `n - 2` than to `n - 1`.
>
>Hm this is a bit confusing. Is the sentence simply trying to say that, 
>as the release id number is growing, hw capabilities are not simply 
>accumulating but can be removed as well? Otherwise I am not sure how 
>the user of these macros is supposed to act on this sentence.

this is explaining why those numbers can't be interpreted as
major/minor and hence why here it's called "release" rather than
"minor".

Your interpretation is correct, except that a feature not being there
doesn't necessarily mean it got removed at some point. I might just had
never been in that particular release: i.e. GRAPHICS_VER_FULL() == 14.5
doesn't necessarily mean it comes after 14.3, with additional
features/fixes.

Lucas De Marchi
