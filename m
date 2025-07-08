Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9585AFCA0C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2010E60C;
	Tue,  8 Jul 2025 12:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="LVVDpAkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA75C10E60C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=333UjN4eHKc0RjjTsjqzayuh98B9JZxJ0covjA32MJ4=; b=LVVDpAkz/KbiFXS6tXhta7ZwYn
 nw4od5X5ZYtmrxw/bokv4w1p11SL4+Gc7cvaHYw64PkIDSKN5N7DuOA/8GTk+UP9IhmsNdzm6Qv4X
 c4/CaHnJfN1/a6O6mRiOBi7Sb3vn7AbViN/rIB1jmks1eU4RKCsWfvFUpGPHhsyFV6Dm0YbHBT6z1
 yEqx68ZE53PsyFGFsF9mUyTL/KVKB5cOHEp4ARBD65DIjbfpJNJanWRzsDW9XYqgPBbn6pUxMOK/Z
 3hZpCaGRuPH+J46lWlOjF+QQJWZjaMYwOK01KFAHJ6hz52MnLYQUJyJmCJLRxa+E7kUZGtaqfi5JQ
 hcH0ENhA==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 (helo=senjougahara.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uZ73d-008RZp-33;
 Tue, 08 Jul 2025 15:04:22 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Tue, 08 Jul 2025 21:03:49 +0900
Subject: [PATCH] dma_buf/sync_file: Enable signaling for fences when
 querying status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-syncfile-enable-signaling-v1-1-9f6e6cd9fcda@nvidia.com>
X-B4-Tracking: v=1; b=H4sIACQJbWgC/x2MSQqAMAwAvyI5W6iK61fEQ6xpDUiUBkQR/27xN
 Mxh5gGlyKQwZA9EOll5lyRFnoFbUQIZXpJDacvatrYzeovzvJEhwTlBOQhuLMFg31fovC+6xkL
 qj0ier/89Tu/7Aft3EkZrAAAA
X-Change-ID: 20250708-syncfile-enable-signaling-a993acff1860
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

dma_fence_get_status is not guaranteed to return valid information
on if the fence has been signaled or not if SW signaling has not
been enabled for the fence. To ensure valid information is reported,
enable SW signaling for fences before getting their status.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/dma-buf/sync_file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 747e377fb95417ddd506b528618a4288bea9d459..a6fd1d14dde155561b9fd2c07e6aa20dc9863a8d 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -271,6 +271,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 	const char __rcu *timeline;
 	const char __rcu *driver;
 
+	dma_fence_enable_sw_signaling(fence);
+
 	rcu_read_lock();
 
 	driver = dma_fence_driver_name(fence);
@@ -320,6 +322,7 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	 * info->num_fences.
 	 */
 	if (!info.num_fences) {
+		dma_fence_enable_sw_signaling(sync_file->fence);
 		info.status = dma_fence_get_status(sync_file->fence);
 		goto no_fences;
 	} else {

---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250708-syncfile-enable-signaling-a993acff1860

