Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931CD1B1FA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 20:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E6B10E349;
	Tue, 13 Jan 2026 19:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pgmp/Mgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E3910E543
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 19:59:51 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7c78d30649aso5552265a34.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 11:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768334391; x=1768939191; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7BnGb+oB3kbI4HRBgeZdx4kG5LrqKQKlKTO5o5vGDY=;
 b=Pgmp/MgfPlzCR6oqo/KvpVkom6eZ2sJLsAWZ7TfpxTgZn6OP/XT+OIgOPytDFMkvlK
 F5eTHtqpxZ29kUpevxxhQ8v7bjSkrlFeqbrVftwSvfCfHX78CxvyH1fruTJO70RckAId
 EcO/gUUkH+cI6F9/gamRXNQY5QaqazQvByP2l18UQMK62JBnmPESxzLjquVLv9/+aIP4
 kZA0wkjDNFGwHDz2uncMvuuJU875LdaHVnWyd/gA3edwcQz3caYLNZdtzjqAxX7XSqi5
 YNNC67N7qU0Fzylc2PkPE+oFyFb0/zDVHbbt3w/03QQrjQKVBK3o5VlKQ6flU/3+Z07v
 7IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768334391; x=1768939191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c7BnGb+oB3kbI4HRBgeZdx4kG5LrqKQKlKTO5o5vGDY=;
 b=j4Y9VGrwaQpRLHanFN0FXjhxz/lyWInp2MuDqMsrP3DpElzeBP8SxITTOrENx82by7
 K/WPq+6GPa6YNJvlsOFz8dkyXMeM+xQJ1zsmFd/aLDtYfq3oD30/gN2bw2sCJxIp1RXe
 vdh/BjdJ4tnQAjttq3wTV5bZced2mUOSfjSDkY3/Eeg3/GD0iIDPZ7LVkXBsf29gD+mE
 Ee5AaDu8O+stF4eaq/aB9vx/aR2cSzjdtMQXfkV7cOCv6UZ5Jw5TCV1wiXy7NUYesShf
 wqS6I0nxX+uFVNWQLKWRGLY9J5EsAiLG0+ItXQ6WaBzJm6QrPGPwYXJg2z34qz+GJEUp
 CO3g==
X-Gm-Message-State: AOJu0Yyu16G7vduf/yHKsnwwlpZ6Q/H5uDZwums15jzY0yfqHWQBY+Oh
 mLMPurA0IJXzpBtPAjDsLJ1gvEKS/mzSVjRfxU+1GkitLbCowNFKQ9nB
X-Gm-Gg: AY/fxX7WXwf37bp0S8BgKfMJg6c7dqeUtgBp+ogw7QMPJvGiKZ5FyHqbAjr/+nTPf/x
 uZoh+9Wj8EOkYNFyJVEtQPsCLrs7X5AIMxDARjqTD0Xq0a4G2vB5ZxJyoWraAr0tilxPeFSNeAl
 nsyks5gNaxsB9YyhNm6/Ywz9Nd1OlQK8WQoeqsG5CD9mOtrAmWLZ/wx7gjJ3Qj0aFnQLz4DicxY
 MZm6iYvmw8D8LE+mXUx0jvte/lrxCsE6uezfoqhmw1BxSIZ1G6HiOkn0bDcD9N7HyhXiaFsSb8t
 KRs0cMPsPeT86j4i03zK69tr65iJFk/6eGPeZhnMq/u4+MiK7S9yiNrTufgAOkrlQPUGEDY/JHK
 yyINtLY1K/Ez14ptNOoDunp+56Kp7zMOTV3avjkZ2wWL4HKKLkIj2DO/WgT759/0GKMeS7Fu2R5
 gt3FD+tLql
X-Received: by 2002:a05:6830:4119:b0:7c6:a2da:ce4b with SMTP id
 46e09a7af769-7cfc8a31752mr227469a34.5.1768334391060; 
 Tue, 13 Jan 2026 11:59:51 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce47801d4dsm16221119a34.5.2026.01.13.11.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 11:59:50 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jesszhan0024@gmail.com, neil.armstrong@linaro.org, jagan@edgeble.ai,
 heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 aweinzerl13@yahoo.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/6] dt-bindings: arm: rockchip: Add Anbernic RG-DS
Date: Tue, 13 Jan 2026 13:57:19 -0600
Message-ID: <20260113195721.151205-5-macroalpha82@gmail.com>
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

Add compatible string for the Anbernic RG-DS.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d496421dbd87..4398f576e47f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -60,6 +60,12 @@ properties:
               - anbernic,rg-arc-s
           - const: rockchip,rk3566
 
+      - description: Anbernic RK3568 Handheld Gaming Console
+        items:
+          - enum:
+              - anbernic,rg-ds
+          - const: rockchip,rk3568
+
       - description: Ariaboard Photonicat
         items:
           - const: ariaboard,photonicat
-- 
2.43.0

