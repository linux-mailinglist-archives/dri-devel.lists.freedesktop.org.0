Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CFA4BD78C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0979410E831;
	Mon, 21 Feb 2022 08:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510C610E380;
 Sun, 20 Feb 2022 15:48:58 +0000 (UTC)
Received: from ylum.localnet (unknown
 [IPv6:2a01:e0a:3d9:ddd0:37f3:7f74:639b:b0a3])
 (Authenticated sender: domi.dumont@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4BF65B004EE;
 Sun, 20 Feb 2022 16:48:43 +0100 (CET)
From: Dominique Dumont <dod@debian.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend?
Date: Sun, 20 Feb 2022 16:48:43 +0100
Message-ID: <5164225.DI6hChFYCN@ylum>
In-Reply-To: <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Mon, 21 Feb 2022 08:29:10 +0000
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
Reply-To: dod@debian.org
Cc: Sasha Levin <sashal@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, 1005005@bugs.debian.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, 14 February 2022 22:52:27 CET Alex Deucher wrote:
> Does the system actually suspend?  

Not really. The screens looks like it's going to suspend, but it does come 
back after 10s or so. The light mounted in the middle of the power button does 
not switch off.

> Is this system S0i3 or regular S3?

I'm not sure how to check that. After a bit of reading on the Internet [1], I 
hope that the following information answers that question. Please get back to 
me if that's not the case.

Looks like my system supports both Soi3 and S3

$ cat /sys/power/state 
freeze mem disk

I get the same result running these 2 commands as root:
# echo freeze > /sys/power/state
# echo mem > /sys/power/state

>  Does this patch help by any chance?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?i
> d=e55a3aea418269266d84f426b3bd70794d3389c8

yes, with this patch:
- the suspend issue is solved
- kernel logs no longer show messages like "failed to send message" or 
"*ERROR* suspend of IP block <powerplay> failed" while suspending

All the best

[1] https://01.org/blogs/rzhang/2015/best-practice-debug-linux-suspend/
hibernate-issues


