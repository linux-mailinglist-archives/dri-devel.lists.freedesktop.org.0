Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0860565B80E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 00:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897E610E237;
	Mon,  2 Jan 2023 23:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB210E237
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 23:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672700865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEVt3NVnWgbCIhCiAs4I26hLaITp9BpaVbzzj55zI/o=;
 b=b6w9XSRg6qVbeU9rYXYz+uwoS2dHQcpMmif3x/zryTFZmeYJbGTcEs06pCYFcKHrH7Q0eT
 TNmmJFX9hLCVfsCj5P8qyS3l5wlT6dYo9meCfGhAS1pbzyxVwC8rmSMH3B/uzswtRnBgQf
 lmec653MNxH/eMRyPndlTAtqMILCdzc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-qy5RSr2pOumOrvA9BcB6Zw-1; Mon, 02 Jan 2023 18:07:44 -0500
X-MC-Unique: qy5RSr2pOumOrvA9BcB6Zw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m38-20020a05600c3b2600b003d1fc5f1f80so19148341wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 15:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEVt3NVnWgbCIhCiAs4I26hLaITp9BpaVbzzj55zI/o=;
 b=MV4fxJnwq/b2dbLT+wwZ+Wbwdinm6yKpddCD9B59CDweSUvxrlKFArfQRGXghecSfv
 Zx7rGMrijmjpOLmGoXtPjKpGZ4WhL1sz58F4ByO26rEG8bSnZobVZH20c4m9GMxgHJ/s
 M+pTe7MGx37Mru5YQpfsCXcVWgXN0k079dVbW1YhLs4CLDHJSdXy0sbBXh3UQzPXW6G5
 3716oE9XEwT7z9iJOMzPY5xmdGiPP5bEbZM3zpzrr9Q1q81SuSUyxZoqJ97gj6m8uUfS
 lG9PforkM5EG414jBqLgPIAmEbYwuK9wX+k/NJcvPx5iZB4N4MDgi0v6L31yuoCiXyn9
 gRIA==
X-Gm-Message-State: AFqh2kpUeSrUe+gSdgjwg7ZSLwtPn5O9zFZ/A+yep2bEu0+xzdpEbGQg
 vLUcO6Qx/KE0UoaVjeZIR92CJuPosLIHQFmSq08+AZAZyNqGtjfas88g7/QOqRvKBtmckph88tt
 IyaeLuBvP8eK1Bo5kPHYSn2VUE7Lx
X-Received: by 2002:a5d:5b07:0:b0:270:f10a:b90a with SMTP id
 bx7-20020a5d5b07000000b00270f10ab90amr24413797wrb.6.1672700863134; 
 Mon, 02 Jan 2023 15:07:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFtxgFQDsT6Mb75iNuIlGvVyvule10jwKdBVTfDBmmmfINbIrqc/dQ/xFUISLhZBP+OpbL4Q==
X-Received: by 2002:a5d:5b07:0:b0:270:f10a:b90a with SMTP id
 bx7-20020a5d5b07000000b00270f10ab90amr24413791wrb.6.1672700862955; 
 Mon, 02 Jan 2023 15:07:42 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm22746906wrw.117.2023.01.02.15.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 15:07:42 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
Date: Tue,  3 Jan 2023 00:07:33 +0100
Message-Id: <20230102230733.3506624-4-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102230733.3506624-1-javierm@redhat.com>
References: <20230102230733.3506624-1-javierm@redhat.com>
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
Cc: Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer for the driver and devicetree bindings schema.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v5:
- List Ondrej Jirman as a maintainer in the driver's MAINTAINERS entry.

Changes in v4:
- Add Sam Ravnborg's Acked-by tag.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7729a30b9609..4e049faf2f51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6551,6 +6551,14 @@ S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/tiny/gm12u320.c
 
+DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
+M:	Ondrej Jirman <megi@xff.cz>
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

