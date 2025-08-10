Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE0B1F750
	for <lists+dri-devel@lfdr.de>; Sun, 10 Aug 2025 02:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A180310E349;
	Sun, 10 Aug 2025 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MZpGq0y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F6210E10B;
 Sun, 10 Aug 2025 00:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 565374368A;
 Sun, 10 Aug 2025 00:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBBDC4CEE7;
 Sun, 10 Aug 2025 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754785212;
 bh=1r9QBkdlJxHLOIMngxodPB3HqG2uh9NJvWAg7gEuBVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZpGq0y8ckTGymbVQJrypFp6QlCdGRhQX+Jdu4iJkvcEyYCwbDnFSRJCHxM+41KJ0
 QesYpHwLYSiYyG4DrB/5GA4bkwxfNbh7zocPAcEh5J+O/WEJTHwm8WWgIznk+an7c/
 RLToUFxFs6wfnQ7SEzhREIe9D1GmjURRzPaRWNC3xLjUiEVwvpnWZqvigSauGa9Ajs
 BVflgL1+dZb3yUGp2e2QO6dEUs/xasrZR3cYEfcSrdQJ6OXTHvwGRVgzE8aaQlaUdb
 XqobIv5DBknASyappeUDKDSbh4hzHzSugMUriu7Gw6LT/NTROauD3GS0QcYSnHjXDd
 JxKcxG1JJUpTw==
Date: Sat, 9 Aug 2025 17:20:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <20250810002004.GA1726533@ax162>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
 <20250807143444.GA1009053@ax162>
 <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcgmsw66wi6eqtcwhcz5yc6migoauygaztqumztseo7uu4a62g@bg5xnnd4eosw>
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

On Sat, Aug 09, 2025 at 11:20:34AM +0300, Dmitry Baryshkov wrote:
> On Thu, Aug 07, 2025 at 07:34:44AM -0700, Nathan Chancellor wrote:
> > On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> > > Having no plane->crtc is a valid setting and it is handled inside
> > > drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> > > false and returning early. Setting crtc_state to NULL is a correct fix.
> > > Could you please send it?
> > 
> > I sent this fix three weeks ago, could this be applied?
> 
> It will be picked up for -rc2 (hopefully)

Great, thank you! Even if it slips to -rc3, no worries, as long it is in
the pipeline to get there.

Cheers,
Nathan
