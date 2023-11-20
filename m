Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E5F7F1F80
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063E710E1DB;
	Mon, 20 Nov 2023 21:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF49F10E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-332c82400a5so915867f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516796; x=1701121596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bq7nwej1uXJ8BJR7pdDi87hSI0E9HenTuebLuXr0HrY=;
 b=QWuNKXeQf3D0GGW8+Gdj518w3fTpwgI8QRz7W297uc+DBRh/eEvclVmERcl5EuPNOe
 RGu4QRml+tFrLqBO2pJ83hRFiWe6qaPovmkhv4Y8mPIm4HiBsA45tTHHv/XyhnARiEis
 N90NCxZBg+SRPVDVUm9FbaddriJLhVdan/sRrtNocsiuMCSIAusEfqgIflqLhImt5/CC
 ZgxhZYgLoI7gBoDIp/+eLSRUT3RfOedvlJ4NVuPKTypO4NS6+3h1L+7b6jwg14XaGva/
 n5bp3ADExqXvirMf85Fe0oU7G1xBhXbnmQ3J+DCKZ5DUUQB+zhOWVucSXDuG4WD5h2pk
 Z2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516796; x=1701121596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bq7nwej1uXJ8BJR7pdDi87hSI0E9HenTuebLuXr0HrY=;
 b=t+z92eQXm7ljfyCZpvCXnwGERn1vuzkvAoU9iwQxdTO3AQ4QP/Bwvym1xNg0Q+RaoD
 EaOVRApSfiZmBmai6czTkXHayRFycqEuWcobHXA8IcEGd55SJLv2HTMOgSfUzCN/hAV6
 lSbwKNreeLlgl88tJdrdM5jidDLrzYJolEOKT+RkUb0lxOpF6aPe9V/C3WugVOLMg9hq
 IU3TkcLQWFdssWpU1Anxf9lLzBVhvswTAzalGo4v2hCqVa06iApX0PF/HkMgTJqyIshw
 a98Ic1XlWQe2AXTfGBp4HfmmfPGJXzXnOLYrCHOMl3P5ohQk0UIg6Jis5w0qjNVRztrt
 HHWA==
X-Gm-Message-State: AOJu0YytEHWaCg0+5V7U3+V7QWcrRbkV+FSVLRDwTJU71qBdf+iALQX8
 iUxEi4FR6BhMukIRLFFfDTM=
X-Google-Smtp-Source: AGHT+IH1S4/fJsobtHJJPWdqFrJEAF5OXQoLCltzpm8iDTMOYpJCpPVCKnhW9kW09x82/VjIEFaoPg==
X-Received: by 2002:a05:6000:381:b0:332:c65a:8f1f with SMTP id
 u1-20020a056000038100b00332c65a8f1fmr4065388wrf.47.1700516796157; 
 Mon, 20 Nov 2023 13:46:36 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:35 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH v4 09/20] drivers/video/fbdev/via/via_i2c.c: remove
 I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:12 +0100
Message-ID: <20231120214624.9378-10-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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
 linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Helge Deller <deller@gmx.de>
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

