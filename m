Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEDE4D9C69
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E69710E4A7;
	Tue, 15 Mar 2022 13:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778FA10E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647351630; x=1678887630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DdbAPj3nXXTBOseL7TETjlOXpTqLIR2bDFn56wnS9No=;
 b=bATTahWZ3LL+N8BvIoUD4BBLz1dyVlouZkwCIdzJvDO9tdYw8PFYK80A
 QDfFoTX2Vsb94P3Am3wiuMjHlwXiz236/8rlyjkgz3f5RXMKZLnSoCbR4
 5Md24laJ7EAmpakIi7/qto/v2MpjjZGT5HK0gzyDKBFUVl9Ctm5T76Tyq
 SwZSBnHYlFn/R+TaF9GzKN4Eopq9aiM/MStlhLstas+wbeAkZNZChiGxq
 SfW0M/I5Q0lFeZM05wXh+er440NPLSE20yUV6HmEbDHwaBqsY/y6XBMCK
 n6UPx9SyPoPdH7H+MzNbLbz9W7NSskcyNqbcloEfFdQXUWEM9KRYZoGNz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256253980"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="256253980"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:40:29 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="498016944"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 06:40:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nU7Op-000HiZ-9q; Tue, 15 Mar 2022 15:39:43 +0200
Date: Tue, 15 Mar 2022 15:39:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/5] drm/format-helper: Fix XRGB888 to monochrome
 conversion
Message-ID: <YjCXHg9lWs8LVAGs@smile.fi.intel.com>
References: <20220315110707.628166-1-geert@linux-m68k.org>
 <20220315110707.628166-3-geert@linux-m68k.org>
 <27e1c911-798a-c14b-e5a0-622a7c5d8755@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27e1c911-798a-c14b-e5a0-622a7c5d8755@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 01:18:00PM +0100, Javier Martinez Canillas wrote:
> On 3/15/22 12:07, Geert Uytterhoeven wrote:

> > +		for (i = 0; i < bits; i++, pixels--) {
> 
> I think is worth to add a comment here explaining that the pixel is set to
> 1 for brightness > 127 and to 0 for brightness < 128. Or as kernel-doc for
> this helper function.
> 
> > +			if (*src++ & BIT(7))
> 
> Pekka also mentioned that if (*src++ > 127) would make this easier to read.

>= 128 ?

> > +				byte |= BIT(i);
> >  		}
> >  		*dst++ = byte;
> >  	}

-- 
With Best Regards,
Andy Shevchenko


