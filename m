Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D76D862E483
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4F10E670;
	Thu, 17 Nov 2022 18:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327E210E669
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n12so7249449eja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1Y534FPxsILKuYr941GBaBsx9fst1FUuLv6sIi19Vk=;
 b=VkGk+0U6cBBKtd2N73D6xUj20mWTYj9z2tO2H7ULxskuzctUAZqtq+JcJL2RtdlPsC
 lQ0ap0XqRcig/75B4gx/g7uWtUYLJbrMMa5+nJXa6AjOpVz1A1RDtSrEMRkKTP2KocYZ
 qhxM1BlzZuIjImn045YYAj7aTqzJ2KnQuGyhMx8UZxzLEP33xjzJP6Y7E8Mh5093BEMN
 dzYtBOd4EGkOgMofNN9JyHuBhAMVNgRJ523p57BbfezDEwibZxv7WvVc21VgMEFIXUyG
 HJj9KrknPq/JG0NRRhbJgG8rRKu5lOyFP3GfGaKI0uHa1fdZQHdtaAin1901+luOjktW
 4H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1Y534FPxsILKuYr941GBaBsx9fst1FUuLv6sIi19Vk=;
 b=yRfdVSKaMHP5kmLCjuXO+ljBaqeENdnUZO+l6xoGCnInaBnQ3XdoDLn4Mk9hLKHHZs
 8LGt1cwkzIBulfeWtRwSf21ronOG7ZOiwmp0toE/enCd/e/CPsh+MMF20cyW/aPXk6Cv
 FpZAu01OsoVmti5jlW0QUgYiFgvRj0J447eYzXwRLE2n+ytXODXBOPh6TnCUEGoOivwm
 hF4HZsWQ4tiy50OhThXVtuoERENi8kEGUrX1OHKMQoWJuRxoLXkMLf3NHx4aF4G9FZeO
 2TYsnb9RoCeWjsTzx71nsunbZD/5HZTbraJbgpJgpuh239MsJD7abPPLEf6fjjbG5cOF
 jnlA==
X-Gm-Message-State: ANoB5pmktKX8eiCzzKR7No0FWzIw6Zh2rMRuOPCR4pNcBnwFCX8mf2CR
 o4B4w6O5c+T+Bhsl6R5ZbFk=
X-Google-Smtp-Source: AA0mqf4gUTPwjVT7ASJewg8oNP3zMRDM6ATE7vRgNDo94NVRs0c0OcvNjf3/6CDgJqmkO5mUA7OA2w==
X-Received: by 2002:a17:907:98ea:b0:7ae:c1af:89af with SMTP id
 ke10-20020a17090798ea00b007aec1af89afmr3133088ejc.550.1668710446390; 
 Thu, 17 Nov 2022 10:40:46 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a170906604900b007b2a58e31dasm700772ejj.145.2022.11.17.10.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:45 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/8] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Date: Thu, 17 Nov 2022 19:40:32 +0100
Message-Id: <20221117184039.2291937-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.38.1

