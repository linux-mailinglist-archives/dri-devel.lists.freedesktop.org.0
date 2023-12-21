Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F481B73F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 14:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342E910E6B7;
	Thu, 21 Dec 2023 13:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Thu, 21 Dec 2023 10:50:32 UTC
Received: from forward203a.mail.yandex.net (forward203a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3513010E696;
 Thu, 21 Dec 2023 10:50:32 +0000 (UTC)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d101])
 by forward203a.mail.yandex.net (Yandex) with ESMTP id ABA616B1CF;
 Thu, 21 Dec 2023 13:43:53 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-39.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-39.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1d:3e29:0:640:6566:0])
 by forward101a.mail.yandex.net (Yandex) with ESMTP id 2052A608FC;
 Thu, 21 Dec 2023 13:43:48 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-39.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id lhLioBTTsqM0-Z4CLrQXm; 
 Thu, 21 Dec 2023 13:43:47 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1703155427; bh=KxttoY911M9pQ6nQTQMh2QMpx7SWhFqshPKl0r8C8w4=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=EQWEIWkfhP4quQgbPKMu9QrPVVOWh7KeMiBk7EgCwXCIe7jbesrzQJhNxAGndYdif
 vAMVx4g/T8OZAKOJkzejRGZJFe+oMZ2s/+Z6kaxF9tBBuAnz4dYp2g51NsUgTR+7FH
 FVTzCmTG392M7ZJY8pqB1DsTKL6/l98L7E1e2H8Q=
Authentication-Results: mail-nwsmtp-smtp-production-main-39.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/nouveau: svm: fix kvcalloc() arguments order
Date: Thu, 21 Dec 2023 13:40:49 +0300
Message-ID: <20231221104051.23680-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Dec 2023 13:22:39 +0000
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
Cc: nouveau@lists.freedesktop.org, Dmitry Antipov <dmantipov@yandex.ru>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When compiling with gcc version 14.0.0 20231220 (experimental)
and W=1, I've noticed the following warning:

drivers/gpu/drm/nouveau/nouveau_svm.c: In function 'nouveau_svm_fault_buffer_ctor':
drivers/gpu/drm/nouveau/nouveau_svm.c:1014:40: warning: 'kvcalloc' sizes specified with
'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
 1014 |         buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
      |                                        ^

Since 'n' and 'size' arguments of 'kvcalloc()' are multiplied to
calculate the final size, their actual order doesn't affect the
result and so this is not a bug. But it's still worth to fix it.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index cc03e0c22ff3..5e4565c5011a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -1011,7 +1011,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
 	if (ret)
 		return ret;
 
-	buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
+	buffer->fault = kvcalloc(buffer->entries, sizeof(*buffer->fault), GFP_KERNEL);
 	if (!buffer->fault)
 		return -ENOMEM;
 
-- 
2.43.0

