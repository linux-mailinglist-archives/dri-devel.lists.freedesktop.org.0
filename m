Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2D6610D4F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 11:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5384E10E7BB;
	Fri, 28 Oct 2022 09:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8FC10E7B4;
 Fri, 28 Oct 2022 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666949505; x=1698485505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oR5wRPNBLcNolbOBquCC8S7lEjzDfJpenzPvgUtMPxk=;
 b=ez8/88R+mXftrmiPxOkysYRIp7p0tKjzKcFcPyZ6OclRtI2h3ngOLVsK
 RYYnNSztB+DLbflwUzdKwzOm/wVsSycL241CYpjorkHoDGIKAtsunNomc
 qhCQ69F61U3AoLBvIDN4B1xAnkKHHamdVVSP7irJQHyLixrSRmzPeOtrP
 8QQE+6h/cyJPVhMP/E02KoxLYRVyFRn0OaU21s94DSSlpzd6Imq5DRNG6
 wJJAPKbysgpZhYHcq0Zfy9oSqLxnoT6H4XZrXBxT3L/w4+PSXIp8sc6Cr
 1ICqSgZoMAEGn0JxAXc4CJbGcwBg0EI0TcP21KJsRU/x/wAvhmFtsQ9ur A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="288847936"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="288847936"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 02:31:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="666008186"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="666008186"
Received: from galber1x-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.40.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 02:31:40 -0700
Date: Fri, 28 Oct 2022 11:31:38 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v5 18/19] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Message-ID: <Y1uheuc+QbLMFaif@ashyti-mobl2.lan>
References: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
 <20221025065905.13325-19-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025065905.13325-19-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

[...]

> +/*
> + * VM_BIND feature version supported.
> + *
> + * The following versions of VM_BIND have been defined:
> + *
> + * 0: No VM_BIND support.
> + *
> + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
> + *    previously with VM_BIND, the ioctl will not support unbinding multiple
> + *    mappings or splitting them. Similarly, VM_BIND calls will not replace
> + *    any existing mappings.
> + *
> + * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
> + */
> +#define I915_PARAM_VM_BIND_VERSION	57

58... 57 has been taken right after you sent this patch

Andi

[...]
