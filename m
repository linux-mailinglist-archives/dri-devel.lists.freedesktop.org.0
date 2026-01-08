Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD6D067F5
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 00:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546EF10E13C;
	Thu,  8 Jan 2026 23:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="W7HLm4CL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74BA10E13C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 23:00:25 +0000 (UTC)
Message-ID: <702e4696-5ff6-4c72-bce4-1a9a8ee1ba18@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1767913222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Y93ff+hEOI+QHoGj9/iWZX4epwSGuXWyQ3WAZwL30k=;
 b=W7HLm4CLof9hJBlf9kF+Ck/RzjHe1jNiMASMK39UJHeXZndB5FTA5SHTAXtUKm8ZZwjZcY
 NkoZcf1HOarv5Nn2EWog/W2fzVzLbDrrhezpiO7+2SIPgLhhSKiPJqZ0YMnY1XEVX9gjCF
 zscvZj3lfYU7Kj7ir0WhOivJQ/c5VhIuFMRLLKcmf3xF0UoTwQi+aNaA2sbv5ejKyB75MB
 wXZ2rgUijijpYmbPGs4cHFhPWw0Hz/LuE5WiOnSCnbLfj1mN4e4d9zAnKKFTao24uO5ySB
 uYtY841b4cR62R4Zf5xNP6YeyPdAcDbxdm2Ag8nTHcpt480Vo24YxnLs0vLGgA==
Date: Thu, 8 Jan 2026 20:00:13 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
To: petr.hodina@protonmail.com, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, David Heidelberg <david@ixit.cz>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
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


On 1/7/26 8:44 AM, Petr Hodina via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
>
> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
> clocks are enabled during clock operations, preventing potential
> stability issues during display configuration.
>
> Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> We are currently running the latest linux-next snapshots (next-202511*
> and next-202512*) and have encountered random freezes and crashes on the
> Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.
>
> This commit fixes the stability issue. I've checked other SDM dispcc
> files and they also contain this configuration.

Hm, we don't have this flag set in dispcc-x1e80100.c either!

The only random freeze we have on that platform seems related to PCIe 
ASPM with NVMe drives, but during display configuration.. *extremely* 
rarely, but the eDP display output can get stuck on a blue screen. Many 
run with clk_ignore_unused for the early uefi framebuffer though.

~val

