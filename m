Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8B7865DB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 05:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7563B10E4CD;
	Thu, 24 Aug 2023 03:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E39C89BA3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 03:36:14 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68824a0e747so1236736b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 20:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692848174; x=1693452974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0JbfRyB2vcpbgEbI5bcL+aaH/pKOG9tfRLOJc/3sbjg=;
 b=AmQeV5ugpfZZk/4usllkCaeo1yH+UEXJG7jnjRc8qsNsDjPHxzLvzK5kA+yWBZeygJ
 QCqKnO1KHf3+eaN6ECbGrfa0j2v5LKRtFyUEy/g2RLEfv+j6XgMptGwJuiJlZXgRctDR
 1nnjangfvZWRxM22knmOQhBjMh5+8kZXKYFdw6kEqV40Y7puFZ+EPVN5qqZqX1CCDlXK
 NX2tu+NjcfQnBPGwpvzf+O6OeU6GMUuaWrUR8aBMKqTlTLnD8yNu3RGk0KaXEBdC74Xr
 0NM+Tlk2UHZgkp5BBPIerGy6xK/sweDwCZE9YbGgyUcwE7V2RgWUkzgPwzp5TYYR7s7D
 Q9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692848174; x=1693452974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0JbfRyB2vcpbgEbI5bcL+aaH/pKOG9tfRLOJc/3sbjg=;
 b=Uw8AlGmKhueEXqoSWmTeTCEf/ZvrNUGjf0elWQSMk8B4InTaXe4nBje/SkCn/FwYp/
 L/d8tVhK22ufw6rp+2pPP+tJcF8mJXurE5eZV8lIAMXu/ChbcChMRpypBB4O1W5Ethsy
 2TGNXAM+IPv/ohHoeW4FlO75PwY2/RJ3AELH0x/jEvuukjTWeIG66woplsgFcFWma/UO
 VwRJYw56J+FEhIZPYj6jBrHuQ1qU0PL9mTVYm2lgztP0uBl11WzWopoImrIdjYnZ9sIX
 EG/2+AsCSSV/K7BNHp0XUrwiYzsI1XJIO8eCFSu53p4bD/fdaWUuRivBex4roy8pEmYZ
 9VtA==
X-Gm-Message-State: AOJu0YzmdplqXtr80VV81qem+ZTYcymYT3L53A3A32Q873+nPILK5Ewt
 W4GTM1po6USOL9tC612jPRLfvw==
X-Google-Smtp-Source: AGHT+IGrTGKA8Ukg4Uzs0bSKtsW+ppGLKZSPF9YJn/x2SceKMjMMpmj5eKgpoHo48YWv/+BWfzDTow==
X-Received: by 2002:a05:6a21:788b:b0:13d:fff1:c672 with SMTP id
 bf11-20020a056a21788b00b0013dfff1c672mr19904947pzc.4.1692848173825; 
 Wed, 23 Aug 2023 20:36:13 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a62ab10000000b0068b6137d144sm2996570pff.30.2023.08.23.20.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 20:36:13 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com, daniel@ffwll.ch
Subject: [PATCH v3 0/4] cleanups for lockless slab shrink
Date: Thu, 24 Aug 2023 11:35:35 +0800
Message-Id: <20230824033539.34570-1-zhengqi.arch@bytedance.com>
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

This series is some cleanups split from the previous patchset[1], I dropped the
[PATCH v2 5/5] which is more related to the main lockless patch.

This series is based on the next-20230823.

Comments and suggestions are welcome.

[1]. https://lore.kernel.org/lkml/20230807110936.21819-1-zhengqi.arch@bytedance.com/

Thanks,
Qi

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

