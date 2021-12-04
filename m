Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C346937E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454D473E2A;
	Mon,  6 Dec 2021 10:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D356E1FB
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 15:00:53 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id k37so13925123lfv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 07:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ETAflowsA15kKoaqCuu5WiBP3VN5nTWIEJDu/Mrms4I=;
 b=Um09SsRlWojymvZWb/yxjCx9ZfaQWkaSS4IIcONST7M2t0keriYTvJ1g6+f4vu8heK
 BEX5CrsZWn4bo+KoigUCdkY1tiGq3LeiDQ6SUczsrWZ3Tifn1TW5815nMdSa9ju+//E5
 74CEd+7j7BzYrLaWT1IdPuQNa8xbPmPvAZUDKnhWwE1BUyHEcTBLursndKX7ofbtLA51
 lAIPAmP6whu+VeHMRIw5SFF68hzp8xCalEfa0UhntR//jqzF0/VV8Gh1KxfcPrcicjpm
 L2DIdUr1Vrg0YLsHC2gUFEPbF2uaojlj27V+jZiZWBqDsIMiyHvxGWxERPA9POyTY9Rh
 rjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ETAflowsA15kKoaqCuu5WiBP3VN5nTWIEJDu/Mrms4I=;
 b=uwZidVyDCghSXdC7lX3VdQa4beOuV90Mi8/aNjx3QuxNhpGngw2VY67tLG2f6O5XWr
 Mi77MaATGc0ABNeZV0/MI/gkGnVrWLqeF2ypytOkioSKvgQ0A9EuGfZNK+O/VOLZxG1M
 kw+Z9NSTNbs78zDrpeuSGo1dKPlEClG6BNZKGwJ+eVY8nt73cxpwt+PL1/CoI/JkE2Cf
 3cBheqfZKiq/Nn6b7f+CVgVxEzQHneNae0Ef/pEPzOfaLrloxG07/GpcExUqrB4hrkU0
 YG/OjR7zYqcgRFQuvX85VPrAEeLUPrBdCbNuIcRePLykC7hI5wDZH+4s7z6Hl0296/Bb
 bxXg==
X-Gm-Message-State: AOAM531J9VRoka5IitxJsTYwWUrFHzAgh+v8joK6H27X9ZJn3tXgQ5r5
 XAOfgbvAnCuVK+pCubrInr8=
X-Google-Smtp-Source: ABdhPJz/8jwitQJfh/jI12U78QqY0xtz+vktaV7hEnQfMpou3Va97sCyj5vHEVm22k71JG7nLuD6kw==
X-Received: by 2002:a05:6512:b10:: with SMTP id
 w16mr25057836lfu.223.1638630051388; 
 Sat, 04 Dec 2021 07:00:51 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id t4sm859185lfe.220.2021.12.04.07.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 07:00:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1 0/2] Fix broken DRM and Host1x drivers when
 CONFIG_ARM_DMA_USE_IOMMU=y
Date: Sat,  4 Dec 2021 17:58:47 +0300
Message-Id: <20211204145849.4034-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra DRM and Host1x don't work properly when CONFIG_ARM_DMA_USE_IOMMU=y,
i.e. in case of multiplatform ARM32 kernel. The simple workaround is to
detach devices from the offending IOMMU domain. This is a resend of
9 months old patches which we lost and forgotten. The problem still
persists. I rebased patches on top of recent linux-next and improved
commit messages.

Dmitry Osipenko (2):
  gpu: host1x: Add back arm_iommu_detach_device()
  drm/tegra: Add back arm_iommu_detach_device()

 drivers/gpu/drm/tegra/drm.c | 15 +++++++++++++++
 drivers/gpu/host1x/dev.c    | 15 +++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.33.1

