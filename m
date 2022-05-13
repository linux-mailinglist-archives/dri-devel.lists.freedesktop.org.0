Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01F525D0F
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 10:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528EF10E2CA;
	Fri, 13 May 2022 08:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206B10E2CA;
 Fri, 13 May 2022 08:18:28 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1npQVG-0007GN-TF; Fri, 13 May 2022 10:18:27 +0200
Message-ID: <17cfc10c-1a51-b7b5-2510-160bc64d5e75@leemhuis.info>
Date: Fri, 13 May 2022 10:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com>
 <da66cb8e-62b7-4c48-1ed6-afe363b26d4f@leemhuis.info>
Subject: Re: [5.18 regression] drm/i915 BYT rendering broken due to "Remove
 short-term pins from execbuf, v6" #forregzbot
In-Reply-To: <da66cb8e-62b7-4c48-1ed6-afe363b26d4f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1652429908;
 8e10eb3f; 
X-HE-SMSGID: 1npQVG-0007GN-TF
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 09.05.22 09:01, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker. Top-posting for once,
> to make this easily accessible to everyone.
> 
> Thanks for the report.
> 
> To be sure below issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced b5cfe6f7a6e1
> #regzbot title drm/i915: BYT rendering broken due to "Remove short-term
> pins from execbuf, v6"
> #regzbot ignore-activity

#regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/5806
#regzbot monitor:
https://lore.kernel.org/all/20220511115219.46507-1-maarten.lankhorst@linux.intel.com/

> This isn't a regression? This issue or a fix for it are already
> discussed somewhere else? It was fixed already? You want to clarify when
> the regression started to happen? Or point out I got the title or
> something else totally wrong? Then just reply -- ideally with also
> telling regzbot about it, as explained here:
> https://linux-regtracking.leemhuis.info/tracked-regression/
> 
> Reminder for developers: When fixing the issue, add 'Link:' tags
> pointing to the report (the mail this one replied to), as the kernel's
> documentation call for; above page explains why this is important for
> tracked regressions.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 
> 
> 
> On 08.05.22 16:38, Hans de Goede wrote:
>> Hi All,
>>
>> When running a 5.18-rc4 (and -rc5) kernel on a Chuwi Hi 8, which is
>> a Bay Trail based tablet with 2G RAM and a 1200x1920 DSI panel.
>> I noticed that gnome-shell was misrendering. Many UI elements were
>> missing (they were all black) and at the gdm login screen (which is
>> a special gnome-shell session) the screen often was entirely black
>> until I move the cursor around and then various things got
>> highlighted after which they sometimes stuck around and sometimes
>> they disappeared again after the highlight.
>>
>> Since this problem does not happen with various 5.17.y kernels I
>> believe that this is a kernel regression in 5.18. I've bisected this
>> and the bisect points to:
>>
>> commit b5cfe6f7a6e1 ("drm/i915: Remove short-term pins from execbuf, v6.")
>>
>> from Maarten. This commit cleanly reverts on top of 5.18-rc5 and
>> I can confirm that 5.18-rc5 with b5cfe6f7a6e1 reverted fixes things.
>>
>> I would be more then happy to test any possible fixes for this.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
