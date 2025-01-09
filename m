Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E90A07E33
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 17:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF6C10EE59;
	Thu,  9 Jan 2025 16:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dQWPM0Nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84210EEE7;
 Thu,  9 Jan 2025 16:58:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F3FA6A40A30;
 Thu,  9 Jan 2025 16:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC71C4CED2;
 Thu,  9 Jan 2025 16:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736441938;
 bh=g9DBO1mPrd4dIR9shZJVgrHipkWGRQF1PpjIwV7nsDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQWPM0NvRngwZNV+zrHTefWV5Z77sC+CtWHw4H1sB9NM2qPI+x7PCJdoySH9eYxKn
 nm7qgjc8xsuHBEVwb4ZvQpPhuOLaP0eUIobQrcMeaAcx02oVV15elYOFFDbBu4jMZV
 Ns/iNbo4ot+T+qOa4+FklSYXRpqocU6C9NxSKbKv66bhhwQf9V+GhKS2YtwUpmPWk1
 7IxHnTGk3Jc05dgq4QRkylhpdB3onB4Jq1u7vMilEvqu/wUHV+wZEW28V1tq698p7e
 ywH9O7+k3Zrmi15wqCMvHhagbqaqQFc/11yJrH1P6eJoitw9nfKPCAgd6OdsT3SOyM
 WkqVxYGYOg2rg==
Date: Thu, 9 Jan 2025 17:58:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/fence: handle cross device fences properly. (v3)
Message-ID: <Z4AATjxamye7yq4E@cassiopeiae>
References: <20250109005553.623947-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109005553.623947-1-airlied@gmail.com>
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

On Thu, Jan 09, 2025 at 10:55:53AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This is the 3rd iteration of this after talking to Ben and
> Danilo, I think this makes sense now.
> 
> The fence sync logic doesn't handle a fence sync across devices
> as it tries to write to a channel offset from one device into
> the fence bo from a different device, which won't work so well.
> 
> This patch fixes that to avoid using the sync path in the case
> where the fences come from different nouveau drm devices.
> 
> This works fine on a single device as the fence bo is shared
> across the devices, and mapped into each channels vma space,
> the channel offsets are therefore okay to pass between sides,
> so one channel can sync on the seqnos from the other by using
> the offset into it's vma.

Huh, they indeed all share and map drm->fence->bo, good catch.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ee5e9d40c166..a3eb1f447a29 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -367,11 +367,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
>  			if (f) {
>  				struct nouveau_channel *prev;
>  				bool must_wait = true;
> +				bool local;
>  
>  				rcu_read_lock();
>  				prev = rcu_dereference(f->channel);
> -				if (prev && (prev == chan ||
> -					     fctx->sync(f, prev, chan) == 0))
> +				local = prev && prev->drm == chan->drm;

struct nouveau_channel has no pointer to a struct nouveau_drm, this should be
prev->cli->drm and chan->cli->drm instead.

No need to resend, I can fix it when applying the patch if you want.

> +				if (local && (prev == chan ||
> +					      fctx->sync(f, prev, chan) == 0))
>  					must_wait = false;
>  				rcu_read_unlock();
>  				if (!must_wait)
> -- 
> 2.43.0
> 
