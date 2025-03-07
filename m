Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5CA55FAF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9603110EAC2;
	Fri,  7 Mar 2025 04:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P0xt8ZTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D619510EAC2;
 Fri,  7 Mar 2025 04:56:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 512DBA4542F;
 Fri,  7 Mar 2025 04:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724FCC4CEE7;
 Fri,  7 Mar 2025 04:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323382;
 bh=lU0xPSeb2W3+KMU7avhrqWblfI5x+HwkWjStULy0+TU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0xt8ZTNML6YSIhGhj8aXQYJeyADhpfrZhPlfS9PPMmiFE6/uXxlwQ+2fyIYYgR1s
 iLrqwZ+hxKGuogW0Iaj/UsjCXoOqkcnkL6hXzAM4PLgQuaZxoZt3A8eLDoJGGnOXpr
 +yxmxIqQ0kQxyOYRi20glaqGn/nV3bxVv9JfJhWGNI6zNZ5lef0JA2JyyYLS8Y1qQe
 EBuRkubR3WIWlIrhx8+DUhRR78dHUIp+NkxUbS5gPC3YQ0FcuLG7e2Fl93g9O7By8v
 lQkH2gRqb1tlD9u/d4xJyKsEqycsENS9/go5vdmG64kMh10R1BsxRlZTIC72lYtF/V
 Ydr3HcelG/K7Q==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 00/14] drm/msm/dpu: Add Concurrent Writeback Support
 for DPU 10.x+
Date: Fri,  7 Mar 2025 06:55:51 +0200
Message-Id: <174132271320.1132259.9112655347714862323.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Fri, 14 Feb 2025 16:14:23 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied, thanks!

[01/14] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/17666e764f38
[02/14] drm/msm/dpu: move resource allocation to CRTC
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1ce69c265a53
[03/14] drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cae6a13a71f7
[04/14] drm/msm/dpu: Add CWB to msm_display_topology
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2ea34682263b
[05/14] drm/msm/dpu: Require modeset if clone mode status changes
        https://gitlab.freedesktop.org/lumag/msm/-/commit/20972609d12c
[06/14] drm/msm/dpu: Fail atomic_check if multiple outputs request CDM block
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f1f0379e9dd5
[07/14] drm/msm/dpu: Reserve resources for CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5008375443ed
[08/14] drm/msm/dpu: Configure CWB in writeback encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dd331404ac7c
[09/14] drm/msm/dpu: Support CWB in dpu_hw_ctl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0f3801d666fe
[10/14] drm/msm/dpu: Adjust writeback phys encoder setup for CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3371005e28e8
[11/14] drm/msm/dpu: Start frame done timer after encoder kickoff
        https://gitlab.freedesktop.org/lumag/msm/-/commit/95bbde1d0d07
[12/14] drm/msm/dpu: Skip trigger flush and start for CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8144d17a81d9
[13/14] drm/msm/dpu: Reorder encoder kickoff for CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ad06972d5365
[14/14] drm/msm/dpu: Set possible clones for all encoders
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e8cd8224a307

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
