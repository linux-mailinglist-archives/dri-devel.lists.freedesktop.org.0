Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B914D7FBAB6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947210E50A;
	Tue, 28 Nov 2023 13:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA1110E50A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D99A5616C9;
 Tue, 28 Nov 2023 13:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55219C433C7;
 Tue, 28 Nov 2023 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701176463;
 bh=cno0wrTciQcAWVSsnIZ43dCdMCLvNvzuyANDvYgnksw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aXVlGl515Dfgo5/K1KozTP82iuF3KvDFwv+ZDaBUl+zAblgkAnP4MYltZlGXrQX4S
 GHKUtwhG8dEviY9RQEO/ECqcW/ICgiIstWLe4kdomhHILClEBjQ49mmkY0Jzi6O0ue
 X5qzBMKUs2wDqPwjoFRT7Vb1/bvzuRfaJcbV0CLri3FQjJ9KsWzeHfmcXXY/lHRk3w
 VNQqE3waXpplg99R7nRF0RNF+eIMnf2pZOK2ls7jYED82nCFda0xS9LYWBi2B0Vhjm
 0d/ikYHDDRsSBfYwtPr5uv5qWvzgjTmU5dMeWH7Vyo9AXBECKvGq2QtdwcOMD6bvmp
 aajCxQJuF4gFg==
From: Maxime Ripard <mripard@kernel.org>
To: airlied@gmail.com, daniel@ffwll.ch, frank.binns@imgtec.com, 
 donald.robson@imgtec.com, matt.coster@imgtec.com, sarah.walker@imgtec.com, 
 Danilo Krummrich <dakr@redhat.com>
In-Reply-To: <20231124233650.152653-4-dakr@redhat.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-4-dakr@redhat.com>
Subject: Re: (subset) [PATCH drm-misc-next 3/5] drm/imagination: vm: fix
 drm_gpuvm reference count
Message-Id: <170117646120.2825698.16047207632231408028.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 14:01:01 +0100
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Nov 2023 00:36:38 +0100, Danilo Krummrich wrote:
> The driver specific reference count indicates whether the VM should be
> teared down, whereas GPUVM's reference count indicates whether the VM
> structure can finally be freed.
> 
> Hence, free the VM structure in pvr_gpuvm_free() and drop the last
> GPUVM reference after tearing down the VM. Generally, this prevents
> lifetime issues such as the VM being freed as long as drm_gpuvm_bo
> structures still hold references to the VM.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

