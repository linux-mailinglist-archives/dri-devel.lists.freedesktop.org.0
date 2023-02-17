Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EA669A42B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 04:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7293810E3E5;
	Fri, 17 Feb 2023 03:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1431310E3E5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:13:29 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1676603605;
 bh=LH/xXQeQJ9b7IeJuEOdjjtQYgBVktXb3iGO/ZdlJOBM=;
 h=From:Date:Subject:To:Cc:From;
 b=KXponZxzed7GavKW502p8mcvKO0FOWeQc0gC3KGhtKnTieSpIzxOGx4RcNwtP9q2V
 Da5TbqsKtmApQqJBCZIBKN4esnXw8ZRd0v6nH3jLrkXTze4QkoBxIvLEzwnSSAgAiO
 O5RBqn0q9mHHXy8IPdxDXuvwncX+BNeBmifOnfwk=
Date: Fri, 17 Feb 2023 03:13:22 +0000
Subject: [PATCH] dma-buf: make kobj_type structure constant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230217-kobj_type-dma-buf-v1-1-b84a3616522c@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANHw7mMC/x2N4QqCQBAGX0X2dwveCRW9SkTseZ+5ZafcZSjiu
 7f0cwaG2aggKwpdqo0yvlp0TAbuUFHbS3qANRqTr31Te3fi1xie9886geNbOMwdi4cc5SwuoiH
 rghRwyJLa3so0D4PJKaPT5T+63vb9B9H91jl4AAAA
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676603602; l=1123;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LH/xXQeQJ9b7IeJuEOdjjtQYgBVktXb3iGO/ZdlJOBM=;
 b=rrQjbf58nObPJhR+ovNy9W4vuE/7AyhUZbdHvb87cT7IzWpI5BE8fvDeBIg0KoH+pxoX+KbT4
 AUKjKj2iHEEA1TlXGTuWeExpnYQ4BbfzgcccPlk4wjhwdMr80F2E6uM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Cc: linaro-mm-sig@lists.linaro.org,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definition to prevent
modification at runtime.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index fbf725fae7c1..6cfbbf0720bd 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -112,7 +112,7 @@ static void dma_buf_sysfs_release(struct kobject *kobj)
 	kfree(sysfs_entry);
 }
 
-static struct kobj_type dma_buf_ktype = {
+static const struct kobj_type dma_buf_ktype = {
 	.sysfs_ops = &dma_buf_stats_sysfs_ops,
 	.release = dma_buf_sysfs_release,
 	.default_groups = dma_buf_stats_default_groups,

---
base-commit: 3ac88fa4605ec98e545fb3ad0154f575fda2de5f
change-id: 20230217-kobj_type-dma-buf-a2ea6a8a1de3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

