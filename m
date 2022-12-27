Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D66569AD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 12:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2257910E182;
	Tue, 27 Dec 2022 11:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB72610E182
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 11:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672139024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nkS0uo5evck1whC4UlRL7zEzShwAWRdnhJUD05ERnDk=;
 b=a7h8KYkHrvKd7L+xaUpg857DbO8Z3oBmoKOeK3iJcNDCDeXDgW9ooyRflgoPn+o0KUz5xy
 7rVGkb7lWn+EAzW7Ri2Xzv7oJBqkwvrcCKvNKLYKDIROJLxGBf0jRMj53WnWu0URf7HaMP
 04vZNbMazuDwt+c6fAiYOvEyZFTQVOg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-2T10GxccNBGp8RoJB8XPjg-1; Tue, 27 Dec 2022 06:03:41 -0500
X-MC-Unique: 2T10GxccNBGp8RoJB8XPjg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j1-20020a05600c1c0100b003d99070f529so103958wms.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 03:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nkS0uo5evck1whC4UlRL7zEzShwAWRdnhJUD05ERnDk=;
 b=UGNUXcH9Eeh3uLk6MMVhBcTpbkQlydLeoqBUN8PMiaaFJzjvwQO8nbJ0YzpbpGNO+a
 OSK7/46kzQcslGPaRO9QiDWztAFA04lLjPWiwyk6yf7kluAQ7DDA61Y4bm2Bj22Dx/hb
 H5GsCw1EW4Ki64n5l9oHKHwq8hZAx8GtBJ6SgqqPU5OmZeOP0+sL2eEdqb2Bl5w35Ruu
 SI2NcoN6Cvx6+qNimPRHV3Nz51W6/xbAzhFIs9PSNNXcZpYUI0XC7rJ/aMm11+Ex/aj1
 dKXXB/1jgQ0P810Xn7DDbAdcV7N0giejQIpWEsJqqOfyZMIgz24QomP+JcV8p/z01Mr/
 AAsg==
X-Gm-Message-State: AFqh2koBXpN+vTF61bqGO/svm4bCku7ri9lO7bUASEq5IQ/2o2SZPP9N
 xqKdwdHUR0j94VVccqJKMO34gosZxq1j/Hyd0v8MdQTuFn68zSMpb8eI2aZbhk5esqSr39GSeIP
 e2X73AFuUdgj1vmQs/Ub/LjqyutSL
X-Received: by 2002:adf:9b93:0:b0:26e:d96b:da7a with SMTP id
 d19-20020adf9b93000000b0026ed96bda7amr12298830wrc.61.1672139020370; 
 Tue, 27 Dec 2022 03:03:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5y/kkiAuwA5Llqp+Wayp+ny7mbOOuXGVQjt+WhczDlzljG99CbF/SmOlAkyohJ5FLjxT8qg==
X-Received: by 2002:adf:9b93:0:b0:26e:d96b:da7a with SMTP id
 d19-20020adf9b93000000b0026ed96bda7amr12298807wrc.61.1672139020100; 
 Tue, 27 Dec 2022 03:03:40 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p18-20020a056000019200b00279d23574c4sm7374557wrx.13.2022.12.27.03.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 03:03:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add PinePhone Pro display support
Date: Tue, 27 Dec 2022 12:03:31 +0100
Message-Id: <20221227110335.2923359-1-javierm@redhat.com>
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
 Martijn Braam <martijn@brixit.nl>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-rockchip@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>,
 devicetree@vger.kernel.org, Robert Mader <robert.mader@posteo.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
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

This is a v3 of the patch-set that addresses issues pointed out in v2:

https://lists.freedesktop.org/archives/dri-devel/2022-December/384513.html

The patches were tested on a PinePhone Pro Explorer Edition using a Fedora
37 Workstation image.

Best regards,
Javier

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

 .../bindings/display/panel/himax,hx8394.yaml  |  74 +++
 MAINTAINERS                                   |   7 +
 .../dts/rockchip/rk3399-pinephone-pro.dts     | 123 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 446 ++++++++++++++++++
 6 files changed, 663 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

-- 
2.38.1

