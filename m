Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCaPAnNDqWkt3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:48:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6989F20DB32
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CA410EB9A;
	Thu,  5 Mar 2026 08:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TfHY70/1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B79810EB9A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:48:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ae5636ab04so42017675ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772700526; x=1773305326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGStloZ/zCqMNdJSTLCHdDY1bkUR5oF+Ve9XjU0YRms=;
 b=TfHY70/1oNdHMZ5AIbAT/xWg9h9glJkARtKStSYwhS+BWoudbVyOaDnnPr1GXv1tbo
 F4sZuIS4Lss5ptTSJ+rSqSOsdJbDQE4qq1Lgp6LX1WvpcRlaxObsRNBzZq3ZZyCCHMXG
 BZXXnZFgluuFQZNIUfMfNR8/4DzLe0CnljJlnyBsGPodkFhBUJ8AcsvTA5CpRvHKKWQ4
 urf5HtIxxMD4GxnN3xJYQN9nhYtaxoNAqBWsdLhsHf/jvvmPIZArjd5G47oD1+Q3cD01
 VLT9R7gKRtVeRE229gs0Un5jqHVTRmE89hfr1758bSFrDF5IrLQ0wdb8ZMxX0yXb042P
 Lpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772700526; x=1773305326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TGStloZ/zCqMNdJSTLCHdDY1bkUR5oF+Ve9XjU0YRms=;
 b=Y8A3OlzVMGrdWBDUUBawcA8dFlkSl5PSDeyHUnIAy5L6MNw4/bon8XgviuxvN76FzR
 sjCwgzL7j5jppQFneKPe8mZWdf2hr9M+hMmtGV2D9n8ll6yZYjsX3fMCQ6YZbclTrzUr
 9u7DBGykEw2T7joD6nwlv06Xu8jHO5qrZyHM9Oqax9F1Pd0YUAKRNcvSlwZVt48qN4Qu
 j3sqoHi7z41carJrT2ZNq7TI73wnuuUTm3Ie+/EYncbpwlAG8ksyN2hWDOaJZkpdCalA
 x0OxnRwdzXZidybqgnH/VuQMCU63L6uNX+MrMmbttV6PLJRKMZ1t39jP8PIxRl1xP89+
 Pdsg==
X-Gm-Message-State: AOJu0YznmrLuQcCMrYkvtQds72THz44pcAmkbXhL0kQj0UAs/EbEjNKu
 5FeISMBSUDBJJVFtbZcF9Y+3odevvf2BwRXbYFjaI51Gp66raYvSXWI23J5f1wFIvjQ=
X-Gm-Gg: ATEYQzzNJJkXXqocRda0gJy9DRR+u42rlAAHuzKXvdmqaUABYKsmm+ZuoTvzsUvEegp
 kY8gPBswgnkvr89EQE/OLEHQ/jxVxsu1bezHTU77pPTj8Hhm3k70VWs0QksrA58RV4BTiqprAb9
 oJ3PdviSa0el3qifEDtQCrtY1UGgteRwq7uWbQCyt3oJMUBHls8M6k5v4zELOyTjCpvtg5Ei7Cc
 QnUAdVp+chnW3N/CM0zA/Aa2KAhZ/7zLsx1+iIL9ViUqZHNUnC4wYV1o8EM2+HOhvVqZBhiY50d
 lM9XtCAW8wx1tYTQgOEPzvgKdZj2IZMB4nbbv/pX/xFEdXMJFHlQWm3DF1qDsQ8aRemKpqATgch
 wk2c3G42LibovkMVQDKAWLpu2F3Y2I8eNl/3fqty8RmCHh3MvaXC9djHYKZlemskfmVy3pNFuhi
 ak1IC7HJPVE2Cl5+QFuA==
X-Received: by 2002:a17:903:19ee:b0:2ae:4222:4535 with SMTP id
 d9443c01a7336-2ae6a9ed187mr45451715ad.12.1772700525627; 
 Thu, 05 Mar 2026 00:48:45 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c9f79sm233490715ad.33.2026.03.05.00.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 00:48:45 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/2] drm/panel: Add Himax HX83121A panel driver
Date: Thu,  5 Mar 2026 16:48:08 +0800
Message-ID: <20260305084810.370024-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Queue-Id: 6989F20DB32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add a driver for panels using the Himax HX83121A Display Driver IC,
including support for the BOE/CSOT PPC357DB1-4, found in HUAWEI
Matebook E Go series (Gaokun2/3).

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
---
Changes in v2:
- fix dt_binding_check (Rob)
- use devm_drm_panel_alloc (Neil)
- move panels specific chunks before module probe function. (Neil)
- fix supply in .c file
- do not initialise statics to false
- Link to v1: https://lore.kernel.org/dri-devel/20260303115730.9580-1-mitltlatltl@gmail.com

Pengyu Luo (2):
  dt-bindings: display: panel: Add Himax HX83121A
  drm/panel: Add Himax HX83121A panel driver

 .../display/panel/himax,hx83121a.yaml         |  92 +++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83121a.c  | 749 ++++++++++++++++++
 4 files changed, 853 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83121a.c

-- 
2.53.0

