Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E008B5BEB79
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DD310E720;
	Tue, 20 Sep 2022 16:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641F710E720;
 Tue, 20 Sep 2022 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663693070; x=1695229070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DDJtwcRKp8jf0ywLyVpxIicuHNV8x0LfsN1pEW6IGM8=;
 b=mQQ509CXzdm4lZs1x60rMtUNig/WCsiouQKdfsjoeL301CsdwqX6EaT8
 VGqiMS7TN3esfvQ+HswaWTPRC7FU9PzbRTW4WTGJlojPE7SfW7ZrYwCoy
 k3JNbsZ6yp6X+Sn4LhxHGGwpe9hhpo9FHGUU1ttSRFdhzfh1JFGi+ENVW
 /dKBeRdp5cPMEkFgjgtQWJ98vw7ahkwsl7ibvume8YGSAGJAesCCGtzpk
 oXBxcCn3YDwFU3HvBgwElbtGUZEKJZZkWiopsxRy/YMZ7NWcGUCTIMJJo
 DhF9pn3ACbyD+Qm6Eh4k7FZo3Jx2FLfn5hG/jCv5ewmbG+wXBuXQCb3ub A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386042741"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="386042741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 09:57:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="652170048"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.173.21])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 09:57:48 -0700
Date: Tue, 20 Sep 2022 18:57:46 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Aravind,

> +static int get_mtl_gms_size(struct intel_uncore *uncore)
> +{
> +	u16 ggc, gms;
> +
> +	ggc = intel_uncore_read16(uncore, _MMIO(0x108040));
> +
> +	/* check GGMS, should be fixed 0x3 (8MB) */
> +	if ((ggc & 0xc0) != 0xc0)
> +		return -EIO;
> +
> +	/* return valid GMS value, -EIO if invalid */
> +	gms = ggc >> 8;
> +	switch (gms) {
> +	case 0x0 ... 0x10:
> +		return gms * 32;
> +	case 0x20:
> +		return 1024;
> +	case 0x30:
> +		return 1536;
> +	case 0x40:
> +		return 2048;
> +	case 0xf0 ... 0xfe:

just a bit puzzled by the fact that case ranges are not standard
and are supported only by GCC, unless, of course, I miss
something. Do we still want to use them as they are widely used
around the kernel?

Andi

> +		return (gms - 0xf0 + 1) * 4;
> +	default:
> +		return -EIO;
> +	}
> +}
