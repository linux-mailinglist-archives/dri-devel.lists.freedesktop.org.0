Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA57A14BF2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FF810E3A2;
	Fri, 17 Jan 2025 09:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vJ0j5uzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8E110E3B2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:16:51 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216634dd574so21938915ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1737105411; x=1737710211; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4ePeYcN434CLaylzSV66qRhHXhWDJvP3PT0WC2jlSI=;
 b=vJ0j5uzGIfZS/H9Xmy20CqsTAZbZ6vXB+CWR7429K6RwCdOApmjaEqGi7bILuT3nxA
 PJkOXrVb9w96wgLNPh8lL0WAH4fGANqcnhTc8L9Xob9FONPQ6lu9k7zQ1u0MBiBIlx+9
 CmPa391wSEGKXjiAXeUg5QsET9aEjCGwnqmqczNfIuQLxw7HCD2VgDteuIJSr3gDJHoW
 QP55lfVn6M5DEn0ZQOp1KRYmgbqSgGJL24CWGK1bUj8sWTLFFRDiUwo9T3kOH1BEyE8J
 Fqp7+1g34mJe9uIBWuI9APKueFyBRQsWSu2DDm20J2lyr3R3HLhvjiI7N5iDgqQ6svXY
 evdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737105411; x=1737710211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4ePeYcN434CLaylzSV66qRhHXhWDJvP3PT0WC2jlSI=;
 b=Cj1mH/G1FKewtZBaChITKQXmfnMk/sKxSEs8ldprfxTDTUuHAakXrAiolqqnTv+KiX
 doA7hq7xZ2gRf7pCzQkx1l2+h/ca3/US+aS5xs8+atXoyqFwAZQ+uADcaYVUVPIenrmf
 pxxjbE4AedFYqDLYfJzkF49BGNCgTyp7oPG7WUm0Sl/MTap4SDES9PNj8VtavIej5vM4
 PK22IABYCaBgS7TTjIQGiwFFYJt0zDQNbA31iNU1Q+qVbCoiwO7JaqFukA/U2N8+KMlv
 TtHzS61LYUUTsBaZQQxHi829Ri/de2kboOMLtQBK7VemBRYmuf9CQ4/wjZh/mxes9ePA
 VK0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxZnBC5efYW4RLp4e+WCKOUgJFFzsYb/3ZBsFwqJZnVxcW9ArMmKCM63e7CYiOB+FinZIYf5WEDNg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5kolNm2cgjLlGekshwyV9HPkV337Rs1TiJfFSGiXHXN5/HjW2
 wZJysOs4lbMXI0Y5z2sH0zE1FLAI70A/LTyw5izlBqNzfs/AIRbxKE/LiRTSvE8=
X-Gm-Gg: ASbGncsyzxNNqkCJdx55DnLzdKXMtMseMPdAIqrhmesDNYcncNfufsBXy0SKbfaefwA
 vqYnFlzKSwg/3I/ml9rvQjMe4i2DoXG84Tg90gerODSpncK0N8HyuTcyh/+bLRFmZ7URs6s++lR
 UqW+EDGFygfcle6N1dJL1CjXToF0RiZb9q222ls5PmUf/UxZHRn3PbtYIdHJ+ODMfhITeSyHW7W
 bB4zs32zrRgXuNusXA0jbuYPBxAQK46SbzHW8abQWX6GJUtJr7t5bbQSfGpfQwvzg2tcnvMZtLI
 ioqYFilJr0/ohF5cyVZzzfPcOrV7
X-Google-Smtp-Source: AGHT+IHxjWxNuocSB51L3iM4hFQX30KabrZ22jj+dQeQ8clRXiy+xEMnoo0skqlz3YEsGJVarQMwlQ==
X-Received: by 2002:a05:6a00:189a:b0:727:3ccc:25b0 with SMTP id
 d2e1a72fcca58-72dafa9b030mr3428746b3a.16.1737105411269; 
 Fri, 17 Jan 2025 01:16:51 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab815bccsm1421548b3a.56.2025.01.17.01.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 01:16:50 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add compatible for
 KINGDISPLAY KD110N11-51IE
Date: Fri, 17 Jan 2025 17:14:35 +0800
Message-Id: <20250117091438.1486732-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
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

The KINGDISPLAY KD110N11-51IE is a 10.95" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 7a9f49e40e75..c771f517952d 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -34,6 +34,8 @@ properties:
       - starry,2081101qfh032011-53g
         # STARRY ili9882t 10.51" WUXGA TFT LCD panel
       - starry,ili9882t
+        # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
+      - kingdisplay,kd110n11-51ie
 
   reg:
     maxItems: 1
-- 
2.34.1

