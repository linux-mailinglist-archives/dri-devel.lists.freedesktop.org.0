Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B58A0879
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 08:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B969610EBAB;
	Thu, 11 Apr 2024 06:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZkPZiKmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142110EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712817007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QjytyvFJKqQcE9RcFAinE6xUHtFSAIxr5mwB8QS48zU=;
 b=ZkPZiKmCVL/hQy2aTD8TGvBA8+9YL5lUSqO+5DayPld2lp+tLjm5wVdE8ZaDw5atEZYS5o
 jw2r6/KCnbeJ9/PuvAoUjM3y0m4/+3sH7YdrrFkEAwRJssikwBCPBzTqKfdzZ+vCoGlQy/
 HTSG7P6b0UEE0NJVeybrZrroAi9UeCA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-QUT1XA8_MlKxOxx6V1X2Pg-1; Thu, 11 Apr 2024 02:30:06 -0400
X-MC-Unique: QUT1XA8_MlKxOxx6V1X2Pg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a51abd0d7c6so417295066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 23:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712817005; x=1713421805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QjytyvFJKqQcE9RcFAinE6xUHtFSAIxr5mwB8QS48zU=;
 b=Ynm/maESh7lZKwV9Q/52Hpjn/GcVkHpr75KMPNNr5sqm00wRYy9VbjiRR92TNaHYIn
 fBWhD5dljh6P6ajHjfUxtARh4KHQR/oR/z1TrEmjij/bLLQGLFrgOuh9/oyJiJqNGeym
 rzw1I6GwRK1tDMDACtgE2VrSTHgN0Mb34CpGHMqONRHpRBbFmhfPkKO3vEhA9BMUF4II
 NER08G6uXdKrXceRosejDmhrK/J+3ErQMe50DrNbpIqDPYvhj0MRTxZKE73ze1U9UDaM
 1OZkowyEkLJENGOyXZcKRml9zb3J5ldwta19TerpcF6PkXsxMNVx4paIR+jQttRNi3sV
 dd3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWVR0GZ8zyLi8bjhL3LiZWMEKaSQjwni7pCEl4yRMjtNwLJlVtgfQ0uAPiVK2wxaACmtimsfNUU9BtEtpvZk2/11f1ckfCw0A1gBviByM+
X-Gm-Message-State: AOJu0YwHY0z7bPP/R9GzboB2bHNF6xjTtCPa+ta5puzqoxtqgGRuV8nK
 szX8gTkODYp2LJDeQow2qRRncA14aWeLkchF5D51vseHW7w475N7ugmfFACnF3N9WGW9xaaV1wL
 qnA/6Ybs63Tq+Gj1OGQqT2tZExK6BWpHbkn+qm8UCtNNs9IPOnj/kd16SQAezViLMwQ==
X-Received: by 2002:a17:906:52ce:b0:a46:d041:28e0 with SMTP id
 w14-20020a17090652ce00b00a46d04128e0mr2888127ejn.59.1712817003803; 
 Wed, 10 Apr 2024 23:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuaTV6OOaUHrKVqTyvBXdctBjECsiWe/03rza41UgNLqH9ZqvOo15Y132Jc6oe7ETPBxBFzA==
X-Received: by 2002:a17:906:52ce:b0:a46:d041:28e0 with SMTP id
 w14-20020a17090652ce00b00a46d04128e0mr2888118ejn.59.1712817003426; 
 Wed, 10 Apr 2024 23:30:03 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
 by smtp.gmail.com with ESMTPSA id
 kf20-20020a17090776d400b00a51e9b299b9sm433138ejc.55.2024.04.10.23.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 23:30:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust DRM DRIVERS FOR EXYNOS after dt-binding
 conversion
Date: Thu, 11 Apr 2024 08:30:00 +0200
Message-ID: <20240411063000.48794-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Commit ad6d17e10306 ("dt-bindings: display: samsung,exynos5-dp: convert to
DT Schema") converts the last exynos display devicetree binding to json.
With that, all exynos display devicetree bindings are now located in
Documentation/devicetree/bindings/display/samsung/ and the directory with
the previous txt devicetree bindings, i.e.,
Documentation/devicetree/bindings/display/exynos/, has disappeared.

Adjust the DRM DRIVERS FOR EXYNOS section to this change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03204db05027..c2d913c64704 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7221,7 +7221,6 @@ M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git
-F:	Documentation/devicetree/bindings/display/exynos/
 F:	Documentation/devicetree/bindings/display/samsung/
 F:	drivers/gpu/drm/exynos/
 F:	include/uapi/drm/exynos_drm.h
-- 
2.44.0

