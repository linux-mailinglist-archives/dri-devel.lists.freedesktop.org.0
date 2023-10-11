Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2B7C5896
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 17:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3410E524;
	Wed, 11 Oct 2023 15:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E8F10E524
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 15:53:10 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d81adf0d57fso7393221276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1697039589; x=1697644389;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5Z7mQ+QbmUIH9KjgZaaXWrOdqSmHBPTXSG7WmlpxIok=;
 b=iOgnuV5LTcOy2Bhd7cwZfK8lNn/NcGhqaUO0p09DIS1Sqs8pwL1xov+JIO2dDeC5L6
 7gyr1AuflWD5C+Qu/bSPEA+C/wlqlULD31TMOTRbVkCfr8qIe7VKIR3J2JPGo7xAcqIR
 N6HOevK31CBhoul2VsYY6nPwucyu0x7/B2JLPPVrUM0737veW/JI4VUA16NJwRchkReg
 70BuH6qXyXNSyMR7lNJK3BFLjKU0xw8NKPif6r9L43uwRb4aJxi2NMcaeybdmWQzRIyl
 d6z4TLlnNmiFC5WlWqhQQl62pBwgu7bXZkXxqUqWzYQqrh8Q2aM7scLXlAzTo5CWuXBo
 ekuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697039589; x=1697644389;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Z7mQ+QbmUIH9KjgZaaXWrOdqSmHBPTXSG7WmlpxIok=;
 b=gp9djPfwn6VXtyy2gEAa+dG62exTbQSTzrEN+xT08RmOws0yvy0XNyqKMntcbQZnnN
 Fj2CtYrU5qX2Q1FqHpA/4oPBT/kUiNY3N6GGK2rIqfJngz+INCGEaPtbkd9d+FcKxzPC
 irnGkolN4tsYZnj3UE5Cv5JXmeuSXxZ0HieUDX9cB9AJvi/uePp5MHACU6wgI93XTQAT
 VP5UhNjWWPEBUBR+ujuC7kDhyEfst5YFMSBXZxq2Al6g+6E5LNYxQfuViU9zAr3fPeZx
 1iZju1S+74sI8WAExpKBV9acjAlwY+RY6fRisaT/KDxIxWTXX0GTNBN/L5ooTEcc9hqJ
 hrrw==
X-Gm-Message-State: AOJu0Yxd83JVBwcE9QFxSQSrfSsVcRB6XsMWhuYVTptGjRZxmQiJEeoe
 d600eWP4pUiyN2aPaVSnoFI8NoaEezgGxZy1uFD18W3jCSMe6uW5rSM=
X-Google-Smtp-Source: AGHT+IElYG+mJU/htqvUQmWYhYn3tolcqgKl/ZbZcSsW3qJnt/957epa8ijqJyuHxQrGdj11KEESOptrT7nilWvji9Y=
X-Received: by 2002:a25:1941:0:b0:d85:4c83:5d81 with SMTP id
 62-20020a251941000000b00d854c835d81mr20482922ybz.48.1697039589754; Wed, 11
 Oct 2023 08:53:09 -0700 (PDT)
MIME-Version: 1.0
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Oct 2023 16:52:53 +0100
Message-ID: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>
Subject: DRM FB emulation initialisation leaving the display disabled
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas (and everyone else)

Maxime has suggested you're the person for DRM framebuffer emulation.

I'm getting some unexpected behaviour when there are multiple DRM
drivers in play. In this case it happens to be vc4 and the tiny
hx8357d SPI display driver, but this affects most of the tiny DRM
drivers and also the DSI and DPI outputs on the Pi5.
We get different behaviour depending on whether vc4 or hx8357d
initialises first.

If hx8357d loads first and registers as /dev/fb0 through the fb
emulation, then we get fbcon enabling the display and putting the
emulated framebuffer on it. vc4 then loads, registers /dev/fb1, and
through the hotplug handler it enables the display
(drm_fb_helper_hotplug_event calls, drm_fb_helper_set_par, which calls
__drm_fb_helper_restore_fbdev_mode_unlocked).

If vc4 loads first and claims /dev/fb0, fbcon initalises and enables
the display. hx8357d then loads and registers as /dev/fb1. fbcon is
not configured for that fb, and there is no subsequent hotplug event
(SPI displays aren't hotpluggable), so we have a fully configured
framebuffer exposed to userspace but the display itself isn't enabled
so we don't see anything :-(
Open and close /dev/dri/card1 and the lastclose hook calls
drm_fb_helper_restore_fbdev_mode_unlocked and we get the display
enabled.

Is it intentional that we're left in this limbo state with the display
not enabled if fbcon isn't enabled on a framebuffer?

We're trying to get people to transition from the fbdev drivers to DRM
equivalents, but this seems to be a backwards step if there is an
extra step required to get the display enabled. Many users are still
just using the framebuffer.

Any input is much appreciated.

Thanks,
  Dave
