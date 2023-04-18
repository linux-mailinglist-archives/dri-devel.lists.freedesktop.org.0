Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83ED6E6CDF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 21:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E79310E85F;
	Tue, 18 Apr 2023 19:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363810E85F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681845655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
 b=SEJPcsAflSfXP88Lt9fb57YukdDbEswjw1lGuKpACS5WyAxg0NBNTljoFiGj/vv/dAGvG9
 bC4WzVzxisL3tnNpi4w99QF8zVWcU3cXmA8L4JJOdkuZfZS5BExFrt+ii52s2XcBnfGW5O
 xTgRB9uwuE+7NeVoeakDW11IHC3YHAI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-7lqq48ClNzG9PSdpF4edDQ-1; Tue, 18 Apr 2023 15:20:54 -0400
X-MC-Unique: 7lqq48ClNzG9PSdpF4edDQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 l20-20020a05622a051400b003e6d92a606bso16315224qtx.14
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681845654; x=1684437654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aai1WHo4fg1sxKcLX3kD4BGAw1PP+pR+m3nWfdfcZTU=;
 b=fx/GZBbJRIAyVamfSss8JkrMHALk9GBnCepG5ceUcI5eRkpIBtxCWw0JMFrjFFUS2u
 7tmDXyDL3P9QxdEgWr67YWqFAdxcZ9X9o81uJvxvvwdWPqiHjbZnJH8UnlpAIQdyH7o6
 YU4IPOs6dqz+YhZzMWuMRwHcxKrODMKu7VTvAKZz64s/cBg1M91rIB74YVYX0F+ORG1G
 R7lRkQdZN2/Swr5Ti7RF0D/87rgpSYXPVqL8QlMOizS5FZF84MfQEEJYtZM617nck7Sn
 CgoNBDMU0LIrwhhAOq3H7rFojDu/tjVHDVTF8NaLuwToz6caSM9OFbITopX8IUrsyNBT
 tYgQ==
X-Gm-Message-State: AAQBX9fWDzWlYaLIvSm11aPZpHR5JtLwEdoDtBfIoIc995mjtGtI80yP
 nyNRGuIjibNJ/B+/IyVqo1oHzX3gr2lnplJMhHMVh9z+fEDy1CJaW2Himt9OuowV+8lw/7iz8rN
 u3aayx0wPS+QUXcROyuXh7jGT2WZ+
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id
 z16-20020a056214041000b0056c13ccd21fmr25855300qvx.50.1681845654141; 
 Tue, 18 Apr 2023 12:20:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFUZ7JQR9xbohdXv2IbnkoRfbUviweblbnyFfC0N6wmvnsGUN3xBE3c2IZkXBZ0ZSdmAywfQ==
X-Received: by 2002:a05:6214:410:b0:56c:13cc:d21f with SMTP id
 z16-20020a056214041000b0056c13ccd21fmr25855272qvx.50.1681845653894; 
 Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 7-20020a370c07000000b0074df3f7e14esm1709609qkm.67.2023.04.18.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 12:20:53 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: quic_jhugo@quicinc.com, ogabbay@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, jacek.lawrynowicz@linux.intel.com,
 quic_carlv@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_pkanojiy@quicinc.com
Subject: [PATCH] accel/qaic: initialize ret variable to 0
Date: Tue, 18 Apr 2023 15:20:46 -0400
Message-Id: <20230418192046.3235870-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang static analysis reports
drivers/accel/qaic/qaic_data.c:610:2: warning: Undefined or garbage
  value returned to caller [core.uninitialized.UndefReturn]
        return ret;
        ^~~~~~~~~~

The ret variable is only set some of the time but is always returned.
So initialize ret to 0.

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/qaic/qaic_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index c0a574cd1b35..b46a16fb3080 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -591,7 +591,7 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 	struct qaic_bo *bo = to_qaic_bo(obj);
 	unsigned long offset = 0;
 	struct scatterlist *sg;
-	int ret;
+	int ret = 0;
 
 	if (obj->import_attach)
 		return -EINVAL;
-- 
2.27.0

