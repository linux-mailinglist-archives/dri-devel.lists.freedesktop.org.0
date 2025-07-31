Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC8B1788C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 23:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFE010E7F3;
	Thu, 31 Jul 2025 21:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W8th0MLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E94E10E7F3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 21:56:39 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so141209f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 14:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753998998; x=1754603798; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y2nFxX91zPm+pyMYKRygXODZT3df13yCxq2wpuLKy/o=;
 b=W8th0MLixs0p+13KdFJPQoxHVut4FnsA7Yf7QvN5T3wxZgZIWn2MteskHjsM2cb5Pe
 4jKaHutlKFVJKeYEg4KvwE6H5CXi5hNRTB7evu58RVkO60gEI9oyGXuRFUWdiZv4VG+p
 ncjca1Trdeffp5nTjGoAQbDLe8b4kT7ENfiBNUTUx4uhq8AAzHZvCXxWAEMpe2LN49wE
 rI6CWpwF1Nui1z318aPNg4F2bNHGH1XtM30bKakWmHoCVmt6fscqto+vxloLkIr1t8JO
 yahL/oqLYDcTTkL3Lr6YFqN5dX01BLhTWMqM0uYXXb7JdycXeQD7xqaC1GBSYSaUCRV4
 6B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998998; x=1754603798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2nFxX91zPm+pyMYKRygXODZT3df13yCxq2wpuLKy/o=;
 b=US2Eh6QwOEoBGgx44wG8w+pPG7q9jaY949IAn053p7Z6jcXgkkjf2wtfjA2K1jWe2C
 nVIPlghWBJsw8bfcYG90XnvpZjkrFvPUtR3jKu+t+2xAHHjVXNFViah8eefuMG3Rqd84
 k0bHWBj94hyzlx5iUfNPJ7+9FxeYFjissxhEy+/5muLNef383yacahqlC7nix5ztHLb/
 6rkAetD57LwfeUZQtrKxoCo9AR+mjChWjfXB39lR9V7tKdJ+Hd0NY6Trnp7caGmmbDIJ
 uUhOUMTs3KiSzwAxrzN9UEOHRiL5ZwVXncxE6wApHfkvTgxQ7qB2/dmGaqUVu9Ija1SB
 xlxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7Kn3DksLtjpAa5tXVRqC9b8XltuEbcICOeM6Rfjji2XhtOmTmyFf3oZQMjlDg5CAwHe3NHCzudCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFXvK740MzR5zpU9+PEoCwyzE5rViPhf4GtD00G4WOP8zK6vdC
 TWhx23KQU3yju7GMeT2aeAyyElcGRaizdLjQoPMCAYxrNXcB7LckE9s=
X-Gm-Gg: ASbGncueH18TOUex8II9GIga35KMAtNC13JLFWrZcmjFuc4UR/MEkCtlAzJAqEzzSNQ
 UJudE/NWTBiR26dSrJc3C4GWC2kjx0T1s1lK1TiwtICRoMmL9Co+9l0RuL+5wOZG1Dlr4KHRvZf
 J9AaOhAWeFh4NM3rxyNsxwBsSZ3sAFHlq82ecWJjlNJ1jFlEl9nEbQcE0B1eoz2UH+/aS5OfDhS
 GBO6GazAOAUpHFJwPodmbEzQtesn0NCOrjsw/GjNba1FfGz09IY6jQ5cuJoO5Lnbe2EkQY1Ooba
 aYmQtdPITmKpM/eSyk3baM8qMlzZB7GWIHq1d9wO+QdqkV3QTZr0YHjh3NXK3dyAhITCo1k9VQh
 hE3TbEK6zeTFrPJ+fTMnDeAnlYGUbWuo+VA84n5eMznKdKZWJ0Bs=
X-Google-Smtp-Source: AGHT+IGzX97L8ONWR8JwjiyIoXPw0KHB86wdgLoeHVWlbEMKLBZnEGpEo72inz6zGbfouJxZ1dZaoQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:cb4f:ac2a with SMTP id
 ffacd0b85a97d-3b794fdd134mr7035548f8f.21.1753998997661; 
 Thu, 31 Jul 2025 14:56:37 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536abb1sm86622565e9.4.2025.07.31.14.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 14:56:37 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/3] Add panels used by Asus Zenbook A14
Date: Thu, 31 Jul 2025 23:55:07 +0200
Message-ID: <20250731215635.206702-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Add x3 panels used by the abovementined device. The laptop comes in
two variants

* UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
* UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels

At last all three variants were succeffully tested. Device-tree change
to take advantage of Samsung driver for OLED panels [1] will come later
via separate series once this one lands to linux-next.


[1] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14/blob/master/0007-arm64-dts-qcom-Rework-X1-based-Asus-Zenbook-A14-s-di.patch


Changes in v2:
* Replaced guesstimate of delay_200_500_e50_p2e80 with more
  conservative delay_200_500_e200 as per Doug
* Picked Ack-by from Krzysztof
Link to v1: https://lore.kernel.org/all/20250727165846.38186-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (3):
  dt-bindings: display: panel: samsung,atna40cu11: document ATNA40CU11
  dt-bindings: display: panel: samsung,atna40ct06: document ATNA40CT06
  drm/panel-edp: Add BOE NV140WUM-N64

 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 4 ++++
 drivers/gpu/drm/panel/panel-edp.c                             | 1 +
 2 files changed, 5 insertions(+)

-- 
2.48.1

