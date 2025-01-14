Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FCEA1041E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4A010E0EC;
	Tue, 14 Jan 2025 10:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ayXAyqyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962810E0EB;
 Tue, 14 Jan 2025 10:30:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3ABA6A4128D;
 Tue, 14 Jan 2025 10:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5538EC4CEE0;
 Tue, 14 Jan 2025 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736850643;
 bh=NbKSyZrW2Ui/qgfJyWHVYimqqLraJi8440l91xsjWSg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ayXAyqyQUYKhas6Imkubjm+n5ma2juX4PLJGpyX3qBUJ4KSaH+etsESFTGvT5vy96
 euftuqZCd/EXti479Rj2C1HqXuGBHnZ295G4WFTwPUAyjxIh9VjrO4tPCKau+TUs2n
 s1ACxx7gLmhtJDc1+J1ybc1mgufufNgJS5ENDpzmcpBJQQr0bTkxTwEeB9K4ASyHfm
 I5yafHRsjEnD65Smggz+pOJDgf9zIXeyqH2K9/p6ykE3TUD2Om//xZup4RpngJAW5g
 we3jOB3wqqu1YjhCxX9ON2p7GZtg6PZi5c4/pFgbCSV0FTCukQHvUaFVxuNwMj+4U7
 cwlsXilSSpGxA==
From: Carlos Maiolino <cem@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Zhigang Luo <Zhigang.Luo@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>, Jack Xiao <Jack.Xiao@amd.com>, 
 Vignesh Chander <Vignesh.Chander@amd.com>, 
 Danijel Slivka <danijel.slivka@amd.com>
In-Reply-To: <20241217225811.2437150-2-mtodorovac69@gmail.com>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
Subject: Re: [PATCH v1 1/3] drm/admgpu: replace kmalloc() and memcpy() with
 kmemdup()
Message-Id: <173685063900.121209.12260311689704122686.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 11:30:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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

On Tue, 17 Dec 2024 23:58:10 +0100, Mirsad Todorovac wrote:
> The static analyser tool gave the following advice:
> 
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:1266:7-14: WARNING opportunity for kmemdup
> 
>  → 1266         tmp = kmalloc(used_size, GFP_KERNEL);
>    1267         if (!tmp)
>    1268                 return -ENOMEM;
>    1269
>  → 1270         memcpy(tmp, &host_telemetry->body.error_count, used_size);
> 
> [...]

Applied to for-next, thanks!

[1/3] drm/admgpu: replace kmalloc() and memcpy() with kmemdup()
      (no commit info)
[2/3] xfs/libxfs: replace kmalloc() and memcpy() with kmemdup()
      commit: 9d9b72472631262b35157f1a650f066c0e11c2bb
[3/3] btrfs: replace kmalloc() and memcpy() with kmemdup()
      (no commit info)

Best regards,
-- 
Carlos Maiolino <cem@kernel.org>

