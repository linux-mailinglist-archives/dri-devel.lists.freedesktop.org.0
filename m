Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1646569B1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 12:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB810E2FF;
	Tue, 27 Dec 2022 11:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E110E182
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672139027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wH+4HRZ1zZ0UoFhrYTYu15fArLuO/swgT/BBXQ1MINU=;
 b=gRTlXiygaRXyLx5a7mfth92pAYApL9X/5FiqCF/HPBiqrpG0rPvXRUva961ZTzKaowL7qa
 h1JvnEbm6wdbqUZ9PizTfFwHvExECx9VYlpRzbA1vXW75GKCk7JnuK4g2rb49WyVN0RD/m
 b3hrToWA3H7JP7eFzmDP3TtDKcr9O34=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-TNnaPNqtM8-BYTGLk293_Q-1; Tue, 27 Dec 2022 06:03:46 -0500
X-MC-Unique: TNnaPNqtM8-BYTGLk293_Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 c23-20020a7bc857000000b003d97c8d4935so2513878wml.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 03:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wH+4HRZ1zZ0UoFhrYTYu15fArLuO/swgT/BBXQ1MINU=;
 b=2m7mNOSBYRNfCaYcc49gZ55o/Uz/o3aJKL7u412/zWs9a0HC65OUitBwluan0bK5lq
 o3TH47fhmhz8xz8rB2nCnWfP6Tlx4GcmrmRfQ6ESvFl6Ss46QPfRLbyDpBkBXExYzV7k
 DW4wmCB6zR9TferntH9/f5AgggUUKvehZ3UloXlQWUL4lutCZ3MJSZg3HmS/34ufF28k
 rs9FaN1eJtMcrssL/UJRZt5FgE9oV0vRPpRY9kBniWvJD1UXZQGNHbABlXYJYSGCcdYW
 aXmjHnNHKNkTft31nVHw59E5L8vKwMw6SPF5lxY2JLBYCBD6EKRl7ViM41x9YCFXEqfv
 ecLg==
X-Gm-Message-State: AFqh2kriC0AZCT+RXVd5rvrmW+u3XLsYLiJomZ9/yNXQp139zeyQCIZo
 oagzsqAOw84UhMh9V8hHz1N95f5Ca6j0Epory8OVGsUBE+7ZUPr9x21gVhnAfLotep/eLkuhzAh
 NChnoEFUxxfa8lH6erochWanoAFAg
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id
 h12-20020a5d6e0c000000b0027da1eadcfamr3905014wrz.19.1672139025090; 
 Tue, 27 Dec 2022 03:03:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs8h2wHJt0LfoL/Atrfl1zO+CdP9j8AFrLksVlvhM637LO1v1b1ONi7rK7lBzsZVnsrVGLsQA==
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id
 h12-20020a5d6e0c000000b0027da1eadcfamr3904995wrz.19.1672139024881; 
 Tue, 27 Dec 2022 03:03:44 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p18-20020a056000019200b00279d23574c4sm7374557wrx.13.2022.12.27.03.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 03:03:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] MAINTAINERS: Add entry for Himax HX8394 panel
 controller driver
Date: Tue, 27 Dec 2022 12:03:34 +0100
Message-Id: <20221227110335.2923359-4-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221227110335.2923359-1-javierm@redhat.com>
References: <20221227110335.2923359-1-javierm@redhat.com>
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
Cc: Robert Mader <robert.mader@posteo.de>,
 Onuralp Sezer <thunderbirdtr@fedoraproject.org>,
 Neal Gompa <ngompa13@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Kamil=20Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Sam Ravnborg <sam@ravnborg.org>, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer for the driver and devicetree bindings schema.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e832cf29bec..175d72203fb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6480,6 +6480,13 @@ S:	Maintained
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

