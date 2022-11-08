Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A825620FCB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FBE10E411;
	Tue,  8 Nov 2022 12:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D128D10E403;
 Tue,  8 Nov 2022 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667909106; x=1699445106;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rmky31iNqqLemPnFcecKu8byVUt7L4FWpuo4LZw6ZvM=;
 b=cT+O3sBQ4F+eivm9E/WrLMocbaxWR406lIzKBcTnyIlgOipWJdi/3V6O
 O0hTapi4clwTgpzPWqM400Hn+1Nc8MdX6SFfnCSdXrhQ4lUG/hvI+gTOl
 9VLVqnRYDQlfPcOLDjLe2TXf1SK1tMu2UZ8OJNxiNNP55caBev1DEBoSA
 2+rCmAArliKPIwegImnE2QP4vyOXT5+8ebr1n8fJn99MF75CoCL/Bi9G8
 /6CSkpHrDBo11T5in/tvM9S89y/zWQx8CvdYmlaT1TZxZbs9xydtQsMVD
 rnLlNWaWxsd1lOTC30+hUDPw7XotyN4PvTKY6+p5kYv7vlGRy9RjHSK3q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="396972349"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="396972349"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 04:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="741928076"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="741928076"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 08 Nov 2022 04:05:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Nov 2022 14:05:01 +0200
Date: Tue, 8 Nov 2022 14:05:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Partial abandonment of legacy DRM
 logging macros
Message-ID: <Y2pF7TA4BEPG07f7@intel.com>
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
X-Patchwork-Hint: comment
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
Cc: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> @@ -2744,6 +2745,7 @@ add_timeline_fence_array(struct i915_execbuffer *eb,
>  			 const struct drm_i915_gem_execbuffer_ext_timeline_fences *timeline_fences)
>  {
>  	struct drm_i915_gem_exec_fence __user *user_fences;
> +	struct drm_device *drm = &eb->i915->drm;

We've said a firm "no" to drm_device pointers in display code at 
least. If we want a local device pointer we always make it a 'i915'.
Otherwise you end up with annoying aliases all over the place.

-- 
Ville Syrjälä
Intel
