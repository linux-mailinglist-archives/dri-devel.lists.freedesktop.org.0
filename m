Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97C77879F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 08:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6D510E667;
	Fri, 11 Aug 2023 06:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1512710E665
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 06:45:27 +0000 (UTC)
Received: from 46.183.103.8.relaix.net ([46.183.103.8] helo=[172.18.99.178]);
 authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qULtd-0001jS-CA; Fri, 11 Aug 2023 08:45:17 +0200
Message-ID: <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
Date: Fri, 11 Aug 2023 08:45:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
Content-Language: en-US, de-DE
To: Mikhail Rudenko <mike.rudenko@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <87v8dmr6ty.fsf@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <87v8dmr6ty.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1691736327;
 8a6f12a0; 
X-HE-SMSGID: 1qULtd-0001jS-CA
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 regressions@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[CCing the i915 maintainers and the dri maintainers]

Hi, Thorsten here, the Linux kernel's regression tracker.

On 10.08.23 21:33, Mikhail Rudenko wrote:
> The following is a copy an issue I posted to drm/i915 gitlab [1] two
> months ago. I repost it to the mailing lists in hope that it will help
> the right people pay attention to it.

Thx for your report. Wonder why Dmitry (who authored a4e771729a51) or
Thomas (who committed it) it didn't look into this, but maybe the i915
devs didn't forward the report to them.

Let's see if these mails help. Just wondering: does reverting
a4e771729a51 from 6.5-rc5 or drm-tip help as well?

BTW, there was an earlier report about a problem with a4e771729a51 that
afaics was never addressed, but it might be unrelated.

https://lore.kernel.org/all/20230328023129.3596968-1-zhouzongmin@kylinos.cn/

Ciao, Thorsten

> After kernel upgrade from 6.2.13 to 6.3 HDMI connector detection is
> broken for me. Issue is 100% reproducible:
> 
> 1. Start system as usual with HDMI connected.
> 2. Disconnect HDMI
> 3. Connect HDMI back
> 4. Get "no signal" on display, connector status in sysfs is disconnected
> 
> Curiously, running xrandr over ssh like
> 
>     ssh qnap251.local env DISPLAY=:0 xrandr
> 
> makes display come back. drm-tip tip is affected as well (last test
> 2023-08-02).
> 
> Bisecting points at a4e771729a51 ("drm/probe_helper: sort out poll_running vs poll_enabled").
> Reverting that commit on top of 6.3 fixes the issue for me.
> 
> System information:
> * System architecture: x86_64
> * Kernel version: 6.3.arch1
> * Linux distribution: Arch Linux
> * Machine: QNAP TS-251A, CPU: Intel(R) Celeron(R) CPU N3060 @ 1.60GHz
> * Display connector: single HDMI display
> * dmesg with debug information (captured on drm-tip, following above 4 steps): [2]
> * xrandr output:
> 
>     Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
>     DP-1 disconnected (normal left inverted right x axis y axis)
>     HDMI-1 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 708mm x 398mm
>        1920x1080     60.00*+  50.00    59.94    30.00    25.00    24.00    29.97    23.98
>        1920x1080i    60.00    50.00    59.94
>        1360x768      59.80
>        1280x768      60.35
>        1280x720      60.00    50.00    59.94
>        1024x768      75.03    70.07    60.00
>        832x624       74.55
>        800x600       75.00    60.32
>        720x576       50.00
>        720x480       60.00    59.94
>        640x480       75.00    60.00    59.94
>        720x400       70.08
>     DP-2 disconnected (normal left inverted right x axis y axis)
>     HDMI-2 disconnected (normal left inverted right x axis y axis)```
> 
> I'm willing to provide additional information and/or test fixes.
> 
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/8451
> [2] https://gitlab.freedesktop.org/drm/intel/uploads/fda7aff0b13ef20962856c2c7be51544/dmesg.txt
> 
> #regzbot introduced: a4e771729a51
> 
> --
> Best regards,
> Mikhail Rudenko
