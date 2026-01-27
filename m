Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBnxFCmXeGkWrQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840A93138
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 11:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6BE10E536;
	Tue, 27 Jan 2026 10:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NJW/8eJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043D10E530;
 Tue, 27 Jan 2026 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769510690;
 bh=qYSt9bUzQj5PyLabpQbUCQOve2lblO05FC7MGh9qImw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NJW/8eJ/0fjsVjkD9hNxyNMHFzxPA7QiELRnVSJ/tBEgwal3OLvg5UWufex+uMvmy
 +A+jaYPaDN4FDmi9ILRED9athTHjU4tOhmVaQgeJOtqLYmERrmyK7RGVQw3zsHGzUr
 wmo3j+GKT3H2AUHuQHHRGs3vcq2ipDGPhyU8/2SrB48dGXXbZBj7GX806vR8GNDE3J
 Cy0s3W4BQN9k8y1e+XBul4S8QX+9gLLESWvuTh/VMA1vMwlQ2e59IRibNpe5zw46/e
 ou/ERa3qbe2Loa9C2GUFQDmS1OdQnnVWyDY29Nt86Gd73Izcplr0mM3HpKPoD2trJX
 WyZwxbkw0mung==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A56917E0DB7;
 Tue, 27 Jan 2026 11:44:46 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dmitry.baryshkov@oss.qualcomm.com,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/7] drm/ci: disable rebase when pulling *-external-fixes
Date: Tue, 27 Jan 2026 16:14:02 +0530
Message-ID: <20260127104406.200505-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127104406.200505-1-vignesh.raman@collabora.com>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 2840A93138
X-Rspamd-Action: no action

CI jobs were rebasing the branch-under-test onto *-external-fixes,
causing conflicts.

Remove the global pull.rebase setting and disable rebase when pulling
*-external-fixes so they are merged instead.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 5485ea756382..d00d549cbd9c 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -3,9 +3,6 @@
 
 set -ex
 
-# Clean up stale rebases that GitLab might not have removed when reusing a checkout dir
-rm -rf .git/rebase-apply
-
 . .gitlab-ci/container/container_pre_build.sh
 
 # libssl-dev was uninstalled because it was considered an ephemeral package
@@ -62,25 +59,24 @@ export PATH=$NEWPATH:$PATH
 
 git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
-git config --global pull.rebase true
 
 # cleanup git state on the worker
-rm -rf .git/rebase-merge
+rm -rf .git/rebase-merge .git/rebase-apply
 
 # Try to merge fixes from target repo
 if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
-    git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
+    git pull --no-rebase ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
 fi
 
 # Try to merge fixes from local repo if this isn't a merge request
 # otherwise try merging the fixes from the merge target
 if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
     if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
-        git pull origin ${TARGET_BRANCH}-external-fixes
+        git pull --no-rebase origin ${TARGET_BRANCH}-external-fixes
     fi
 else
     if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
-        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
+        git pull --no-rebase ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
     fi
 fi
 
-- 
2.47.3

