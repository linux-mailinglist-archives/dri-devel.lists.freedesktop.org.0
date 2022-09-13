Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2BE5B6964
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 10:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257A710E63E;
	Tue, 13 Sep 2022 08:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141EB10E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663057257; x=1694593257;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YQ4XpgIYxwuDp/T9stIwbL+/CqELDrKtFwPudLSttnk=;
 b=Ei7iP1hda2nTbfP4jFennY4iRlH8BeZ7bE4i3zBMsjIrrEo5RWPaQ3V+
 KXH83W+JB6xbVGhMtr5dLNBwwFWgzwEyqXm1UQpgwvB0+x8pjV8KI8OOe
 5yRx7WPc86cVvaetb5XGmrX19faJ5RkCzo7FsH1uK6QdZOGsl0smyZAa5
 J2xNkMLGLYSRh5oJ5tQSyevpr4we1+ifkt6fgX9Cith4FbZV0fOextjSe
 nXZnH3ialyUQMDKDTdqV+6FQ+bNJXuxndvPXTyr9DofKN+0enQvWPYVwm
 mumfOupJTZrKArALTqxxtfXDygMncwamIRNYjwXhA9/mIFy6Gmjl8zMU/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="285099931"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="285099931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 01:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="649574775"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 13 Sep 2022 01:20:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Sep 2022 11:20:51 +0300
Date: Tue, 13 Sep 2022 11:20:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: Re: A divide error bug in framebuffer_check
Message-ID: <YyA9Y+Cs8ZCYHXAT@intel.com>
References: <CAFcO6XOSwwe+4H5cCEdgj6KD+QutNMZA89rWXYvbQCsREqFqtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFcO6XOSwwe+4H5cCEdgj6KD+QutNMZA89rWXYvbQCsREqFqtQ@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Dave Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Davis <ben.davis@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 01:49:40AM +0800, butt3rflyh4ck wrote:
> Hi, there is a divide error bug in framebuffer_check in
> drivers/gpu/drm/drm_framebuffer.c in the latest kernel.
> we can trigger it via drm_mode_addfb2 IOCTL.
> The call trace is drm_mode_addfb2 -> drm_internal_framebuffer_create
> ->  framebuffer_check.
> let us see code below:
> ```
<snip>
> { .format = DRM_FORMAT_Q410, .depth = 0,
>   .num_planes = 3, .char_per_block = { 2, 2, 2 },
>   .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
>   .vsub = 0, .is_yuv = true },
> { .format = DRM_FORMAT_Q401, .depth = 0,
>   .num_planes = 3, .char_per_block = { 2, 2, 2 },
>   .block_w = { 1, 1, 1 }, .block_h = { 1, 1, 1 }, .hsub = 0,
>   .vsub = 0, .is_yuv = true },
> ```
> we can see format.hsub and format.vsub all are NULL.

Yeah, those look borked.

Added in commit 94b292b27734 ("drm: drm_fourcc: add NV15, Q410, Q401 YUV formats")

Adding the relevant people to cc...

-- 
Ville Syrjälä
Intel
