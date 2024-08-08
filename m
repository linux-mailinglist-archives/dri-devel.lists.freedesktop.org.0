Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF894BAD7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBF810E6C0;
	Thu,  8 Aug 2024 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnXv3khZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F310E6C0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723112724; x=1754648724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fZP8HxgFzg8Q/VBokT/unDJoCN9dymrjvbxzxf0FNFY=;
 b=BnXv3khZNeNfHNOiYhhhhBaO1g9TuXtaJjOAkyQT0b7uxvy01oqCh13Y
 ru6n5ngeteZplVzAz7TooDeQBjteIceOGSpHFedy/Ox8wWHVdx387ZFI8
 xU501ygVaKlgn1B8Y3WcRiRtpajrFT9xHVzmP0P8ArsxJhy2Bo6dlpiOB
 OU2HYfXedFIkYYzKnZvm8R3DJ+RHyaWrGf7hSsdCbDCpBrQA2mbta8Wh9
 tfWrlR9A0hRH2L8sOIW3e4bQeA4tOJPitL+H9qFyOo6C3jbHDpKXdNhBF
 SBndLpha8uKCbtUvCKAp9r3BWo/GJ30yx6jkF9sgSWFZncYUnuqQZGCsR Q==;
X-CSE-ConnectionGUID: aK8bLZj5QcWxkjpTyv4pOQ==
X-CSE-MsgGUID: hwkiBZxgQ2eQQBxA5iKF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43749110"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="43749110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:25:23 -0700
X-CSE-ConnectionGUID: e7YznkWoQMuCjEYa1nZS7Q==
X-CSE-MsgGUID: 1nbyhsx0QneJSAGsF9GiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="57731589"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:25:19 -0700
Date: Thu, 8 Aug 2024 11:25:14 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <ZrSdCtS2okz9ivBW@ashyti-mobl2.lan>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
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

Hi Christophe,

On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> Use sysfs_emit_at() instead of snprintf() + custom logic.
> Using sysfs_emit_at() is much more simple.
> 
> Also, sysfs_emit() is already used in this function, so using
> sysfs_emit_at() is more consistent.
> 
> Also simplify the logic:
>   - always add a space after an entry
>   - change the last space into a '\n'
> 
> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> can not be reached.
> So better keep everything simple (and correct).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

neat!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
