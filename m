Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E712634009
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F293A10E0CC;
	Tue, 22 Nov 2022 15:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CF310E0CC;
 Tue, 22 Nov 2022 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669130478; x=1700666478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s3VVg2g632Tux17uwTkaAb/v5mQIhikDvfW22IAN4Os=;
 b=P2WM15ocpFrohMzOP6L21vTcu3Gmg8pHi1KCaSbND9SYRcuu7XMB9/Bz
 3xlC+QrOZuotcXjNXcQSvwZTYLDrKuspBmlmSg9ndIF5aZM3zVG+1/TiF
 NG/kH3BvH5qVJRAh++5qb9dMmFTG3oIxrjYSYqparcVUt//PwypEUC2oX
 UwB5r1nqMbVhDo56jIuKPLW8DIjQyqx19hSXB1BZLC9nrfD2kWbjxEMFV
 LAGjACZC2IkQ3Bbd3UgAorYGBNrSFjjAIjdaz5+Hr/QSqjzkb8mVCpVs0
 u6vAcZyj1sr4E8ujv2Dd94jVgRxItfaHPTzOC0BRiCiBIMAW5egtMS0hu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="294230154"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="294230154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 07:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="886570850"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="886570850"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2022 07:20:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oxV4i-00FsuP-1K; Tue, 22 Nov 2022 17:20:40 +0200
Date: Tue, 22 Nov 2022 17:20:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/4] usb: gadget: hid: Convert to use list_count()
Message-ID: <Y3zoyFs2Q9ogoz/L@smile.fi.intel.com>
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
 <20221114162207.62559-2-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CJvuMUNwPQ7GUQh0dinYSfQ5TTLMawUt7hMVKJD4S3GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CJvuMUNwPQ7GUQh0dinYSfQ5TTLMawUt7hMVKJD4S3GQ@mail.gmail.com>
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
 Kevin Cernekee <cernekee@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jakob Koschel <jakobkoschel@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 04:15:35PM -0300, Fabio Estevam wrote:
> On Mon, Nov 14, 2022 at 1:22 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > The list API now provides the list_count() to help with counting
> > existing nodes in the list. Uilise it.
> 
> s/Uilise/Utilise

Fixed for v3, thanks!

-- 
With Best Regards,
Andy Shevchenko


