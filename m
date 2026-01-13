Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50ABD1B1F4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95F810E53F;
	Tue, 13 Jan 2026 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnRnHPTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DCA10E349
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:49 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7c6dbdaced8so6528276a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334389; x=1768939189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqMQUQ/aJfEqDI2GLO0SzFgPGkoYzlQYbdw+E86b2Os=;
 b=WnRnHPTM4mGNBC0QyJtW4nBK4jocjqQrmxDvz0YlZ/lU2juuqyqWgqbGWSEvuPETzh
 vM+q7wbMVWPb64yF/YODZzkmm6gJnpjmIQ40MDoicf6scHXF4uVPlySCNAB/hTOwPBBH
 KWZmdwWHkujkl46pUe/gETyLSKxFNdGQbChTRUWKdPC+rpJQO4nM/Lg3I7PujrdU2j9F
 FGFC/7VHZouWs6E23/zkzgYrlj2xMKvuqEMgPSsphd22t12HcDeop1JbGzq6RGXJZXEK
 OHqJwWHJBW32pdbwjjRq5yRJ3m2OFwOdhvBrJ3EwaG5pcpulrxy5a5wr6Bp8+tM+bcJg
 EvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334389; x=1768939189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SqMQUQ/aJfEqDI2GLO0SzFgPGkoYzlQYbdw+E86b2Os=;
 b=pnG3ahgpEgRbc8mv2LM97IHlOjcret8bb7cQ7ZqWg96im7BBv7bzaCJgYupyxaqLG0
 H/a/ndK4dMmhvMf2DT4FQyClO8rMhVm90aDcugVV4iF+k34oGrNSszTIF0Ud/Wkv70hE
 FPtS9QEAmeZDbuEcNUJPlh1xTHOiqdgL6Pld1qhUy8K/FzLfYW+H+GwPKsLNk6xje/AD
 dxSp6qa8PKweLUk6Pb5v9QrbmFkmS/YkPGG/LEmoEF126i9D/8UVpJSrSaGT/Xte1vxg
 /BI/vv3SU3UOv4DvZ0HfVOXQp8Cb1HW5Zrnb1NDk1enCrnHjUthlOQVS00GEAz2L9GCa
 p+0w==
X-Gm-Message-State: AOJu0YwctACbtLbyx4kaCt4/6LenHDzyzWAEh1zbtTqCbOPUKekddprp
 QAfzS6bzWOAqq8O6Ce0ZODWtO0GrLdp7ytdub4xPlRAZseLswrw1/R5R
X-Gm-Gg: AY/fxX68uQSzOeB0+fK1AXErLQ7JEsq8fdtutfbgR5wR3UipiRd1k1xspvZjigc1GlJ
 NGYbDQlMN8O+8fQZ4H9rPsqQcJRmxG+1K68xjT38jkfGsWNHgydV88lgMWi8H9gR/bMdmOxoHU0
 MdCXHOjUcZMgSaf7wkKDH3wOGGZbZgK/TLCK1JHWg4/THjU2jokPqhKEi1wNVlBA9ebpbV7f8V2
 VdkeX6xy7Oo2l83NLmCpMOnVVXGYf/q2gTox/+MuEbBlpGbI/Zwq+PYPNMUNQDUyPQwy7STitlZ
 +96BsAyXPb7Yk8kXiypx+eMA+HmVBxBpr/l9iGds2d7ZA9f7KMbLqA3ppb/rAnJ8TOYBHUWUS+X
 EpoVQIC1qx8E4Z7i0wXtrcJGRPFqs1ntB+MgunB6OqCKm5WddLeT1lx7NAj4OdDDI6f3HOHoWdD
 TtoVgcccQLmwqq3SigTyY=
X-Received: by 2002:a05:6830:4ac6:b0:7c7:701:fb10 with SMTP id
 46e09a7af769-7cfc8a40079mr209141a34.7.1768334389066; 
 Tue, 13 Jan 2026 11:59:49 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:48 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/6] dt-bindings: display: panel: Add compatible for Anbernic
 RG-DS
Date: Tue, 13 Jan 2026 13:57:17 -0600
Message-ID: <20260113195721.151205-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113195721.151205-1-macroalpha82@gmail.com>
References: <20260113195721.151205-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG-DS uses two (mostly) identical panels as a top
and bottom panel which appear to use the same controller as the
Jadard JD9365DA-H3. The panels differ with a parameter defined
differently in the init sequence.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index b8783eba3ddc..5802fb3c9ffe 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -16,6 +16,8 @@ properties:
   compatible:
     items:
       - enum:
+          - anbernic,rg-ds-display-bottom
+          - anbernic,rg-ds-display-top
           - chongzhou,cz101b4001
           - kingdisplay,kd101ne3-40ti
           - melfas,lmfbx101117480
-- 
2.43.0

