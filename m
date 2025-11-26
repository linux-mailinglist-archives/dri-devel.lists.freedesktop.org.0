Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB7C8B1EE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EE010E6A0;
	Wed, 26 Nov 2025 17:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jHELM/dS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027EE10E69D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:04:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b2dc17965so47282f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764176674; x=1764781474; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=jHELM/dS+SkZS0q/ywNxApPZOWprGS4imakydnYgwhLiqWxIzuXtGx/UbQdkTkpsTE
 9+jZkVBxN11suKt4CojSIC88LkwLzWVV99OAinijZv7XRqrhOFV6nXPVXAy7Y4x3iDiK
 dcrIDlYyigfbFX0GH3sdRhbrmEhtE4ZVaEtjWCl1BwYGq4pjFY+VbpQOIsb13qIfI6FP
 BrWr8wSjqVRfpViTDogSq9G4uz54apzY2JVVLbi/zyxInQph6Hj1tc+Sf1o058J2redp
 6SlHexHqNoY6J1HmXr/a8mz0MpabhMMaDOEkXePA4QgWYlm+I19m409/VyxH91Krl5Dx
 2heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764176674; x=1764781474;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j5xnr554TtYoRpbiQVpIVqZ94ylKVMynqnLIjhVFhbc=;
 b=W+XECZIHfyUfHNMKFdLo6Vt0Z804xCT437MxrD0SQ+U/C/ZZaijKKcfNeWlAK6N//l
 sOvwsahdamA4OgVC3bWHJ0e/tplVXIonYsZ4kpVQAZKT2Snj0bTPDTQrSQ/6oVvW4Ume
 /3suSRiEbagK5/yGN/+jMZjbu3X5Gb5eCrTtjP2cFvySWs7mRdHHBIDU2wHF5tyE273k
 U8IqohaCEln3GUcQ5KsC2d02qksqjc+LPPCFv0Z4/kDJaWZ4QcF9TJirNkRlDA/ds+cy
 peu2i3+4Clej1d67M+UH6bpKKwz9Exo+eb1bwyoICOpAcuu+Qe0toxoxh2R+zWDjWUF1
 2Z8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGR94vCRtGr+bRuDbgqBIHf4KiD21+hRZYNfTVUgp3iiuDD7rT9kCuvVtk6VY7nMKHpvNgrOrvyXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuAVrNpdyMdmbDqHv3Zm5TSQxKLi4Z74Gn0lAwkypeJWURDQYe
 4kKoyJ4NZAYpTuOxQ6A9N+cLNmO1DUS14o07luzfy0i8ZV4SuuCCoefv
X-Gm-Gg: ASbGncvx8OH770IrZ8/xKf7a9Z3h3FVKBGkPbkjeZ6E9PbRn98/Fp7xmptnJQqYbHWf
 E5KWxJqDr0al6KOxyDO742t/1gPHAeIxaskBJyKpITBl2KCHbI2A2WzQYJpLZ2W3ya3DWhJu3W8
 9Mqd380o9ICn/tf3R2Via0tlX+yh0VaJoI/m8UUA1ee3erxtYF0773XfyVxme4TRH9Y4glJENNy
 0GNZ0DRnSVnioLwtqZmv0dbrwCl6iUWxvljJz6dg7pqlN3mzFxGqLswE4dcVpa2Ggxqt0/D4Mwe
 SVsDuFfi7a9PnZl7gSIC5C/fKxeeFjriib9K5+BbRtpC7PPSFYk9djEXyvp1x0Rh0Mx+iO3nbwu
 BLhWMH0SZnrihDdwlAUQC/Ykgm/J8KtpnktrUwAs8OqUg4hWoYpF/PeStgcbx7d0FcxhVNSr3X/
 fhTPy9yDGskY7lGycNsUPjiCAs9DeC4r/wh9OGJ/iFeWW/tIER0Ud8
X-Google-Smtp-Source: AGHT+IFqhKM2PJT48YuPA9rXKH7Jp8+lFruZ6GLD8AePWoqqJeh2VVlVCxFXl1S1iXjh3vRhps00Xg==
X-Received: by 2002:a05:6000:230f:b0:42b:4223:e62a with SMTP id
 ffacd0b85a97d-42cc1cbe219mr20121309f8f.23.1764176674356; 
 Wed, 26 Nov 2025 09:04:34 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.141.247])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm41252799f8f.3.2025.11.26.09.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:04:33 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 26 Nov 2025 18:03:51 +0100
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-st7920-v5-3-64eda5267d35@gmail.com>
References: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
In-Reply-To: <20251126-st7920-v5-0-64eda5267d35@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Add Iker as ST7920 driver maintainer.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ddf37f0acc960039422ef988cadfa7176972fc5..79b8a277e38b55ebcff05450d6c565c0d87c6b51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7861,6 +7861,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 F:	drivers/gpu/drm/sitronix/st7735r.c
 
+DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
+M:	Iker Pedrosa <ikerpedrosam@gmail.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/sitronix,st7920.yaml
+F:	drivers/gpu/drm/sitronix/st7920.c
+
 DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained

-- 
2.52.0

