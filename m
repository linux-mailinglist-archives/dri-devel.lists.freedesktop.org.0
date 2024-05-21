Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C48CB3D0
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D5A10EDB7;
	Tue, 21 May 2024 18:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="AnqcjkLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08D610ED8C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:47:32 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-792b8d98a56so353227985a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1716317251; x=1716922051;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nydQ3Pgk0rVmI+987XrTYxszQ7P/TDg1wPC6zzYKxEY=;
 b=AnqcjkLJcEiS2AxvEZ2IVbmfg6TZQmKJEnA3YaVzQSmSEjrGqJg7v3j9wqT746eivd
 KZCr0aMHfwIFQweHkPBU4jV8qp7o3hRqqIT2cK+5IO2bbdhYe/BRYxMJTZcqfVS2uwE2
 6qDQ3C1/o96OmfAnzqEue0tP26LeuS/2NePBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716317251; x=1716922051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nydQ3Pgk0rVmI+987XrTYxszQ7P/TDg1wPC6zzYKxEY=;
 b=hRTb1F/Zle/h60ZHaJwAjnMRxojVzhYXySt4Xv3coXdGFF1v2MR1gWwt3BfQq4ke9Z
 F4rdJ4RAzPPsuXe6JtV3XTofL3uyySwYdIL56CEQ3A2X0dxkAFXBbEGHsfhUJuP/Vcm3
 YAQERSsDyx8vWVi35QYghpnYTdHtssql+G7BmKCzZ54gK5c3WHaZu8eBNCOT/Zp4meig
 1frcilXkQ6A4NeePRi/e7lQZeJgNR4ZpK0roP5gxLHxrMNmdtBblrbKqWWMJXlX5ZHNN
 gXuKr6D0ONKWnzR+19NpXoTM+VVCn97Ze/Xj2FGJhkFzig/J72AsjSE3/k3XELUaeSod
 AvuQ==
X-Gm-Message-State: AOJu0YxuMWFvQvMtcR6afZemFmfj2d2crLl5gEjybccZuaReaM8SHP6d
 uKYjJYrLjOKUWsOLyUvS76PI9UidlCEcBFPWTOEE35V64lnBoSw7j1lJUiKxzTkKXkVu0sBN6az
 CITBGBGiqotSK8b2e1FLPeMrPjDX/jL5Yvy55Vg6Z+DinK0DRo+OW5/VbBqQ5PgYqj+MGraJZdA
 ZGeiLxuBOFJ6Gv4wN3Y89eo2wbMPTtLpFu6bWPUKeP6a/1jcT3Jw==
X-Google-Smtp-Source: AGHT+IHyzcALGQ6LcVy25ZaWXQ+YhcOQK8IPct0ooKiF07Fg+696puZPSvJxN3OzGoQD13vqT7ZIWw==
X-Received: by 2002:a05:620a:410b:b0:792:e094:3ff2 with SMTP id
 af79cd13be357-792e094400fmr3412814285a.41.1716317251180; 
 Tue, 21 May 2024 11:47:31 -0700 (PDT)
Received: from localhost ([192.19.144.250]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792fef279a6sm657496485a.123.2024.05.21.11.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 11:47:30 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v3 0/4] Fix memory limits for STDU
Date: Tue, 21 May 2024 13:47:16 -0500
Message-Id: <20240521184720.767-1-ian.forbes@broadcom.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes a bug where modes that are too large for the device are exposed
and set causing a black screen on boot.

v2: Fixed llvmpipe over-alignment bug.
v3: Fix comment formatting.

Ian Forbes (4):
  drm/vmwgfx: Filter modes which exceed graphics memory
  drm/vmwgfx: 3D disabled should not effect STDU memory limits
  drm/vmwgfx: Remove STDU logic from generic mode_valid function
  drm/vmwgfx: Standardize use of kibibytes when logging

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 19 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  3 --
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 26 ++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          | 45 ++++++++++++++++++-
 5 files changed, 60 insertions(+), 37 deletions(-)

-- 
2.34.1

