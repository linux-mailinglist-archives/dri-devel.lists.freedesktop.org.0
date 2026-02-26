Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA1hDJsIoGm4fQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956221A2DB8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8FF10E0AA;
	Thu, 26 Feb 2026 08:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NRGPDp/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7188810E0AA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:47:18 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-480706554beso8000485e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772095637; x=1772700437;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IqyxMMQJkd6v/hw1eeRmvg0jLRcEn2RGuHnSHQb0Rig=;
 b=NRGPDp/HYuqjsY+jt0cSVAqBlp+tkh2WZ+bRJmCkc9xLuuEeJu7nK9ioCz5DxSutYc
 d9ukgw7lF3J9hRv2Zk9bf53iPsdnDNc6pLXubJ+f10LzaZ55EVo3ptJzrTTiEarqnKf0
 mhEYgdRTw1ACvAJhQGZmwnoGSlMPPmxpZ+EQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772095637; x=1772700437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IqyxMMQJkd6v/hw1eeRmvg0jLRcEn2RGuHnSHQb0Rig=;
 b=ui0gSpaHOata11Tl4ngRJpEaeC9AnCqJ2kaYrUL+62GIT8dWYlrcRvIprLLSXWTud+
 /OMG6zXMBLd3O1HUgKnZSCzTevzAmmsKBROozHtniRvUtrhm2mHTYlKc4NxLaMY0lgIw
 1B2DwkhLTWkLYkQrQM6p1DLAfGyVt2qDjHzhNkuXSvjx0bs+wEDsXkzsOgVCfGzoo63q
 caZdSnFx/q3p7fVISDmDwDJ1BRAkPnySgmtRZqj5Y90GmJ2KxsFw/o2pHGnU1DPI+ImA
 Pufak2/axSM4sphZcjDl2tkB4FKgrJMFbDXvEwvuqreNKdCsh7u9nkHQpqhtli+g3qZd
 IUxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzrL8Y/YfwiEeOyOqWM7ratHwI4DvoGBOAXaP+ulBmQ/ZB25MWv22+EZvu/++WvtjcyvMcHRRpU/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCkm1OcmnRF18fZ89wTsN6JQjjDqpyEXt+rivDAN3O4mDBpKmL
 HpCaJna0wCgFdFCqRcd49vg7RRLBB15wydW8kkSScafWt76VU/c1WKQXqP3R8UeDjeM=
X-Gm-Gg: ATEYQzwGeh6N8xfVG/zttjaZaWljGNKjUqsnD7fsLNuLyfB/Ba5YJTsVFPf6XDiBxn1
 GXxkF+CnG9uLLlE6sX7lbOE3sC4HjLCSRJh5l5FmUXycNX2ZBCHixOt+tzRMaKLVW2AiESl4l1N
 c4T8ygTiGd0xtPP4ZkXYUxPthICZQvBx2fnFi7iHnEsIeZUxeSGrBEJX9mltWCCRnO+tiFLlpYv
 0RiYV6eQnmZceyeVmWg1rW5zjxHm5eRnt1iMBhSNt32V5K6fw1mU393H1W3YzgUM+EMjuBzZiO1
 thdXi+u6d4H7T/dxVMb1AwSv7e1QqHvo/uZJHMa/L8OqZNvIiPV39VUZPFNgFUUQs7umpsgWgr1
 VrT4VBvPL5hVDzOiU2KMYY7fMuf2k0Uto87GMNWgTc6tu70H2gO+/E6ublm6A/XDsBAMfCMKWTa
 Xr82jqBSJwSE73RE9Gt1we6SjxQt+05R8cVb2OVQ4csE7iuUs7HObkVcgK+oms8+G8BP2g6kXOf
 SuaoeDNvnob3vB79VVIeRl09g6qDDBSLCUP8w2VHN16QTgiYuqtJCgJNKwhmdSMNnc6Qqk7AOed
 oGhKRdURtC41FQzuNRkrsPz9
X-Received: by 2002:a05:600c:3b8c:b0:483:43da:6c87 with SMTP id
 5b1f17b1804b1-483c21aa451mr57326815e9.33.1772095636914; 
 Thu, 26 Feb 2026 00:47:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb85c58sm31581075e9.9.2026.02.26.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:47:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v4 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Date: Thu, 26 Feb 2026 09:46:59 +0100
Message-ID: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 956221A2DB8
X-Rspamd-Action: no action

This series extends the Ilitek ILI9806E panel driver to support the
Rocktech RK050HR345-CT106A model via SPI.

To achieve this, the current driver (previously restricted to DSI) is
refactored to support both DSI and SPI variants independently.

The series includes:
 - A refactoring of the existing driver and Kconfig to support
   multiple buses.
 - DT binding documentation for the Rocktech RK050HR345-CT106A.
 - The implementation of the SPI-based driver for the Rocktech panel.

Changes in v4:
- Fix "WARNING: unmet direct dependencies detected for
  DRM_PANEL_ILITEK_ILI9806E_CORE" reported by kernel test robot

Changes in v3:
- Add Reviewed-by tag of Rob Herring

Changes in v2:
- Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
- Split core and DSI logic.
- Restore vdd-supply as required for both DSI and SPI types in the
  dt-bindings.
- Dop useless settings in case of rocktech,rk050hr345-ct106a in the
  dt-bindings.

Dario Binacchi (4):
  drm/panel: ilitek-ili9806e: rename to specific DSI driver
  drm/panel: ilitek-ili9806e: split core and DSI logic
  dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
  drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel

 .../display/panel/ilitek,ili9806e.yaml        |  38 ++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/panel/Kconfig                 |  22 +-
 drivers/gpu/drm/panel/Makefile                |   4 +-
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 134 ++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 +
 ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 153 +++------
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
 8 files changed, 576 insertions(+), 116 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (82%)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

-- 
2.43.0

base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
branch: rk050hr345-ct106a
