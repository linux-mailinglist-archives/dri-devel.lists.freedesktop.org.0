Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20277F505
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 13:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674C810E458;
	Thu, 17 Aug 2023 11:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8829D10E451
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 11:24:21 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf11a7cf9fso1077025ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692271461; x=1692876261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TjcEuXYPc+3P+LflzNgS/R35PrZZxb+MjPLlVSZIGUc=;
 b=VQyIIEXMiq6pS36wIOW0IXVYQlXj6t1+KnNqrtLm+JWyhseZuF/zL3mfYeyfkuTkax
 L2evGQoksYxnfMdnfi7L5aelupBzM9GKiySr4tbyMKg6ti09dvUHMz3K83sLuqcnwOC6
 zVhrcmRWkwFwqkOo511Jr7OJuivS8aHsEj+t05Cp5TVi9xMh+ZV1Hl/K1hNUfhJjioSV
 u8B2KKWIBCJGihrrTPOzc7H9CH4IHP54TtrVh2620huZ9ap2bfecBprTLHC6J6Qv+Jfa
 lCH0H3x/Qd9cZhCqRkB+y1K0uMDQJXkuZPox9U/8W4MA2XkhKTj+NGusIquX0F6iHqpx
 BONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692271461; x=1692876261;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TjcEuXYPc+3P+LflzNgS/R35PrZZxb+MjPLlVSZIGUc=;
 b=a9VutMCTGwmPYihKgmmHyDpZHcbjsNPqYRCfRiOxlajzfaM8SswaL4YZI1rWoDafQw
 wUCcilALSZy/K80eKkFvqfICTopc5c4CUnDGo0wI6gg1gk5Y2+Lj75yGGC8QHdQ6gVo7
 IXnwOTAW1JAGTsidaT4PS10pB/w94Q4P0yKe9M65k3KPuX+X4EyNcMbTrJKvS21ML10A
 bqZKApj+g29ZsTdCPRcrhEE9ZZnjWI+Ch5t5ErInHsLd9PYrq/3/6VhhC43HMNvQ2nV+
 kQkLNXvu3W3tng19Y7n8f5zNXe96fJNWuW3ayTjCPRAdX2wkkWwnV6bBJirSunGWG1To
 Rfmg==
X-Gm-Message-State: AOJu0YzGK3Br/TPp60maMBWvMMu0dLYMy5rlFsffPcZFeAm8ObWEPJsR
 aGzXVTmox4P8Ix6hp988ud7K9Q==
X-Google-Smtp-Source: AGHT+IEeXBbxeyhPNz97Ub6nYdX4Bl9hgGdsmEb3/sN/aMQfAJ6bX7scVeQIfkeMLyVVQUcumeSs6g==
X-Received: by 2002:a17:902:e803:b0:1b8:9fc4:2733 with SMTP id
 u3-20020a170902e80300b001b89fc42733mr5237062plg.3.1692271460997; 
 Thu, 17 Aug 2023 04:24:20 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001bde877a7casm7229309plb.264.2023.08.17.04.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 04:24:20 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH v2 0/5] use refcount+RCU method to implement lockless slab
 shrink (part 1)
Date: Thu, 17 Aug 2023 19:23:57 +0800
Message-Id: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
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

To make reviewing and updating easier, I've chosen to split the previous
patchset[1] into the following three parts:

part 1: some cleanups and preparations
part 2: introduce new APIs and convert all shrinnkers to use these
part 3: implement lockless slab shrink

This series is the part 1 and is based on the next-20230815.

Comments and suggestions are welcome.

[1]. https://lore.kernel.org/lkml/20230807110936.21819-1-zhengqi.arch@bytedance.com/

Thanks,
Qi

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

Qi Zheng (5):
  mm: move some shrinker-related function declarations to mm/internal.h
  mm: vmscan: move shrinker-related code into a separate file
  mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
  drm/ttm: introduce pool_shrink_rwsem
  mm: shrinker: add a secondary array for shrinker_info::{map,
    nr_deferred}

 drivers/gpu/drm/ttm/ttm_pool.c |  17 +-
 include/linux/memcontrol.h     |  12 +-
 include/linux/shrinker.h       |  37 +-
 mm/Makefile                    |   4 +-
 mm/internal.h                  |  28 ++
 mm/shrinker.c                  | 751 +++++++++++++++++++++++++++++++++
 mm/shrinker_debug.c            |  18 +-
 mm/vmscan.c                    | 701 ------------------------------
 8 files changed, 818 insertions(+), 750 deletions(-)
 create mode 100644 mm/shrinker.c

-- 
2.30.2

