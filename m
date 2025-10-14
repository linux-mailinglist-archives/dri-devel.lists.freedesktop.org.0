Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BBBD9632
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD99F10E5F3;
	Tue, 14 Oct 2025 12:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W0lcaXs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8ED10E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:39:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so27539265e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760445592; x=1761050392; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=W0lcaXs2vw1MAXESFX3P+u+Pr3WmFH3N/ILitAiBHg7edehWowdgSg2acGqnBGjBi6
 13n6skK3/frOtpjXBiUgBUx73M6E/FQR3M+URQXU9lj3S2SNYimmOJY7KJU+Iee+HzVL
 ZW6g6AkKaoO9itbjAiD7Y/SjbBmMj/TMpIUjDZ8AX8RS0Pu9XChYFSm+91naMM9VzSI3
 QnfsSRil27qIKzzpNVl2QMst/faAXlAnEQYHOhvu1CelvGIfhamQz0csRqsb4iDB+VBN
 qEh1sY19B2gBUfmqfKuIKdSP3WPVElp2nMA/TVi/eFQK3+09eJYO2lU1MewF+E1HcCnE
 Vrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760445592; x=1761050392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=MrJKBEYOEE2c/37Yv5W/DF4EepB4+bGyucFnodVctoDCQ9/RqPo8D7fzM0iDvZW3jD
 MoHziSQzRyWEJQhSnK0qNPxBAWvTIU3SrYOvao41ezHoz2k1QGSMSkKk7ZJDuuoO6Puy
 5U7xpNLjM59i2sMxJVoAHxwEjxM+2MuqJbCsOezH7nUKUmhuDPyglauliYi/ll4PNtZ4
 BgI3CTo3w2Nyjfxtsx0rkc9/sVSuLd2qrPuIA3BoR7FFIEeH71CfL8T/2SmnYENeSDBj
 ccTTqrWJZ62UwNc+5XTCSrK1J6OlkQ5F6tn1Rw424IPIU8k+ogOtOKSMErgavil02J2H
 /mjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkp3r4nJ1iFJ9foTRw/nDy6QG8bqKy0XVnIRGczUar0/YavR7ioIsK1VSnUhgmYbmGHyeqSrHNTpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC49ceEY7dxlkwYs6CbqdZFODPqkk4A/m2uY2jT+pFQeN1PgGz
 Y2u2x3ZMJJVxT0Tp1M5nkuQnoHS2dtNmN90ChOMRIRDP2HkzAzs41cTQCZK5R+4cW4Q=
X-Gm-Gg: ASbGncvVTwKUiQGuC/NT/IIL0/nKdmsXO61/q3fu1oXs4ODXRM4GRkrTwLfR4co1Lzl
 bxdCUIRRv2nTT9thWiNYcWKBii+upgLmZg3BxsAdP/bKUQvZbPzrIf2IYdjyb9J+2a/DijuMSQw
 dbjdpwm/OLuGiOBXxX/bmkLIJFHOOiAzMu/kcvLqFbvU5kfH2TNTOCtfdWWCJ2Y5GUdW4WA+8By
 aN+dClZhsEf0KUcwehgLvSiOyWs8ZkDsAhUAikCkG/n1w+uF7uRROOE0mfyUOhoxFW3JXUhDQEQ
 kLwxH3SVD7NKJqHPwkBxTxnXiJkBorNj8xaYhm+JfOPTYduPe3MldYk194YrQFipesPL3G1QdgC
 cx5lSL7NuoowMJZz/0s30q8KS91KJKOSIQ+9P3swft4x7ObTCXeR9og==
X-Google-Smtp-Source: AGHT+IHzYJeuQSSdvaVBjpsWcRolFjsrBPl+V+3N9Q0foLP2Jk9xC8lRLIlq37tnavPAFSq2mfhuYA==
X-Received: by 2002:a05:600c:8288:b0:45b:910c:adf with SMTP id
 5b1f17b1804b1-46fa29e1c33mr195599705e9.12.1760445592221; 
 Tue, 14 Oct 2025 05:39:52 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 05:39:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 14 Oct 2025 15:38:28 +0300
Subject: [PATCH v2 3/7] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-glymur-display-v2-3-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=MdFy/rEtddPgNfs1nNoPDNK3EzZtOK6/402QnuCksD4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR/MpIlema7vtLO10UuZNhTbFIUHH3e8z84D
 RD9ZYXA9NmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EfwAKCRAbX0TJAJUV
 VotJD/4pqgqFjwMjWLdSHRE8WR5WgFHxPv7BKsET1/cjItFQcfJdEmvTVQM2JhaeXBC3ID8e4r8
 ZUFwza4CdlWeAu2e9AOADQaj75EC+ESZYnO5xKA66sPTWOgqqVqLBtiIYLChP+amJNT4h4asBnc
 /TbZAn3sKR9AIV/DnPYO4jd8G5ixRVlIXMdiEmO8BGtsIkZ8IfsyLR6ETj2k/qZ9MRPW6fCE+o+
 efAXMnFFUZmq5DtPsJhH3lY00BWyKSjU/yO+xdSLBqQWD3uuRJgawppPogzmvuCS9leP/+vnROX
 lEl2LQrx72CvkyZcCYnjlNHr9L1CCa0k94m6FTZZ4nDBa1DSNaX6LK6AzZBbdfoMo4UlAYzx6nw
 cGviSA5kYeFFXTVB/E2WfCGsTovozMhbZ9fbbHw4XAFgyPm1mrFlWd/7zA/1TQ4Q+Fk1xGYvVjH
 hP0ozzif5id5Yy+cs55bW+tGQ+9gJTne0IYwFEbf+7FMtxp6kOfG1v25f2QijXVxASNLFmm6Xir
 o6APPe5LfGH9KGadmGs5vjsr5UEiZNqAKMHYvwzW1QbDSeuNwdCrpXaAjAaCHGUeZR3ghxrVa7B
 zjX/ZZj2ES5hGZZ6HJD5+vA7t1o6te/0HIpJbR9n8XxjWa2xWpEpYBXedbvALc//XypGakqKz/E
 tfk3cRnRS/t4WUw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their new core revision is different when
compared to all previous platforms, therefore being incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.48.1

