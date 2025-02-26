Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B820A45CF6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CB310E233;
	Wed, 26 Feb 2025 11:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CxxjwNmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A778A10E233
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 11:26:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-22114b800f7so133176915ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740569188; x=1741173988; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RTmpIGHngtsSZ/WnYi/gqVccUnJFm776Qa1QJJB2Nw=;
 b=CxxjwNmqaw13HevYnMOTx2vZwCMeIGNHrfU7P5zn/nPEf7wTVb24J0ojQ7/5EGCtgV
 tRfM6ZTdxCddISzi1osbrkYhy28uNDyT+iiOH/JvjhbsIiqY0sIWITI6/wcUvX7CwXK9
 m84FcJ/yVwoEn+48uwhRn6vjHZgrNxmthNoijiOcGeOCmE6ArQ9fHBWNafxhWEPrgN4A
 woz77zc/WoeY2fCaWPzRXSLAY0wyRWEBuCLvtEjew1wEXcBZmNLgTvkDjy72XAJajsjp
 scj9EemW+WaUN4FH1eoK1Aiba4OviQTGapdx7f/dMJL/TX0I8TzpMxOvkDiv1wrx7akU
 tODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740569188; x=1741173988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2RTmpIGHngtsSZ/WnYi/gqVccUnJFm776Qa1QJJB2Nw=;
 b=kjD8MwmidaAp1VvOXVOJehkaFizQGQJhp1/GkK+rO4PILvo3OrHx0B78AxsI86tEsV
 UmAIw0DPZS0VzCApYTOmXq/uKru5xaY7u9keXQD0f08Q743xvB3rlhsj3h8w42ulh89A
 +PwSaKnUoPasBRiedzfmlLpqVFOMHuvUDxYcJjZtm5lu9qx7i00b75vMihuQQk6j9HG/
 HgE/5ZNXJfzkq/XMxa/HSnS0lk44A/VAyreSqwT+rlVVmjjfp6x+oF+vVCPLfiwDLN1W
 fZ2GJOVnxEUUPNezCrb3bEu31c13sdHKqbkrjePXOHAYgWoTwrPMM18OiZW5hK7LLHVK
 anXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwKW+wnkFD3YEYgIKiqMrIIO8aebzQq9A+/kp8CQmJHUJGu5Uu5rK5h+zVtBKdfZjPVb5Ue96eZ68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2RmfMYSl73IaYJU7DGuW0AieKfVX9/Q8uAOMjUxxFcmUgcPJG
 ZUeHYA/7g567BEd5gb0nuBlYggt5XQ95DRluRywaLyoo+hORNPV5
X-Gm-Gg: ASbGnctU0V4eBFsD0stwH9DE5BlWP7A5DzUKj6uFSJKEIJEaGqOcrKiGN8acZ1ps5+l
 mJnGc0x1ArYofiPHV9LDqY36cWag0CJrG8WiyrmdTtzEBsBGnPXDtRYjzomCQU36RmMDrhVQISG
 8APG7THeBrvL+FXAWH2yV6JORopHCV/iSGw6FDrytUdFSeF2BG72qoIW2+NKhFWiiMUGVEoZWRF
 KrNkX+6YADfcg+7YFCNY6Q0U5ILTfYnWvLjbi5G285KgTOpSa0nhaV2/goB2Sxtb9b4dkW89zBI
 WC0onUaWVCfStbjUm5XSrW/RS11Qwank5BHfuZAeGX5rsHvB/yyWTA3ssuqyLUXSMi3j4w==
X-Google-Smtp-Source: AGHT+IFdM2uihMFE1scAm5JrACgtnVIbLNjAwJpcqKr3P6lxtJIGZA3FqHOXHR4oGZESQpKSGY0nfw==
X-Received: by 2002:a17:902:d4d0:b0:223:3bf6:7e6e with SMTP id
 d9443c01a7336-2233bf67f9emr6888115ad.9.1740569188348; 
 Wed, 26 Feb 2025 03:26:28 -0800 (PST)
Received: from localhost.localdomain (221x255x40x66.ap221.ftth.ucom.ne.jp.
 [221.255.40.66]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a0009a0sm29800345ad.27.2025.02.26.03.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 03:26:27 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add hothmi vendor prefix
Date: Wed, 26 Feb 2025 20:25:48 +0900
Message-ID: <20250226112552.52494-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226112552.52494-1-kikuchan98@gmail.com>
References: <20250226112552.52494-1-kikuchan98@gmail.com>
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

Add prefix for Hotdisplay Technology Co.Ltd

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5079ca6ce1d..44108bd6ae2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -650,6 +650,8 @@ patternProperties:
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
     description: Jiangsu HopeRun Software Co., Ltd.
+  "^hothmi,.*":
+    description: Hotdisplay Technology Co.Ltd
   "^hp,.*":
     description: Hewlett Packard Inc.
   "^hpe,.*":
-- 
2.48.1

