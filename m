Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A25ECA273D
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD11410E841;
	Thu,  4 Dec 2025 06:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cgKlePJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C9F10E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:57 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-640860f97b5so690905a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828416; x=1765433216; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=cgKlePJpg4MY2077B1XSI/rG+wPd4k+2skoXxTvaq+HEUWvboGf7zFQYUIhAAhF/WK
 66A8HFBUl8dX1oV8ksDvFsG5w0fn0nt4XQmUV/II+RLFezV3TtK7OsR8aQwMsEdll08U
 snYFPIRoHyCXrRkBfI+0sOghc1VyEsw/6Ic1PdX0+MIHfyC/CGj2spRRO8s89Zn0/3fj
 yGs05azVYUh9ETRuXJv5dvdOS1TMJq3w3xQc+cvVsBuUMSSGcP6iDeUiJjS0y0OnJa0f
 bZPAcxLiIhRbLZUyEBC12TrTuWkA+kKq/Wk6EkGXidFcESPKMe/rHUz208Es9IG1QIPr
 znwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828416; x=1765433216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
 b=FQzJyi8em7leG3Ob1n5XtWs8qi3MkBY9fILpjDkGpoxvx5cSciJu1xGPY62a2Mhrqn
 TqHDghJTL6lj2ilXJZksSt8PGTRssi65sqhvQaQAnKpmkdTIZbHzC6XEt+FuOqWyupQU
 EFdGFjc1JXqo5ikxPGGr5N6xAr3RwI1SxPP3QIez9U/cPQW7I72gQJaHdGYXIp7T/aY5
 Hdr334x5M2RwxMJuHzW8fuzZkCQZ6IpzX8xNtnFS9CX4sVIJYn7uDitAUqOnCjVfaiCb
 WZopSZUtplvQrY2gfxqK0GiR74ZUXblgmrM9EJKh0LRwpI3rbEcIcSXaOASBO+z3mcyK
 /r+A==
X-Gm-Message-State: AOJu0YxTDPxBFxUAiSkLS1Qqhl9lRI+DHFV+eYHZVZgRcRVUYc5bgPqR
 2MTLDNRxEB7dYvQV+d+2E10Rmq0MD6sjBigAmZHib5bP2PtQQ8pPRA20
X-Gm-Gg: ASbGncvXAJo/I7LRKTnf2ejeAuGdIuZgjJ+LcR0UEDdgefeAAOyIiJoxzxBYD4GbOR5
 ex90a3sXZ/lOjDcWa+E+Aaf5CyDNqD5tX7rt5/Cf0F7B99ltC0YVLjT++YlfUWzw2cv/aabsqxU
 cOEIzGkoUnuYr39DgatDCudS3dJCJWxEkJBWOejf3lkbv/T6XKiO5dnjrkl2cDkurQjWJAo1Azb
 eXZAGMNY8J7MKa+rlNy7e2iGqjhgXMreLmUIqdmJ2lnFyumRWeapTvOvR+QcdxK6LMlGdtWXS69
 LmkTsAJxdMVtJ4xYvKGy28dk8N+gDLA4mN3MVVEp85cXa0FCYE43K8mgjvUiPjEg0mPENnb3rLc
 ZLYvh+g/Q0B78iB13M6grMaQlniy3Cy5l3KprQthn/O4ahxXp98J5DVOQcxn5Vt9X9VQlSzknEe
 zJ433L+wbFTA==
X-Google-Smtp-Source: AGHT+IHyJ5vSGGRsFzAABA0jckI72SrOSeey26WOAYb/OdF0iDanbXw4lY7HsSTswxWolZ3f1U5HAQ==
X-Received: by 2002:a17:907:1c94:b0:b72:134a:48c8 with SMTP id
 a640c23a62f3a-b79ec470ca9mr186508566b.14.1764828416001; 
 Wed, 03 Dec 2025 22:06:56 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/7 RESEND] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Date: Thu,  4 Dec 2025 08:06:20 +0200
Message-ID: <20251204060627.4727-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
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

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a5ca013d0db..adb244460a09 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1

