Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75304A62DC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B7410E469;
	Tue,  1 Feb 2022 17:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975F810E469
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 17:47:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s9so33471528wrb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 09:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US/OKgVIq7RQTvUVVDRe6xDQAKQFvgSJ0bC4ZgbJ/HE=;
 b=MYlzl6pGX5ozr5W0N8tzLgaoBaN7ZxAxMZrYHi1p9AMu45EI6sVmQjAh5LOzqZMZGn
 A26oIIkNc9Hb3em44A15yWRmAxlv2YJy/wSzcMI+TRimEmqiTu7jV4xSM5H9Xdruqn8W
 I41sDYM0ZJhdV+fycMWw99ORNq4UzOQwWJLFUhDisj7MSPt7hJooGByquusV3D78x5Lv
 nf3S3iJ50zUvejLNPg5C7KJ7o3a02xx6vbYwHZT4Ab8GxX0OzLyOZP+SswKKtbk+2zJT
 fwsVZD0lBkcVxYKQede0BS5A/ZoP3vVBaQB6HQsgBWpIAZdYk6JtrMWBXqVHjnXYYQOh
 L3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US/OKgVIq7RQTvUVVDRe6xDQAKQFvgSJ0bC4ZgbJ/HE=;
 b=3R9MM9P51rutwlIJ7Lp0FXaxP69/Kq+wUfWfdW9dAzi6ctkIFmk7VO4Dyjbh3HTplQ
 SrkcX5eSxitnnM6xkDYFfFCW1GZNE5ecM9J5Wrl2AC1FpFZmd7rWgOLMGJfvZviQ7yA+
 J2YJsmYntqaiEEnzpH+Disaq6gRQ5OQlDnaN9XQ3hKVaeiICnE1SP8cRH3Vx9fm2szWM
 IsCeFGgfnv5l+pgSOyI1HYILk7FWN10wlsCYGTXC/aMBconeXObseZauaZBv0dlXPffP
 0mXsWTMjL0cJ1vQkpCYG93liykigHuObM4PxgcVP6A+lM28LD02M+MSQoLW3CyHrn1jI
 3+/w==
X-Gm-Message-State: AOAM530fVAH7xq6QWHlM8rgaJ177F1GguCtOBi3B74QHvtuoegIUBcqc
 vCdw8vjHluuCF+2qS7wa/MAG4A==
X-Google-Smtp-Source: ABdhPJyv91uAdSZ2+/CfoH19SZ7LhCK1uLFNm/z3HHrAL22Qmg4Ltwk+rufuf/oFeWKR6aywDtXvFA==
X-Received: by 2002:adf:e386:: with SMTP id e6mr2424961wrm.542.1643737666682; 
 Tue, 01 Feb 2022 09:47:46 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r2sm3392332wmq.24.2022.02.01.09.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:47:46 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/2] drm/msm: Remove spurious IRQF_ONESHOT flags from dsi &
 hdmi
Date: Tue,  1 Feb 2022 17:47:31 +0000
Message-Id: <20220201174734.196718-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series corrects incorrect calls to
request_irq(..., IRQF_ONESHOT, ...). These anomalies are harmless on
regular kernels but cause odd behaviour on threadirq kernels and
break entirely on PREEMPT_RT kernels

I'm pretty certain these problems would also provoke lockdep splats on
kernels with CONFIG_PROVE_RAW_LOCK_NESTING enabled (because that is
intended to find code that breaks entirely on PREEMPT_RT kernels ;-) ).

Finally, and just in case anybody asks, yes! I did use coccinelle to do
a quick scan for similar issues. I didn't find any other instances in
drivers/drm/ .

Changes in v2:
 - Split into separate patches (Dmitry B)

Daniel Thompson (2):
  drm/msm/dsi: Remove spurious IRQF_ONESHOT flag
  drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag

 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 26291c54e111ff6ba87a164d85d4a4e134b7315c
--
2.34.1

