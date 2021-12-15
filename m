Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D561474FF2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CABD10E196;
	Wed, 15 Dec 2021 01:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9E889E5B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hzb21Riag0BzYvxQqZNndntEVa/HKVhBstIzR442xdc=;
 b=JsfMJ4okomgDk1T1FxMhiER3C1Rlwe8YiOe9ul6ceQcOe2/yBoiLnkrgAFRKl7vTo3aOae
 m2FZw/5vXADo8eLfuxJyJX9n4vm691cT+6xDnK3HjBUaOgJ2/0P1ttKakFeuqkmBfn9Ts4
 rYUALKxtnIOAvg7oNaFliym6W1ASOvQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-47rbkqGmNae-veps9iVGdQ-1; Tue, 14 Dec 2021 20:01:36 -0500
X-MC-Unique: 47rbkqGmNae-veps9iVGdQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 w15-20020adfee4f000000b001a0e51ed4e5so791290wro.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hzb21Riag0BzYvxQqZNndntEVa/HKVhBstIzR442xdc=;
 b=ylTv/km7YGlgro8IFqLEn+rnQsIVGBoj9V3JWBYt1gTsXoFUXk8Wo2DwwruoDPpHH0
 t7hwx1KaAmG6mJlcmYarclLgTkuwzTKmhXet7L+vW1h0gg99tARv2baw85MDvIRvqXKs
 n9tFW6DV9Z0Vz7SSDgOlZLdA+ngZuudGz0h8o+6r8M9Szjwi7Pd5bxeBeBXnZ4KSO5aq
 Q6fUUO/plzoxMdWvMau9OrIZFDrWQF8788MWRUR98qtfRYN0bojCFt4A04c7Dqv68oLa
 UCYQQFZl4aAPRb4XEy1QaZElp3+qQcUu1N2ehNsYoK6zdQFirULhzHBux0ktbn6WuGYY
 uv6w==
X-Gm-Message-State: AOAM531l6XRixEMPLUVRiqZnUUOXsQzC31tDCTqyoYs4l4vOMKq7Xiwt
 wT4fIQzqbly2AK/MxqVN9h+A8m4x5YOj/Mc6pNldJJd+JD7JrlugWFcQq/tY+ijSYWVTFR77Mih
 gMm8XYPKOO9tNsiy6aVuEbWSvohY9
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2232315wrs.108.1639530095064; 
 Tue, 14 Dec 2021 17:01:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv/GbbCBx5XytBBwaLIiM9pzKWYQkrTmgkllinTV4/CSY0c7oGPrWn945cRBUw5QxDc9nqdg==
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr2232311wrs.108.1639530094912; 
 Tue, 14 Dec 2021 17:01:34 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:34 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 52/60] drm/mi0283qt: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 02:00:00 +0100
Message-Id: <20211215010008.2545520-53-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
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

 drivers/gpu/drm/tiny/mi0283qt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 023de49e7a8e..f96fd350d373 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -186,6 +186,9 @@ static int mi0283qt_probe(struct spi_device *spi)
 	u32 rotation = 0;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	dbidev = devm_drm_dev_alloc(dev, &mi0283qt_driver,
 				    struct mipi_dbi_dev, drm);
 	if (IS_ERR(dbidev))
-- 
2.33.1

