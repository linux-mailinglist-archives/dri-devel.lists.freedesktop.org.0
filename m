Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5514A38996
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 17:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717810E555;
	Mon, 17 Feb 2025 16:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j3wiCjWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0398E10E559
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 16:41:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5decbcd16d2so825523a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739810509; x=1740415309; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/vtiOtAPErstCZKPiDf9uSSv9XQsaanNrESzaPKJnL4=;
 b=j3wiCjWK3gFYcgOs4KC2PtZvqUnuzqTkvaaNwy+kjsOiNUA9+bsGAdDCU7hkYoU1RN
 eA8HH/fk2XGmI0rRgKQLxk2C8OlXdZY8l8YaAJWDRenliORRLQEtlg8MsKAEudnVS0wx
 4KSYQxm5f9VAbE4/4R7WmLgNw73/7ZoueRXAI61t/bIwCgiSvGfJr0bwn0JZtQXjWtSU
 w30stf8QdH7NIEK5+dMO+b/om5YwshqZHwK0xHZg/Ta8iJM3wjbK8h+u7GR4dMKMlo9m
 BNk3Tfyr0/o/2hn+l2Poi7f/bfCJ0Gswj2pmeBxTH4hklVf460Ac5taEY8hSjOZZB5fa
 HoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739810509; x=1740415309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vtiOtAPErstCZKPiDf9uSSv9XQsaanNrESzaPKJnL4=;
 b=SlKV/8VTbhvJNourm6QOUm+bHSeN35i+2/kbdX4OhwjdkKTJPUodIuJW1ZDlioriBi
 35F3EuoKlP2L29aUAFZx5FCn0RbGEHwog3xvdAqayIkdqy17uMVQeEp8mgkz771eXW/M
 xnE3Fc1hxwOsfWYbOhYDgjCmNEd1yNdJUVCq/wuLARoNs7ww9znd7OPWoMF5yA7D2Pok
 fM3SQ5XDOnXMwxUvGBA+Hog14e7hYFdXAFAY0v7YR0mU54dN+OcvI7vW2Gu3bFRp+f7k
 uroqpG6Rc6wRRCjs0O25h5Vvps+plhk64NqfLQpx9t7/OK/ZjLKKEQBhbey6o2CLi9TH
 NZgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdgNn3HAj4GvA33dbPwPcNse2v2mdwNwejOvzNaY+aMKNCJqy3dtPSLgrnxXMWlrUmSJoOe84rwa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOALcQHg71kMe9xSbMPQ0r5+bDVYu7A2eCBxpM7sFGvW9oUNNb
 sL6EzYoLBEwtjsVaJWeDwRCXPUeyG+1+FjGr/PaQaeGH8ndnxbHd+ure2rmztL4=
X-Gm-Gg: ASbGncs3V7s0zwGOB7Qwuf7P6K2+dJhAkYH0vIa9BIZtyayVfu0ghajevYsXQBvSHHn
 g7YEhKToVnUrsGY7kuHmyONOecCQ2M0kqJa5n+mQbi5oHgrjX7XhV/KcgTdP4IcYTfytxWl84zS
 khwf40DnzhXEtVflQ0EqhCpHvpPqlvugnwQLuVAaRbJzFXsuR5BsmkWE+5ZIo4dv91O5xi9II7T
 2JhgUtzQHmYFC1osLECzLgKP6XUbJ+fHRG66/FaTf0EHl0A8l9bdhvQ3Inl3N+ebJoO2qQyY+F6
 kUd8humL0Xg4JD9mbd0hYKRoDKWt01M=
X-Google-Smtp-Source: AGHT+IEc2oXDKXrP/maz1R4hPJqgetc2dZKJeGvYBMYH+EpbVdo+sZPF2ut5mzR1sZ6VdIx0Xdn7lA==
X-Received: by 2002:a17:907:1c1d:b0:ab7:6056:7a7f with SMTP id
 a640c23a62f3a-abb70dc5587mr338725966b.9.1739810509412; 
 Mon, 17 Feb 2025 08:41:49 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 08:41:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 17:41:24 +0100
Subject: [PATCH v2 03/16] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-b4-sm8750-display-v2-3-d201dcdda6a4@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
In-Reply-To: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=C784ypOiHBSE0JJrZYQTBZVh6GbEkSrx2ih7B4SSF4M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a5e0NkCZRyuFjhGGd9OB9EDr80fjzsYau9k
 F/FzmPPdEqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmuQAKCRDBN2bmhouD
 134MD/wIjInrEc6QCV4vQq3wwjSnYQQEXn0cbn03E2GJmhUJwd+u6++MPxxlMWJvWnEvr20clpP
 K9f3WSJf27U0uNd+eOMDFde4gbUV6lBemRnJjQOVjk4rPwCebZ6B6QZ6ZoN1KIns+OX1T07WcD/
 Fr2A9Qds8uq2+7pd8zbC7b4vd6/6X4/YFUKc5eN6KhOp/PF8Jc6akNSyuyK+Rar3Jo2FiwEso/r
 nHn0LW9ACmKdef+YqrXwcWY1EzvqxF4lEiLkm6rXsSCpsO+b/j7fZsIcibw0ttfaovuVVC/qJa3
 EnWD3KwNnOyw7SqrdQ1oZIa7zCAwDM3zFDrTCxDhOEqZ1CAXMP6taiU3QGDFvD9bGkqHR5SFSG3
 rfBKeN3trcQe+NQs4FHnc8+BrkGJR9Spnx72NMMrPljxOM8pxIzzvznxZFwaLqguApYoIsyHqZA
 3MsAyDL4grfJgOe71hOSMTurCeRtTmV0k8q3N2OUvqf4WNZCSObAM36b6mKoF1goxDUP4oaRCnq
 Ms0vu7DLarYiN/jXeW63Ca4IkCzOGn4bsuX3+QOEZeM4K93LhFC5z5vzxvzaMz6/jZ8thof1mjn
 KGNxxw1UZh8iF+NUe5FCgEBT+ltuBxvP8azDuescMcwtnwWGEKMdUFnWTpGGYnNG/9HZYqIopi5
 V8wXPwbQcGqz5VA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.43.0

