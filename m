Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAPaJpo7lmkDcwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7142115A995
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29C10E323;
	Wed, 18 Feb 2026 22:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nTInkkkb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6710E323
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 22:22:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 589396132F;
 Wed, 18 Feb 2026 22:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2EEC19421;
 Wed, 18 Feb 2026 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771453332;
 bh=kczQf5pveMrT0v9OOfXTflG7Z8dLFCGJWHb4Bpgb2OU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nTInkkkbchdY2PxOwa8QHmu7TRmxC2KzPod/2wMz3GlOKzGhj0GBT+sqGvMlCK+Ti
 At4yoOYbjMm7KYIGplcHVUDN6UsvIWarUzKwaURgbk+HPWRGxFqvV35BuC+WaVEXjM
 VghcUoyh9Aeki3KvKIIuZqXmRZdfrV68CXENucMVYJWjAXo+K2BFft/mw6QCItG7Gw
 Ud32b25nIYWkjt7PuplVLNyLo5A/7F8lO4+PKF+nlyM6zEBvw7qela8hJsNkiTqS9J
 8XLLF823TigOf9VJ5vCd1whC9X59OkM00yGBKgFc4CGLnQE37VRt6uvaCgYevNycLy
 dSaIsY3m39w9A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 18 Feb 2026 16:21:55 -0600
Subject: [PATCH 1/3] accel: ethosu: Fix job submit error clean-up refcount
 underflows
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-ethos-fixes-v1-1-be3fa3ea9a30@kernel.org>
References: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
In-Reply-To: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Anders Roxell <anders.roxell@linaro.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomeu@tomeuvizoso.net,m:anders.roxell@linaro.org,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7142115A995
X-Rspamd-Action: no action

If the job submit fails before adding the job to the scheduler queue
such as when the GEM buffer bounds checks fail, then doing a
ethosu_job_put() results in a pm_runtime_put_autosuspend() without the
corresponding pm_runtime_resume_and_get(). The dma_fence_put()'s are
also unnecessary, but seem to be harmless.

Split the ethosu_job_cleanup() function into 2 parts for the before
and after the job is queued.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_job.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 26e7a2f64d71..70a144803b09 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -143,23 +143,29 @@ static int ethosu_job_push(struct ethosu_job *job)
 	return ret;
 }
 
+static void ethosu_job_err_cleanup(struct ethosu_job *job)
+{
+	unsigned int i;
+
+	for (i = 0; i < job->region_cnt; i++)
+		drm_gem_object_put(job->region_bo[i]);
+
+	drm_gem_object_put(job->cmd_bo);
+
+	kfree(job);
+}
+
 static void ethosu_job_cleanup(struct kref *ref)
 {
 	struct ethosu_job *job = container_of(ref, struct ethosu_job,
 						refcount);
-	unsigned int i;
 
 	pm_runtime_put_autosuspend(job->dev->base.dev);
 
 	dma_fence_put(job->done_fence);
 	dma_fence_put(job->inference_done_fence);
 
-	for (i = 0; i < job->region_cnt; i++)
-		drm_gem_object_put(job->region_bo[i]);
-
-	drm_gem_object_put(job->cmd_bo);
-
-	kfree(job);
+	ethosu_job_err_cleanup(job);
 }
 
 static void ethosu_job_put(struct ethosu_job *job)
@@ -454,12 +460,16 @@ static int ethosu_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 		}
 	}
 	ret = ethosu_job_push(ejob);
+	if (!ret) {
+		ethosu_job_put(ejob);
+		return 0;
+	}
 
 out_cleanup_job:
 	if (ret)
 		drm_sched_job_cleanup(&ejob->base);
 out_put_job:
-	ethosu_job_put(ejob);
+	ethosu_job_err_cleanup(ejob);
 
 	return ret;
 }

-- 
2.51.0

