Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD16949346
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CF110E396;
	Tue,  6 Aug 2024 14:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JLNW/lID";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A77310E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722955146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CC3DtKRmGhH5AipOFzN3At/MyjZL4PoYSf7Q164ZoF4=;
 b=JLNW/lIDSxxu36TxSzsfLjGu8eqEj78qoUBIgoCJkVkH84cGuIb2RLPjM9W16E7dx0cLaf
 SzhvqXAFgHlCv2HG1avZHpu7epGksDvosSn7E9JlX7VFJYQtgdNveY1sZABXKPXXX/9hd6
 8nxprd2PUPt5yvIvi+TbxCcXULMGZSs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-VKTb-4gGPp-Q4c1Vx0bE7Q-1; Tue, 06 Aug 2024 10:39:05 -0400
X-MC-Unique: VKTb-4gGPp-Q4c1Vx0bE7Q-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ef2c1db4abso675981fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 07:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722955143; x=1723559943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CC3DtKRmGhH5AipOFzN3At/MyjZL4PoYSf7Q164ZoF4=;
 b=NMDJmrDIJZzCWhpukPGXQi+BUSD5yW8+jrZ3rhnGVk4P7w6wHlZCUWjuMKtfgTQ+gc
 Vlh3XFuSA75kLss/zIZ2bnIfQHjuOqiohtedG1ahZnEXuCmpNFkajX5fymn58ZpqeZWP
 K306oWjJfEw5BNyeg/QtSUT1cdtsB/Grb3OumWPKaTlGqvg1WsQraC+RCgZ+izCHwSth
 8UEuLgSVf2LbLd9sFsroxzLEJsvbw3OmdEPUgikrsSBIeNOWCe6XePjG545rCRm3bpf9
 RIF2femvnUjJRkvvhSYinReo2dWETqKKjDsuBmfPoeGbwRJWXFwNOIBPP36v/PKh5kJw
 dh2Q==
X-Gm-Message-State: AOJu0YxRnWHRhEOnNaCZ78G/3XTMMkLq+hOjIYtfHQfPIyYelK7zyo4b
 rY1sJBnrBMiyLerEGa77g54EzPKR7fC7ta3vsxKgSRfFBpaj5D9fo2RRLGb7u/Xkmc/Rlah2ldf
 cC+1a5R6f5at7L84FfwNvnFl4030nyY+8ub7H25Ok4FFoOcrIx+PGX2yXaf3okVM1nw==
X-Received: by 2002:a05:651c:210f:b0:2f1:5c3d:d12d with SMTP id
 38308e7fff4ca-2f15c3dd22amr70169491fa.0.1722955142758; 
 Tue, 06 Aug 2024 07:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5jPI0DyawGRqcu7Ni4RByPLJdoSZNjigyyhoympR0yL332lXRzkYzFAnZqne8pTm24btWHA==
X-Received: by 2002:a05:651c:210f:b0:2f1:5c3d:d12d with SMTP id
 38308e7fff4ca-2f15c3dd22amr70169271fa.0.1722955142133; 
 Tue, 06 Aug 2024 07:39:02 -0700 (PDT)
Received: from eisenberg.fritz.box
 (200116b82d165b009a97301f486032f8.dip.versatel-1u1.de.
 [2001:16b8:2d16:5b00:9a97:301f:4860:32f8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e08012d7sm214285905e9.22.2024.08.06.07.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 07:39:01 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
Date: Tue,  6 Aug 2024 16:38:55 +0200
Message-ID: <20240806143855.29789-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

drm_sched_job_init() has no control over how users allocate struct
drm_sched_job. Unfortunately, the function can also not set some struct
members such as job->sched.

This could theoretically lead to UB by users dereferencing the struct's
pointer members too early.

It is easier to debug such issues if these pointers are initialized to
NULL, so dereferencing them causes a NULL pointer exception.
Accordingly, drm_sched_entity_init() does precisely that and initializes
its struct with memset().

Initialize parameter "job" to 0 in drm_sched_job_init().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Hi all,
I did some experiments with the scheduler recently and am trying to make
the documentation and bits of the code more bullet proof.

I tested the performance of v6.11-rc2 with and without this memset() by
creating 1e6 jobs and found no performance regression.

Cheers,
P.
---
 drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 76969f9c59c2..1498ee3cbf39 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -936,6 +936,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		return -EINVAL;
 	}
 
+	/*
+	 * We don't know for sure how the user has allocated. Thus, zero the
+	 * struct so that unallowed (i.e., too early) usage of pointers that
+	 * this function does not set is guaranteed to lead to a NULL pointer
+	 * exception instead of UB.
+	 */
+	memset(job, 0, sizeof(*job));
+
 	job->entity = entity;
 	job->credits = credits;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
-- 
2.45.2

