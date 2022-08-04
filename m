Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202D45899B1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC692855;
	Thu,  4 Aug 2022 09:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4092834;
 Thu,  4 Aug 2022 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659604033; x=1691140033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fgOs0zhFDXaZ74xBS94GrKBPQtig/GO2LFJppdFzxRg=;
 b=FtJP+QAgvrXu2NS7NhROB1t2libgbXb5fQ2LbJGgG2zzD+sN0k6LrqYa
 yDkXWdgL9J/yJIYnDKxIn97YUZ1MLdzfqigPj1Zs0rbJX//jDn8tljB9r
 R/i9YlXML9gw0Wo+Jlcrm4hX6Wbn6Pwfyu9xGsv3J3gqNvXH6SUK0tV3R
 qm+kX02/+HEwYI75n29KLBExmEKYmOhd0GjZ3emUAhIN3/aWoOqy7xvt1
 k3+hJ9U7kmKasNBnAxCO0hi44PaYEJZzeJlegHfZLJ4E9JX5h0rgK1ZA8
 L9CKQ7HIKJuj2MYOvhSpXNmTB/mWSrzYvldKB7S+311lwZTAgfJjllHUk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="376185768"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="376185768"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:07:11 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="662455880"
Received: from pbaileyx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.214.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:07:08 -0700
Date: Thu, 4 Aug 2022 11:06:52 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility
 macros into drm util header
Message-ID: <YuuMLN4jDnCrE0hq@alfio.lan>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
 <YuESy0q5X9pksg9M@alfio.lan> <875yj9qv62.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yj9qv62.fsf@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mchehab@kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

> >> It moves overflows_type utility macro into drm util header from i915_utils
> >> header. The overflows_type can be used to catch the truncation between data
> >> types. And it adds safe_conversion() macro which performs a type conversion
> >> (cast) of an source value into a new variable, checking that the
> >> destination is large enough to hold the source value.
> >> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
> >> while compiling.
> >> 
> >> v3: Add is_type_unsigned() macro (Mauro)
> >>     Modify overflows_type() macro to consider signed data types (Mauro)
> >>     Fix the problem that safe_conversion() macro always returns true
> >> v4: Fix kernel-doc markups
> >> 
> >> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >> Cc: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Nirmoy Das <nirmoy.das@intel.com>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >> ---
> >>  drivers/gpu/drm/i915/i915_utils.h |  5 +-
> >>  include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
> >>  2 files changed, 78 insertions(+), 4 deletions(-)
> >
> > Jani and Mauro suggested to have this macro in
> > include/drm/drm_util.h.
> 
> I can't recall suggesting such a thing. The macros in question have
> nothing specifically to do with i915 *or* drm. They are generic, and
> should be in generic kernel headers.
> 
> We must stop piling up generic and generally useful stuff in our own
> headers.

Yes, I agree with you and I think there was already such
discussion whether to move this into generic kernel headers or in
drm header.

Gwan-gyeong, any thoughts or further plans to move this to a
different place? It's been already three people (and I'm
including myself here) recommending to have this in a different
place.

Andi

> I thought I've been clear about this all along.

Thanks, Jani!

Andi
