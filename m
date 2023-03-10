Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F56B416D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706A210E21D;
	Fri, 10 Mar 2023 13:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE9010E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678456372; x=1709992372;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LKwfq6RnektJkoOmro9Y/2N5E1HI+eqc/JBfvfgrniQ=;
 b=d3R6fSoeeyjTulYScxb1TgLWuLVN31QmAt+A3X5i523uZIISChmeDrfP
 9N3OFB2xgaWMtDWttXiGiPWdGTjh6fip2d+AJgTmV7ECpDmqCWyGEGJLY
 gRxEI8nXPgIOOEPPRdDzFq+KeR7ZPndyrjf71tn0OjF/9w0XdGRzs5oPa
 bxjPPSXxkAPLdo/ioR0+q6StA4yQt33wT5M32KgnHkGw1/HTImELZGr2D
 BPesQfaDHiGNLCaK0BmjrIST9Tm4NJcNKcgaBdUIZQhcbMlKXjld6O1Tv
 AQsCrK7AYhtNv8LqBAOWlDqua/ViV/Cea7DouU/Dt3bmIUKdKQkR3/84O Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325080585"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="325080585"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="677818074"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="677818074"
Received: from klausuhl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.190])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 05:52:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
In-Reply-To: <ZAsgd4zsgbvWT0U0@Gentoo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230310110542.6649-1-lujianhua000@gmail.com>
 <87mt4k95zp.fsf@intel.com> <ZAsgd4zsgbvWT0U0@Gentoo>
Date: Fri, 10 Mar 2023 15:52:45 +0200
Message-ID: <87bkl090ia.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023, Jianhua Lu <lujianhua000@gmail.com> wrote:
> On Fri, Mar 10, 2023 at 01:54:18PM +0200, Jani Nikula wrote:
>> On Fri, 10 Mar 2023, Jianhua Lu <lujianhua000@gmail.com> wrote:
>> > The panels with two dsi connected (sync dual dsi mode) need to transmit
>> > dcs command to the two dsi host simultaneously, let's add
>> > mipi_dual_dsi_dcs_write_seq() macro for this kind of panels.
>> 
>> If we were to add a helper for this case, it should be a proper function
>> and not a macro like this.
>> 
>> We'd also need to see a user for this upstream.
>> 
>> >
>> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>> > ---
>> >  include/drm/drm_mipi_dsi.h | 15 +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >
>> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>> > index c9df0407980c..d0f0f75d4d83 100644
>> > --- a/include/drm/drm_mipi_dsi.h
>> > +++ b/include/drm/drm_mipi_dsi.h
>> > @@ -336,6 +336,21 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>> >  		}                                                          \
>> >  	} while (0)
>> >  
>> > +/**
>> > + * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
>> > + * @dsi: array of 2 DSI peripheral devices
>> 
>> This makes the assumption the devices are stored in an array. What if
>> drivers want to store them differently, for whatever reason? Maybe they
>> have an array of some container structs that have the devices? Maybe
>> they just have two struct mipi_dsi_device pointers?
> This array just store two struct mipi_dsi_device pointers
>> 
>> > + * @cmd: Command
>> > + * @seq: buffer containing data to be transmitted
>> > + */
>> > +#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)                   \
>> > +	do {                                                             \
>> > +		if (ARRAY_SIZE(dsi) > 2)                                 \
>> > +			return -EINVAL;                                  \
>> > +		int i;                                                   \
>> 
>> I believe this should lead to a warning for mixing code and
>> declarations.
>> 
>> > +		for (i = 0; i < ARRAY_SIZE(dsi); i++)                    \
>> > +			mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        \
>> 
>> This ignores errors.
> mipi_dsi_dcs_write_seq is also a macro, contains error checks in the body block.

Ugh, I think it's pretty scary to hide control flow like return
statements in macros like this.

IMO the the main user of mipi_dsi_dcs_write_seq()
i.e. panel_nv3051d_init_sequence() in
drivers/gpu/drm/panel/panel-newvision-nv3051d.c should be written to do
the writes from an array in a loop instead.

BR,
Jani.


>> 
>> > +	} while (0)
>> > +
>> 
>> Without an example user, I'm not yet convinced about the usefulness of
>> the helper, but I'd imagine something like this would be a more generic
>> approach, not enforcing the array, and handling errors properly:
>> 
>> ssize_t mipi_dsi_dual_dcs_write(struct mipi_dsi_device *dsi0,
>>                                 struct mipi_dsi_device *dsi1,
>>                                 u8 cmd, const void *data, size_t len)
>> {
>> 	ssize_t err = 0;
>> 
>> 	if (dsi0)
>>         	err = mipi_dsi_dcs_write(dsi0, cmd, data, len);
>> 
>> 	if (dsi1 && !err)
>>         	err = mipi_dsi_dcs_write(dsi1, cmd, data, len);
>> 
>> 	return err;
>> }
> Thanks for your explanation and this looks more reasonable.
>> 
>> But even that begs the question where does it end? There are a lot of
>> mipi_dsi_dcs_*() functions as well as mipi_dsi_generic_write(). Dual
>> wrappers for all of them? :o
> It's definitly useless to wrap all of them. Please ignore this patch.
>> 
>> 
>> BR,
>> Jani.
>> 
>> 
>> >  /**
>> >   * struct mipi_dsi_driver - DSI driver
>> >   * @driver: device driver model driver
>> 
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
