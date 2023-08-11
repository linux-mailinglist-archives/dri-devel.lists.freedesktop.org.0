Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CECC7784C0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 03:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9249710E51C;
	Fri, 11 Aug 2023 01:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B1E10E51C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 01:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691716004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gQmfJqg0U6QQ+P0YAxBqdqzWanoylJrwE4wgvssrPN0=;
 b=ab9wDb+nI9B+r+kk88iEq+DkThoIJa9Plb0FDQ1mhKBPH2ZtA/LMtKt/p+IveYaHVVI1Em
 SGqNonnVOuNBfvE/8/mE3/u7eEiLzYw1B8CHBX1/TkTTQh7u24LXCRLvLQXC1BY48wvbt+
 vldISO4/cARgjsvSZJ5NGszpkiw4fY4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-vtCpM3tHPbmg0FsGMRCjGg-1; Thu, 10 Aug 2023 21:06:42 -0400
X-MC-Unique: vtCpM3tHPbmg0FsGMRCjGg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso103466166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 18:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691716001; x=1692320801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gQmfJqg0U6QQ+P0YAxBqdqzWanoylJrwE4wgvssrPN0=;
 b=C4FAT8Yf8e2rpS0TDI97rh6VFeCXZC/Kq9fyp+y5gnYbIwtOz6AwIMWFzNuaM0dmsI
 g+ZRqrftKtx7cF0X/u5EIFCHoyfxnrh6QDpA4hovbIbJjC3wWuKapXSRuxAD6K9boman
 geF+QDwWuwG5VkvBeXzpK6IeV8hcQWLelxeG61Fn1xMPtC95lq4Ue5gpZnZYqp+DhsHm
 bHu/WWOmisMZB1wRevapvZaKGy00bj+fX98PvgY3EYkNLex794HWD+dGiR4kOG7gts+l
 uBjgmx+zVsgsOuoWSSGchcx0E6MAarrsJxyIbwZam8ji73RdF/XKHOup6uRLqtYZK0o5
 qOZg==
X-Gm-Message-State: AOJu0Ywl1ykdO5LtEtnWdukjKyGl5atpIqjSEbIbW3ST/Tr8TVXdcFcH
 SKPz1pAW5QDoKDbOzFY6ZWaAgdAErBC1SWIkpDhh+9AnEBHdFqR3lAgO1nyTSmlKZ+xJt/lyIhf
 gbEwviawTBKH9Demv5OPkzgv44VVm
X-Received: by 2002:a17:906:3018:b0:99b:cf4f:9090 with SMTP id
 24-20020a170906301800b0099bcf4f9090mr359480ejz.66.1691716001244; 
 Thu, 10 Aug 2023 18:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8hEv/JCXaBemmNkSvUqVC1g6HHGKPUTY+1z6MfNCAMXoMW8l8cQizAk4W/hHLEOEqs/Kf4A==
X-Received: by 2002:a17:906:3018:b0:99b:cf4f:9090 with SMTP id
 24-20020a170906301800b0099bcf4f9090mr359470ejz.66.1691716000904; 
 Thu, 10 Aug 2023 18:06:40 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a170906110b00b00977cad140a8sm1572625eja.218.2023.08.10.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 18:06:40 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com,
	faith.ekstrand@collabora.com
Subject: [PATCH drm-misc-next] drm/nouveau: sched: avoid job races between
 entities
Date: Fri, 11 Aug 2023 03:06:25 +0200
Message-ID: <20230811010632.2473-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: matthew.brost@intel.com, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a sched job depends on a dma-fence from a job from the same GPU
scheduler instance, but a different scheduler entity, the GPU scheduler
does only wait for the particular job to be scheduled, rather than for
the job to fully complete. This is due to the GPU scheduler assuming
that there is a scheduler instance per ring. However, the current
implementation, in order to avoid arbitrary amounts of kthreads, has a
single scheduler instance while scheduler entities represent rings.

As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all
out-fences in order to force the scheduler to wait for full job
completion for dependent jobs from different entities and same scheduler
instance.

There is some work in progress [1] to address the issues of firmware
schedulers; once it is in-tree the scheduler topology in Nouveau should
be re-worked accordingly.

[1] https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@intel.com/

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3424a1bf6af3..88217185e0f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -292,6 +292,28 @@ nouveau_job_submit(struct nouveau_job *job)
 	if (job->sync)
 		done_fence = dma_fence_get(job->done_fence);
 
+	/* If a sched job depends on a dma-fence from a job from the same GPU
+	 * scheduler instance, but a different scheduler entity, the GPU
+	 * scheduler does only wait for the particular job to be scheduled,
+	 * rather than for the job to fully complete. This is due to the GPU
+	 * scheduler assuming that there is a scheduler instance per ring.
+	 * However, the current implementation, in order to avoid arbitrary
+	 * amounts of kthreads, has a single scheduler instance while scheduler
+	 * entities represent rings.
+	 *
+	 * As a workaround, set the DRM_SCHED_FENCE_DONT_PIPELINE for all
+	 * out-fences in order to force the scheduler to wait for full job
+	 * completion for dependent jobs from different entities and same
+	 * scheduler instance.
+	 *
+	 * There is some work in progress [1] to address the issues of firmware
+	 * schedulers; once it is in-tree the scheduler topology in Nouveau
+	 * should be re-worked accordingly.
+	 *
+	 * [1] https://lore.kernel.org/dri-devel/20230801205103.627779-1-matthew.brost@intel.com/
+	 */
+	set_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &job->done_fence->flags);
+
 	if (job->ops->armed_submit)
 		job->ops->armed_submit(job);
 

base-commit: 68132cc6d1bcbc78ade524c6c6c226de42139f0e
-- 
2.41.0

