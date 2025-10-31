Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78AC24E68
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B4C10EB87;
	Fri, 31 Oct 2025 12:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vEUTepPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6BF10EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:00:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 850A4450F9;
 Fri, 31 Oct 2025 12:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5CFC4CEFB;
 Fri, 31 Oct 2025 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761912038;
 bh=5Y2K69DPuTxufr2/30uL7COrThaw9oWJXaibDgLkv3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vEUTepPwhkQmpxfK8CEXqfwhXgYhIcPm7nNen+UsWtqrisuiz5Peyp5WXllkTGtLs
 J4Jc4g7fyHIII5OnqUtgmB/NFzNUsXHDAJuNR0PYwGMIiEogZz62hWd+xR42vFW02A
 HJbM29Zgy8cdeC3XtjFVcNCzum2H87VpT3TK/vA+7obu12IZgwJVD1mlqt8KyVisXJ
 wje2R340p3eZNFfpUfDsVdYqtRJzxgY65Me5QsT5tkygf3+zUxV+2CTHMHybHAK53V
 vMvkJNaaC4lwGb8NO1npdlC1mGOGwAntkZBZ0+BuGwum2RuqSrQvYxaMjuuRzV+REP
 Dbk+q+MujeA/g==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] drm/todo: Add entry for unlocked drm/sched rq readers
Date: Fri, 31 Oct 2025 13:00:15 +0100
Message-ID: <20251031120014.248416-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251031120014.248416-2-phasta@kernel.org>
References: <20251031120014.248416-2-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Runqueues are currently almost everywhere being read unlocked in
drm/sched. At XDC 2025, the assembled developers were unsure whether
that's legal and whether it can be fixed. Someone should find out.

Add a todo entry for the unlocked runqueue reader problem.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 835e799ddfe2..7d7e9e3741e9 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -909,6 +909,20 @@ Contact: Christian König <ckoenig.leichtzumerken@gmail.com>
 
 Level: Advanced
 
+Add locking for runqueues
+-------------------------
+
+There is an old FIXME by Sima in include/drm/gpu_scheduler.h. It details that
+struct drm_sched_rq is read at many places without any locks, not even with a
+READ_ONCE. At XDC 2025 no one could really tell why that is the case, whether
+locks are needed and whether they could be added. (But for real, that should
+probably be locked!). Check whether it's possible to add locks everywhere, and
+do so if yes.
+
+Contact: Philipp Stanner <phasta@kernel.org>
+
+Level: Intermediate
+
 Outside DRM
 ===========
 
-- 
2.49.0

