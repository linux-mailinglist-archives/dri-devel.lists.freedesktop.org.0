Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3BE74E564
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 05:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E79710E2F5;
	Tue, 11 Jul 2023 03:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EB10E2F5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 03:39:06 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R0RS74gypzBJFS7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 11:39:03 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689046743; x=1691638744; bh=yZynzVUlk5mpXs9aHjvK7lG63wT
 C8Y75Je7Bu13k+DQ=; b=qBHnLJwW4VAlI7YyZq6Nr7+t6mUAn+OEotJDeMTpbLe
 gTtOGOlY/iG/2e0mVY3BMr5MTCuYqcya7b3VwEqnbwrlXHW8a9MpNRjS79XhJ56K
 GkyGe7NOxlcKcHbxh7VDQw9L9EcidqssvQ0PHgmcr35bEg9MMNjc/DXe4k/ovZ+b
 n1A2lZ8Yc1kfbdMfub1iN0AaaFVPdNNMN1PD6TxJCJJP+67q4FGa23890t+68kji
 BJEQE5TX52yzDV5rrsw0LXsBdEtlHvy3HPXcoXtxivQVZbkJ5Kj2Dz93kTrJHAEK
 VNM6kEQDr2Xyera+RseCEVC4DYoP2eIsctt1U0CK5tA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9aeubjQOSbK2 for <dri-devel@lists.freedesktop.org>;
 Tue, 11 Jul 2023 11:39:03 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R0RS72jLFzBJ8kq;
 Tue, 11 Jul 2023 11:39:03 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 11 Jul 2023 11:39:03 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau/flcn/msgq: Move assignment outside if condition
In-Reply-To: <20230711033745.79190-1-xujianghui@cdjrlc.com>
References: <20230711033745.79190-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <7ad788a6cf70f338a32690953531b439@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following checkpatch errors:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c 
b/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
index 16b246fda666..52af200b45bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgq.c
@@ -203,7 +203,8 @@ nvkm_falcon_msgq_new(struct nvkm_falcon_qmgr *qmgr, 
const char *name,
  {
      struct nvkm_falcon_msgq *msgq = *pmsgq;

-    if (!(msgq = *pmsgq = kzalloc(sizeof(*msgq), GFP_KERNEL)))
+    msgq = *pmsgq = kzalloc(sizeof(*msgq), GFP_KERNEL);
+    if (!msgq)
          return -ENOMEM;

      msgq->qmgr = qmgr;
