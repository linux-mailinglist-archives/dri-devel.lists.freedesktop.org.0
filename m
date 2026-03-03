Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGFjM1HNpmntWQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:00:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0171EED80
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 13:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015B10E028;
	Tue,  3 Mar 2026 12:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GR6KxZi4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE74310E028
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 12:00:13 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2ae56e68216so13775105ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772539213; x=1773144013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zgVtJv8S4lBCPvD7Q0WmyaU6QUmtpOkvb/EmP3pStwo=;
 b=GR6KxZi4j84cs9OvLSEuVeQC7RKen9XSflfACyMjrQG3PJd6WTojF9fT4xEFSce0/7
 sMK7Udxig/JVpkWL3mI7CAW+QAUpO7uEFKAuts7l8bcnzdAce+qBFGrsLJh//fvr3vne
 Edk8M3tgr1AVpRN8I1n5K1CTWmueIe5q3f/5W+/XImjRtlxscGzzwXfFcLUyNxwAhq0s
 4zVMml/37kzzgqAaNaNjOQATNf4BhfbgFLBcsPfNk2Fi4miZOwm/zb57uQlxUEbrmsV5
 nDB5KVKrtGainUm1E5T7neUE1nz5mkT3h67nKDRQZIyvPDkXi+jBoMUiS1lCiI2lkZMh
 WiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772539213; x=1773144013;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgVtJv8S4lBCPvD7Q0WmyaU6QUmtpOkvb/EmP3pStwo=;
 b=KVAhmEmzuSSx2uJJ9eh3T+vuWDX5C6FGqShlBJBVdXyaaYPsA89KMLQyNRGkERT8Qj
 uT+lB1xt0RAB5lW90GBcL6BPgPbPg2W+2DUML8Q1OK6w00V4DBjZmUOIUfvj3uLsHAs8
 6YHEzWmznHF336rdQyaBPLnzsiTO7hj/Ut1xEAccM1vfJdJaqdTYwWwsPMNDfXUVze8f
 zUIUhE3YuFuvn/qvt7wxPcJViVa0YPGocQRJEoSiJwvQTBmsLdcYeMb10c8tOL/M6trR
 7Tz9YvohSsKnxAxT4tgbOW8GX5lsPtKLTfEJCP+fHNdrdz4HrADmQyucBdwnmR8e1/Aq
 LJyA==
X-Gm-Message-State: AOJu0YwyzCtF9w4zWr1ycvUAc2Sr8Zw43Vh1pZmIFE47jfkMSPMs8w3Y
 v/4gTS0LuT8acvQp5/gijgFB4s/pBtkL9S6PT+SUTe+uutOPdXscQzs4
X-Gm-Gg: ATEYQzze+G1axGHx2ozUIKb0cdG10JpKNesCzSTrfvJT2jL0XiOIUfUp2yhdMjDgTjL
 6OXhab7Rh29O9DFJ026cwKryGyXfnL0usOrs3/GNgjs/tzJT7H0bnH6phdu8ZQDbVpUdZNEgf+P
 vV/L0v4BRjanYEtJj7XAIzE9qRqRYa3FS96fs1Wyks1uMbMKAB82WJH4+/GTdkv69z/jUOe0x64
 BsMNesNzCiJBGNUXMKPPPGpmtMQcTgokB1G8MDZRamWqd1JZtFTiXg3wijAMNEpUWZsbputVEbn
 WrAi+OwUv/0sA6eWTdF1lGYFBNmzmKAeOGFP+F1zHLFeNSW8urNDZJJZ/c4MdzLBHqaRItQDHJO
 iyECfiINdJu9CJddNIar43Tv4XIdMFuvPLbh/6K59Z+kWOF/SwEScsFBea+hM1NGjNCjttsp6uE
 yq+x5rrrwxrLACFf7MQKqM3k77kFYa
X-Received: by 2002:a17:902:da8d:b0:2ae:5848:baf0 with SMTP id
 d9443c01a7336-2ae5848bcc4mr51339955ad.2.1772539208613; 
 Tue, 03 Mar 2026 04:00:08 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae541358d4sm52570345ad.75.2026.03.03.03.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 04:00:08 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 0/2] drm/panel: Add Himax HX83121A panel driver
Date: Tue,  3 Mar 2026 19:57:28 +0800
Message-ID: <20260303115730.9580-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 5C0171EED80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lumag@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Add a driver for panels using the Himax HX83121A Display Driver IC,
including support for the BOE/CSOT PPC357DB1-4, found in HUAWEI
Matebook E Go series (Gaokun2/3).

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
---
Pengyu Luo (2):
  dt-bindings: display: panel: Add Himax HX83121A
  drm/panel: Add Himax HX83121A panel driver

 .../display/panel/himax,hx83121a.yaml         |  87 ++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83121a.c  | 752 ++++++++++++++++++
 4 files changed, 851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx83121a.c

-- 
2.53.0

