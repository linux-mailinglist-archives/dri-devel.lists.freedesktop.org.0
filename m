Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F52249C5D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB456E267;
	Wed, 19 Aug 2020 11:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3176E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CBE322D06;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=1sNGLXo9ZA3HXNAzNStAdZUhW9U41Rh3Ah+qraORED8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tsJsLql88Y/1AEn2ZXDiOpKhDnxy6ZK1VvV9RNezYwJlTCwxvdyuNHSwe6Z0G/iET
 DmxS4UKEtSqcUTrzBgTXmUIoHrbM9MgEJ/LlUTxq/1TI9HWjHzd41OFEj7Z+clnzqd
 2W2rQKu5MVjOmSkfS7W6QIzugan/dlj3Aib7Aflk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Eub5-DV; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 26/49] staging: hikey9xx/gpu: use default GEM_CMA fops
Date: Wed, 19 Aug 2020 13:45:54 +0200
Message-Id: <3defe6018773d9882fdf7daf70806cd23ca02cbd.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of implementing it at the code, use the default
methods from CMA helper

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index cede6ccc2dd5..44f7c15f386a 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -141,19 +141,7 @@ static int kirin_drm_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static const struct file_operations kirin_drm_fops = {
-	.owner		= THIS_MODULE,
-	.open		= drm_open,
-	.release	= drm_release,
-	.unlocked_ioctl	= drm_ioctl,
-#ifdef CONFIG_COMPAT
-	.compat_ioctl	= drm_compat_ioctl,
-#endif
-	.poll		= drm_poll,
-	.read		= drm_read,
-	.llseek		= no_llseek,
-	.mmap		= drm_gem_cma_mmap,
-};
+DEFINE_DRM_GEM_CMA_FOPS(kirin_drm_fops);
 
 static int kirin_gem_cma_dumb_create(struct drm_file *file,
 				     struct drm_device *dev,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
