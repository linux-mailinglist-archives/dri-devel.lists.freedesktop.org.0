Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33AA93AC3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A0310E0DC;
	Fri, 18 Apr 2025 16:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n77aTP7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4F210E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qjGXSx1JD0qUO/fOkygsz0xD5Rr+s3x5FD430OW/P4E=; b=n77aTP7M/dnO9PkBd8lyj+2KDs
 2W3SiQQCkkl9dQbO93F4FNktscKICqsSrm5mhy1jO6pxFWfrRnSiMu4T1yM+KVV6db+bBG/3CYiB5
 DRwex8lm5hxJ3bLdIcdjrDmKWnRTnIzcwTyQywBTben4x1+/ctr3UktpJoV9SXHxgC7vg3hXlMRT7
 e9QX7ryVOQGy7GAn9YXGLN7hfCvY3uJGO3+CwNALu4yblMP2vne8GapMNd5cPBQVFUKubnFiLhTn5
 UnpEWNPcMcy5/AxT5/VPx8Q/27kpR6oMx+a8Dqjzu6uvfAT+87Jy6X85pNYWvMGmktl3bgzr+wX1Q
 YjzoRpRQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u5oWj-001HMb-An; Fri, 18 Apr 2025 18:25:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/fdinfo: Protect against driver unbind
Date: Fri, 18 Apr 2025 17:25:12 +0100
Message-ID: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

If we unbind a driver from the PCI device with an active DRM client,
subsequent read of the fdinfo data associated with the file descriptor in
question will not end well.

Protect the path with a drm_dev_enter/exit() pair.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/drm_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c299cd94d3f7..cf2463090d3a 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -964,6 +964,10 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
 	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
@@ -983,6 +987,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
+
+	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
 
-- 
2.48.0

