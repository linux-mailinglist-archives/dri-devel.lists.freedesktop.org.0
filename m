Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6A8C3525
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 07:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1A610E090;
	Sun, 12 May 2024 05:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WmhmiyoO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D25010E090;
 Sun, 12 May 2024 05:50:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34db6a29a1eso2770216f8f.1; 
 Sat, 11 May 2024 22:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715493032; x=1716097832; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gohhoHpvy9QQHX1FItVd+i6i5nE/fS3cmezBpj5puFQ=;
 b=WmhmiyoO3M2aKKlJt+wIYSBLDFEiKLpOYqGYkyV8P2pIrPlZEl8MCT0uSdLfw3bbGM
 nfN/pTxU2gwbmJtw2llZaB7aA9kCm2AJrUWvSTzFjxyFvZOZ+uhyi3FECUvYrJ/aCEnb
 kc/N6HCmRpncN/uTu/NZPdKTEXnO5TWtBRpq+QFT/A6I34L39SReAAS6VvcC9aYVLbb7
 ok56C8F04m5/iqbQfWt1YjPMCoH+TWKv+taQvijk2o0lB+CUy+7p2JT+9FW2/2zJ+neZ
 oJxf5Q8AxKPJP34wqd/ytW+RbKDPIeg3eFmxPjdpoOlSjKKQUWnNmsQbhqrschZLngMx
 tYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715493032; x=1716097832;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gohhoHpvy9QQHX1FItVd+i6i5nE/fS3cmezBpj5puFQ=;
 b=vtSMkQBvMsDUidzA+PWtGFvgkikCRWdczfVlMZ8GYGckM7wUifVWLDq3dYYfuuzJZ8
 RoQuaz+V5L3sV5Oucx+ByP6CQfgVZCuvGFAZHbhIvTei67hG57Sb1euMxwC3TVOV8/FK
 3xtgbllbmmFt/BzjJNNzmSJGox5VvLZAdrzMz3mzsIQu6eB9Qsk9K9rwM7yV3LUV5PPz
 VTRZbPKQtQBCXnM1Jt0H+qUwYkpzBbxE1aLvIRexqfRHZ/He0ibY9XfiDfip6tfTXyqc
 zCVxcLZgGPC4X+00Pba6Kh95rBZJRoq1dlgo6BZVkoMrKXKS5ZeDKjtgWVs8wb3i9fF4
 qNAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnFpKxk3OUjMYFFSXwyx7TkcVUI7G8UwiqqxcbF1ewrVkjMku/C81LHfCrNl2PF+vjjUQwKNlUJZDstHt7y09VkF3ChagLR9aQRo7tyLYB8sGSDAK9ZiPIjQc5aagLWt4wJAKR5ctG0nfq0/zyXbAt
X-Gm-Message-State: AOJu0YzBiAcAueoxYNyFqwP0ft3WXfi13+IqgebblEQWYqsKYjAs5me0
 fiHoH+eBaNYNtkX+8G0KOQ5QQiZ00GuI80eGyYqG/Z0410o9EBO6
X-Google-Smtp-Source: AGHT+IGS7lY3xkP1YgSRUKU3N4sAoFEL/X/Mdy0wQoiOJGzB0jybLGnY/4sYF/u9S4jmIeU0CWvUrw==
X-Received: by 2002:a5d:6209:0:b0:34d:b75c:c7ec with SMTP id
 ffacd0b85a97d-3504a62ff0cmr4368127f8f.8.1715493032262; 
 Sat, 11 May 2024 22:50:32 -0700 (PDT)
Received: from kali.localhost ([5.208.126.127])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbbde1sm8233658f8f.97.2024.05.11.22.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 22:50:31 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH v3 0/2] drm/msm/a6xx: request memory region
Date: Sun, 12 May 2024 01:49:37 -0400
Message-Id: <20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFYQGYC/43NQQ6CMBAF0KuYrh3DTMFaV97DuIB2gCaWmtY0G
 sLdLaxcsvw/89/MInF0nMT1MIvI2SUXphLk8SDM2E4Dg7MlC6qorhpE8MlDayNPATz7EL8QeSg
 joM50aHRzOROKMn9F7t1no++PkkeX3uV8+5RxbXegGQHBKqlVpVDZmm6Db93zZIIXK5ppL0QF0
 r2UfU2sOq3/oWVZfiPwC18JAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715493029; l=711;
 i=kiarash8112hajian@gmail.com; s=20240409; h=from:subject:message-id;
 bh=czuivthniXq3sVg2Xn9Ls6Qs0i3TnTjaQST9KemSo2w=;
 b=aaNsjtDTHT8Nd63JP7lgZQyW4HKsHKWJlmg6rj1ZQDn9uFrhxilviioxVtT0GWdqaC/76L+dG
 CRBhah5VAGFD0cMkeAZ4IEyeDGAqAaBoUdDYO+O2ZiuKe0Na+70CmW+
X-Developer-Key: i=kiarash8112hajian@gmail.com; a=ed25519;
 pk=ehVBr28gPcA8cMB/wneVh0Mj6WGkqZoyYRdRNi5+aI0=
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

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
Changes in v3:
- Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.

Changes in v2:
- update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.

---
Kiarash Hajian (2):
      drm/msm/a6xx: request memory region
      drm/msm/a6xx: request memory region

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)
---
base-commit: cf87f46fd34d6c19283d9625a7822f20d90b64a4
change-id: 20240511-msm-adreno-memory-region-2bcb1c958621

Best regards,
-- 
Kiarash Hajian <kiarash8112hajian@gmail.com>

