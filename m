Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC1A10AEC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A3810E399;
	Tue, 14 Jan 2025 15:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MtuuT7Nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1ED10E398;
 Tue, 14 Jan 2025 15:33:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 543885C57AF;
 Tue, 14 Jan 2025 15:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769C3C4CEDD;
 Tue, 14 Jan 2025 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736868809;
 bh=IqB1kGiq4RQ8Magdnvbyx2VkX6/ppsKFiGIxGCa6plI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MtuuT7NtFu+PQ9wwOLqKMMIhCd5Mk/3dL/WdoUkGZlcyyd/Cy0vSULdCURK+Sw60/
 s476QuPBTMfl1zik6B8WgzBcvWibDwdPXu2da8mpig6PPeLr0t/JMgho37TwFcfkTg
 LIWDqjEEPT6HITaMp8PH2Mvk1NZrsHWAWnHGzipttNgRg86D17gM4dWk2tytEV1yMY
 woeliS9KCC7Yb+lCN+kFNwH/pcvRBrC9ogbyPtTRt4IAScnzPb097AIKImkZbrImyF
 6N+j04AEZFHP/302ub78qOrDQFoBMhqSCd5fkT5l7eXSJmn7cZtNmR+80JsmjPGqyj
 Dk7eFD3xzuG4A==
Date: Tue, 14 Jan 2025 16:33:22 +0100
From: Carlos Maiolino <cem@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mirsad Todorovac <mtodorovac69@gmail.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Zhigang Luo <Zhigang.Luo@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Vignesh Chander <Vignesh.Chander@amd.com>,
 Danijel Slivka <danijel.slivka@amd.com>
Subject: Re: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
Message-ID: <i66hmugg7dxs5ncmtky6whqyhg6tsn2mo7ai2xixye357r3sbs@etgmlalph3nw>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <173685063900.121209.12260311689704122686.b4-ty@kernel.org>
 <CADnq5_PDSe3U=LWF_dBA=iSvX+4Cv3t66ELiNi=s3uh2W_q9Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PDSe3U=LWF_dBA=iSvX+4Cv3t66ELiNi=s3uh2W_q9Ww@mail.gmail.com>
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

On Tue, Jan 14, 2025 at 09:27:59AM -0500, Alex Deucher wrote:
> On Tue, Jan 14, 2025 at 5:37 AM Carlos Maiolino <cem@kernel.org> wrote:
> >
> > On Tue, 17 Dec 2024 23:58:10 +0100, Mirsad Todorovac wrote:
> > > The static analyser tool gave the following advice:
> > >
> > > ./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportunity for kmemdup
> > >
> > >  → 1266         tmp = kmalloc(used_size, GFP_KERNEL);
> > >    1267         if (!tmp)
> > >    1268                 return -ENOMEM;
> > >    1269
> > >  → 1270         memcpy(tmp, &host_telemetry->body.error_count, used_size);
> > >
> > > [...]
> >
> > Applied to for-next, thanks!
> 
> FWIW, I already picked up the amdgpu patch for drm-next on Dec 18th.
> 

b4 seems to have ignored that I pulled only the xfs bits :)

Thanks for the heads up Alex.

> Alex
> 
> >
> > [1/3] drm/admgpu: replace kmalloc() and memcpy() with kmemdup()
> >       (no commit info)
> > [2/3] xfs/libxfs: replace kmalloc() and memcpy() with kmemdup()
> >       commit: 9d9b72472631262b35157f1a650f066c0e11c2bb
> > [3/3] btrfs: replace kmalloc() and memcpy() with kmemdup()
> >       (no commit info)
> >
> > Best regards,
> > --
> > Carlos Maiolino <cem@kernel.org>
> >
