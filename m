Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E888B48DD9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9243210E509;
	Mon,  8 Sep 2025 12:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRiuYp9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430A710E214;
 Mon,  8 Sep 2025 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757335439; x=1788871439;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=w83WVjdsSpxuD8gScr0VDwouKP5uJ/QoPOHGCH8nxJc=;
 b=bRiuYp9eMcfasYzaI6KTdkrbD4o1FYcJ47SO3CUVYXI7HouhSDQXMxOl
 OVS9a5FV7b/HxwIHCcSz5EfRMwZjuKAqFrO10/5fMlHka09Wh6UW/T00r
 h/6XepkNgMbWIIo2Ilv2X5iheH7/W+QWrvqN/FXoXYa1VbhCm4GZ8UI46
 a33aAUyuzGxVTZZMSpm+cb8s2qd/e5VnItmBJ9D4jVAYvNdRFM5jMC1sN
 mDy/DJmPuOaI+n2Z/sRrmMq7slz1Ef4zvZJsA5czpQKXDBhtXhatgD23l
 QpfYND3Agk620QarGk+H2q53lwfZJV8sq9UjnI2FNHTX+xQYfCkErnpTo A==;
X-CSE-ConnectionGUID: 3PGHu0xPR8a74b+CHCR5Yw==
X-CSE-MsgGUID: Bf3Kv6Y7Q+aD6V2WCiQnyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85033402"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85033402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:43:59 -0700
X-CSE-ConnectionGUID: kz/L9M0dSPSgPXsRVrCfIg==
X-CSE-MsgGUID: T6gKGMO/R+qglbI7tLRsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="176836358"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:43:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, Jouni
 =?utf-8?Q?H=C3=B6gander?=
 <jouni.hogander@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
In-Reply-To: <202509040927.30BEE17@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-3-jani.nikula@intel.com>
 <202509031942.A1669D10F@keescook>
 <eb4a61f86330afe95e232cc515f117ed602e108d@intel.com>
 <202509040927.30BEE17@keescook>
Date: Mon, 08 Sep 2025 15:43:52 +0300
Message-ID: <f73e233395bbc25f77f8345fde99b3b84c092823@intel.com>
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

On Thu, 04 Sep 2025, Kees Cook <kees@kernel.org> wrote:
> On Thu, Sep 04, 2025 at 10:34:04AM +0300, Jani Nikula wrote:
>> On Wed, 03 Sep 2025, Kees Cook <kees@kernel.org> wrote:
>> > On Fri, Aug 29, 2025 at 08:46:01PM +0300, Jani Nikula wrote:
>> >> Move the range_overflows() and range_end_overflows() along with the _t
>> >> variants over from drm/i915 and drm/buddy to overflow.h.
>> >> 
>> >> Cc: Kees Cook <kees@kernel.org>
>> >> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
>> >> Cc: linux-hardening@vger.kernel.org
>> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > Looks good to me! :)
>> >
>> > Reviewed-by: Kees Cook <kees@kernel.org>
>> 
>> Cool, thanks! How do you want to handle merging this?
>
> Since it's touching drm, feel free to take it there. I'm not worried
> about conflict resolution in overflow.h.

Thanks a lot, series merged to drm-intel-next with Jouni's r-b and
Thomas' IRC ack.

BR,
Jani.


-- 
Jani Nikula, Intel
