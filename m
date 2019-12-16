Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550BE120550
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 13:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2F06E4F4;
	Mon, 16 Dec 2019 12:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A26E4F4;
 Mon, 16 Dec 2019 12:18:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 04:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="266240411"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2019 04:18:41 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1igpKi-0006VZ-Up; Mon, 16 Dec 2019 14:18:40 +0200
Date: Mon, 16 Dec 2019 14:18:40 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs from VBT
Message-ID: <20191216121840.GS32742@smile.fi.intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215163810.52356-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 05:38:05PM +0100, Hans de Goede wrote:
> Hi All,
> 
> This is a new (completely rewritten) version of my patches to make the
> i915 code control the SoC panel- and backlight-enable GPIOs on Bay Trail
> devices when the VBT indicates that the SoC should be used for backlight
> control. This fixes the panel not lighting up on various devices when
> booted with a HDMI monitor connected, in which case the firmware skips
> initializing the panel as it inits the HDMI instead.
> 
> This series has been tested on; and fixes this issue on; the following models:
> 
> Peaq C1010
> Point of View MOBII TAB-P800W
> Point of View MOBII TAB-P1005W
> Terra Pad 1061
> Thundersoft TST178
> Yours Y8W81
> 
> Linus, this series starts with the already discussed pinctrl change to
> export the function to unregister a pinctrl-map. We can either merge this
> through drm-intel, or you could pick it up and then provide an immutable
> branch with it for merging into drm-intel-next. Which option do you prefer?
> 
> Lee, I know you don't like this, but unfortunately this series introcudes
> some (other) changes to drivers/mfd/intel_soc_pmic_core.c. The GPIO subsys
> allows only one mapping-table per consumer, so in hindsight adding the code
> which adds the mapping for the PMIC panel-enable pin to the PMIC mfd driver
> was a mistake, as the PMIC code is a provider where as mapping-tables are
> per consumer. The 4th patch fixes this by moving the mapping-table to the
> i915 code, so that we can also add mappings for some of the pins on the SoC
> itself. Since this whole series makes change to the i915 code I plan to
> merge this mfd change to the drm-intel tree.

FWIW, Lee, I believe there will be no (significant) changes in the driver Hans
touched. For the record it seems only Hans is touching drivers for old Intel
platforms (such as Baytrail and Cherryview).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
