Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042EB279E9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 09:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5B010E245;
	Fri, 15 Aug 2025 07:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gEQGvfn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93BC10E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:51:43 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-32326e5f0bfso1208210a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755190303; x=1755795103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RYjGIGZKNjSwwMMePRBYpKkbHMPvIH+4uqVdBTFlwQA=;
 b=gEQGvfn/QzotKnDDPDPNhPGvrZnhYoqDdyMNWfqXmzDc5Oa9vUDD6qgowOmLG1AplP
 YpzAAu+j3GXHfJLCBFk/hsejB2jrFURF41sjDY8nDW5NAhqJqSq/SafcV0PmUFq9kFUV
 j8Ze4pZQDrOV1qTAC5lZFzKKn8LL11w1+GAReX19p2YvZJvGRt2gHGt5GnmezORSJrmq
 1H7xOPOFkUg1wbgJlKIvn8zRGV1pce1rYIWO36OPrw5E7cvM+Uaqnv0lqLbVEeFvhmjE
 Q0Wq0FqHrNb/jmvLiLEYvlwkqLw/Zdq2Wt5Watz9FbsjbvG9b5opwOFuicEtqubnL5Lo
 8qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755190303; x=1755795103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RYjGIGZKNjSwwMMePRBYpKkbHMPvIH+4uqVdBTFlwQA=;
 b=eOPJ1Pc9ME6WC9bjKU6i0ub1dDq7c/fz7MqFA6A1jOxALAbDaEaEWVsPKALQAjEIX2
 ZKiGVR9sWFzE+ddHPT5n+1mMXcCRH4Y+Xy/ufZiDXksSngw2N5OtxZLb7E3UWFMnQiBd
 rnNr9DigJxfPVmmw5yDg3t1QBjnVi4w/nvokP33IeiEAB7kyk7x5EXLNiJ9oxyrfa0fM
 6gmlxHtFKXjSgDMxPcvezzBb3lPXDfcATgffiAqvEcLzQ/k7N3P2xiVElDssK0Wb9epZ
 +ZsLs/RXQ9zy9/3vmYGkVzaygE9ncMNimaLKCgOgStiXrwEskBDo2X7afYIMQJzG31IZ
 GCow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfXy5rFZk3sR7I0T0UTUK3s7fpZh/64fEoVkbq9lHMG6QvheSPY6l9krlABVKZ8NzbTxCJ3pauDVw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzqYQq4kWJ9lcszb6qHf96hX8XJpI6aW1h9bU4tEPFEFwRDKTf
 Jp1xcjS9q1V/Tkqw02f1porXACRPr54prKjzB/is6GNZmMyprh+Hie3D
X-Gm-Gg: ASbGncsYlvip+IrXQLAb3Y+782Ar4bN+zajpQkvXZ8bm4qaxlLxgZC/PraugUx7WMR7
 yl+/0wcY2EBL4YIEBEwKY4gckshohZrbifr//q7nwGNuAzt4vGelWt4mzWTPG6/04mqbLADsLL1
 ngkqJkJLVxG2uTShqLzS5PPCYhokd/EBanflvnhiJUgNDDi+1ktRnaM+2RbZoYg5S7+UiY9nwdk
 xqyJpR048jfcaH2smms+33rK+Bm0UovrP2qkgYO9CWl7TYnO/meEM4nrgpg1B8HI5i74ZFi2G88
 L7XhBgl5ZN1FVWUOcXJQji3CLExwv00L8/SIwhb1fe8wWUFe+KjRsDQm7wdWZbgYWTXOb7zEC4w
 STa8Ldn16M2S2X505DlXE6PWMt0UdiOd97PJaHG/V9TiO1lwJsDRP6CQB6nVZc9Dbqm1adMygci
 0=
X-Google-Smtp-Source: AGHT+IH0MiMwWgviaw/mGxe0R76GtgG7LKjx1+p4CKRkJ7nnW7Xepyw7mwzYq4K+Ze8wJkhejlul8A==
X-Received: by 2002:a17:90b:4b03:b0:2f8:34df:5652 with SMTP id
 98e67ed59e1d1-3232b2c6659mr5225771a91.21.1755190303196; 
 Thu, 14 Aug 2025 09:51:43 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com
 ([2401:4900:1cb8:7b85:37eb:c20:7321:181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32330f9297fsm2375904a91.4.2025.08.14.09.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 09:51:42 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] drm/tidss: Remove unused value
Date: Thu, 14 Aug 2025 22:20:56 +0530
Message-ID: <20250814165058.615884-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Aug 2025 07:17:25 +0000
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

The value "ret" is being assigned to zero but that statement does not have
effect since "ret" is being overwritten before being read.

Remove the unused value. This issue was reported by the coverity static
analyzer.

Fixes: 7246e09299455 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
Changes since v1:
    Fixed the commit message and Fixes tag message formatting.

 drivers/gpu/drm/tidss/tidss_oldi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8f25159d0666..7688251beba2 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -464,7 +464,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				 * which may still be connected.
 				 * Continue to search for that.
 				 */
-				ret = 0;
 				continue;
 			}
 			goto err_put_node;
-- 
2.43.0

