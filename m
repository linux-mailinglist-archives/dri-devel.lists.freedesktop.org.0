Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78C6EAED9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE8A10E245;
	Fri, 21 Apr 2023 16:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AD010E245
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:12:42 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-54f99770f86so21780057b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682093561; x=1684685561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3iaYoNXm4l5TRXSCaOPyaOsQSUDKJbhWkidfUAQe800=;
 b=nTzCrifxuKTWpGBhR+ZZZf2bEdkhPdbeVRlCUqbn1RD1+rZLMNIiarlj+jTWSgr0Qj
 moPu5pKvqwPda/nSMHneKSZx67A8dBxHdHK8orJZ6F2KuSrHY95xXVBfw5J7PTSU+pEi
 xALCPoiksi6osn1IXcraU3dbTCkHIKIvQe5/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682093561; x=1684685561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3iaYoNXm4l5TRXSCaOPyaOsQSUDKJbhWkidfUAQe800=;
 b=j4KdKgP0wW43gapkY9GupN5mkTBcwZV4NzGWUH7+gHFPIbnPWF27tNeV016mfyVpDt
 2CBVFtWbH4cmR3Xlb3ia6KHxdeXzL34Zj543AkDx7DkrEZClMO6LFQ0FYaact2PCpOaZ
 85IMGO/Kg/MvG8SobErEcJypxA99OStIoRB04UWPW5anqjANP4C81jSrGOPc3251LKQ5
 HtB/yn4Hxz1L0DYuMMwnQBg3CF1TXnvqaCI5kR35S2HC6cjEynz3JUx1v+rr7BiHZtKt
 r6vb53kkM/5tYWRb4Pls9SOZNWN9M/ttUaW2Bh8z2ccK6d/xvhDSWcNOcyZV8hlW+1iL
 mjxw==
X-Gm-Message-State: AAQBX9dwSTd5kzV458rVpwlFRZMsfpSPry73WEjPGsyOnp/+v2F3jqVw
 DkXC5jgZJs2CI46OniJzNZvCoSA8Gee0isvS8Fo=
X-Google-Smtp-Source: AKy350YfuVuXSKq0yh511OKw/AG4hNVcCQlX+I59C/N7PMMNKZ6kRrUgM7fL79KuLGPK+ogJYDkkRQ==
X-Received: by 2002:a81:a0c3:0:b0:54f:244:807d with SMTP id
 x186-20020a81a0c3000000b0054f0244807dmr2420559ywg.11.1682093561340; 
 Fri, 21 Apr 2023 09:12:41 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:25e5:2115:c97c:bf00])
 by smtp.gmail.com with UTF8SMTPSA id
 n207-20020a0dcbd8000000b00555df877a4csm1013313ywd.102.2023.04.21.09.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:12:40 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/2] Create Content Protection Property and Use it
Date: Fri, 21 Apr 2023 12:12:35 -0400
Message-ID: <20230421161237.357342-1-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
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
Cc: dmitry.baryshkov@linaro.org, Mark Yacoub <markyacoub@chromium.org>,
 seanpaul@chromium.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

Hi all, 
Following up to my HDCP patches[1], this series introduces a new connector prop that is required to push the key from user space to a driver that requires a key from user space to enable HDCP on a connector.

Patch 1 is the DRM code that creates this prop.
Patch 2 is the MSM driver making use of the value of this prop.

Thanks,
Mark Yacoub

[1] https://patchwork.freedesktop.org/series/94713/

Mark Yacoub (2):
  DRM: Create new Content Protection connector property
  dp_hdcp: Get the hdcp key from the connector prop

 drivers/gpu/drm/drm_atomic_uapi.c |  9 +++++
 drivers/gpu/drm/msm/dp/dp_hdcp.c  | 66 ++++++++++++++++++++++++++++---
 include/drm/drm_connector.h       |  6 +++
 include/drm/drm_mode_config.h     |  6 +++
 4 files changed, 82 insertions(+), 5 deletions(-)

-- 
2.40.0.634.g4ca3ef3211-goog

