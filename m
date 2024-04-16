Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A508A6290
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 06:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D517B10E8EB;
	Tue, 16 Apr 2024 04:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YcXIAjWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A010E891;
 Tue, 16 Apr 2024 04:49:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 572C461087;
 Tue, 16 Apr 2024 04:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12580C113CE;
 Tue, 16 Apr 2024 04:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713242939;
 bh=zFIazubz9lAZhK0n9voQjFdUXkFSTdqVGc2opJfNIlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YcXIAjWD2zpfdoqqsN2r8BNAEA1fCmQpcrJOgojFttpa7Go/szfmanB00V6Yo+8UK
 PxHshPolYQSGuSecdepA9aDANpskzfe9tIRpUKDK2fIGsSR9wO+MnNJcp+qrwKQ/FR
 OHPwzQ5c/7WHpPx6AEaIP0iAqHlDICAtAu0OjDk4=
Date: Tue, 16 Apr 2024 06:48:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhu Wang <wangzhu9@huawei.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sanglipeng1@jd.com, sashal@kernel.org, wayne.lin@amd.com,
 joshua@froggi.es, hongao@uniontech.com, cssk@net-c.es,
 nicholas.kazlauskas@amd.com, chiahsuan.chung@amd.com,
 mwen@igalia.com, roman.li@amd.com, aurabindo.pillai@amd.com,
 hansen.dsouza@amd.com, Rodrigo.Siqueira@amd.com,
 konstantin.meskhidze@huawei.com, aric.cyr@amd.com,
 zhangjialin11@huawei.com, jaehyun.chung@amd.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5.10] drm/amd/display: Wake DMCUB before executing GPINT
 commands
Message-ID: <2024041633-breath-unfiled-86c1@gregkh>
References: <20240416024347.2446403-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416024347.2446403-1-wangzhu9@huawei.com>
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

On Tue, Apr 16, 2024 at 02:43:47AM +0000, Zhu Wang wrote:
> From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> 
> stable inclusion
> from stable-v6.7.3
> commit 	2ef98c6d753a7 ("drm/amd/display: Wake DMCUB before executing GPINT commands")
> category: bugfix
> bugzilla: https://gitee.com/src-openeuler/kernel/issues/I9BV4C
> CVE: CVE-2023-52624
> 
> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2ef98c6d753a744e333b7e34b9cf687040fba57d
> 
> --------------------------------
> 
> [ Upstream commit e5ffd1263dd5b ("drm/amd/display: Wake DMCUB before executing GPINT commands") ]
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
> This patch comes from following commits:
> 
>  115c7e7f0501 ("drm/amd/display: Add psr get_state call")
>  1d496907f1c5 ("drm/amd/display: Engage PSR synchronously")
>  34ba432c946d ("drm/amd/display: [FW Promotion] Release 0.0.44")
>  672251b223c1 ("drm/amd/display: [FW Promotion] Release 0.0.40")
>  04f3c88f0955 ("drm/amd/display: Retry getting PSR state if command times out")
>  b30eda8d416c ("drm/amd/display: Add ETW log to dmub_psr_get_state")
>  f59a66c1915e ("drm/amd/display: use do-while-0 for DC_TRACE_LEVEL_MESSAGE()")
>  e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
>  522b9a5d5852 ("drm/amd/display: drain dmub inbox if queue is full")
>  9dce8c2a5f1b ("drm/amd/display: [FW Promotion] Release 0.0.161.0")
>  276641775848 ("drm/amd/display: [FW Promotion] Release 0.0.162.0")
>  8774029f76b9 ("drm/amd/display: Add DCN35 CLK_MGR")
>  65138eb72e1f ("drm/amd/display: Add DCN35 DMUB")
>  dc01c4b79bfe ("drm/amd/display: Update driver and IPS interop")
>  5b7954272ae9 ("drm/amd/display: [FW Promotion] Release 0.0.183.0")
>  da2d16fcdda3 ("drm/amd/display: Fix IPS handshake for idle optimizations")
>  5e8a0d3598b4 ("drm/amd/display: Negate IPS allow and commit bits")
>  820c3870c491 ("drm/amd/display: Refactor DMCUB enter/exit idle interface")
>  2ef98c6d753a ("drm/amd/display: Wake DMCUB before executing GPINT commands")
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

I'm confused, what are we supposed to do with this?

greg k-h
