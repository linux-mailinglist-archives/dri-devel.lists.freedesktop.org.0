Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEFF12448D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 11:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2171D8999A;
	Wed, 18 Dec 2019 10:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656D48999A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 10:30:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 02:30:24 -0800
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="210047542"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 02:30:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
In-Reply-To: <20191217194058.GA30852@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
 <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
 <20191217194058.GA30852@ravnborg.org>
Date: Wed, 18 Dec 2019 12:30:17 +0200
Message-ID: <877e2uylhi.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Dec 17, 2019 at 08:25:03AM -0800, Randy Dunlap wrote:
>> On 12/17/19 6:07 AM, Andy Shevchenko wrote:
>> > The initial commit followed by the fix didn't take into consideration the case
>> > 
>> > CONFIG_DRM_PANEL=y
>> > CONFIG_BACKLIGHT_CLASS_DEVICE=m
>> > CONFIG_DRM_I915=y
>> > 
>> > where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
>> > Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
>> > 
>> > Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
>> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>> > Cc: Sam Ravnborg <sam@ravnborg.org>
>> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > Cc: Thierry Reding <thierry.reding@gmail.com>
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Sean Paul <sean@poorly.run>
>> > Cc: David Airlie <airlied@linux.ie>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Cc: Maxime Ripard <mripard@kernel.org>
>> > Cc: dri-devel@lists.freedesktop.org
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> 
>> Yes, that fixes the build error.  Thanks.
>> 
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Hi Andy - thanks for fixing this. And thanks Randy for verifying the
> fix.
> It passed my build test and is now pushed to drm-misc-next.

As I wrote in [1], this allows a configuration that builds and links,
but is silently broken. You won't get backlight support in drm panel
which would be a reasonable expectation with
CONFIG_BACKLIGHT_CLASS_DEVICE=m.

BR,
Jani.


[1] http://mid.mail-archive.com/87d0cnynst.fsf@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
