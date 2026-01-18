Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F6D39B04
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jan 2026 23:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25D10E252;
	Sun, 18 Jan 2026 22:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="gMkcxH4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB39B10E252
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 22:50:19 +0000 (UTC)
Message-ID: <93940257-95fe-4019-bd38-0891f7c7b322@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1768776608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6o62uwJC+K4KiYpv+J2nYdJ6yW7+xnhY+lKe00nqbzA=;
 b=gMkcxH4PQdtWmdkNRXvQpm5MeJckonC0IeHmfhRD/52IHRgtkRVzcxdoa24tVCAJz1Q0FN
 aCMz3YLD5kcNnqKJyhVLXF513er5tRvky4j0JWQiRFcg1fxN4/tMwsHXjCw2vuFa/zuENg
 4ITnBumFYr0o7Z0lVH79jav6SIPJQSjNMlGp7n8YxPEtEBX7aDlYknuI2W4P88wm2CsPq8
 6qVTJj4duOh4YP/p4qEDwhGEDeCKdTgZ/jXL5mEw3T2TceP496ZQcx+e/ASWp8WOklPiUD
 WKgBD5nfA9A8qlCfQC+0W7s1n8Ca6fH/V710SQWnzGyucQbJ+ciRu7FHqN4iyg==
Date: Sun, 18 Jan 2026 19:49:47 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] drm/msm: UBWC-related fixes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 1/17/26 3:35 AM, Dmitry Baryshkov wrote:

> Fix several bugs, possibly causing image corruption when using UBWC with
> the drm/msm driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (4):
>        drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
>        drm/msm/dpu: offset HBB values written to DPU by -13
>        drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
>        drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

Thanks, seems to fix the 
https://gitlab.freedesktop.org/drm/msm/-/issues/79 issue for me:

- disabled the workaround (`debug { disable-direct-scanout }` in Niri's 
config) i.e. enabled direct scanout
- opened System Shock Remake in full screen on the external 3840x2560@60 
monitor
- everything looks fine, the right half of the screen does not show any 
alpha artifacts


Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455


~val

