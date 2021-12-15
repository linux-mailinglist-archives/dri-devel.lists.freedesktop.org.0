Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F7474FCE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7B410E16B;
	Wed, 15 Dec 2021 01:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D738E10E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4sk0aOGoZo6DhLKUJGsiUdEPfqgud6UXrgjI7DBDO0=;
 b=a0Tp/kwo2b8AvpCKn0DhbRf0LXtE6W5v9NPPIYmUQEUe/mh7gMaVnNm4M7vHFtcaPLvIcn
 c5mVemYWuH8JjZutkM0zZKhF8t90EUkD3VQeOAy/t/vOIBmDiL1wwSIohYXNqJMr2+7a8k
 FscJTRnYtgA9uwqrUXtUeF6xrGVVKzc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ClZLJRv-PsSl4ItNafJClQ-1; Tue, 14 Dec 2021 20:01:03 -0500
X-MC-Unique: ClZLJRv-PsSl4ItNafJClQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so13883546wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4sk0aOGoZo6DhLKUJGsiUdEPfqgud6UXrgjI7DBDO0=;
 b=58Lhr5f+pzb93R4gmk74KtPzhoUYvBS9BQCHV27PdbQlvOMeOxqTcmDHJ7sVvmtZo5
 8RlCtnTHOs6f2wV16u76jnCCqNhFjgSY4Tj2m4f0bIL2bFymWHBGS1L7kg0gi8L7TSRB
 PHH5Wq+QqNZEaDgzFyEpjKkIlMXLozqyhTkx5WT37I9chvHAKWHAmnkkxj89owK6bVI6
 wT8ZLhGlf74ww0EtyY9I29RLMfzratVE08ROfjqrja6+k7kVdTMCXwc5q4mrj0Y/prdx
 HanbuUDgrl0krIA4y4qmrtl0wbd3YRIRVCd7leQDqLSEE82Ga6J4pogVGopfGS498Szp
 XpEw==
X-Gm-Message-State: AOAM530EBjpNbIgjRNEoKzmdDljIzFnUX6wpu99OoaDuWibiHX6+ENrC
 PgupgqWo1mvuupBHq57m5pKZIqjpps5XsXOQygSmXrwbRTUtqu9GLh9p6QQF0K7mmK7y+itxzjj
 ZGgSsuePA18H7G8lZnPfsa9M/Cw1Q
X-Received: by 2002:adf:d18f:: with SMTP id v15mr2109905wrc.447.1639530062829; 
 Tue, 14 Dec 2021 17:01:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzILyKS6xkmD+jqzqVV4KBj0XycKfBbUVs/Yu6SqmEzKz2P1vRUfBpoPKqcsiT6hf6Y5qmI9Q==
X-Received: by 2002:adf:d18f:: with SMTP id v15mr2109899wrc.447.1639530062649; 
 Tue, 14 Dec 2021 17:01:02 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/60] drm/i810: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:23 +0100
Message-Id: <20211215010008.2545520-16-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/i810/i810_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i810_drv.c
index 0e53a066d4db..7ce268b54a18 100644
--- a/drivers/gpu/drm/i810/i810_drv.c
+++ b/drivers/gpu/drm/i810/i810_drv.c
@@ -80,6 +80,9 @@ static struct pci_driver i810_pci_driver = {
 
 static int __init i810_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (num_possible_cpus() > 1) {
 		pr_err("drm/i810 does not support SMP\n");
 		return -EINVAL;
-- 
2.33.1

