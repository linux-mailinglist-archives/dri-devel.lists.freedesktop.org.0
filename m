Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E0yD1Awf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:52:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D72C5A21
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953F210E0C3;
	Sun,  1 Feb 2026 10:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=reznichenko.net header.i=@reznichenko.net header.b="RTsHI6GF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CC710E1A6
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 03:41:04 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso1709546a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reznichenko.net; s=google; t=1769830864; x=1770435664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JDZEer4ATr8JGUKyRRTgNAZXllWmyF2+QgTWm11sInA=;
 b=RTsHI6GFyVWm6qw6lxjiWSG46SzWjSuhmpvNteY3bYIMW/1FbIBWZ3iKoMaPwN3q3p
 XFKRHzkrzxyUVk35IRvK45PpQnWu/e0EXR20PL+5aiQM4PeoIDOGUZIp8UbAWlIfiMOj
 JVEy33Xd3quBdF4O+q84x+Ns+0Ym3q7/wYD1yRM8Zf/rlekOnmvsW3WrpdTDl3xMInog
 ahNmFcd/aViyCsr2YCmW7PqKjxGVgTprgFpeGNYasIpbn8HjROFdewKTS7psHuvOPB9e
 6I1rmkyvExUeE5PLmCECK5MTIwiIg0vgiQfG/H7sINLms9myFWgCb0e4xiyhQ9GossCo
 7EWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769830864; x=1770435664;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDZEer4ATr8JGUKyRRTgNAZXllWmyF2+QgTWm11sInA=;
 b=RV7xPFCS+RCMzX+RalSrl4tzvbgqZJ8hXodoGDSOXjB1mN5Xz/1EaGEG5kkkPUFWw1
 o2bVDGAarGZxv3TN/9DquMINKFConJR+Uy/HvVyRIO/w57ejng9C003p8juGaZpnI1KG
 KMC2HnMdzcIJ0tFGiQ1ALXkzqeOQQisNmzPR/DEurmVtP+ya59osmZgv9dhgWXMG+jtO
 dIIQpAmdCAHj4Z1khgo0HolTnb9/WpbN4ayfV/8BbvmMJJKcNLOan/hdVHlSagWkh/Ev
 PEMAmgizUmtdbWS1wOv35jGJYGilbaYY6S4emwmBQqWw1ntuJtMfBKcsWbbtlwqVi3ub
 xfiw==
X-Gm-Message-State: AOJu0YyTRD3yv+AzK0+1orMBUlKor2htIHGftDddJVxNhLGaaEuB+fjO
 11/xVzq3RpRf5LMmxR1s2+9scRgBO/ayzcDdt/S0TN7E4ILP6PqAVj/m+VuhFREqEh4=
X-Gm-Gg: AZuq6aKrpK6oQyc4uEVDomyfsGuVCQAC/0TbGLRpqGNtJ1FeBrT7XLhpXw84hoJp2oT
 t2GWo5jhPbAsEKqGnWWQ9sY5yDE0imnNpyZoZ7CN62jeJ8p66re0w86zZ6b4I1xDsjbVeByj0SO
 NGJo4S52G3LqwaaPnIOp6IUa9SVxiTxTJKM6XFjuPXHijtbHmLM+jM0e2RrzY7k1Fh4lL3LpJJ5
 0+WR00yi0bLINTmgF+qLkzRAiSzzwPyKyUvO1EgUVJR+i4Rt3tpdy1e0b8Vt5gjJBOB797+O28t
 nESO/x2FNnUN1yTh6xyfuafNORYlDPqWTXXkfj/rVkO/BlIgHM5iTHYuh3s81zCm/XooYnuAduK
 QTQvNJCh/F99awzGIU6iDDJJ1DHsn0KWKMmqtq7w0WNq5cyPweAxdFysbeKBALX2ztkZOia6EHG
 nO7hul0lFNaCwXhRXAQjf1EvOmGSA=
X-Received: by 2002:a05:6a20:2d22:b0:363:bb19:ed30 with SMTP id
 adf61e73a8af0-392dfff6af2mr5767681637.5.1769830863935; 
 Fri, 30 Jan 2026 19:41:03 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:f8d:9478:bfbf:7332])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f3cc71bsm8986062a91.11.2026.01.30.19.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 19:41:03 -0800 (PST)
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
Subject: [PATCH 0/2] drm/panel: Add support for the FocusLCDs E35GH-I-MW800CB
Date: Fri, 30 Jan 2026 19:40:59 -0800
Message-ID: <20260131034101.307486-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[31];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[reznichenko.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[reznichenko.net];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mani@kernel.org,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[reznichenko.net:mid,reznichenko.net:dkim]
X-Rspamd-Queue-Id: E1D72C5A21
X-Rspamd-Action: no action

Add support for E35GH-I-MW800CB 320x480 MIPI DSI panel by FocusLCDs.
The panel uses Ilitek ILI9488 driver IC.

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

