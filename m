Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68AB47815
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2316A10E40C;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIPR6E5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBA910E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 23:18:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-560888dc903so758694e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 16:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756855125; x=1757459925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9kwXaFbFvlFQupGQX/BTa51kbFae7eaQ90Po3EqnDpo=;
 b=jIPR6E5ufm0wtUP0fvNnlpUWr0SZ6IwiFz2cqxNfmhvt7fMC50/irJKa1x/+DsDqlc
 kqPRR3hXtrsrlLWV2+XpNhMNONxhfDd7VbJ3/ESSHcLaW0oMNEN2CqJ3yNZWiQr9M6Zr
 wA8CWzz+VgwMslrLyuROcc2rHQacb2dFpsV2NoPhyBPzlYJdhXOKcL1uVQskIkfJwK6O
 G7+KlWhIJpO7FfyfnNLRnmXB1QYolj5tAcSxqXJyiq+MQ6ZbSkIFl+WK4MedDLOlDGn3
 7JrxeSsujFAdyBcadEhLyPKDM7GBghPLk0WsEOSSSscLCg5kjeI2emSmLwPFrzfN7VbH
 OOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756855125; x=1757459925;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9kwXaFbFvlFQupGQX/BTa51kbFae7eaQ90Po3EqnDpo=;
 b=j2AzEmv9nq437zCcc7awbe0KUftKIQ23UJUq/3D7+DcZM8klsSAWLROW4UUYnqE5Kz
 MZoSRWUSzcx6NWnC+dofEWCpBfij8CmON4tIAm3jGhPO4t5YcSVahAZ8h/IAYMKXbm8r
 EWNHAaOa1tyXG7GBvMB97KcitOZAJLp6GHfREtqn28WfPAnU+rWcv2Eu9/XxxOaqeCC7
 sUKaqz0gXOR/1/xSg3LfkcG6khQHsp+bzqcv8OR8SzRm7u3e7VCPsiojxlKHHghDJreL
 TcMYsXjbvDQpEzS2lKa/syt8ls6QIsk2KE1FeCDZvZprwtG1OEOlAbeW8byDluPw3bkZ
 3NjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgJzNPt9wVEOJu6PlBsQSaqveJglULgIcdSqG3+w8iX8q4i44gfap9Hw0EibGntr6iePevdfROVVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzYdOgrpc9uKgUQV18akTM4EIGMfS2WGhTiYamCvJNmGW0fJ5u
 FP00TBPVorjIYVUj8+AhgLk75Zjg59XhHi/P6m3/Yn9h6HgJPeQp5VHh
X-Gm-Gg: ASbGnct4oLHigOeOqlmMR4C4Uq84ZgLtWi+Wbd7BM9UZMBSA25zZugFGJsMAwNj25MF
 M80q2Oa88p2hhirV9bRs8ptmYiPihZknLdoNoO/Locaypy6CevBeq5+df0wKkKqhQCksyLMJcG1
 H9KRwMhK7NURYV1RFPf0UKigJXgso2eAetAyz02QXSn2Th11MQ8Rcw9bBnqYfYtSZo2qOXMB4od
 FYoCwttk85a0jqJJHPA1Yvb9vhB6hJ1T2O5yqGaqPcQ2pxf6SXOGKQdrFk2zCxhsR2uOmFIR1GU
 Gr94xJTeKq5RwsNt2XP+hhW/YGQC+fNfVvxAUm9b6409zQ9Q8GwxYWEQ1lgakLvnJMZD1J/i9SA
 n54QMfE5iBFwGHZdtJ9bCmDzwWLUXKBU6xlJ53FsYkaQJP+fz1Ry3jw==
X-Google-Smtp-Source: AGHT+IFHRjeiC4EU9z0f/xmR1Yb8S558zLmext910mqB0q6dsx94jDM34IKWXBfUF5Zz40is5NMW/g==
X-Received: by 2002:a05:6512:6390:b0:55f:5580:e3d1 with SMTP id
 2adb3069b0e04-55f709ae969mr3313573e87.47.1756855125092; 
 Tue, 02 Sep 2025 16:18:45 -0700 (PDT)
Received: from vovchkir.localdomain ([95.161.221.106])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-5608ab5e281sm105674e87.18.2025.09.02.16.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 16:18:44 -0700 (PDT)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: vovchkir@gmail.com
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: disable audio capture for HDMI
 card
Date: Wed,  3 Sep 2025 02:18:18 +0300
Message-Id: <20250902231821.2943-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

The LT9611UXC only has an I2S input and therefore only an HDMI-TX
audio channel. In this case, the capture channel must be disabled
on the HDMI sound card.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b17483f1550c..79feaec77afc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -562,6 +562,7 @@ static int lt9611uxc_audio_init(struct device *dev, struct lt9611uxc *lt9611uxc)
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &lt9611uxc_codec_ops,
 		.max_i2s_channels = 2,
+		.no_i2s_capture = 1,
 		.i2s = 1,
 		.data = lt9611uxc,
 	};
-- 
2.34.1

