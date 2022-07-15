Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596D0575DEC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707F811AFF5;
	Fri, 15 Jul 2022 08:54:45 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
X-Greylist: delayed 1181 seconds by postgrey-1.36 at gabe;
 Fri, 15 Jul 2022 08:54:43 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9CD1125A5;
 Fri, 15 Jul 2022 08:54:43 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1oCGmq-0007yL-4o; Fri, 15 Jul 2022 10:35:00 +0200
Message-ID: <40101a14-ea44-1fd9-36ab-2048df2cb0e6@leemhuis.info>
Date: Fri, 15 Jul 2022 10:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/guc: Update to GuC version
 70.1.1 #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220412225955.1802543-1-John.C.Harrison@Intel.com>
 <20220412225955.1802543-2-John.C.Harrison@Intel.com>
 <Yli4/8OIbjyRaQAK@mdroper-desk1.amr.corp.intel.com>
 <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPM=9txdca1VnRpp-oNLXpBc2UWq3=ceeim5+Gw4N9tAriRY6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1657875283;
 6d4fc315; 
X-HE-SMSGID: 1oCGmq-0007yL-4o
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
Cc: Intel Graphics Development <Intel-GFX@lists.freedesktop.org>,
 dri-devel <DRI-Devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 15.07.22 01:08, Dave Airlie wrote:
> On Fri, 15 Apr 2022 at 10:15, Matt Roper <matthew.d.roper@intel.com> wrote:
>>
>> On Tue, Apr 12, 2022 at 03:59:55PM -0700, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> The latest GuC firmware drops the context descriptor pool in favour of
>>> passing all creation data in the create H2G. It also greatly simplifies
>>> the work queue and removes the process descriptor used for multi-LRC
>>> submission. So, remove all mention of LRC and process descriptors and
>>> update the registration code accordingly.
>>>
>>> Unfortunately, the new API also removes the ability to set default
>>> values for the scheduling policies at context registration time.
>>> Instead, a follow up H2G must be sent. The individual scheduling
>>> policy update H2G commands are also dropped in favour of a single KLV
>>> based H2G. So, change the update wrappers accordingly and call this
>>> during context registration..
>>>
>>> Of course, this second H2G per registration might fail due to being
>>> backed up. The registration code has a complicated state machine to
>>> cope with the actual registration call failing. However, if that works
>>> then there is no support for unwinding if a further call should fail.
>>> Unwinding would require sending a H2G to de-register - but that can't
>>> be done because the CTB is already backed up.
>>>
>>> So instead, add a new flag to say whether the context has a pending
>>> policy update. This is set if the policy H2G fails at registration
>>> time. The submission code checks for this flag and retries the policy
>>> update if set. If that call fails, the submission path early exists
>>> with a retry error. This is something that is already supported for
>>> other reasons.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Applied to drm-intel-gt-next.  Thanks for the patch and review.
>>
> 
> (cc'ing Linus and danvet, as a headsup, there is also a phoronix
> article where this was discovered).
> 
> Okay WTF.
> 
> This is in no way acceptable. This needs to be fixed in 5.19-rc ASAP.
> 
> Once hardware is released and we remove the gate flag by default, you
> cannot just bump firmware versions blindly.
> 
> The kernel needs to retain compatibility with all released firmwares
> since a device was declared supported.
> 
> This needs to be reverted, and then 70 should be introduced with a
> fallback to 69 versions.
> 
> Very disappointing, I expect this to get dealt with v.quickly.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 2584b3549f4c4081
#regzbot title
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
