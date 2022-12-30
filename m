Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AB6597B4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 12:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351F10E1E7;
	Fri, 30 Dec 2022 11:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980FA10E1E7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 11:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672399944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeKDJrYbaI3FJ2VBUiO/cu0OzoKbMQjQcsgl6QH5j8A=;
 b=bYfr3shXgvLN9Un2aDLpW9w16wnTZd8JCf9wnfTC7Aht4TpX1iDwF35zvih2xEDaKndLF0
 GS1nq0NqG89u29F5s15ZUWjRby8Jh++PBC7Wv+wiAJIiEGPQg1zlsg6JSIIIOrXBcHpkdO
 iB0lqTSYGKwqsj4B45qROmKOkXJa5x8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-oXc_2_GDNmKPWLSIAoDlCQ-1; Fri, 30 Dec 2022 06:32:23 -0500
X-MC-Unique: oXc_2_GDNmKPWLSIAoDlCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so3784616wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 03:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DeKDJrYbaI3FJ2VBUiO/cu0OzoKbMQjQcsgl6QH5j8A=;
 b=neNZI5Zhd4Yo9L9/srMECQbv3T7qRWcHcLSkbclRa0OI/fRQ64RLR8QQJHl6QqsUg+
 KHfl/kNfZxSp0L27xLF7SeKYUhNkQZUq0c4djBIBx1POHin4q5b8qbf03AdAg7TMTiC4
 qWDq3mZGEtfsj6dY821Vpl/D0eR+plaZNaic6E3aO8BVbWsPGKy3P6oOf7zPp+jR/p9I
 ijjQ88BNIxbkqJ+vSXTflJbnBHGXbAWVLIlNYVCEsj7FynBqs38PoW5uxW6/wfxGKEf5
 nI19PkqeI2NBo03I8isbpdRT0xxNL2CBBn6RWMroxss1Trs86ERZMvqkSgrAxUXFHO/I
 ySCg==
X-Gm-Message-State: AFqh2kqds/L8sEQwegr8SUScgA0+JMu/EYY3xVc+/7v2E4B4b9MMJzmj
 z7cE2j557CCnpEFyP+4/SG2Kn+LmUh86JKy3IYWzKQVfeHJl+0vnYT05j0jWsF1YAgrN5mIBWHv
 FaViXb7d2pzztfG+rpxldIZajpkad
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id
 f22-20020a1c6a16000000b003c6f732bf6fmr22090635wmc.13.1672399942134; 
 Fri, 30 Dec 2022 03:32:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu4pyxfhlGvCd1zlNQ63SGCuE+NA4gykrf2HL60jTWIIVNrlVJdt+Gohmi3iVF7sNJhzVRlsw==
X-Received: by 2002:a1c:6a16:0:b0:3c6:f732:bf6f with SMTP id
 f22-20020a1c6a16000000b003c6f732bf6fmr22090618wmc.13.1672399941956; 
 Fri, 30 Dec 2022 03:32:21 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm27638432wma.27.2022.12.30.03.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 03:32:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
Date: Fri, 30 Dec 2022 12:31:53 +0100
Message-Id: <20221230113155.3430142-4-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113155.3430142-1-javierm@redhat.com>
References: <20221230113155.3430142-1-javierm@redhat.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer for the driver and devicetree bindings schema.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4:
- Add Sam Ravnborg's Acked-by tag.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7729a30b9609..c901e536303b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6551,6 +6551,13 @@ S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
+DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
+M:	Javier Martinez Canillas <javierm@redhat.com>
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+F:	drivers/gpu/drm/panel/panel-himax-hx8394.c
+
 DRM DRIVER FOR HX8357D PANELS
 M:	Emma Anholt <emma@anholt.net>
 S:	Maintained
-- 
2.38.1

