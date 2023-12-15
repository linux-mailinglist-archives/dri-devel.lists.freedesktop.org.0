Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B28148C9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 14:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1457010EA14;
	Fri, 15 Dec 2023 13:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9738B10EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 13:13:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D6A1AB8289E;
 Fri, 15 Dec 2023 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3198DC433C9;
 Fri, 15 Dec 2023 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702645990;
 bh=Dehen5HnXFNaa3WfZmpIvUhDsZ5iy/FsmZyQTwq/+OU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B5WXOQ5McoHNvKHmRHggUXcrXBTdPajeiSwaFPgQaCVt9SJZ2x2uKwKiOFfmXH8ei
 eT4tCs235k6op6X/zu3SRozD/NvvX+quBl0OUnUN8XRm7FkV5Mz1hAyZPF+Y9uHm/x
 ejt7hC9TH93iNDegGptMMpTSSMNiSUmTeSLlk/2UGqHzzLUGsTGK1UaHiqHyRxFoTc
 F10vtR2TWP9aWO8SWeDVykSIS/qmzVSynE/b2/DX0CZzqKp4Bv4PaBtruJoSQ5c1et
 ScusWitNTeaijd159wDMHBBKbU5DvDDgLo4IvQWj8zhi2wCgrovq4C5NFSBq7xaXbP
 COyc+GFQyD5Tg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Donald Robson <donald.robson@imgtec.com>
In-Reply-To: <20231213144431.94956-1-donald.robson@imgtec.com>
References: <20231213144431.94956-1-donald.robson@imgtec.com>
Subject: Re: (subset) [PATCH 1/2] drm/imagination: Fix ERR_PTR test on
 pointer to pointer.
Message-Id: <170264598817.449619.12909620922259107900.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 14:13:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: tzimmermann@suse.de, matt.coster@imgtec.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Dec 2023 14:44:30 +0000, Donald Robson wrote:
> drivers/gpu/drm/imagination/pvr_vm.c:631 pvr_vm_create_context()
>   error: 'vm_ctx->mmu_ctx' dereferencing possible ERR_PTR()
> 
> 612         vm_ctx->mmu_ctx = pvr_mmu_context_create(pvr_dev);
> 613         err = PTR_ERR_OR_ZERO(&vm_ctx->mmu_ctx);
>                                       ^
> The address is never an error pointer so this will always return 0.
> Remove the ampersand.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next-fixes).

Thanks!
Maxime

