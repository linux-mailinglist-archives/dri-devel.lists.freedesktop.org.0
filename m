Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A7AF8343
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161B410E904;
	Thu,  3 Jul 2025 22:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QBVvrw9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F810E904;
 Thu,  3 Jul 2025 22:23:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 968A4A53A7B;
 Thu,  3 Jul 2025 22:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40521C4CEE3;
 Thu,  3 Jul 2025 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751581396;
 bh=ULixMqe8zE18HaiGA3kO5pNPj1XU+rSCwUPkclXG43k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QBVvrw9Wlj0JgDqMN4Yx6QiAdGpEgKi5x0GTUq5wrEcQLvgnK+0jGE4dFwvuPpDqq
 6qU8YvcQ+lB+xU/mROMwmrF1o1KTNceLWA5olddXOrwmSKpoWTDzJrZWqVqSNfzKFu
 f3TeSpq/F6O3UqwE6W6b0YNxgXNZED0bxGqdlnvFZ5+JZv8IeyHpRJwj051VUZtx6z
 TFK9Ju8KHAqB0GpoDQgatgSWDcilBt9dbtLAk9eiMvs60HoJlEgIXkQrBewCGafCCa
 cyjLSezn9mL4t+Ed3Qee33NgxYNExKhKDNsNxGNv1yO7U7e87KAVv95+6lAdVVktGy
 cO9dVgAYqqq+w==
Date: Fri, 4 Jul 2025 00:23:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Aaron Thompson <dev@aaront.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Do not fail module init on debugfs errors
Message-ID: <aGcCz5VU1lbi_ZxD@pollux>
References: <20250703211949.9916-1-dev@aaront.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703211949.9916-1-dev@aaront.org>
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

On Thu, Jul 03, 2025 at 09:19:49PM +0000, Aaron Thompson wrote:
> From: Aaron Thompson <dev@aaront.org>
> 
> If CONFIG_DEBUG_FS is enabled, nouveau_drm_init() returns an error if it
> fails to create the "nouveau" directory in debugfs. One case where that
> will happen is when debugfs access is restricted by
> CONFIG_DEBUG_FS_ALLOW_NONE or by the boot parameter debugfs=off, which
> cause the debugfs APIs to return -EPERM.
> 
> So just ignore errors from debugfs. Note that nouveau_debugfs_root may
> be an error now, but that is a standard pattern for debugfs. From
> include/linux/debugfs.h:
> 
> "NOTE: it's expected that most callers should _ignore_ the errors
> returned by this function. Other debugfs functions handle the fact that
> the "dentry" passed to them could be an error and they don't crash in
> that case. Drivers should generally work fine even if debugfs fails to
> init anyway."
> 
> Fixes: 97118a1816d2 ("drm/nouveau: create module debugfs root")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Thompson <dev@aaront.org>

Applied to drm-misc-fixes, thanks!
