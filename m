Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F82F4445
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 07:07:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1E889D84;
	Wed, 13 Jan 2021 06:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0B589D84
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:07:37 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id x12so468095plr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 22:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzQFE72I/JmdqPXm3sPTdt50Ied3UyCVZBo3EP9qpfA=;
 b=ZUtRg0A9O8s+bnqw0Z0boHhOu5ZFztEcCyW2vzpZb//xumrTqsqWGdLgzXO2RUL5D0
 jspQOLHArKkE935wTfyOxk67UvxMWhy39dnjrc/D5vmeZ+VXpg6cJx1j8UHTpuQxfkg5
 A3/6oiSUjlKmYmSiGwI1yUQtpxEYajq5rRM4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzQFE72I/JmdqPXm3sPTdt50Ied3UyCVZBo3EP9qpfA=;
 b=uf1hVKGnpuIRS6VrHmIt9Co0d4NvQSv/8sQQuyDPXJEPFl2DwtfvalmuV/YJSjG6ht
 u63TkO0MM46B05WBmy+twYOU9GdmK02NLc/ex+eiREhyKnhyjai7mkaxrB6F/8Y2KUlA
 qSWATFqzrEAwwRjYoRZr5sWq2+GlhIIadAs3KDmwo3uB9KQR0UwGF2q2AO6vLxfB8X7T
 r8AlE/QTHs1JCMFByfsYm/UVIxmIu1GcXqnWMMv3Ek7CcqiEyLswm6FeWYUucfAti+VJ
 DoRGUPIIe4uinnHGbQiJpThgIDfdc4a5wMrymB7CYO79LXy39PPRXc2lVGaS89+WBq8o
 qXkw==
X-Gm-Message-State: AOAM533c5jR44eZEItugV24mSfQCeNlf82kfUEiUCwMElDmauPoi42/i
 7Zcm026591nxPew19yTldDO3hQ==
X-Google-Smtp-Source: ABdhPJzIdxN35cPgniUhcyI4MVs69RfBwzqd5PIpdwLqbpEFIo+PblIarGAgVlOnSt+WY04srbGQiA==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr558246pjb.166.1610518056830; 
 Tue, 12 Jan 2021 22:07:36 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id y21sm1263556pfr.90.2021.01.12.22.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:35 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v10 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Wed, 13 Jan 2021 14:06:59 +0800
Message-Id: <20210113060703.3122661-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message
 - Fix GPU ID in commit message

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  28 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 164 insertions(+)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
