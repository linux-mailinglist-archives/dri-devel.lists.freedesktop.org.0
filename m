Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6E7DF622
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E832610E8F4;
	Thu,  2 Nov 2023 15:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F328810E8F4;
 Thu,  2 Nov 2023 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698938279; x=1730474279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5Uzrbvx48qGjXpbAuwhyeliMci7jTovYf/GA8M3d6Rc=;
 b=aNx4RTGfDygODm/zwNVcGq6zmK0pyPQkCcA2ud3YvhogwAG0xwr4F6Fv
 tdSQIknAtu0E7OGcBIjQMhUOFAtARDFTvhI2NE//TkfE83X/ip8WkD8Hg
 39hKr9YHG1xUHejLO177qy0JIqHTRFA310LbxUhWP6yn4WqRrHjaWL3aN
 1NlvGBr10Q47esUc5sbHeG4tLhurEdO4kgqbQY7i0RA0Ps9ln+i5pMH6N
 GtWoWmZD3/KL5bMBo5pLOySzin8fLKfidg4qTZUZ9NxlwxQkjG7oQYhai
 bf66X9mF6XqkYpB43K4X5LSy7RRBbC7dY8EALRDD3cHnZoHY5sAazdaQL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="474977796"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="474977796"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008491941"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="1008491941"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:17:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qyZRi-0000000Aind-3Sfa; Thu, 02 Nov 2023 17:17:22 +0200
Date: Thu, 2 Nov 2023 17:17:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [rft, PATCH v3 00/15] drm/i915/dsi: 2nd attempt to get rid of
 IOSF GPIO
Message-ID: <ZUO9grtE_jLnBBjW@smile.fi.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 02, 2023 at 05:12:13PM +0200, Andy Shevchenko wrote:
> DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
> talking to GPIO IP behind the actual driver's back. A second attempt
> to fix that is here.
> 
> If I understood correctly, my approach should work in the similar way as
> the current IOSF GPIO.
> 
> Hans, I believe you have some devices that use this piece of code,
> is it possible to give a test run on (one of) them?

Subject should be "3rd attempt ..." :-)

> In v3:
> - incorporated series by Jani
> - incorporated couple of precursor patches by Hans
> - added Rb tag for used to be first three patches (Andi)
> - rebased on top of the above changes
> - fixed indexing for multi-community devices, such as Cherry View
> 
> In v2:
> - added a few cleanup patches
> - reworked to use dynamic GPIO lookup tables
> - converted CHV as well


-- 
With Best Regards,
Andy Shevchenko


