Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6536E997
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 13:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650066EE27;
	Thu, 29 Apr 2021 11:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B3D6EE27
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:31:30 +0000 (UTC)
Received: from mail-03.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FWCxr1YgSz4x0xr
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 11:31:28 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="MGdQmwqn"
Date: Thu, 29 Apr 2021 11:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1619695883;
 bh=W3tjhO2kfCx0cVM9xE32yC0Ar+zcSP7Zi8ad3UEEna8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=MGdQmwqny8kZW8+/Ds5C0OrHJt+iROdODkeLKLEuUCwBW0eFq6i0oEaLNow17amOi
 DS/L+abqMHwd1vNjNSMs+ti75mjqNLNGSwB4q9DOGONuikm5c0MXbAktwf83d7YTsd
 0oqGrWwCGF4brpw6yICEu7uFYN/ahye671z0mDZo=
To: Daniel Thompson <daniel.thompson@linaro.org>
From: pgeiem <pgeiem@protonmail.com>
Subject: Re: [led-backlight] default-brightness-level issue
Message-ID: <iOsaGQwBS7Kf3OTapGfH6piU_e_SL0O_FyccdxfGlPCCVF6oHrjk4pMrqAbMA7S8DjTPKs47t8e4C_dq5fjDT5rasK5GSkFTWpW5j9saxTE=@protonmail.com>
In-Reply-To: <20210429110016.76huj54zijvhtuan@maple.lan>
References: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
 <20210429110016.76huj54zijvhtuan@maple.lan>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: pgeiem <pgeiem@protonmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, April 29, 2021 1:00 PM, Daniel Thompson <daniel.thompson@linaro.org> wrote:

> On Fri, Apr 23, 2021 at 01:04:23PM +0000, pgeiem wrote:
>
> > Dear all,
> > On a custom board I have a simple DPI panel. Panel's backlight is
> > drive with an I2C led driver (PCA9632). led-backlight driver is sued
> > to manage this as a backlight.
> > When using brightness-levels and default-brightness-level the
> > backlight stay turned-off even if manually trying to set a different
> > index value to brightness through sysfs.
> > I traced this issue as follow: When led_bl_update_status() is called
> > the brightness value is returned from backlight_get_brightness() which
> > call backlight_is_blank(). In my case backlight_is_blank() return true
> > due to props.power = FB_BLANK_POWERDOWN which is != FB_BLANK_UNBLANK.
> > I traced why at startup props.power is FB_BLANK_POWERDOWN and found
> > that in led_bl_probe() when a default brightness is set (>0)
> > props.power is set to FB_BLANK_POWERDOWN which seems incorrect to me.
> > I made the small change below and default brightness is correctly used
> > at startup. I am not really sure this is an issue and if my change is
> > correct or if I am doing something incorrect somewhere else. So I
> > first would like to get your opinion on this and if correct will send
> > a patch.
>
> Makes sense. Please send this as a patch.
>
> Daniel.

I finally believe this was correct.

A link between the panel and the backlight was missing in dts. With this link the backlight is turned on (props.power = FB_BLANK_UNBLANK) from drm_panel_enable function after enabling the panel.

Let me know if you disagree and still believe I should send the patch.

Patrick



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
