Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDBF63EACC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E7D10E551;
	Thu,  1 Dec 2022 08:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E10610E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 01:55:36 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id h28so496080pfq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 17:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C8hpJ+dhKLwcq6yGKXl9JYCXBoLbIiY9R+toMXs7xSY=;
 b=PXW7kMdCN3ai+CI0xhP8dUH6+O2YzxU2IhSV5eUBFDR4EwrNFfWs9iu7/OUr82Un6v
 Xf2FxRIXxOn71D8Csqze226LrlxI2ZYZgVWHq8dAdMV0Yr3bRyOZ3UbFb7rA0qIdsFHi
 SKiZSi5nqW4qutJZNdS9mLQZykYBw+dVCuW3lFaN4P+n8nvRhHBnAo5t7BnJeMlX0P7p
 vNxhz5gBRw/Qwhol3ns2Y4F1VMvh6Qg7GefnnMVokuX+Lo3UTT72XDF/yqHTLJogFzSl
 VRzU5lLsVhFSl0PojqcwKhDkrjQEXpRdONrkgc+bD27rsP26wYC2DJxHIn7jC7CiOUE9
 iD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C8hpJ+dhKLwcq6yGKXl9JYCXBoLbIiY9R+toMXs7xSY=;
 b=cYBN0Sa0WL0d8d0jK1g0IF489c7rt5DAEcf9hDSMgbBsSCXHEf5iLzTX00oZxfhSss
 OUdmLecxpCs0Fie+74hd3w8zK+NracPgoe0hp+4XQnMt+5Mpz1+rluidE5WYacbzBRxO
 FoYXJxG0doPXinoleMlreh38H9IVzfPSYLkgPC85FCRFfUu2eNJ5zm18tU6VDPOclR+2
 T3fiMBYJn2b+uwRHJBXGX9bsBtY4VNEXXDwbk+yz89gdbND3pmNtoWTwya/lBCVvK8yz
 VjIjvpWBUeyUjK7jKUoP+HPF0+PjDsj8IdbSdMsHOwH9p4wy+obmt7JeWqBtebbZW7Ot
 Movg==
X-Gm-Message-State: ANoB5pnHpNbcspGaHnlNWuTjCW87IMRYcOu3Ek97KBd0QfIDwx92527r
 IF7WMDpz0wV3vvLTZAfq6xo=
X-Google-Smtp-Source: AA0mqf7W++ZGlAQng+eeRI1JZVWPEnuY6Xb3IZoLdPXSTzOLfDjzAs7B0Z6Sl0DCk+ll7W7tSZa5qA==
X-Received: by 2002:a62:8446:0:b0:574:8c08:6c15 with SMTP id
 k67-20020a628446000000b005748c086c15mr34168668pfd.82.1669859736108; 
 Wed, 30 Nov 2022 17:55:36 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.8])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa79a49000000b0056e0ff577edsm2013079pfj.43.2022.11.30.17.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 17:55:35 -0800 (PST)
From: zys.zljxml@gmail.com
To: thierry.reding@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: [PATCH] gpu: host1x: Remove redundant null checks before kfree
Date: Thu,  1 Dec 2022 09:55:21 +0800
Message-Id: <20221201015522.38163-1-zys.zljxml@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Dec 2022 08:06:25 +0000
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
Cc: Yushan Zhou <katrinzhou@tencent.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yushan Zhou <katrinzhou@tencent.com>

Fix the following coccicheck warning:
./drivers/gpu/host1x/fence.c:97:2-7: WARNING:
NULL check before some freeing functions is not needed.

Signed-off-by: Yushan Zhou <katrinzhou@tencent.com>
---
 drivers/gpu/host1x/fence.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index ecab72882192..05b36bfc8b74 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -93,8 +93,7 @@ static void host1x_syncpt_fence_release(struct dma_fence *f)
 {
 	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
 
-	if (sf->waiter)
-		kfree(sf->waiter);
+	kfree(sf->waiter);
 
 	dma_fence_free(f);
 }
-- 
2.27.0

