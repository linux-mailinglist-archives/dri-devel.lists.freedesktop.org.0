Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36C6597B0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF9310E1D2;
	Fri, 30 Dec 2022 11:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87910E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672399939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/oAGKz8UHTa57iRKW4s5lGYuywGUey4a7vrsAc6ygU=;
 b=iZF4+R1pDp7iIhOlMeUC+kl5ELauorpMLhz2SfaZEl21GnBAflAftwHgXSjuqOf+uGTFzX
 iPIGCG/Dgn0JBeyarzDXBRmfx4WcfILwdc+rElSk9o3VCx6HFNO3EHtSgUpCCkvTCI0qdI
 Xxh6vtxD2yUWRt8yqy6AaGlns75lauM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-2wso5Y9QNMW9qXL_TQtJSQ-1; Fri, 30 Dec 2022 06:32:18 -0500
X-MC-Unique: 2wso5Y9QNMW9qXL_TQtJSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t18-20020adfa2d2000000b00277e6c6f275so1440431wra.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 03:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/oAGKz8UHTa57iRKW4s5lGYuywGUey4a7vrsAc6ygU=;
 b=mziVNj7JYGrZVY5ElSkoKYPINTzeMbz1XKPN/Vuw2m6hOC4DPLvfzQMeE83frJ8YuI
 dyWvG2EqyUxJb3olB6XJGwN7yqnb3Ayquggxf7MR78m3fr4r8Ajogt2JH3NCQ2EkcQ4j
 iEePk3PXIhdX5yK2ZqkfXjSL8BKzZ/ETn94S4KojVHhw/4nwHIn4JkiEacrM+yzhyx7E
 GcvupnInUA6/c5f2OTXr7DQ5lpXpTo++mJ0wgC6er5AKYoxMLssOuqxd2ukuJ1cOxxPb
 cloB6NXLeQ6+hU2QfgzDToDmrHBDzmXHxpN/qLvKCSmKfQVzjL1TkSX7WRjlw2F0JEL6
 bHHw==
X-Gm-Message-State: AFqh2kqF4ZLgc8L8HOjg3JYvm2CB/domAokjiQDZMFwkOciiWtUxvnbA
 DN8jINSa36NWZVPfkOXRil9hYQqWaPvLq9+6DEi8cKCrO+FcQhBBoowPrrnQ1B3hoCybuHbYalg
 QXiDKEa6j7PutrnKOeYlcMgViPK5U
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id
 p35-20020a05600c1da300b003d34dbc75efmr22353791wms.17.1672399937560; 
 Fri, 30 Dec 2022 03:32:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXujD8ZzgS7Pb826oREyFiC1KNraLQbuNX7XL2S+SNLv8iwIINUvUgMCaq86xR2bPIYl4qfNTA==
X-Received: by 2002:a05:600c:1da3:b0:3d3:4dbc:75ef with SMTP id
 p35-20020a05600c1da300b003d34dbc75efmr22353756wms.17.1672399937268; 
 Fri, 30 Dec 2022 03:32:17 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm27638432wma.27.2022.12.30.03.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 03:32:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] Add PinePhone Pro display support
Date: Fri, 30 Dec 2022 12:31:50 +0100
Message-Id: <20221230113155.3430142-1-javierm@redhat.com>
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
Cc: Neal Gompa <ngompa13@gmail.com>, dri-devel@lists.freedesktop.org,
 Martijn Braam <martijn@brixit.nl>, Caleb Connolly <kc@postmarketos.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-rockchip@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 Robert Mader <robert.mader@posteo.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Maya Matuszczyk <maccraft123mc@gmail.com>
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

This is a v4 of the patch-set that addresses issues pointed out in v3:

https://lists.freedesktop.org/archives/dri-devel/2022-December/384560.html

The patches were tested on a PinePhone Pro Explorer Edition using a Fedora
37 Workstation image.

Best regards,
Javier

Changes in v4:
- Add fallback "himax,hx8394" compatible for the panel controller (Jagan Teki).
- Add Tom Fitzhenry's Tested-by tag.
- Add Sam Ravnborg's Acked-by tag.
- Add Tom Fitzhenry's Tested-by tag.
- Keep the DTS nodes sorted alphabetically (Tom Fitzhenry).

Changes in v3:
- Fix example snippet for `make dt_binding_check` to pass (Krzysztof Kozlowski).
- Add Sam Ravnborg's reviwed-by tag.
- Move driver patch after one introducing the DT binding (Sam Ravnborg).

Changes in v2:
- Drop redundant "bindings" in subject (Krzysztof Kozlowski).
- Drop "device tree bindings" in title (Krzysztof Kozlowski).
- Put port next to other "true" properties (Krzysztof Kozlowski).
- Add Krzysztof Kozlowski's Reviewed-by tag.
- Add year to driver's copyright notice (Sam Ravnborg)
- Remove unused <video/display_timing.h> header include (Sam Ravnborg).
- Use mipi_dsi_dcs_write_seq() helper and drop custom macro (Sam Ravnborg).
- Drop unnecessary info messages and move useful one to debug (Sam Ravnborg).
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

 .../bindings/display/panel/himax,hx8394.yaml  |  75 +++
 MAINTAINERS                                   |   7 +
 .../dts/rockchip/rk3399-pinephone-pro.dts     | 123 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 446 ++++++++++++++++++
 6 files changed, 664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

-- 
2.38.1

