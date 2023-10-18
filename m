Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F037A7CDC4B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 14:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0CF10E3EC;
	Wed, 18 Oct 2023 12:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665D10E3E3;
 Wed, 18 Oct 2023 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697633563; x=1729169563;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zFRykA9qO6f1M+eErBq6qWJ1MUa45/kg2R+tq08YzPo=;
 b=kEnyNcl04Dt8QJhSbjm6AKGcn9cmEmzhgVQT6yWOQllEIsACaGXcs6sg
 nvc6ZHCooSD78RPpOLnQrFBIXUbFqXZXNZTfV8bH0PJP/iMImOqEA0rwP
 3jt9HV9gL9QAYqVkEfHin0MQLsANDrs/VOVCL1o2lReTxzlQH/2oR743o
 EJmJGu1ysN2T5+4LSYwQbi+8NdoQTFxcKgciZbeaUNcTJnsj+jBx89wMr
 XbaGu9cl5xdpgjtF8ASz9+jr9Z9fC1eyvDtkvMnjuSd95ZS7EDOLLXVog
 07T8WtxatycdfcnLbb5M25UkDPzW9yh382ya4mtvVNUZBQkR6jb4kYacP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="371067699"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="371067699"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="750082057"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="750082057"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:52:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qt62O-00000006ajn-0ppx; Wed, 18 Oct 2023 15:52:36 +0300
Date: Wed, 18 Oct 2023 15:52:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [rft, PATCH v1 0/2] drm/i915/dsi: An attempt to get rid of IOSF
 GPIO on VLV
Message-ID: <ZS/VE3w7bafj+Kuu@smile.fi.intel.com>
References: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
 <0c88666a-ff36-b649-d244-ccce500b6c2f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c88666a-ff36-b649-d244-ccce500b6c2f@redhat.com>
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
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 11:09:35AM +0200, Hans de Goede wrote:
> On 10/18/23 07:10, Andy Shevchenko wrote:
> > DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> > talking to GPIO IP behind the actual driver's back. An attempt to fix
> > that is here.
> > 
> > If I understood correctly, my approach should work in the similar way as
> > the current IOSF GPIO. 
> > 
> > Hans, I believe you have some devices that use this piece of code,
> > is it possible to give a test run on (one of) them?
> 
> Yes I should be able to find a device or 2 which poke GPIOs from the
> VBT MIPI sequences. Unfortunately I don't know from the top of my head
> which devices actually use this, so I may need to try quite a few devices
> before finding one which actually uses this.
> 
> I'll try to get this series tested sometime the coming weeks,
> depending on when I can schedule some time for this.

No hurry. maybe you simply can add into your usual tree you run on your
devices?

-- 
With Best Regards,
Andy Shevchenko


