Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76718474FF7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3E10E1C7;
	Wed, 15 Dec 2021 01:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7635489D9A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oC0WIoOQuniwzJjXALje/d+9j4IKW4teFV70BFaXDnI=;
 b=e4ereyniVBmfVSCb5U15SWc0OcY54knzpOenLj3XIz/i6r7uhEv+IwocB5YZVqdn5D0u1O
 yZa5/m6bGGkWVmPbxlbJi53/nCRC3lkwkmY0LJyd7Wo8Vwo9WjUF+pXuRfRhn8LudeGTsV
 cl30MNSyGKA0bEey/kxUWKY0P3gk/60=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-80dWO1r_Mtiz6qebYk3yeA-1; Tue, 14 Dec 2021 20:01:31 -0500
X-MC-Unique: 80dWO1r_Mtiz6qebYk3yeA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so13866448wmd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oC0WIoOQuniwzJjXALje/d+9j4IKW4teFV70BFaXDnI=;
 b=21bfrym6gOrZLu3LMSUvzpCei53/BDA/sy1AM7b+KhEcw1ntcwW0FUSmAATPq7KHIS
 y2RuX6pcIVxfy3kupZYqJY7wI0t7kDoiYdrXFZEHjuoxtaiN2pwxN/l1QbgqGokS4asO
 DpkGOEufWOQy5u6Z4cpDPpOjO3lBAteIKtt+tXfwcK/9QTiGHrLalsrwIo/xV3FXKvrS
 Yh6UnLoUdZrab6qBo5qMNPc7p3VDdUp4ehSonUcHiAMu5A+0+zjEqXlH9uD04YBrCwsd
 vtxw+lh0ltRnOQNBlIltnAs5giMqVnhFmW8qdnUMqgyEXKHp/icPH1J05DDSoxT6KSmP
 ht3A==
X-Gm-Message-State: AOAM533pZgCrVyp7RYFA6gkV4zcsZZQM8gXBZBdDWgKmNtVPS+3+Ih6z
 z+a0ebiy/fCIoLBADc6/nf10sub4PL9TXK3TX4VjhC3nd7RjhDISdVXzNGrHhAGJtTHT0liFDJI
 rUILOqeEk5iYjXyjzCDE+LLMLR6ad
X-Received: by 2002:adf:9cc2:: with SMTP id h2mr2116488wre.464.1639530090300; 
 Tue, 14 Dec 2021 17:01:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6DCqgPThKnpIur5x6pebNj3fJU1IgKA5z5+Ijpw8mGj+VILk3gMjJquokMJ4EX/I+MKH3vg==
X-Received: by 2002:adf:9cc2:: with SMTP id h2mr2116484wre.464.1639530090148; 
 Tue, 14 Dec 2021 17:01:30 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 46/60] drm/gm12u320: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:54 +0100
Message-Id: <20211215010008.2545520-47-javierm@redhat.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/tiny/gm12u320.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 6bc0c298739c..b9a5f4969337 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -636,6 +636,9 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	struct drm_device *dev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	/*
 	 * The gm12u320 presents itself to the system as 2 usb mass-storage
 	 * interfaces, we only care about / need the first one.
-- 
2.33.1

