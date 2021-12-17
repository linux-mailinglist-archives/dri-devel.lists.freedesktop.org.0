Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C547818C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4E10E27C;
	Fri, 17 Dec 2021 00:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C8210E22A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYRJCKrd2+7uPQGF190uQYPQip+gsBG97QfrRl/YyLs=;
 b=iPsBhfURsYkS1AmEZSSJstrGbJxAcl8iNgq/nwyUYZsEd0F44a6wwn5h0QJpZc5ztwgpKp
 RmJzX0APCoY5xu2qwfckCnChB3iGt0Yl/jDeaut5rlVBe2vLSoyDzjCszfVjGp3/5cRHOZ
 +AYQFLm+hEylkY2F9Sc7rJlrDut9XZ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-POJpvYnTOjOgt8YNsCQy4A-1; Thu, 16 Dec 2021 19:38:19 -0500
X-MC-Unique: POJpvYnTOjOgt8YNsCQy4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso2089605wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aYRJCKrd2+7uPQGF190uQYPQip+gsBG97QfrRl/YyLs=;
 b=Kr9G4hV8EeKq5O+U082oB0S1IxZNa8KYmI18lQ/tCmvisQOlrVG9Hr4p9uhHgv4ytb
 UOIZ+xGZlKxpB/yEM7ajuELIKefAPysTVIhthXgM36Zv+ML8Q3qiwiiIMf7IC8ucyi9h
 KcjaEFW1KvUWLFzQxQcl26fAcTemD6ckUU1q3pmtip0BA0ACZB8hd756kU02sgLQ+o8E
 oSyP1EVzv2y6Bjlvhtd32XjqEXYjRvTGRCKVSvZYO5Z3ID4hYTYv8L9U/Zd0dHdtPDnc
 Aagu9N1Od0Iv2tISsRR7QuSMqq9otoJjVAyK5KgPGaIa/Fa32a3MRx0TGeb2lobpjNOU
 hh4g==
X-Gm-Message-State: AOAM5304zAbQSK6S0DL3tb3OYHVTakNQFU8gTrYFitsQxo4qghlA+iF7
 5S7cApafQysI38APzraz85H5SfLiNpQaFho4sVD47y3BSu+n1nod1PHgTHIUazU8A3FevC0hGIy
 9SFpfQOFxGAZaVY83663z+DDTr/5T
X-Received: by 2002:a5d:548f:: with SMTP id h15mr369928wrv.99.1639701498417;
 Thu, 16 Dec 2021 16:38:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykGTqlKLbJaHtGWlvMlQeut/mMfG1i8liFQGHb5nirG+I23IdOtiMdza3+LogSE5Gfa31P+w==
X-Received: by 2002:a5d:548f:: with SMTP id h15mr369920wrv.99.1639701498253;
 Thu, 16 Dec 2021 16:38:18 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/37] drm/xlnx: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:35 +0100
Message-Id: <20211217003752.3946210-21-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index ac37053412a1..311796106b70 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -286,7 +286,7 @@ static struct platform_driver zynqmp_dpsub_driver = {
 	},
 };
 
-module_platform_driver(zynqmp_dpsub_driver);
+drm_module_platform_driver(zynqmp_dpsub_driver);
 
 MODULE_AUTHOR("Xilinx, Inc.");
 MODULE_DESCRIPTION("ZynqMP DP Subsystem Driver");
-- 
2.33.1

