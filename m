Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A641C519
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D996EA5E;
	Wed, 29 Sep 2021 13:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C056E1B4;
 Wed, 29 Sep 2021 13:00:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="285949035"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="285949035"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 06:00:08 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="538804306"
Received: from jmaugusx-mobl1.gar.corp.intel.com (HELO [10.249.254.159])
 ([10.249.254.159])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 06:00:07 -0700
Message-ID: <47008b56656bcc908e010570962836c7defa2250.camel@linux.intel.com>
Subject: Re: [PATCH v5 10/13] drm/i915: try to simplify make_{un}shrinkable
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Wed, 29 Sep 2021 15:00:04 +0200
In-Reply-To: <20210927114114.152310-10-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
> Drop the atomic shrink_pin stuff, and just have make_{un}shrinkable
> update the shrinker visible lists immediately. This at least
> simplifies
> the next patch, and does make the behaviour more obvious. The
> potential
> downside is that make_unshrinkable now grabs a global lock even when
> the
> object itself is no longer shrinkable(transitioning from purgeable <-
> >
> shrinkable doesn't seem to be a thing), for example in the ppGTT
> insertion paths we should now be careful not to needlessly call
> make_unshrinkable multiple times. Outside of that there is some
> fallout
> in intel_context which relies on nesting calls to shrink_pin.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Hmm. One thing that worries me a bit here: Let's say we have, for
example an LMEM context state, and TTM has it made unshrinkable. Then
the context becomes active and calls _make_unshrinkable again. And when
it retires it callse _make_shrinkable. Doesn't it end up on the
shrinker list at that point, even if still in LMEM?

/Thomas


