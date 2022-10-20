Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578F605677
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 06:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D2A10E062;
	Thu, 20 Oct 2022 04:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220DB10E2D4;
 Thu, 20 Oct 2022 04:48:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 570CD6131F;
 Thu, 20 Oct 2022 04:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFFCC433D6;
 Thu, 20 Oct 2022 04:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666241304;
 bh=yHjM7sdsctYMfU1Z/rjrmi77RVaXah2T8Djn1lp/JJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lcdOydVv2xqbmYt3ApeKUq6FQ/Ar3ORNKykwMDoWgYe3eKT+Nddra6SlB2dshXfaK
 SkH+QUUAJDS5uHycN1XGYEpzkSxU8V3YXn/ya/ML6RvYOw10ZMPpesWtzYP96hjYk8
 gW7fWPetZw3qVhmsLQQsGxlRE3X1lg3nnDDK/KJd2ntpYBm9Ch/SaIPkXEDafDYq3o
 ooZqTuUFbO3849gwE3n+7ae5OlBRAylMHhfrb7NEFe5zJeWlDyY7UE40LKdch1CLvH
 MbmQ+97OyCLQ1QuFX6pgqr7ko1Tx1QFJ+GWoY5s84ElUhBilajEf7PPGa1Ts4iD74k
 Ihr6GGVmLROVA==
Date: Wed, 19 Oct 2022 21:48:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.19 07/16] drm/amdgpu: use dirty framebuffer
 helper
Message-ID: <Y1DTFiP12ws04eOM@sol.localdomain>
References: <20220921155332.234913-1-sashal@kernel.org>
 <20220921155332.234913-7-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921155332.234913-7-sashal@kernel.org>
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
Cc: amd-gfx@lists.freedesktop.org, guchun.chen@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, aurabindo.pillai@amd.com,
 seanpaul@chromium.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com, greenfoo@u92.eu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 11:53:23AM -0400, Sasha Levin wrote:
> From: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> [ Upstream commit 66f99628eb24409cb8feb5061f78283c8b65f820 ]
> 
> Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
> drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
> struct.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I just spent a long time bisecting a hard-to-reproduce regression to this
commit, only to find that a revert was just queued this week.

Why was this commit backported to stable in the first place?  It didn't have Cc
stable, and it didn't claim to be fixing anything.

- Eric
