Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3798865B80C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 00:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB9110E21D;
	Mon,  2 Jan 2023 23:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D77D10E21D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672700860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZVNbH247RvvExgic0vKdLMnFmxWziqLn857HdRy/XtQ=;
 b=LoaSmRYqxi4gJq0nrDoE+vXb0jN1Z/Uu3l9vBx+cLPXHn5LLhcNpTh4vB49LcQLkeTsRCG
 DqOBanZAZcm5ILjx5a4POZDfgln0xm0YKUq2kBtH5xiI1b3A+85ev/9UxVZEFPrhScshQQ
 wgq8I8/ZnpFW10zbR9IAM349JrSSJp4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-iuZSh4arPum5uHGqXJEHTg-1; Mon, 02 Jan 2023 18:07:39 -0500
X-MC-Unique: iuZSh4arPum5uHGqXJEHTg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so6044262wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 15:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZVNbH247RvvExgic0vKdLMnFmxWziqLn857HdRy/XtQ=;
 b=uzrPOwunrqIPkPFXfh8mrzcM3BHONG7X/hJ1YOYa9ZTMaEwiJqbBC+yBnqfWScst6Y
 0+dOdAp9bVoLoL3g6nS4A79Tqh6ouQQYBLQQlajIbi5UV9Ba2ixi7Wa2RH6pq/LUMpsf
 5Tw+JxhSLhEtw5bGsG9O9cARq5jGwW/Gqey5g+E/w8wwdyDDda4hOGXk9gAymezLKVqL
 ySxCYztE5T6toR5KhYtaUb5RJYnnxxQDnKITms0Mg+KI1l5E3ZOFT2qj4YIDnIRVRkrR
 PnWi7l68x9JlczIoVEs85OHfQkAL2QrZXVIrvwLS18CqpPzh9T/23m9cFe4XKr0yzBZI
 SIww==
X-Gm-Message-State: AFqh2krPcfs/hGJXsAD7ZjNMHx+uRo4yWP1R/v+Hy24YacLGSaxSlbq0
 5Vk3Quz6EPzX/KoNmzYd97q5/OMIw9F6BmOvE/DX42AW80AuotmhfrV54nFw+onDwYOP2HIug8M
 jz4A6Xm1creWb06XG7RaR8Hy9Zkba
X-Received: by 2002:adf:e449:0:b0:27c:fdb:cfef with SMTP id
 t9-20020adfe449000000b0027c0fdbcfefmr16738910wrm.49.1672700858161; 
 Mon, 02 Jan 2023 15:07:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsm0o/HUzx1u6umoaT6TwoYLUR4Q/i3IuCfEcVC4DAM8E64C5wYahQAOQW+JH1jWC0VtHoPRA==
X-Received: by 2002:adf:e449:0:b0:27c:fdb:cfef with SMTP id
 t9-20020adfe449000000b0027c0fdbcfefmr16738895wrm.49.1672700857913; 
 Mon, 02 Jan 2023 15:07:37 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm22746906wrw.117.2023.01.02.15.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 15:07:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add PinePhone Pro display support
Date: Tue,  3 Jan 2023 00:07:30 +0100
Message-Id: <20230102230733.3506624-1-javierm@redhat.com>
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
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the display present in the PinePhone Pro.

Patch #1 adds a devicetree binding schema for panels based on the Himax
HX8394 controller, such as the HSD060BHW4 720x1440 TFT LCD panel present
in the PinePhone Pro. Patch #2 adds the panel driver for this controller
and finally patch #3 adds an entry for the driver in MAINTAINERS file.

This version doesn't include the DTS changes, since Ondrej mentioned that
there are still things to sort out before enabling it. The DTS bits will
be proposed as a follow-up patch series.

This allows for example the Fedora distro to support the PinePhone Pro with
a DTB provided by the firmware.

This is a v5 of the patch-set that addresses issues pointed out in v4:

https://lists.freedesktop.org/archives/dri-devel/2022-December/384810.html

The patches were tested on a PinePhone Pro Explorer Edition using a Fedora
37 Workstation image.

Best regards,
Javier

Changes in v5:
- List Ondrej Jirman as a maintainer in the DT binding schema document.
- Add Peter Robinson's Tested-by tag.
- List Ondrej Jirman as a maintainer in the driver's MAINTAINERS entry.

Changes in v4:
- Add fallback "himax,hx8394" compatible for the panel controller (Jagan Teki).
- Add Tom Fitzhenry's Tested-by tag.
- Add Sam Ravnborg's Acked-by tag.

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

Javier Martinez Canillas (2):
  dt-bindings: display: Add Himax HX8394 panel controller
  MAINTAINERS: Add entry for Himax HX8394 panel controller driver

Kamil Trzciński (1):
  drm: panel: Add Himax HX8394 panel controller driver

 .../bindings/display/panel/himax,hx8394.yaml  |  76 +++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 451 ++++++++++++++++++
 5 files changed, 548 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8394.c

-- 
2.38.1

