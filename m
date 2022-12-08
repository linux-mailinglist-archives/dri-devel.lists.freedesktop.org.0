Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA79647025
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 13:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF56B10E49C;
	Thu,  8 Dec 2022 12:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9FA10E20F;
 Thu,  8 Dec 2022 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670504092; x=1702040092;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HKOTpPr3Rc+JigkbyXJ0fjP09xprOScLGyKpsYCD4GI=;
 b=CfXxEUlcHFR/yRIhMNqyrBJ0dpqqp6aj0zpvWthDUWr6U/6XCK2zqzem
 Bwar1fsyUZ7SPAB3K4EAQUiK5OCzuzSZgEWiQtT9bqqZ1TkZtQw1UsAaq
 HMIGfxArZDqfWI/RS9JhySp4uj6QLdFUsn4H6ObpmqhiICk8tE5M0ppqV
 UNaU23gfV0CgASbS/1ohYWSSa7knOKEGkz4EgAVU6b0v1ypEo7AAIVAiK
 aQKqBrK2jQdmd5vM3GXLyK9+RWRzfFgstZsIkDHwi4pySpa0L+mw8qBbe
 rEVRaWwli0n/9GLnyHoVptrK5ZK6a9dFrNPyIGTx4IybGUC+fSoROkllv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="379323685"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="379323685"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 04:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="624689457"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="624689457"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006.jf.intel.com with ESMTP; 08 Dec 2022 04:54:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1p3GQH-006KqO-1n; Thu, 08 Dec 2022 14:54:45 +0200
Date: Thu, 8 Dec 2022 14:54:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i915: Move list_count() to list.h as
 list_count_nodes() for broader use
Message-ID: <Y5HelZhkxnPf6hIs@smile.fi.intel.com>
References: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 03:48:35PM +0200, Andy Shevchenko wrote:
> Some of the existing users, and definitely will be new ones, want to
> count existing nodes in the list. Provide a generic API for that by
> moving code from i915 to list.h.

Greg, I believe this one is ready to be taken. Or please tell me what I need
to do.

-- 
With Best Regards,
Andy Shevchenko


