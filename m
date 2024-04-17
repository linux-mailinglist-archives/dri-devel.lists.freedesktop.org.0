Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E78A8761
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 17:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D18211360C;
	Wed, 17 Apr 2024 15:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIDHPvGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C857113608;
 Wed, 17 Apr 2024 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713367245; x=1744903245;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=llN7GSHhN95iQPRuN03mjpEElAHvmfCPtBkJjSjJ7u0=;
 b=DIDHPvGSdcershlQi0NZy2ddlkrw8ySOwSbUGlKP8SE9fEh2WGe27umq
 EMW2HgqM0m8J+owQDboksppjOXNKmZZhJ7FAVglq8dnBfXSVOvxleoQHT
 cO5/g1DXIQHyxdwXlLIXRfROrWGuJfuDQwLpmgy75iK7MnCFSioI31tiO
 XygfrhQeFretUuT0xR5BIULxRudHONmKOwkRR13oJYsPyGtf/DdeAnMRu
 xHmorzBsOuil7yf9vKujJ8diyBqrF4P1dFW3J0OEkyOv1j3VoY/zCQn9W
 gyn8gKmHnxzWr0CJThp2N8uixstSSUS/ulIx0TEFwdVsOqf00sLzLCgQk Q==;
X-CSE-ConnectionGUID: l8SKMHpPTuewLNKB/xD+2Q==
X-CSE-MsgGUID: E78oaXXXQuSsHhHbO1VUMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8730579"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8730579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 08:20:44 -0700
X-CSE-ConnectionGUID: DjT0wy8fQOSvetW85i9Xsg==
X-CSE-MsgGUID: 2hVv52VoRT2u3nXY4As5Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22741008"
Received: from vpus-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.45.164])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 08:20:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [REBASE 7/7] drm/edid: make drm_edid_are_equal() more
 convenient for its single user
In-Reply-To: <b63cb8b9-4b91-422d-96ba-c8e25b6e267f@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1713259151.git.jani.nikula@intel.com>
 <1011a285d30babce3aabd8218abb7ece7dcf58a2.1713259151.git.jani.nikula@intel.com>
 <a2e36f83-0e5c-4a57-bf31-37665f8ece71@suse.de> <87h6g1ze42.fsf@intel.com>
 <deb7918d-03dd-49f4-8a5d-3470ed05800e@suse.de> <878r1cz9eh.fsf@intel.com>
 <b63cb8b9-4b91-422d-96ba-c8e25b6e267f@suse.de>
Date: Wed, 17 Apr 2024 18:20:40 +0300
Message-ID: <87a5lsxbg7.fsf@intel.com>
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

On Wed, 17 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Many thanks! Just to double check, do you want me to move patch 5
>> earlier and squash patches 6&7?
>
> Your choice. Either is fine by me.

I jumped at the easy option and merged this as-is. :)

Thanks again,
Jani.



-- 
Jani Nikula, Intel
