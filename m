Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BF33A94ED
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47826E520;
	Wed, 16 Jun 2021 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A0E6E520
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:00 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s6so1520665edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZD1oIEshyi5mEs2vX/ty3wdwPQu3S284MwRCDJHvwJg=;
 b=qCU6SCauZj7AZ5D7QDK8O0HF9eqJLgNurO4UAiW1PoDRoXD7jn7wlhiFaUpoQIZzOm
 uuwRJDaLTLXPixUmeTl7Vrl7mLOs+OyOkmKjYSNghyyMQV7jIXEdC9EB/kCfAVb4Hkuu
 KUXe4bDOVoWOImx0YOrkKiAYkZzVysiX0PPODpyMMdTW3XtHSgnke64nfVBjKv6yB+xJ
 aVARzLzjtKNHV5ooPwV8qwC3XbNAA3DALVyBi7bLoHDxQpQ/qcNbel23LtgfewdWRGhl
 7v3iVEDRQbS1TluR7J3xnouy5T34zwHUPhBzzYVTKJeG828Ix8KCxlEMEfBKinv2u22Y
 dNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZD1oIEshyi5mEs2vX/ty3wdwPQu3S284MwRCDJHvwJg=;
 b=BMlwRdgltJ3bKypFmluzhJ4upUtkPIbTsES1kYuHTQgx2Zfgv6STPtpjZ0q8PiJM3F
 Z1YC8YnnpwXHUSOUmHvJ3Ge/Mw9ejv+g49IGxSiuLZwgfk6AtOV7B8Yo1iakzoSeCs1Y
 W2303yEyQ3yW+dMGoVv5SqRClHk0bJPD/oW96+387KjJVljYMzioH3aKTHrtvsy3ja92
 xh4MRDWqZs/4tZX6hvWWG7rGPkq39dJpGvhtiMIpfNxGkG8YpPEP7NEW1oBcNYhZ+Bt2
 iYmlh6W6SZxksbwrVj9Ay1+Xw5qt1knqmUdYuZJ5YH56tqCGvCNZb76x/O32fIvvaquY
 gbXw==
X-Gm-Message-State: AOAM532A6SVrHcXAulG1ldvEhRDYOABBMGbzQ3e5Mum+URg5Qcaiuc8m
 ox9MNv0hrrcpUnFLJyeM/2udAiwKfx8=
X-Google-Smtp-Source: ABdhPJwLXRFQuy3NSBX9qUhhQQAJmrUQyjuv4s9gBktfSh/X/BaDuqPOco4TJbd8H1T+RoWKdlZGwA==
X-Received: by 2002:a05:6402:2317:: with SMTP id
 l23mr2737214eda.265.1623832019200; 
 Wed, 16 Jun 2021 01:26:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:26:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: Fixing problems around shared fences and RCU in DMA-buf
Date: Wed, 16 Jun 2021 10:26:48 +0200
Message-Id: <20210616082655.111001-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Hi everyone and especially Daniel,

this is the revised patch set to fix and rework dma_buf_poll(). The new code should avoid problems with RCU and also now correctly waits for all fences in the resv object.

The rest of the series is then the well known change to dma_resv_test_signaled(), nouveau and now new also msm.

Then last are two patches which drop the workarounds from amdgpu, but those can wait till the next cycle.

I think it would be rather good if the have at least to change to dma_buf_poll() pushed in this merge window and maybe even CC stable since this looks really broken to me.

Please review, test and/or comment.

Thanks,
Christian.


