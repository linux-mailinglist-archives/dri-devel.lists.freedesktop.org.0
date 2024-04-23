Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2D8ADE6C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 09:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3108A1131BA;
	Tue, 23 Apr 2024 07:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eL/qvUPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65F10FA71
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 01:20:27 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-78f02c96c52so354018085a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713835226; x=1714440026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/X3oWVdwceQfK7JUbUass9+jsVy5WEkRvYuO9s5FjoI=;
 b=eL/qvUPkKP+9EfeuoO5fcWW/PldvTNqxVSm7cnr0XbwFbD7UT9vYrmant9kZcMZHps
 KqfDW4xzuzgHjuJgJgMpbUppcbDVCI8ND0WUYrAL0ypGW0mv3kCye70WQFokAi3uWQyx
 HbGaEw837wYGBwJa0NFwxTU4eBPmrN4cbdwyUaj+YOoReTj1+4b74pPZDSlxVb5Z7/vg
 1A5i8A83VBa2QFKV4/kysHQUzG0N47eGgkQajOSHzKIlp1RUuo8BuZMgYfF9iQ4w6mHD
 /Tj2i04hGbGfdHYCSHyPdd1Trmg1QRcwfrsWsy5k6HY6BbjysnAXnEbspohF/CJr4eKS
 EByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713835226; x=1714440026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/X3oWVdwceQfK7JUbUass9+jsVy5WEkRvYuO9s5FjoI=;
 b=sNWoCuhwBFUAgRuszOcCBr7eU+y+Y9NUNsyuOe7qDu8Z0rXfgWLqKvTtJormlutE7B
 5ZJIguZ3lRTqYtoJaCGGTbfjR+LWlqToJRA3dJ8ZPdRCAIXoxN//U7T1IjpyyumwP5RW
 t/s6U4I2rTnoTBCEf74cuS3ts+8Ape9H6hBb5Rmn24pLA0DnhUHPDR9j+koBQ80OhmTk
 yAnaIrLkZ1Z7npL5pfj7J22tid6NZKoEhqCsbDrT4RtwX6Wq+jxBqUmb2/zIH8vnG42y
 b2QjRxmP9yaMDBOqaJ7HOmrmJ+ScWzVRo23xzB+9hn1Z2hW/GX9JV2lEMFDKovVN6Xlr
 JLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNAb8qxAAbr7t4UGrFqEaeKUzMFIQMUrqMUpK4jDcif47l4QpXVtbDOaTFP4bdbwKQ0jRtmWzz7Bw4yjVfXQaz9Ti87AiFdnnKiUMA6Phk
X-Gm-Message-State: AOJu0Yw2T7FIzq5OeV8ycCRuenWblmSO6mD4NvJQ0cLWM7PXZyn5Oe2J
 trrdgPwOPsVQKPhaxNh/12Ia+SNizCGMMjit3/58liKuA0+iIqVi
X-Google-Smtp-Source: AGHT+IHNrFNlRd8vHin4jO4b0/uHrTcFQKkQwjaNMI1A7Rs0w4RKZLqx3b3gXukSPNY57d4AO6waKw==
X-Received: by 2002:ad4:57d3:0:b0:69b:63d2:6bc3 with SMTP id
 y19-20020ad457d3000000b0069b63d26bc3mr10704024qvx.5.1713835225910; 
 Mon, 22 Apr 2024 18:20:25 -0700 (PDT)
Received: from sheunl-pc.ht.home ([2607:9880:4327:ffae:7c2b:7751:30a3:52c9])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a0cf54b000000b0069b58f8c33dsm4813265qvm.45.2024.04.22.18.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 18:20:25 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
To: deller@gmx.de, sam@ravnborg.org, tzimmermann@suse.de,
 christophe.jaillet@wanadoo.fr, u.kleine-koenig@pengutronix.de,
 julia.lawall@inria.fr
Cc: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com
Subject: [PATCH] video: fbdev: replacing of_node_put with __free(device_node)
Date: Mon, 22 Apr 2024 21:20:21 -0400
Message-Id: <20240423012021.56470-1-abdulrasaqolawani@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Apr 2024 07:40:38 +0000
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

Replaced instance of of_node_put with __free(device_node)
to simplify code and protect against any memory leaks
due to future changes in the control flow.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
 drivers/video/fbdev/offb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index b421b46d88ef..ea38a260774b 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -357,7 +357,7 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 			par->cmap_type = cmap_gxt2000;
 	} else if (of_node_name_prefix(dp, "vga,Display-")) {
 		/* Look for AVIVO initialized by SLOF */
-		struct device_node *pciparent = of_get_parent(dp);
+		struct device_node *pciparent __free(device_node) = of_get_parent(dp);
 		const u32 *vid, *did;
 		vid = of_get_property(pciparent, "vendor-id", NULL);
 		did = of_get_property(pciparent, "device-id", NULL);
@@ -369,7 +369,6 @@ static void offb_init_palette_hacks(struct fb_info *info, struct device_node *dp
 			if (par->cmap_adr)
 				par->cmap_type = cmap_avivo;
 		}
-		of_node_put(pciparent);
 	} else if (dp && of_device_is_compatible(dp, "qemu,std-vga")) {
 #ifdef __BIG_ENDIAN
 		const __be32 io_of_addr[3] = { 0x01000000, 0x0, 0x0 };
-- 
2.34.1

