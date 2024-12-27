Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF29FD2F3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 11:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60010E2D0;
	Fri, 27 Dec 2024 10:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="kSscM/l7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBAB10E2D0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 10:19:21 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2164b1f05caso84918015ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1735294761; x=1735899561; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a0w4pA7P/1E3q+cAWau43LmmIJI4rL2KmGdZ4WmF29s=;
 b=kSscM/l7q+IMXmrznGUgvQy8YG5PG0kZ+fty1MZEdYUe9sNZUtkjDb4RX+9D1omdYC
 BXh1MgAA31zzTqxoxkKrhqrdvUQzbb8ygyfsyM3pv4m8thM5RoedEDMOXExDy9XyB8la
 4ZCBBz6SBWh5QNbmuaqPedA2lyl4RfpGPclC1VZd8TjTr8fwniGIf15Rom/DIZXELEu2
 Yqs8uf/WKJOjm/GzFYcXQcYfNsAKBtVFuimHWQbzMmy9K2NcCra6y1GPgQQUCpuuM1TD
 k3SY8ucdzQdzQjvd0HT7cIfiWPJMcfwx1QwwOFNCjtjYhA9cBjjwGiywDK1IzhAPuZKa
 /yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735294761; x=1735899561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0w4pA7P/1E3q+cAWau43LmmIJI4rL2KmGdZ4WmF29s=;
 b=aXjSw5qWOGds2JBPVBe5DidvEt6Ql1Nh32QDpdut37759NCAqdduMwoBNlT0z4Busw
 L9j+IfJA+15gwGF43SKAdtpj9F80ooAvSkTy3UxbH4Njj655B771MIB8dIrzgRdqAQUb
 3C+QKi22mxGFqZQO8NDkmObBvqLwKAu2r+xGBStr1aIXJpNB8yR2xFJoxqMZR/9kjvAb
 j6TeRzFBMN8KY91E4z+bhOSM6wH6eEhDKY3xHSaAnknMkzQaS0yeG+1BjOceAfAn1Uo5
 SoNYyj3DDleCgqGUFeNVrJLC/WQQ53ypD5adPRC4pMc/Yyh5wHhib9pH1M39eKMcRjQj
 wuwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9loZun/oyQB+Jt0SlnZQzQbQ9mipJHll7UEic/uAEV8kaVKB9lPsGxnUKsPPl2KzjWsWLVAixzC0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeRMjjqhzSN9AMUvjFfw7W3nEGKcH4o+QdnTnp4Nv2JTAnxOc8
 2nG6+h66GbT1ogCFQoKHyjVKhl0ABKskm0w3IEk6QVFu7O1H/1zVctoR3vMwHT4=
X-Gm-Gg: ASbGncvsPfQtLIYbkR9Jy/iiydCx0c45UzTGxc24NX1pLb4zpksjgYL0H1jXe6Cn2eS
 AYjnhKQu7JgS1MJm6j0BAmZo3Ax22nuZ0nWflXU5SOi2qYNEns/AkQS7ijQdbNk4YiEW0ZqfgNr
 dPMxWPyDG1ePnkLxamZ73Bk5PmvI2qXq/j/VQZmKwAa5L/nUMtY+deyvPALX57pBNyu3xMWsfTi
 Acx85DR/h+rW9lmLdFk4WuoxsHmEO/0qEWUd7SV/oFZROcTxSxsbJrqaW2XIgkmxFs+Qc14TR7G
 XKA4W077IxSBd8x8iePF6Y0ibrpy
X-Google-Smtp-Source: AGHT+IGOYxnplc3jA5DrIaKCgTVLNVKCeKQDmylaVh5JtIU6s4AoKDEPTUQTD7jJtg3nIh+vx4klGg==
X-Received: by 2002:a17:903:2388:b0:212:63c0:d9e7 with SMTP id
 d9443c01a7336-219e6cd8a9bmr415297655ad.0.1735294761356; 
 Fri, 27 Dec 2024 02:19:21 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-842b229ddc4sm11061675a12.29.2024.12.27.02.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 02:19:20 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dianders@google.com, Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel-edp: Add CSW MNB601LS1-3
Date: Fri, 27 Dec 2024 18:19:13 +0800
Message-Id: <20241227101913.1711071-1-yelangyan@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the CSW MNB601LS1-3, pleace the EDID here for
subsequent reference.

00 ff ff ff ff ff ff 00 0e 77 03 11 00 00 00 00
00 22 01 04 95 1a 0e 78 03 a1 35 9b 5e 58 91 25
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
36 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 30
30 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
53 4f 54 20 54 39 0a 20 20 20 20 20 00 00 00 fe
00 4d 4e 42 36 30 31 4c 53 31 2d 33 0a 20 00 32

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f8511fe5fb0d..4e6f07c299df 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1953,6 +1953,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50_p2e200, "MNC207QS1-1"),
 
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
-- 
2.34.1

