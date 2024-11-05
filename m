Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A49BCC78
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 13:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8510E0C9;
	Tue,  5 Nov 2024 12:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6acrvTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B80410E0C9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 12:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730808882; x=1762344882;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cFN9Xi7zbwW8Lbp17OXrT0RmSo0R5r3AhH+xFP4sMEk=;
 b=F6acrvTjudgX7oSKp0Cfs68phmsFyV8FRrK7YKxjXjl1EZLnrLdTpktq
 Pr+T0ZPsC+GTMn8OHKW3yZe26yQkOeLTzmqoIerye8psd5+S0zv+jUwmy
 bMVtvSUQnaSoI1pwYbT2iNAzD68XSLNl1Mr8pi6iEAVw4PvSV6TClQ/qY
 /TUUpf2t0TDYRxjrnmzyehYyRUKiFfOulycqZdJBB12utS4jivwr+M59T
 luKnfJm1Mmd2BbuJ4f0cMjnmA3N1CYB/EocmCIouYLDyfZTs7F63wkruK
 3tRR5DOM9sOqTU0mJZAHiLxI1pphO0vgig89mwYPcwwfhCzuT0msr/3OM g==;
X-CSE-ConnectionGUID: zO1k0qNvTWyOKZ6CLS2BwQ==
X-CSE-MsgGUID: YBWNQ51MRFy/hZEFwZnUEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53122050"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53122050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 04:14:42 -0800
X-CSE-ConnectionGUID: CewnJVQTR0i0iN4PYtRANw==
X-CSE-MsgGUID: iK/JUNqaSI6diy0KIeGdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="87935319"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 04:14:40 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Gray <jsg@jsg.id.au>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: use ATOMIC64_INIT() for atomic64_t
In-Reply-To: <Zyn-3sJGdJEgzF9F@largo.jsg.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111023045.50013-1-jsg@jsg.id.au>
 <87bk9suraz.fsf@intel.com> <Zyn-3sJGdJEgzF9F@largo.jsg.id.au>
Date: Tue, 05 Nov 2024 14:14:36 +0200
Message-ID: <87fro5ho7n.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 05 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> On Thu, Jan 11, 2024 at 11:56:20AM +0200, Jani Nikula wrote:
>> On Thu, 11 Jan 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
>> > use ATOMIC64_INIT() not ATOMIC_INIT() for atomic64_t
>> >
>> > Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
>> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
>> 
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> This patch didn't get merged.  Should I resend it?

Apologies, it fell between the cracks. Pushed to drm-misc-next now,
thanks for the patch.

BR,
Jani.


-- 
Jani Nikula, Intel
