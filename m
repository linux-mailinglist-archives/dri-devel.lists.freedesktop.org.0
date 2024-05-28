Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7018D1E8F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC79410E367;
	Tue, 28 May 2024 14:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="dtbwkcaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6F310E543
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:11:29 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5b53bb4bebaso478285eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1716901889; x=1717506689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3s6GbriJe4uoFE0TWx2Ndn0X5d4SdfShmgpv08wHJ4g=;
 b=dtbwkcaU+ceAVwLZGfWX8a0Le7jcETrj9/rqX0oQjt5g7SD+pVwMiKL7X7bNzGrIEm
 LYxPlbEKHACA9UBuv3qi5KQedkFCzw7bZbCbisEmDkdeBUXGnqrs6JchfRzJfvwrzWAn
 mfMfzy8lYXDoszgDzL+hUdGRQjGtZ+bHfYF+bhzKaKt2R62i7zp0aZWcgxFFy0f5Vwle
 ez2TsVR35Ndjy0FEszrJBbAWO9SkbwcTZwYq5V7dPhkkfmq2HO06Fh0iOd+ksQ5o6ZHZ
 AlDqOvI9nVMghfKxRQkfRzAKIOiMQeMRLZEjvCngcys6AzRlHLWfTSH96fCkjuhww3o3
 JEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716901889; x=1717506689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3s6GbriJe4uoFE0TWx2Ndn0X5d4SdfShmgpv08wHJ4g=;
 b=CrBZRVv6ZpxlT7XRUxb7saJW3mcRER8iUPuT4JV0iDUQBVIBdtZIB9Pl1t45661aDR
 e5SW2gdHB1/zbRBRuAf+tPi5VzMEYyemO+RLyyDiPzZe+jALw2TsqLcQcJloqmVc/KLV
 RGmyVx7IjMZ1ZPo/LNtKXAWP/MWl6n6rpuD2irga8FJ+7SFQ84KRHtkCdACnyW/1VbjW
 I6Gca06sK3eC5Y8OoQ1mha6hAYS/eF0fO6a3sDHlBtPRHe/vE3SRQrQt/7mzRiO8jj2b
 LfyictrAvYqgIZJIeyw35Zi8WAfVZWJX13Jn+KI718W+KLS0mCKbs3Cqb6kbp7ueIQx3
 R0bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkzDVqO0y4Xgk98T1Kn6/8xwqbxwgWE0ZHYQWB7Kt5LxVD6MQws9zUhc4TZrRcK/XaAc9a2RIvtelCtNHRuaKsakp76TMYqvAxsV7JnOAu
X-Gm-Message-State: AOJu0YxJbXoIGvnUZGJI1rUsM8yRkJzZzSJsrDwAUtCmjD9OGWgxZGqY
 +BOs7W4Rbn9CNO0ek+sXSNSim3y2mGpn/ay0osYzX1TolFEIA3w0TbIUdwjU7zk=
X-Google-Smtp-Source: AGHT+IFE+2igWHzhVm/U7Cf0vBx506yPhmuJ5T8bh6zOvU5C1DW/d69hF8tXceHaMes1SQX6MeWwew==
X-Received: by 2002:a05:6358:d091:b0:18e:b11b:e770 with SMTP id
 e5c5f4694b2df-197e4840c06mr1417043755d.0.1716901888794; 
 Tue, 28 May 2024 06:11:28 -0700 (PDT)
Received: from ccsl-Inspiron-7472.semfio.usp.br ([143.107.45.1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-682226fc4dcsm7507164a12.42.2024.05.28.06.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:11:28 -0700 (PDT)
From: Bruno Rocha Levi <brunolevilevi@usp.br>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: Bruno Rocha Levi <brunolevilevi@gmail.com>,
 Lucas Antonio <lucasantonio.santos@usp.br>,
 Bruno Rocha Levi <brunolevilevi@usp.br>, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/vkms: Fix misalignment in comment block
Date: Tue, 28 May 2024 10:08:03 -0300
Message-ID: <20240528131026.214773-2-brunolevilevi@usp.br>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528131026.214773-1-brunolevilevi@usp.br>
References: <20240528131026.214773-1-brunolevilevi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 May 2024 14:24:34 +0000
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

From: Bruno Rocha Levi <brunolevilevi@gmail.com>

This change fixes a warning from checkpatch, it improves readability of a
comment that was previously misaligned, by ensuring the trailing */ is on
the same line as the opening /*.

Co-developed-by: Lucas Antonio <lucasantonio.santos@usp.br>
Signed-off-by: Lucas Antonio <lucasantonio.santos@usp.br>
Signed-off-by: Bruno Rocha Levi <brunolevilevi@usp.br>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e..e8612759a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -166,7 +166,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.cursor_height = 512;
 	/* FIXME: There's a confusion between bpp and depth between this and
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",
-	 * which ix XRGB8888 in all cases. */
+	 * which ix XRGB8888 in all cases.
+	 */
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-- 
2.45.1

