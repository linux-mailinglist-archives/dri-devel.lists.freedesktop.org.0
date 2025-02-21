Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1344A40095
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B210E2EB;
	Fri, 21 Feb 2025 20:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CahYxV7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B117F10E2EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740169109; x=1771705109;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=S/2hGfrFysJuEd0unIxyyVV+UbHaC4Fe/uh7YjUz8Ms=;
 b=CahYxV7cTKQULcos5wuIdZ8y2Ci9WVKWbksMTLWuOs4ZgwiJGkFzlWAT
 e8rLF73DkfrANHhQ7thWOkUI8H0eHVhoZUW4ECGP8OLcCjzfsvzi2rXpN
 4q0/zj31BIYutrCGpLiGuzclxNtWwGkHpE/0S0mLxqf85NFJ71tVwxHFF
 6rzb18T/033Ywt7JW/vB4QCkNcVCGzDoHMsIpHdJdZhpvJJ7qflnLtNKc
 D6YL1jacZP0XMSrr2M9UrArO/rIpmmJr8N17FXXnXaPpLlq9m4plQhr3r
 8m8qvBd6aZuioheO2R1hHNQgylFDIdX+2K7jrYAmvRZkix4Te0OfF2rDY A==;
X-CSE-ConnectionGUID: RI4H72eHTQ6BwHKBwzg27w==
X-CSE-MsgGUID: lqDfteogQQyAzuyux0xPlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41143539"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41143539"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:18:28 -0800
X-CSE-ConnectionGUID: 88ZxKzAJRuW9VMb7P1uFew==
X-CSE-MsgGUID: yH8yGsrgTQuJiHoU/ePCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120566440"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 12:18:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tlZTU-0000000Djsq-2C8r; Fri, 21 Feb 2025 22:18:16 +0200
Date: Fri, 21 Feb 2025 22:18:16 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
 <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
 <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
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

On Fri, Feb 21, 2025 at 07:37:17PM +0000, Aditya Garg wrote:
> > On 21 Feb 2025, at 8:59 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Fri, Feb 21, 2025 at 11:37:13AM +0000, Aditya Garg wrote:

> > First of all, I do not see the cover letter. Is it only an issue on my side?
> 
> These are literally 3 patches that are self explanatory.

So what? Anybody will be puzzled with the simple question (and probably not the
only one): Why are these in the series? Do they dependent or independent? What's
the goal and how they should be routed? (You see, there are already 4).

> Is this a hard and fast rule that a cover letter MUST be there?

Cover letter SHOULD be there if there are more than one patch.
Yes, there are exceptions, but this is the idea for the series.

Use your common sense, if there is no documented thingy.

...

> > Second, don't issue versions too fast, give at least a few days for the
> > reviewers to have a chance on looking into it.
> 
> Sure, I’ll take care of that.

Btw, _this_ is very clearly documented.

-- 
With Best Regards,
Andy Shevchenko


