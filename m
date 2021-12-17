Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC48478196
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4B10E2D1;
	Fri, 17 Dec 2021 00:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF0110E246
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A01Ev1RLvxyt82eZGFo2uP87MzinUPDeffH9HM1ovKM=;
 b=PF/98nzUmHwH9t7scpUD28fTzex76rPWpfqsi2RG62RuRB99anVyrp9cEu1DO1lT7BEBz0
 lTyMZ/FnGTZCVZTJgZAwy2itNNY6M+ARJKNaq00LNDf7RjylltS667+9xHiNE6TOf+n6dA
 riXJcF9f9ttvQS8nRJomPGd0x5Oh6+U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-6v1uC_6wNqeZ1TKMosGk2g-1; Thu, 16 Dec 2021 19:38:29 -0500
X-MC-Unique: 6v1uC_6wNqeZ1TKMosGk2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so2102699wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A01Ev1RLvxyt82eZGFo2uP87MzinUPDeffH9HM1ovKM=;
 b=5JnVJwEAaPchYXA6VrWM3s4XF0+Q25knRURd44cANiIf8S+HeHCRPjOx7kRf77TxBg
 7l5VqgA8Urh36K0AHGlvrccN4aO4Lxdk+5CukH6y47FYd2FWRvOaE5fq0HrExm2jl/kE
 wALkRreu01ASNHIjMKOYum2m9RUyWlefUc0dahAmOjIkk4jwZ+G4jdzrgQImNwUFxNjf
 JIcMMTVc+otE20CRtQIT/tL5iu/7mS9kZtICII6h39VWfJAURJ26KxqdInEfnNbAYaq+
 fVu1qL64ULFEgzzYilFd6ZyBSyeS7K081XY6TxAUXHeHwLzDJHIKiybMef9UDhuL0Bz9
 xAJw==
X-Gm-Message-State: AOAM5321lJ2vHwLKjGeDFVEHw5UcjGMMS2Az69T6hWC6UB06if6mPe/H
 zux0DdQFXfNoUqaJaILKlZylGgBDN/4WF8WS8Fe2gnpA8/srYaZy1Z7xNM2Yc4SUsWkJPQHXnY8
 yEb/jFAItlw4ujnR7xCLZc2YVexk8
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr378203wri.416.1639701508554; 
 Thu, 16 Dec 2021 16:38:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3FL49j/6BhFXA9xM36BJ50ni1jnBa0VBdSkEYAvHATpp+oC/TCM7yUjqhtSUTJHdRddpaeg==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr378198wri.416.1639701508357; 
 Thu, 16 Dec 2021 16:38:28 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 31/37] drm: rcar-du: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:46 +0100
Message-Id: <20211217003752.3946210-32-javierm@redhat.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5a8131ef81d5..982e450233ed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -701,6 +701,9 @@ static struct platform_driver rcar_du_platform_driver = {
 
 static int __init rcar_du_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	rcar_du_of_init(rcar_du_of_table);
 
 	return platform_driver_register(&rcar_du_platform_driver);
-- 
2.33.1

