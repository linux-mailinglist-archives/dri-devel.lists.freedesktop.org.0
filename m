Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF52488A2FA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 14:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5F910E8D7;
	Mon, 25 Mar 2024 13:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bFP8C20O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE43910E137
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 13:50:10 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6e677008501so2703647a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711374610; x=1711979410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JS2/Y8Y8K3ElC8Fmmv3IDuyjPkRstgcDAr5RHpoZx1I=;
 b=bFP8C20OcQw+e43luw2Jx2oPijZzdQerr9lYi5RVRjuTrYPVMGH7wpHuIZ0enw+2j0
 6Dyq51eGX9Of5EWM1UvTTtsHBRzwoNhYBy0swDXJsBSY3giS05Q86fzzS50i7dQORJ5G
 YVuy38h4cjA0PqNaHYB6hwHnGdQeVzR2PDCxll/tW4wIJgQ94Xz3VDTeQl9IN2KN/2J7
 nNcgE3nVNzhMpbpnlwY7xBTn0uyRLTejW6qyP1UusE8uwE2yAf67idUadnllTG6Jutbl
 bmC4RSh0660Gw07G8IVo3C2CF/sL0SENBNFzB4pJSQw/GDwtYX67tI6dkh/wz0SYUEyy
 dbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711374610; x=1711979410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JS2/Y8Y8K3ElC8Fmmv3IDuyjPkRstgcDAr5RHpoZx1I=;
 b=eWW6cPOhmx5spOy1dqYUGVlrgXsE/RXIM7eJMfIAF1n44FvyAH49xIxNtrMIPVJfof
 kXJxlIn5u5ckxevebN86Vm2sOpjYLbS9zheI1ilDjgHfxaRtYQ7thfIXiEAodug2T+vd
 +6n9qPmgD1cQjBwImiJJaoi/9vwL3SIrNNYnIxCWEDbmQQ00Spk2z5f7rQD5kT3L4h9P
 bAzhuK0xAq02k72QfbT8a0e6y5ZgFY5QCTwzh3nLSu0WhtVL0CFDEqF7GJGA6ap+8Z7n
 5OA5PThT7xB5N8Bd58JlxFKz8icr7ZZdCNlnzq6JBfZSl9vFl7QZO6y3An4MtHV87Pys
 3vNQ==
X-Gm-Message-State: AOJu0Yy7X6idA3XAtGcpbymJUj4yozzBzNQYHQLXqek3atFStktzsgIr
 KbQV688YjFtN+3KDsdLIrs4wbrEzwnsDMSnEEwjZ9VC6jGw1a1J1
X-Google-Smtp-Source: AGHT+IGWyhKpnx2GO0ioSHzyF5ByLr6tXZNNC6I7VkpE0YbA+gzx4HxXehD+qvNjWNPVR4VKwjL+zw==
X-Received: by 2002:a05:6830:91d:b0:6e6:9679:b3b2 with SMTP id
 v29-20020a056830091d00b006e69679b3b2mr10557687ott.21.1711374610064; 
 Mon, 25 Mar 2024 06:50:10 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05683010c800b006e673e2d2a3sm1118250oto.77.2024.03.25.06.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 06:50:09 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, sam@ravnborg.org,
 quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, megi@xff.cz,
 kernel@puri.sm, agx@sigxcpu.org, heiko@sntech.de, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/5] dt-bindings: arm: rockchip: Add GameForce Chi
Date: Mon, 25 Mar 2024 08:49:58 -0500
Message-Id: <20240325134959.11807-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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

The GameForce Chi is a handheld gaming device from GameForce powered
by the Rockchip RK3326 SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index fcf7316ecd74..a5498974ceb4 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -236,6 +236,11 @@ properties:
           - const: friendlyarm,nanopc-t6
           - const: rockchip,rk3588
 
+      - description: GameForce Chi
+        items:
+          - const: gameforce,chi
+          - const: rockchip,rk3326
+
       - description: GeekBuying GeekBox
         items:
           - const: geekbuying,geekbox
-- 
2.34.1

