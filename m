Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EB806B1E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96A210E0C4;
	Wed,  6 Dec 2023 09:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF9310E09B;
 Wed,  6 Dec 2023 09:56:46 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rAoe1-0001Jn-NU; Wed, 06 Dec 2023 10:56:41 +0100
Message-ID: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
Date: Wed, 6 Dec 2023 10:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
Content-Language: en-US, de-DE
To: Gerd Hoffmann <kraxel@redhat.com>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home>
 <ZTgydqRlK6WX_b29@eldamar.lan>
 <alpine.DEB.2.20.2310250027230.28685@mail.home>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <alpine.DEB.2.20.2310250027230.28685@mail.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1701856606;
 9c73d8ce; 
X-HE-SMSGID: 1rAoe1-0001Jn-NU
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
Cc: Timo Lindfors <timo.lindfors@iki.fi>, regressions@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, 1054514@bugs.debian.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Gerd, it seems this regression[1] fell through the cracks. Could you
please take a look? Or is there a good reason why this can't be
addressed? Or was it dealt with and I just missed it?

[1] apparently caused by 5a838e5d5825c8 ("drm/qxl: simplify
qxl_fence_wait") [v5.13-rc1] from Gerd; for details see
https://lore.kernel.org/regressions/ZTgydqRlK6WX_b29@eldamar.lan/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 24.10.23 23:39, Timo Lindfors wrote:
> Hi,
> 
> On Tue, 24 Oct 2023, Salvatore Bonaccorso wrote:
>> Thanks for the excelent constructed report! I think it's best to
>> forward this directly to upstream including the people for the
>> bisected commit to get some idea.
> 
> Thanks for the quick reply!
> 
>> Can you reproduce the issue with 6.5.8-1 in unstable as well?
> 
> Unfortunately yes:
> 
> ansible@target:~$ uname -r
> 6.5.0-3-amd64
> ansible@target:~$ time sudo ./reproduce.bash
> Wed 25 Oct 2023 12:27:00 AM EEST starting round 1
> Wed 25 Oct 2023 12:27:24 AM EEST starting round 2
> Wed 25 Oct 2023 12:27:48 AM EEST starting round 3
> bug was reproduced after 3 tries
> 
> real    0m48.838s
> user    0m1.115s
> sys     0m45.530s
> 
> I also tested upstream tag v6.6-rc6:
> 
> ...
> + detected_version=6.6.0-rc6
> + '[' 6.6.0-rc6 '!=' 6.6.0-rc6 ']'
> + exec ssh target sudo ./reproduce.bash
> Wed 25 Oct 2023 12:37:16 AM EEST starting round 1
> Wed 25 Oct 2023 12:37:42 AM EEST starting round 2
> Wed 25 Oct 2023 12:38:10 AM EEST starting round 3
> Wed 25 Oct 2023 12:38:36 AM EEST starting round 4
> Wed 25 Oct 2023 12:39:01 AM EEST starting round 5
> Wed 25 Oct 2023 12:39:27 AM EEST starting round 6
> bug was reproduced after 6 tries
> 
> 
> For completeness, here is also the grub_set_default_version.bash script
> that I had to write to automate this (maybe these could be in debian
> wiki?):
> 
> #!/bin/bash
> set -x
> 
> version="$1"
> 
> idx=$(expr $(grep "menuentry " /boot/grub/grub.cfg | sed 1d |grep -n
> "'Debian GNU/Linux, with Linux $version'"|cut -d: -f1) - 1)
> exec sudo grub-set-default "1>$idx"
> 
> 
> 
> -Timo
> 
> 
> 
