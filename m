Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13AE92F06D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 22:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7717710E7D1;
	Thu, 11 Jul 2024 20:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=schmorgal.com header.i=@schmorgal.com header.b="CLVIkn17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3610E7D1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 20:37:18 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fb0c2c672dso930875ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google; t=1720730238; x=1721335038;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQm2wVcFVV2Ej/3DCwFpioRvEPP+XotE4XPlIbOYt9I=;
 b=CLVIkn17e421/sVHYNwW17isdmT0Ybz+r2kYZutWswohifAorbE1WFmHvH+bngemrv
 icH4STXd/zzJBhqXs3l99RTEmDoDDAZ8TwrRt5TefOdVpjCROUXDvPWfsYfVei9iqy0x
 ZTJ9vc6ZEemKeFo4PdA89iHroJVh8KI5F0kDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720730238; x=1721335038;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PQm2wVcFVV2Ej/3DCwFpioRvEPP+XotE4XPlIbOYt9I=;
 b=t9ag1XVY+187HCTtL1q/hjuSBDUMrcCIfTnEj0X/I5nL9A59p3t0/pS7ra1A3cbY24
 ViN8kGyPVmoKz9tp88uv2a7EzzL1LvgicjoCiizx/ePS86bWGgs7ZFU1HkZL2VaoixGg
 iWcQY3Ea0CH5cyTBlxkfAglGkPgnLld77gbBEgEKuOLY/YNtaYw7OBiY1VmvpVRCjrNc
 97Aw/ANxb+LWxy8ei51yDolMHx8NnWUNzIWC0PXKk5lQba2JQC+zC1OVDmcpwqJvkweU
 ltDi9byxfFbfEx99ZGrgnrIgCMne3hR9jNKWI88WsB0IVdxY7KmfbxvJcl8g12IjxgWc
 B9pA==
X-Gm-Message-State: AOJu0YwruyOTNPgUXCp2SLmBWYVMgB532b6irHYjipdPh8oB2iMNYqRi
 WrfiCrpNyR0pz3O4A9Bwt120kPEZC9Quh3JB9PNO5hi+z3jEuP0cKV6S8QIyrrE=
X-Google-Smtp-Source: AGHT+IFxDT1MFtFyDgFQOw+HdKxecmIIfRF0jLmAo+tw80ob7sxgjLLFO1MjXqjSb7A2ok1PhNUK1w==
X-Received: by 2002:a17:902:e546:b0:1fa:ab4a:fb02 with SMTP id
 d9443c01a7336-1fbdc389e10mr36455985ad.0.1720730238082; 
 Thu, 11 Jul 2024 13:37:18 -0700 (PDT)
Received: from [192.168.1.33] ([50.120.71.169])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1fbb6a12cdbsm54481135ad.48.2024.07.11.13.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 13:37:17 -0700 (PDT)
Message-ID: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
Date: Thu, 11 Jul 2024 13:37:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Doug Brown <doug@schmorgal.com>
Subject: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I have discovered a problem in vmwgfx that caused Xv playback to break
between v6.3 and v6.4-rc1. In v6.3, inside of an Ubuntu 24.04 VMware VM
with 3D acceleration disabled, I can run the following GStreamer command
("sudo apt install gstreamer1.0-tools" if you don't already have it):

gst-launch-1.0 videotestsrc ! 
video/x-raw,format=YV12,width=640,height=480 ! xvimagesink

And it works fine, showing a test pattern.

In v6.4-rc1 and all the way up to a build I just made today of Linus's
latest master branch and also including Zack's latest patchset [1]:

Linux doug-Ubuntu-MATE-2404 6.10.0-rc7+ #55 SMP PREEMPT_DYNAMIC Thu Jul
11 12:46:06 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux

...if I run the same command, the GStreamer window shows up containing
solid green rather than the test pattern.

I believe I have bisected the problem to commit:

39985eea5a6d ("drm/vmwgfx: Abstract placement selection")

However, the bisect process was complicated because two earlier commits
temporarily broke vmwgfx so I had to undo them during bisection, which
also required some conflict resolution:

180253782038 ("drm/ttm: stop allocating dummy resources during BO 
creation") and
f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")

Note that if you have gstreamer1.0-vaapi installed, you should
temporarily remove it first before testing because there is a separate
Xorg bug that causes Xorg to crash when you run the above command if
gstreamer1.0-vaapi is installed.

I'm happy to do any further testing as needed. I've reproduced this
problem across several different machines and distros. A fully-updated
Arch Linux is also affected.

As a side note, that same gst-launch-1.0 command is also currently
broken with 3D acceleration enabled, but that's a separate issue in mesa
that I've submitted a patch for [2].

Thanks,
Doug

[1] 
https://lore.kernel.org/all/20240702021254.1610188-1-zack.rusin@broadcom.com/#t
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30116

#regzbot introduced: v6.3..v6.4-rc1
