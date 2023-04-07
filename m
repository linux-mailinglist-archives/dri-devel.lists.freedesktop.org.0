Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4696DB1CD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 19:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5051B10EE34;
	Fri,  7 Apr 2023 17:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1410EE32;
 Fri,  7 Apr 2023 17:38:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1124B652B1;
 Fri,  7 Apr 2023 17:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B8EC4339E;
 Fri,  7 Apr 2023 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680889123;
 bh=ShYE/NmpoSW62Nvk+UDzbzXRAyY8hKK3U9ol2L/cDjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M0dcZC1PwRN2HkRpAf18Y8Sc3xtdV99EC+vxYRCkvNNAP+f919nIOyOf5C1k+lysA
 DsIPR1Qt8nC4oUYnjInR8TIxqXfTv7etNNAZFIr8N3Z4pgJcnzOnfgGSt+8WWdyUnl
 AtCK3R+vmetr+XaPeV8TeeBy7ElBS52aIWcd/f+6IC92wBZ6VtySpHzS+akBWGLAPm
 9FGQ7rTD0MB43HTwT8UqysfMbMPTFlPqN0cgjcBIFUJ0L4OURVzzGJE92PFWqiUUkv
 QzbufEidnsWI3M3Syk9Vjk2T1AbA0NyhHej5ZBtJs+zEboLXJ09NMin4l6aPtNNsSc
 ndslYUpGWzB9w==
From: Bjorn Andersson <andersson@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Subject: Re: (subset) [PATCH v2 00/23] drm/msm+PM+icc: Make job_run()
 reclaim-safe
Date: Fri,  7 Apr 2023 10:41:19 -0700
Message-Id: <168088927578.2561591.14585371270684166515.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 "open list:DEVICE FREQUENCY DEVFREQ" <linux-pm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Maximilian Luz <luzmaximilian@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Mar 2023 07:43:22 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Inspired by https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
> it seemed like a good idea to get rid of memory allocation in job_run()
> fence signaling path, and use lockdep annotations to yell at us about
> anything that could deadlock against shrinker/reclaim.  Anything that
> can trigger reclaim, or block on any other thread that has triggered
> reclaim, can block the GPU shrinker from releasing memory if it is
> waiting the job to complete, causing deadlock.
> 
> [...]

Applied, thanks!

[20/23] soc: qcom: smd-rpm: Use GFP_ATOMIC in write path
        commit: 5808c532ca0a983d643319caca44f2bcb148298f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
