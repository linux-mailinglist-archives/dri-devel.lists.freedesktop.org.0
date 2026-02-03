Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDaCBqCugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31E5D6167
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D415A10E572;
	Tue,  3 Feb 2026 08:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=reznichenko.net header.i=@reznichenko.net header.b="XQqC45j1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276FF10E53D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:41:26 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-c075ec1a58aso2162005a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 21:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reznichenko.net; s=google; t=1770097286; x=1770702086;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D08eqWaNz/g58oq/9WRuxN3nwvX07U65CVm0PjSPoH8=;
 b=XQqC45j1VRInoKOmqT4MeL6jVxVVeMKdHSmsr5og4gwleHmUKlq/DsaIuh7yR5c2s2
 dEm90g3JAF2qIyztw7qmDQpxEOiYNWyIXWhBOs5MdLPwEUWjJZvM5SMRPCZn3krfcisq
 rsRYx7lN5Eb8ilUG2/orUXRlXBIwUnps4vvFj6C1gjejHa4rG50NCk2BQUnYWjAtAP7V
 e2wP5DdE/RU0M0cVMM/Qm/IObeJ7tbqA+GilBMowKBRuH2zbJt4NcmFVh11p05MIPoUZ
 Xh0TB8O0fC+2NKIw85zt5bx9Kz7Z2ydv6GFeM01sDDAJ9DZxxhSK/CNEVYo4pU4wdY4b
 EhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770097286; x=1770702086;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D08eqWaNz/g58oq/9WRuxN3nwvX07U65CVm0PjSPoH8=;
 b=wzusFQqATuOMuYPANufS5BbWHFEtltBjazACdPBAgJ8CVtnfOvnwsk2iOqlPxSWRJ+
 9F3/AuCQniMGW5DhJ+evmSo9BHWkQM4Uy2kPMYVYxNxe9vtYC7hZLVoT42XUcaKgPEDD
 0gWplTZaMrAAUY157OALwUwN7EgT6iVTmhwCuaqAcY261F/8OVcFUFyenj0MlQWUEJ0A
 UFm3nXLBgBzFjYYuYole/s4kQFPOcbiQryP2HIrr797uIzRP1nWHTu9B3wf1WloZ75yV
 JecJW/aHqRf+zeLNgI6XaVLlaAt/UMXLRAKZ4stz8deer2eDl/1i0SpiWNZOsD1maC0Q
 idig==
X-Gm-Message-State: AOJu0YyUsbpu4LbrUThEE7PcaOpksIKR95RX04s/OINxuRKtb5gG4O5M
 ShgL3DAwF+POINESOZdAQ5+2w0yInSNA+PlxeZ1pHPtdkE1bOKu8QxsM6f8/kFHnksM=
X-Gm-Gg: AZuq6aIZD0F+dQcfOcwylZJyacItGgaudmLAyExXIHInFFgGAy9NPwAhzrrK7ti74E6
 H9/qHIxZXStkpZDnr3ocdBfVgZDi9/GrcbiJ2TW/Ygu00ur/hBDmmE2PqF4mConOudCCI8OTwku
 VJiRj8sx3vGXwycDqlpjZz/1WWbXmeDdfjfxAZokMdNnv9eLCvMCeJneNEElyOO0oq+21gR409X
 rXIkophrXSIRjUqZL5YKrogVNOS5n4Cyd+RuooN9sD0seF35XShnWgzJc4qy4xmYuIvN59RcpXA
 YpWCQtcTtAd57ap9K0IbdWNBH+zEsXNCmNh3YS2HmexAUSMwlzKFzCwUBpC0oWat9FQOGkNxadp
 HoXyo3XE/YxDSAI/bdfYPOqyOwPH/Bltudsi2oJ/t9MuZ0Ir7lhbG0Oy6JhGEvTKw1quGQv9iXM
 rw+vnPCJc49beBTGKQrrZ3LMuGyVmU
X-Received: by 2002:a05:6a20:72a0:b0:366:14b2:314 with SMTP id
 adf61e73a8af0-392e016e452mr13386544637.71.1770097286379; 
 Mon, 02 Feb 2026 21:41:26 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:361d:bbce:3ed0:c3b6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427da845csm16051669a12.12.2026.02.02.21.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 21:41:25 -0800 (PST)
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
Subject: [PATCH v2 0/2] drm/panel: Add support for the FocusLCDs
 E35GH-I-MW800CB
Date: Mon,  2 Feb 2026 21:41:18 -0800
Message-ID: <20260203054121.335441-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:15:23 +0000
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
	FORGED_SENDER(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[reznichenko.net];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[reznichenko.net:mid,reznichenko.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A31E5D6167
X-Rspamd-Action: no action

Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
The panel uses Ilitek ILI9488 driver IC.

v2: Added comment explaining the "focuslcds" vendor prefix
v1: https://lore.kernel.org/all/20260131034101.307486-1-igor@reznichenko.net/

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

