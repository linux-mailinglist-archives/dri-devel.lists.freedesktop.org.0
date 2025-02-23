Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86296A40FD9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 17:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACCF10E055;
	Sun, 23 Feb 2025 16:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XL2xbm+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1610E055
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 16:43:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fc042c9290so5702427a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 08:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740329025; x=1740933825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=XL2xbm+VDwc+B4ldZadJzzeshIWG71YfoYWUJ6/9BKV3uLCgtMhWjIj3xmeDJHYXVs
 EvwOwbA1V01lBtOKb4IEvuX15Q4EYXpm6pca7yxHIuq2zgHhtRXkeAjwv3Kpyg5cQOY/
 mE0+Dp72ttO2r8PnMtC+MKmpjqOR8eBaQ2fpvP8d7gmNJK+hi6STWvjxJ0kzfh4xMjQ7
 1m/s59lEpTYjA4IFTdL+GLVcMbU8yuRI1BOurXr6eQ699yoIlgdAhcGRMLM9kU2s+75l
 ChlEnwykv4c5N/4O6C3ePMABPAT2Rkk/0Z3eUGlhGw735bMBn89gohFcta7NVcYAZeuG
 R4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740329025; x=1740933825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
 b=v0oVSpD1fy6B/J9tj0vj93G9SRaq+piUsATRyPgjPYk56AWapZIa/YF2gviRHRIznF
 gt6LLs8Fr8cuCJC08DHbFIDajAvRGKj/9H181HaglBQCRwssSU63NGak8rfYiOoubOkD
 KryzBCmpaTX9K/DPocQbgUbUS8sUriIqmSaPGnhvbZNp54BO8M/BIeD9UoCSDdqqikcT
 Rz9fBthjahg712ictCAklIZeU9B4RbRWe6mMOXhVZmT/kRnLH5VGTbkbAIxgzYCFGg4c
 WCQWFBcl7EJcxYR+8NSRuGQWd9nKTO1AyTFJPZpYbB2xDNaUSDPra0cUbtR+3mYbHD+y
 vWQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQlqfYqjt4/W0tt9HGeArf75wUjkRnLdrrIzcQrvz/lTbE252wN9kGdOMc1mtmisopYzUiBaaVspU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAOCxBWjV1W/rGKni9ZzR6u+Hr+BbmSXkGfMlG3eXDcZVhjDf0
 0xUfICHjkXzekoCIcYlEDlNtRvyhQyBHfu+W+hjBdFrVH9k7l6wC
X-Gm-Gg: ASbGncvbenuVWZIf2mkvwkTWsrH7OKzxJZVjzZ0xEgf0cqXSMDjDOpeQ+d0iCX1kUbs
 csHuFQEFTubl7hgu6C2tS2i8KmvkrS1zh4Pl8jKADBs3I3zgQIWnAc/VTvlqAqx5dGndoyA14wC
 l4IhWDvyuT0TInqfZLBNcTBOPLbLkazR0FLht/vOTjeP9btyJMmWC27xKUHSIJwKcsCtQgwgKl/
 orCG/A7paJAKc7evBHNsxfNVwfb9IHGuinaVCzod+sFkCnt59zgmOdJ5z8mYtVjtOY9gGu5/8/I
 H68dG0bi5Ns/bqyeSvP+K5IrOFLkfZuUEzPsJiK7Lbu20JEjsp/a0OpO
X-Google-Smtp-Source: AGHT+IGVq/VDL8yFNkkrNqMmhpwnPeH21AgiBV1Ypn8QzIpzc6gLajBMUvDiltb0IdO3Sbiytrzwqg==
X-Received: by 2002:a17:90b:2e0d:b0:2f2:ab09:c256 with SMTP id
 98e67ed59e1d1-2fce7b07205mr19070739a91.33.1740329025494; 
 Sun, 23 Feb 2025 08:43:45 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 08:43:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH 05/17] media: pci: cx18-av-vbi: Replace open-coded parity
 calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:05 +0800
Message-Id: <20250223164217.2139331-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1

