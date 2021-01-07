Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DD2ECBB2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C91A6E400;
	Thu,  7 Jan 2021 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650EB6E400
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:27:04 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 15so4338335pgx.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 00:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEpfUC6SSuCT9kZJdE2Ig06/CQbJ0RWivjJUsV8Lfw4=;
 b=keJrF5bJ/TAruJLytWQ5e4qbzCcZE4wqWogRJhz9KK6RehvGdGP37siDsg8IROV5ue
 GWOoANiKd1b7dVNcfN9sLFf6eJHhOe/SNYlei2d3rapZBNLYd3IBPZFeq3zf52VcYW8J
 AMiVHEC29PKd/bWG1EpaOPVzUURnMOPHKNj5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEpfUC6SSuCT9kZJdE2Ig06/CQbJ0RWivjJUsV8Lfw4=;
 b=DySDwHUSS0Mp7/DrUIfnjixjdc/fScEcThg/qadPvmVC/Yyi+ZI06eH4/wtoxJzC1o
 YvDnRQlN8W5StoM5y1JEQY4+6ev34CKrQ+KY6kDHLXj0ZSEm5jI2F8ucuWorZfpJ63uU
 9U8fgVByHrvtShzvqUpHeIkUyE5F7Fdstk5TSh+tToUyMz3FWy76UGwzZB5mD1I75IRM
 u+AXW/mmc5slrZdydd6L3Tq7MkUZelitAGLvRcfblDzLfsEF2zcVkKATZ3LmaqWoCWiW
 ZRch1qh2QPyzqfr4xWNBKdnrUKoffVT6MCM1agqT7H+l4H0R1avYcHxrrSrkp67PKi9w
 3KuQ==
X-Gm-Message-State: AOAM533DajbEYkGzHqQrC24MKtGhloQ+8GI2chaEmzfSx6iH+vMGGSyF
 J3QXYFw1ey9FoRbt1sDAoA7kyQ==
X-Google-Smtp-Source: ABdhPJzJschmke2ee3zxGdTwh3Txk5dMJ25wnI3dFDHvLFWeRJtUCGcJ5Xt19DXHGfLKgciROYSl/A==
X-Received: by 2002:a63:e151:: with SMTP id h17mr775830pgk.120.1610008023863; 
 Thu, 07 Jan 2021 00:27:03 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o14sm5825580pgr.44.2021.01.07.00.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:27:03 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v7 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Thu,  7 Jan 2021 16:26:49 +0800
Message-Id: <20210107082653.3519337-1-drinkcat@chromium.org>
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

Changes in v7:
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
