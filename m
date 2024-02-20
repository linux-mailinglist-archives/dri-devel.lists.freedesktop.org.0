Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B785D21E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A310E649;
	Wed, 21 Feb 2024 08:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="KPZq/onh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8395F10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 19:47:32 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-59a1a03d09aso2035120eaf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1708458451; x=1709063251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kKavcfBG3gYthrGqVOpoeYHIL94CsI6zaGPhx9ie61o=;
 b=KPZq/onhpIFi33kKBdRsARMi3qXeoxKvwqBsrBNYjfcRH1Wb2P2C8HPCKM/vxjXWO7
 f2E2ivoWqMNYH3f3Nkoz1j1tzILmpi6RVJrQmKsHajgsw+Xf5BAQJJbl7UWEtAAIQ2hl
 yv/uCXAU7M+VUgSrorFAdU3/NmeO+TngovYGwK0fJOcivYQKGUC/WmH5w4jk+cYnX0jF
 L+UeGX3KU4l6gu8I6QOCZgIN0Vi95I1Ne5+Gthujq8hBj2uzq/xt6nB5DXG1TfcTvfIv
 eXVs+lte5gcGrhV2eZ+rN62ffK3lOSIaBTGZeXPOree61CiCC6xzk3tmILsYNqnVjFg6
 e/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708458451; x=1709063251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKavcfBG3gYthrGqVOpoeYHIL94CsI6zaGPhx9ie61o=;
 b=tbLVkzTnGr88ZidZWbseDrUOqvdeVjaXc06dvm670IJEK1YdAukazRkGqOocftk4xo
 ANdJmvyyL1BwbbWG7oWgwYKoIu4m0Jcl0ezr9IjyZZ3tIElkEiQ9J/DJX1ULf2c67RlX
 kd+YdwRp97BfOnd3HTHKdmqdFL5LAZFdTWmtzVANCo9oBA8fGtlVf9bTzFZSl7FKDw/u
 PPf3CckaWxKjkX3uF1LacYU9h9i4AxO6KyLcb/uBj2FzWS1zFXC5Ev2qOsiUc2aTSGtC
 u/FqdIZ700yLq/Tyh5khGOZO6ZwqXVSzssDuigRZL2be0Ziagfg79Ut135EjCsHGn7fn
 OI1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUucbMNqmrmkhPJnuXxmpWHOw9CcTg0DvES69utm5vKidAdUPvaPT/ARafvTw6tekgLcNB6+zem8PemAE6EN48sZsZq3+djL95ccgM5LQd2
X-Gm-Message-State: AOJu0Yz4aVnN+3Uhocv+muAguMcMo7sewQsY8mV6wmMqxlND7tXxvunr
 RTmSKpkxOS1TCW1EeMvFf6JYED+e1ey0LoSs1HkNsQ4aRM5HLz31ZKLSz2qjxro=
X-Google-Smtp-Source: AGHT+IFaxPRYGN4RZZRfBvd1pSE4Ni2wV7jOEJ2+/DGSa0VJSWJ8krniwu+QP83KwkF++aasN5nciw==
X-Received: by 2002:a05:6359:c8c:b0:178:fe3e:1e35 with SMTP id
 go12-20020a0563590c8c00b00178fe3e1e35mr18504857rwb.13.1708458451428; 
 Tue, 20 Feb 2024 11:47:31 -0800 (PST)
Received: from localhost.localdomain ([185.153.176.89])
 by smtp.gmail.com with ESMTPSA id
 u21-20020aa78395000000b006e0ad616be3sm7293482pfm.110.2024.02.20.11.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 11:47:31 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Cc: David Tadokoro <davidbtadokoro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/amd/display: add prefix to dc/clk_mgr/dcn10 functions
Date: Tue, 20 Feb 2024 16:46:54 -0300
Message-Id: <20240220194657.243378-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

This patchset has three commits that add prefix to all the functions defined in
dc/clk_mgr/dcn10 that indicate the file that they were defined. Enforcing this
pattern makes filtering results in debug tools like ftrace better.

David Tadokoro (3):
  drm/amd/display: add prefix to rv1_clk_mgr_clk.c function
  drm/amd/display: add prefix to rv1_clk_mgr.c functions
  drm/amd/display: add prefix to rv1_clk_mgr_vbios_smu.c functions

 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    | 24 +++++++++----------
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_clk.c        |  2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  | 14 +++++------
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h  |  4 ++--
 4 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.39.2

