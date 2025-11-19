Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443E2C7180B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F7210E6B1;
	Thu, 20 Nov 2025 00:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="S8pUfbKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7A10E60E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:38:22 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-340ba29d518so4665226a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vjti.ac.in; s=google; t=1763559502; x=1764164302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tBH1paFXTcehxT4QWVpPVMUi1/uSoFqOUzJ/8Lmr994=;
 b=S8pUfbKdAi7GXaSvgg4JDQYL/typK7CRz8DReDIRhwkdk51igi6CsfXigIkrHrdc9C
 dI+V5SxM2DHqDiXRk1D8kVlA5NXbdDZEjRUQpg4FdqSr5AOry+3QmUMLdX4/dzzvXU6W
 AhZ/yPS0UjjUB4bpOyC6hO/7X2GRcM7JiF3XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763559502; x=1764164302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tBH1paFXTcehxT4QWVpPVMUi1/uSoFqOUzJ/8Lmr994=;
 b=m+mnfO3EIyl9B89UEyPykkl3Qczr0aucM0U2/QB3lon1ONUn037OzIBT09RUa47q3d
 K/B25IUzyG4FwKMsXOdE/TYygp/BTU059rLyxd6NimbNwUnOKOfEcx2L2jMQMqjnnApp
 BOSq+4kQmx/C2M91uv/D3K83ndCTKc/xpviCxOQuwtR3Tx5W/r+vcJGgSdY5+iZNwMr5
 P2p73uYPO4I13tpxNFlNZkZ4ilMv+2aVhm2x6vXsqGbFmknEuOGgQ1bWf0VnpnYWRbOh
 Zl5Mi5WOy0qDCE+hm0XCZsG5LSXo51uykjwg/YpYFBcWG2VZ70wEgQJdKJ7LhJ7rh7/B
 eHsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBeTTD3cLZB4aacPcVR1Y+uEp2Qb44tX/WRxHejgCzSh0rrzgNXNlxlWEAIH9fdzVYgbgMrvP+PfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIDfjU9wCzGex6q3vMORy2wQQspnlTuN7SmtZvHFeiY70j7Qy6
 +GW0j3hZRLxQgF0kgR0XUBpcjn1z89BQugrS8hKiaKfI2FMJ9zuEVCjzAHKOtBNWBvY=
X-Gm-Gg: ASbGncuxjKi+AcBm7foZVALoQLYScIZ+bCCKm5wF6NnVWbIBxJCTnfCSkCKSzmY121Z
 XkKxpj7lGcndfif9LHDHtX0Z5nUwq+GvWvfmgEdYB3wVwi1vUa4V1E1Q4ixumkRkNsClCfIFU71
 Yaff/IiGXg00hQk7pEJGYqMVoRE+VwldbjykFJcJLjB1T2BoqDf13OjRfVzKIOfCGwiavl2FlwA
 1u3zt3ZfDKJ6dIZd8SshWriV7fixrQPqWjx1fVae8uVPP77MDjUfCR+A35urwjLtX9cGzTpT1Em
 lUt2tJ1VXn5QF4H0Ke08qdwC7PoIN6CbAZLgD3dIBkjoL6SatIPYRCiyHKBUsvD+hQ9MknqTH2P
 vpuCN5TqqLiAHJjfyWWe7Jb+UzIEQuLsycgM1vK4dEtcopt3s1l4C5A8JPA0qrwgmmKS7uwesKU
 Xo5dV8mC6B5POOD2PmrRwofeB1jr1oLuQoFr1NQJola3syvZBQdxRXytOXdUKWHDHGAMzdh1lP4
 FDL
X-Google-Smtp-Source: AGHT+IHHNBq8xvSVzoTsfO4QPAjwgiIHwukUdPe5JdTymryqzDGKGjkE8HCddxs/abUlkIdhe2q8+Q==
X-Received: by 2002:a17:90b:1a86:b0:343:7714:4cab with SMTP id
 98e67ed59e1d1-343fa52559cmr20451425a91.22.1763559501918; 
 Wed, 19 Nov 2025 05:38:21 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([14.139.108.62])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-345bc24f941sm2856614a91.10.2025.11.19.05.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:38:21 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: Zsolt Kajtar <soci@c64.rulez.org>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>
Cc: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Subject: [PATCH] fbdev: core: Fix vmalloc-out-of-bounds in fb_imageblit
Date: Wed, 19 Nov 2025 19:08:21 +0530
Message-Id: <20251119133821.89998-1-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

syzbot reported a vmalloc-out-of-bounds write in fb_imageblit. The crash
occurs when drawing an image at the very end of the framebuffer memory.

The current bounds check in fb_imageblit limits the drawing height (max_y)
by dividing the screen size by the line length. However, this calculation
only ensures that the start of the last line fits within the buffer. It
fails to account for the width of the image on that final line. If the
image width (multiplied by bpp) exceeds the remaining space on the last
line, the drawing routine writes past the end of the allocated video
memory.

This patch replaces the insufficient check with a more precise one. It
calculates the effective width in bytes of the image (accounting for
clipping against xres_virtual) and ensures that the last byte of the
operation falls within the screen buffer. Specifically, it checks if
'(dy + height - 1) * line_length + effective_width_bytes' exceeds
screen_size. If it does, the drawing height max_y is reduced to
prevent the out-of-bounds access.

Reported-by: syzbot+5a40432dfe8f86ee657a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5a40432dfe8f86ee657a

Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
---
 drivers/video/fbdev/core/fb_imageblit.h | 66 +++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_imageblit.h b/drivers/video/fbdev/core/fb_imageblit.h
index 3b2bb4946505..0c0d05cff3f8 100644
--- a/drivers/video/fbdev/core/fb_imageblit.h
+++ b/drivers/video/fbdev/core/fb_imageblit.h
@@ -485,11 +485,69 @@ static inline void fb_imageblit(struct fb_info *p, const struct fb_image *image)
 	struct fb_address dst = fb_address_init(p);
 	struct fb_reverse reverse = fb_reverse_init(p);
 	const u32 *palette = fb_palette(p);
+	struct fb_image clipped_image;
+	u32 max_x, max_y;
+	unsigned long max_offset_bytes;
+
+	/* Validate basic parameters */
+	if (!image || !p->screen_buffer || !p->screen_size ||
+	    !image->width || !image->height)
+		return;
+
+	/* Calculate maximum addressable coordinates based on virtual resolution and buffer size */
+	max_x = p->var.xres_virtual;
+	max_y = p->var.yres_virtual;
+
+	/* Check against actual buffer size to prevent vmalloc overflow */
+	{
+		unsigned long effective_width_bytes;
+		u32 right_edge = image->dx + image->width;
+
+		if (right_edge < image->dx)
+			right_edge = max_x;
+		else
+			right_edge = min(right_edge, max_x);
+
+		effective_width_bytes = (unsigned long)right_edge * bpp;
+		effective_width_bytes = (effective_width_bytes + 7) / 8;
+
+		if (effective_width_bytes > p->screen_size) {
+			max_y = 0;
+		} else if (p->fix.line_length) {
+			u32 max_lines = (p->screen_size - effective_width_bytes) /
+					p->fix.line_length + 1;
+			if (max_lines < max_y)
+				max_y = max_lines;
+		}
+	}
+
+	/* If image is completely outside bounds, skip it */
+	if (image->dx >= max_x || image->dy >= max_y)
+		return;
+
+	/* Create clipped image - clip to virtual resolution bounds */
+	clipped_image = *image;
+
+	/* Clip width if it extends beyond right edge */
+	if (clipped_image.dx + clipped_image.width > max_x) {
+		if (clipped_image.dx < max_x)
+			clipped_image.width = max_x - clipped_image.dx;
+		else
+			return; /* completely outside */
+	}
+
+	/* Clip height if it extends beyond bottom edge */
+	if (clipped_image.dy + clipped_image.height > max_y) {
+		if (clipped_image.dy < max_y)
+			clipped_image.height = max_y - clipped_image.dy;
+		else
+			return; /* completely outside */
+	}
 
-	fb_address_forward(&dst, image->dy * bits_per_line + image->dx * bpp);
+	fb_address_forward(&dst, clipped_image.dy * bits_per_line + clipped_image.dx * bpp);
 
-	if (image->depth == 1)
-		fb_bitmap_imageblit(image, &dst, bits_per_line, palette, bpp, reverse);
+	if (clipped_image.depth == 1)
+		fb_bitmap_imageblit(&clipped_image, &dst, bits_per_line, palette, bpp, reverse);
 	else
-		fb_color_imageblit(image, &dst, bits_per_line, palette, bpp, reverse);
+		fb_color_imageblit(&clipped_image, &dst, bits_per_line, palette, bpp, reverse);
 }
-- 
2.34.1

