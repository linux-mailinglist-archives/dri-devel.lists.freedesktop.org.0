Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QISvImQYdmnXLgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF380A1D
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E082710E146;
	Sun, 25 Jan 2026 13:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fP201eax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0B10E100
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:19:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so29571015e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 05:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769347166; x=1769951966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AEzeKAAF3T2ngmqtGe3pjZXly3mcFht3AgWOWb36VhE=;
 b=fP201eax7kdTaKPW4voGh98AY70+uBIUJ32WmtuSxVd/CBVPcq2f0AoYG8uKRyVHQH
 ZffDVKNrNtW6g+IxrtEQtQu772rAU+fm9L7vaP20XlWGVWRdxEKK+1jiKvltpeTqiHj+
 1nITEYf9z3cTYJMmgcltIsJjLJPP1NoPUc4xdqqpvZs67hNFBoBWosgC0bAMk9ru2fPq
 jR2Dxmmd0M74ojg2bgchy/eGJukdSFL5SPdnM3kXYBloXFAqSNsHAg/r64s8nKGa+afC
 m4BK9lOkJIxOMd6Gub9SyGO1n5CzMHUaAfPbfg5GxgnNI4o4MNhYx0/i7DgN0c/sH9ys
 oxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769347166; x=1769951966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEzeKAAF3T2ngmqtGe3pjZXly3mcFht3AgWOWb36VhE=;
 b=m4+RJh/xxGIfcp6eTrVKUspFudSpIVchFYr9Yn+cXnh+TYHHTQ5gxSxTZFCdINhsIH
 BWMoPtVp7bty8tOoqUYyD8QX8PKrthXscPaNG4+GwW7JkisHNHgfebF7+0am/0oyQKm9
 CPWYbY6/Rltf/RM/fNEVg5P/U5XDbhEISqSBARlqYmDJYC3M1ylmsuKNJNsxqJvkqvEF
 YfdVt7Wmt9Ym3EYFHrI2qT0okUN2yMo/36sca+t6WA/mI5CFXZYZEWHyxxeGqgpPOq73
 mqdRCVXv6Que4+hyogypIt8YDdI9mWseWfITQavAcGy9FRnXFii868Yi6uy2LZa0xtmD
 dWEg==
X-Gm-Message-State: AOJu0YxY7MdcURByHSaD1XzcpCZurDyKWSo797PnaNf39IfTCIxJQfyv
 8nlnP8l1cbVjDjTzWzE8SVhxE+QOELGuUXXbp9H7xswIIkXY6eXcqTD3oXjPvA==
X-Gm-Gg: AZuq6aI6JLWhQW+lIwZ52sUB0exvUbnq2so24H84xrgBObi0lboUNi28MFRwn8HPHVs
 1rF1CCLY+n4FxX3k+MxuhD3ZHySDLygDnzH7R/4d9NIOJj2UG5IOS1tcFl51HxXZHbWHW2ODWg/
 RmZEKYGqQ7wGqquk9xVT36HLWlE4CAtibPNVe9iti0wkMPYNJF7gJzhfPHsN1JqHqa9owaMRSej
 WszirCZp4DJgTBEOONBADYWkmNAd1kPw/8qn+Y1wFF7zDnkv+x/pH1+PwwbLJDLE44nQWD254Nb
 0MNih9C+uc4J/1W4r8pBXIX4DqI7+pqJ0/fSm8Akx7a0x7qpP/Q/8lzdvkxfrFSv59aFVuxUZJl
 r6zHzCBd+JcUgYpuAyktJkVOxdZ46CftrNcsPR8DsQuXcyz/cJzHk4/mI/WD8SNdTpDumyBW5vh
 u7FxIsbTwhPHk=
X-Received: by 2002:a05:600c:c6:b0:47e:e38b:a83 with SMTP id
 5b1f17b1804b1-4805cd1c150mr18318095e9.7.1769347166112; 
 Sun, 25 Jan 2026 05:19:26 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm382382215e9.2.2026.01.25.05.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 05:19:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] gpu/drm: panel: add support for DSI panel used in
 Motorola Atrix 4G and Droid X2
Date: Sun, 25 Jan 2026 15:19:02 +0200
Message-ID: <20260125131904.45372-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E2BF380A1D
X-Rspamd-Action: no action

Add support for the DSI LCD panel module found in Motorola Atrix 4G or
Droid X2 smartphones. Exact panel vendor and model are unknown hence panel
uses generic compatible based on board where it is used. The panel has a
540x960 resolution with 24 bit RGB per pixel.

Svyatoslav Ryhel (2):
  dt-bindings: display: panel: document Atrix 4G and Droid X2 DSI panel
  gpu/drm: panel: add support for DSI panel used in Motorola Atrix 4G
    and Droid X2

 .../display/panel/motorola,mot-panel.yaml     |  68 +++++
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-motorola-mot.c    | 244 ++++++++++++++++++
 4 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-motorola-mot.c

-- 
2.51.0

