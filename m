Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968659A48A6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27D110E99C;
	Fri, 18 Oct 2024 21:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PYGv1Nwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDEE10E99C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 21:01:27 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4603f64ef17so20631151cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 14:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1729285285; x=1729890085;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mJ44Pmcli6qxbslrWXh0ffpY4Yvfoc6cmvLUeoH7RPA=;
 b=PYGv1NwlwgkI/1jsWH+EDU4M+s/ORzl5ZcHAeBhNNpOCPMbAaaB3dqvZaoCqRwCfQh
 EyQVhoAuBineRqqeo8pzQhWc5hQpJCHIGTuKeJGHsM7i33fZ9mQUD0VqjV78ueH41+SY
 nNoZopAo4LFxbBXxxTnJhKLMviBiuCdEqgxb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729285285; x=1729890085;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJ44Pmcli6qxbslrWXh0ffpY4Yvfoc6cmvLUeoH7RPA=;
 b=EZdkdj5Rpj+GoDTYyr1dhqceWw36I0w0nFDOhf5el7W142d+XOfh1kYPOV5y3zRZrI
 aAzOe/fXJYpLHBqaTk5zLrH/L9Lfae0WT3C+7vTh92tNvQXdejhEdS5Hoj1umvZKLhMd
 x04t+1MaOAl2mTKH+jaowfsEtg7p9r2T86sBPxo5XX/SfL3EuUyHpuxUSiQFWc2z6AiG
 hAppucCIQ1RHQ33LyIAWzrOGLm+STIfuhjyzBwhiN3HhDIoqwdP6hQLcVZJLqNoulM5t
 ANKfBbjFKbt7jzdYzMiExWINsNPa7Ri47iHLsKWlUQqZWn1aR16dSAU9hXyMtix18KmK
 ZFrw==
X-Gm-Message-State: AOJu0YwGSbCP+fx+AsQxVrD6sKs9JvoZCjy89UvD+OZbOw57fOOCc5bn
 QSYBiLAsiSbf4aU1RDz4ap/tRj9bq5UOH1EHXc7yWsDRs6dY4kxRY06GRJ2/bvBD1uWCsR36pn3
 MMcenZTqzqDJxQPyug0YNKDpmuD7JUkNJF5HB+5xEaJNGQ5Qlar0uIByWBfscUarTGrXdrpMVzw
 RJ7iMJMpxOYDCarfkhTioEbyXY08flqG+7Lg4opmYTgnyQw6dNtq/D2Kg7kw==
X-Google-Smtp-Source: AGHT+IE9CFgmoXA1iIzwKXbsd4AaOcfg29G9qYNdn3SpEF+is53Bla3e0RbFT7A3JziXZIgvqfZ7nw==
X-Received: by 2002:a05:622a:1999:b0:460:6296:ef9d with SMTP id
 d75a77b69052e-4609b4ef04amr125471801cf.19.1729285285425; 
 Fri, 18 Oct 2024 14:01:25 -0700 (PDT)
Received: from localhost.localdomain ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-460aea48ebcsm10599501cf.63.2024.10.18.14.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:01:24 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH v2 0/3] drm/vmwgfx: Add support for userspace managed
 surfaces. 
Date: Fri, 18 Oct 2024 14:00:43 -0700
Message-ID: <20241018210046.2222313-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces basic support for userspace managed surfaces. The
lifetime and id's of these surfaces is managed by userspace submitted
commands instead of relying on the kernel to manage them.

v2: Add flag for userspace to check userspace surface support.

Maaz Mombasawala (3):
  drm/vmwgfx: Introduce userspace managed surfaces
  drm/vmwgfx: Support hw_destroy for userspace managed surfaces
  drm/vmwgfx: Add support for older define commands for userspace
    surfaces

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 331 ++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c   |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 198 +++++++++++++-
 include/uapi/drm/vmwgfx_drm.h           |   4 +
 5 files changed, 527 insertions(+), 33 deletions(-)

-- 
2.43.0

