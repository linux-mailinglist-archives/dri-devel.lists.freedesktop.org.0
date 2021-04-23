Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B388C3692A1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 15:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF406E0E4;
	Fri, 23 Apr 2021 13:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCB26E0E4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 13:04:38 +0000 (UTC)
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FRZJ50YqHz4wyTN
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 13:04:37 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="lTqPdXBo"
Date: Fri, 23 Apr 2021 13:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1619183072;
 bh=xRpQ/1OwJdezUCJ/xkDRZDKh6Y3hAmObpvrbML/SA6U=;
 h=Date:To:From:Reply-To:Subject:From;
 b=lTqPdXBoFK6m2QG2n+2P5O3jEB0xSIn5JGhKg0M8qiIYH3OIwuUttCbs/PwA0vGv3
 XUdER0CFvQmO8cLpTaswhytRcSbCUJ7JNPErXEu2AJorD8djcB8uzCTwt2pdgK1PkC
 Wasy+/wxmctFcgSGTfybdzz6HLsVG3LW0YJzAzTg=
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: pgeiem <pgeiem@protonmail.com>
Subject: [led-backlight] default-brightness-level issue
Message-ID: <e_WDxLKZ_lxATxDaTMkr5jVLhIs2O0NQOSd-Inff7IMEU7i1QyX_BTldVJZgP_Yb-lgzTmpPxni_1YCQmhyGmi_ahjHbG5aCNtUngw35g0M=@protonmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear all,

On a custom board I have a simple DPI panel. Panel's backlight is drive with an I2C led driver (PCA9632). led-backlight driver is sued to manage this as a backlight.

When using brightness-levels and default-brightness-level the backlight stay turned-off even if manually trying to set a different index value to brightness through sysfs.

I traced this issue as follow: When led_bl_update_status() is called the brightness value is returned from backlight_get_brightness() which call backlight_is_blank(). In my case backlight_is_blank() return true due to props.power = FB_BLANK_POWERDOWN which is != FB_BLANK_UNBLANK.

I traced why at startup props.power is FB_BLANK_POWERDOWN and found that in led_bl_probe() when a default brightness is set (>0) props.power is set to FB_BLANK_POWERDOWN which seems incorrect to me.

I made the small change below and default brightness is correctly used at startup.
I am not really sure this is an issue and if my change is correct or if I am doing something incorrect somewhere else. So I first would like to get your opinion on this and if correct will send a patch.

Many thanks in advance
Patrick


diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -200,7 +200,7 @@ static int led_bl_probe(struct platform_device *pdev)
        props.type = BACKLIGHT_RAW;
        props.max_brightness = priv->max_brightness;
        props.brightness = priv->default_brightness;
-       props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
+       props.power = (priv->default_brightness == 0) ? FB_BLANK_POWERDOWN :
                      FB_BLANK_UNBLANK;
        priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
                        &pdev->dev, priv, &led_bl_ops, &props);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
