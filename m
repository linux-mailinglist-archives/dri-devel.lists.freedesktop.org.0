Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E24D9CA4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F410E11A;
	Tue, 15 Mar 2022 13:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EB110E11A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647352255; x=1678888255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z8cDmbmlZNdInmwIqDtaFr4bVtO7m8JUzG7iHYr21qA=;
 b=iruHYcN2Ou1195nPU+s2rMIDkmqfgIoFJD5nrr+Zoq4EWz4TSdI8YWK2
 pk6ijS71GW++mlLcHNepqTHfWYCUoUeO0MCPvYFW5v2akgf4J7Z/IXdwp
 YIjVpAQrD60VU4zzFcFBnzyjVwKRhx98QblUr2+K6gscigMvnKGBAhuA0
 PN5Z+iyY3mMvbw++dkSUOU4GWYwRS+cYW+O8eWlCYe1EQBU4vLaId/yh0
 i4XVMDHN/hHE7tQH62Q/TNQQh3ReGyINa7P4S5MQo//PtPKzoI3Phd1F9
 RhdXSrkySmi8gLqua1GzZWui4ryrWIT9+u54j/KiahZ3YSiG1EiWMQFHI w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256257056"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="256257056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:50:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="690201870"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:50:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nU7Yx-000I0A-0v; Tue, 15 Mar 2022 15:50:11 +0200
Date: Tue, 15 Mar 2022 15:50:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/5] drm: ssd130x: Reduce temporary buffer sizes
Message-ID: <YjCZkkv//EhvxszH@smile.fi.intel.com>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-5-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315110707.628166-5-geert@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 12:07:06PM +0100, Geert Uytterhoeven wrote:
> ssd130x_clear_screen() allocates a temporary buffer sized to hold one
> byte per pixel, while it only needs to hold one bit per pixel.
> 
> ssd130x_fb_blit_rect() allocates a temporary buffer sized to hold one
> byte per pixel for the whole frame buffer, while it only needs to hold
> one bit per pixel for the part that is to be updated.
> Pass dst_pitch to drm_fb_xrgb8888_to_mono_reversed(), as we have already
> calculated it anyway.

Can we use bitmap API? bitmap_zalloc() / etc ?


-- 
With Best Regards,
Andy Shevchenko


