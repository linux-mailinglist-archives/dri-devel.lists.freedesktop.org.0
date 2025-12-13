Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD99CBB08F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B65510E14C;
	Sat, 13 Dec 2025 14:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PsHbz2ow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CBA10E14C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 14:53:07 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-349bb6f9c86so2796160a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 06:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765637587; x=1766242387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dqhPVfC6SZiXAXM+VHctjJfUvTdA8pHgty0TuL9jqcc=;
 b=PsHbz2owF/wMtgH8VGwhtatrPDqCG6VzvBFezOs2W0Wg93tpKEVCBm8Ohmx+PdBwmK
 5xgUoj62YGqA1wChDAKagNgZtDhNWOvFWhnOjKh688v8peoOXS+Yc08/RHqjuaWD6lHd
 ym911/Af7SUVMD71ycX0j34JO1Leyj7CLyceSXGKVgbxZpRS206jmrQCvUKZMtZeTDcS
 j+5hNmU9fV65IZQaDdDqQNnp8LVLGdbwOcg2qRrT2DBJ8aCJMC3mAc1ICXSFCBP2GhlF
 MX2h4tK9KOhrtXqhtt49HrrZASPlhP/WfswJAdcEB6/CXHmz0hBpb4EkNzB2DRUfwxSK
 txJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765637587; x=1766242387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dqhPVfC6SZiXAXM+VHctjJfUvTdA8pHgty0TuL9jqcc=;
 b=KKQoOiYcPi7RD3Zu5HEF5opynrkpWZACAI5ngc4z0EPAICTj40XG7fuEFqNZkgNEWj
 WsWIcm3IvhKQOkv3NIyJwe0qgizTXiLlVKlfSKK2iUFtnlCm3T7mOtgZ/Zs0XyMuezJd
 oe9SrUTk6czlzysWNjX0lWRgZHSvkPWHk2d7eGZxxw8YdK/MBRi3plwT+GBJv3katmQU
 juwJgSopvQR4S+Fdiu8rZo8HVPiE3B8WpdmZitlerjpTQ/BFi//JJrUA3EK1Kd8UT4cd
 QGJs6l2c3erXZP+Ie63Yo28uz15AJ1b90d/SS5Q+LbCOgDMxR9G1XU+406d3S/Lp8hf3
 kF1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdDArhexR87wpLTFqo35sgq8+17t7YdDVB+slJNZZphLJlRX3Otlr9Wgv1+Gt5LfU8BfdYCYFqho8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLJkOFTLDwUhps2PeMogG7v9JdGwgVgRoSbawnlP/2H7+PlNHg
 8sDKdENpEWXqM8DyZmk4gA9XssNTS4SyMtzmbB7r9qZ7KBIOTWXISXuD
X-Gm-Gg: AY/fxX4q8fTUMxqnu0Xv9jh8FbvUIGsFTXHM2CyhEKrV90w8GnI/M48pj8FnUcXrhdH
 uqRYw4i9d+YpXYslan/XeKRMaWElexj7UCnmWzdmP9mLeceCBmbwBUNez8Bw8b3DYNAjUxeqCpJ
 wJJJ+X/dWHJu6ULeYIuSY+ZPxqgQoOvG4QBh6qIKEtJj5ppHasbG/BNZz7SFQcz0FXea+CTEh9G
 mjjsU2fLyBcZ79s2tm2/RtIgH/YSP/5zWe5+HEgqNmUja1ZL6xDeW3Er8FvZYGIlqmB+8I2f2oI
 uF6QuVsf8RRLGsTminxr7KawF3xD4TU0dCrcREfOaF0GFqj7x9SJM+9Isos50Vc0CFontXYNPY4
 flsmU8VOiaIAkC4bo2ZTopsTSzYXuOYaqARczBJLVv5l+ZtIhOxX1DJlsDuPKUeJa/8Iah1ljVi
 hf0StOLGO2VlTs6uxJJDA=
X-Google-Smtp-Source: AGHT+IHs94AtaIdi/LK1f1GL3oQjfIDINw0e2ryNLZ6e/m2MH5qRKb0B7VnFS+f9bCSyi3GmlCJ2Sg==
X-Received: by 2002:a17:90b:2e0c:b0:340:ff89:8b62 with SMTP id
 98e67ed59e1d1-34abd78fbedmr4750217a91.21.1765637586883; 
 Sat, 13 Dec 2025 06:53:06 -0800 (PST)
Received: from LilGuy ([2409:40c2:105b:dc88:1107:395c:23c0:2b1b])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-c0c2c48bf7asm8146647a12.32.2025.12.13.06.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Dec 2025 06:53:06 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Zi Yan <ziy@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>, Yann Dirson <ydirson@free.fr>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Kees Cook <kees@kernel.org>,
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH v2] fbdev: arkfb: Request legacy VGA I/O region
Date: Sat, 13 Dec 2025 20:22:34 +0000
Message-ID: <20251213202239.8772-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The arkfb driver uses the legacy VGA I/O range (0x3c0+) but does not
request it. This can cause conflicts with other drivers that try to
reserve these ports.

Fix this by using devm_request_region() during the probe function.
This ensures the region is properly reserved and automatically released
on driver detach.

v1: https://lore.kernel.org/lkml/20251213154937.104301-1-swarajgaikwad1925@gmail.com/
Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
v2:
 - Use resource_size(&vga_res) instead of hardcoded 64 * 1024.
 - (Feedback from Kees Cook)

Compile-tested only on x86_64.

 drivers/video/fbdev/arkfb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index ec084323115f..24e4c20d1a32 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1018,6 +1018,12 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)

 	pcibios_bus_to_resource(dev->bus, &vga_res, &bus_reg);

+	if (!devm_request_region(&dev->dev, vga_res.start, resource_size(&vga_res), "arkfb-vga")) {
+		dev_err(info->device, "cannot reserve legacy VGA ports\n");
+		rc = -EBUSY;
+		goto err_find_mode;
+	}
+
 	par->state.vgabase = (void __iomem *) (unsigned long) vga_res.start;

 	/* FIXME get memsize */

base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
--
2.52.0

