Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966188FE595
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2397910E909;
	Thu,  6 Jun 2024 11:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9zgoiCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123E310E909;
 Thu,  6 Jun 2024 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717673930; x=1749209930;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tSfG1KC04KmfV8dscs9QR/OMFi489ru7cs43QbYGAys=;
 b=I9zgoiChrLEv+UqN5lqo093H4tUqR6jCkgzMKCJH4tzGGD+gothelhhT
 jzGsrrcovttS5+Jr12tCZxRhIMR9vlGTWL6AFRGY6q/iVYGjXOyV/PrxA
 oRkofwLMw4EQ/G/tFVDUjqsRN/Glne5aC+UNXC+eVC7O7GbrLvy1kaE1/
 5pOvLWbXC9dCenS2203PnQeSdeUQ9v2enrUYoBZrzbEifYNfJEAfE4jRa
 Wd7RwuWwQ2w00AGttFCEeUr5aEXYKVr1iJq4UglrFcXn27GfO5tHbChov
 FyZ+iy3erTCUh1RMYBUasUXZ6RsRUjho5uBrbxQfdsf2kKQkmATlchQj+ Q==;
X-CSE-ConnectionGUID: cXshLVZAS8mWwwC/MOlVjw==
X-CSE-MsgGUID: w/4Afh0qQ3a/bhXjz0Obug==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11939778"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="11939778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:38:50 -0700
X-CSE-ConnectionGUID: jjDIIiwKQu+mpsbsM/efWg==
X-CSE-MsgGUID: IF8uy0GQRY+BI+eGgtIX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="75416904"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:38:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v13 5/9] drm/dp: Add refresh rate divider to struct
 representing AS SDP
In-Reply-To: <20240605170111.494784-6-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240605170111.494784-6-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 06 Jun 2024 14:38:45 +0300
Message-ID: <87wmn29u7u.fsf@intel.com>
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

On Wed, 05 Jun 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add target_rr_divider to structure representing AS SDP.
> It is valid only in FAVT mode, sink device ignores the bit in AVT
> mode.
>
> --v2:
> - Update commit header and send patch to dri-devel.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Maxime, Maarten, Thomas, ack for merging this via drm-intel-next?

BR,
Jani.

> ---
>  include/drm/display/drm_dp_helper.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8defcc399f42..ea03e1dd26ba 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -122,6 +122,7 @@ struct drm_dp_as_sdp {
>  	int target_rr;
>  	int duration_incr_ms;
>  	int duration_decr_ms;
> +	bool target_rr_divider;
>  	enum operation_mode mode;
>  };

-- 
Jani Nikula, Intel
