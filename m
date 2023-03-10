Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F996B4345
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 15:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8E10E8C6;
	Fri, 10 Mar 2023 14:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
 by gabe.freedesktop.org (Postfix) with ESMTP id D454F10E8C6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 14:12:22 +0000 (UTC)
Received: from mail.rmail.be (domotica.rmail.be [10.238.9.4])
 by mail.rmail.be (Postfix) with ESMTP id E1EEA34957;
 Fri, 10 Mar 2023 15:12:21 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 10 Mar 2023 15:12:21 +0100
From: AL13N <alien@rmail.be>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [regression] RPI4B drm vc4: no crtc or sizes since 5.17 (works in
 5.16; and still broken in at least 6.1)
In-Reply-To: <CAPY8ntD_DV+LGii-WFs9_pjn5HK8safOw-Mvb5i2rD4MXcpVcw@mail.gmail.com>
References: <7d216faea9647d328651460167bc27f6@rmail.be>
 <f9499ac65afe3d23079c5bca5e3c40bd@rmail.be>
 <CAPY8ntAGvQdSVt7meb2ddz+UejxpKPvmAcgYUyPWR2+R3e=wRg@mail.gmail.com>
 <20230308123540.zqqe4mnhzumvnjfk@houat>
 <004db85e5114674bfc432043376bcd00@rmail.be>
 <4862350fa507612e03bb6a73977db178@rmail.be>
 <CAPY8ntB6WaCF4H2Bk7Zq9cCE-iR8fMFq-vDULH_rp_+O4xp+EA@mail.gmail.com>
 <2835cfc754ebc29561bcb053cadcd528@rmail.be>
 <993a86eaeab527f847f66d93ea514598@rmail.be>
 <CAPY8ntD_DV+LGii-WFs9_pjn5HK8safOw-Mvb5i2rD4MXcpVcw@mail.gmail.com>
Message-ID: <e1eff816804d3c0c51427b570b0d24ee@rmail.be>
X-Sender: alien@rmail.be
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave Stevenson schreef op 2023-03-10 14:10:
> On Fri, 10 Mar 2023 at 12:59, AL13N <alien@rmail.be> wrote:
>> 
>> 
>> I donno if this is related or not, but since 6.1 has v3d, i'm assuming
>> the opengl compositor will be faster and not draw too much cpu?
>> 
>> I did try youtube video, but that on 1080p fullscreen, takes all the 
>> CPU
>> and seems to have dropped frames still?
> 
> Does your browser actually use sensible EGL calls to pass dmabufs
> around the system? Chromium with Ozone sort of does, but that's about
> it.
> It's another thing that is implemented in Raspberry Pi OS.

I'm on KDE, disabled compositor, used firefox, used the h264fi plugin to 
force h264, set in about:config the layers.acceleration-force to true. I 
do notice v3d_bin and v3d_render being active, but definately the RDD 
process is using a lot of CPU, so likely no video decoding...

I don't have chromium on this aarch64, there seemed to be some issue 
compiling it, so distro set exclusivearch on... I'll try to rebuild 
this... Ozone, meaning the theme, because it uses EGL? maybe this means 
that on plasma, i should turn the opengl compositor back on, it may 
help(?)

>> does rpi4B actually have video decoding hardware?
> 
> I've already referred you to 
> https://github.com/lategoodbye/rpi-zero/issues/43
>> VCHIQ codecs - Unknown
> 
> It is present in our vendor kernel, but not upstreamed. You've chosen
> to run mainline.

Ah, this is the crucial piece it seems... i remember the cec-client also 
needing vchiq_arm (there was an url someplace where you could build 
this), i need to take a look at this.

>> and is this related to
>> drm? because netflix did not work at all, which requires drm, but is
>> this a different a different drm than this driver?
> 
> Digital Rights Management != Direct Rendering Manager.
> 
> Netflix on an unsecured platform will only work through something like
> Widevine for software decode.

I did find a widevine .so library built for aarch64 someplace, but that 
library alone doesn't seem to be enough, i need to find some widevine 
addon files, someplace? but widevine didn't seem to be available for 
aarch64, only armv7 ?

>   Dave

Thanks for clarifying all this! That makes everything a ton clearer...
