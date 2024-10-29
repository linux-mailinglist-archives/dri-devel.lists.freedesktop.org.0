Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7829B4D2D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 16:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BB10E295;
	Tue, 29 Oct 2024 15:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="WfQS6wHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B224B10E295;
 Tue, 29 Oct 2024 15:12:21 +0000 (UTC)
Received: from fpc (unknown [10.10.165.10])
 by mail.ispras.ru (Postfix) with ESMTPSA id AFE8240F1DCD;
 Tue, 29 Oct 2024 15:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru AFE8240F1DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1730214739;
 bh=LonMjmPRIqGLGG9lfg9x5z6q1Qjyvp/WtDaEd3VBXQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfQS6wHN+RdgB5qYHuFBVw3AsKgJGAelOmbEmbUMUEYl3aUBtxyBzvbjxClZua+jS
 ootzikbtwLmun25SKds7PfJ5yqeIUkn3zA1t+8qJffg9RdAs7PDh5/hCUWH2QTnXdm
 RBkTME1KN1amfXMb461TQQAn08ZzRsq4cid8Qcb8=
Date: Tue, 29 Oct 2024 18:12:16 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Sasha Levin <sashal@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jonathan Gray <jsg@jsg.id.au>
Subject: Re: [PATCH 0/1] On DRM -> stable process
Message-ID: <20241029-3ca95c1f41e96c39faf2e49a-pchelkin@ispras.ru>
References: <20241029133141.45335-1-pchelkin@ispras.ru>
 <ZyDvOdEuxYh7jK5l@sashalap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZyDvOdEuxYh7jK5l@sashalap>
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

On Tue, 29. Oct 10:20, Sasha Levin wrote:
> On Tue, Oct 29, 2024 at 04:31:40PM +0300, Fedor Pchelkin wrote:
> > BTW, a question to the stable-team: what Git magic (3-way-merge?) let the
> > duplicate patch be applied successfully? The patch context in stable trees
> > was different to that moment so should the duplicate have been expected to
> > fail to be applied?
> 
> Just plain git... Try it yourself :)
> 
> $ git checkout 282f0a482ee6
> HEAD is now at 282f0a482ee61 drm/amd/display: Skip Recompute DSC Params if no Stream on Link
> 
> $ git cherry-pick 7c887efda1

7c887efda1 is the commit backported to linux-6.1.y. Of course it will apply
there.

What I mean is that the upstream commit for 7c887efda1 is 8151a6c13111b465dbabe07c19f572f7cbd16fef.

And cherry-picking 8151a6c13111b465dbabe07c19f572f7cbd16fef to linux-6.1.y
on top of 282f0a482ee6 will not result in duplicating the change, at least
with my git configuration.

I just don't understand how a duplicating if-statement could be produced in
result of those cherry-pick'ings and how the content of 7c887efda1 was
generated.

$ git checkout 282f0a482ee6
HEAD is now at 282f0a482ee6 drm/amd/display: Skip Recompute DSC Params if no Stream on Link

$ git cherry-pick 8151a6c13111b465dbabe07c19f572f7cbd16fef
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
HEAD detached at 282f0a482ee6
You are currently cherry-picking commit 8151a6c13111.
  (all conflicts fixed: run "git cherry-pick --continue")
  (use "git cherry-pick --skip" to skip this patch)
  (use "git cherry-pick --abort" to cancel the cherry-pick operation)
The previous cherry-pick is now empty, possibly due to conflict resolution.
If you wish to commit it anyway, use:

    git commit --allow-empty

Otherwise, please use 'git cherry-pick --skip'

> Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> [detached HEAD 2a1c937960abd] drm/amd/display: Skip Recompute DSC Params if no Stream on Link
>  Author: Fangzhi Zuo <Jerry.Zuo@amd.com>
>  Date: Fri Jul 12 16:30:03 2024 -0400
>  1 file changed, 3 insertions(+)
> 
> $ git log -2 --oneline
> 2a1c937960abd (HEAD) drm/amd/display: Skip Recompute DSC Params if no Stream on Link
> 282f0a482ee61 drm/amd/display: Skip Recompute DSC Params if no Stream on Link
> 
> -- 
> Thanks,
> Sasha
