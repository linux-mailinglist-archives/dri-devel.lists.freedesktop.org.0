Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FF6C24E6B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578E010EB8D;
	Fri, 31 Oct 2025 12:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qsccBlWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041FC10EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:00:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2EAB461F87;
 Fri, 31 Oct 2025 12:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DA7C4CEF8;
 Fri, 31 Oct 2025 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761912035;
 bh=SDd4mBlkeUTWsBdfubSSDSqZM77oOIAxyGbT/JP1GFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qsccBlWMTPUGQq8CJm55Gja33/YFqV6mSTDFyl0r5aRN8rBkkJChCsiAjHINOPdOT
 E19EKKzKxtxwl5Q2IJ935/4Xxk8fwA2uEG7T//OOgug1BvcPQctfeQaKw3exIvIb/l
 hX8vFzYc8jq4oK+wHcm2GOr3L3IPDHCqTr6LKwLbUoTfEqN0iDCiHVCA+EaQlWvsoP
 AXV8iiJ6QMj+9n4h1FAAH06r/3MgLnTvPA15Vs8gYB88TfKZRFNup2r/JGHk+4KM6N
 VJNBjgjDOC8L9Q5iA9dZIR9ynNgj/5VGBu70ACLxg+CvofEvz1yiIfThqp64auvRTQ
 jbb8TpvQn+u8Q==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 1/2] drm/todo: Add section with task for GPU scheduler
Date: Fri, 31 Oct 2025 13:00:14 +0100
Message-ID: <20251031120014.248416-3-phasta@kernel.org>
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

The GPU scheduler has a great many problems and deserves its own TODO
section.

Add a section and a first task describing the problem of
drm_sched_resubmit_jobs() being deprecated without a successor.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 Documentation/gpu/todo.rst | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 9013ced318cb..835e799ddfe2 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -878,6 +878,37 @@ Contact: Christian König
 
 Level: Starter
 
+DRM GPU Scheduler
+=================
+
+Provide a universal successor for drm_sched_resubmit_jobs()
+------------------------------------------------------------
+
+drm_sched_resubmit_jobs() is deprecated. Main reason being that it leads to
+reinitializing dma_fences. See that function's docu for details. The better
+approach for valid resubmissions by amdgpu and Xe is (apparently) to figure out
+which job (and, through association: which entity) caused the hang. Then, the
+job's buffer data, together with all other jobs' buffer data currently in the
+same hardware ring, must be invalidated. This can for example be done by
+overwriting it. amdgpu currently determines which jobs are in the ring and need
+to be overwritten by keeping copies of the job. Xe obtains that information by
+directly accessing drm_sched's pending_list.
+
+Tasks:
+
+1. implement scheduler functionality through which the driver can obtain the
+   information which *broken* jobs are currently in the hardware ring.
+2. Such infrastructure would then typically be used in
+   drm_sched_backend_ops.timedout_job(). Document that.
+3. Port a driver as first user.
+3. Document the new alternative in the docu of deprecated
+   drm_sched_resubmit_jobs().
+
+Contact: Christian König <ckoenig.leichtzumerken@gmail.com>
+         Philipp Stanner <phasta@kernel.org>
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.49.0

