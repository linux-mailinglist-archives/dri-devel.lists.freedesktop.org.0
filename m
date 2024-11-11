Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28E9C3587
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 01:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855DD10E3F3;
	Mon, 11 Nov 2024 00:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mhwow0Ij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABA610E3F1;
 Mon, 11 Nov 2024 00:53:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E62E1A4136A;
 Mon, 11 Nov 2024 00:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20823C4CECD;
 Mon, 11 Nov 2024 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731286382;
 bh=C7U10fwANKiFBMRI52JouNQIj2KlR6BzvPBPUClWPD8=;
 h=From:To:Cc:Subject:Date:From;
 b=Mhwow0Ij212yflZSULWSomZb5GiK6f/567/Rs9y8BH80zSCwtq8/JiesbTlKioDV5
 dN3UWOmmhGAyzlNviW3r5IZur7x0p26gKwTOaYsXGa6W14FKWbFRDKZk+nQLqdhvvP
 fjtf58j9qlQTmZ/q8xMI00zmbe2w4ygw7eC6iZCkzG1BW/IWPTyJhAsPlmJpLnbwFA
 vSKY52joO0rnRa+/oXCQ28XF6ajIdH6uiDynOq1XEH4UvB/oXFGprojnAk1OuQM8L6
 Ms18C5x6dpX3aENekQwApc+LJqmvr2kjCneGrBKsmJyln0JHrryBExKzk7Mjfqb9gC
 g8sqf8Il1YFpw==
From: cel@kernel.org
To: <stable@vger.kernel.org>
Cc: yukuai1@huaweicloud.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, hughd@google.com,
 willy@infradead.org, gregkh@linuxfoundation.org, sashal@kernel.org,
 srinivasan.shanmugam@amd.com, chiahsuan.chung@amd.com, mingo@kernel.org,
 mgorman@techsingularity.net, yukuai3@huawei.com, chengming.zhou@linux.dev,
 zhangpeng.00@bytedance.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 Chuck Lever <chuck.lever@oracle.com>
Subject: [RFC PATCH 0/6 6.6] Address rename/readdir bugs in fs/libfs.c
Date: Sun, 10 Nov 2024 19:52:36 -0500
Message-ID: <20241111005242.34654-1-cel@kernel.org>
X-Mailer: git-send-email 2.47.0
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

From: Chuck Lever <chuck.lever@oracle.com>

Address several bugs in v6.6's libfs/shmemfs, including
CVE-2024-46701.

Link: https://lore.kernel.org/stable/976C0DD5-4337-4C7D-92C6-A38C2EC335A4@oracle.com/T/#me685f54ac17ea1e39265dd5f1bb1f173c557a564

I'm still running the usual set of regression tests, but so far this
set looks stable. I'm interested in hearing review comments and test
results.

Branch for testing: https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/?h=nfsd-6.6.y

Chuck Lever (5):
  libfs: Define a minimum directory offset
  libfs: Add simple_offset_empty()
  libfs: Fix simple_offset_rename_exchange()
  libfs: Add simple_offset_rename() API
  shmem: Fix shmem_rename2()

yangerkun (1):
  libfs: fix infinite directory reads for offset dir

 fs/libfs.c         | 135 +++++++++++++++++++++++++++++++++++++--------
 include/linux/fs.h |   3 +
 mm/shmem.c         |   7 +--
 3 files changed, 119 insertions(+), 26 deletions(-)

-- 
2.47.0

