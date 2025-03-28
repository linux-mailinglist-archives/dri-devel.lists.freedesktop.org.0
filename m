Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093EDA74E8F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 17:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0878110EA64;
	Fri, 28 Mar 2025 16:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FyJpGqmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FB410EA62;
 Fri, 28 Mar 2025 16:32:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A38943B1B;
 Fri, 28 Mar 2025 16:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1675C4CEE4;
 Fri, 28 Mar 2025 16:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743179527;
 bh=Z1+7i1vTmCOw5i24VT2mVE304lGnoLubsdk5KvyhnHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FyJpGqmvMdcLrvgJ0dJCh+2fFfdQa7vlrfroQdLsOJNj1rRFeSSG8IHYm6prKW+I8
 dlO8UkjHpuYxWoXEX6ZQCQIK9OLtXve3Y3ZchyZUxSOmDHDIS+F1tvzjdtN7Ic25p6
 kiNbQ/p82fQRztS/PzGeejxiBeURfv1/Uz2I/qG9sA25p/NIN+K3L75YEFco0Yeg5h
 i/xjVyVERStzxHJ5WRx3aHJmnMESWh4zaSZsAWBwgFTbJe2Wm9Y5JDHF5c2tZtTMMA
 238O6OLNx4or8PcbQfNKGFfMTWo/m5922g/xsSTrkPdifNwnP66YuRvEogsmICzgTF
 qSlsvz1pB+Akw==
Date: Fri, 28 Mar 2025 17:32:03 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] drm/nouveau/outp: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <Z-bPA6S56T0k9JCg@pollux>
References: <Z-bFsmWjr5yZy6c6@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-bFsmWjr5yZy6c6@kspp>
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

On Fri, Mar 28, 2025 at 09:52:18AM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/outp.c:199:45: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - Avoid using magic number in if statement. (Danilo)
>  - Use sizeof() instead of __struct_size().

Good catch -- I guess the original code should have been a bit more obvious by
passing &args.mthd, rather than &args.

Applied to drm-misc-next, thanks!
