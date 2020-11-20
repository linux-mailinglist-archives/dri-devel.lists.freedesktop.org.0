Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A0B2BA6A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4EF6E89D;
	Fri, 20 Nov 2020 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89BF6E890
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:56:11 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a186so6977041wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=65HrmNqKftUnE1asqIayt2cnQblLlYt2XJU4abNkW2c=;
 b=cIig+mZbWoziis9QAEDrcbFB/GOPYHBGkq8UJPfrMuHlRHA1uJlZUg8f7WhD8KenMR
 81/gLvFGeeEBXJjDhsMMENeHrnWQTkCblsMZLAlIKI8XYReN/YfTx4TFLK4x62j8vMcv
 NMAQZYA3LmtaSpp4bf8bDO41FIZ2kz913tElM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=65HrmNqKftUnE1asqIayt2cnQblLlYt2XJU4abNkW2c=;
 b=Fg9FA1vGdhCx9lG2zPo4CqYRCBJ49dvjLkkNAMVC5OHE4SXzRD3tzotAM4BTWWD0l8
 6E+qgWxRD6uWSVm2Y4vm8nfCBY5xKitNZL4nBMWo17CcXdtqIysMu41SpmjD2BiI44Q/
 /odq2VeByAXnBgaBYZ39VJYrhxYqT5E5tzkEZQSeHNYrktatEdftZOQFL7OIwjSdvqLO
 /LwZD25RLSW2PzBhUv5o0xtWmQaTWiVv7OY8dIJHF3/QtLjOkeSYdtJlEfQtknbFIMlL
 2KLqP0FgHTyvKoWEsGUqXH3hqpyqSRlgPYxhXjh47JgA+4vogujSxSWryvNtSfe0KkBs
 /vYw==
X-Gm-Message-State: AOAM530Nu7Xzmu7rkDIcMljSRmvkq8A7Yrik3KCphUgk2pSi+qltZjl/
 1cc/iZWziFVEu5wufh6dgsdYna6y+VPFhw==
X-Google-Smtp-Source: ABdhPJyxRsNqKBpDLy2jcbxhd6SI4PAi8++rl2ervW+Oj/NwJ6Q8RtMk6ldX7hjCBVGGsevXbc8h9w==
X-Received: by 2002:a7b:c772:: with SMTP id x18mr9460582wmk.185.1605866170156; 
 Fri, 20 Nov 2020 01:56:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm4500208wrr.49.2020.11.20.01.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 01:56:09 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] mmu_notifier fs fs_reclaim lockdep annotations
Date: Fri, 20 Nov 2020 10:54:41 +0100
Message-Id: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I've finally gotten around to polish of my lockdep anntotation patches
from a while ago:

https://lore.kernel.org/dri-devel/20200610194101.1668038-1-daniel.vetter@ffwll.ch/

That patch has been in -mm for a few days already, but it immediately hit
some issues with xfs.

Changes since v2:
- Now hopefully the bug that bombed xfs fixed.
- With unit-tests (that's the part I really wanted and never got to)
- might_alloc() helper thrown in for good.

The unit test stuff was the major drag until I figured out how to make
this very easy with the locking selftests.

Comments, review, testing all very much welcome.

Cheers, Daniel

Daniel Vetter (3):
  mm: Track mmu notifiers in fs_reclaim_acquire/release
  mm: Extract might_alloc() debug check
  locking/selftests: Add testcases for fs_reclaim

 include/linux/sched/mm.h | 16 ++++++++++++++
 lib/locking-selftest.c   | 47 ++++++++++++++++++++++++++++++++++++++++
 mm/mmu_notifier.c        |  7 ------
 mm/page_alloc.c          | 31 ++++++++++++++++----------
 mm/slab.h                |  5 +----
 mm/slob.c                |  6 ++---
 6 files changed, 86 insertions(+), 26 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
