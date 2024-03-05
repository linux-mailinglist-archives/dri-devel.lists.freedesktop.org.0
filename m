Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FC8725F2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D58310E4F9;
	Tue,  5 Mar 2024 17:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0xqWyhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539F710E4F9;
 Tue,  5 Mar 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709661013; x=1741197013;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oXCspTC4fxc4lI9uLj74+Tv5/GNSN4LB8uP31e2gEzY=;
 b=H0xqWyhfkBMEuHdLT357/yW3pRnXiW8N8Q737YMNJXVPhjGGVombjpWo
 CkdvXOnT68MtpYH3dg4muwECsIKK9/RE3NOenMk4yZ7wkU2m22l0fyHkF
 lNRprKEzD5GwPlqQjfd1ST2LapUMlHtQuhc2yYZPNxWJQFqyWMT+GHg/F
 e3KEUIKkheDNcIrjSJpglJH+2IwIQpXzReANSdboDIFlaFULcSD3W/fl2
 rogZnsZ4Ky06707lr0RFYY1DmIQl0Cq8Mvd873RMkmIaszRIfFyMSReE4
 4thevNGcSRrpjiyNp+BwkO4/kryl2uSMPn3fBSfo/LvR649YDuysIMDnr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4406587"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="4406587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="9524589"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 09:50:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>, David
 Airlie <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Xinhui.Pan@amd.com, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Sui Jingfeng
 <sui.jingfeng@linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND v3 0/2] drm: enable W=1 warnings by default across the
 subsystem
In-Reply-To: <yfsm3rrqtv3z6c6xyprappevvgqtxpwgjgt5ejoe74gfvhvcia@ybmkknyulv5x>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1709629403.git.jani.nikula@intel.com>
 <0df557af4aaceeb1ef85ee3c74169ee9@kernel.org> <8734t41sno.fsf@intel.com>
 <yfsm3rrqtv3z6c6xyprappevvgqtxpwgjgt5ejoe74gfvhvcia@ybmkknyulv5x>
Date: Tue, 05 Mar 2024 19:50:02 +0200
Message-ID: <87zfvczhyt.fsf@intel.com>
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

On Tue, 05 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Mar 05, 2024 at 07:43:07PM +0200, Jani Nikula wrote:
>>Thanks everyone for acks and reviews, pushed to drm-misc-next.
>
> should we start removing the now duplicate ones in i915 and xe?

After the drm-misc-next to drm-next merge and subsequent backmerge to
drm-intel-next and drm-xe-next i.e. sometime after the merge window.

BR,
Jani.



-- 
Jani Nikula, Intel
