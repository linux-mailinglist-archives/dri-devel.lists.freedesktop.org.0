Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D161E675B66
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2E10E0E0;
	Fri, 20 Jan 2023 17:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBB810E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 17:31:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4245765wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4HRh/xECMVrkAQ+rHzLh2y2hx0e7txexSDUMhaR4Ks=;
 b=KOAy7WqeTvP8+Sbxusk9elhvfXIfyG8QADBBoywCpEcBPcOP35aZ2eFIxNC8ba5J8S
 ejgpcz6IZhgQ9jtjJjsXnZV8qJ3lJwF/gXp3RXcD5Iw1lT+tDbvTzl1pEy1IdC7jjqks
 yrCtZnhYlBkJhI1HGOBOIu/IUvgeZdegsizv94t/ybFUOdb+mmXUSDb2bH5EWTiF1JzI
 57P7OTdbT1iHUgcpQCsP8xnLFNOvrS4oIzSOG+/fb3avZa5o9MFFxqRWHjUjLDWYqSMu
 tscKRJ9ohqkJvPnS9tyfJBUYEd+eLXgcDKmf9/3Im+aZ6ONe0YLvaVpYyujNycdX2gXP
 EQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4HRh/xECMVrkAQ+rHzLh2y2hx0e7txexSDUMhaR4Ks=;
 b=GDQt7qh9iZn/d8duf+3LASMgbD63iUhDbTr8aoiKZ6fXOVNoIiA04XBOn5uKuYw5dt
 mhusjzcLAGm5UzfRnHUJAyNJA1Mz1k1MxUIdDk1g2ZPn/GIzbB0de55IRWb0BoKy8OCn
 uQ28HliLl4ufuIjaYtncIDxcxacpatx2k6yG0Zi8/67YoNGF7xUNm0jGlG3FoLLnRbRv
 d7G+H9s0BF7mMARM19+c75qEmwzrG1hJte4O/KNXPJ0S8Cw+rfGZprE/dRD0lK7iUhQx
 uQKeld1tqX4N7HuJmzGVbO5+ZGR1fAUEi0kbURp1ZvmOdrh928QF4R6+7kQUxvNIcLEf
 NHeg==
X-Gm-Message-State: AFqh2kqt3PP9tvnF8ok1hpWUnPZUxvl/q40ElJXMu94CDI9BKxOGejK9
 a5EIxlYooPd+8LoB7rVVgNE=
X-Google-Smtp-Source: AMrXdXs++sNuHqUOoSyqqneB+mzWpppVn+a3j8F11wwCSMf5OEMNBjzUd4wpvTw9gp8LCE0jyfcYHA==
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id
 j35-20020a05600c1c2300b003db0b9f0f2emr13321794wms.14.1674235867778; 
 Fri, 20 Jan 2023 09:31:07 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d4588000000b002bdfb97e029sm14413258wrq.19.2023.01.20.09.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 09:31:07 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 1/8] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Date: Fri, 20 Jan 2023 18:30:56 +0100
Message-Id: <20230120173103.4002342-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
2.39.0

