Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54A889EB9E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09792113202;
	Wed, 10 Apr 2024 07:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="HYP9mGrv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DE8113207
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:15:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e45b9a5c53so19668935ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1712733311; x=1713338111; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLNsviQIo1VwdlD8j/pmqb1ZJhhhQw3AWOszQa31LOA=;
 b=HYP9mGrv+P0J6ZLEVZCc9ioBCXArQqDwUUBNCUPGUjC2EfcZgW8wTnF25LA2smEEyO
 mFccA0CSyzsu3/rMtqEhHI/LMZm++YZ+4LNb9qhr4mqLWdHvkdlqZA8UsejxYBQFpTB5
 /1vEgzT1NDZHgoV5v85Qd6lG4fuKMCu+uyJa8Ry5/jMhbVhoAeF33ZBEtzdm84G1kAOR
 unc93rRP9MkQqFxKsgiaBv4ryUxMPb7Vec+X5GJJA7p6oPu1SLwUaxeIRzVKp3y8E2/3
 eQMIQApQhIga2Yf6Tsg9pmSYjkOVPCsau5T82Tk+YGGPwowG3JSU24+X1oTnbjXJrxdT
 Q/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712733311; x=1713338111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLNsviQIo1VwdlD8j/pmqb1ZJhhhQw3AWOszQa31LOA=;
 b=kOSEgWnZZzD3W4EuMb7wuDE0oOiarrvPK1LFgKhwwbQQC6bOXEhJ2h6kkIfC6DTr5F
 shI6iJsjESPeJCgs+FIxFT9X4mDfwq/5RIuLfhXDZUHRFUdFy8mAY1sKx5kyhydJTRPM
 nATY8P3nz3v9tbHI1oxe0D6mPaNAKPU47UTSBAUtr6BGV4zWPkJp0QQR5ZCdFxycfAsv
 5gKdJYfdgxFLId5rM4OpUBkHv2gw0hMu6OR5oDhbKEt56KLPNAfGavaEROPtFTAic23r
 p+UXdi76W+t8vjiWqStE3xxcMwxhdYeLeZbJ82Xw7NA55AYTZI1JyFupGi1+GjrLy6At
 f6Fw==
X-Gm-Message-State: AOJu0YxYDTtKEb59A3TaeSehYUIvmN83DkuHbye/CwrzcAUAFVDiy3Te
 pE/OGoIyxY+2xOSGaYvuSLzb5cdkr87KMxGJtUEnhCENC6Xc9B9XJxVAHSGwGgY=
X-Google-Smtp-Source: AGHT+IGjEfCI9/aMprIcNOJB+4iYY7SjxOU1j2wcCISVFQSOXE94kFbIt9Mi2b+ndzdXO9Z48qYnSw==
X-Received: by 2002:a17:903:40d2:b0:1e2:3e0a:fc5e with SMTP id
 t18-20020a17090340d200b001e23e0afc5emr2704662pld.33.1712733310882; 
 Wed, 10 Apr 2024 00:15:10 -0700 (PDT)
Received: from localhost.localdomain ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170903409100b001e264b50964sm10107975plc.205.2024.04.10.00.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 00:15:10 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, airlied@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Subject: [PATCH v1 3/4] dt-bindings: display: panel: Add compatible for IVO
 t109nw41
Date: Wed, 10 Apr 2024 15:14:38 +0800
Message-Id: <20240410071439.2152588-4-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
References: <20240410071439.2152588-1-yangcong5@huaqin.corp-partner.google.com>
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

The IVO t109nw41 is a 11.0" WUXGA TFT LCD panel, which fits in nicely with
the existing panel-boe-tv101wum-nl6 driver. Hence, we add a new compatible
with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 50351dd3d6e5..f15588a2641c 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -38,6 +38,8 @@ properties:
       - starry,ili9882t
         # Boe nv110wum-l60 11.0" WUXGA TFT LCD panel
       - boe,nv110wum-l60
+        # Ivo t109nw41 11.0" WUXGA TFT LCD panel
+      - ivo,t109nw41
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

