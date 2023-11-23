Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D267F5B6F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045F710E709;
	Thu, 23 Nov 2023 09:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E80410E6F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:40:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a03a9009572so79629766b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732452; x=1701337252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSszigu6T9QU12VdWtO4WfxwIpZgiTTUkpWgQw1TPZ8=;
 b=EenHc8ZMQS0lwJiBMgNaY7wGNIyPLbey8tYckv2JLHKFaeygNkA7qqlsucoTn9FZ3a
 maUqyGWQy+rBQfKL1jzmu4eT/BPz38NeUxlxXLZ8t9sy+O9DuxFpRQS3vDrhCgh/dPBj
 5mUJxM9CfxLiyzOHunj8N4AGi6r4361xJcjuV3kKbeb4w+8Y1BqNQpvu3FtfjweacR46
 OHTbdsnff8cZaN2l00KcRfQyi7h44JfjGKKaqERwboO5gwePAX9rqVwJCfjDsuN0haH+
 zTG+XMteARhLJu0FtENmh93MDo0Tte1Ru5dk+3mM3CjguMUoQBWwLaSy6O2kI1QACon9
 Zksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732452; x=1701337252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSszigu6T9QU12VdWtO4WfxwIpZgiTTUkpWgQw1TPZ8=;
 b=KWADTaod4aau4qBMUwB/DcW5y5slLmDVzyVx3kuFgDndhAspYL4Hp4Wj+hMqjgG6WT
 nGLpesAft3bY168mw3akpZapI2lhmFoOlqGEwlIEpt5kF1WDnsNEZlBwvvbs4K5KyuoM
 16SNmovr+yJnWaMu3N0cQqN/nIskjtl4iWkkzVx050i8bTTMWPjejD8VlZ2usftfyedZ
 hjosD4nBHI366mvtjYiKCOfcpM0/HFUsnqn6vtLMSigwSQI3ijc9I/1aX/uqUygkNvNT
 sk0KRxZ4WELT57KFYy01a+X8ahiaPnw8VRXoLfdYvHlLWEii/Fu6/BcyaJ/LNdplxVeC
 sddw==
X-Gm-Message-State: AOJu0YxA7DMgmpHnVRrssLzuCq9mR/wzaj/o3hnDzEK5oO4Tg3GX1Sts
 BfbjlrrjDhqO56hxrtfirn8=
X-Google-Smtp-Source: AGHT+IEFgOtT3lal4jlY4JZycrJ9xFNnfqhiTE1G5PpC/tUinLgJ+nSg0oiXXan59RSRf9SexqP77g==
X-Received: by 2002:a17:906:209:b0:a02:9c3d:6de7 with SMTP id
 9-20020a170906020900b00a029c3d6de7mr3506760ejd.13.1700732452416; 
 Thu, 23 Nov 2023 01:40:52 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:51 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v5 09/20] drivers/video/fbdev/via/via_i2c.c: remove
 I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:29 +0100
Message-ID: <20231123094040.592-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/via/via_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/via/via_i2c.c b/drivers/video/fbdev/via/via_i2c.c
index c35e530e0..582502810 100644
--- a/drivers/video/fbdev/via/via_i2c.c
+++ b/drivers/video/fbdev/via/via_i2c.c
@@ -201,7 +201,6 @@ static int create_i2c_bus(struct i2c_adapter *adapter,
 	sprintf(adapter->name, "viafb i2c io_port idx 0x%02x",
 		adap_cfg->ioport_index);
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_DDC;
 	adapter->algo_data = algo;
 	if (pdev)
 		adapter->dev.parent = &pdev->dev;

