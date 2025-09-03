Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C5B42BE6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D1010E93F;
	Wed,  3 Sep 2025 21:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KIm/iPg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30610E93F;
 Wed,  3 Sep 2025 21:27:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 55C6C44731;
 Wed,  3 Sep 2025 21:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544CDC4CEE7;
 Wed,  3 Sep 2025 21:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756934861;
 bh=LDEavBgpdf6sYM/MgH8ENkdlyZyknViZWzX3GHBJMuc=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=KIm/iPg6kx16gIafv7f0CtiOtExR8gU89IBmCE0vnx0Xvs0u3xOEPCjGOrdE6+ahW
 3lR/UkRwtu8eEAFVhXHvWkOFeHGw1hWmRJ1oNr6bkdyIgX9avxrPIbaKp2lw1hs+6e
 1tY4zESTXlnp78HD0gJmNPgwua6kuwREysr0H98J5/DWOpsof2Rjoyu9kfXgVPZ0y1
 rUI3sZkmeC0EUFvHxqpU9zj4QCgLQmYRFjKqDE3soOJe7C+N2x5eDxkn5cC4SBs3Fh
 0dt1yvFaIY3jN493HvP8hhxJJqhCHgYvZ7UkzmsSTVzcBUdzxC0e9pajfv7tXdKUkV
 SQLF1h/RVIcuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 23:27:37 +0200
Message-Id: <DCJHFF0AEDB6.6JMTQPQA5800@kernel.org>
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
Cc: "Lyude Paul" <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250901083107.10206-2-phasta@kernel.org>
In-Reply-To: <20250901083107.10206-2-phasta@kernel.org>
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

On Mon Sep 1, 2025 at 10:31 AM CEST, Philipp Stanner wrote:
> This reverts:
>
> commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardow=
n")
>
> from the drm/sched teardown leak fix series:
>
> https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.o=
rg/
>
> The aforementioned series removed a blocking waitqueue from
> nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
> prevents jobs from leaking, which the series fixed.
>
> The waitqueue, however, also guarantees that all VM_BIND related jobs
> are finished in order, cleaning up mappings in the GPU's MMU. These jobs
> must be executed sequentially. Without the waitqueue, this is no longer
> guaranteed, because entity and scheduler teardown can race with each
> other.
>
> Revert all patches related to the waitqueue removal.
>
> Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Applied to drm-misc-fixes, thanks!
