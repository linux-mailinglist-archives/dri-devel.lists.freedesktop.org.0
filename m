Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0338C4E91
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 11:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B7B10E64D;
	Tue, 14 May 2024 09:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMgPXcd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED9010E64D;
 Tue, 14 May 2024 09:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715678205; x=1747214205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T00NS/ZE1QSwwjdxP2RvdR9XW5FEDcnEyA7tUS9AFy8=;
 b=bMgPXcd6/QjOztSntLDttMrnWyd+DIsqyrLSLIaapaM+4v+Jqw52/28r
 w+9TxTkde2Y4CJtZ3nFkcz97fQfBGjoApZI51/iU8eeWvDAgUN/QztPQd
 xH9yNNGtehRgQnX4Hpl0ZMFd7ld3Em6MOYQ9qBPEDsmSBnwuT8n9MA7iW
 t1N7uXZXNgKwi0fPJ2JgthFHgybcfywvULOlj9AlbtKtktshg2QvTfdpI
 Bl453KDVO/LFDB96BOyO5/Z6JXU3ZfCOhdZtTDaJU4KTOnbbYX8IZkOue
 Bl6ACKCmcpI4nYBDeZrm/CllhVJ8HCeV6m8+xs9j05zXojNAcjRAVrvnR A==;
X-CSE-ConnectionGUID: y3W2jqwUT/aI+GcTGaDfug==
X-CSE-MsgGUID: lVJWc8oeSAudszIlgIX7+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="34163887"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34163887"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:16:45 -0700
X-CSE-ConnectionGUID: w8GvllddTOGimZAz5Wd6nQ==
X-CSE-MsgGUID: QyIrD+PKRF+x9SE2ZY/oug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35152315"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 02:16:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH] drm/edid: remove drm_do_get_edid()
In-Reply-To: <3c051a26-bccb-4edb-a71e-86e8313fd60c@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240513202723.261440-1-jani.nikula@intel.com>
 <3c051a26-bccb-4edb-a71e-86e8313fd60c@suse.de>
Date: Tue, 14 May 2024 12:16:37 +0300
Message-ID: <87y18cda8a.fsf@intel.com>
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

On Tue, 14 May 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 13.05.24 um 22:27 schrieb Jani Nikula:
>> All users of drm_do_get_edid() have been converted to
>> drm_edid_read_custom(). Remove the unused function to prevent new users
>> from creeping in.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks, pushed to drm-misc-next.

BR,
Jani.


-- 
Jani Nikula, Intel
