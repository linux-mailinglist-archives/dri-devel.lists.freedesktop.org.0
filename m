Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMq7M8cge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85358ADD78
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E7E10E82A;
	Thu, 29 Jan 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WkenJbyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3AF10E7B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 04:05:38 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a0fe77d141so2766395ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769659538; x=1770264338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GAPh78XXAIfxfDgXO+YnEHKlcDWVZdI7PWnVmQSgPQU=;
 b=WkenJbyZPWHlIbazKraT55ovuIjLpT/Ud3OahBXaS5GGe4Qd60C7Kr0Fl14L7378j9
 d4Yc6zPiNNFHhythFsCu1+HWxWzDuHsz3aLER3UbbhFlh84vN1+iWMzXjqNBZoJqI2E9
 e10YQxjpjreRrNk6yjO1g56pnGZIbLWnHDbXjSOhOfzG/BnPFcdp7xa/x9aUfAbBjpMy
 PWVWvEeCKDdQrBB9+pfjt9zxTaxAfB+wv3oicPq1rxb6R+LPzeAERrlLqAVsEad/DF8i
 3xQVNpy3fx/jPcbezwEkCyo/gAEivgbKJOw9sCOunKW3tI3+esDH/oWjCfs9dei8nKBL
 PfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769659538; x=1770264338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAPh78XXAIfxfDgXO+YnEHKlcDWVZdI7PWnVmQSgPQU=;
 b=nWSsE0v6RaedolVf/u+oqfEofacTTam+D9wXEAVjoOcs21p88KbQNY2vsG16k7+0eD
 ehPhK8kEiRkErUh33Z32IISsVvXf8Ez8aoQRJsJEd1dVotMT/xmUKSQhkd6e1GloHAHt
 So/yohKQqHNxadNv/zCauinQK/WfG06N+mx0ZwjHHqjPeN5FoVOBfNZuA7S4wm/iiXb9
 URO7zJp3zoiYw2d9ES6U9WDFOhNlEDClJzuain8cYLFPCKUqB/ZWj0Gw6pnLvJzU6SUQ
 FbtAYQJQVf05GQ4oFMKtbntoPdNUQVMyn7WC0cgOV9UBR7fBIWZPeL7kg6io3AO864ym
 KZEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/CX/lMmTfbIIaNZDUlGY2BPvMeEfvm5LHJnYgapLesnGWGWiTKNrRiqpv7GktyzU8vLUB4zaS9fE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqnt6tyCpyrg0kmG4Og6bp2I2+TH7Nt81Fcln2xufnmov6xbOc
 G5/Xbg2+jDEDY5xbVk6k8ZkDH5+U3syrqL0IfRvenQnDax1vKoovUL/0
X-Gm-Gg: AZuq6aJDpEgTzx1WKC2U4Hr+2Ylrpsk4a5iwWmBbcB1foAFJsspdrtG/0Oq38QebKQq
 Ljq1OscIghQ4kB1ee/YAbTPi9z4mtl06sTOi9foWr3SwmEKvL0JDPboSec+OBhusZn8G9bhC6Um
 Ab8Ac9dqyoe+UaBtV0/YK5hIhvb9UkNe/wZn5tTVFyHRz5x/tk3uJhEdg+fGP9ZgWluK3PWoTvJ
 jyj1WbGDyDIHhwFwvXDCMRbsszsYYtddc9MAWmh3brcSz4yOF/q5kvH3HDfGM2IpsOsZC0N8sF0
 Fuj0g3fknGIGZkH55yn+dqI9ep/8iV2XEebGjo6/f2Ipnr1NIgyfQX9kZ997UQ2l+gAhPeBGUcR
 yj5s6+67/cctbZ+nZINoUyISfb6RvI9bY3uW7ThmBchVkx8tpzGgyHKSoMC9CiRVzBnHLQH4Yrn
 nFuQh9G7QQpBhe6Yq7J0mDWbFtcdyMJMNe6xqV0vK55m6eeVEIyzdv1QBX/maGDtNSnlgLqVlGK
 zeccAnNNUE=
X-Received: by 2002:a17:902:ea01:b0:29a:5ce:b467 with SMTP id
 d9443c01a7336-2a870e0490bmr82121145ad.54.1769659538253; 
 Wed, 28 Jan 2026 20:05:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 20:05:37 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 a0987203069@gmail.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm: nuvoton: Add MA35D1 display controller support
Date: Thu, 29 Jan 2026 12:05:29 +0800
Message-ID: <20260129040532.382693-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 08:56:34 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:a0987203069@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nuvoton.com,gmail.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 85358ADD78
X-Rspamd-Action: no action

This is v2 of the Nuvoton MA35D1 DCU DRM driver series.

v2:
  Driver changes:
  - Drop custom CRTC and plane properties and switch to core-supported ones
  - Switch to memory-safe DRM-managed allocation helpers
  - Fix several minor logic
  - Fix W=1 build failure on non-ARM architectures

  Device tree / bindings:
  - Fix dt_binding_check errors in the YAML schema
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

Thanks for the review.

Best regards,
Joey Lu

Joey Lu (3):
  dt-bindings: display: nuvoton: add MA35D1 DCU binding
  arm64: dts: nuvoton: ma35d1: add display controller support
  drm/nuvoton: add MA35D1 display controller driver

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  73 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  56 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  14 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/nuvoton/Kconfig               |  21 +
 drivers/gpu/drm/nuvoton/Makefile              |   7 +
 drivers/gpu/drm/nuvoton/ma35_crtc.c           | 372 +++++++++++
 drivers/gpu/drm/nuvoton/ma35_crtc.h           |  67 ++
 drivers/gpu/drm/nuvoton/ma35_drm.c            | 371 +++++++++++
 drivers/gpu/drm/nuvoton/ma35_drm.h            |  48 ++
 drivers/gpu/drm/nuvoton/ma35_interface.c      | 193 ++++++
 drivers/gpu/drm/nuvoton/ma35_interface.h      |  30 +
 drivers/gpu/drm/nuvoton/ma35_plane.c          | 603 ++++++++++++++++++
 drivers/gpu/drm/nuvoton/ma35_plane.h          | 115 ++++
 drivers/gpu/drm/nuvoton/ma35_regs.h           |  88 +++
 16 files changed, 2060 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
 create mode 100644 drivers/gpu/drm/nuvoton/Kconfig
 create mode 100644 drivers/gpu/drm/nuvoton/Makefile
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_regs.h

-- 
2.43.0

