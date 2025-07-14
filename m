Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4AB052E9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9C810E532;
	Tue, 15 Jul 2025 07:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="V5QT1b6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9E710E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:06:39 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so13324571cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752530798; x=1753135598;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouMuj11MjFvdwjVughz3WZjGk79DPdwniSFwLLOcIJQ=;
 b=V5QT1b6wvAQ2KdoKTng8W+Cf5DapEfo8ny1uWY1MPEWr1JLonhcOrY2fzjdyNq9Jr5
 D1JfmtB9YguLst6xL8gj1wc7NdJm2kb52FR92jHAOqA6HjLISU1jFtRsjj4SNR9YyZqd
 0bBDJr/gdpZMc9DOC12utC+Q+w3m8gzIo/9iVGe0A1L55KF3C6507gEjenKBso6vrVFF
 A/6tQ2jdYd+AdYosdbqd7c3RAIMJMcQJqBoonFkJwY8EXIPTdx3zk9YY6i9kefpEMgc7
 oFqGbKhVGacE8y6fk3EuBGIZqilD9RF6CCOQ+NO7MOf86zwyp/gJcSRSSJ4ox3mDGNwm
 wP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752530798; x=1753135598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ouMuj11MjFvdwjVughz3WZjGk79DPdwniSFwLLOcIJQ=;
 b=nLpwQ/A1xh46BUOiVZ7RZTBM3NKXWCMpCzkI/1eTtJHZcJ8PNT+pdGwjdPvd2whpZZ
 HFof0sQWDgwSlnNFJBUVVeuGa7hdMPYCQNV3yfYHYXVSzCT/lM8o3tL+kzxa7wmXkDT4
 WwUbtN1evNzAZcbPL8RUFHJz5JDnRcEsXAzIeKN158rYuWnOsOENESlmV2Nfd4TLGHRI
 mczvy34jyTzUnL3WyUeGgdGWZ4OyAtvKTPHl4RYHZUVqMGaczaGq8NTgMGNV2cut3tUG
 hfFnzt59ZBi9ixs/mJVNjcVRZvLsiK7EiCdo/Z1hSBGqgb4ikcbRxmDLri1b83JPmonx
 +gXQ==
X-Gm-Message-State: AOJu0YxYT80KHJforWxw56P3aMBboki26MR0XJ0VDLF7kPY5FbI9OlDp
 kY7+BSwKkC9OGAQEk3MIvil4iHd9m0iykrLs3RRA+xTaHzZHIv8T83WfDA6c5SxTYN5Eb8WRksh
 k2SXkwYs=
X-Gm-Gg: ASbGnct9LO+rQcbfv9UICebSv3aTQ1Pwmf9IzOHJf90SUlrcNXR5ECnOLU2+V2i5Jyk
 f8bL1xI3NWfbN3oO5N56zzcDH4UrIrh7MLTIfG7Up31OIkL+f52WsOhXv0MavrOjfu+eGm4SrK/
 Z2isdCZ7WOBKBZeMkRownLATLJIdbLTGoUTAEPEx80d7dwIajJ33ZPBRu5k/IEwnxCvhmZo7cmK
 mKSJ9OPduCWMkFpocnCei8yE3Fn33Dw2LpEaQk4tkz/BkmtT9QRfYuFwaxV5BtkjD22qoJZaHRw
 s2TyYXOLUgwlbRGlo+Rvjl84kxZPEs1qsvnuzJZdorDXsWklZ8bu3sBelxpgnKnbZwTpQPFP7e8
 +atMTRRxGBzejgi94/KTc8CQedNRQpa1IGZ4ABMwWehh+KCVP
X-Google-Smtp-Source: AGHT+IFbfaJcw3SFtnMOWSqBCz5MGWRuuy5GYZFNtKa78qroYRmipTX+6rdHlkckVU5P9OSxGJ3ChA==
X-Received: by 2002:a05:622a:120f:b0:4a6:f4ca:68e8 with SMTP id
 d75a77b69052e-4aa41562eadmr195005671cf.48.1752530798043; 
 Mon, 14 Jul 2025 15:06:38 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab6fdc7731sm13137311cf.40.2025.07.14.15.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:06:37 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
Date: Mon, 14 Jul 2025 18:06:23 -0400
Message-ID: <20250714220627.23585-3-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714220627.23585-1-richard@scandent.com>
References: <20250714220627.23585-1-richard@scandent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Document the compatible value for Tianxianwei TWX700100S0 panel.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..28d5fff79992 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -21,6 +21,7 @@ properties:
           - feixin,k101-im2byl02
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - tianxianwei,txw700100s0
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.50.0

