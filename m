Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A330FABD43C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFFA10E0EE;
	Tue, 20 May 2025 10:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTRWoZNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829D10E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747735796; x=1779271796;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0PA8gOT5qlDi4EOK5CzsQ2tUFLu/eRBQa3JY9IJpy/A=;
 b=DTRWoZNzAvnkUDc0huwY6jYMIekF/kWIkOSYkgEuxHGhlJmY9SbnFMua
 8m55nGdqSc5hXY6zqJc8OoFekWlicrtPKeISryhh0Fg4J35C4Sditf8YC
 h0Fvrf4fwK+GHq32qXLW6b1KxJM55jXcOQIOqRmgX/CIQKH4pKVYn9k5u
 e5ayGDMpxDiiP/jCo+pQrhbP4/KkWYT2NSxEb6yXTQPVOIbVSbcm66U5s
 guKmjXCC5cBxemdwuBwKx42UVSfalSsv53O0Rg6bi34qw8qgh/ITkBFo4
 Kq+ftkMBKIz1sUQwlnO8/mCKi8PgQb8a7VcpQUEDGHfQ4PkKusIWz3Nx/ g==;
X-CSE-ConnectionGUID: CDIO9UZmRiS14CPU3LsRwQ==
X-CSE-MsgGUID: keTHlq/jQt28DpxAaGkHjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49725666"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49725666"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:09:55 -0700
X-CSE-ConnectionGUID: ADek4IpGReaPfJVxkT8tXA==
X-CSE-MsgGUID: Ondfzp86SAuYF/zZKs7E2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="176774054"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.168])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:09:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250519-singing-silent-stingray-fe5c9b@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
Date: Tue, 20 May 2025 13:09:47 +0300
Message-ID: <87sekztwyc.fsf@intel.com>
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


Maxime -

I'm cutting a lot of context here. Not because I don't think it deserves
an answer, but because I seem to be failing at communication.

On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> You still haven't explained why it would take anything more than
> registering a dumb device at probe time though.

With that, do you mean a dumb struct device, or any struct device with a
suitable lifetime, that we'd pass to devm_drm_panel_alloc()?

Is using devm_drm_panel_alloc() like that instead of our own allocation
with drm_panel_init() the main point of contention for you? If yes, we
can do that.


BR,
Jani.


-- 
Jani Nikula, Intel
