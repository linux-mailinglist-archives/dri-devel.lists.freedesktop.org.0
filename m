Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNkuA9HugmkifQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:01:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D100E2773
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 08:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828810E330;
	Wed,  4 Feb 2026 07:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=reznichenko.net header.i=@reznichenko.net header.b="rAfvILgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462A610E0F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 06:01:19 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so6666216b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 22:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reznichenko.net; s=google; t=1770184878; x=1770789678;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=knmmDy3mJrkVrvhIFIyiki8QNjOHAU78qve5pMcvXg4=;
 b=rAfvILgRTMKuqXfa+0Ss2/pT1vfWLR6clsKd8Og5GIFf6alPCOrCtX4VUOAZkaFogT
 AjSCpAmCwnny2UBJVYp+oY2Xm+RHh5S0GG2qcVEAW41fNsXKfqBR08kZ+5YHnOiAT2rY
 shwBfwV9ldW1z0p+9X2X7jGTeQhDBialg/HRixLSoqRr8GSgGtQ9e4D4yHRpk1kdVNfY
 evIjk20M+SuzvxLR66E8HtkjtYLcPMBCBN0tVVy7RUY2QOh71A3WMsUkCOnnTOpSmdHX
 XN9qf/fyiwUCjIifT+JAQcwROgAHO4pSHCfKthxMXS2tnv/09Ltz7vtwjKcYyLm1D9+a
 FFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770184878; x=1770789678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knmmDy3mJrkVrvhIFIyiki8QNjOHAU78qve5pMcvXg4=;
 b=jrLd+5zfwty+q3PDSAc2kArtQw6Uq81T0KcMXGbEZxP+9qMgF66rwRP7tMjPl7Aior
 sLHGRnU7FUfjC4NODuEN8Wh+SI4tkeDoD1hY5T0ogWYrgBDt6olrMc4aoh9zM7qC52wg
 ivOSG+vAv1xZ/bwD2W91s7meR3IvjIQxt0MM91WRDTQ6oZ8hiwOhicWTmY1L8LLF64Zo
 QLCrrkyfqVTEiTwWMTI0x5bGExUPz6K0qlsYdXuUsteeYsJ8gMpZQotNrIv61Kufik2g
 9UBReCmF+kfnOuX4LPwEk9EjoJfn0nILNh4XQujPpDGO+8IxDTFnwk9ESK/JxwH55KDy
 0GdQ==
X-Gm-Message-State: AOJu0YylGw0/OxVhvYvI2euMILwG3hBvIa8lErUj/9ipo6W+Ms4ZBVb9
 YmrVRAwtbxFiP+zhavEff3TjdrRQ4aLjZgT0oKXGbZ6KYNF0IUGTWDAdViEYlUdfWVU=
X-Gm-Gg: AZuq6aLcRM3sfbwgIHj+JHuPPmfke0my7a7Oeq+QuoSo1A58ZM9gWD06dPvIcIDgIVe
 6VzPj8ur7QH9t3Qsf+CwIygCiKVKYizSBy9/cveeDYAO7bwpUtW5WelWYEv2EZ0//B/C1M7ox+H
 MlrVYsntmKk2PBY2Z1UorTcRpl/yt8ZNDouC11F3A+brujWmqB308h9Pn1t1aFN9xbOWXdg6EVr
 q97rtNtdb9IjE5c92bpwn2GOKgc1phSZq9/OG1q9oWVMq3rE81+kzqGpjuCbZ8JI7yf2zWDh4HC
 sU42YZsfvhRofxqvcLibMCFTbqOCTt0kTa15dbUYKzdGEGBEjgagkmcxzYNOtHTj2x4YlbQ9yHC
 demgRTFHLMIFqtXM7wgy1T6JykmKfqOldDnPhHku0dMRyvCD2/MVuHNGKR7ysLR0avc/3A/yf5o
 akVnfsHyLCpjnU6lJ40GL64yuUlvug
X-Received: by 2002:a05:6a00:2d03:b0:81e:408e:47d2 with SMTP id
 d2e1a72fcca58-8241c64c763mr1896419b3a.53.1770184878532; 
 Tue, 03 Feb 2026 22:01:18 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:16e9:94c2:69a7:e3c5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8241d163865sm1335710b3a.9.2026.02.03.22.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 22:01:17 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, "Kael D'Alcamo" <dev@kael-k.io>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/panel: Add support for the FocusLCDs
 E35GH-I-MW800CB
Date: Tue,  3 Feb 2026 22:01:11 -0800
Message-ID: <20260204060114.345219-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Feb 2026 07:01:29 +0000
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
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[reznichenko.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mani@kernel.org,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[reznichenko.net];
	FORGED_SENDER(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com];
	DKIM_TRACE(0.00)[reznichenko.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,reznichenko.net:mid,reznichenko.net:dkim]
X-Rspamd-Queue-Id: 7D100E2773
X-Rspamd-Action: no action

Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
The panel uses Ilitek ILI9488 driver IC.

v3: Fixed missing Reviewed-by tag
v2: Added comment explaining the "focuslcds" vendor prefix
	https://lore.kernel.org/all/20260203054121.335441-1-igor@reznichenko.net/
v1:
	https://lore.kernel.org/all/20260131034101.307486-1-igor@reznichenko.net/

Igor Reznichenko (2):
  dt-bindings: display: panel: Add Ilitek ILI9488 panel controller
  drm/panel: Add Ilitek ILI9488 controller driver

 .../display/panel/ilitek,ili9488.yaml         |  63 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 299 ++++++++++++++++++
 6 files changed, 380 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9488.c

-- 
2.43.0

