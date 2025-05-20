Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C87ABDB1C
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE3F10E4BA;
	Tue, 20 May 2025 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jMTmz4l1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F76E10E654;
 Tue, 20 May 2025 14:06:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 36AB74A378;
 Tue, 20 May 2025 14:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFFCC4CEEA;
 Tue, 20 May 2025 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747749991;
 bh=J8Nnu0+0C7RcYK7SzGdMl+rht0/3u+/XlcGoxeUaRXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jMTmz4l1D5ourzsVmUpjAL9mBLX2qNMGwWlXkv7Za0mYaSTDodm7NSfQ1M3Q68F8P
 VcQ+NuToW6mDyjatw1upBI1aMjVUQE3lAUtT0NtG1pc4aRhlfb9HjwTqve54eN/av2
 ZTMS2lSrkmxC6mt9owaDSssl1K35qedBUTuHx7/1KWTkMpCkbGBetb71zgku7/ZvTA
 GUVgfv2nDOGZ+Sk5kc7Sjogt8fz5AHu26QCPKtNf5QtObiM0Csv46Z3f+aC5OKrS83
 yNfiJZ+NSRPzty2pEuzqnnQObixwv7GTl0U4qNIOHkIBC8GNxoTxU9TrukFLIwj2Ci
 yzZSesdrYunTw==
Date: Tue, 20 May 2025 10:06:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Charlene Liu <Charlene.Liu@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, hamzamahfooz@linux.microsoft.com,
 Daniel.Sa@amd.com, alex.hung@amd.com, rostrows@amd.com,
 Wayne.Lin@amd.com, Syed.Hassan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH AUTOSEL 5.15 090/153] drm/amd/display: fix dcn4x init
 failed
Message-ID: <aCyMZQyha8ftILL2@lappy>
References: <20250505231320.2695319-1-sashal@kernel.org>
 <20250505231320.2695319-90-sashal@kernel.org>
 <CADnq5_NhYbp2SMivbG2pvB8oZNie5LBxS_ME5nMofX-2syQHrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NhYbp2SMivbG2pvB8oZNie5LBxS_ME5nMofX-2syQHrw@mail.gmail.com>
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

On Tue, May 06, 2025 at 11:00:58AM -0400, Alex Deucher wrote:
>On Mon, May 5, 2025 at 7:16 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Charlene Liu <Charlene.Liu@amd.com>
>>
>> [ Upstream commit 23ef388a84c72b0614a6c10f866ffeac7e807719 ]
>>
>> [why]
>> failed due to cmdtable not created.
>> switch atombios cmdtable as default.
>>
>> Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
>> Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
>> Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
>> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>Support for DCN 4 was added in 6.11 I think so there is no need to
>backport DCN 4.x fixes to kernels older than 6.11.

I'll drop it from older trees, thanks!

-- 
Thanks,
Sasha
