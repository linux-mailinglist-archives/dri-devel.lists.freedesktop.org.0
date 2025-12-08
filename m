Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F56CAF413
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2C910E4B4;
	Tue,  9 Dec 2025 08:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjyjfAgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8E210E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:09:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5957ac0efc2so5201586e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210174; x=1765814974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vBiYrOPvN4WtYOzD+XOZybGex05ltnyRorDWZhkE7SE=;
 b=GjyjfAgU5lPdDcgyJ28uHjQohlCPFdP4efd3nLlQ38btHxPyOygvqCJp+ol5e876kQ
 9KiJIypdxr2EkuOYosDxbB0sOPWATZ7jLh5gpiB6WbO6jJ0nCXIy82YxOPFyaYhV5I/5
 kaQ7QMgy4pTQHe1GqvB1iMDy63jvUgUJdC8S3h3izwISf0dDUFSI9tTzjYGVB7yqLqQt
 NGe0vLEDQ7DrBgmjnLnnDGy0H1H3iRQsGPdl2X7JTaYJ5lRCT477Sa5Ms/+oLmWhtSLG
 zhGj7XXw+O/ko73CUWe12KU1mhR2/CUSbmlYpoLqT6INx3ZiekjIslr/K6y0JwreEHv+
 ljmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210174; x=1765814974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vBiYrOPvN4WtYOzD+XOZybGex05ltnyRorDWZhkE7SE=;
 b=u50wnM6K7lcTzSou+2rQOFnAe0CqtAZWna9Efvmj09j64zxjURjCHki3viLAKZMHPr
 iFw24dB18zqt6Zuq/RhkkE0nx1i66+b1jOxHzEBnX8G5Ddoa+cJuJOG3ykaRpelwdt0n
 7AfvbVOGG9oBiDiRph1WfpESLQ+gblpiXffJ+GwbiwiK+yKypC5wvW4OStalQzXhJyQP
 Bn6d47nI3AR5em97OigxpSzmLxwlq1wkbm7SgORWpeQwqieVJfUPuqLaJ+7J9ZTj6GWL
 NfNK37BLFPQDt018mKUUFjBYXW8uoEC7bAClr5FgFjWU4KqIeLsysDFZCZ8lkJuPQn7a
 DYUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfCUTr3PR7yEHhHVgigEEwuPHN185f1Xg+ti2YCrNyTtoZVeqsuEr8Slr8bhIZBDD9in/OOfZfT18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjS6mARHjI0XztW+y/Ni3qONDhFMGwO8UYvVn2GAWke4T44Z3P
 eYQEchOtwmEkHIf7dDFTIdPpcl4sijXE9hRqCvWf0gZv5F8uRDtzxA1K
X-Gm-Gg: ASbGncuR8vovnG/PbZtla735WcNw18ADi+yQGiIUIVhqp4kM784adD4ugsO1vFAn6VM
 9r1u1Uq0uG5SEGK5/WiHv5TQ4Iz3eXxSY5tOPU7CKH/TG/6gskKcYspuYVWnd6vGFVcZCIUGPRn
 S67L28Ae6fu0c4Yo/fr8Y8IabHdQslIPipnQ+gVddtSgy2ce2CUKfZ+fI7TDucVt4Zsr4A04HGe
 O0XMcP6v4HL6RdPF29YGjLwMKu9slTStxAgiwxCIp0bwhJ0mDTQJZf7SF9Gg/8eFduXVt3+nsmw
 O9iEthTVDG9m8LM3No47d+bvtt5dSehho5AzVmsd7mj4eKl2Xc/qqexdV+7tQ38MxlGmSGFOqmI
 hwBqZZKI6dC22CefyK+lNaqH/naxh5bUCMtctkE64w88lERYWWIdONXvFn/JqDP/dcrhAwNZuMy
 78VdrLOCkurw6cUoBY4gU=
X-Google-Smtp-Source: AGHT+IGpQgtnT7jrvsxdLgQnAhXS5wPJZqyaEtMxAY5lMKOuMbiqn5kdjCB8Z8AvbiPZaHo3HGPsrA==
X-Received: by 2002:a05:6512:1391:b0:595:7d95:eaad with SMTP id
 2adb3069b0e04-5987e8c97b9mr2538649e87.22.1765210173470; 
 Mon, 08 Dec 2025 08:09:33 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-597d7b24725sm4207106e87.22.2025.12.08.08.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:09:33 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display: panel: Add compatible for STARRY
 xr109ai2t
Date: Mon,  8 Dec 2025 19:09:18 +0300
Message-Id: <20251208160918.3760498-3-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251208160918.3760498-1-vovchkir@gmail.com>
References: <20251208160918.3760498-1-vovchkir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

The STARRY XR109AI2T is a 10.95" 1200x2000 (WUXGA+) TFT LCD panel with
himax-hx83102 controller. Hence, we add a new compatible with panel
specific config.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index e4c1aa5deab9..37f4187698e5 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -28,6 +28,8 @@ properties:
           - starry,2082109qfh040022-50e
           # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
           - starry,himax83102-j02
+          # STARRY XR109IA2T 10.95" 1200x2000 (WUXGA+) TFT LCD panel
+          - starry,himax83102-xr109
       - const: himax,hx83102
 
   reg:
-- 
2.34.1

