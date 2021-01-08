Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32F2EEAB3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:10:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F166E5BF;
	Fri,  8 Jan 2021 01:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BFD6E5BF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:10:18 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id v1so2758296pjr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rYVPFVXtXxwvNRbtCD49/nQPeoSTTbcvrlAIBfpayjY=;
 b=Vas4zMIdsNvM0u536DKqys62KF2xTfpQ0ZWY6fwnSuQw7fKhSWR1CI8VwUfSh8a2xf
 4S+xpJ6a+3l2mfJIeFOS8n0YOUme3v1Pi46O/BFdljtv5DjnTBvFTRSmXoJFKWSZZtb/
 najymQKiyfjs6S22oBZVuJfcoVijZPcdtb7io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rYVPFVXtXxwvNRbtCD49/nQPeoSTTbcvrlAIBfpayjY=;
 b=oxbv9Ri78ljT8i80XP6SNLR1P5/ssza07+eOJGzN/RdafmlmYGcFEwX4ako+B9EXZR
 mmWBnChUE+2vepnMvXsaDg2g0Se7Bm4ma+hw2CGGwtltmifc9Ont44EnfiGaW3QKnBL6
 MmS6/QBG8iK2+V9fi8JxDka+bqycEU//jATPC2+/D9mg9CnnoXdlk1E/563tp45QP4Fe
 sXnpG0PwZJVc+FzF/V+kOunpK/gHt+XB+XI3j+p0NNq3sN2O2ztkeAEvyg1V6DCqF04W
 KedJepbziPvdJIb99JBwDJ5wJAvtUcwI6KDYqx7NE/97FEVTD1m5cNMyERzOn4LtkjF0
 tMzA==
X-Gm-Message-State: AOAM533R76oXuJHl4tfRhD08X0D4nthQFZ0N28BjjH3DAca+bCTaLxhQ
 Ju+NnlT69rgOxC6q6wOAFWQRRw==
X-Google-Smtp-Source: ABdhPJywkmrUoz1GUuww7nlVAg7zrHLNiwitqiedS0hUNTEgnRVlRbzJl1+nrX5fUAnpxtQ9hvkRyA==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr1139326pjz.73.1610068217903; 
 Thu, 07 Jan 2021 17:10:17 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:17 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Fri,  8 Jan 2021 09:10:07 +0800
Message-Id: <20210108011011.4061575-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 161 insertions(+)

-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
