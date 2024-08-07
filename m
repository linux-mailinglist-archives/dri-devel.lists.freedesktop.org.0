Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5D94A4F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 12:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDEA10E1B4;
	Wed,  7 Aug 2024 10:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="WHx0Hsw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2334B10E1B4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 10:04:43 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70d18112b60so547515b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1723025082; x=1723629882; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgEGMdmx49wb7/1ddWfTMcTpQTAGqkrivezogTjL5Sw=;
 b=WHx0Hsw+teeCD17MJGGIrBqjp/Lv9i/UPbnf7uR23GOAE2ouWpXPJC09gjD/vmqm5o
 rPdDJWkwIf22A70qIdV80ItNJOa8oqrOXlpSiK3mSexxdMseT+2OqvwUDiOQ3dqMmj1P
 M10hhM1J0hRCoSGHMqZqHYxpT7YJPy/D3mvHgHettdJBZJUZIB+mFzAG3gp56GFlyHna
 upYD+DAixu1Ij+nlWXPijnixpV88P5aKFfiFY9I2sJZP/BFLk9cb6FZX8ApHO2NQUCv8
 YrgdePjSIdeaJMlq9chNAqnrLRhjCS7SNTD8gKkQXvbwtXu9Ks75H1q1/fiVXBLL7Gtz
 HT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723025082; x=1723629882;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgEGMdmx49wb7/1ddWfTMcTpQTAGqkrivezogTjL5Sw=;
 b=aMjhYbH9aDFKnRGo/b3njRtQMWfC9dit8Lx8gpYnmP+9goIGyxGM3edcsKWIYGNsWX
 ggXm/NhiNWYiYX4MmLrhUzR17YLQ9jO7phcu3bH/wMoKnm6fguPJklhAd4jfyi6AZOyQ
 bDx6E0XmsKE7yJ7hmB5QSUAMQtHK0Gh8IUs5DLqq3WAqWbW2y9phTbnY/taKFNNNUndU
 cUinaaEMWZ4xsdzYYRycwArT7bNEjzB11k8NqmaONWL9Jnmrkpfk5mxIoYBBnD8ovCVA
 1SE5NQwE/4Tw45xTgmVIHahRr/oNvHcd6IceN+ppY91691af0WyUN0SP7fVzg++fabfx
 9lmg==
X-Gm-Message-State: AOJu0Yx8qMYUnlmUXRYMIHii4IG78+GpXmspxvYCll7x6lnbdsL3+Yl+
 EI1O3nxswhIfOlBBoCT2kaTe6CYJlkjUKWNGIe/qThEJcF8fo9MXp95rsdh8Hy0=
X-Google-Smtp-Source: AGHT+IH6GVSkW+cm1e7rcncpZyCWMyA/YyxUgGYFYcAZHFnUAsi+fcpr5GbKvybufdDmOfR5fGnhnQ==
X-Received: by 2002:a05:6a00:6f12:b0:710:4e4c:a4ba with SMTP id
 d2e1a72fcca58-710bc916a6bmr2323815b3a.13.1723025082453; 
 Wed, 07 Aug 2024 03:04:42 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ecdff89sm8119248b3a.103.2024.08.07.03.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 03:04:41 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, airlied@gmail.com,
 daniel@ffwll.ch, jagan@edgeble.ai, dmitry.baryshkov@linaro.org,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 0/2] Modify the method of sending "exit sleep
Date: Wed,  7 Aug 2024 18:04:27 +0800
Message-Id: <20240807100429.13260-1-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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

This "exit sleep mode" and "set display on" command needs to 
be sent in LP mode, so move "exit sleep mode" and "set display 
on" command to the init() function.

Modify the Melfas panel init code to satisfy the gamma value of 2.2.

Changes between V3 and V2:
- PATCH 1/2: Modify the commit message and subject.
- PATCH 2/2: No changes.
- Link to v2: https://lore.kernel.org/all/20240806034015.11884-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Changes between V2 and V1:
- PATCH 1/2: Modify the commit message and subject.
- PATCH 2/2: No changes.
- Link to v1: https://lore.kernel.org/all/20240725083245.12253-1-lvzhaoxiong@huaqin.corp-partner.google.com/

Zhaoxiong Lv (2):
  drm/panel: jd9365da: Move "exit sleep mode" and "set display on" cmds
  drm/panel: jd9365da: Modify the init code of Melfas

 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 137 +++++++++---------
 1 file changed, 71 insertions(+), 66 deletions(-)

-- 
2.17.1

