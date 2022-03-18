Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5114DDBBA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 15:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5263710E9B2;
	Fri, 18 Mar 2022 14:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C44210E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647614042; x=1679150042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OwmAYTkFkdcVZvm7QSe/7bEg6oDYfOaHQySbw9Qn9NE=;
 b=AG3tgAhhX0EdrFYy8ointmSEb3mpmD7Cto0tCjpH8zvtzoxqhkuRypgW
 RLXfBATj5WzIKMhwcHc0Gt6g4/VaeaQ+dYb98q+b9lzQDuvGtSCu1WavZ
 puWsi0EMqI4fGYnT0uCBXFgPXtK3cuUD+cCwLnaWfzIsnBNtPuCiJT0mn
 haivi/0QPdUjApbHSdNmWmS8S14HUQyExNJMcHM032/0kQnqefcuHDOJ5
 yr1iQrRtOiUPhzG+YOfzEs/rUR3028JLvmsXxqWfFJ7mRF+f5SHx1ZnDB
 IKfclW77B9ycrruc60KLc7y8EpbenNVmlgLygbcefGO3v9bP9ys4IU542 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="343580740"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="343580740"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:34:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="645537258"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 07:33:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nVDfM-002HB6-3c; Fri, 18 Mar 2022 16:33:20 +0200
Date: Fri, 18 Mar 2022 16:33:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 0/5] drm: Fix monochrome conversion for sdd130x
Message-ID: <YjSYL5oPaDuCXOJQ@smile.fi.intel.com>
References: <20220317081830.1211400-1-geert@linux-m68k.org>
 <f94c0f44-36f1-e1a9-5963-5da0bafb8c90@redhat.com>
 <YjSMWDFxTeJZZ/CB@smile.fi.intel.com>
 <20220318142145.kwq46bf6exgce6wu@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318142145.kwq46bf6exgce6wu@houat>
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 03:21:45PM +0100, Maxime Ripard wrote:
> On Fri, Mar 18, 2022 at 03:42:48PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 17, 2022 at 12:39:57PM +0100, Javier Martinez Canillas wrote:
> > > On 3/17/22 09:18, Geert Uytterhoeven wrote:
> > 
> > > By the way, you should probably request commit access to the drm-misc tree:
> > > 
> > > https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html
> > 
> > Does it really work? I tried and no one replied to request.
> > Keeping silent is a bad service. If people don't want a person
> > to have such access it should be well communicated.
> 
> I don't see any issue on Gitlab to request commit access, so I'm not
> sure what you did exactly but it's not surprising you didn't get any
> answer.

https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/311


-- 
With Best Regards,
Andy Shevchenko


