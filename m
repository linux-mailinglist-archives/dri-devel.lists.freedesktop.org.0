Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161788CFD8B
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927E310F9C4;
	Mon, 27 May 2024 09:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJrnD9oC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A02010F9C4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716803753; x=1748339753;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M+Et+kEb27eC9WnXYCyKDe4US6PGOlzSutW3BPUVppI=;
 b=lJrnD9oCamgItbxuNr5cnIRcUB3dasVqgKqobNQs4YGJEKyGI/tnvHes
 rIxeU/LUkbRw95M999s6QSsfONrXM1AcJynPBiuV+RUqkO+fjXBrV4GGm
 zQmIysOzzt72MIYWPYCFypTE6uIsOKHtfldcQKZL16ohAlRcdZm32fqJc
 1dZg2ZTRHah+i/YdgNb0tJtUiOU3nW1QZaW90nnDiJSRcCAmG6nqn1h2J
 eHjAMYi5qVW3v9DMGiZkXz5jhXvMdmYY0B+snxnON5PzEtNq29qdXxK0z
 kdcaHZGQal2qTlfYG94CYgneWxApMbhWNO9xWeMgDGwx89X2MWWyaaWR6 w==;
X-CSE-ConnectionGUID: 2Tr8A7p1RGCJ4iUvgll5PQ==
X-CSE-MsgGUID: CThJtZpTRTmXpk1oufBPyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="35629153"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="35629153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:55:52 -0700
X-CSE-ConnectionGUID: fUz4+237Sym9WX23C2J+2A==
X-CSE-MsgGUID: h/kulZvhSwKsBZxVr8kbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34717924"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.200])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 02:55:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@redhat.com, sean@poorly.run
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] drm/udl: Untangle .get_modes() and .detect_ctx()
In-Reply-To: <2a5584c0-9bc3-490f-9f11-9a153b24b774@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410120928.26487-1-tzimmermann@suse.de>
 <20240410120928.26487-5-tzimmermann@suse.de> <87ttj5hnei.fsf@intel.com>
 <2a5584c0-9bc3-490f-9f11-9a153b24b774@suse.de>
Date: Mon, 27 May 2024 12:55:47 +0300
Message-ID: <87wmnfmvdo.fsf@intel.com>
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

On Fri, 10 May 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 10.05.24 um 14:17 schrieb Jani Nikula:
>>> +	/*
>>> +	 * The adapter sends all-zeros if no monitor has been
>>> +	 * connected. We consider anything else a connection.
>>> +	 */
>>> +	return memcmp(no_edid, hdr, 8) != 0;
>> Nitpick, this works, but you can drop the no_edid buf by using:
>>
>> 	return memchr_inv(hdr, 0, sizeof(hdr));
>
> Makes sense to me. Thanks for reviewing.

Btw I wrote [1] because !memchr_inv() is a bit obscure.

BR,
Jani.


[1] https://lore.kernel.org/r/20240527094320.2653177-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
