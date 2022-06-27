Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91755B979
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 14:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4784F1130BF;
	Mon, 27 Jun 2022 12:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF89D1125D4;
 Mon, 27 Jun 2022 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656332306; x=1687868306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wIym4g3JKPLQszdNyFyxZB8GVvwge3rVq3pvgiSSbI8=;
 b=lRu4JHRg1QOTi+1sHIAtTFM9TTHVwiBOIvdsDn1zQPICsEw6klwSmM35
 /xVKxJMRx42N4JziRnAMh8hs8K+WqTYwx2bMmWK8FcPS+L4RxNrpdQG9Z
 +7a1AebkPBnmjSRssi0AA7QHGAj4bplukSZ/Qmgj6P98Ds4O1lAmWWlfU
 gVXYkcmtIB9ouHtyaRopbQMlIDqc4E3Z60ew8u+4/DK3secks+m3bwCCA
 HBM506YSMTX0X5oCg/GTB+ebyqVORBP6zbRU1E59cie9Owlhb82uQOrrK
 vLfm/Td1BOCsaZ05DTJjce1lZLjwhzVp/SQTrsKOiLPqL7Yjta07Py96j g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="264479332"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="264479332"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 05:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="622531636"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by orsmga001.jf.intel.com with SMTP; 27 Jun 2022 05:18:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jun 2022 15:18:02 +0300
Date: Mon, 27 Jun 2022 15:18:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH 4/5] drm/drm_color_mgmt: add 3D LUT to color mgmt
 properties
Message-ID: <Yrmf+mWk13qkcsfs@intel.com>
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-5-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220619223104.667413-5-mwen@igalia.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, nikola.cornij@amd.com,
 bhawanpreet.lakha@amd.com, sunpeng.li@amd.com, alex.hung@amd.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 seanpaul@chromium.org, nicholas.kazlauskas@amd.com, christian.koenig@amd.com,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 19, 2022 at 09:31:03PM -0100, Melissa Wen wrote:
> Add 3D LUT for gammar correction using a 3D lookup table.  The position
> in the color correction pipeline where 3D LUT is applied depends on hw
> design, being after CTM or gamma. If just after CTM, a shaper lut must
> be set to shape the content for a non-linear space. That details should
> be handled by the driver according to its color capabilities.

I also cooked up a WIP 3D LUT support some time ago for Intel hw:
https://github.com/vsyrjala/linux/commits/3dlut
But that dried up due to having no userspace for it.

I also cooked up some basic igts for it:
https://patchwork.freedesktop.org/series/90165/

<snip>
> + * “LUT3D”:
> + *	Blob property to set the 3D LUT mapping pixel data after the color
> + *	transformation matrix and before gamma 1D lut correction.

On Intel hw the 3DLUT is after the gamma LUT in the pipeline, which is
where I placed it in my branch.

There is now some discussion happening about exposing some
kind of color pipeline description/configuration properties:
https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/11

-- 
Ville Syrjälä
Intel
