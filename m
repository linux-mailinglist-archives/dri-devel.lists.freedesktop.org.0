Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO+9NQXHeGmltAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:09:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45985955B9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0687D10E051;
	Tue, 27 Jan 2026 14:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JEA0Dxba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8820110E051
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:09:05 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-81db1530173so2948760b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769522945; x=1770127745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=HkjARj9793yyLvFYRomWRk5mF/ci3njF8EYRL/lgLi0=;
 b=JEA0DxbaGb77p9w8uFpEoN8WHr9xKr8q7MOM4ICNYqPbceFwwIDdtCKifCNk3EdXHx
 fgsnTRmb1ONcodmBH+Alg6Cv83POWoFk7GmZKZrNl63/mLS/GLBv/JDlpTVLzcibpAHy
 WbqR34zVU2ibYG6xtHSApUoXAe83IBg/8eh91gwuoEG2iDG9HGvNMALxWx2qWOz0oaQP
 KN/Q6lQvnTPSFwEq1cgvvmMdCZGnoJpU3H7dxnDY4y/3RKaq8HVsik0M3K5eQ3DucCJR
 tWrfyHwoHiGq9B07jmVd3bva5UpaPV4Zmza+SdgT5TRkeTX2QOSFgPV7YMXiwoQFo6XJ
 XRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769522945; x=1770127745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkjARj9793yyLvFYRomWRk5mF/ci3njF8EYRL/lgLi0=;
 b=Dk/e62LIQBXs/ERkd7v3ZGV9uMPEvjmW3S2b2HxOyzE4lDP0uhnHmCoizFE/hiuFxF
 gsDZU2J/UzggE6h5fHnP0wa3F4c0WvZntBnwf2jzVo2Y2+eNCQkM1af1SXz5i9KHAw5f
 zWXwlF7qgJIzzVY5H33bWFfYvu73d3SDzMTYUlFs6bwLwwZ0QzmnyOa2u/5r2Jz4J92X
 WW+/sA2/CA9yaPxd1gsQHTFQq1ruQMxWk1eZw/OudzjFkhsDwnzsTBoUfN7McEfl4Te9
 sACwWrWWLe392xK2yltwujHIbQXS2ynQbM59NrKKCbCb4JYiGkV9by8IJPKX2xzPy41a
 ucyg==
X-Gm-Message-State: AOJu0YwVo6qB37QqHb8nVbS7L2UR5xkZHYeAZ8jFrOBJfNSzo0OaX47i
 PPjpH0/Wshdb3v2aX2p/JaDed8qpZ7LjKHBjEQaRoIEWqQqf5YGSv/nE
X-Gm-Gg: AZuq6aJwHiy7rpcCv6Mgqvpz6cRudhIWi84PG3PVxzQkKewG/aoBv9EsxshK58LQBWk
 CqPusD5vBd4vMepUZadF4Gfljd3FRBKv3aPC6I2Cl5S+V27cC49ypAuRPbTQiG/zK2WbvMyqarK
 sMTO6zIsMYV3xL83rFGeCo2l3QYdhIsXECzDgfTC53koxnsxjYkHRwsrKaU/FC1pXFyAaHovms3
 OcvssFtgoZDpKQKaIzXTZ6PBlmJD+AbQM5BW8yaL9l+ehkLwgKih5yu+G5l7EG9fy42ovlRXfbw
 9iDUcER07elqhGs3r0O4BczoOE9A1VmaYFAaWFFGZtnzmlzl4LaB7cDA0tws+FraJWYyWEW7mKz
 DJ+2FpaL2exLOVM/aoMKfeZL9EHPzGF76Nu8+DKkJYsaTgHtk47N9vwvnTUh8FOkgabJsxRRsrz
 Di7TaMKQlaQbiLWM/AFERUWv+b2I/SmNGPJGfOqFo/DeUTsQgL21yTRRCE62eVlD+iWA==
X-Received: by 2002:a05:6a00:1d9b:b0:821:a7b6:10a3 with SMTP id
 d2e1a72fcca58-823692af2a3mr1729625b3a.34.1769522944865; 
 Tue, 27 Jan 2026 06:09:04 -0800 (PST)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82318663d82sm12363616b3a.21.2026.01.27.06.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 06:09:04 -0800 (PST)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-misc-next
Date: Tue, 27 Jan 2026 23:09:00 +0900
Message-Id: <20260127140900.31856-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@linux.ie,m:daniel@ffwll.ch,m:linux-samsung-soc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[inki.dae@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inki.dae@samsung.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,samsung.com:mid]
X-Rspamd-Queue-Id: 45985955B9
X-Rspamd-Action: no action

Hi Dave and Daniel,

  Just fix the regression introduced by the bridge chain reorder[1].

Please kindly let me know if there is any problem.

[1] commit-id : c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain ...")

Thanks,
Inki Dae

The following changes since commit bda4b9b8cc2f4850af52fb35abf8ead434ba38dd:

  drm/rcar-du: dsi: Clean up VCLK divider calculation (2026-01-27 12:13:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-misc-next-for-v6.20

for you to fetch changes up to 89f51ab5fa69db4ce2aeec80987befd1a60c6b68:

  drm/bridge: samsung-dsim: Fix init order (2026-01-27 22:48:07 +0900)

----------------------------------------------------------------
Fix one regression
. Fix a regression introduced by the reordered DRM bridge pre-enable/enable
  callbacks. It moves DSI initialization to atomic_enable() so clocks and
  PLL refclk are configured after the display controller is fully set up.
  The DSI is reinitialized if it was previously initialized to ensure
  correct operation when the refclk rate changes.

----------------------------------------------------------------
Tomi Valkeinen (1):
      drm/bridge: samsung-dsim: Fix init order

 drivers/gpu/drm/bridge/samsung-dsim.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)
