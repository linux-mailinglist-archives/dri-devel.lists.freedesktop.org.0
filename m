Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922D474FD0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A5110E178;
	Wed, 15 Dec 2021 01:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83ED10E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cH57dCYc7qQEnW1RZcjru/jBz/1ABWEV4ceGTOsTwqE=;
 b=HIUkFKnw3llgq9ocskWIQI1Q+eHM4lE3y1YBzpVY9xEzL7PiopujOZm6eFi/1/JN4pNJPz
 OogopVf2CLTbtl/+cFB/j1xcOIsxxqw9NGA5jYJ5AthUG7x/MOcuVzdV3B3VwVJl36GbT+
 qlmCbKtXkyeX44Zlz9uUOnAix14TncA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-9ZKuOv2OOFqOKz5zEb4qEQ-1; Tue, 14 Dec 2021 20:01:11 -0500
X-MC-Unique: 9ZKuOv2OOFqOKz5zEb4qEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso13891837wmj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cH57dCYc7qQEnW1RZcjru/jBz/1ABWEV4ceGTOsTwqE=;
 b=WXpQsC9jFfmoCS2sfln+IWnr5N6fon8+HUJCeSiyVC2NVqsi/0juvJ3UOv20F0aIQ+
 cejZMBTKjoSV5od/ZqVsbD46b+FAbe5NxK5EdQAKTXVp07BJ7ENMHUQu7nNRPEvih7it
 aNW5Bgv1/4G25DNAdSzURCmPm2bPtEb4yKsx+GZhbeSmOY4IvXSgCB17scHavRSg6/od
 3I5vEtb9TlxjvcFBUkBKCi/EfFnFgnkhJQVEmiQGedfu2FEozM4XNny66nvP30FnNcLP
 Yb4TE6DqqcPbjS2ElosJAkADw8NYvMlI0YpEGS15XprndkHABb71LbF61tzWUtj68p00
 3Tjg==
X-Gm-Message-State: AOAM531XEBrf8pnigv4fcvqawiu9InMxSK+gCE6Anf36IvvIpc3yJIvH
 O7I0hcvOhpTDYX/FJUP7N4D8OWulgHbWbferCgtIKM4DRPSvAUui8h8PAgBB7zbcHkVj3tW9eD+
 /f71E87BH/Wn9k0txkrs+e6eQ6uCt
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2129672wrt.594.1639530070108; 
 Tue, 14 Dec 2021 17:01:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzblwOb0jm3iBz8Eq90b8slpp6L3JOM2UhdyTKTr+bC0gBD3KlyxYsVH2bV1jQdyWO4JjPNqg==
X-Received: by 2002:a5d:5008:: with SMTP id e8mr2129662wrt.594.1639530069890; 
 Tue, 14 Dec 2021 17:01:09 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:09 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/60] drm/meson: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:31 +0100
Message-Id: <20211215010008.2545520-24-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
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
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/meson/meson_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 80f1d439841a..719724ad3c5b 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -456,6 +456,9 @@ static int meson_drv_probe(struct platform_device *pdev)
 	struct device_node *ep, *remote;
 	int count = 0;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	for_each_endpoint_of_node(np, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
 		if (!remote || !of_device_is_available(remote)) {
-- 
2.33.1

