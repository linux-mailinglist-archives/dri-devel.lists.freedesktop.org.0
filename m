Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546950A088
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22AA10E717;
	Thu, 21 Apr 2022 13:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8393E10E722
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650546922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
 b=iXPr8Mg1EYCir3yYRpwdqvzOdycyDh2lYfzX3A6vBNBtBy211R+JYbBZHEDitav6kPkBn4
 YXPKlLkzMDC/yulNeIc1sBcpRSqBo3npzDUM0vnIB6T8wAPZ/v4Gf5sp0wu8XJmtjVfuOs
 9Y9yc7H+wnshkIqI75r030FpXhGJZ4U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-IL2i4JcjPkCDUz9MECRQCg-1; Thu, 21 Apr 2022 09:15:21 -0400
X-MC-Unique: IL2i4JcjPkCDUz9MECRQCg-1
Received: by mail-qv1-f70.google.com with SMTP id
 k10-20020ad45bea000000b0044c3ec9f75cso1643574qvc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ+q4BlTQtZT3BUqYMUruPECm6TJtmAxu5VYqnXrhVE=;
 b=n2wuPZ+bHJHSyvbMiVblf/1zLjHpVDjqUtXX/+18EMXylgL6WQwDO9j6jPrxVxZ0Qy
 repEORdvbMStWXmGXgaWOSbX6BpN84Rct0/sSoyKSOyXWNx60Eim4VgTzO+4APTQ5lZT
 wAyRfWypu6Kp36uIEw2/ZLI/EuRpTG2Mc+j0mugPr0VSWnuFOCA6yRqx0BZXX+TzWcmv
 Pp6g9kkH1gXceHygwWFFzS3kSocvm60Lxk3lwNx6pBcIwo+ofmRCBmcGCauN/DKpHCYj
 BFHT1n39SadieLAwDZ/RaHkFr/hHZixbMBiMiT2PX8QHtTbM8ZR28aHh3IDhKKG8Mjw5
 SVtg==
X-Gm-Message-State: AOAM530hbaYY6kFXq8/Rk1+U6TWx4QMVcuzmj+8+94crFuqwnfyZTq2l
 44uofSv8HA9aWxLT5MY8cPlB4tLMUexqz5K1tIm88vKvNaWE7WsL/SlMY+chf8qDFRBVMVeO7+D
 L2pJWYvHaeN7xeBUidbgXQ1M9NEEY
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr15404156qko.245.1650546920844; 
 Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1p460pSQsriY5we0lc7aVE2SA3Un1gDznPdW1XSStmWduRojaJ0UnG57Ylk7u7lLp/dyJdg==
X-Received: by 2002:a05:620a:4093:b0:69c:fda:3cf2 with SMTP id
 f19-20020a05620a409300b0069c0fda3cf2mr15404128qko.245.1650546920553; 
 Thu, 21 Apr 2022 06:15:20 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a05622a014300b002e1dcd4cfa9sm3868302qtw.64.2022.04.21.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:15:19 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm: change msm_sched_ops from global to static
Date: Thu, 21 Apr 2022 09:15:07 -0400
Message-Id: <20220421131507.1557667-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
msm_ringbuffer.c:43:36: warning: symbol 'msm_sched_ops' was not declared. Should it be static?

msm_sched_ops is only used in msm_ringbuffer.c so change its
storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 367a6aaa3a20..66f4ec09ef67 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -40,7 +40,7 @@ static void msm_job_free(struct drm_sched_job *job)
 	msm_gem_submit_put(submit);
 }
 
-const struct drm_sched_backend_ops msm_sched_ops = {
+static const struct drm_sched_backend_ops msm_sched_ops = {
 	.run_job = msm_job_run,
 	.free_job = msm_job_free
 };
-- 
2.27.0

