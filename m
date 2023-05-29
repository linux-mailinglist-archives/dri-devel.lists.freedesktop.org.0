Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0294714A53
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36A910E0B8;
	Mon, 29 May 2023 13:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8010E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:28:10 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id 3curqP39nbOsk3curqbTYb; Mon, 29 May 2023 15:28:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1685366887;
 bh=8jgS5F8T526jeYM/4dx15aEEqAiDrCFfIRkSTI7woqQ=;
 h=From:To:Cc:Subject:Date;
 b=B1CYNAU5uH+zmapITZq52yzJm53tatvYvMoVN94JNW5oCzjeueGEMalpu1Bo+SQfb
 Y3kQLtegL41jHSu1+SQh9c7l4c949VyIPcCo+AOO/ayW6f33RmhiWBMBk4tSP8ViPM
 6ySkrEY3GBWekUIBp9+I67G6KwVC4WB8dRvocF6dKizbtpjjctbnlIq6fe09ijEoFI
 VYmhDpdU64IivgTJbognPSyAQBWqQjbGXkbD7OyAGhOh/J6zoLG2FEyGwGDmLaF3wm
 DTcVDAxIM4uLtzJeEnBU1LYwenDgu2AGtvVCBryFVg5RczCdduOArwj0b3Qrkr+IIb
 l66aNe9gB5F2w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 May 2023 15:28:07 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH] accel/ivpu: Use struct_size()
Date: Mon, 29 May 2023 15:28:04 +0200
Message-Id: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use struct_size() instead of hand-writing it. It is less verbose, more
robust and more informative.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/accel/ivpu/ivpu_job.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 3c6f1e16cf2f..0a09bba8da24 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -289,15 +289,13 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_job *job;
-	size_t buf_size;
 	int ret;
 
 	ret = ivpu_rpm_get(vdev);
 	if (ret < 0)
 		return NULL;
 
-	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
-	job = kzalloc(buf_size, GFP_KERNEL);
+	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
 	if (!job)
 		goto err_rpm_put;
 
-- 
2.34.1

