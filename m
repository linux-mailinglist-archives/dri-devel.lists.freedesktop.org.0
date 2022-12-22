Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A388E65489A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B7810E59A;
	Thu, 22 Dec 2022 22:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF15210E599
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 22:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671748723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TE23DSdNWuSZ0vKWHoTlUXd7XsU2QKplwAo6+35hXVY=;
 b=e+64sIAHPWsK7naYsrLLHD+nbzB5DWS2V1/rT0r8LLNR0fBYayBty8pzgIYZauDlnaLeTX
 xMIljlEdT5bT9nD1sHUZXLGAS1lnUvB0n7ZASuw/ZISGTbr/wCv4elBQiqR9RsYgsHnmHK
 /8VCglt8FblQHpJS20mugiiJ7Q/SUeg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-MwEcFz6CNSaHsJkPNl5iQQ-1; Thu, 22 Dec 2022 17:38:42 -0500
X-MC-Unique: MwEcFz6CNSaHsJkPNl5iQQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so2890075wme.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TE23DSdNWuSZ0vKWHoTlUXd7XsU2QKplwAo6+35hXVY=;
 b=2NZ+uAF4EPom1ge9KHqUBaLqedcBARqJAj8monJhyshT3KqnlGuDN6+0ENX1lO9xGb
 69ibn17lxSLbm7YgkojdIowkB6mEYDZCQ+z2vNo6yjcqub1jVvyFAwL3rqFT4Rwl2h8b
 yHjU/odTv3DNiMtxSPgJoQAzY9HlbuQ0LhJfBI6WQmSMaIJMPT9ArQ6ozltRqFIWwyQE
 E06PmyYL46ujAlgZ4plrSko5DfoPwMi4d96uUt4KeqofmSdqFQUkHOuwJ9pHrfkjfD5G
 T+1ATI9MphI/Jx/f9zcNksvE/RpDgvie18EwwM2oIZxqTFhDMCF0Cc1at54EiLoSdaj3
 ye5g==
X-Gm-Message-State: AFqh2kp3vPMIkjyNvCH6sH6r5hZN8jR+EWBkEYSd/NT8guEl0mxCrQgq
 1SLO+Yta/wNQbjj6cEMLE0ekpDojiQXc8cEFfL3u+RneU6jz8DOY49cjo3du8zK7fjl4pqIAgFk
 d2woMzBVMLE4K/mTUsT3EUsEGYVvF
X-Received: by 2002:a05:600c:1ca5:b0:3d1:d746:7bca with SMTP id
 k37-20020a05600c1ca500b003d1d7467bcamr5584841wms.4.1671748721324; 
 Thu, 22 Dec 2022 14:38:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt17D6lN1ULKnX6zKVXMwfCh9S42fx9uklw7XxdwaE+3NeI3tkubhfYDOtnhDoxlw6v3WzhTQ==
X-Received: by 2002:a05:600c:1ca5:b0:3d1:d746:7bca with SMTP id
 k37-20020a05600c1ca500b003d1d7467bcamr5584825wms.4.1671748721075; 
 Thu, 22 Dec 2022 14:38:41 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n25-20020a7bc5d9000000b003d969a595fbsm2386239wmk.10.2022.12.22.14.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:38:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add PinePhone Pro display support
Date: Thu, 22 Dec 2022 23:38:26 +0100
Message-Id: <20221222223830.2494900-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, linux-rockchip@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add support for the display present in the PinePhone Pro.

Patch #1 adds a driver for panels using the Himax HX8394 panel controller,
such as the HSD060BHW4 720x1440 TFT LCD panel present in the PinePhone Pro.

Patch #2 adds a devicetree binding schema for this driver and patch #3 adds
an entry for the driver in the MAINTAINERS file.

Finally patch #4 adds the needed devicetree nodes in the PinePhone Pro DTS,
to enable both the display and the touchscreen. This makes the upstream DTS
much more usable and will allow for example to enable support for the phone
in the Fedora distribution.

I only added myself as the maintainer for the driver because I don't know
if Kamil and Ondrej that worked in the driver would be interested. Please
let me know folks if you are, and I can add you too in the next revision.

The patches were tested on a PinePhone Pro Explorer Edition using a Fedora
37 Workstation image.

Best regards,
Javier


Javier Martinez Canillas (2):
  dt-bindings: display: Add Himax HX8394 panel controller bindings
  MAINTAINERS: Add entry for Himax HX8394 panel controller driver

Kamil Trzciński (1):
  drm: panel: Add Himax HX8394 panel controller driver

Ondrej Jirman (1):
  arm64: dts: rk3399-pinephone-pro: Add internal display support

 .../bindings/display/panel/himax,hx8394.yaml  |  68 +++
 MAINTAINERS                                   |   7 +
 .../dts/rockchip/rk3399-pinephone-pro.dts     | 124 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 460 ++++++++++++++++++
 6 files changed, 672 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

-- 
2.38.1

