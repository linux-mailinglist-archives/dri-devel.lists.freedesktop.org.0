Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5AACEC5F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEE810E7B1;
	Thu,  5 Jun 2025 08:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XTRpRpD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3B10E7B1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 08:53:44 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c5675dec99so90259885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749113623; x=1749718423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lDEWl38WFpFNnd8GWTrKKFIYCiy6Z5fzCEGVZofpXpw=;
 b=XTRpRpD854yi/OgCTLDxAPYwwQy6dSk+RjsEA55YRIpFZBZBwMz5x3GsQhD3vPHCwR
 KifYNg/mDRJN7sbvMF4Qke8rAbI0e1c7pUwJyksf4QikC6S34N723I9fyxL4Sq/BMcsy
 D4rlfgnclODGecr9SrqobAI0KPyySqBpfmKaCjC8YzszmJpMVdMRW6/sbScdRYJyfVSo
 z34/5tRgYphdIcuV6pWlDbjTf42F599/wGAKWB/0KXc6ae7sXM/0Eo5CLUP4sxfiOx+W
 Z1MJoEG/b+BllkUtMNpF0Ml2WeScKjSqyC26z4ii/vLnnu6tf9cQQrJLpLdUKjy05jlH
 RPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749113623; x=1749718423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDEWl38WFpFNnd8GWTrKKFIYCiy6Z5fzCEGVZofpXpw=;
 b=DdOeXCHVpBwP53lSxS3Tzm8mkyLbstNXYnf6m1DwVeRSCjZsGoyqT2upSCnbsx2Z/f
 itxu109tJd0J59BJl2qE/HGplu510Sn29bYpzsLGwAzqWUZnZILy7MP9l0AtnA16q388
 qmCDMpH4uVWzNssMMyxcSV47NjfvOAMlHotHlRzPEro2Cw1ngiE43Wwu3OGLBmpojcNj
 A6lG3drD0EoOn/tlRfk49lRjWwPt1RWIm4cxrklHY0LUah4BEkKj65Tqm2Gh65GXCQbV
 BDx/RnpmgMdM9YHZvunD2iy3ie7Elxm+hRheH1OWG5I8MILQjJAHEOk1/El6al9qYlx3
 sokQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX1MQ7p8iPCOznmjncr+huuFsTZO4eWXlgk9/VRl9XhsmTyKIh2uS28CjPibOlEaHuH+pOgdKqBFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcOEWa/l2ArJURc9LeJhmpbkhLqjjmQ5eKPLPQMFjjNpIp55Rc
 OoXM/O0anZZeASH45U8tbuAkW0IK79IU7RePgk9EHT8R/sTLK1o+mCPg
X-Gm-Gg: ASbGnctWttua4nQWc9Xav2cF29jz94HkFr5BiTZn5kOVCJJbl85SO1blAxl332Ic8Xo
 aRNu5e1jJHoR9oUmvIILYA0GJRHYzfovRNLFnAbCRElHhXNpVaZI2C2hzNpgXbFi+vF9qCCLbNm
 LCTPojXDiLP5rKI6zQg5QH2NsZ6veOEaIfpdCvY2Ly5plmHIFv4q1EQGZoz8oBIBOa31jxyRvvp
 JdnA7qUY3hxQ3FvWn4KITfKPNVp3aOwlVknDifvawVCAPYMnibh8crn/3PL/rr5+4NK0ZVFP1m5
 bdafpRhGdLuJL9PMLgpOCQgFy63RqOhShoVTri5D8sNmTpbJrHd+E5b49Tsyj9KlWHkPrac=
X-Google-Smtp-Source: AGHT+IGLH8m16XkE87l1eFPbxjX4AhOlhPsBOMe99DdtYfdVzZAuDktVgyg981QS3ANLMdJctEgnRQ==
X-Received: by 2002:a05:620a:4109:b0:7d2:1404:ac52 with SMTP id
 af79cd13be357-7d2198ef8e0mr991962485a.27.1749113622868; 
 Thu, 05 Jun 2025 01:53:42 -0700 (PDT)
Received: from laptop.fritz.box (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a1a768csm1222520585a.94.2025.06.05.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 01:53:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dan.carpenter@linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: fix compare in WARN_ON_ONCE
Date: Thu,  5 Jun 2025 10:53:35 +0200
Message-ID: <20250605085336.62156-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
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

Smatch pointed out this trivial typo:
	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
	warn: passing positive error code '16' to 'ERR_PTR'

drivers/dma-buf/dma-buf.c
    1113         dma_resv_assert_held(attach->dmabuf->resv);
    1114
    1115         if (dma_buf_pin_on_map(attach)) {
    1116                 ret = attach->dmabuf->ops->pin(attach);
    1117                 /*
    1118                  * Catch exporters making buffers inaccessible even when
    1119                  * attachments preventing that exist.
    1120                  */
    1121                 WARN_ON_ONCE(ret == EBUSY);
                                             ^^^^^
This was probably intended to be -EBUSY?

    1122                 if (ret)
--> 1123                         return ERR_PTR(ret);
                                                ^^^
Otherwise we will eventually crash.

    1124         }
    1125
    1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
    1127         if (!sg_table)
    1128                 sg_table = ERR_PTR(-ENOMEM);
    1129         if (IS_ERR(sg_table))
    1130                 goto error_unpin;
    1131

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 0c48d41dd5eb..451714008e8a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1060,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		 * Catch exporters making buffers inaccessible even when
 		 * attachments preventing that exist.
 		 */
-		WARN_ON_ONCE(ret == EBUSY);
+		WARN_ON_ONCE(ret == -EBUSY);
 		if (ret)
 			return ERR_PTR(ret);
 	}
-- 
2.43.0

