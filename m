Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCCA10408
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7610E0B5;
	Tue, 14 Jan 2025 10:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FcFs9pi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8EA10E0B5;
 Tue, 14 Jan 2025 10:28:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9185E5C5494;
 Tue, 14 Jan 2025 10:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CF2C4CEDD;
 Tue, 14 Jan 2025 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736850510;
 bh=7Xyvx//W34AHc/Tw5+ZODJKJ33wqtJEz+tKkVSYS2Ks=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FcFs9pi2nMWTOxMWtMLn7dqmdv/nJ4k4CoCBF5Uu7qrY87egjQ5CUeJZ2U0q1PaC3
 ZcTzA50GF7P6qYAx3gpk9hHNdSIlSBWyRozhjk7u9y05VYGyuoN/Kpdt5bcnje3Zj1
 EpkAOFAC6qcwXQt39TJin+jSpCkgQPOmcg25QT43iuMpBx7l01Gaa1OWgxEnKEXlLe
 EwdPTMzyJ+nXCPlBbiPNsbPdQRoZoxfxWSm2Hd3G4tdu64WhchJ52MbiM4Q9JM1hHl
 13fspuTs/UEoqrObtXl6Ya3FbK9OlGeWxdTemzbcflLX6GG+hMDzjkHCUFd+EOwjrL
 Bwf4YidlTzpqg==
From: Carlos Maiolino <cem@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Victor Skvortsov <victor.skvortsov@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Darrick J. Wong" <djwong@kernel.org>, 
 Chandan Babu R <chandanbabu@kernel.org>, Dave Chinner <dchinner@redhat.com>, 
 linux-xfs@vger.kernel.org
In-Reply-To: <20241217225811.2437150-4-mtodorovac69@gmail.com>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-4-mtodorovac69@gmail.com>
Subject: Re: [PATCH v1 2/3] xfs/libxfs: replace kmalloc() and memcpy() with
 kmemdup()
Message-Id: <173685050606.121023.15880715609147802061.b4-ty@kernel.org>
Date: Tue, 14 Jan 2025 11:28:26 +0100
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

On Tue, 17 Dec 2024 23:58:12 +0100, Mirsad Todorovac wrote:
> The source static analysis tool gave the following advice:
> 
> ./fs/xfs/libxfs/xfs_dir2.c:382:15-22: WARNING opportunity for kmemdup
> 
>  → 382         args->value = kmalloc(len,
>    383                          GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
>    384         if (!args->value)
>    385                 return -ENOMEM;
>    386
>  → 387         memcpy(args->value, name, len);
>    388         args->valuelen = len;
>    389         return -EEXIST;
> 
> [...]

Applied to for-next, thanks!

[2/3] xfs/libxfs: replace kmalloc() and memcpy() with kmemdup()
      commit: 9d9b72472631262b35157f1a650f066c0e11c2bb

Best regards,
-- 
Carlos Maiolino <cem@kernel.org>

