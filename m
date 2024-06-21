Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C749912686
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B30B10E6EE;
	Fri, 21 Jun 2024 13:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IZUeTgpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f99.google.com (mail-lf1-f99.google.com
 [209.85.167.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9D210F177
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:20:11 +0000 (UTC)
Received: by mail-lf1-f99.google.com with SMTP id
 2adb3069b0e04-52ccc40e72eso1579194e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718976009; x=1719580809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5SWq4O+1fJQvBFv7KtItarRKM0S2vzLYLjmxEsd7wc=;
 b=IZUeTgpHO/MMiWjFFqaINytyK+SE/qTXnTlvEerxeCQ5tlovSEs1DUOfInDFkMDeg0
 TCueTTxNrC6v7OXzqQ3TFCwuXTP2KyAAKL42RQn9KB+b+Kzk/guNwae57TW03/sY8vIg
 ZuuNbkT0cw+isiz/O8GyN7zvpH087pgvS1BWmnKCuloLts0a7UqTwowat37uzaGyUy1+
 I55bPsC02q5WIYnjG1Qgslt3+v0Q7OYQgQ7VMv9bbrlrdifnOAz3ObMjUyL8Y+Ji/aIj
 Rh7y+R+VSThJLuw2/pkhkndZHBCOsh6TPkzylnGpfws8JbtFjwwZyd79WJgKhkzZAkPF
 WUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718976009; x=1719580809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z5SWq4O+1fJQvBFv7KtItarRKM0S2vzLYLjmxEsd7wc=;
 b=mSQ5wdKc7BPjSoE8Md67bcP+GeHQrxn5PiWAoZr0J2kGKBsFLjiCqrv67imLz6ZXhX
 t1kbyYcey//TkKVrQEwsbQGtAqkLkmTI2CHYemzRbu1+MJXKjJTr4xdcqEg5wY4n62uv
 tvq/SWlq/QDp/KDy1WeR0S8XPp2yTLokDUP+7Po7dNhbkWLTFVKMuxMkKgDkw49ZTQk1
 paRauZRXQ24q2Vi6Nhz1STWS7o9urGOEPlJBMBhPhwB0lF2DOp7s7i8u1SImgQHz3uwi
 AcEPLD262ElBYiwONHQR9CTecPJ1NO1EMR30iPW/9A+RiOoTOvUufkPAVbQd8RTT5Ags
 WNAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1amBnWqqTkjsJTO7q2jkUpbM7w9cxnj2kyCqONyZGIUtkMwOYHshCm+M5wt/LR4D6gDBcAlDDFcIsgPna6JBXgZA+T1cwokSA8ScLTLyh
X-Gm-Message-State: AOJu0YylNj0p+JaUgS8azhXwunfTmoF50T9YHGePZOaTj4TJ3DAyHirZ
 1L/C+c6fF6RlXyQgqIsdFnzUzsyvGvq+WtNSzB1cdL/8jMvizhFdfASSrdNPle1NLDCGAyvvYvv
 hwQWWID5L7qq4rnTMRmKc3FEatFVzJ2hm
X-Google-Smtp-Source: AGHT+IHqUZLsTLgssBIZw8iReEOCHqen18GXQqnxoCYS9aawC9ZkikLrQX1xkcqFEecfByHdZEABleDj8t0Z
X-Received: by 2002:ac2:5934:0:b0:52c:d70d:5ff8 with SMTP id
 2adb3069b0e04-52cd70d618fmr1239567e87.1.1718975979306; 
 Fri, 21 Jun 2024 06:19:39 -0700 (PDT)
Received: from raspberrypi.com ([188.39.149.98])
 by smtp-relay.gmail.com with ESMTPS id
 a640c23a62f3a-a6fcf549578sm5170366b.148.2024.06.21.06.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 06:19:39 -0700 (PDT)
X-Relaying-Domain: raspberrypi.com
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/2] MAINTAINERS: drm: vc4: Drop Emma's tree
Date: Fri, 21 Jun 2024 14:19:26 +0100
Message-Id: <20240621131926.3133484-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
References: <20240621131926.3133484-1-dave.stevenson@raspberrypi.com>
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

Emma stepped back from VC4 maintenance a while ago, and
all patches are now merged through drm-misc.

Drop Emma's tree from MAINTAINERS.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8dabcb16d29f..3fb03de446c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7523,7 +7523,6 @@ M:	Maxime Ripard <mripard@kernel.org>
 M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 S:	Supported
-T:	git git://github.com/anholt/linux
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/brcm,bcm2835-*.yaml
 F:	drivers/gpu/drm/vc4/
-- 
2.34.1

