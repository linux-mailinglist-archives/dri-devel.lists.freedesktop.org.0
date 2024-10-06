Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21115991BCF
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 03:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA510E1BD;
	Sun,  6 Oct 2024 01:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ANAu7fCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236A010E12A;
 Sun,  6 Oct 2024 01:55:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38DFE5C560D;
 Sun,  6 Oct 2024 01:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C38EC4CEC2;
 Sun,  6 Oct 2024 01:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728179748;
 bh=rC+M5Q4mJ52FdeEm7n0DqxEJm1JtZU9xFaRkElGY0cc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ANAu7fCFnOLld8npK91JMiF0SSNILGzX7Zxq3t17I20gMXHlfLIAhNINRBVvQ+MFh
 wLrNy6x7BrJNiI0rDjIRCpBXFGLNJ+ZGLkE5gEKh7CSZd7NjXbkUOk4z34uP+DH4hR
 aIKX0fAbD2476S++uZJvu/P3+YutJuBIqWYihXM+tsAjjdBjNqc31cvaas2hZ8cY5l
 yMH+ywiAd5e6YRLZUDWyQf8MQX40fK3D9IvPcdpVlPMej83wmuQT/V3ayrRZWmyzoo
 T/xp1m3R6zLBTXdN+5tk8kvKHVzjHjoRMNFoY/P/dfJu72jb5EVvVmnWWhSgrxfSXo
 N759TeFLHt1pA==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v7 0/6] HDMI TX support in msm8998
Date: Sat,  5 Oct 2024 20:55:37 -0500
Message-ID: <172817973327.398361.7245928166448591196.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
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


On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 

Applied, thanks!

[5/6] arm64: dts: qcom: msm8998: add HDMI GPIOs
      commit: 1b97f00d1b11ed6e349816ba7e60fa76e477fcbb
[6/6] arm64: dts: qcom: add HDMI nodes for msm8998
      commit: 2150c87db80cf7eed3939f32cbb18393055c58ce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
