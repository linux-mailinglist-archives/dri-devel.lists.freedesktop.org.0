Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87AAFC85F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45710E5EB;
	Tue,  8 Jul 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T/sVNg0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DC210E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 10:06:53 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso4928840b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751969213; x=1752574013; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
 b=T/sVNg0STfK4Xhb5K8qGmR0dxxRfN8imPmhP/mWGAdggJNpYEjvB5zBag/DWF5mjWf
 A8SDoAzMVW9dJZmPrPCbvdgRLDMJeSPZuLSeBwpb8AJBxc3/3XaKJtUgnV9mk8iiivXg
 B1jklX8hZxkhfiuwX4XHs8ZZWgWRTf4juOg9R/CFX5uu9InEC8PVoIDeEARK6KlVbTy9
 fci40RfO79DuZ62MxCt7/Cc2xuOM5+sx1y3QHvRFKfd/xSNdR9jYqT0ghSTjw4cF00WV
 vPkNIegjHSg/k2U6dL2F+0nAs4IMJbvbFXU27n/jsL0B4+Z6EONypjkcedFB1IJQ8PHz
 ehrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751969213; x=1752574013;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FidiboXZ0gzp0Kec1LGu7nNmgcY3DYoC/ILAAPmTqbA=;
 b=c3Nn6EhXdxTcU+Jx6JPhH+Sf1TqBvZ/vpO/WHXXCgp9Fbr1/ylBoWA5eQcQyWeNU/8
 iWGiPd+U7nHL5F4q6IV+hYQoIzYa8D0qoVGI7TxkhYh5fZxCfDBWsBUE5uGkLsHr65t9
 a+uj8y8q6+xQ5/RZJ/SjIxjX25XKHxocuy6YZmj3McsGvUEtanzygGCEv9QmI6JnxYYR
 hJTIUh6mXAkfbDP9l2R+TgNw/MVZhp5TVhj2L/IMWYtR2owK9Y3tdPydLVUQD7Pax+/5
 fWRn3R71FHWXaC/9pVFyFH0pOlA11e9oImdQrpsYbMEaMw6L5R1amCOG6vihrMAyUul2
 +Fdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6HrzoTiAGWdKlhfjaw+WGqgE3+pcHxmHK2j/dhhkTU5qn/j5jpFUIZAxjxdSUj1w1QjAageQH7dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhLL2A/8F2M0HB9Lx3kI6IjqAn7mNKWnr8XUgHjTGQMGB7ea+h
 t7TYyw8SV0RjaFcRoYJO4mbxPVoRsa0/Yq7dYiRmo+O/KhIxMIv2V7kt
X-Gm-Gg: ASbGnctGefpM0gb0kGOjMeEHexebBwNVjOni2DW9k/Xl79ftZ1aFpBeslGHXbVac+JG
 ulSMNVrNjFyzwg1W105pKOQ32MRLjdkzP027XwUNVWMkvplqVfWe6RKG5unPPbB5lNlo1F1HaJU
 maND4SJrA4w4H8HSu+yGVBfMt7s/Ra6bVq0Hmv4aIhDbjqaFZCVGK7OgYy5jGFZoJrx+dk26jeo
 gV+ls+4/GE0UZIG3Sw+64Hi0xIqDi6HBGZVtGZgdqFdQu7dodKWaIiSkkZLApw7tWF/1pO6dfoP
 bCrqj3zHg1zhIiUEnzTPXQ3C8ffYBsk7PzR8YHFTLVbST/WCvs4WDJ9TOBaiVj+k/R/+fpsvFoQ
 cbkjaUNgZ1J07dBU=
X-Google-Smtp-Source: AGHT+IFewpzclZyxnesMZaRtcMFIElw0zsDq9OvoX0V/pR5YCz8QEjnGaDAHYbxR8XFtrnVwHMlIag==
X-Received: by 2002:a05:6a20:3d1a:b0:1f5:8a1d:3905 with SMTP id
 adf61e73a8af0-2260a0a3749mr26243533637.7.1751969213190; 
 Tue, 08 Jul 2025 03:06:53 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:06:52 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 08 Jul 2025 18:06:44 +0800
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Mayqueen name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-v1-1-45055fdadc8a@gmail.com>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
In-Reply-To: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=911;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=7tai5uwBpFBvYaeY6h5Abr0Rx7uTXpN3nWfu/5kwtvM=;
 b=cKOZVPExWQWMyRJmZn0BRm+70Xfoj0yzcb6DNgi9bG1oPFup6NuwxO49KkRqvjhl4zWswSS4g
 vSX+gLvS9GXAbmFzUuazjZryr0Rjz/8wi5+DwzETSoIBh99pd+6B9fO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 08 Jul 2025 10:27:43 +0000
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

From: Wig Cheng <onlywig@gmail.com>

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..9207c25a3490a3aa5cc9d513290e7890799f92cf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":

-- 
2.34.1

