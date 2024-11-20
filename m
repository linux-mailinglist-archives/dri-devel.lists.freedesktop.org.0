Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E59D356F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CBE10E3B3;
	Wed, 20 Nov 2024 08:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mg5ROsZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99F10E3B3;
 Wed, 20 Nov 2024 08:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 61E07A42C56;
 Wed, 20 Nov 2024 08:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8073DC4CED0;
 Wed, 20 Nov 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732091534;
 bh=dXNHNSXuadyJpwK+4KKoncxf22sSJQuUbxURN0kr3Jk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mg5ROsZ82qDNrjFvMfa3k85muGd/SAuUgfqiQuBBiq8aTAHKVrI5Mlw9WY1ZkiPi6
 QX5QyPCChWgPrM2nhIX0unWkeQOgb4NdMKeSbd4LUfXcdTEAcCulJV4qIPGhNTWP7Z
 jygIbqKXEoj5oTVVLgZ0Wz5IogX7kkYcNqaPYHtm5S4tv4LTle5qznElpqhWisPUi2
 Le3LUUNUyWqlZ7MqVrAlfVmzqrklA2FOq/oYCtFX6i25jiOY0e/AIG2OjkSKqw962Q
 qNY0SH11OhnqVJi4MKJmdIiPZHIgArpxtQ34LmmMjcKf3l2n0VkBhEpEh863rs04be
 xj1hKcu4l9lOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1tDg84-000000007oI-0jgg;
 Wed, 20 Nov 2024 09:32:04 +0100
Date: Wed, 20 Nov 2024 09:32:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Leonard Lausen <leonard@lausen.nl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
Message-ID: <Zz2ehK4KoUbpdbBv@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
 <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>
 <ZzyqhK-FUwoAcgx1@hovoldconsulting.com>
 <4f145884-2c91-4e32-a7bc-b439746c6adb@lausen.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f145884-2c91-4e32-a7bc-b439746c6adb@lausen.nl>
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

On Tue, Nov 19, 2024 at 10:02:33PM -0500, Leonard Lausen wrote:

> The finding is that while 6.10.14 with this patch applied still suffers from
> that regression, 6.11.9 and 6.12 do not face the CRTC state regression.
> Therefore, whatever issue the patch uncovered in older kernels and which
> justified not merging it before due to regressing basic CTM functionality, is
> now fixed. The patch should be good to merge and backport to 6.11, but from my
> perspective should not be backported to older kernels unless the interaction
> with the DRM CRTC state issue is understood and an associated fix backported as
> well.

Thanks for testing. The 6.9 and 6.10 stable trees are EOL and backporting
to 6.11 should not cause any trouble then.

Johan
