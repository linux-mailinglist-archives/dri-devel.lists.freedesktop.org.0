Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168397ED84
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1141710E410;
	Mon, 23 Sep 2024 14:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/DTcrE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269910E40A;
 Mon, 23 Sep 2024 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727103484; x=1758639484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PU0vFzC82hKhIAq04uKdZpq6JNhw6xC+xtJcktgE9U4=;
 b=A/DTcrE5rp9WdToAgzVj+nVTWoClh5o6YXLzgQQLDfsPw6Mpu2a+2IOe
 Z1Riqvi/WnrFtDnkjkuTm5ufhERn2FbMAkEhpX3K5+M7woXkbQa4XoY9n
 28cA9aJXcIZb5QX4DKWdFCb79JIhjMqUQJj5SezDLffIadGQ7N7D3WdL3
 SL12R9ocBGR23xkm0Gqcy7ufnqNNs87VCXtVV5h9EsOvt+HEpjMiJYPfa
 LutQ3I31IggfLXYBoP7aYNZEDsoo1q+DvJ2KHOmgXITAuUSm1duQ27GB1
 znwzGj2KQVrfxNgqNsLjjpFjatJW66iCF+32eQXy1h1X8tBbUTNEQhyYK A==;
X-CSE-ConnectionGUID: x7AuDxUPQAyXcss+uBD8Dw==
X-CSE-MsgGUID: vQaz529jTK+QGN4BmFkfgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29778489"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="29778489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:58:04 -0700
X-CSE-ConnectionGUID: Qo2gkV0/TxWGy2XaQmg/ew==
X-CSE-MsgGUID: QpuZ9iq8TQaBdstW40/SAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75205133"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:58:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sskVh-0000000C2nl-0lfs; Mon, 23 Sep 2024 17:57:57 +0300
Date: Mon, 23 Sep 2024 17:57:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v6 1/4] drm: Introduce device wedged event
Message-ID: <ZvGB9P_JdXcnTfW2@smile.fi.intel.com>
References: <20240923035826.624196-1-raag.jadav@intel.com>
 <20240923035826.624196-2-raag.jadav@intel.com>
 <ZvEpH_po4bYmEISh@smile.fi.intel.com>
 <ZvF8q7xkbEegPzc9@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvF8q7xkbEegPzc9@black.fi.intel.com>
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

On Mon, Sep 23, 2024 at 05:35:23PM +0300, Raag Jadav wrote:
> On Mon, Sep 23, 2024 at 11:38:55AM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 23, 2024 at 09:28:23AM +0530, Raag Jadav wrote:

...

> > > +extern const char *const wedge_recovery_opts[];
> > 
> > It's not NULL terminated. How users will know that they have an index valid?
> 
> It's expected to be accessed using recovery_*() helpers.

If so, this has to be static then.

> > Either you NULL-terminate that, or export the size as well (personally I would
> > go with the first approach).

-- 
With Best Regards,
Andy Shevchenko


