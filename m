Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD28A62A2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 06:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3D9112A0F;
	Tue, 16 Apr 2024 04:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G2q4r1pm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96551112A0F;
 Tue, 16 Apr 2024 04:54:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 47594CE0E2B;
 Tue, 16 Apr 2024 04:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F3FC113CE;
 Tue, 16 Apr 2024 04:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713243268;
 bh=4mVUVKHx9nj8ZHZlaWZQT0qownR6pzR8jt+FmiNQdqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2q4r1pmu9VPBzRvK/6mDyTN5QQimtClS+cP4iELVIe6Y4myQPCgMFjgVMiZld322
 2Tow4i5UBsZlahkQCJW33cFjHq9zK4S2v9ag+per8mcSrlM3evXSofCP+ROR8gXR4R
 c6PbZwKUZgDQlkW4+YsnfDlrCFK95OV835/UR1XA=
Date: Tue, 16 Apr 2024 06:54:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhu Wang <wangzhu9@huawei.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, qingqing.zhuo@amd.com,
 stylon.wang@amd.com, Josip.Pavic@amd.com, trix@redhat.com,
 cruise.hung@amd.com, Eric.Yang2@amd.com, mario.limonciello@amd.com,
 alvin.lee2@amd.com, jun.lei@amd.com, austin.zheng@amd.com,
 sunglee@amd.com, paul.hsieh@amd.com, hanghong.ma@amd.com,
 JinZe.Xu@amd.com, lewis.huang@amd.com, zhengzengkai@huawei.com,
 alex.hung@amd.com, syed.hassan@amd.com, wayne.lin@amd.com,
 nicholas.kazlauskas@amd.com, chiahsuan.chung@amd.com,
 aurabindo.pillai@amd.com, aric.cyr@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6.6] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Message-ID: <2024041658-imagines-unlatch-a9b6@gregkh>
References: <20240416035240.2450127-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416035240.2450127-1-wangzhu9@huawei.com>
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

On Tue, Apr 16, 2024 at 03:52:40AM +0000, Zhu Wang wrote:
> From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 
> stable inclusion
> from stable-v6.7.3
> commit 2ef98c6d753a744e333b7e34b9cf687040fba57d
> category: bugfix
> bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
> CVE: CVE-2023-52624
> 
> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ef98c6d753a744e333b7e34b9cf687040fba57d
> 
> --------------------------------
> 
> [ Upstream commit e5ffd1263dd5b44929c676171802e7b6af483f21 ]
> 
> [Why]
> DMCUB can be in idle when we attempt to interface with the HW through
> the GPINT mailbox resulting in a system hang.
> 
> [How]
> Add dc_wake_and_execute_gpint() to wrap the wake, execute, sleep
> sequence.
> 
> If the GPINT executes successfully then DMCUB will be put back into
> sleep after the optional response is returned.
> 
> It functions similar to the inbox command interface.
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
> Acked-by: Wayne Lin <wayne.lin@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> This commit comes from following commits:
> 
>  8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")
>  65138eb72e1f ("drm/amd/display: Add DCN35 DMUB")
>  dc01c4b79bfe ("drm/amd/display: Update driver and IPS interop")
>  820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle interface")
>  2ef98c6d753a ("drm/amd/display: Wake DMCUB before executing GPINT commands")

Why are you putting multiple commits together and not just submitting
the individual ones?  And what is this for?

confused,

greg k-h
