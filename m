Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EDF75810D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322E110E369;
	Tue, 18 Jul 2023 15:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3511210E369
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:36:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 670A08469C;
 Tue, 18 Jul 2023 17:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689694596;
 bh=3c3Luzykhv72IMNKX51nrm3jqnd46oRd0GEXQQA8s9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RqqRTZ0fs2EsilUL10vHXSPwTvrgwwf2UMW8lly3+tcrBUhc7Zq8/8UWNkG+pnqRS
 zO6cl9rrlRE9ViZgupZkSn+2evtHj42O+4xzxZXDa1j+pAqs7kgVjhaQxjjSIIGQfH
 ojSn69OWrJi9hy79LumJTzSVcuacBBIcgESusMjyuJphZ4B3wlVGaQergBvvsPDZqD
 xtOZ2tZ+877skKkwY+UuC2xYWDUNjekog3i5HQ4r/dgydMB34Tiaay3trcufiaYGFH
 5LeN5VND+tCOvBVqGWOHW+G7c8ARl2CIe70aYLLakUzr+9WjHD8bo1CiO3w6gVpia9
 CK8qhl/tGDKKA==
Message-ID: <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
Date: Tue, 18 Jul 2023 17:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 16:17, Doug Anderson wrote:
> Hi,

Hi,

> On Sun, Jul 9, 2023 at 6:52 AM Marek Vasut <marex@denx.de> wrote:
>>
>> The unprepared_time has to be initialized during probe to probe time
>> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
>> wait too short time, or no time at all, which would violate the panel
>> timing specification. Initializing the unprepared_time() to probe time
>> ktime assures the delay is at least what the panel requires from the
>> time kernel started. The unprepared_time is then updated every time
>> the panel is suspended in panel_simple_suspend() too.
>>
>> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next prepare to shorten it")
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Can you talk in more detail about the problem you're seeing? Your
> patch will likely cause boot speed regressions. While correctness
> trumps performance, I'd like to make sure this is right before landing
> it.

With AUO T215HVN01 panel, connected to LT9211 DSI-to-LVDS bridge, 
connected to MX8M Mini DSIM , the panel just would not come up correctly 
because this unprepare_time is not observed. The panel would only show 
blue stripe on the left side, instead of actual image.

> Specifically, I think your patch is nearly the opposite as what I did
> in commit 691c1fcda535 ("regulator: core: Shorten off-on-delay-us for
> always-on/boot-on by time since booted"). I think many of the same
> arguments I made in that commit message argue against your patch.

You cannot guarantee in which state the panel is after boot/reboot , so 
I believe the kernel has to shut it down, and then bring it up, with the 
correct timings.

> ...however, I guess in the case of the panel, things could be
> different because regulators aren't directly controlled by the panel
> code. Thus, I could imagine that your situation is this:
> 
> 1. Bootloader runs and leaves the panel powered on.

Bootloader does not touch the panel at all.

> 2. Linux boots. Time starts at 0.
> 
> 3. Simple fixed regulator (GPIO-based) probes and doesn't know GPIO
> state of regulator, so turns it off. We'll call this time "a"
> 
> 4. Panel probes at time "b" and tries to turn the panel on.
> 
> With the existing code, when we try to turn the panel code on for the
> first time we'll wait "min(unprepared_time, b)". In other words, if
> the panel's probe was called so early at boot that it was shorter than
> unprepared_time then we'd delay. Otherwise we wouldn't. In the case
> described above, this is obviously a violation.
> 
> The more correct delay would be to wait "min(unprepared_time, b-a)".
> In other words, make sure the regulator is off for a certain amount of
> time.
> 
> Your patch would make us always wait "unprepared_time", which is still
> correct but less performant.
> 
> Did I describe your situation correctly?

Partly.

I believe the better approach would be to fix this such that we do not 
operate panels out of specification right now, since panel vendors are 
very sensitive about that, and any sort of optimization is a topic for 
separate patch.

But please do keep in mind that depending on the state of the system in 
which bootloader left it is likely a bad idea.

> If so, then IMO a more
> correct fix than this is actually:
> 
> a) Don't rely on the panel code to enforce your regulator constraints.
> It's OK for the panel code to have this logic as a failsafe, but it's
> actually better to specify "off-on-delay-us" for the regulator itself.
> This means that the regulator framework can handle things correctly.
> It'll work better for deferred probes and shared regulator rails,
> among other things. Note that "off-on-delay-us" is currently only
> implemented for fixed regulators, but IMO it would be an easy sell to
> make it generic.
> 
> b) Assuming your panel is OK with it, consider using
> "regulator-boot-on" to optimize your boot speed.

This is dangerous, since the panel has power sequencing requirements 
which must be observed, i.e. which supplies get flipped on in specific 
order with various delays between each step. That very much rules out 
any such regulator-boot-on shenanigans.

> ...one further note is that, I believe, not all regulator drivers will
> force regulators off at probe time. If your regulator is backed by a
> PMIC instead of a simple fixed regulator and the bootloader left the
> regulator on then I believe you could end up with a situation very
> similar to the "regulator-boot-on" case.


