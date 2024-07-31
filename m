Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47694942700
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 08:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBA910E252;
	Wed, 31 Jul 2024 06:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="jqhe/tyJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC6010E252;
 Wed, 31 Jul 2024 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=P1V0z9JyXNMjXUrrv9MyjJnAXiVD3xEEot8JcZbXg2w=;
 t=1722407884; x=1722839884; b=jqhe/tyJToFnr96kQpiEys0KNdmNcFU4Z90ED1uEQd9JMWL
 /FXC8FdXHRzr/8rJDp36xSt5xMovzhvlWbw1wezHKvMHSarG+mK7d5WNqGhBiVniC9CzcmdCJM0p/
 6Z40Vq4u8Jzw5lEU15fyX4zF8J4JpPaGqzf35yGZpiRAGjG7hI314ZP5zSBRGJ1nvuLgezu2x9sJI
 4EsnEpDX+bjjEIQnjglYqxsDKcagg4h0ImGX0O+RQQy3xP1gnWfe6xOzciuzUu7tzjfumXOTbzgBs
 cIyFkty60oXIbA410jW/TDzJ0TfgT6gc9r6CeTlXTl8ZMtCn7gBzDEvI8lJqZABQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1sZ2yH-00070r-AD; Wed, 31 Jul 2024 08:38:01 +0200
Message-ID: <245f2c54-6d06-4b71-a9f8-a6fc0dbcceb3@leemhuis.info>
Date: Wed, 31 Jul 2024 08:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Brightness at max level after waking up from sleep
 on AMD Laptop
To: hamza.mahfooz@amd.com
Cc: regressions@lists.linux.dev, alexander.deucher@amd.com,
 serg.partizan@gmail.com,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 mario.limonciello@amd.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <77KAHS.13UUH2XVHQQF1@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <77KAHS.13UUH2XVHQQF1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1722407884;
 56903427; 
X-HE-SMSGID: 1sZ2yH-00070r-AD
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+amd-glx, +lkml, +dri-devel]

On 27.07.24 18:52, serg.partizan@gmail.com wrote:
> 
> After updating from 6.8.9 to 6.9.1 I noticed a bug on my HP Envy x360
> with AMD Ryzen 5 4500U.
>
> [...]
> After waking up from sleep brightness is set to max level, ignoring
> previous value.
> 
> With the help of Arch Linux team, we was able to track bad commit to
> this:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5

Hamza Mahfooz, in case you missed it, that is a patch of yours:
63d0b87213a0ba ("drm/amd/display: add panel_power_savings sysfs entry to
eDP connectors") [v6.9-rc1].

> I have tested this on latest mainline kernel:
> 
> Results after waking up:
> 
>> cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
> 12
> 252
> 
> Then, on exact this commit (63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5),
> result is the same.
> 
> Then, on commit just before this one (aeaf3e6cf842):
> 
>> cat /sys/class/backlight/amdgpu_bl1/{brightness,actual_brightness}
> 12
> 12
> 
> I hope I included all relevant information, more info can be found here:
> 
> https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/issues/52

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S.:

#regzbot introduced: 63d0b87213a0ba241
