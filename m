Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389A394F763
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B0510E288;
	Mon, 12 Aug 2024 19:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="P10QdRxx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E83810E288
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:16:50 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-70d1c655141so3376868b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723490209; x=1724095009;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nhLuxcN1qwPLrI5oK1vuqwIWy/a6CUc7zkmNRVq6mrE=;
 b=P10QdRxxZJhIcnJ+c1GI5PDJnhCtI6M3bhbJDQ/ITUrEWgz59PCUGfFlP2EOrH14QF
 QVbVa/0fsRMsxDOBlCJExy8vUABd3Zd6YwR1qBG0RBIXFEJdFTqrwUaWVPf6tvl7Tk9L
 OkeD+CSZxbEsUkXOEvSawAPdPTqy04UjLkXFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723490209; x=1724095009;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhLuxcN1qwPLrI5oK1vuqwIWy/a6CUc7zkmNRVq6mrE=;
 b=Pziz0IIKab2ar0oNcxw7xS8Yiwp/q4gNctx11NXN6KXNdDp4tUP2ffFYK+GcJ/vfbo
 hbPpRf5vreV1CLwPjMZEkhIq4n1r/QyQWkRAGY5Jxq8H9Z7fWlKopWZ+KKVuN73HWuXM
 tXiwDHR1KE/FaCMCri0OJQckoPQItPIBvP1EILjlGKXkOiV4EbIt1xmXH98rmFHk7pNf
 h4cP1fNeFqyMpeSBQe/adInBpl9+Mn0suLr7cC0wEDy2q6nPhBBdBakHJNIuwDo0CVoH
 aozkaZQAJeJQoyOV/sW0wc9RA3AGGx+Lpe56jUbZnpKeAajdfXMx7lhDZCQgGzCvDtXR
 uJhg==
X-Gm-Message-State: AOJu0YzAqhqX/mPKi0S+KE8EqipGPQfOBkxgAsagD5Ty7+xZHC1libXG
 xhMhdu8+456P9tv8D4IvYofHoimtoXoIh450+O9uh5BK161fWGrZKkq0bdpPbwtU3sknqjJ9/6a
 dV1UYMnPczfhiQFJ7hy759y+mBJ3Hh0IXBs9+7pV+moM3nHT6YmlePLmX7mLbmxtwABNOMj/TQO
 B1ncnBJI35Dl7SsoGon9v7Xr7sQQ1m2v05MW8/righ3vDmjdSYUXDuvX8x1wQD
X-Google-Smtp-Source: AGHT+IEWWP6V3OxuHrG0JtlM1zc/V0hLNfP1+HcvSX8IITOt1u4yv4nIfRdcfvWllRdJpmfXzjhPeA==
X-Received: by 2002:a17:902:e88b:b0:1fd:9d0c:998c with SMTP id
 d9443c01a7336-201ca1c6922mr15021585ad.56.1723490208815; 
 Mon, 12 Aug 2024 12:16:48 -0700 (PDT)
Received: from mombasawalam-Precision-5820-Tower.eng.vmware.com ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1e1572sm309785ad.300.2024.08.12.12.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 12:16:48 -0700 (PDT)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH 0/3] drm/vmwgfx: Add support for userspace managed surfaces. 
Date: Mon, 12 Aug 2024 12:16:36 -0700
Message-Id: <20240812191639.649841-1-maaz.mombasawala@broadcom.com>
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces basic support for userspace managed surfaces. The
lifetime and id's of these surfaces is managed by userspace submitted
commands instead of relying on the kernel to manage them.

Maaz Mombasawala (3):
  drm/vmwgfx: Introduce userspace managed surfaces
  drm/vmwgfx: Support hw_destroy for userspace managed surfaces
  drm/vmwgfx: Add support for older define commands for userspace
    surfaces

 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 331 ++++++++++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 196 +++++++++++++-
 3 files changed, 518 insertions(+), 33 deletions(-)

-- 
2.34.1

