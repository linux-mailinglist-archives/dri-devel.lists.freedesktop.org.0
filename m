Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAD81B040D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 10:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857F56E46C;
	Mon, 20 Apr 2020 08:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CBD6E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:14:18 +0000 (UTC)
IronPort-SDR: KkySJW5LmZEfxrw/ImaCSzl8xaRL0jMeVETZIa3XFVVQSWbbt1aQYb3l1d+4wYvdpqUpEC41uO
 FL7HL4vXfWxQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:14:13 -0700
IronPort-SDR: GQi+lZ63AuQCCQCozaTBET02e0q31aTNZ8Mhwo8nHFR6eJJau/IulOjjXySYruUpzlKYn8Glfu
 dahNvYB8YH7A==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="429039579"
Received: from iastakh-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.229])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:14:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
In-Reply-To: <20200417190854.GI26002@ziepe.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca>
Date: Mon, 20 Apr 2020 11:14:02 +0300
Message-ID: <87y2qq1smt.fsf@intel.com>
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
Cc: marex@denx.de, linux-fbdev@vger.kernel.org, dsd@laptop.org,
 Arnd Bergmann <arnd@arndb.de>, Saeed Mahameed <saeedm@mellanox.com>,
 airlied@linux.ie, masahiroy@kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 thellstrom@vmware.com, dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, haojian.zhuang@gmail.com,
 jfrederich@gmail.com, robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Fri, Apr 17, 2020 at 07:14:53PM +0200, Daniel Vetter wrote:
>> On Fri, Apr 17, 2020 at 05:55:45PM +0200, Arnd Bergmann wrote:
>> > I tried to fix up some dependencies after the sii8620 "imply EXTCON"
>> > statementn broke, trying a few things but in the backing out a
>> > change that would completely reverse the LEDS_CLASS selects into
>> > a 'depends on'. 
>> > 
>> > However, what I got now are multiple changes that remove gratious
>> > "selects" that lead to circular dependencies for sii8620 and others:
>> > 
>> > - Anything doing "select FB" is now gone, or becomes "depends on FB",
>> > 
>> > - DDC support depends on I2C instead of selecting it
>> > 
>> > - backlight class device support is never selected by framebuffer
>> >   drivers but has proper dependencies
>> > 
>> > I have done thousands of randconfig build tests on this, but no
>> > runtime tests.
>> > 
>> > Some of the 'depends on FOO || !FOO' statements could be simplified
>> > into a new 'uses FOO' syntax based on a patch from Saeed Mahameed,
>> > but I would for the moment treat that as a cleanup that can be done
>> > later.
>> > 
>> > If we can agree on these changes, maybe someone can merge them
>> > through the drm-misc tree.
>> > 
>> > Please review
>> 
>> Biggest concern I have is that usability of make menuconfig is horrible,
>> and it's very hard to find options that are hidden by depends on. You can
>> use the search interface, if you happen to know the option.
>> 
>> Once you've surmounted that bar, the next one is trying to find what
>> exactly you need to enable. Which again means endless of recursive
>> screaming at Kconfig files, since make menuconfig doesn't help you at all.
>
> +1 on this. But this is a general kconfig problem, and not unique to
> DRM, I've done this screaming for many different things now.. eg to
> turn on every single RDMA driver.
>
> I hackily delt with it by creating this rather insane script based on
> the python kconfiglib to try and sort things out mostly automatically:
>
> https://github.com/jgunthorpe/Kernel-Maintainer-Tools/blob/master/gj_tools/cmd_kconfig.py
>
> It would be great if menuconfig had a key to say 'hey, really, turn
> this on and everything it depends on, recursively'

I'm really all for switching to using depends when that is the
semantically right thing to do. In many places using select is a hack to
make the UI simpler, and that's just plain wrong. We'll be doomed to
perpetual randconfig build failures and duct tape fixes.

I'm pretty tired of this, and I regularly ignore those duct tape fixes
to i915 backlight build issues on some bizarre configs that nobody will
ever use, and would not exist if depends were used throughout.

I'm fine with select but only when it's restricted to symbols that have
no dependencies of their own and have no UI. This is in line with
Documentation/kbuild/kconfig-language.rst. Not enforcing this is another
Kconfig tool shortcoming.

See also my reply to Sam [1].

BR,
Jani.


[1] https://lore.kernel.org/dri-devel/871roi37qe.fsf@intel.com/


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
