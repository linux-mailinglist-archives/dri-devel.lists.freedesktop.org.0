Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734E868D07
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF610F2DE;
	Tue, 27 Feb 2024 10:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fSsI7Av8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5135C10F2DE;
 Tue, 27 Feb 2024 10:11:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6727CE1BA9;
 Tue, 27 Feb 2024 10:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7A1C433C7;
 Tue, 27 Feb 2024 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709028664;
 bh=Q29CPa5vEr5QpJf4/e5PnJkinSzjOGGgvQ3q+BgSUQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fSsI7Av8QnF7sgdMK78349upV4ZYcCdGzrX0KWLYJqZxbDWdBDf5zvbK0tO2FricU
 8eXY5S6PFywcWHEZ8hvJG60rZYRUyK/kS+vsVCkREZJh6YoBgmKuBjLc79GM7hQN1J
 vnS9/LffgFYO+Bray3g2Hp7GXy/HnYXXdbWy9Zw3OK7ABKwMYn7EdGl5nHdMfWU7YR
 SMyNx3oY488XRzZhTTiJIvebzSO1C+8Ex8VURuEou76CeoNJBHykd1ce+YzK94EXry
 J2Jjcfmn0YtSBeUC8oetDg0Zgw/EfGycoJsQuICDVkFZIi5p/dlrdiVuN/M/rqQd7H
 AbUPfCOI/iSIQ==
Date: Tue, 27 Feb 2024 10:10:56 +0000
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/7] A702 support
Message-ID: <20240227101055.GA13753@willie-the-truck>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, Feb 23, 2024 at 10:21:36PM +0100, Konrad Dybcio wrote:
> Bit of a megaseries, bunched together for your testing convenience..
> Needs mesa!27665 [1] on the userland part, kmscube happily spins.
> 
> I'm feeling quite lukewarm about the memory barriers in patch 3..
> 
> Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

I'm guessing you don't really expect me to take the clock bindings?!

Will
