Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823863C299F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4066EA65;
	Fri,  9 Jul 2021 19:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D34E6EA65
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l7so12628294wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqKuapy9SSK1BNEtt7I3vm19kWoM0u9dRsDQpIz91YE=;
 b=KZ/5ng4lI18PjBq8JWbfWGmgy39CNUaVOfbHQdGrs7D2XZlurUnpamIntEfKPvAzhP
 RgfC+5X7r6yH1h0txtO9UbokDtVLQL182MHeLSGXZgnAF7A6IeoV1wQn6McNWmdVRC9U
 JfuFaDx7n2hBIKPGKKQImW9XWx3dzjpmoZxSARp7ErQv1RyhWrapjjvE39ar0PiS2eCQ
 e+xTCBlbfdpuS8S5vhEeM/KwvEw1l8JFCcdHwMEZZBoQeMteJrSbq8g606GVyl0DXuxa
 9mLFrdJZzLOIomlCg2NCWr4pqSjDoIjlNvoWitRwHSJLdQlRec3rujF/dwr4/1dlIf6c
 q/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqKuapy9SSK1BNEtt7I3vm19kWoM0u9dRsDQpIz91YE=;
 b=X25rZHqoGo22/0lzy0QXJ+BEDHIing0UPl0jrJk/SoIqZCe0LfZ28q6ikjzm7hFpGe
 G9QUS91i1P3KH8nscapP69or7PuzV824Ot0+embDCa/u2z0ds2e12GGAhYGlFND3fhim
 FZAy9Rfe5wtYY0zUWeL4ZLVeWYBOs5eUbQRQdEyi34A7hrZCDxh9QSiGN5y3Y4F+IDbj
 Qw0Ni4e/rVyazfewT2wM8OlCzhba4+8lpht+ZeKpKTF2pb/LFe/tZUPf0x30eQDlZmiP
 +HyQzVHczBx2UUXts9X9/gSIEn7ebd8aU/oWyfCCV+11cIzaAEG/45MskM479NwwPon3
 9fRg==
X-Gm-Message-State: AOAM533+8EeKl8s3HauVwDDBTsiR4PRz087fD6SMnJoMRTKd5lOUu1MA
 LK8fWL9Xq39VwCq7JxRsdT0=
X-Google-Smtp-Source: ABdhPJzpKOb3/gITc4oC81kG3kO9WX6j6UMKXAlwMta+4QKqXBJFjpGOWJAzVj4CkvL/baoaLG9ffw==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr43710096wrt.425.1625858963283; 
 Fri, 09 Jul 2021 12:29:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c8sm6084190wri.91.2021.07.09.12.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 03/14] gpu: host1x: Add job release callback
Date: Fri,  9 Jul 2021 21:31:35 +0200
Message-Id: <20210709193146.2859516-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a callback field to the job structure, to be called just before
the job is to be freed. This allows the job's submitter to clean
up any of its own state, like decrement runtime PM refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 3 +++
 include/linux/host1x.h   | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 8f59b34672c2..09097e19c0d0 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -79,6 +79,9 @@ static void job_free(struct kref *ref)
 {
 	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
 
+	if (job->release)
+		job->release(job);
+
 	if (job->waiter)
 		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
 				    job->waiter, false);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 5fc12db94ca1..7eecb0aa2519 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -269,6 +269,10 @@ struct host1x_job {
 
 	/* Fast-forward syncpoint increments on job timeout */
 	bool syncpt_recovery;
+
+	/* Callback called when job is freed */
+	void (*release)(struct host1x_job *job);
+	void *user_data;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.32.0

