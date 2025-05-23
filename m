Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DCAC2203
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 13:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8110E273;
	Fri, 23 May 2025 11:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvofKYZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1352810E273
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748000053; x=1779536053;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MYfWXPtNFQT1KOOqC822XoD8Ig+VivQ64udlyOM9YfI=;
 b=BvofKYZn9qw4SjBUAXuV1dIdNvuViJEacD5ZyNY4yMQk5B5zmoZRkaKV
 IDJaj7u+9bDFFgrcO2iXsGYZDPA6hJG/cJ+ZwmroEBZojdU/eP+TRZtMX
 dGCC+MsapnY/7Ctl6DzYeKI6eBcH9RP5RYKDQSuUsZIm6dF2ve+yGVJzm
 oC4DpeFl9e8I0P8TZkPoWLGynhNS3g5ATU8B7Vh8xDSSYC9oMlFPKX2J6
 yfPmAKoxeRBaQT4FPghbS+ZHPAM2NY2ZNYCPDYTd8STW57/+eoKAPcERO
 WluCUK4ncOow0zprVtbkVTmMZ1PzC4ZUJqFYNfWMUNSf8ifzldGEjOBbM w==;
X-CSE-ConnectionGUID: A8ea2btSToump7QlyuNkkA==
X-CSE-MsgGUID: 8SYqgu0MT2uUNK+61dJWiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50169907"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="50169907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 04:34:08 -0700
X-CSE-ConnectionGUID: ievo+qiXQgGpHVyjzx9xew==
X-CSE-MsgGUID: lI09kxVaQOGWLQCmjpcNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141606037"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.101])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 04:34:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <87sekztwyc.fsf@intel.com>
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
 <87sekztwyc.fsf@intel.com>
Date: Fri, 23 May 2025 14:34:05 +0300
Message-ID: <8210f7fc0dbcfc5b1eea47ccb762c7e53b45236a@intel.com>
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

On Tue, 20 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Maxime -
>
> I'm cutting a lot of context here. Not because I don't think it deserves
> an answer, but because I seem to be failing at communication.
>
> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> You still haven't explained why it would take anything more than
>> registering a dumb device at probe time though.
>
> With that, do you mean a dumb struct device, or any struct device with a
> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?

I'm no expert in ACPI, but I think it needs to be a struct device
embedded inside struct acpi_device to implement the
drm_panel_add_follower() lookup for ACPI.

It would be natural to embed struct drm_panel inside struct intel_panel,
except we need struct intel_panel way before we have figured out the
acpi device. We need struct intel_panel at connector register time, acpi
devices currently get figured out after all connectors have been
registered. I'm trying to see if we can change that, but it doesn't look
easy. Separate allocation and initialization would cover that.

> Is using devm_drm_panel_alloc() like that instead of our own allocation
> with drm_panel_init() the main point of contention for you? If yes, we
> can do that.

As devm_drm_panel_alloc() forces embedding, and we can't easily embed
drm_panel inside intel_panel, even that would need a dummy wrapper
struct.


BR,
Jani.


-- 
Jani Nikula, Intel
