Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGN5O9T3m2mp+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:46:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63867172513
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8383510E245;
	Mon, 23 Feb 2026 06:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sr9oif5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428A510E245
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:46:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59e4a04f059so5155889e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829198; x=1772433998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lxcBP+ESvpawuLsGb9d/pcO8jYBLNDB5e/63teiMRdU=;
 b=Sr9oif5LHX86JEvTRJ1QPA+BrAZJCg0xUn6lp6KDcOX6hf5s/ISGyroq8cf5Q3vkfD
 ndCrZKK+J3juZEgbChMbmHPKEQG80yENhTEFYbrTX/1ZeWFcPi20dMBHkjeskkefottu
 jtravEvzzYkSQvuKm/hBGQv3zdJL4lRgo56s+c2OEQ/1GAktiWW4jej+uvtpRF2zkk0t
 ry489HX4AXa0AmvsePKTLGVp9uiaP5Y3iK5vrJaXqtba8WxcfMcxxapBMmgDMntt8r9v
 J//a7ApIY2o4k8tfdLgEyMcT/jACPbesvf1B6roqfpvdxm3TRyp1A0ol3wNEc6uh2F0l
 yGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829198; x=1772433998;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxcBP+ESvpawuLsGb9d/pcO8jYBLNDB5e/63teiMRdU=;
 b=rW2beirL6/mMsFrO8LSwWdnQdMWwQL4d7FODDSrcXa+qJnVTATJXeedwBtsIyzeyTh
 fcAlrwshQRaZcEkKrbNbuhn9ZnzzOfLSZxfgQlMM3ICPkaME+A2QkZWq8OthsC6EEApQ
 MwVGGaQ0NNMhfm/OrNCSKZb0VKFNOHPs59ItYXVPvY9RH1mHmTQWQleTRucnbPDJDXRy
 qsWa9wNqa3pef7DbjzMSDwnwFt5K2ARfUuEHV7bFy6ZqRMeBzFG0tFk0hlq5K/JOKa3M
 K1t585nbek6PpmQ7dVt+Kkzs0UvPtOZglHfUn4vhpng3F6VY3TWtu3HMIb+L7tGeN2l4
 2WMw==
X-Gm-Message-State: AOJu0YzEbGFGukYhjw5Wx5neSGEMM2ry/ePJmShbReNuU8fuLPoAQv7x
 euR/LUc4tbWjEl6No5DqOa1121r0AysNAt+WbcxQG00S5njlaa6+Wo/o
X-Gm-Gg: AZuq6aJCf0S+MsbHe/jJ26jgB25kqjMFjzdZrQO6zB7SMqLL3RZW2dPNj1aqIv9fBob
 ME7A3en6Rf5+IBehN7+Rb4/0x1+DVMWbZgw2Cu4Bb7GjQJmjl0PcYzLTwsFy2/lHvYAx/0+Yrgc
 vEsLkLuDXt5UD2v4gtzEm8UpVBpNraHoHKyh/Uo0fknyDQN6OP9QMivr7H3pgB35qK47G9AIYOO
 KBrEdNxaWODZsB0MTTQzz0i1uhWM/7yB8KMKXrLe2GNL7AWjI/9SFWICMq9MiNR+8UOeMMpp+dN
 kt8sojz/1Q9VqYFMhap3dobg0AVMg4v4feTxbZcwL+YAcGng4Exzl7TNdi0UHRFtG8exz9Gykl0
 h9ROmeOkgCLfhFdNMlYXeorbj5+ap1SZAIh7I5UIDxgCyxyCi/nKNd6FjLEqYLqpNyWCggsPmHa
 smuyp8nzCCtbemGFX4TDf5v7U=
X-Received: by 2002:a05:6512:3f16:b0:59e:44fd:8047 with SMTP id
 2adb3069b0e04-5a0ed8a5360mr2505423e87.28.1771829198192; 
 Sun, 22 Feb 2026 22:46:38 -0800 (PST)
Received: from xeon ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb0b89asm1386201e87.2.2026.02.22.22.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:46:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] gpu/drm: panel: add support for DSI panel used in
 Motorola Atrix 4G and Droid X2
Date: Mon, 23 Feb 2026 08:46:28 +0200
Message-ID: <20260223064630.12720-1-clamor95@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 63867172513
X-Rspamd-Action: no action

Add support for the DSI LCD panel module found in Motorola Atrix 4G or
Droid X2 smartphones. Exact panel vendor and model are unknown hence panel
uses generic compatible based on board where it is used. The panel has a
540x960 resolution with 24 bit RGB per pixel.

---
Changes in v2:
- updated schema commit description
---

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Atrix 4G and Droid X2 DSI panel
  gpu/drm: panel: add support for DSI panel used in Motorola Atrix 4G
    and Droid X2

 .../display/panel/motorola,mot-panel.yaml     |  69 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-motorola-mot.c    | 244 ++++++++++++++++++
 4 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-motorola-mot.c

-- 
2.51.0

