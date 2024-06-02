Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296D8D7477
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 11:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E310010E05F;
	Sun,  2 Jun 2024 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lyuf9xyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C56410E05F;
 Sun,  2 Jun 2024 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717319174; x=1748855174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rde+gS+/1SJ6Gr36HkKsuWVC84C5A7IxDaZV55cYZbE=;
 b=Lyuf9xyCAl9YFh34um98uXTb3NyO5+aSVLhhB4DG0KqqnaXE9HeVid+f
 15hsbt1I7Nb44u69rUj6AQFUiAxjIyw+hMb+fwB43hbbcnwJTtK9Lc03Y
 Ksbt041uAjh0FhjqrDtJLTjrBwJDnGoJX7/xcXEtUxr6nMztDBS5poeIu
 BKQH3ETbBE4gKHSUKmbam1riw8+4P5UBsGEudcP+V0LCsbNVOwn2eRZU0
 3aLicIhnDpyTU+Xfyi3Il6W4PPYVKV0K3ZQa7M3xrl30BXgfhoH3/mweg
 4xRH5h+3ON9nrtdUiox2dqYp3b/nQFrSCtfnpixmXBA2e6StAvrdsIXNm w==;
X-CSE-ConnectionGUID: fcM7drBgSoyWLpW4sXgKnQ==
X-CSE-MsgGUID: I7FovyOMT4+Eb8l1jI6hSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="24942883"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="24942883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 02:06:12 -0700
X-CSE-ConnectionGUID: jTIoXAiyT9iJV/EfV4/gFQ==
X-CSE-MsgGUID: tUBKbWb3Sd+hRJ9gH/mbdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="67780590"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 02:06:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sDhAE-0000000Cyf6-42sP; Sun, 02 Jun 2024 12:06:06 +0300
Date: Sun, 2 Jun 2024 12:06:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/resource: optimize find_next_iomem_res
Message-ID: <Zlw1_n20oqchAYxH@smile.fi.intel.com>
References: <20240531053704.2009827-1-olvaffe@gmail.com>
 <ZlmQ3_wcL3cgp4Hb@smile.fi.intel.com>
 <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7SsD+X7KAO=3vEYU_7YGM_f+7k1fdC9nEK=-NaJw8oYaA@mail.gmail.com>
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

On Fri, May 31, 2024 at 02:31:45PM -0700, Chia-I Wu wrote:
> On Fri, May 31, 2024 at 1:57 AM Andy Shevchenko <
> andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, May 30, 2024 at 10:36:57PM -0700, Chia-I Wu wrote:

...

> > P.S> I'm not so sure about this change. It needs a thoroughly testing, esp.
> > in PCI case. Cc'ing to Ilpo.

> What's special about PCI?

PCI, due to its nature, may rebuild resources either by shrinking or expanding
of the entire subtree after the PCI bridge in question. And this may happen at
run-time due to hotplug support. But I'm not a deep expert in this area, Ilpo
knows much more than me.

-- 
With Best Regards,
Andy Shevchenko


