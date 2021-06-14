Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D833A5F41
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 11:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54F289CC1;
	Mon, 14 Jun 2021 09:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378AC89C99;
 Mon, 14 Jun 2021 09:41:32 +0000 (UTC)
IronPort-SDR: ipV/z7NvD6RPG+Hs7pidJXUkzdHhDCmB3rxmJAEUJEfCbb/XrKNZSxAwRpjahL6vogzD6HMy8f
 dj1Ld34fppyw==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="269632974"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="269632974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:41:31 -0700
IronPort-SDR: EYZ5hjq3gE0dGFNmNLy+mK+mipCL462TTqxNwz8c5xh1jV54Z0jVk81lB4qmEHeSLDluEXrcWb
 YgsgCvCdfiDg==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484031055"
Received: from jberg1-mobl.ger.corp.intel.com (HELO [10.252.56.53])
 ([10.252.56.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:41:30 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: allow DG1 autoprobe for
 CONFIG_BROKEN
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210614092227.97421-1-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7f9dc8a6-3559-e64d-ed6a-463dd84e488b@linux.intel.com>
Date: Mon, 14 Jun 2021 11:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210614092227.97421-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 14-06-2021 om 11:22 schreef Matthew Auld:
> Purely for CI so we can get some pre-merge results for DG1. This is
> especially useful for cross driver TTM changes where CI can hopefully
> catch regressions. This is similar to how we already handle the DG1
> specific uAPI, which are also hidden behind CONFIG_BROKEN.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 83b500bb170c..78742157aaa3 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1040,6 +1040,9 @@ static const struct pci_device_id pciidlist[] = {
>  	INTEL_RKL_IDS(&rkl_info),
>  	INTEL_ADLS_IDS(&adl_s_info),
>  	INTEL_ADLP_IDS(&adl_p_info),
> +#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
> +	INTEL_DG1_IDS(&dg1_info),
> +#endif
>  	{0, 0, 0}
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

