Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A1A814BD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 20:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650C910E2CC;
	Tue,  8 Apr 2025 18:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bq7lhu+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFD910E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 18:36:58 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-736c062b1f5so5021456b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744137418; x=1744742218; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bEeigtXbuhczioF+6lFvsC87+fhHQtlYev57eI/FUBg=;
 b=Bq7lhu+AgcgsOiLO/y/U02y4N+beQoImF/NKjby23/DVF5Pkf1RTf5WWimZLoNq981
 0YdMMkxg8yFJM9uB264/epWSjOmQ1DQqFBtv/yHzD3s2c/HzCxlLYQQSeMxIOW2thl9u
 ih+Bid9q1Q79xZ3uVrAjdsWmGKHvu+AJrdHg8zCdKNxFnt3c64v6w7bjAvhjfG+n4exi
 04R/Tu/pQiyoYAJuOAcZZa7ns6n3Gju73oJPEvbLrkJ4hpQUKs9+QdTYTGqZHzbNVkVY
 IByGB6e+cCfycUXcX/s5iGBM7Hqd0VJyECOZJgmHNAd9P+nWlhHXoMIEmlKroLxLJjTl
 2ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744137418; x=1744742218;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEeigtXbuhczioF+6lFvsC87+fhHQtlYev57eI/FUBg=;
 b=bMK3uiwzAyHwLpmOtL9wNhiTvI7Vrsplcm2bqrMGFxfDLc8BjwyOL+0Inz/zz0Qh6h
 D9G6IdVzt+fr3n3p+6KP49NBvQJzY+THnGfDl6racnWWvWb4htLbwL4ebKcvtxJr4U3p
 eUsLMDnUnrzESFAVj4nRNxTpeVFvduF9jtLWami0mFnUAuo4mgIjLnkI7RurA578aMZG
 BKOdKJ9Yi5raBIs+iw4JG9QT16V1MU8Pt+viNSqSNgXMgQ+ehF+RLqfQv7eCl5fLfDbD
 yqzeW3E22B8NGfkWjpm0ErP/2zoUBWf4zsjgIJrpFSr7WDXJPQZf9vOa6zAtTHoXhXJH
 dWxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy+GegIqTgWteE7nQyAOfnuJsXexJw/77m0ex12voZ9zhHE/NPfF8jNxZf1C6PFmVBc/HG4hJNNYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9+DyJ5bD4n+vwORCM/45Xe6gh5JQY6PxQYRMeJcJ8WgzGRoRv
 Xh93pTiNJ6AjmIrPipPkbfk4CGzv8w6Vx0/9qVzSwP7BM/hYSmJD
X-Gm-Gg: ASbGncuRNZI0CE4auSB+TEG56GiNLatnMOmN8vJiw31iM4HhHzJq32eW7r9Lm3BGlLc
 3M26o/VdPEbKXXWV91XZLTJMYiKvRBZCNorbLg1Oy/LQTTE6M+XsFzKChfGhPTAlW5I8gtqHRvd
 Ji3Q57n2C5yH2CzyGhVL0GxzIg8t75nybfLViBx3LVCpwBfPVwlrz6YkDSNYC3xoL2flPJK5TeL
 irvfQyc8veWzlHzky0o8ptd+P02dxq5KSlLGwKN6IKbovD9PfR/cJ/xyfraYUFnxvoaxvi9Mykk
 PzIcC6uYV3sF3hEt/e9OqCBLrHlctG4F3jmU4fxQn7XjCT/kpq3J1L4g7D07Ajz8RLRWh/CXaS8
 XGWPK31NnGLBiM+0r9OcyXA/VbsOqNCbNlA==
X-Google-Smtp-Source: AGHT+IE3PGvOtJxss8WsloRc6dNnfNCVIij/xjc7LUujufO1C+pBYPdR2U2LJqkutAnOAYB1T4ZWLA==
X-Received: by 2002:a05:6a00:1152:b0:736:ab21:6f37 with SMTP id
 d2e1a72fcca58-73bae30912bmr152031b3a.0.1744137418368; 
 Tue, 08 Apr 2025 11:36:58 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97d32b2sm10960469b3a.5.2025.04.08.11.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 11:36:58 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: jayalk@intworks.biz, simona@ffwll.ch, deller@gmx.de,
 haiyangz@microsoft.com, kys@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH 0/3] fbdev: Add deferred I/O support for contiguous kernel
 memory framebuffers
Date: Tue,  8 Apr 2025 11:36:43 -0700
Message-Id: <20250408183646.1410-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Current deferred I/O code works only for framebuffer memory that is
allocated with vmalloc(). The code assumes that the underlying page
refcount can be used by the mm subsystem to manage each framebuffer
page's lifecycle, which is consistent with vmalloc'ed memory, but not
with contiguous kernel memory from alloc_pages() or similar. When used
with contiguous kernel memory, current deferred I/O code eventually
causes the memory free lists to be scrambled, and a kernel panic ensues.
The problem is seen with the hyperv_fb driver when mmap'ing the
framebuffer into user space, as that driver uses alloc_pages() for the
framebuffer in some configurations. This patch set fixes the problem
by supporting contiguous kernel memory framebuffers with deferred I/O.

Patch 1 exports a 'mm' subsystem function needed by Patch 2.

Patch 2 is the changes to the fbdev deferred I/O code. More details
are in the commit message of Patch 2.

Patch 3 updates the hyperv_fb driver to use the new functionality
from Patch 2.

Michael Kelley (3):
  mm: Export vmf_insert_mixed_mkwrite()
  fbdev/deferred-io: Support contiguous kernel memory framebuffers
  fbdev: hyperv_fb: Fix mmap of framebuffers allocated using
    alloc_pages()

 drivers/video/fbdev/core/fb_defio.c | 126 +++++++++++++++++++++++-----
 drivers/video/fbdev/hyperv_fb.c     |   1 +
 include/linux/fb.h                  |   1 +
 mm/memory.c                         |   1 +
 4 files changed, 109 insertions(+), 20 deletions(-)

-- 
2.25.1

