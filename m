Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF8B5452F6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 19:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451661138F8;
	Thu,  9 Jun 2022 17:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484BF1138F8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 17:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PngJV0fOQLwfKIkqb7hkPhv5VV2jzxuklqa/4eAL0Wc=;
 b=Xxq+NRf2PMtLyiVHS86SoJwNRzPssFYIVkOdVqqA+g+6M9LoJg9GaMQrG6hmwzEdMQxeKBtuKVJDk
 ixNQt92nXHp5bjSU7IMMKd/SJ0/+W3oUtHCVEN3Z5Hhkh69GAU7F/Z2eSIUcFiksSr1C03X0y24JM8
 1cjBAZl472mdM2tjV+pIsSyRclb8yzgYwZhIJ6ftW4uzRctQlmISSjiu6cIutg1HDcpdJfUTyuHFvm
 RQxSAekV2EX+NXrsr8mvssDFD8+sgO8XLA+VkLxIAeYTVtalTQYe5mz8X4CoK+DgTlNkIaK73AEFBv
 2hMcv3ArLfAZAcVAvqeBqDF3Cb1deYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PngJV0fOQLwfKIkqb7hkPhv5VV2jzxuklqa/4eAL0Wc=;
 b=e/H/5jol8vzhvLtury+WU8PNc8TExjdg+CCmoAvGFdbAWGDTwNgTdhzT9FEYXOYKhNdJqeh/b/eeJ
 52ViYCWCg==
X-HalOne-Cookie: e8b68a89220797ee6f84a44fb1bf6d39574960f8
X-HalOne-ID: ecbedf15-e819-11ec-8231-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ecbedf15-e819-11ec-8231-d0431ea8bb10;
 Thu, 09 Jun 2022 17:30:58 +0000 (UTC)
Date: Thu, 9 Jun 2022 19:30:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Rework backlight status updates
Message-ID: <YqIuUYUXzxeSgZ/o@ravnborg.org>
References: <20220608205623.2106113-1-steve@sk2.org>
 <20220609095412.fccofr2e2kpzhw4t@maple.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609095412.fccofr2e2kpzhw4t@maple.lan>
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Helge Deller <deller@gmx.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

thanks for taking care of all these backlight simplifications - this
really helps to make the code simpler and more readable.

On Thu, Jun 09, 2022 at 10:54:12AM +0100, Daniel Thompson wrote:
> On Wed, Jun 08, 2022 at 10:56:23PM +0200, Stephen Kitt wrote:
> > Instead of checking the state of various backlight_properties fields
> > against the memorised state in atmel_lcdfb_info.bl_power,
> > atmel_bl_update_status() should retrieve the desired state using
> > backlight_get_brightness (which takes into account the power state,
> > blanking etc.). This means the explicit checks using props.fb_blank
> > and props.power can be dropped.
> > 
> > Then brightness can only be negative if the backlight is on but
> > props.brightness is negative, so the test before reading the
> > brightness value from the hardware can be simplified to
> > (brightness < 0).
> 
> props.brightness should always be in the interval 0..max_brightness.
> 
> This is enforced by the main backlight code (and APIs to set the
> brightness use unsigned values). Thus props.brightness could only be
> negative is the driver explicitly sets a negative value as some kind of
> placeholder (which this driver does not do).
> 
> I don't think there is any need to keep this logic.

Daniel is right - please drop the "if (brightness < 0)" logic.
I have looked a bit on the datasheet in my attempt to do a drm version
of this driver - something that I am yet to succeed and the backlight
core avoid any negative values.

	Sam
