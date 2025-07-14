Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF39B03C20
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A767710E44D;
	Mon, 14 Jul 2025 10:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g58vlZa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC610E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752489886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+dRbh0w0ssR7z7SffOey6CZ9oYNydtq8EHITGU1RKY=;
 b=g58vlZa3JG1zt0dK0jCt4LRaT8fYfYF/zSM+1wC5TqQubAYmpyVe730N1j/2Fj2g7Do6Cr
 oJXpK8Z66P8JyXjARiu0XMKMMuywyx5ILYwY1y7q2eEuFhnhO38ZpAopsClmXNOOYngqqT
 LPg+BRoJdDIv6/uqdVmVUlrwhRl9W5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-PrCLpBdAPoSxJX2xywaXvg-1; Mon, 14 Jul 2025 06:44:44 -0400
X-MC-Unique: PrCLpBdAPoSxJX2xywaXvg-1
X-Mimecast-MFC-AGG-ID: PrCLpBdAPoSxJX2xywaXvg_1752489883
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso32059095e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489883; x=1753094683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+dRbh0w0ssR7z7SffOey6CZ9oYNydtq8EHITGU1RKY=;
 b=dBaj3yf3eIoNscYam813kfvI8cNk6T9SxPmxdlQS+MfmASb5dk2WbHLK21YGf7qn6E
 t+dCmntZSZDXzori0GhxDwqyv02bdQTyC3LqJ4oBRHsj2Tw1+7/veyWqbuWj83cIKR4o
 H1KYd30IJeRWY7B9b2mm3oGsxWDwADPF5FCtBGaHtR9diLNCmtB89ts1+f6G11wHSJm8
 UiGy4dqidiM5ysV7z7Bx5RZK/EGFZplhGR5cKgy338epqgWACqI/XQpdqJ/KkvhHi2Da
 SaUhfQXZIer71JAxSlnVQKH+A872245QAUI/JuMdh++mqLiGEvR51qpDgD4EQSsMGAS6
 g2ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXqmaOUO1GxmSGG6g6hIf8TZPL4ZlXF63Y5BSGmGMxcfqNkNMftwBUfqi9dIpKzI5KYq0DewCT1XA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxErNejMf5LmLwBgRL9wdeuCyePSkDf3YTdAainFdlhVY5ekyHL
 QF+PyF78hjUQs8q8V3gRjys8L0QZh+nennjORIZePB3KjUHsCZgsZhgrMz+73O7AvkrKiEEGapp
 8ehEYYuA8Sz80q9pjvS4YR0IDkURbBrINjg2rIAzF5x850SzSVY8flHV+ZR2NKyn1FqLp7Q==
X-Gm-Gg: ASbGncvJOtz03vMLZO60mnlm8UjXw4EqqJss6uph8E9i2mMHyBwk9Mgm1V+8fYTEkMD
 SiIXgnEbzUh+vmCHjy986as4Qp+U3Yk0LtdcqcWCGFF5pbULMfCXh7Aa0QhSasGzFxP/m3pR14g
 A14uahbFVqBVSQhe0CNny8N8OqS6XF3OvY/iUUc0w4BqiJwlvGYmRpWMgcXdPizswmJp42U7l6c
 RoU3B4l07xL2Gvngy8X1+oExVS8hP30hymqIV8SvnBZ1ywaBGUBmTdg3UgkFkWnu8zLUmiB59Qg
 szga6tLh4gWFMS8xDXTn8MpVNsQFJbPh
X-Received: by 2002:a05:600c:3155:b0:454:ab87:a0a0 with SMTP id
 5b1f17b1804b1-454f4257f20mr127692445e9.17.1752489883484; 
 Mon, 14 Jul 2025 03:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv7Rff2pEBanvuCvIAGuf8+StdSH/j+ARZxyQfPyHplKgidfrfHXUUtXua8aJ+zq7YriSdEg==
X-Received: by 2002:a05:600c:3155:b0:454:ab87:a0a0 with SMTP id
 5b1f17b1804b1-454f4257f20mr127692145e9.17.1752489883089; 
 Mon, 14 Jul 2025 03:44:43 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560d019f1esm64813235e9.10.2025.07.14.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/sitronix/st7571-i2c: Add an indirection level to
 parse DT
Date: Mon, 14 Jul 2025 12:44:02 +0200
Message-ID: <20250714104421.323753-4-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714104421.323753-1-javierm@redhat.com>
References: <20250714104421.323753-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VjTAnfQQKPhzXxdLjnaV80IgQxbvW0IuOpT_FOlKs7Y_1752489883
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

Other Sitronix display controllers might need a different parsing DT
logic, so lets add a .parse_dt callback to struct st7571_panel_data.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index fd9d6c701cc4..f9c4fedb3cca 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -92,6 +92,7 @@ struct st7571_panel_constraints {
 
 struct st7571_panel_data {
 	int (*init)(struct st7571_device *st7571);
+	int (*parse_dt)(struct st7571_device *st7571);
 	struct st7571_panel_constraints constraints;
 };
 
@@ -881,7 +882,7 @@ static int st7571_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, st7571);
 	st7571->pdata = device_get_match_data(&client->dev);
 
-	ret = st7571_parse_dt(st7571);
+	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
 		return ret;
 
@@ -964,6 +965,7 @@ static void st7571_remove(struct i2c_client *client)
 
 struct st7571_panel_data st7571_config = {
 	.init = st7571_lcd_init,
+	.parse_dt = st7571_parse_dt,
 	.constraints = {
 		.min_nlines = 1,
 		.max_nlines = 128,
-- 
2.49.0

