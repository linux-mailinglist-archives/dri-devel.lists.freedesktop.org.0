Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA14820E8
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 00:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657AD10E17C;
	Thu, 30 Dec 2021 23:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094610E17C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 23:56:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so8299114wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 15:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06S3zd2orIESj72FE3tHED43xQdHxTUMkfYYwe00wX0=;
 b=UN21p9i/HQBP5bIxdvrBzde1OUPTWPyofyKLJHtskKd+VUJIo4+fasBiQ1BZ38DGu2
 BS/OMU2bTo3CS0WrOgL+TfNYbfORze+G2kHzWVXQo1brPYoYmdoqoMr9juida9Pdr6lw
 2pYpTeV94yVc+jaaKNAgeSTYahZDSDK8IJfuSh8J2aiYFW3RwNabA0UgsSsA8BhLuoFn
 1Ofre4miz4RWoHxDkv9Wd3FKO7YKr18SHgt15sL4Ln4PJGuYO2UXTwzmey2tnGkeOJ2E
 dc7bWiOthsHX1JbCeT2A6N7eDF3aWYYMU9I1WXUleIAqcDKph89Ib54Rno3dzG59AX3d
 QfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06S3zd2orIESj72FE3tHED43xQdHxTUMkfYYwe00wX0=;
 b=wN5R9rrVzg7XDKViDaF5s8j9cHeLnU55KA2/KcvAtfVjl8geMcH2ouqXqXIYgbEZ7n
 2XdiaL/ozGpziniJUdQYGuqXj1iuLamdF/GtuhCQmClH8HwEmorD9gnh1AXTRXioDP/d
 7Q5NaHDrFuMsRH3L+Wnn2W7fUHyWjtN+ckqF0ZvITwnuTkKfbUlQMd6Ytoe2DpOWmpVD
 99zHR/iV+wovUJaqWs11FyGii9R4w39lNshCT3yLofGztYCZ2DSoYXm1nJ2M7FGrDF2S
 iWzGEOqbHV3pXe5EpwiboI+JaIanTMQpVaa4yG8oC3wBcqPILHodfcNlW2a1wEMPIi5u
 nqqQ==
X-Gm-Message-State: AOAM532jWalaXykbEHVEHPfBFT9u2+VgxUgHGUVvtVzsqPBCrv7ikDS+
 sdFzoCJBMlR8MMbugAFv6FtJj+cM/AQ=
X-Google-Smtp-Source: ABdhPJzgh/ofqaEUf89LPraq5gBtOMLdMCVoLABcXbmXGl/gXmAtu34+N2JtT7fliiicXAQ/+OwVlw==
X-Received: by 2002:a05:600c:1c18:: with SMTP id
 j24mr28248546wms.189.1640908574243; 
 Thu, 30 Dec 2021 15:56:14 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c015-2400-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c015:2400:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f16sm35137581wmg.27.2021.12.30.15.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:56:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] drm/meson: Error handling fix when AFBCD is used
Date: Fri, 31 Dec 2021 00:55:13 +0100
Message-Id: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

this series consists of a small cleanup patch and a fix for the error
handling in meson_drv_bind_master() when AFBCD is used.
The patches are based on drm-misc to not conflict with your previous
driver rework. Since the problem has not been observed in the wild I
decided not to Cc linux-stable.


Best regards,
Martin


Martin Blumenstingl (2):
  drm/meson: osd_afbcd: Add an exit callback to struct meson_afbcd_ops
  drm/meson: Fix error handling when afbcd.ops->init fails

 drivers/gpu/drm/meson/meson_drv.c       | 25 +++++++--------
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 41 ++++++++++++++++---------
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  1 +
 3 files changed, 41 insertions(+), 26 deletions(-)

-- 
2.34.1

