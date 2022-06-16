Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9754DC56
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84B710EB09;
	Thu, 16 Jun 2022 07:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6161A10FA47
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:59:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w20so988670lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
 b=R6yYKIz2gRn/9XFnfJ6HAeSMHE/8mqsxA9v30IH5IMAq0K++b1MK3dXPzv5/VpnALg
 GIn2vJuwHOhZ0glWMi1lbZyh2FuJEYLlt8u7x3w4WdP48EbLgDVqoNDjrLhozwPCPT2S
 YJKxE1Uh642O0+IJLViPp0Xdokds1+OgUrOBmOb+efaky50JigRWdsO+/EKZdB37PxD6
 3yxoNg60N8W3YGPML9iXHRWSEfvLnsmhGKytCT4u8tOENinT4Fv4p6Hiq3tFyKmjzu3k
 0fGxJqmUkYzb0XNvJyCqH0r+bJYLxsT/sNybTKOnjBVVUzlZe1cPR9oU9VxmcK1jxwb0
 r0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iwGmgmKFpnWtCg/l55Syhv88dKbAgAVzY6JbHekH/bM=;
 b=tkjY16m1osqgCVtVLZEcZCFHYkozbVLyPd1vWkUgeGihfl7XTt0kBZeI8sgbjXCKYL
 u2pOKQPqizMXUyZH+bDapkfgmnhB5FcPUwiw1AygRoYswbk1qYpxW2ea5Ww0ujsHll6p
 CkNM2hpzFBEwqgEVb2lgUz1luV+jmwZt41EFZUioi0h6BUJCOlGLKqw/BeG2NLKtslvl
 SlyjBDo5GcN0HQxHJaFK/taYzc6OaMGi7W6tINnTfXSma7ll36bVxtpN/ZbAu8+QEv0R
 L9ifEnzXZp0aU3st5mP0z6/TGLckoAv548R9I+/nVt5JbHxi3PlYyJjrJqRnWgKoq6ZU
 wUMA==
X-Gm-Message-State: AJIora+ezKxupEtpQfHWMwZuL3Go3fAu3SzOdLWRH6SKuZ9u3dV+IrG3
 I+o3e0o1bIg2xQ2WkPs6/l0pqQ==
X-Google-Smtp-Source: AGRyM1t/tOw1DPACc+e68hWUohcZGC3Sd9M2XhBUf5GPvldHD1/RJ196vIyEJIWk0eUCMlIDzqTkPg==
X-Received: by 2002:a05:6512:73:b0:479:2674:f1b6 with SMTP id
 i19-20020a056512007300b004792674f1b6mr1910376lfo.134.1655366388609; 
 Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 00:59:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm/hdmi: move resource allocation to probe function
Date: Thu, 16 Jun 2022 10:59:44 +0300
Message-Id: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Dmitry Baryshkov (3):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function

 drivers/gpu/drm/msm/hdmi/hdmi.c | 298 ++++++++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 134 insertions(+), 167 deletions(-)

-- 
2.35.1

