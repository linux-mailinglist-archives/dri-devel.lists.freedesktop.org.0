Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD4B50358
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7F10E2D3;
	Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tJwIUKQ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DF10E263;
 Tue,  9 Sep 2025 16:56:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 456CA6022B;
 Tue,  9 Sep 2025 16:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E485C4CEF4;
 Tue,  9 Sep 2025 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757437000;
 bh=SHZRdBfB+U++Xz+OoSe5NzvGgCUOwZHF1QKzN2t6TZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tJwIUKQ5XOXwLhu1BqktKXk6rqS5JXwnK2H6RJJrHZWDqCoH8v89Y3ok1y/4uasTQ
 8Z2+PtGOh4UdETFi4qgR5r5+s/L67R2Z6AEtWa+8B1ySKW4CdEJZPKDTIqnJnJVqr/
 kZ+Lb8jAJxUIQrF5ZUbtxzjuVkqzm/u2dHM64lK5KDipHwAsLok7TrvwOGYCf4G+J2
 RBso9JD8kNjGma51M9iHeJioxR+LcSzUlVqaBtGLn0JbL9M+pOMRy8x5SyMhO9mC8M
 3M3dNOdTLhWjOKgY5fs4zxCeigDSKvCBxkd+ZmYlya1BYjuR32Aut32ln8cEkqZrQA
 OJ8CFrzZesLgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] Support for Adreno X1-85 Speedbin along
 with new OPP levels
Date: Tue,  9 Sep 2025 11:56:29 -0500
Message-ID: <175743699552.2735486.15514580662913662588.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
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


On Tue, 01 Jul 2025 21:50:43 +0530, Akhil P Oommen wrote:
> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1] which is
> now available in v6.16-rc1.
> 
> The device tree change has a dependency on both driver and the
> dt-bindings update. So those 2 should be picked before the DT change.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: x1e80100: Update GPU OPP table
      commit: be6f43c64ca0f7929904f31c2a034c81093eb5c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
