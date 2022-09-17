Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E55AA5BBAA9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 23:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1AE10E16D;
	Sat, 17 Sep 2022 21:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22810E16D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 21:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=K835L78wAWd1vvHafUmILzkirtudKUwhfouizi+4ZCo=;
 b=V11LbheF4rS17/U/io0JAMFDrEt03/pYuUMTOxiiaYNRgk6pMwkPtq7AW8g1NG9I/Z/Xh0Vk8zyJo
 j3aBJFJNEZRv68BikWfg6K19F5MTy7LBHs8GRdyfx+bPcjQ4Kjf7hNXE6vsWq+SnyXj+h7gJcTmFXe
 E+b88dXYmcUEBrtUSF4qNifAQg1EhUZ9mGszIh95JXyjcO2UMUn9ZDDIqcxzN+0HDqt2zudxOM+CxM
 IMawNLQekwopDu8vjVJbVC7kUEGgztJkKB3N+mj8q9Bf/PB4yOlH5JWgVbIkwVe+Bdwx9jVERKKw05
 TG97JJVCuLUcFIBohgHrU5tO1MVAOPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=K835L78wAWd1vvHafUmILzkirtudKUwhfouizi+4ZCo=;
 b=9lkiMA96ngovewmM6P4RdrQmlrUmtbw403DzTZDoerzLQrQQVXeklKQ3SVlTi0YstNIEPakGYAUKo
 K87S06TAw==
X-HalOne-Cookie: a8cda684d8d851f0f811b371135529ec6d765805
X-HalOne-ID: 9d0d5877-36ce-11ed-824f-d0431ea8bb10
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 9d0d5877-36ce-11ed-824f-d0431ea8bb10;
 Sat, 17 Sep 2022 21:20:55 +0000 (UTC)
Date: Sat, 17 Sep 2022 23:20:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/5] drm/gma500: Use backlight_get_brightness() to get
 the brightness
Message-ID: <YyY6Ng8hSxerHiIA@ravnborg.org>
References: <20220917140352.526507-1-hdegoede@redhat.com>
 <20220917140352.526507-4-hdegoede@redhat.com>
 <YyYyGivJbsnp+T4D@ravnborg.org>
 <a3ab15e8-b4a1-171d-a5cd-0ae1ed06998e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3ab15e8-b4a1-171d-a5cd-0ae1ed06998e@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Sat, Sep 17, 2022 at 11:00:55PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/17/22 22:46, Sam Ravnborg wrote:
> > On Sat, Sep 17, 2022 at 04:03:50PM +0200, Hans de Goede wrote:
> >> Use backlight_get_brightness() instead of directly referencing
> >> bd->props.brightness. This will take backlight_is_blank() into account,
> >> properly setting brightness to 0 when screen-blanking has been requested
> >> through the backlight sysfs interface.
> >>
> >> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Thank you.
> 
> I have just send out a v3 with your ack added and fixing the
> 2 unused variables when CONFIG_BACKLIGHT is not set spotted
> by the lkp test robot.
> 
> I was sort of hoping that you could review / ack the entire
> series ?
OK, I may take a closer look tomorrow then (as time permits - needs to
prepare for a business trip too).
I have not looked at gma500 code that much so I hope Patrick
takes a look too.

	Sam
