Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56546994D5C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 15:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747F410E520;
	Tue,  8 Oct 2024 13:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Otmsx2rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C27910E1EF;
 Tue,  8 Oct 2024 13:04:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1CE3EA418D4;
 Tue,  8 Oct 2024 13:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153D2C4CECC;
 Tue,  8 Oct 2024 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728392681;
 bh=CiHFkYMfmlhH7C61SxzU1s41M8D5uRdtrYwZ3UI1/nQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Otmsx2rrnevrNJz4cLf+Z+32OY2h9DjQBorQoXCcf6lSUhC69whxs27/7VaNcxKNL
 AaoirpV4LLKVHGxjAn2x57uW1MRbG57TudgY2BNrquGlkdVt0LNLcfzAD4qlin78Hh
 YIeC3z0165JBStl/rD4zo/dKDqZjXAOUuYolq++WUeSBbfYXVMDmAJQUhlMKrekPf4
 /aUR+lVLP+H4wURm1VOCkSyBWrfadgbdrn3Ec4g1JhENfW7X4p/1DLudFetk9pMqHZ
 j1COlC8q+ltFHaUSBCxGFaaL2UxjYnhaNsn3jCEJiclSyUiGEPYPyMupVBjgs/r/Hy
 zmvDqrk1A2Lxw==
Date: Tue, 8 Oct 2024 09:04:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 mario.limonciello@amd.com, Hawking.Zhang@amd.com, le.ma@amd.com,
 hamza.mahfooz@amd.com, andrealmeid@igalia.com,
 victorchengchi.lu@amd.com, sunil.khatri@amd.com,
 chenxb_99091@126.com, victor.skvortsov@amd.com, Jun.Ma2@amd.com,
 Yunxiang.Li@amd.com, Felix.Kuehling@amd.com,
 Arunpravin.PaneerSelvam@amd.com, tvrtko.ursulin@igalia.com,
 pierre-eric.pelloux-prayer@amd.com, Wang.Beyond@amd.com,
 shashank.sharma@amd.com, zhenguo.yin@amd.com, jesse.zhang@amd.com,
 Philip.Yang@amd.com, rajneesh.bhardwaj@amd.com, Tim.Huang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH AUTOSEL 6.11 72/76] drm/amdgpu: nuke the VM PD/PT shadow
 handling
Message-ID: <ZwUt5zNpjTMzweM9@sashalap>
References: <20241004181828.3669209-1-sashal@kernel.org>
 <20241004181828.3669209-72-sashal@kernel.org>
 <bc1f6bc0-6512-48e0-9f97-c607b34e9ab1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc1f6bc0-6512-48e0-9f97-c607b34e9ab1@amd.com>
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

On Tue, Oct 08, 2024 at 08:46:01AM +0200, Christian König wrote:
>Hi Sasha,
>
>Am 04.10.24 um 20:17 schrieb Sasha Levin:
>>From: Christian König <christian.koenig@amd.com>
>>
>>[ Upstream commit 7181faaa4703705939580abffaf9cb5d6b50dbb7 ]
>>
>>This was only used as workaround for recovering the page tables after
>>VRAM was lost and is no longer necessary after the function
>>amdgpu_vm_bo_reset_state_machine() started to do the same.
>>
>>Compute never used shadows either, so the only proplematic case left is
>>SVM and that is most likely not recoverable in any way when VRAM is
>>lost.
>
>why is that backported to older kernels? It's basically just removing 
>an old and now unused feature.
>
>Lijo pointed out a related bug fixed by removing the feature, but that 
>only happens extremely rarely and in my view doesn't really justify a 
>backport.

I'll drop it then, thanks!

-- 
Thanks,
Sasha
