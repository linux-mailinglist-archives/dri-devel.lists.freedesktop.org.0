Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338AD22395
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 04:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DA410E6AC;
	Thu, 15 Jan 2026 03:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="csbwfIg0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4913810E6AB;
 Thu, 15 Jan 2026 03:00:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BEEA36012B;
 Thu, 15 Jan 2026 03:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0BFC4CEF7;
 Thu, 15 Jan 2026 03:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768446035;
 bh=+GhhQh/xv9b8mB4AbqjJbyQyD0w76D1PrH5aFdc1RTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=csbwfIg0y2K63uqi/6Lo7542Ohyld0LZxahUWtIhSRKkC0Z1q3I9UvI4ZcDqjxqu8
 1A9MkvycSfb5tMR2mD/MAQbF/a5PH86yWx9g7/4RsqWwra0E46HJwImVH9G4HIztXN
 uy+i0D5Q5RIwfYSsDpU2NVqMRqpn4HSOmn70fmZJba2x7mgzyIGXeY9dyLNKJh0dts
 Tqhxh9dyYgwcBgYH4Nt7LPjBFB87aUjMM8hNNw5cLvjyLvd/hV5FNqkdiTxNCxF/ww
 OacHQ05Ir+cpnj5y5s8O1gQhakRHjv0SnFIizCF/z2twPGhdQPhWSO4k5MhVDCtpLU
 UKDr4xXu21RQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] media: iris: migrate to using global UBWC
 config
Date: Wed, 14 Jan 2026 21:00:28 -0600
Message-ID: <176844602411.144544.5791366481076327049.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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


On Sat, 10 Jan 2026 21:37:52 +0200, Dmitry Baryshkov wrote:
> Having UBWC configuration in the driver is error prone. For example, the
> driver specifies fixed values for HBB, while the actual value might
> depend on the DDR type. Stop defining UBWC data in the iris driver and
> use the global UBWC configuration registry.
> 
> Merge strategy: either merge SoC bits directly through the media tree
> (with Bjorn's ack) or merge to the media tree through the immutable tag.
> The drm patches will follow depending on the way the SoC patches are
> merged.
> 
> [...]

Applied, thanks!

[01/11] soc: qcom: ubwc: add missing include
        commit: ccef4b2703ff5b0de0b1bda30a0de3026d52eb19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
