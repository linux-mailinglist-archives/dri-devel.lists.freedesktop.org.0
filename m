Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAE6D39CE7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952910E331;
	Mon, 19 Jan 2026 03:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HB3Gxjzx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909CD10E34B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 03:30:47 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-8c538d17816so522729085a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 19:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768793446; x=1769398246; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=HB3Gxjzx3N62orYAsnP9lFJ4smXa3cTpxd8OQNBwrGY6G5apygZEtSNmHUhKyedbF2
 8APbICgun+qO3aoq8trdxdmXxCNMtu5TvsDIv/ll/QxJ+NINySvBlEs4ncJE1ftWd5uI
 1kUb0Jy81mdbnmwoCTZ+rKKEoqiDvbIfcmOWzf99Ipvt90xfpdU+/P+FCylf+Wpk4AvH
 58nYABGBtrg1m3F3O8z57e2l1WP3sk6yadp9y0u0YgMoIdrFtbQTpOoR1P+0X1vfxV3n
 MKY9pI+UacAzo6WUxefhcTYLqAYncDwnz6zzfn5meOA1MyXMVB1Z+fIf70e46uQrsxmu
 Z9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768793446; x=1769398246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Gnop4z34aVye00gIQguUoewYT5lM9SytbUgSGtePF4w=;
 b=JmNXlArbZUaMhxgVqonjSS1AwlqT0vrXtBK/BjP5/CTTRSgfFG8nrebddFVvW4mqG/
 gJh29PVPExLXGZCnFDvZnaB5Wz8BXR4zD4D4D9oQnq40QRQJq5fOTR9OIl2buHSD25US
 BvMV7XEKCv3wkRpB+zcILSkEDofsdp2Ckat+owZB/lIz8XutzM7fkmZQjS+vo74nwdYc
 yNv3A14AsDbRrcvFV7WF7N2y0mGBkV5ptFEw3BtaWmZRXiRtSydMrRwA+tDXh59EXOCq
 S2GOOJ54FDuAhRm5H1b1f2Ek/VpH1cDgs8I6fyjQx3FEjijjz/LawIgJ7pI5Qf/FuzA9
 9KFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnax0j65RT0SLkE7LTe/7kX40ptdvAiWtxxUGXIu0vVXPBkJ1aCezqJ+tZoNt5Y77mOxOjA7pgEcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL65D92ZXrdkCQZFgVbDPRS0rZmvm9lKtDGzjV5W5ofYwWFGdc
 g0Y6ZxAK6ilz1zzO6hzcBzZe1/lwxB/LDUPkCGuocvygUPPkOTw7GHZw
X-Gm-Gg: AY/fxX6w8NApn389KdIX/0dmlOFhrAM3kV32qoxHHYOswuuMbVle8qt2Ys1fPYGsBez
 FNTQDuTYKy2LKdLsv9IaGI8OcufZNCuUr9enbQtbQTwONKRRFdt8yYQ/Bk/r7vAYcaYNK3Eod0c
 FvnEroBQefH1wV9h9SNHBFHuOYBRYe2iXG6yzIQ+erhaUapS3NYinkolhZj4l2XjJTJQDd34toY
 BU2ICHW7UjLt6E02vOT4HVnvqrR/0uFQ5ioCfhJ2bRIJYLBb8PFhkWXwHbIe8duVy/puYCDos9a
 NmYp6kkJ6TM0/bD1gIKF8v7dXsBjfoBq4sBqNkZpVLSnvsqmrQXpR7uvxEarFd5KxYAqboA1H8o
 wpNZRublrQqfp1Dwn44yYQYQ8HVkdWEnsDt4lRpeHoV9Nk3PdsH0tDCgR4oAKfy+t9Xc4awggBZ
 rZYE90yPpQg7dY5shATTe24v20g38tZGmGQCbbESI+EOdaCXif7D4ZuacuKmApRpScSwo=
X-Received: by 2002:a05:620a:711a:b0:8c0:ddb4:2141 with SMTP id
 af79cd13be357-8c6a68ec47amr1370029185a.24.1768793445587; 
 Sun, 18 Jan 2026 19:30:45 -0800 (PST)
Received: from mighty.localdomain (nat-130-245-192-1.resnet.stonybrook.edu.
 [130.245.192.1]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm724706885a.5.2026.01.18.19.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 19:30:45 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
 rogerq@kernel.org, tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_jesszhan@quicinc.com, bavishimithil@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, thierry.reding@gmail.com
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 02/10] dt-bindings: vendor-prefixes: Add Doestek
Date: Sun, 18 Jan 2026 22:30:27 -0500
Message-ID: <20260119033035.57538-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119033035.57538-1-bavishimithil@gmail.com>
References: <20260119033035.57538-1-bavishimithil@gmail.com>
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

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2ae..70a195fc6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -437,6 +437,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,.*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0

