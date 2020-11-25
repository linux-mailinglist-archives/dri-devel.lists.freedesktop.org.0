Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1D2C44EE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 17:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C086EA21;
	Wed, 25 Nov 2020 16:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05446EA1D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:25:42 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so2705207wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uUxbRrS9MFqXGOvk/ieUK3bhzkS/VSko486/NfxYD1w=;
 b=gwqmqFySnTT8wFc9pyNO08a05EtFio6skO3VOfMb8mdBj6W1qBPu6+VRr2k1XCh6kl
 Q/nUJzrA1+98qaJuJmEx9Yj8Xp0Qz4KncxaIhz/aDBFojKu7G5YnfJs/2YEnSNGH2lKf
 sVR6MQzcank3A6sMNUPe9nWSpOoUBv2+cAY+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uUxbRrS9MFqXGOvk/ieUK3bhzkS/VSko486/NfxYD1w=;
 b=X/26Tu7WHV6bUexaE1vmOOX6zI1boL+thtESeUzcvCduQcmEMWmOWglOWzUhTXhe1n
 OUytUvqi3A656ukCeHIgp5B6AyINrHoDQilcPBq+svIBvk0cNpZF+5DiPGAyFtYWNuw9
 2tJYrOWIDseMVCEfnqffpCWHxpkwt7Rp5wHXqFOfVMRMgBQsHh44JGcq6P9cBASznwqQ
 D5ckjeSHljyDGWi3xWPXqfIQVuEfL7KHGgEzm3XkaMF011CpSc2bwBguHS55ZeDS2sGV
 LvkN90E17Ke5skFpQHORNEy8mDlJ8DgHqXqwHiN3DKKVDLLKe1cKfE96QfH1eYOsCvFD
 zT9g==
X-Gm-Message-State: AOAM531z1+FchhDbwM9gL0HcXEvgqlitNP5QKUwXCYmzvhyCiWtI9hq1
 PHpoEN7832DlXFTVtyZrTz0kpnHrVeQrjw==
X-Google-Smtp-Source: ABdhPJwU55boKQUargCwj7uABbDFGkLI6m5Shju4RIwPqnobg7pzset1RPYMkQXjIR0a2azRJHembg==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr3649998wmb.101.1606321538289; 
 Wed, 25 Nov 2020 08:25:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a21sm4855187wmb.38.2020.11.25.08.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:25:37 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/3] mmu_notifier vs fs_reclaim lockdep annotations
Date: Wed, 25 Nov 2020 17:25:28 +0100
Message-Id: <20201125162532.1299794-1-daniel.vetter@ffwll.ch>
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

Just resending with the polish applied, no functional changes at all.

Previous versions.

v3: https://lore.kernel.org/dri-devel/20201120095445.1195585-1-daniel.vetter@ffwll.ch/
v2: https://lore.kernel.org/dri-devel/20200610194101.1668038-1-daniel.vetter@ffwll.ch/

Changes since v3:
- more acks/r-b
- typos in the kerneldoc fixed

Changes since v2:
- Now hopefully the bug that bombed xfs fixed.
- With unit-tests (that's the part I really wanted and never got to)
- might_alloc() helper thrown in for good.

I think if we have an ack/review from fs-devel this should be good to
land. Last version that landed in -mm (v2) broke xfs pretty badly.

Unfortuantely I don't have a working email from Qian anymore, who reported
the xfs issue. Maybe Dave Chinner instead?

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
