Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1F74CFE4
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987D810E141;
	Mon, 10 Jul 2023 08:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0179210E141
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:26:37 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1qImE2-0006H7-Ei; Mon, 10 Jul 2023 10:26:30 +0200
Message-ID: <97f15a3a-9a35-7f02-25fb-53a32def3193@leemhuis.info>
Date: Mon, 10 Jul 2023 10:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/ast: report connection status on Display Port.
Content-Language: en-US, de-DE
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 tzimmermann@suse.de, airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com, jani.nikula@linux.intel.com
References: <20230706100102.563458-1-jfalempe@redhat.com>
 <62460153-04b1-b1aa-7966-45be16f3ec43@leemhuis.info>
 <d4ca4cab-fed3-0b3e-5563-800bed43e5b2@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <d4ca4cab-fed3-0b3e-5563-800bed43e5b2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1688977598;
 9260f2cf; 
X-HE-SMSGID: 1qImE2-0006H7-Ei
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.07.23 10:12, Jocelyn Falempe wrote:
> On 06/07/2023 15:03, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 06.07.23 11:58, Jocelyn Falempe wrote:
>>> Aspeed always report the display port as "connected", because it
>>> doesn't set a .detect callback.
>>> Fix this by providing the proper detect callback for astdp and dp501.
>>>
>>> This also fixes the following regression:
>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>>   EDID on DP")
>>> The default resolution is now 640x480 when no monitor is connected.
>>> But Aspeed graphics is mostly used in servers, where no monitor
>>> is attached. This also affects the remote BMC resolution to 640x480,
>>> which is inconvenient, and breaks the anaconda installer.
>>>
>>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> So if this "also fixes a regression" how about a Fixes: tag and a CC:
>> <stable tag to ensure this is not only fixed in latest mainline, but
>> also in all affected stable and longterm kernels?
> 
> In this case, the regression only affect one userspace program
> (anaconda),

That is (mostly) irrelevant when it comes to regressions.

> and the fix looks too risky to backport to all stable kernels.

Not sure, but I tend to thing that decision would better be left to the
stable team. Each developer will have a different opinion about what's
too risky or not and they might be in the better position to judge what
they want for their trees. A "Fixes:" tag thus still seems appropriate
here; will also tell downstream distros that might want to pick this up.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
