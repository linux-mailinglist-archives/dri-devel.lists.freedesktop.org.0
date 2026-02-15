Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id R164HzaJkWnHjgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CAD13E4F5
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF1E10E257;
	Sun, 15 Feb 2026 08:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLFPvU11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D16610E257
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 08:52:02 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b884a84e622so295412366b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 00:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771145520; x=1771750320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8tVDkTri3VxfXdp3zpIf2l+EgGyuGo/k3ehF2vjyzko=;
 b=cLFPvU11wSSvcM3IISBBII9Gf3BkRQQpY6avIESUSPvcC4nz2jrxynlEqltCju4fmB
 8gQwF6ZZ43L/Au9XnrRDTlzI4AL9+zxDqby6zOvA4Qf/RpVOZI9tUUtXDnoqsxkhzZ46
 T9wKyKRmqsb7lV75nSFIcAhRGuGViJeUYeu5g+Yf/6N89fHdv9WqoPz29Pe3jkgLS+/X
 vAcUcXkiLWrbXmPfPFIhoY3NYsdVQzh8XEhuafz9lokjSCqrzG3aZaKEXkMW+eZyaWIh
 njnpQI+28yy8a5y+Mh/911x4WkgfthBaXYx4G/+ldJY0YLOkI8MCSlZL/fOaqrKdlduC
 MjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771145520; x=1771750320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tVDkTri3VxfXdp3zpIf2l+EgGyuGo/k3ehF2vjyzko=;
 b=paaXp78U5sLeBgrCwccmvCZlApvpBtI5FBUsjKodHISevLdiVZoamv7wOnV2g/zr93
 NYMZPGvQelL7OXL8SyQDjsxSzMBsGFcXIOJpnkmQcyiiIqPWUoRy1HaPKepJbgNuvp9O
 EtWLHBzFDhkGNNeEjOnk7Ha8FisijHsT3PXopR0I1kxnYrsUvoJ4nBmVfV6Rm39qdP1D
 f6IeZm6wfKp0couKmIpQrvOUYAWmELg03ZjR2gWKJjnr3T3sK31cqCG7ruIr9q7C4f8x
 3vag7tY/yEYuinsVEQQKZhzQqQAaIddPTV/HV7YJX4JQF8vGokEjjqVURV3GHlExUS8v
 KpPA==
X-Gm-Message-State: AOJu0YwgQh+DL5wbYaf7zRyyPO7BMoTqFvWaZs1ZN+TRx6x4dpWaKajA
 DZ2PCpvs84QVa0SffKYjrtUwzZ4SIOVSIe1ozHD4GqNlUw6EgYTBIc7c
X-Gm-Gg: AZuq6aL09KFoWBl+GvCkmo/ze3JAtuwaN9hd9tRCKAdfA58WIIasJSMfABJ8DtRAoVW
 oXg1+SjhJandgqfEjSuZEQRdNZRHNTIePd/9KLCXM7TuN4WMLg3hIEyZ+23eJB22o9a5bXx9MXf
 zCWPm7jIIwaY2W2yLO7bPUsyl1hqqT5ADTE+gb+NBVkfevCv/jwZaOm+AhGRpUQlNvUPDgBezq2
 Rd2eFfoUq6U3udwvgdxiKBu4lLVcncfCDcqPNQalQ9X5n1Aj/irIpfvO+Q3Z/UlR10SIc4Z6LFk
 bun8c/56M4JZkaCzNqDRXMGKKSKhNljQuKdFXL/SDyJOrW8Iy8viD+mJ6WmZQ1fQY9svW3C3Tf9
 V1Irl8itcYemqRPZ3yZX+w6gvRBY0K8trHkuoUVsrRVyMhG2UEuGQRe/F781+s8BjZWeegAepQ5
 bspb7mYhSPug52
X-Received: by 2002:a17:907:d22:b0:b8f:8456:4af5 with SMTP id
 a640c23a62f3a-b8facca1400mr408857066b.5.1771145520264; 
 Sun, 15 Feb 2026 00:52:00 -0800 (PST)
Received: from xeon ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7629b63sm139799766b.35.2026.02.15.00.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 00:51:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] drm/panel: r61307/r69328: minor updates
Date: Sun, 15 Feb 2026 10:51:34 +0200
Message-ID: <20260215085140.20499-1-clamor95@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 02CAD13E4F5
X-Rspamd-Action: no action

Align r61307 with schema property and update r61307/r69328 according
to latest DRM changes.

Svyatoslav Ryhel (5):
  drm/panel: r61307: align with schema property
  drm/panel: r61307/r69328: convert to
    drm_connector_helper_get_modes_fixed
  drm/panel: r61307/r69328: remove redundant checks
  drm/panel: r61307/r69328: return accumulated errors
  drm/panel: r61307/r69328: convert to devm_mipi_dsi_attach

 drivers/gpu/drm/panel/Kconfig                |  2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c | 40 ++++----------------
 drivers/gpu/drm/panel/panel-renesas-r69328.c | 38 +++----------------
 3 files changed, 15 insertions(+), 65 deletions(-)

-- 
2.51.0

