Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E158CEA80
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 21:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D8F10E807;
	Fri, 24 May 2024 19:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dAc1TrLe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C043310F65A;
 Fri, 24 May 2024 19:55:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1ECDCE193B;
 Fri, 24 May 2024 19:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29619C2BBFC;
 Fri, 24 May 2024 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716580526;
 bh=7VuedSna3jlpMz1Ez302GvwvBggA0TN+vKBdyi103Og=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=dAc1TrLeJLJnfPxhon1hmn9JftZ0nFTUxbFnPDMf6BFSPe/GBhYWdTSLLwjEqffdV
 gpuzKVWU1xchtB+3IIC2Hr32hKycQoBwOZrpPKepIIIqvx1i/isGnqlTUaJTC2yoU8
 tfJDhxU+mJ5JdzaQg6Z0YNRdYsNWVSngNcWoOnvs1sphVT+sAIU69++hsiktgfaoIt
 PVpqMAMmUSo3SazS/LBqZ1vymoDnZQseB3oDkJ/n5NhxI2ks+MpI+4YMq7TKvnfBiB
 GaQaSVoY0IqYxZEWtlYtTMhaCF75anUDTIIcR696cSsUZD3tZd3bOk4FWOJrYPuFcw
 LKuWM/tusZmzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id B532DCE0962; Fri, 24 May 2024 12:55:25 -0700 (PDT)
Date: Fri, 24 May 2024 12:55:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: sfr@canb.auug.org.au
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Reply-To: paulmck@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

I get the following allmodconfig build error on x86 in next-20240523:

Traceback (most recent call last):
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
    main()
  File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
    parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'

The following patch allows the build to complete successfully:

https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751

As to whether this is a proper fix, I must defer to the DRM folks on CC.

							Thanx, Paul
