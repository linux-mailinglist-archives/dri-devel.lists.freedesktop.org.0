Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44F1B25D18
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED61710E076;
	Thu, 14 Aug 2025 07:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FAeomQzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DA010E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 14:40:17 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b47052620a6so826423a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755096017; x=1755700817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pDjOa/Xp81rs87L9VpRbzpj63Uj07ISfrQi/o1gFpf8=;
 b=FAeomQzdPbTv7RpZflsb6ozAwoexXVmdG78ljAoh0KCviK+xm+4jzAWdpYP05yINl+
 Rkq0tie16Xxpn653hN9obTPw5aTmsi2vnwhGsoievTtT4X4opZ7l0axd3aroyeSUeq/I
 OO7NK6AOAdXnn+nuRDBSgPXoPFCImoPgXTqxbjkdZHtGU2OqKLfwNaa+PAQnAIUb9Yhp
 Cq8rjPn3VEO85euFeFKQq6O1tgpqB6QMkNPeLNBJ1XtFmITohQSMpvWq/tEmjBdnM7kQ
 ctHGFL1JCa3PEA/lQu0q+Y0iyIshQn97a2yrI/Krp7d95gNoEnYjw2Ce7DBOtFAuWGOZ
 qeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755096017; x=1755700817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDjOa/Xp81rs87L9VpRbzpj63Uj07ISfrQi/o1gFpf8=;
 b=MPILspjBAYLri8wLY1ke36R80/Ca2F1hR1TkYnqdZA0vgd5VtWj1hFRYFIaJAS5D5Z
 D0NfWL+xGJmvO/JDfXH5b+VyHGuSJGSB0tir9fdj+83exR5e8pAmWetahyM666XJwhn1
 vQtTkbimjzE0eoil+s1D9C+cFIkdQtid0PtsfV+y+lazZlNnZeYEyWj4j+N4lwhAwAmQ
 v+XnDF7QAAY05WWu6ozTUy4XMhaNOjycrDYCOFGHNEqr8TiDByi2CbweZMg6PJV2WZT4
 7Y9TMG54XSoq6Z/OCwlbx+pMYsCjEVBEQuJP2mVcoiDXWBUKhQ/VHDoC5772Em/Kozr4
 IVoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsXkt+KTrr/X0A8EWY9UUOwyYUq1ZXrx+tDaWLRAhH51QF5XveOASYk2J0XX32no3jN8PhU4wcIZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5nqKqKWpMysRx4elQrNK6UkwXhB401EQRa33rqt0+og/M2UuO
 a1hLFi7w5/biAFEkF+qitlxlpTmJSNdkzzrtmkKNdvFuueAebC8ex/Hc
X-Gm-Gg: ASbGncsY0wVpMOAPJcllcfyh6d2L54lfmrZ0wI1911xBk4w9Dn3McftcZyeKWjpdgVU
 PgPbaRjh3hDnhsvZKJaZWMbmRLGyAX3ihjBcJmC3vUrn12o8C+Dm3lz0Ts0e1mZsi+mXofCfCNH
 QLjvku96C0GcyBee/AoMnZrATTeuEh6R0naTN2rNwKCYJ14PRYc/36UqNSNW6X1PAdgi79zsBOn
 37qxhvKeT6X/gJWVyqQeprTNM6IvZCDrplqaNe6TOse1GPGQ097BpJ4UsR/ab6BAU5o9JwSwvu2
 AHbNmVNHdxyFwwWrua7P2Fpts7S6U1NdB8p8k4LH9kd9mB64MtJTtwr8QjR5imNniZjynqKbhmT
 S6DMiuL++sT1zkmwx3K9gF251E7ETS2UAytu9hJwnmWC3ouTwAIEtLoGOVJ52ONQBi2tmpsxQun
 4BJw==
X-Google-Smtp-Source: AGHT+IESod6XYiMhJI1NGrL964WHvDNp1rHtkyu3jVsoDJf3P/8fwBq8TlO5GT+GL3HwCUf4laJ+Nw==
X-Received: by 2002:a17:90b:164b:b0:314:2cd2:595d with SMTP id
 98e67ed59e1d1-321d27edfbdmr4479992a91.8.1755096017234; 
 Wed, 13 Aug 2025 07:40:17 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com
 ([2401:4900:1cb8:7b85:9b4a:84f0:66de:85c7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232556018dsm373059a91.12.2025.08.13.07.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 07:40:16 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/tidss: Remove unused value
Date: Wed, 13 Aug 2025 20:09:59 +0530
Message-ID: <20250813144002.111689-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:25:34 +0000
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

Fixes: 7246e09299455 (drm/tidss: Add OLDI bridge support)
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
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

