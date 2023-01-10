Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABEE664726
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 18:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1B10E62F;
	Tue, 10 Jan 2023 17:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4410E62D;
 Tue, 10 Jan 2023 17:17:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6990261820;
 Tue, 10 Jan 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0E7C433A0;
 Tue, 10 Jan 2023 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673371050;
 bh=fI0Jd97+0nJRqxn7ywqClnDN9QYikPAUW+G+b73cGsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TAyaNn8R90QBXTYYVWpNj7QZfz7KxlQDXO/m7VE8osVfxQEuj5Zu9fj/dHPiCoeN+
 FVJKyJ3FF6D/q2SjADCbThiid2Ju0T8pPC4gM46ovMk691fZfQ6vnuSooLcriMqNKR
 07q8AS6zdlpKa+ckfSDsTBLYJ62iznLVQxNOpe2YYgqt/shiKz5AwU6+dMP+5pbaLT
 DC892KlUYnalfDVVhVhqzZR6IkWedINctg51nqN8WvfrCO+BxLbu3S27/WVLqiFe9o
 fTC74jyXiLgtwC5ELoyW7+XW/d82VNX7LvmereeShq3GOdTFlXVBrqjgNepTg5dQ3+
 MY1Cu0e3teuGw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
 ulf.hansson@linaro.org, sboyd@kernel.org, quic_akhilpo@quicinc.com,
 robdclark@gmail.com
Subject: Re: (subset) [PATCH v5 0/5] Improve GPU reset sequence for Adreno GPU
Date: Tue, 10 Jan 2023 11:17:24 -0600
Message-Id: <167337103777.2139708.8328240666621116621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1672656511-1931-1-git-send-email-quic_akhilpo@quicinc.com>
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
Cc: len.brown@intel.com, dianders@chromium.org, khilman@kernel.org,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, rafael@kernel.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org,
 quic_abhinavk@quicinc.com, konrad.dybcio@linaro.org, agross@kernel.org,
 geert@linux-m68k.org, pavel@ucw.cz, linux-pm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, sean@poorly.run, linux-clk@vger.kernel.org,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Jan 2023 16:18:26 +0530, Akhil P Oommen wrote:
> This is a rework of [1] using genpd instead of 'reset' framework.
> 
> As per the recommended reset sequence of Adreno gpu, we should ensure that
> gpucc-cx-gdsc has collapsed at hardware to reset gpu's internal hardware states.
> Because this gdsc is implemented as 'votable', gdsc driver doesn't poll and
> wait until its hw status says OFF.
> 
> [...]

Applied, thanks!

[1/5] PM: domains: Allow a genpd consumer to require a synced power off
      commit: a9236a0aa7d7f52a974cc7eaa971fae92aa477c5
[2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
      commit: 8b6af3b58cafc2cbdf6269f655b2d3731eb93c2f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
