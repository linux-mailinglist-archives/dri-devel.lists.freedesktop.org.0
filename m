Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343826562E6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 14:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A520D10E0E0;
	Mon, 26 Dec 2022 13:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4910E0D9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672062565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zUK8ohDvHrqcANf/NgU5DC4WBrgNFcEfShtnNkgckEM=;
 b=DOPXumtFvHkSaoM2ai/nVOkVwZ8Ld775RKJ5ahKh1dzvg+Jn2N4BZEws/P5E8iOS8W6KKp
 fl4TcVvQPyR0bBYYRUGFbqctddRdn3526kCBDbZzul2tAOtzDR2qsqitCvIR8fIvWbp+HF
 oG7cyKzqe7ItsStiyGNPE31/RkCt3yE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-JPlQEk9yMzCc8rWDNwFd8w-1; Mon, 26 Dec 2022 08:49:21 -0500
X-MC-Unique: JPlQEk9yMzCc8rWDNwFd8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso3933566wms.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 05:49:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zUK8ohDvHrqcANf/NgU5DC4WBrgNFcEfShtnNkgckEM=;
 b=BQ1IaH6VMAGXtoEHI53W0u7VzIy7eHpxFOXIngwE3AcCa1KBB2AbSlg10p7AQEGi+o
 xA0GS8ofeHIszjB9BSW4Pa8puI+9RLqW83Ei5tYK0eQXpKhvmiWUKvnk9jbBU3R3Y8aW
 J5HWqCWKzXasttWyQN3pHoUVUP+knS1Wed4xKhBg6P30zPrzuEuHsalMzJILsl/FDNEK
 hcHnz+CCfLwLbKR/8ejQStoDcEGeJFBi89T8zg1t/85dSOmcb8Yh4Yc1Su/J5RtZysnc
 4eX/Wi7EJABjY+NODAFHRopsxz2N+HVy99VoOfiL/Td2yb3T7MxUnbNVBkq0Tb6k82iE
 1e6Q==
X-Gm-Message-State: AFqh2kp7V3KARAanlvPCP/Dt1aKhYiS2YooI6XEfNc20EOHm8G1e5J72
 uodVURNtf8YruVWV9mxgeQLcGYluA0LLhrwy9NttkfORdxKKLdRatIS3k6c1IPiVNLPhh3peDnL
 +h3fsnSnH/SbQZifPNT4mIpdW780L
X-Received: by 2002:a5d:53cd:0:b0:261:d8be:3047 with SMTP id
 a13-20020a5d53cd000000b00261d8be3047mr12086640wrw.3.1672062560711; 
 Mon, 26 Dec 2022 05:49:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsZFk+AKv2denQ6Lk8VrO7aAH7Y5BneyC/FpbtIetK0t17olrLdqcrM70WD3U/nREM6lduGQ==
X-Received: by 2002:a5d:53cd:0:b0:261:d8be:3047 with SMTP id
 a13-20020a5d53cd000000b00261d8be3047mr12086623wrw.3.1672062560498; 
 Mon, 26 Dec 2022 05:49:20 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a18-20020adfed12000000b0027cfd9463d7sm3340947wro.110.2022.12.26.05.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 05:49:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add PinePhone Pro display support
Date: Mon, 26 Dec 2022 14:49:04 +0100
Message-Id: <20221226134909.2822179-1-javierm@redhat.com>
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
 Robert Mader <robert.mader@posteo.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Martijn Braam <martijn@brixit.nl>,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
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

This is a v2 of the patch-set that addresses issues pointed out in v1:

https://lore.kernel.org/all/20221222223830.2494900-1-javierm@redhat.com/T/#m692655a06093fe8df0d8748b3df338e57494af2a

The patches were tested on a PinePhone Pro Explorer Edition using a Fedora
37 Workstation image.

Best regards,
Javier

Changes in v2:
- Add year to driver's copyright notice (Sam Ravnborg)
- Remove unused <video/display_timing.h> header include (Sam Ravnborg).
- Use mipi_dsi_dcs_write_seq() helper and drop custom macro (Sam Ravnborg).
- Drop unnecessary info messages and move useful one to debug (Sam Ravnborg).
- Drop redundant "bindings" in subject (Krzysztof Kozlowski).
- Drop "device tree bindings" in title (Krzysztof Kozlowski).
- Put port next to other "true" properties (Krzysztof Kozlowski).
- Add Krzysztof Kozlowski's Reviewed-by tag.
- Fix regulator node names (Maya Matuszczyk).
- Drop non-existent "poweroff-in-suspend" property (Maya Matuszczyk).
- Remove unnecessary comments in panel node (Maya Matuszczyk).

Javier Martinez Canillas (2):
  dt-bindings: display: Add Himax HX8394 panel controller
  MAINTAINERS: Add entry for Himax HX8394 panel controller driver

Kamil Trzciński (1):
  drm: panel: Add Himax HX8394 panel controller driver

Ondrej Jirman (1):
  arm64: dts: rk3399-pinephone-pro: Add internal display support

 .../bindings/display/panel/himax,hx8394.yaml  |  65 +++
 MAINTAINERS                                   |   7 +
 .../dts/rockchip/rk3399-pinephone-pro.dts     | 123 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 446 ++++++++++++++++++
 6 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

-- 
2.38.1

