Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8936DF317
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3E10E774;
	Wed, 12 Apr 2023 11:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AB310E774
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681298562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RU2igHCjVcnp40gn9ktCo/+j2WwhkOyeeWPcVnAXlR4=;
 b=jHAXbrZvY0WBOr3DzbygZz3bFXxQMCS76Ntg2gIJNEtYf5f+ehcYVIRFL6K/EHq/dmPrOj
 egJXA4ojMnrjngcqtqJLDXpLjIxPx756l93qL7pRkHq5FNTYFzSGbWcF7+glkTDqTn1yyI
 nzEaeyFab8S1RkkJxwEemEBpLkqIKiM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-J07uwuEnOf-5V_dlvRrH4A-1; Wed, 12 Apr 2023 07:22:41 -0400
X-MC-Unique: J07uwuEnOf-5V_dlvRrH4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 h15-20020a05600c350f00b003f09815147dso1209344wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 04:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298559; x=1683890559;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RU2igHCjVcnp40gn9ktCo/+j2WwhkOyeeWPcVnAXlR4=;
 b=UulJ5xLzJliNR2uof20ZrGkVkLUbUBcgoTUWolU/HZc7LWh+Di/KjRapInmityOWD/
 pHw7NqFy44Plql1k/IxjONlxszTrutdjJ569hkOwqfcEv5HyHwWmYPy5UNt+1XI5PZnW
 H7I2I2Gk0gNoJSPkVBZHv7KWiXKmDJwAjLXCXLvP7pvyOPVM0Ssh2R9YR+zn8ozWJZ6+
 amAYuHWjo/yyS72a0lQSWxykYztqU0N1jZiYvOfHWIoVuKJGIezYoexIxzdXXxSkYygk
 d6IJkGVHiHouFQESqw9wHLfJTCFeahhDXiZQ1x0ra7f+AFIeEpelmZa38JGdt+dT6hjg
 4PyA==
X-Gm-Message-State: AAQBX9eNt4Cp1RxDUV9kR/8JeIA7+/a5hc/L+n2tya+agRFbzeX1Hd4F
 Bgt2qaGtfY+ENLHKtUmraioJE+OSoX/qbN3lBaQ4VtsNaXV3zC674RiSDReGTm6uo3Cbb0+jLqH
 wOCbg5xfg8uUIGv3e+4CFOJNxC8Io
X-Received: by 2002:a5d:688b:0:b0:2ef:ba74:44d0 with SMTP id
 h11-20020a5d688b000000b002efba7444d0mr4678819wru.23.1681298559140; 
 Wed, 12 Apr 2023 04:22:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350aHY5WOl500qZV473myVvizDChWrNr10FHZvHuqlt3+jhEvYKw5rvgWaMuzeEZaD5PnsMJI7w==
X-Received: by 2002:a5d:688b:0:b0:2ef:ba74:44d0 with SMTP id
 h11-20020a5d688b000000b002efba7444d0mr4678798wru.23.1681298558781; 
 Wed, 12 Apr 2023 04:22:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5084000000b002f4c2ea66absm958449wrt.85.2023.04.12.04.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:22:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
In-Reply-To: <dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
 <2ca4fbdb87a335522c22551658576e55.squirrel@mail.panix.com>
 <87zg7es99j.fsf@minerva.mail-host-address-is-not-set>
 <dfb4f25ca8dfb0d81d778d6315f104ad.squirrel@mail.panix.com>
Date: Wed, 12 Apr 2023 13:22:37 +0200
Message-ID: <87sfd5s5tu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Pierre Asselin <pa@panix.com>, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

>> Can you please share you grub config file? It seems that is set to
>> GRUB_GFXMODE=1024x768x32 but the actual mode is set to 1024x768x24 ?
>
> Okay, but you'll be sorry...  The gfxmode is set to "keep" in all the
> entries.  https://www.panix.com/~pa/linux-6.3-simplefb/grub.cfg .
>
> The "TEST" entry was used to bisect.  The "PRE-TEST" was to set things
> up, to receive the bzImages compiled on a faster machine. Now I boot
> the "Linux 6.3.0-rc5-x86".
>
>
>> That is, it fails when the picked format is DRM_FORMAT_RGB8888 but
>> works when is DRM_FORMAT_XRGB888. I can't spot any error in Thomas'
>> patch so I wonder if the problem is with what grub is passing to the
>> kernel.
>>
>> The mentioned vga=0x318 workaround that you mentioned makes the mode
>> passed to match the selected DRM_FORMAT_RGB888 which I guess is why
>> that worked for you.
>
> All right, I did a series of reboots, editing the grub command line
> to change the "gfxpayload=" grub option or the "vga=" kernel option.
> In each case I captured the output of
>   "dmesg | egrep -i 'fbcon|console|fb0|frameb|simple|vga|vesa'
>
> https://www.panix.com/~pa/linux-6.3-simplefb/selected-modes
>
> (D'oh.  My script printed "vga=vga=" twice when that option was set.
> Good enough as is.)
>
> Note the difference in linelength= between the bad and good r8g8b8.
> Does it mean anything ?
>  (bad)> format=r8g8b8, mode=1024x768x24, linelength=4096
> (good)> format=r8g8b8, mode=1024x768x24, linelength=3072
>

Ah! That's a good data point and I believe that found a possible issue in
the sysfb format selection logic. Can you please try the following patch?

From 55b5375c528b4128350dfa2126277049f8821349 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 12 Apr 2023 13:20:48 +0200
Subject: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated

The commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
fixed format selection by calculating the bits-per-pixel instead of just
using the reported color depth.

But unfortunately this broke some modes because the stride is always set
to the reported line length (in bytes), which could not match the actual
stride if the calculated bits-per-pixel doesn't match the reported depth.

Fixes: commit f35cd3fa7729 ("firmware/sysfb: Fix EFI/VESA format selection")
Reported-by: Pierre Asselin <pa@panix.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb_simplefb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 82c64cb9f531..5dc23e57089f 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -28,7 +28,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 			     struct simplefb_platform_data *mode)
 {
 	__u8 type;
-	u32 bits_per_pixel;
+	u32 bits_per_pixel, stride;
 	unsigned int i;
 
 	type = si->orig_video_isVGA;
@@ -54,14 +54,19 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 	 * bits_per_pixel here and ignore lfb_depth. In the loop below,
 	 * ignore simplefb formats with alpha bits, as EFI and VESA
 	 * don't specify alpha channels.
+	 *
+	 * If a calculated bits_per_pixel is used instead of lfb_depth,
+	 * then also ignore lfb_linelength and calculate the stride.
 	 */
 	if (si->lfb_depth > 8) {
 		bits_per_pixel = max(max3(si->red_size + si->red_pos,
 					  si->green_size + si->green_pos,
 					  si->blue_size + si->blue_pos),
 				     si->rsvd_size + si->rsvd_pos);
+		stride = DIV_ROUND_UP(si->lfb_width * bits_per_pixel, 8);
 	} else {
 		bits_per_pixel = si->lfb_depth;
+		stride = si->lfb_linelength;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
@@ -80,7 +85,7 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 			mode->format = f->name;
 			mode->width = si->lfb_width;
 			mode->height = si->lfb_height;
-			mode->stride = si->lfb_linelength;
+			mode->stride = stride;
 			return true;
 		}
 	}

base-commit: fd35174e13f98f9232c4aa66689816731d34ca28
-- 

Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

