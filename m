Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0C898C38
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 18:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B502E1132C8;
	Thu,  4 Apr 2024 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWo/yXTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CA71132CA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712248522; x=1743784522;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MmhrXXb3uIRaUAMK673aSGEDDVFyLxQk/WLn0pC3LAY=;
 b=HWo/yXTxrV85T12SCZXY8XwRULbb0LxfXwMRoXZ+FbS0FL1cY9UMoy8d
 aPWL8md2/EcP/QmwjlCi7Ddb4sgkeZjNZP1hNcPPtrFXOyYyzB8FutR3o
 cSiKDygeBsMwrJ9GheAV8gjB3aft/mhnUUV8gdnqhP1C5P3Ic2zVXmrh6
 i3ZPc8cnGl3ehgAA/2S0zESkhCYGkVVef4XEDynjU2U/BVhSdkTn9lE8X
 WQpGJhU297th1+D0w+JrGya2YhrX5/+trDWyqtYuMozkCuwWJfIKg+P8i
 EliprqkIQmpEGZlAW4h5P8qTktSf4r5hpvYKTxsuxsxC7TNpWQN1GNauQ A==;
X-CSE-ConnectionGUID: TRpCj2UXQLedvr3l0Hyqmg==
X-CSE-MsgGUID: iPVBT/mVT26sLIfW26Y4mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7783652"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7783652"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="915223151"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="915223151"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 09:35:16 -0700
Received: from andy by smile with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rsQ3U-00000001W57-3W2D; Thu, 04 Apr 2024 19:35:12 +0300
Date: Thu, 4 Apr 2024 19:35:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jianglei Nie <niejianglei2021@163.com>
Cc: gregkh@linuxfoundation.org, tzimmermann@suse.de, javierm@redhat.com,
 sam@ravnborg.org, steve@sk2.org, noralf@tronnes.org,
 u.kleine-koenig@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: core: fix potential memory leak in
 fbtft_probe_common()
Message-ID: <Zg7WwNEpZlYsvNwJ@smile.fi.intel.com>
References: <20220928062301.6399-1-niejianglei2021@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928062301.6399-1-niejianglei2021@163.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 02:23:01PM +0800, Jianglei Nie wrote:
> fbtft_probe_common() allocates a memory chunk for "info" with
> fbtft_framebuffer_alloc(). When "display->buswidth == 0" is true, the
> function returns without releasing the "info", which will lead to a
> memory leak.
> 
> Fix it by calling fbtft_framebuffer_release() when "display->buswidth
> == 0" is true.

Fixes tag?

...

>  	if (display->buswidth == 0) {
>  		dev_err(dev, "buswidth is not set\n");
> +		fbtft_framebuffer_release(info);
>  		return -EINVAL;

		ret = dev_err_probe(dev, -EINVAL, "buswidth is not set\n");
		goto out_release;

>  	}

-- 
With Best Regards,
Andy Shevchenko


