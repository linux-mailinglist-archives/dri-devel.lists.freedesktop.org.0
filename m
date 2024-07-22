Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA6938F39
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 14:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E8810E464;
	Mon, 22 Jul 2024 12:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q8e3lbHf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC4310E0EC;
 Mon, 22 Jul 2024 12:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EA151CE0AD7;
 Mon, 22 Jul 2024 12:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D27C116B1;
 Mon, 22 Jul 2024 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721652252;
 bh=b7uraR+kg3VECJVI+AKWtB20lyxc+lXXuEPrdL51Vcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q8e3lbHfYFRQYkbWZvSkZTS4YkyNkdM4lxfrhmi2qUPQP65ffLrRI1bhsU0ucGjTB
 4CwwBAMF+qhmSI2WJDcji4p8CeyPZZOYigiBtE39yLOtiTisb0QZgSCcVWxbukYRH7
 agdwKVSiAAkpq4Cz3SAwm1gvJlXefqgKr5yDwlr7dcx/kI05YCqhG8OI/lSWDmAyTq
 PPwZnLaVJ60GA5lEXJC7EL9sd8N8kXiFhB+ixPuqLplV+GpCXGU65LbEn5J9TO1KMh
 NLz0zeI4g3CSacaMORmk0G2kxepYxJGmiuja+3885dPB4FCRanYK2KGrwUT3yIkFpX
 Wi5wHsbgBEdcQ==
Date: Mon, 22 Jul 2024 08:44:10 -0400
From: Sasha Levin <sashal@kernel.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tom Chung <chiahsuan.chung@amd.com>,
 Sun peng Li <sunpeng.li@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 alex.hung@amd.com, roman.li@amd.com, mario.limonciello@amd.com,
 joshua@froggi.es, wayne.lin@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 6.9 11/22] drm/amd/display: Reset freesync config
 before update new state
Message-ID: <Zp5UGit6eI_ZQ16e@sashalap>
References: <20240716142519.2712487-1-sashal@kernel.org>
 <20240716142519.2712487-11-sashal@kernel.org>
 <aac02f31-ba43-458d-b9c2-a68b7869e2a3@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aac02f31-ba43-458d-b9c2-a68b7869e2a3@amd.com>
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

On Tue, Jul 16, 2024 at 10:48:03AM -0400, Hamza Mahfooz wrote:
>Hi Sasha,
>
>On 7/16/24 10:24, Sasha Levin wrote:
>>From: Tom Chung <chiahsuan.chung@amd.com>
>>
>>[ Upstream commit 6b8487cdf9fc7bae707519ac5b5daeca18d1e85b ]
>>
>>[Why]
>>Sometimes the new_crtc_state->vrr_infopacket did not sync up with the
>>current state.
>>It will affect the update_freesync_state_on_stream() does not update
>>the state correctly.
>>
>>[How]
>>Reset the freesync config before get_freesync_config_for_crtc() to
>>make sure we have the correct new_crtc_state for VRR.
>
>Please drop this patch from the stable queue entirely, since it has
>already been reverted (as of commit dc1000bf463d ("Revert
>"drm/amd/display: Reset freesync config before update new state"")).

Dropped, thanks!

-- 
Thanks,
Sasha
