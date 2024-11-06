Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554069BDEA4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 07:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC88410E1AB;
	Wed,  6 Nov 2024 06:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1fTkmcG0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561A310E1AB;
 Wed,  6 Nov 2024 06:16:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BCAF5C0118;
 Wed,  6 Nov 2024 06:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2CAC4CECD;
 Wed,  6 Nov 2024 06:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1730873778;
 bh=pQlq7hHPU1Y1m8Iq0RTWGhBrUrFVOfLg2Zpy9RE9zsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1fTkmcG0N/uvrisql3iDehlDzBNxDNe9oSfkHDOaITMwxsTkdkYbtTOC9lGFg1dwl
 eMRGjVGRQcsNNJJ3jMsXvMea55ta6/60nim8jexRPhGVrhD/NnBNGv5hgahleeqztB
 pR75KwmvLCaR4VCYlltAkgEgUf3CMOSWOzvwUlZQ=
Date: Wed, 6 Nov 2024 07:16:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: stable@vger.kernel.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 hughd@google.com, willy@infradead.org, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, chiahsuan.chung@amd.com,
 mingo@kernel.org, mgorman@techsingularity.net, yukuai3@huawei.com,
 chengming.zhou@linux.dev, zhangpeng.00@bytedance.com,
 chuck.lever@oracle.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH 6.6 00/28] fix CVE-2024-46701
Message-ID: <2024110625-earwig-deport-d050@gregkh>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
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

On Thu, Oct 24, 2024 at 09:19:41PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Fix patch is patch 27, relied patches are from:
> 
>  - patches from set [1] to add helpers to maple_tree, the last patch to
> improve fork() performance is not backported;

So things slowed down?

>  - patches from set [2] to change maple_tree, and follow up fixes;
>  - patches from set [3] to convert offset_ctx from xarray to maple_tree;
> 
> Please notice that I'm not an expert in this area, and I'm afraid to
> make manual changes. That's why patch 16 revert the commit that is
> different from mainline and will cause conflict backporting new patches.
> patch 28 pick the original mainline patch again.
> 
> (And this is what we did to fix the CVE in downstream kernels).
> 
> [1] https://lore.kernel.org/all/20231027033845.90608-1-zhangpeng.00@bytedance.com/
> [2] https://lore.kernel.org/all/20231101171629.3612299-2-Liam.Howlett@oracle.com/T/
> [3] https://lore.kernel.org/all/170820083431.6328.16233178852085891453.stgit@91.116.238.104.host.secureserver.net/

This series looks rough.  I want to have the maintainers of these
files/subsystems to ack this before being able to take them.

thanks,

greg k-h
