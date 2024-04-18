Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A78A96BC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 11:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441910EFE0;
	Thu, 18 Apr 2024 09:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IFWeH69J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667B410EFE0;
 Thu, 18 Apr 2024 09:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1D0D7CE16B2;
 Thu, 18 Apr 2024 09:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2454C113CC;
 Thu, 18 Apr 2024 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713433966;
 bh=UILc22gN9ocfZvvxDWaiey3h29zRRo2zvofEpjVNhbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IFWeH69Jz3uobtuWKzimd0JGuGKgTXBEFvUVb7KHKr9f8HolsjeX3JPJ7aBP/U6NZ
 TBWu+HvjYAHPb9iNKIvxEwFwLfEg8fKtcjEp/V4FyhtoufTv2w72vC+GXKOvsGOcPC
 gf811mYD9FR+j50SHVDeyhXCoDT4E6bIV1Kt/wNw=
Date: Thu, 18 Apr 2024 11:52:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: wangzhu <wangzhu9@huawei.com>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "sanglipeng1@jd.com" <sanglipeng1@jd.com>,
 "sashal@kernel.org" <sashal@kernel.org>,
 "wayne.lin@amd.com" <wayne.lin@amd.com>,
 "joshua@froggi.es" <joshua@froggi.es>,
 "hongao@uniontech.com" <hongao@uniontech.com>,
 "cssk@net-c.es" <cssk@net-c.es>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "chiahsuan.chung@amd.com" <chiahsuan.chung@amd.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "roman.li@amd.com" <roman.li@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>,
 "hansen.dsouza@amd.com" <hansen.dsouza@amd.com>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>,
 "Konstantin Meskhidze (A)" <konstantin.meskhidze@huawei.com>,
 "aric.cyr@amd.com" <aric.cyr@amd.com>,
 "jaehyun.chung@amd.com" <jaehyun.chung@amd.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjUuMTA=?= =?utf-8?Q?=5D?=
 drm/amd/display: Wake DMCUB before executing GPINT commands
Message-ID: <2024041852-surrogate-nimbly-0538@gregkh>
References: <20240416024347.2446403-1-wangzhu9@huawei.com>
 <2024041633-breath-unfiled-86c1@gregkh>
 <a0b467dd1c074758aa89a18fa7a9c6ab@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b467dd1c074758aa89a18fa7a9c6ab@huawei.com>
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

On Thu, Apr 18, 2024 at 03:19:46AM +0000, wangzhu wrote:
> Hi Greg, thanks for your reply. Since there is no patch to fix CVE-2023-52624 in linux-5.10, there is a patch in the linux-6.7 branch to fix it, its commit is 2ef98c6d753a744e333b7e34b9cf687040fba57d ("drm/amd/display: Wake DMCUB before executing GPINT commands"). When we apply this patch to linux-5.10, there are lots of conflicts, and we found there are lots of dependent patches, we do not apply all these patches since some are not meant to fix the cve, so we just get part of them, and for each patch we just get the part which is helpful to fix.

Why do you think that specific CVE is relevent to the 5.10.y kernel?
And if so, what about the ones newer than that, as you know I can not
take patches only for older kernels, that would leave newer branches
vulnerable to the same bug.

So please submit fixes for all branches that you wish to see resolved at
the same time.

thanks,

greg k-h
