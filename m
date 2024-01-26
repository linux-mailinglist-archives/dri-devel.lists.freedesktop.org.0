Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E3583DFEB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 18:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2A10FC79;
	Fri, 26 Jan 2024 17:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF81610FC79;
 Fri, 26 Jan 2024 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706289827; x=1737825827;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tSMX1Ae/bCy8FGpCcBWLPQYfg2LBDt1gaBUpHaOLi0k=;
 b=J7Vp7YxTCKeBLffr3imPQAsVvvxx6vDUvU8rJxD+KXTk6YQhdN8iYHg1
 RZ+St5SDpGLMMFx6pYGHOAMfTGaotUm/QizGBa8I9yDJt4IQb4e9hZKv0
 fCaOmLyQjIqK5QGZ9sznzs7KgTsRiWNv8BRygPYcI5WjMDd5m2jybIXNS
 mtXsyb9l2y5lUYGt2LdQckTw8D4GDyda5ZQUfFd32+7oliP1nTH1aGMd4
 1iYCreMmSiPO/kCXLE73O11Y5iiQjPYj8gquyv3tjIQEE53T+Ox9EWWne
 iaAO0xpSbxStYf3rJdyNI2hyU/bgh9vJBeKOZ5aipBW3kNa6+Ys2KWBRx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9900862"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9900862"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:23:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="960260973"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="960260973"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 09:23:39 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id BC8AF11FBD1;
 Fri, 26 Jan 2024 19:23:36 +0200 (EET)
Date: Fri, 26 Jan 2024 17:23:36 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH v3 1/2] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <ZbPqmA4GkunkJqb0@kekkonen.localdomain>
References: <20240122114121.56752-1-sakari.ailus@linux.intel.com>
 <20240122114121.56752-2-sakari.ailus@linux.intel.com>
 <912d4439-86cd-4060-a66d-baba5fa2bdec@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <912d4439-86cd-4060-a66d-baba5fa2bdec@ieee.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Fri, Jan 26, 2024 at 09:12:02AM -0600, Alex Elder wrote:
> On 1/22/24 5:41 AM, Sakari Ailus wrote:
> > There are two ways to opportunistically increment a device's runtime PM
> > usage count, calling either pm_runtime_get_if_active() or
> > pm_runtime_get_if_in_use(). The former has an argument to tell whether to
> > ignore the usage count or not, and the latter simply calls the former with
> > ign_usage_count set to false. The other users that want to ignore the
> > usage_count will have to explitly set that argument to true which is a bit
> > cumbersome.
> > 
> > To make this function more practical to use, remove the ign_usage_count
> > argument from the function. The main implementation is renamed as
> > pm_runtime_get_conditional().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.c
> 
> I actually intended my "Reviewed-by" to cover the entire patch.  I
> checked every caller and they all looked good to me.

Thanks, I'll drop the file name. AFAIR it was just below that file, so I
added it, but I could be wrong, too.

v5 will also squash the 2nd patch of v4 into this one
<URL:https://lore.kernel.org/linux-pm/ZbBAWROxRKE8Y8VU@kekkonen.localdomain/T/#m76d34e679e12d8536a20eb29af6e826e2a85a24b>,
I hope that's fine.

-- 
Kind regards,

Sakari Ailus
