Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E563B42D0F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4354110E95E;
	Wed,  3 Sep 2025 22:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fw1Kb52X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DA410E95C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 22:55:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2445826fd9dso5694985ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756940110; x=1757544910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PERM9NW9/epjauAQ647nr1Bnq/1hfYwv4hqg012Ys6w=;
 b=fw1Kb52X3YX07HIA43y0g+X8KseLEI4qWbb52gISAx9UNcsuYFMLbKBberMSG3zkze
 5vsEmtI+ONL7yic+Uz1np4ddUXdmylA/1zWZbE3ZNuwuHPsK/OOj5Bn44aawnqZB2Bz0
 SS6mgQiSgPavHjy8DawdDsmjHmvlqohoOTmUZpPRt2W6FZqFohQIDAglrQKd3yodHxvx
 xIqL9P5jnESsEDlTlKrNcI2gZhNp0z4dy5joJ372/fOg5iVWeLLsIcJAOx13nymWumFh
 a2wV3vNfiWdvKvHU/ZNDFhiMIfV8FpcLjVBWRDXDGVeIGchVKfw8lCmKNgvthUkFuBdi
 e2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756940110; x=1757544910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PERM9NW9/epjauAQ647nr1Bnq/1hfYwv4hqg012Ys6w=;
 b=aqa8ISxYdwScjj494gcoLM8GWsuOhH/qQUDGrqOT+ZXzYBjMj5sI2/uDj4PWknbIYb
 CS5CCq7eBLRx3gVHriiXji297CB7BEohW9OMMYwwr1E5ByysVRUM0jXpaQPNitxx6A0h
 VDPzDbJuGOsBQNjffBYca4qeuBnBVS5GF7/aptIaevSuV6P4Yw9CVDrmYsv3wqQ0tZBB
 TYlTObtjifHXLjt14T+1H4fqSvijVfdXSK//A3pkye6GDNsXo5csqQ7n/ece/E4ntA8h
 R6KqZSMRx4r636tcpqFzbY7vuiu+oplo9F7P+FskYaK2uFI2N+S3E5sfMCgyJ7WbUuwK
 Na2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDRzD76IjKtJQME3dGMwdX8hMpEQ2jPZBlGlTjlG40zLame6B5h8pKai9uOvIS/MNvdYfEFcqxDVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Q/uB05LCgNbOVjtEcg6d+TjPlaG5Fzc1KUZpk5U97JjVt2A4
 X1PcyjNUNFUxOG+6TQhal5WAgMW66vzijVFJMY3zSyamBTEdYQN5A3mr
X-Gm-Gg: ASbGncsui/Wpgw1gn/2i/jvJFr+AnnQrg01Y97MlqCkrDA/fFkEdHAqaYdqqOju2jUF
 99BrPgUwDKOpRpOA9BXa5uU+0q0TrTI98jSLoLasduqtUlN+NVtN83ZAwyH+KvVJgZhqkPyahRZ
 3rZV2Y5P92oiV54l2QBKgcCV4l6Fgn1GfveWx3RynLZz4okP0GfivoWLABrD6P0DXWkuxLpEP+w
 zJtS7xjEKilNLTVEAsPHTIawk/0y36Q8mDhWFGMsbsB4/uOMXPhD3/7swzGadKEDmBsCeUUCBGT
 SNHu1IeM/3kSkO1VOiO2pTLu9P83L/rEBGbkmUNofSDXLx4NkUfaBVpykacyUW55kTdIgpO5OH0
 zMktVTKW9WZ5lbtaQn9TDwPiDWF++1CYweRhZrKRUiVIaBOYhuWIMtaMDivriOPSHtUyyDD6cP7
 M4bnDAH9Ctr3LWhRaltMFN
X-Google-Smtp-Source: AGHT+IEsF/meH81c94jigsHRiHn2Bi2s+9U2J/0U2y+3EgRD50sJHl+AM1/5H0vpGBx0GalxnBVwlg==
X-Received: by 2002:a17:903:38c7:b0:246:2b29:71c7 with SMTP id
 d9443c01a7336-2494490485bmr220520735ad.25.1756940109605; 
 Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-24c9c2b1288sm25505435ad.106.2025.09.03.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 15:55:09 -0700 (PDT)
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
Subject: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Date: Wed,  3 Sep 2025 15:55:03 -0700
Message-ID: <20250903225504.542268-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
In-Reply-To: <20250903225504.542268-1-olvaffe@gmail.com>
References: <20250903225504.542268-1-olvaffe@gmail.com>
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

MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
panthor.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
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
2.51.0.338.gd7d06c2dae-goog

