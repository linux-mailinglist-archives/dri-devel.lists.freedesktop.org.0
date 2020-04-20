Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80961B03B1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 10:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A1188647;
	Mon, 20 Apr 2020 08:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5DF88647
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 08:02:44 +0000 (UTC)
IronPort-SDR: XAI1l0nD/PLj2aKl5v2n3jNKbkcwKq1Y5vmiH4MT/eQQIgaOLCnYOTjiSw30+JkLmX4DaIGbPr
 3IQHu5v3lP4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:02:43 -0700
IronPort-SDR: FuTeOBDq3EWzERLG+wP/aJ56TVYKzRwUG7FrNE48/EOgCU8Fu6TO3rHp5dk/b68TrPcF0uOuYK
 rKUR5Cm2VpCQ==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="429035397"
Received: from iastakh-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.229])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:02:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 7/8] fbdev: rework backlight dependencies
In-Reply-To: <20200417170444.GB30483@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-8-arnd@arndb.de> <20200417170444.GB30483@ravnborg.org>
Date: Mon, 20 Apr 2020 11:02:33 +0300
Message-ID: <871roi37qe.fsf@intel.com>
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
Cc: marex@denx.de, Jason Gunthorpe <jgg@ziepe.ca>, linux-fbdev@vger.kernel.org,
 dsd@laptop.org, Nicolas Pitre <nico@fluxnic.net>, airlied@linux.ie,
 masahiroy@kernel.org, jfrederich@gmail.com,
 Saeed Mahameed <saeedm@mellanox.com>, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, haojian.zhuang@gmail.com,
 linux-graphics-maintainer@vmware.com, robert.jarzmik@free.fr,
 daniel@zonque.org, Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Apr 2020, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Arnd.
>
> On Fri, Apr 17, 2020 at 05:55:52PM +0200, Arnd Bergmann wrote:
>> Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
>> make any driver that needs it have a dependency on the class device
>> being available, to prevent circular dependencies.
>> 
>> This is the same way that the backlight is already treated for the DRM
>> subsystem.
>
> I am not happy with the direction of this patch.
> It is not easy to understand that one has to enable backlight to
> be allowed to select a display or an fbdev driver.

Arguably that is a problem in Kconfig, and that applies to *all*
dependencies everywhere. It isn't something new to this patch.

For example, in the context of this patch you have:

  config HT16K33
	 tristate "Holtek Ht16K33 LED controller with keyscan"
	 depends on FB && OF && I2C && INPUT
 +	depends on BACKLIGHT_CLASS_DEVICE

The same thing could be said about FB and OF and IC2 and INPUT for
HT16K33, right? Why would *backlight* be the tipping point that makes
this difficult to understand?

Yeah, I agree it's not straightforward, but I think depends is the right
choice, not select.

The effort for making this easier to understand should be directed at
the various menuconfig tools to better highlight the dependencies that
should be enabled to let you enable other options.

> How about somthing like this:

I think this is a hack in Kconfig files that should really be fixed in
the Kconfig tooling instead. IMHO Kconfig should be as simple a
description of the dependencies as possible, not so much a UI language.

FWIW the patch is

Acked-by: Jani Nikula <jani.nikula@intel.com>

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
