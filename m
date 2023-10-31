Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E71957DCD09
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03810E11F;
	Tue, 31 Oct 2023 12:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554AE10E11D;
 Tue, 31 Oct 2023 12:35:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A27460EE1;
 Tue, 31 Oct 2023 12:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35809C433C7;
 Tue, 31 Oct 2023 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698755706;
 bh=CBUVROw+HLBHDa2ZlqHiNrVzZsfNM0kP05CgmKncJNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AawslDTlAr3FVetIK2w1+5xf8zUrdTnBOlL5+1k/IGBS0bTro3bVAGBSSlELDglx1
 MzW5gd1lJdVTCr2CFhMBnoLi+qlqpDMHjNH/Uw0MXNsbo2J4kaXoSFBf7O56G0AtpP
 Z1A2poUGNtoXPPpP+hnExpbxDc4agt5tYzLk/ahJHhlBuzcKZBNzxQ/fggTLsbZ8if
 pPVC/Ftf7XIwmrYroSoWXie3J7cF0Urzz9GOzQuvZYHlv0bSDSjbR/bpsghU0TczDx
 EI7yuvYUiIZxyRo2u7HDFaxbyfNsuJmVE3PRQIMSSUG97cNVE+jDLQYcFlvOtNwvF8
 frJLmHTbZetJw==
Received: from johan by xi.lan with local (Exim 4.96)
 (envelope-from <johan@kernel.org>) id 1qxny2-00067y-1C;
 Tue, 31 Oct 2023 13:35:34 +0100
Date: Tue, 31 Oct 2023 13:35:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
Message-ID: <ZUD0lhStirf8IN8-@hovoldconsulting.com>
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 04:23:20PM -0700, Bjorn Andersson wrote:
> During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> typically take 1-2ms to complete. As expected this results in poor
> performance, something that has been mitigated by proposing running the
> iommu in non-strict mode (boot with iommu.strict=0).
> 
> This turns out to be related to the SAFE logic, and programming the QOS
> SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> TLB sync time to below 10us, which means significant less time spent
> with interrupts disabled and a significant boost in throughput.

I ran some tests with a gigabit ethernet adapter to get an idea of how
this performs in comparison to using lazy iommu mode ("non-strict"):

		6.6	6.6-lazy	6.6-dpu		6.6-dpu-lazy
iperf3 recv	114	941		941		941		MBit/s
iperf3 send	124	891		703		940		MBit/s

scp recv	14.6	110		110		111		MB/s
scp send	12.5	98.9		91.5		110		MB/s

This patch in itself indeed improves things quite a bit, but there is
still some performance that can be gained by using lazy iommu mode.

Notably, lazy mode with this patch applied appears to saturate the link
in both directions.

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
