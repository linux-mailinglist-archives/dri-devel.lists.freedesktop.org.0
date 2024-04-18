Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA808A9219
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 06:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B933E10E885;
	Thu, 18 Apr 2024 04:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wBVsrPCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6210E885;
 Thu, 18 Apr 2024 04:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BECE61628;
 Thu, 18 Apr 2024 04:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FC0C113CE;
 Thu, 18 Apr 2024 04:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713415081;
 bh=tyUM8/5jDpVuOaExwiWIFw4yv8/1WmmRGcRK4GbkFpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wBVsrPCtzCN68kCYngjtg26/Z3o6PyT/vuh6vvs6oB/Mwt43YIfGUAnKWXLwvIzW7
 JMVCgTd4H6qekrxckW0m3EJJvQvrIsjDFKW9/rhGdE0fxjDrOUoCxyLWKQmvhavOwl
 pBnBpULXRUTW966qORSWyuB5QtblFoqL2Sm9LPw0=
Date: Thu, 18 Apr 2024 06:37:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: wangzhu <wangzhu9@huawei.com>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "qingqing.zhuo@amd.com" <qingqing.zhuo@amd.com>,
 "stylon.wang@amd.com" <stylon.wang@amd.com>,
 "Josip.Pavic@amd.com" <Josip.Pavic@amd.com>,
 "trix@redhat.com" <trix@redhat.com>,
 "cruise.hung@amd.com" <cruise.hung@amd.com>,
 "Eric.Yang2@amd.com" <Eric.Yang2@amd.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "alvin.lee2@amd.com" <alvin.lee2@amd.com>,
 "jun.lei@amd.com" <jun.lei@amd.com>,
 "austin.zheng@amd.com" <austin.zheng@amd.com>,
 "sunglee@amd.com" <sunglee@amd.com>,
 "paul.hsieh@amd.com" <paul.hsieh@amd.com>,
 "hanghong.ma@amd.com" <hanghong.ma@amd.com>,
 "JinZe.Xu@amd.com" <JinZe.Xu@amd.com>,
 "lewis.huang@amd.com" <lewis.huang@amd.com>,
 Zhengzengkai <zhengzengkai@huawei.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>,
 "syed.hassan@amd.com" <syed.hassan@amd.com>,
 "wayne.lin@amd.com" <wayne.lin@amd.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "chiahsuan.chung@amd.com" <chiahsuan.chung@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "aric.cyr@amd.com" <aric.cyr@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjYuNg==?= =?utf-8?Q?=5D?=
 drm/amd/display: Wake DMCUB before executing GPINT commands
Message-ID: <2024041835-important-salad-407e@gregkh>
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
 <2024041658-imagines-unlatch-a9b6@gregkh>
 <036c3371d3a64ef8881260197ce37dbc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <036c3371d3a64ef8881260197ce37dbc@huawei.com>
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

On Thu, Apr 18, 2024 at 01:51:33AM +0000, wangzhu wrote:
> Hi Greg, thanks for your reply. Since there is no patch to fix CVE-2023-52624 in linux-5.10, there is a patch in the linux-6.7 branch, its commit is 2ef98c6d753a744e333b7e34b9cf687040fba57d ("drm/amd/display: Wake DMCUB before executing GPINT commands"). When we apply this patch to linux-5.10, there are lots of conflicts, and we found there are lots of dependent patches, and lots of patches are not proposed to fix the cve, they are presented to add new functions of the kernel.
> 
> My commit comes from nearly 20 patches. For each patch, not all of its content is meant to fix the cve, so I just get the part which is helpful to fix. It is why I don't present the patches one by one instead of merging them into one big patch.
> 


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

Also, yes, we want to take the original commits, as you see on the
stable mailing list, submit a series of commits that are in Linus's tree
that resolve the issue (and send them to the proper people, as explained
in the link above.)

thanks,

greg k-h
