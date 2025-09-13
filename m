Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A7EB55AA0
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 02:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163110E233;
	Sat, 13 Sep 2025 00:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SHS6cxob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A362810E055
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 00:22:00 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-24458272c00so27121815ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757722920; x=1758327720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1c3CBG/NboBfPVJVTzHzXXMWP+/wIvK4O9TlNT+vRDg=;
 b=SHS6cxobgX1iAmLixu3C1nOexQRxYvDQ+hm01hjoZpsc45NZQD8jr9irmNwENfpERV
 l7EazqOEh4bM36DR2vNldVWPpEanbkvdeKeHbk0tHFqrcKCw/xTAz3F893X9efFz9DGf
 Vfn5JlJXhxXgiZzU7FUZA8LjJabMuYUQ0LdpoqK3h+Nhaa3bOl0ZvDsj9dads4urJ189
 kA05jHQmgcDyWFFpummKNipCVrH5hSgQYuJUiPiRUQz/E2GontDgaxJ/KNWIR1HXJq8D
 07zyuqsCR5Cns/rC3CZSZlpemfW+6Uah/1HCPk4prX4XspKWZIJYRly8pCk+8BIsI6vI
 +Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757722920; x=1758327720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1c3CBG/NboBfPVJVTzHzXXMWP+/wIvK4O9TlNT+vRDg=;
 b=skEhbrP6+xZCVeT9vz+FNdQQw1FFyBClNsHGp+2jafxnbEQwXfNsz6lb44UPRj1zAZ
 6xo+yo92uMt1O5dprk0j4iktw3CVcWumbEOXOOYh/UZ8vbAJby1JmUD5pOa2QqiFFrnY
 vYlb14fyUDfdRIXagkCKRIIp+wqdatQnwMiNrp4TRkE6BbBsy+Uj01Qf09bv8LGsp6s2
 YZNSi5MNzQe6jLzIeicuIs71WSFDK/fpbLGrPRfGEfW0r5n+A3mWFwJ+1goc0WvjPHSv
 8LD0TZ8vCuREVRkDu+qsGyzuFkc5dU2eYGq8lTWw0P8sBf4PANrG4BPU5i4PCY/nmFXP
 HZjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuJn1VFw6FWIO9U5nwcn4benj/sYq2yVvXVst9gJtjVfpYqBP2rkrl3wQmuV/JqjPmiSBaIItCvto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr215YdYJVENxmH+we9EVc1CPgH9TApg4wNfMYo9ng6WQvmThy
 Oae61The/GQcJn347pQjND1Rr9/l83d/SC60RrSJX/jzePn0XVkvFBRT
X-Gm-Gg: ASbGncuYUG4v17qAEiv6OkwDNL3EBKluAadUd1rwtM5zDcB/StG0bqP/Jd1MsjkAFM/
 yzxyi59xVkuzTwt85rDQjnaO/MNRug81x1IrmhGLpD+hjyJMrbvap5zjXFBOOJwPwy8JnCA1nl1
 H0Uxq/IFyY+NRUotWH29ka4N7KMfgrdrQP1KfsjlKWmY8FtS0lzwbBeGaKZ6P+ATwuN/OOfU7TD
 c9peHZQShBm3NTf2t2338XfU/hKHeQ6qbDZZM4pRpQqkxuMMrAZaebB1JdIbfpvh/2mJtS+oE/O
 0eNMLFEfZ2aur5oGDJdLsdcJ13GgNViylfqH7VBp1irvvzxKEwLjbtKfheQiFIc7ZjmWg6Drql9
 0dg1jJu0AnGXaHBKj1TqToRLkjYLyyrtgpL5uh3ZZztCdcNP5rCJlmr1ja66bS+gxKWNmcPCGPD
 e2hTLnSgmKaQ==
X-Google-Smtp-Source: AGHT+IF+nK5Fq9ofZfzYEh11WCYZrbZLJT0mADN5dCYbpAjIJMEjmIB/u1gmzzXb0gcqRVsJ1Y5rMg==
X-Received: by 2002:a17:902:f78f:b0:248:79d4:93a9 with SMTP id
 d9443c01a7336-25d2713422dmr52089335ad.55.1757722920172; 
 Fri, 12 Sep 2025 17:22:00 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-25c37294b4fsm59866135ad.34.2025.09.12.17.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Date: Fri, 12 Sep 2025 17:21:54 -0700
Message-ID: <20250913002155.1163908-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250913002155.1163908-1-olvaffe@gmail.com>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
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

MediaTek MT8196 has Mali-G925-Immortalis GPU. panthor drm driver gained
support for it recently.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

---
v2: update commit message
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..7ad5a3ffc5f5c 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8196-mali
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0.384.g4c02a37b29-goog

