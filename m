Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INAxEBurqWlSBwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0872152ED
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6D810EC2D;
	Thu,  5 Mar 2026 16:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXp3K6lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB11D10EC1F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:11:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-439ce3605ecso712018f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772727061; x=1773331861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k18reyTAC8BmNDz3OVBl9e3+SF3GLnxWQZFfdgkzu28=;
 b=JXp3K6lgg8RdoiWSLCBbsaO6GV9uFK1tl1/YOvFeVjf5oo5XsNrT4/0v4oWzGxfJfm
 25U90/nryG5naPwKd6FsiKjJIiFyQemqjG6ihoLarB48sewAbbNpzRc5beB0drjK6bLK
 FXhGtmgpJfQhq2V+tzTnxTNfBNQz7GfS/lBT8Q1GY0/u25X4uhqnKw1ulgsnKcNsRbNj
 O+9LXqJj8oOH6027fg7e3kwV0P1eB/VpMno7uc8PNz1LUVg+4kM+fLdJpjEOw2DT2rP1
 MFmjTJDaah5XWKCGZGejHSlnq6EL3BCdRf2ivN56srs5zkZ/RIcDhxZiKMZOypBCxuPw
 0GIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772727061; x=1773331861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k18reyTAC8BmNDz3OVBl9e3+SF3GLnxWQZFfdgkzu28=;
 b=G5tRsUMFfZ5uFLwz5ZdFixUgVnoXrbl/fc3ZRqu+dfYaocaVfn+klZEXiO/DyHN3r7
 kZYr+xmrxlTPM6MQP+kIKjCGwoQSO+jQ8jY1YgmJXAdlPfff6+uOha4IMZKQofUhPkYw
 47AcEcHEeF7QcLryu0Z18INeCmVR8GtTilqHBTJPmkP/Erv0rHgHQ4edHpBlN3C+fi9t
 4tgg8uEalcT1rbUiMJucYgHKiZkdP963a8nd++3MFUvXgIsW5Rp+WNwY02lbGlA8j2/v
 QNi3f5fTDRbqbqv6g/3b4Xs+e5WC2n0T4n+0h9VhRQYZp4ppJRhewDi5l172opYRtpkS
 Cobw==
X-Gm-Message-State: AOJu0YyvBDYFWO8pAvhWk2LSeV5dd88fCmECMBSJR8QwEZN90WGq/vCw
 78GlF36FzA2N8r8UsXSLqkkutqc83i41MhwZtAzz4cVXRp6iKgEhcREM
X-Gm-Gg: ATEYQzyVqO230dQ5LwTA8pf/N6gLeSQT+sPteb1BWSANUlZxWAJyY6zSb5lM09CnsFE
 yIOoDL4p+3bVZnzGgJeJM4w8dO+aWRrnG+BeiCvjS03a6LArfsQU66NAPrLlu93kBZPbSsFRi9y
 Y4xBwVmL9LVk6iIscmj0QmP+gqzqAaLMiduAbctN4KY7UuuBwjiiYiMpc9ZFmcM8I2xAXuQ80xq
 wL2DO+UNEwl+MJDczsw8v2Rz6fe+y/Yy6D7mS/i+iY4MRB0HwSAJNTxlNjKpnHOzcxnR3yzlUmZ
 GT7vHf1Wj6Bdss/FnwvpKVPEm1gOPehCFBDOgQ1g0EX1piKYLhiftifTvl/paK0aZfDIS0sHuhW
 MXTl90Q2ed/UaNTqwWh22uycdPUK+i6GqoBnhaTFrmG+7b0HBNlzRG9ICW4tVJ4izWL13dFJF4R
 X7/n+w3hvNcZPVhMqgtGQ/Mf0=
X-Received: by 2002:a05:6000:290f:b0:439:ad2d:99f8 with SMTP id
 ffacd0b85a97d-439c7fffea8mr11452126f8f.30.1772727061010; 
 Thu, 05 Mar 2026 08:11:01 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 08:11:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] [RFC] drm/tegra: dsi: remove tegra_output_probe use
Date: Thu,  5 Mar 2026 18:10:33 +0200
Message-ID: <20260305161035.64548-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
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
X-Rspamd-Queue-Id: 8E0872152ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@kernel.org,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jonathanh@nvidia.com,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The tegra_output_probe() function parses DC, DSI, HDMI, and SOR nodes for
panel phandles, OF graph endpoints, EDID, HPD GPIOs, and DDC buses.
However, this function is redundant for DSI controllers that define the
panel as a child node.

Furthermore, it creates conflicts with modern dual-mode panel bindings
that use OF graph links to both DSI controllers. The function incorrectly
treats these links as standard panel links and attempts to resolve a panel
that should not be handled there. For example, this causes the Mi Pad
panel to fail initialization.

Testing shows that bypassing this function allows the Mi Pad to work
correctly while maintaining compatibility with other Tegra20 and Tegra114
DSI devices.

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 DSI port
  [RFC] drm/tegra: dsi: remove tegra_output_probe use

 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 drivers/gpu/drm/tegra/dsi.c                                 | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.51.0

