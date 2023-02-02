Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7386884CD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 17:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2EC10E2DE;
	Thu,  2 Feb 2023 16:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52DF10E2DE;
 Thu,  2 Feb 2023 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675356684; x=1706892684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Za+wQyIm1VNLCWPDVgOum8ffbvKuzJo8gSoNogx74LI=;
 b=AohwrahNDWibsgnaumqkkFNbQ7+HmW7mOYeeBEUBpb6ugJo/Q5tuGOZE
 zsnlWEJ+e1HYgNjgI3X+LNTWyAyk7ADkWbodDIG+8xYynzhA29fPwhyM8
 eBITFGlX7nCPYN9eSD1ofnJTQYp3r6AU8L26orsxngVqVbAXGqDWDO8iN
 vC3IzNAJDR/VJ0Z15ZMMD5UQmLGzrvyQb/d5DR+oM+XSUgZnCaPpMeneP
 qpVegOeq+EJE4kC7O99CA+fTwGW5/oQLCgfpD70PbWOKC+VhhLY5OABMu
 YXcjbxWt8eqwDtydmcg9xGu0MMIJd1iaBqDT6BBkMQd/9G5PgzQq5PX0c w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="308839593"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308839593"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:51:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="910822227"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="910822227"
Received: from mrogowsx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.12])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 08:51:19 -0800
Date: Thu, 2 Feb 2023 17:51:17 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v10 22/23] drm/i915/vm_bind: Properly build persistent
 map sg table
Message-ID: <Y9vqBSgQ4CcU78zf@ashyti-mobl2.lan>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
 <20230118071609.17572-23-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118071609.17572-23-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Jan 17, 2023 at 11:16:08PM -0800, Niranjana Vishwanathapura wrote:
> Properly build the sg table for persistent mapping which can
> be partial map of the underlying object. Ensure the sg pages
> are properly set for page backed regions. The dump capture
> support requires this for page backed regions.
> 
> v2: Remove redundant sg_mark_end() call
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
