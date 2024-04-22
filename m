Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42BF8AC404
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6D1127BE;
	Mon, 22 Apr 2024 06:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="wYJamqyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524C41127BE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 06:09:15 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5dbcfa0eb5dso3090603a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1713766154; x=1714370954; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WPdE9YfOY6tF7QVVshsJe8Xe/FfKSmz53cCLcrBPnoE=;
 b=wYJamqyOQStQkiYzQqBzCcNWtl/Ebk599zj2Nqc/wshPDSoWvQNKhhARCOdg/pJHoV
 YRW6dUTs2y/5xVPeYrJRO0FAMgYwely1ZQyf2BzQzlThoFjvf4QxxEi74iuCNfhO2pi/
 e09C557uUM8aJ3/6iv4PsRjVqZKkWE1yGVsg9y9BB9YYYwXuuMsJj+jCzu3Vn4T1Foo4
 pVguK0+Mop13hlNEVbTNLIfsjwb6wTYbv+pdN9q+HKZ+aOGlXM7S+YhvKG1VjirgtB3/
 US/tYm4Xio353Vk8uzn0BYfhdtTheuobp/7sRmfheY/2kIHAQE7MeXlGaap9ewperqKS
 YuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713766154; x=1714370954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WPdE9YfOY6tF7QVVshsJe8Xe/FfKSmz53cCLcrBPnoE=;
 b=XboVHJS+S2aHmGHx/HIrmKMGUD0RcFHrh5X9wawYPZKe73KKe++Pq9usOR88SaOx2r
 ceb1xmPHEXcHhYzQ5uRe5mnHFu6kOdSLBSu/EocGYpp+51+DPAd7UnndVsXMZzU8Vpr1
 V/RlVRmS54LT/inTACEPTFYutwZYZKBvCCTJMbi9lBCl6QTv5gJHTg4NDXiTW7PJ0cxd
 U6NH60wLMOiZM1tmZOHIDvhVg3qRlKqviiqq+ODilPsdMj6Wv2X4QIFK6M9xc+E6l1+Q
 41w2UGwUnb90LX8q1vk6xrUttnZkzm284Ag1IkpOSzom2kAoRQkoRtp0pH62WJeWLIHp
 WTFQ==
X-Gm-Message-State: AOJu0YyQv3GpU5bSLGAURtq2phbQOAMmsmfVLaVGCRNe0LRlEmpd/Lws
 HfRMqkpBZc+jeKgVRGjA/bpCfm3W6nmVEZbClOMxORtA0d9nGiFsf4G4R5yksms=
X-Google-Smtp-Source: AGHT+IE7uuh+ywoyBucKduzYL7bX2Qw9Sd/LYqw1wAGxX4QfchDgzdgePUmiui6ueBcvQf1bgrpoXg==
X-Received: by 2002:a05:6a20:3213:b0:1a7:242a:cb69 with SMTP id
 hl19-20020a056a20321300b001a7242acb69mr7435722pzc.40.1713766154336; 
 Sun, 21 Apr 2024 23:09:14 -0700 (PDT)
Received: from xu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a056a000b1900b006ed97aa7975sm7057014pfu.111.2024.04.21.23.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 23:09:14 -0700 (PDT)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add panel CSOT MNB601LS1-1
Date: Mon, 22 Apr 2024 14:08:11 +0800
Message-Id: <20240422060811.670693-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the following panel:
CSOT MNB601LS1-1

Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index d58f90bc48fb..5e0b1c94bc62 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2036,6 +2036,8 @@ static const struct edp_panel_entry edp_panels[] = {
 
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50, "MNC207QS1-1"),
 
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
+
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
-- 
2.40.1

