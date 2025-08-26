Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23795B354A5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4A110E5C7;
	Tue, 26 Aug 2025 06:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WTbuzO/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C5910E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756189980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZbpsP0JVSHBALAr4RXTkvJiiQWMCbeHRvXA5B+Ppf8k=;
 b=WTbuzO/WXWlGBB0UKS3J7WJX3ehkIsk4mnzPa7ULza3R9f5XkfttQ9YQIiZbOpwS4INtXj
 VghfPv1DL3bjcwgUW6IT12CvEQZdqYR3cmiJO0LDuQ9uRQbEFQEwH9AtQK5REpuox93YCO
 ZS+bmAgcoziwg0pHFOxD+kSt81XHN8w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-2jsHeXyPOWe8bJ1BUr6T_A-1; Tue, 26 Aug 2025 02:32:56 -0400
X-MC-Unique: 2jsHeXyPOWe8bJ1BUr6T_A-1
X-Mimecast-MFC-AGG-ID: 2jsHeXyPOWe8bJ1BUr6T_A_1756189975
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-afcb7af3e41so436004566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 23:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756189975; x=1756794775;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbpsP0JVSHBALAr4RXTkvJiiQWMCbeHRvXA5B+Ppf8k=;
 b=q/PuktG2GtzkUN5pv3Qeci7lvZmDMgnAOfEgGnkrF45oX2DLsDwYxxyWpXn1fdCoub
 VBoPpJVILoSJ5G80luxpP8eND47Jhc1FhxQ5sOrcbLvN6LnFHy4znEhfD3mM5f760Fou
 B03740VHc8uNEQXNAUXE1/VHvnqZY0CN0udSbxx++FLF0U4aEvp9Q+fElJ+ngUYhsdh/
 nB/TS0UDzbUWAa+ukRUAENNmLcT+jXz0pkj3rywLs1oXsjfezy6Sbgv16IsfCH840Iz3
 Xrkb0bV0BGFvxvd0YSXoVqsSsPyuWln/U82OECzCmFOIon8hnFwNW78EGA8INuxQAQF+
 SNBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKPQUtZEuEd2qFG7XHxnO+Q4qNOx3GUFm65igxqRkUHQ1AM0pJDF56ta5Zwbc9GmGmi1QNSKPybEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybPnfX260ap2BmXoXkrb54ru5Ta/0k/IO7aJCfKprrl5kISbOw
 ocCsCZy6gd99cCYOePoVas7NimscFRGrt10p+jspns33gjrrOGalwncA4qiiEjXhf/911ig3vY4
 Ou3lmCGz5VL78Ffzce78qfnGr9Cz/dd+53TTQSQR0egwVHoBiMZl5b4a9iwAdOKb3DZQPsg==
X-Gm-Gg: ASbGncuX2i7U3jHMAF4rZbk/CsbOb9gEM36NObM0m0AuvXgTCh9BQSFj6aDKAgQ/XTt
 DHNxEpuaXe/zH89FgBK54I/V3m81BxZK9xUIU9bGip1cfIFUqDGGFfQg4KuOMBvKjh614QTIb+l
 JODW3Wucr4Eq6FicBaMGlVJ09eKLkzrk7TIuR0aKAJgLXD5nj2Q7Xw8yaVmP879rNvRasGTpMdK
 S2dgeIg95YUvTeBE3KfZ6hA2yCj+obFasUB/4NdZGeY6CApJBxu8LGQnhY5e2Qnrw8iI+beb7p9
 U65EQzo2OMmilSwKqy0lazOl5+h6uWLX10KQafywbIWSx6w7vPkK6Jlx0v5qJkgq6y8i7vUxoRF
 LLVkt/41MXA==
X-Received: by 2002:a17:907:86ab:b0:af4:11e1:f877 with SMTP id
 a640c23a62f3a-afe28f162a8mr1291526066b.21.1756189975115; 
 Mon, 25 Aug 2025 23:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmSRbT/Wld10PpqjSUmNkXsFiZtdZslyiz4ToZl4XaqIzH5GqNA9prjgy3b7ugqVJ4b3iyig==
X-Received: by 2002:a17:907:86ab:b0:af4:11e1:f877 with SMTP id
 a640c23a62f3a-afe28f162a8mr1291523966b.21.1756189974678; 
 Mon, 25 Aug 2025 23:32:54 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3174f806sm6346137a12.52.2025.08.25.23.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 23:32:53 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in DRM ACCEL DRIVER FOR
 ROCKCHIP NPU
Date: Tue, 26 Aug 2025 08:32:48 +0200
Message-ID: <20250826063248.32153-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gyIj-qWwvAzhOaBY14rAdlCkjehZU1rXNkycAXSSkGM_1756189975
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit a7352c849492 ("dt-bindings: npu: rockchip,rknn: Add bindings") adds
the device-tree binding rockchip,rk3588-rknn-core.yaml, whereas the commit
ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU") adds the
section DRM ACCEL DRIVER FOR ROCKCHIP NPU in MAINTAINERS with a file entry
referring to rockchip,rknn-core.yaml. Note that the file entry is missing
the part rk3588, compared to the added file above, which it intends to
refer to.

Adjust the file entry to the intended file name.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4bddc462c07..a569828c9f3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7542,7 +7542,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/rocket/
-F:	Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
+F:	Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
 F:	drivers/accel/rocket/
 F:	include/uapi/drm/rocket_accel.h
 
-- 
2.50.1

