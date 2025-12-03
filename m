Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86201C9E138
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 08:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F206A10E0F2;
	Wed,  3 Dec 2025 07:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ujxcBwu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0439810E0F2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 07:45:59 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so65973765e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 23:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764747957; x=1765352757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qY/PbcsnkUZCCKF2mlGoWTtD0mdsRoACsV51+JfVo4o=;
 b=ujxcBwu+dSR/zFwsl+Ar/4AbltrfvdEYtCrggeznVYdQIdn4dZro5kJhXnLefxJQ1t
 n7i39eZYCpYpgu0YyUEBaxWLKthly+JrMTatwYx134YundsCBXshNJLz5AiRpEiq1TiC
 N28tPB12J1Um16mK2S4agevCYTbUSQwByn8SlEAXZ6/oJ/XGslLrA7hKvUmianrXbvG9
 FnpS/BOey6vylYegcnPp6UjVMwgBHnEVxhPyBo39w33vk9OV9C+h/WkcPYSrzDLQ/VGx
 0Xm5r0FOWJSX+wSZBnlhFiFx1kyQfoJ8dZZYH+k6JTNARfIkeBtVD5iCoquBG72ALt9a
 JCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764747957; x=1765352757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qY/PbcsnkUZCCKF2mlGoWTtD0mdsRoACsV51+JfVo4o=;
 b=pqmJslrVEiHf8QyL5KJjgU9AcTsigpFaG6q42hDCYpp1AV0XFpoT1cRwpYDREZk6wz
 f7OBi2HfbrcxX6RYrrMbInRt3yyuBTKlfuK827/cpS4uiloxCe4hpqoKZxr/zRbct/uK
 DMCMrkuRhN18DQx3nYFaVEgGFHfw7mUlOPOYm/mAOwdZC0vYozY95BR+evl9BZCHc5J7
 fGXjyfZrs0IzAalmGj4CWK6Xh1sLHfbReKwOWOOhcoghceqF7P7yNty/DG0HOfDv8X2T
 d3P/f1zmastZPwghEynyehBMNQcZ9pE9bdc6QqbWuQDgKPpyhUbtQ1VnjcLgyywz5XyV
 qnFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVKdP2kVtIZ9zGLoi+JJyuPGKZ/R+8i+2wrldnnAVq0jbNYtCi1tYVBTe1YeiBfVcJlbNQDa/fzTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxUgu2t8BYjHjlr/1ahUk9Y4eAP1Uf4B6HXrwgiaSbdY/ZM8Zz
 PPPxRbjH/eAHCDSywQq4XMYTmzwAxHpgBDphttzJcT4Fvbd2sf6zKoQckLAq+9TfIhc=
X-Gm-Gg: ASbGnctqylxRxE9f0NCCQtPzzIdYC9vmztvCTyykYuSM2TKjWmV5SdVB1eSF2Kgl048
 A+1nMc/FWj8qP5ZMJWZ1iVcQwZqtNP+/xrgTFbmhX2Aq0XiEKl1KkcN3cVVTfkxEXcBDpE1SVfS
 +fk/jRhX593pk8oH/KWOosNUjglpMk+w3VJCKjMgflUsmbzSdpKGY5Ardp3waSjdwfS8xkBZNNj
 emK0KwDUq/3WJsilEOkRbCmDdEsX//y80IbH0ovHMV3MXr1yTdA6D4rBc+YSFI3G4FwTVjHRqmO
 Sf8IcNhQCM2RVvqLKSwZ/X/iPvpTQcTyRUFz7qiCF/R62WzoD57TKvqyaBd4RanXv0LQsrp2bH4
 s7+6nQ1vgHvW1QXXUOFdnEJbMzzinpvBp2QBWbBgX4ltC2Mumy4DfI27m4jXkzwq2xQZJ6f9AEr
 /1HUtIpo+NJLdDmQIa2sk+4kwVIEg=
X-Google-Smtp-Source: AGHT+IEUMDqN8+/nwF01p/sjfG/xJCCAzS5FIZ1FTwoqc1NLx80oiLXSC5Fkzo3aZsGD/y+t8R7nAw==
X-Received: by 2002:a05:600c:3106:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-4792af1b207mr10218285e9.21.1764747957279; 
 Tue, 02 Dec 2025 23:45:57 -0800 (PST)
Received: from orion.home ([2a02:c7c:7259:a00:a4e6:4871:7444:3cf0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7a7aaesm32873585e9.11.2025.12.02.23.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 23:45:56 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: dianders@chromium.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 vkoul@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/panel-edp: add AUO panel entry for B140HAN06.4
Date: Wed,  3 Dec 2025 07:45:55 +0000
Message-ID: <20251203074555.690613-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.3
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

Add an eDP panel entry for AUO B140HAN06.4 that is also used in
some variants of Lenovo Flex 5G with Qcom SC8180 SoC.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 06 af 3d 64 00 00 00 00
2b 1d 01 04 a5 1f 11 78 03 b8 1a a6 54 4a 9b 26
0e 52 55 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 10 2c 80 b8 70 38 24 40
10 10 3e 00 35 ae 10 00 00 18 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 36 2e 34 20 0a 00 eb

I do not have access to the datasheet and but it is tested on above
mentioned laptop for a few weeks and seems to work just fine with
timing info of similar panels.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 944c7c70de55..2298fb312c95 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1904,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
-- 
2.47.3

