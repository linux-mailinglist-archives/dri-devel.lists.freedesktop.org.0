Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E566579A6B2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE5B10E1A6;
	Mon, 11 Sep 2023 09:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6810E1B4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:25:55 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68e3c6aa339so761250b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1694424355; x=1695029155;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVX9WeWGptEOVbuDunuTR7x+0VEpx5JzgLCEo/pvZQ8=;
 b=cQibhKRO+Jg5j1eKXQUufdd1dx08JuwwSzRL9wqyjU4UZm94ka/IPbikUFvESxvYWA
 T8K5AEGqFlLsXpn33yaQNEOo2cbS7q6oCIENEBiXc+l24zTFWPFuoKcT41TTqo/jAdEw
 oL5aKsnl81t9oZdfgcYSdbVAg/m6/ANPHGVFJLH/pRZS5uZ3vDf+B0937kdyQuUQf0Sf
 SiiJVu9ufeUqM+bBmfsnyxBwJzcVPKxpAmtcPRLkcGfkBqCBj7HxRcPh7vUyyJPCAw/M
 Lzi53yY81yjjVM7op0BXdhELb/6TSl83BTVcbu3Ju2QXhTCc7Ojujg20yly5G9eyhKmU
 DbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694424355; x=1695029155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVX9WeWGptEOVbuDunuTR7x+0VEpx5JzgLCEo/pvZQ8=;
 b=Glh/mE+klMqSr7BbMrIoN/bSo10UAYNZC2AdiTyf3+Di8TqouPG9WOv1O5COh5ivSE
 PjyKkuclPELOgdq/OvuRH8ez/qnwpqcTqqsi+rJFg3PNnyAJN/ILLLRcANezCuXmyduv
 RLMR28ZGlgDbgRzR+k6qQoG53KS8/37iS5YG58ELkDfLNLp/Lgz1Sb8fdcZly3lPj6Sm
 ejyy4xnDHx1z8t3wZBvhhx4lNCg5ZKaw6eQVbs/Hq8fomWgVg5+VT8WKL28bwsWohWsF
 N90mvikhw4847odtJHdEdD5dvwrY5cXogjZyIa7LDMtR4fdbI7Xnso1XyuWswfHEmRUU
 KGjw==
X-Gm-Message-State: AOJu0YzwBkG5Tyg98zhbDfl5ozXVh5Be3wI8UcgyYAe1F2RZXR8aftLx
 c/hbAeMlj1L3/RxE6OxgBgiVjg==
X-Google-Smtp-Source: AGHT+IFA8N2LVaGnVCnfvNYWcDqv3xveqW6PwXfspm7irjG2TpwEtxpwFLm2nXmkPtV/jExbnj34Wg==
X-Received: by 2002:a05:6a20:5498:b0:145:3bd9:1377 with SMTP id
 i24-20020a056a20549800b001453bd91377mr11799129pzk.5.1694424355065; 
 Mon, 11 Sep 2023 02:25:55 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902788900b001b89466a5f4sm5964623pll.105.2023.09.11.02.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:25:54 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH v4 0/4] cleanups for lockless slab shrink
Date: Mon, 11 Sep 2023 17:25:13 +0800
Message-Id: <20230911092517.64141-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series is some cleanups for lockless slab shrink, I dropped the
[PATCH v2 5/5] which is more related to the main lockless patch.

This series is based on the v6.6-rc1.

Comments and suggestions are welcome.

Thanks,
Qi

Changlog in v3 -> v4:
 - rebase onto the v6.6-rc1

Changlog in part 1 v2 -> part 1 v3:
 - drop [PATCH v2 5/5]
 - collect Acked-by
 - rebase onto the next-20230823

Changlog in part 1 v1 -> part 1 v2:
 - fix compilation warning in [PATCH 1/5]
 - rename synchronize_shrinkers() to ttm_pool_synchronize_shrinkers()
   (pointed by Christian König)
 - collect Reviewed-by

Changlog in v4 -> part 1 v1:
 - split from the previous large patchset
 - fix comment format in [PATCH v4 01/48] (pointed by Muchun Song)
 - change to use kzalloc_node() and fix typo in [PATCH v4 44/48]
   (pointed by Dave Chinner)
 - collect Reviewed-bys
 - rebase onto the next-20230815

Qi Zheng (4):
  mm: move some shrinker-related function declarations to mm/internal.h
  mm: vmscan: move shrinker-related code into a separate file
  mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
  drm/ttm: introduce pool_shrink_rwsem

 drivers/gpu/drm/ttm/ttm_pool.c |  17 +-
 include/linux/shrinker.h       |  20 -
 mm/Makefile                    |   4 +-
 mm/internal.h                  |  28 ++
 mm/shrinker.c                  | 694 ++++++++++++++++++++++++++++++++
 mm/shrinker_debug.c            |  18 +-
 mm/vmscan.c                    | 701 ---------------------------------
 7 files changed, 743 insertions(+), 739 deletions(-)
 create mode 100644 mm/shrinker.c

-- 
2.30.2

