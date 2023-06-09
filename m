Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B372A0E9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193C410E160;
	Fri,  9 Jun 2023 17:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4CE10E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686330587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NKTMLeVuJjJu+UupiY9R8YrLvu9QU8MmD3rWpa6hb1s=;
 b=RvcIYsWFZoSGJO+LWsLTTeEmmVuoF2PcKImNMo1eXHgU6FSO9TcFS94bNzisPqAZvq07s6
 CF4GNFO5WEBQKHaenNdOTh+8oibo+9QgwPtxxL4rQ9fNtDGzgFiS4f0yV+X5u7KllobxNH
 zBUZe2L/qm9Evs1tmQcO2E5dcujwHtk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-XI6isg0eNUajGQjfG7S2lw-1; Fri, 09 Jun 2023 13:09:46 -0400
X-MC-Unique: XI6isg0eNUajGQjfG7S2lw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30e4d11a413so860471f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 10:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330585; x=1688922585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKTMLeVuJjJu+UupiY9R8YrLvu9QU8MmD3rWpa6hb1s=;
 b=c+/Ote16XEzKk3m0rtMOx16ndw2jImTemy9rToDY5SBXKXqcVPg6IpzsF1YipM5190
 hDc9DiRrclXQhwPWLn1loO5QUFcnM6PSuO3dDOggE1zzZET/B6tX8tCD/I4jUSPi/dkH
 cvANfqpAC1qFqnXKzgXotX2bg5nIL5s4JAKVQCH021S2sfq8R791jB+NtmZhm3IcHSZy
 ngs80JHWPceUdDKOZC+OKcexePIhbgADw+x9hWGIUTmcF1kr5Ri7O6HLVr929peClpva
 /2r61G/7Ux7F06KnhdmMYOETIVQ9h6btFmG5R9ayX2Tp2mwtn6Q+y9d4hrncb8pwYD7v
 pyEg==
X-Gm-Message-State: AC+VfDwxIWZr65UTQ8UDdFVckcU12MhqUJiQucMKQqys8XHxywv+IrlJ
 356KrpHYp4kKi4tHX5cgJ6eBhH7KjckY00WyFPGKRvnHkPaMdcOG/ElD9ETvA5D3+4nG/Q4PJZ2
 7/HfnHvTNsXhIVSWvC2k8sj9TJXaZ
X-Received: by 2002:a5d:58cf:0:b0:307:cf71:ed8c with SMTP id
 o15-20020a5d58cf000000b00307cf71ed8cmr4121890wrf.35.1686330584955; 
 Fri, 09 Jun 2023 10:09:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O8JZIPu1qlsxJkv6bYuVB1QreUorZhNkNOZBycKwRdDH9UjGNDznFR4S5cz6Dqwhpdfc/ng==
X-Received: by 2002:a5d:58cf:0:b0:307:cf71:ed8c with SMTP id
 o15-20020a5d58cf000000b00307cf71ed8cmr4121875wrf.35.1686330584684; 
 Fri, 09 Jun 2023 10:09:44 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm3265526wmr.2.2023.06.09.10.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:09:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/ssd130x: A few enhancements and cleanups
Date: Fri,  9 Jun 2023 19:09:35 +0200
Message-Id: <20230609170941.1150941-1-javierm@redhat.com>
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

Changes in v2:
- List per controller default width/height values in DT schema (Maxime Ripard).

Javier Martinez Canillas (5):
  drm/ssd130x: Make default width and height to be controller dependent
  dt-bindings: display: ssd1307fb: Remove default width and height
    values
  drm/ssd130x: Set the page height value in the device info data
  drm/ssd130x: Don't allocate buffers on each plane update
  drm/ssd130x: Remove hardcoded bits-per-pixel in ssd130x_buf_alloc()

 .../bindings/display/solomon,ssd1307fb.yaml   |  28 +++-
 drivers/gpu/drm/solomon/ssd130x.c             | 124 ++++++++++++------
 drivers/gpu/drm/solomon/ssd130x.h             |   6 +
 3 files changed, 113 insertions(+), 45 deletions(-)

-- 
2.40.1

