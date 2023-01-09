Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3B6633F8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 23:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95D10E0A4;
	Mon,  9 Jan 2023 22:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972410E0A4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 22:31:35 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fy8so23862997ejc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 14:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OZe8VJu/fGCCz+Eb3NiW7mLJBs19t4YWlgg0ulzutFw=;
 b=GSLrukwN25auhR2Y9tG2IvbfkBqYNzBDfNQWqdjB7K51f6ZiksEJtgxejWerw/vsf2
 HNWduMWWXpqKrNtgR6PFRro4ZZuKOB98gyrC/XFdBUmrPVrcv2jCc5s8rehfL+LPZnU8
 MhNevobZTxfeKXIkbrB9LqAJhC1d31Q9hYmQa0UajkdpAndEzKp9/kk+VJPF37zNwxK9
 7CIpcKX9PdMjk/cq6i4TfyNgl+KglhAwRLcAZ5vKtBOfHjgaes3vVDty0R4aPtkYxq41
 5ccz1Ju28ipPWVxiOHMN+CyD54l+blvQ2kfCJ0seUSKRkZAfOP58voelxFXZBm6Oy9XM
 jb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OZe8VJu/fGCCz+Eb3NiW7mLJBs19t4YWlgg0ulzutFw=;
 b=0gQQs5UO4YOLyP0NlkMnIqLsY+95gmfAYd47EtAd3UR0dPkVNXGr0ccfgIZHpjrkk8
 MK8hWJfzJHvUcISS12G/PgDmWpe3qejPP6P2H/WIyxQxF1DgB8Ou1JN3DSENT3aKjaU2
 XwAR9OLfovU9UUnjIOre/ODF9kzDElbCe/bPJ3MsBrcyLHpek47swh3x//i/OLTAWgUV
 CC7DUE13xES1Gs8mmsCNK6hkLZimxqRJz4kAA+ru8xOrUiFddOElKWz0rSD1AGQRrYRO
 DY5i4GTF5sYeULWqq2hebzqnPDdHJx5w+NgYQxU8ON+4wnydowo9mDYpFVux0bijX2iV
 nS7A==
X-Gm-Message-State: AFqh2kqqS7HJt7VFDoYd5rrf8kd/ZvcITzjAtj9fchvR9NFzI/6uZ0hG
 8vr6JvIt5QeJZXhdEPhtEe62jyd0XDo=
X-Google-Smtp-Source: AMrXdXvpiCc8i3vWtwCmmEDeA46pFWN6Dz27By5UAtP+wRO7CW2CRYa8a71xhMAms7AZC6iBTAbe0Q==
X-Received: by 2002:a17:906:b043:b0:7c0:d23c:ead3 with SMTP id
 bj3-20020a170906b04300b007c0d23cead3mr58284154ejb.27.1673303493935; 
 Mon, 09 Jan 2023 14:31:33 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-bcd2-ed00-0000-0000-0000-0e63.c23.pool.telefonica.de.
 [2a01:c23:bcd2:ed00::e63]) by smtp.googlemail.com with ESMTPSA id
 k8-20020a17090632c800b00780982d77d1sm4228235ejk.154.2023.01.09.14.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:31:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 RFC] video/hdmi: Fix HDMI_VENDOR_INFOFRAME_SIZE
Date: Mon,  9 Jan 2023 23:31:10 +0100
Message-Id: <20230109223110.1165433-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bernard Zhao <bernard@vivo.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When support for the HDMI vendor infoframe was introduced back with
commit 7d27becb3532 ("video/hdmi: Introduce helpers for the HDMI vendor
specific infoframe") it's payload size was either 5 or 6 bytes,
depending on:
  if (frame->s3d_struct >= HDMI_3D_STRUCTURE_SIDE_BY_SIDE_HALF)
When true the size was 6 bytes, otherwise 5 bytes.

Drivers that are using hdmi_infoframe_pack() are reserving 10 bytes (4
bytes for the header and up to 6 bytes for the infoframe payload data)
or more (exynos_hdmi reserves 25 bytes).

Over time the frame payload length was reduced to 4 bytes. This however
does not match the code from hdmi_hdmi_infoframe_pack() where ptr[8] and
ptr[9] are written, which means the infoframe has to allow up to 6 bytes
of payload data (considering that the header takes 4 bytes).

Change HDMI_VENDOR_INFOFRAME_SIZE to 6 bytes so
hdmi_vendor_infoframe_pack_only() can properly check the passed buffer
size and avoid an out of bounds write to ptr[8] or ptr[9].

Fixes: c5e69ab35c0d ("video/hdmi: Constify infoframe passed to the pack functions")
Fixes: d43be2554b58 ("drivers: video: hdmi: cleanup coding style in video a bit")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I'm not an expert on this topic and I'm not sure if the size still
depends on that if condition from long time ago. So please share your
thoughts.


 include/linux/hdmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
index 2f4dcc8d060e..026c5ef5a1a5 100644
--- a/include/linux/hdmi.h
+++ b/include/linux/hdmi.h
@@ -57,7 +57,7 @@ enum hdmi_infoframe_type {
 #define HDMI_SPD_INFOFRAME_SIZE    25
 #define HDMI_AUDIO_INFOFRAME_SIZE  10
 #define HDMI_DRM_INFOFRAME_SIZE    26
-#define HDMI_VENDOR_INFOFRAME_SIZE  4
+#define HDMI_VENDOR_INFOFRAME_SIZE  6
 
 #define HDMI_INFOFRAME_SIZE(type)	\
 	(HDMI_INFOFRAME_HEADER_SIZE + HDMI_ ## type ## _INFOFRAME_SIZE)
-- 
2.39.0

