Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C53DA4EAD6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 19:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079EA10E25D;
	Tue,  4 Mar 2025 18:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lak/FVUi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623C810E240;
 Tue,  4 Mar 2025 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Lx/8uaGq/ePxcQT7EdGKpzZUVOF43Fgxz10C6z4MHs=; b=lak/FVUiTYK7QAQbtJ+wELgdHo
 ZHuWSqpysQFLxSTn+fuCmNVLZF3JCi6DH7usTnw7qdd1oOlk8EYXCmOy0ZDyvIZXr9VxBe3HceJAL
 Ttc/ath5/wDzyZ+ohQuqGUHLW2NdIz1AK/15ysR6i/J8fTCcszFo5C4nY2MpRDV7vOx8N790zezHF
 QH3I26pApal7zeAUprQkGVB7FvitbeVIkTuL4uGnbP2xl+dSbAy6hwqrlyzaV3mXjXBoRSpsZl9o2
 IQWs/eejq+mf4Ks8V3ipHX3Y3lhDzNfj7F7hNqkTxt379XXn9L7njqkjBWm8xs8rKN7i16H+jr8bo
 n+sfdnNQ==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=maloca.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tpWlA-003qIS-NE; Tue, 04 Mar 2025 19:12:58 +0100
Date: Tue, 4 Mar 2025 11:12:52 -0700
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>, 
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 Roman Li <Roman.Li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/amd/display: move from kzalloc(size * nr, ...)
 to kcalloc(nr, size, ...)
Message-ID: <rhmsb6pxlblxzaviawfuomm6vrvkenmskau63oxfdhdlsa7gbg@qbpznssr6al6>
References: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
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

On 02/27, Ethan Carter Edwards wrote:
> We are trying to get rid of all multiplications from allocation
> functions to prevent integer overflows. Here the multiplications are
> probably safe, but using kcalloc() is more appropriate and improves
> readability. It is also safer. This series contains a few patches
> with these fixes.
> 
> Part of the Kernel Self Protection Project efforts. Links below have
> more details.
> 
> Link: https://github.com/KSPP/linux/issues/162
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
> Ethan Carter Edwards (4):
>       drm/amd/display: change kzalloc to kcalloc in dcn30_validate_bandwidth()
>       drm/amd/display: change kzalloc to kcalloc in dcn31_validate_bandwidth()
>       drm/amd/display: change kzalloc to kcalloc in dcn314_validate_bandwidth()
>       drm/amd/display: change kzalloc to kcalloc in dml1_validate()
> 
>  drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c   | 3 ++-
>  drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c   | 3 ++-
>  drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c | 3 ++-
>  drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c   | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250227-amd-display-a8342c55a9a0
> 
> Best regards,
> -- 
> Ethan Carter Edwards <ethan@ethancedwards.com>
>

Hi,

This series LGTM,

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>

To Display folks,
(Cc some other devs)

If possible, try to include this series in this week's promotion tests,
or check the IGT test in the CI just to be safe.

Thanks

-- 
Rodrigo Siqueira
