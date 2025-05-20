Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F851ABCCEA
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 04:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3451E10E06E;
	Tue, 20 May 2025 02:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vG68CW3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BDF10E31E;
 Tue, 20 May 2025 02:15:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C100629E7;
 Tue, 20 May 2025 02:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49614C4CEE4;
 Tue, 20 May 2025 02:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747707303;
 bh=szCml1hnOq0OfaKEbkzj1dBaoX8uj5729N4ukr4/Pvc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vG68CW3tWM2svfcA2NkGGLnTcJose1VTxQv5eROeCQsyYmaex8M4MMU0Bxxj6+23v
 sEOvYaGhIuJETxwcnmvu5C+3UBC4csuLF7oP1CbJPApeIDXpfbiBoB0lSJ/ar3q6sd
 n9S6kqL1CoCOOfFgIU88MMYxyK3DcE6sAMIZEGQRbcGuufb/5j8+QHW3Dv2ei0BQ+T
 Dn1igGgVCew/O+qw3eHXe8fcydgUDiySytIf29rZGEKj222w3ilsZyXt+mQpx1uTd4
 6hEbEmgLU/miBcF0onmx8yCmeZam+2N1iOGnKt2Qc+QhL24ZJG+3bUvX3EunaXcOea
 z6L3mGoK0BMtQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: (subset) [PATCH v4 00/16] drm/msm/hdmi: rework and fix the HPD
 even generation
Date: Mon, 19 May 2025 21:14:36 -0500
Message-ID: <174770727705.36693.2142458724007239007.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
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


On Sun, 09 Feb 2025 07:04:44 +0200, Dmitry Baryshkov wrote:
> The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
> is disconnected, in most of the cases cable reconnection will not be
> detected properly. We have been carrying the patch from [1] in our
> integration tree for ages. The time has come to fix the long-standing
> bug and implement proper HPD handling.
> 
> This series was tested on msm8996 and apq8064 boards. Previously HPD
> handling sometimes could trigger in the CRTC event handling, however I
> can no longer reproduce it now.
> 
> [...]

Applied, thanks!

[16/16] ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO
        commit: b2c547cffe2f67e18a3a276905649cc95aa7f293

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
