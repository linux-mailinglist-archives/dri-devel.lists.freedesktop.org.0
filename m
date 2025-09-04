Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11DB4341B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9E610E9A1;
	Thu,  4 Sep 2025 07:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6LTMTvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D177210E9A1;
 Thu,  4 Sep 2025 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756971251; x=1788507251;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=L/bWGeB8kTEOn+PN/IeMrwA0U0cVwwjEnV+25ziMZ9E=;
 b=T6LTMTvn0X+vSEvRy7YrG5CBVYg38xEicz0nTveAho9CZy2ieu9Ojf27
 2TRveF9FofdOh/qfJvuvh002LJvx7maOiVYKk7S7EiN9J+8Wv1RXipDYR
 CDf6KkwTXxZ8MHEbqb3Q0FBBYI2HM4DWGrZugl5e2QLUsOpm5NZySj0oS
 z1Y7/k8WL2xBe0sU4ZngfHFsakTx3hfnp/PxOerrWhS+ozclpU98XKeBW
 xsTRY+eFZvp4hza1MZJxA1s3Dovw7K3TrvEcbHqDxrmFet/SSgAuMXvs3
 Ke1izfpl4e1C8E7nbkUwxhQ1S9MPEtqWb9s49t0vZYDgrW5SxbJC3G3fc A==;
X-CSE-ConnectionGUID: ji9Y/at5RISk5ikkf3X4KQ==
X-CSE-MsgGUID: bikM2Pe9TWi5JXc2t2vRJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59369855"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="59369855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:34:11 -0700
X-CSE-ConnectionGUID: jcYrLhqzS1qmJh6Hprb+UQ==
X-CSE-MsgGUID: okMTWexWT5yQoiSVO9wCaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="176157061"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.79])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 00:34:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
In-Reply-To: <202509031942.A1669D10F@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-3-jani.nikula@intel.com>
 <202509031942.A1669D10F@keescook>
Date: Thu, 04 Sep 2025 10:34:04 +0300
Message-ID: <eb4a61f86330afe95e232cc515f117ed602e108d@intel.com>
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

On Wed, 03 Sep 2025, Kees Cook <kees@kernel.org> wrote:
> On Fri, Aug 29, 2025 at 08:46:01PM +0300, Jani Nikula wrote:
>> Move the range_overflows() and range_end_overflows() along with the _t
>> variants over from drm/i915 and drm/buddy to overflow.h.
>> 
>> Cc: Kees Cook <kees@kernel.org>
>> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
>> Cc: linux-hardening@vger.kernel.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Looks good to me! :)
>
> Reviewed-by: Kees Cook <kees@kernel.org>

Cool, thanks! How do you want to handle merging this?

BR,
Jani.


-- 
Jani Nikula, Intel
