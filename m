Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DDB09C53
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737C510E8DF;
	Fri, 18 Jul 2025 07:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WgGSqLdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4971510E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752823548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kFXoy9kzFlqwCymBjKPHfJn9o0uwlDNldK3hIukHAHY=;
 b=WgGSqLdY/mH7pdcFz/ZrcQqOwettpYZ7pmK6CH5UbjEXE/nlVHSN5ZBzjen/NgpZVSGhS4
 H+NqQ1kQgypgXo6stuqixSD0n9BioNzWmD9tdaJT3pHqJ4JFbSKa6Wv4hxu3D2QAZvnbnt
 CfoBu5D6kcXeHCg+Ylvyz0eA4xM7QMg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-Z0-nQi0bPzKyanuGVdwzng-1; Fri, 18 Jul 2025 03:25:45 -0400
X-MC-Unique: Z0-nQi0bPzKyanuGVdwzng-1
X-Mimecast-MFC-AGG-ID: Z0-nQi0bPzKyanuGVdwzng_1752823544
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45626532e27so11314615e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 00:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752823544; x=1753428344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFXoy9kzFlqwCymBjKPHfJn9o0uwlDNldK3hIukHAHY=;
 b=S3ktDaGljxouOoQM2bEnVcp8kI99+aE1JSnwcun309ABOosIYjsi11ifa7upev9GP+
 mfN+jXwBMo3Mw2FS4fCAU7HwYSeoeNyrRJbD3Zl8zpu+KSUXMnf5zxjbPYShoR7UkuaE
 Zk8XUm2Kqm/mpJ0UDF73xwx4XhGtv6yFhj1bcGUKWmfPfiFkGErrZKLYme7RQfUDhOq+
 qUpd2U6f08csIzLaQBSwQoF7H/OuJNmXGWXSGn5OPFFtx4wlFCsSdwsvRtuz9a6l53wU
 juGvV2PJIXDa82MSMaQfB81TCxiPwG5MrXeMQ+ZvZ5trXdAQeIpyAiuHwtsYcc2YAx9b
 HEiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLEQbSbuhZBhdOj7GHHIV4kdEFqOxJ2fw+LFNkxJUoWpQEspETK5WfaxhMW3WhImL2JfQrWHvYKYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyabeWpdB0CMKBFwC9iAQMufQXTI9Vidn/CNMh1nTkjHl2KZgf8
 /s/mez5bg1Yp4TgxV1IIvEHWYVS8I9Lxa7g/Qt9voj6LteoOuoeFlykME9sazJE1PJy4AgVNguT
 kMyy7GNkG2Fm2AeH9IeAuPMZMbDeFA7LQ7spo4WNUy4vtkDaW91r1WBiIAs6NGxF/tEvQog==
X-Gm-Gg: ASbGncv6lUGjja6wYe0h8k5r4zS2y7z67e1OL+3UAJmpDqhSH+8y4hU/exB+q8NIC89
 HnDYor/nLbtNTthg7RuNjxFCGjkT6bc3G2Iknzf7UIy+In4N/L3TRPCWq2y8yVV0OX8W5wgtZUQ
 96h6raxbCn840pyAgjw/CtIiLHrXPOmjuj2/O+cMqO629GO/y31H8dSpB0m6Ldl7zA0pvaDMOb5
 4ZpM5nxmh+5mm0EegSREeE7oNyq7I+Z0JQgH8CmwENZTVlaDmfYmQ72NOuF1PCGmxzkkKdDZ7td
 9f8/bV1s98LXU3W8iltzq2TTSChR/d72
X-Received: by 2002:a05:600c:8209:b0:456:eb9:5236 with SMTP id
 5b1f17b1804b1-4563253d35emr77988945e9.15.1752823543583; 
 Fri, 18 Jul 2025 00:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsmSHWnpWSP474DVny4lRudPIL5Icor8N8CONMsUxyvG0gl5+BmAJlggp4ddRUlauz3pM0kA==
X-Received: by 2002:a05:600c:8209:b0:456:eb9:5236 with SMTP id
 5b1f17b1804b1-4563253d35emr77988655e9.15.1752823543133; 
 Fri, 18 Jul 2025 00:25:43 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b740c51sm11782085e9.19.2025.07.18.00.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 00:25:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 kernel test robot <lkp@intel.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sitronix/st7571-i2c: Make st7571_panel_data to be static
 variables
Date: Fri, 18 Jul 2025 09:25:28 +0200
Message-ID: <20250718072541.686759-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7qr8E5jmDeNxEi9-dPyVPAjeugg5oRO7Y_LONqHmRnQ_1752823544
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel test robot reported that sparse gives the following warnings:

make C=2 M=drivers/gpu/drm/sitronix/
  CC [M]  st7571-i2c.o
  CHECK   st7571-i2c.c
st7571-i2c.c:1027:26: warning: symbol 'st7567_config' was not declared. Should it be static?
st7571-i2c.c:1039:26: warning: symbol 'st7571_config' was not declared. Should it be static?
  MODPOST Module.symvers
  LD [M]  st7571-i2c.ko

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507180503.nfyD9uRv-lkp@intel.com
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 453eb7e045e5..7fe5b69e6f2f 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -1024,7 +1024,7 @@ static void st7571_remove(struct i2c_client *client)
 	drm_dev_unplug(&st7571->dev);
 }
 
-struct st7571_panel_data st7567_config = {
+static struct st7571_panel_data st7567_config = {
 	.init = st7567_lcd_init,
 	.parse_dt = st7567_parse_dt,
 	.constraints = {
@@ -1036,7 +1036,7 @@ struct st7571_panel_data st7567_config = {
 	},
 };
 
-struct st7571_panel_data st7571_config = {
+static struct st7571_panel_data st7571_config = {
 	.init = st7571_lcd_init,
 	.parse_dt = st7571_parse_dt,
 	.constraints = {
-- 
2.49.0

base-commit: a55863ba4c9ea9febe81ecf7dba36e7989a37b7e
branch: drm-misc-next

