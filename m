Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F360A3A29CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FE76ECDA;
	Thu, 10 Jun 2021 11:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910EC6ECD4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cVctv2TTgrLvsdfgip24GwXFvfPbehqsdeQx892pkas=; b=gC+yiNMWO6JYBZwM4NQ0THmYhk
 dWFJuVRfdaLM9Qz9tFJnD1r13ybjgwz4nTaXRvlyAf/JjLjn18f8NgEZZfRquEYs9zzv5k8HjER4J
 eWYL62PFiHd2uMwNpYALVFodOoP62CBDdU0SNmzfPfle9gA4SeuP7fa4oD6zekuylVgdcq4x5okTh
 YlBz3zYmfTv1Sq6qSpSmEl0v8dBfG5/OLmK4YY/YTfgNpFR4yCUJmaUs6lpYi55Kan4ppMMcT/KqN
 AKPtu7E254p9cPv/w+BJoEV/AIXN03tLy2K22LoAjIwfUXdVHRWvkI3//UW2liRT3zGULGev883xG
 AHcBSxqw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lrIUs-0001s7-SP; Thu, 10 Jun 2021 14:05:14 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v7 03/15] gpu: host1x: Add job release callback
Date: Thu, 10 Jun 2021 14:04:44 +0300
Message-Id: <20210610110456.3692391-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a callback field to the job structure, to be called just before
the job is to be freed. This allows the job's submitter to clean
up any of its own state, like decrement runtime PM refcounts.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
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
2.30.1

