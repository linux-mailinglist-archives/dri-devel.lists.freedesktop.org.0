Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA48C65C7
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 13:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB70E10E4A4;
	Wed, 15 May 2024 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcgoRcKT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F1810E4A4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715772847; x=1747308847;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vjz3YtkE6x9jeBbjI+Y3bdQZjv0Zgo1PCO5LCXUI51o=;
 b=OcgoRcKTst3gZESXJE9p0LppQ/gcFKdHmyVrQTwUDwytDvPjp5tF1+Zw
 sozLGi2LTJawRbcaFfuDjjqUr0T8gelcTU7844ij3VV8ydWVIWTxYxTIk
 j/PR1fYmc3BjVLjxqUU/N0bV0nt2I3pGb3B1ICOqPjcjhjkoAbMlF9k2Y
 Gm/NfH/YyFbedTgyWfxZxtZ19x4ljkpgfZfwshHWVtgnMwpssMgj7sn0e
 u4G8i+G7kLKUclrT+knm6SV1/gI+PFst2WYMd7aJT5Tv/SUyluiOAFE38
 XhVFsaZayL0X6u8t/7LHwSZ4kvGe5KmRUzKdkShfmdSxQZ+AAueUudthX g==;
X-CSE-ConnectionGUID: 102CDYrCSPCEkSgL8VzraA==
X-CSE-MsgGUID: Uvg1cpuBRaCtnOV6OjbT0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15602477"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="15602477"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:34:06 -0700
X-CSE-ConnectionGUID: c1brhzZxRc68waYgCcrztA==
X-CSE-MsgGUID: Rnyqba5TQEOfKPYIggFvWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31028469"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.141])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:34:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: Support finding bridge with struct device
In-Reply-To: <bd175eb3-ca70-4ce7-89ab-ca7f622ed153@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514154045.309925-2-sui.jingfeng@linux.dev>
 <87v83fct2e.fsf@intel.com>
 <cd81893c-ef0b-4906-8c9c-a98b1e4669e6@linux.dev>
 <87pltncqtg.fsf@intel.com>
 <bd175eb3-ca70-4ce7-89ab-ca7f622ed153@linux.dev>
Date: Wed, 15 May 2024 14:33:59 +0300
Message-ID: <87msorcnrs.fsf@intel.com>
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

On Wed, 15 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> Yes, you are right, I'll back give another try then.

Thanks, but please do wait until you have feedback on whether the whole
thing is a good idea or not. :)

BR,
Jani.


-- 
Jani Nikula, Intel
