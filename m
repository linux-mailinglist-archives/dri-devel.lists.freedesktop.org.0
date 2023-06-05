Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82258721FFD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 09:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1991910E18A;
	Mon,  5 Jun 2023 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7710E18A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 07:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685951289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VGkR4tMfNbDgtB0o7CKTM6cPx5ZMqgLHeB2CGeYB4eI=;
 b=AX6kT9ZeD8ozMA8TEDv+GoVVKlPy761dxO6O6m814PYwRZ/hC77Xp2yEba32Tv7FKTOvXs
 YD+2Q/9U9zg/houYJDzQce6UmAvu/JixCrsOMd5+EZNn7rQAys0TKPOON289hFY0FN97o3
 lC4yA0UHyxW3nuzgSjRiHOI8CCf7WAg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-yvjKW-usMmSlJWrAOFKN2g-1; Mon, 05 Jun 2023 03:48:08 -0400
X-MC-Unique: yvjKW-usMmSlJWrAOFKN2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f6045853c1so21874975e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 00:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951287; x=1688543287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGkR4tMfNbDgtB0o7CKTM6cPx5ZMqgLHeB2CGeYB4eI=;
 b=B8huPSdZIV9vsOHi2j4W5LgzN7ZOG7YJq8aiNj5mfFPkyG0FRCUcDV9tPc/wG3zpTW
 LbWo37ICTOA3+5qmwm5FOAMXWhotII2lWOq0/pA6g0aBuEfHbbkz/TqeikD4lvaDXD3g
 OIpw0XEM72F7dAX7g/ybkWRyWrHDXF+ylCAnjxI+D+UZ6dYv9SauzJ3Ksmekrl0IG34h
 inuSaPtnd5D+MnaXJACvWHLrX/YeX3dTctWgTmCapwIUUSnn6CDmoqoAJlCMaPHz5TPT
 +FbsX2aYiffVbnFN1wRGBZCbvzxsd242hdOidZEbaVCN3SrpBztxPney0Y/39y4CSiOO
 /yUw==
X-Gm-Message-State: AC+VfDyMFytxtsTLps4/87HaRDNJTFv6jnErkXDzB3xPYS/bd90ZbkxD
 /vaw7TctlRVp/RV6HZAZYi5g7+IrYTgrsXtrELUVMidNsEV2bYmKYoptwn1H2grM2zG+x7HZejQ
 nLAgkDa+i0SX6MutPtz7WYKY/Lzm5
X-Received: by 2002:a1c:4b04:0:b0:3f7:246e:cd2e with SMTP id
 y4-20020a1c4b04000000b003f7246ecd2emr5265801wma.23.1685951287250; 
 Mon, 05 Jun 2023 00:48:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HJOy+bVutAb7WQLT6j3pU44tUaR1qLXEO8VnPsMONwfgesftWuRQxvkdzmRmRsnT2DMy9OA==
X-Received: by 2002:a1c:4b04:0:b0:3f7:246e:cd2e with SMTP id
 y4-20020a1c4b04000000b003f7246ecd2emr5265786wma.23.1685951286962; 
 Mon, 05 Jun 2023 00:48:06 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q21-20020a1ce915000000b003f4fb5532a1sm9715192wmc.43.2023.06.05.00.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:48:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/ssd130x: A few enhancements and cleanups
Date: Mon,  5 Jun 2023 09:47:48 +0200
Message-Id: <20230605074753.562332-1-javierm@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

While working on adding support for the SSD132X family of 4-bit grayscale
Solomon OLED panel controllers, I noticed a few things in the driver that
can be improved and make extending to support other chip families easier.

I've split the preparatory patches in this series and will post the actual
SSD132X support as a separate patch-set once this one is merged.

Best regards,
Javier


Javier Martinez Canillas (5):
  drm/ssd130x: Make default width and height to be controller dependent
  dt-bindings: display: ssd1307fb: Remove default width and height
    values
  drm/ssd130x: Set the page height value in the device info data
  drm/ssd130x: Don't allocate buffers on each plane update
  drm/ssd130x: Remove hardcoded bits-per-pixel in ssd130x_buf_alloc()

 .../bindings/display/solomon,ssd1307fb.yaml   |   8 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 124 ++++++++++++------
 drivers/gpu/drm/solomon/ssd130x.h             |   6 +
 3 files changed, 93 insertions(+), 45 deletions(-)

-- 
2.40.1

