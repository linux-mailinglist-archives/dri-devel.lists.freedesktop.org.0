Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B746386C7FA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A0510E48B;
	Thu, 29 Feb 2024 11:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtRc+cej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B19910E482;
 Thu, 29 Feb 2024 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709205794; x=1740741794;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=f3ZtAwljYxwyxuuK+3Yz6stTxNGL+mNEFtKkGt6M85w=;
 b=LtRc+cejTdoUppF2sRg2laetDBG1bT0q8zhkJYcYXFoRkCbfwDo2D/ps
 I7a9UYvr5IdL1RSymokvUvjudQAoWBks+b7WfwT6BxrqN5W10dxuACxJf
 xA6bX+QeWhLEjJANzXqqhJ+P/OGjkNCAlZYxhZ3aTnGB37ypMLVCdl+2W
 59GeSyEBE8Zz2QTBw2xrmamGSYObmSQoSXNCKvjzeWh6y51VfjKwnCieZ
 n5YTSsjMkKfOdFxXpHJpsa/ewHCXjLfNfieIDD8NA/tTS/5+bV5DqtPXZ
 wtU/Orp3ENzMXkYmjgvKZeECuFqP1EZS8xepD9RBaQopY6c/xmnXo3YDh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3833780"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3833780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7830135"
Received: from smatua-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.47.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:23:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v12 2/8] drm: Add Adaptive Sync SDP logging
In-Reply-To: <4b7b2711-040c-4aed-ab05-e752527cf5cb@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-3-mitulkumar.ajitkumar.golani@intel.com>
 <4b7b2711-040c-4aed-ab05-e752527cf5cb@intel.com>
Date: Thu, 29 Feb 2024 13:23:08 +0200
Message-ID: <87frxb8qg3.fsf@intel.com>
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

On Thu, 29 Feb 2024, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 2/28/2024 8:08 PM, Mitul Golani wrote:
>> +enum operation_mode {
>> +	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
>> +	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
>> +	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
>> +	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
>> +};
>
> We can drop the initialization here.

For stuff that needs to match the spec it's common to include the
initializations instead of relying on the auto enumeration.

BR,
Jani.


-- 
Jani Nikula, Intel
